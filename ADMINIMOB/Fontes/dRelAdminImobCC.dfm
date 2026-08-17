inherited dtmRelAdminImobCC: TdtmRelAdminImobCC
  Left = 196
  Top = 33
  Width = 987
  Height = 574
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 24
    Top = 80
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplExemploppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
  end
  inherited dsExemplo: TwwDataSource
    Left = 24
    Top = 68
  end
  inherited qryExemplo: TwwQuery
    Left = 24
    Top = 56
  end
  inherited rpExemplo: TppReport
    Left = 24
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object qryCCImovel: TwwQuery
    OnCalcFields = qryCCImovelCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   I.IDIMOVEL, I.IDIMOVELMESTRE, IM.IMONOME AS NOME_MESTRE,'
      '   IM.IMONOME||'#39' - '#39'||I.IMONOME AS IMOVEL_EXTENSO,'
      ''
      '   T.DESCCUSTORECIMO,'
      ''
      
        '   LI.DATALANCAMENTO, LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.A' +
        'NOCOMPETENCIA,'
      ''
      '   TA.DESCRICAO,'
      ''
      '   D.RECPAG, D.STATUS, D.NODOCUMENTO, D.NUMAPGR,'
      ''
      '   LD.CODDOCUMENTO, LD.CODALTERADOR, LD.OPERACAO,'
      '   LD.VALOR, LD.DEBCRE, LD.HISTORICOCOMPL, LD.DATALANCTO,'
      ''
      '   PFC.NOME AS NF_FORCLI, PFC.RAZAOSOCIAL AS RS_FORCLI,'
      ''
      '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', LI.DATAVENCIMENTO,'
      
        '      DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LI.DATAVENCIMENTO, LD.DATA' +
        'LANCTO)) AS DATA,'
      ''
      '   ('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE(' +
        'LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '   ) AS TOT_RECEBER,'
      ''
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) AS TOT_RECEBIDO,'
      ''
      '   ('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE(' +
        'LD.DEBCRE, '#39'C'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '   ) AS TOT_PAGAR,'
      ''
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) AS TOT_PAGO,'
      ''
      '   ('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE(' +
        'LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0)'
      '   ) AS SALDO_RECEB,'
      ''
      '   ('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE(' +
        'LD.DEBCRE, '#39'C'#39', LD.VALOR, LD.VALOR * -1), 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0)'
      '   ) AS SALDO_PAGAR'
      ''
      'FROM'
      '   PESSOA PFC,'
      '   DOCUMENTO D, IMOVEL I, IMOVEL IM,'
      '   TIPOCUSTORECIMOV T, LANCAMENTOSIMOVEL LI,'
      '   CONTRATOXIMOVEL CX, CONTRATOIMOVEL C,'
      '   TIPOALTERADOR TA, LANCTODOCUM LD'
      ''
      'WHERE'
      ''
      '   1=2 AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   AND ( LI.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( LI.IDIMOVEL = CX.IDIMOVEL(+) )'
      '   AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) )'
      '   AND ( C.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL )'
      '   AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )'
      '   AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )'
      '   AND ( LD.CODALTERADOR = TA.CODALTERADOR(+) )'
      '   AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO )'
      '   AND ( LI.IDFORCLI = PFC.IDPESSOA )'
      ''
      'ORDER BY'
      '   IM.IMONOME, I.IMONOME,'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LI.DATAVENCIMENTO, LD.DATALAN' +
        'CTO)')
    ValidateWithMask = True
    Left = 304
    Top = 64
    object qryCCImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryCCImovelIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object qryCCImovelNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 100
    end
    object qryCCImovelIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 203
    end
    object qryCCImovelDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object qryCCImovelDATALANCAMENTO: TDateTimeField
      FieldName = 'DATALANCAMENTO'
    end
    object qryCCImovelDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryCCImovelMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object qryCCImovelANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object qryCCImovelDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryCCImovelRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryCCImovelSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryCCImovelNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object qryCCImovelNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
    end
    object qryCCImovelCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryCCImovelCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
    end
    object qryCCImovelOPERACAO: TStringField
      FieldName = 'OPERACAO'
      FixedChar = True
      Size = 2
    end
    object qryCCImovelVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryCCImovelDEBCRE: TStringField
      FieldName = 'DEBCRE'
      FixedChar = True
      Size = 1
    end
    object qryCCImovelHISTORICOCOMPL: TStringField
      FieldName = 'HISTORICOCOMPL'
      Size = 100
    end
    object qryCCImovelDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
    end
    object qryCCImovelNF_FORCLI: TStringField
      FieldName = 'NF_FORCLI'
      Size = 60
    end
    object qryCCImovelRS_FORCLI: TStringField
      FieldName = 'RS_FORCLI'
      Size = 60
    end
    object qryCCImovelDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object qryCCImovelTOT_RECEBER: TFloatField
      FieldName = 'TOT_RECEBER'
    end
    object qryCCImovelTOT_RECEBIDO: TFloatField
      FieldName = 'TOT_RECEBIDO'
    end
    object qryCCImovelTOT_PAGAR: TFloatField
      FieldName = 'TOT_PAGAR'
    end
    object qryCCImovelTOT_PAGO: TFloatField
      FieldName = 'TOT_PAGO'
    end
    object qryCCImovelSALDO_RECEB: TFloatField
      FieldName = 'SALDO_RECEB'
    end
    object qryCCImovelSALDO_PAGAR: TFloatField
      FieldName = 'SALDO_PAGAR'
    end
  end
  object dsCCImovel: TwwDataSource
    DataSet = qryCCImovel
    Left = 304
    Top = 72
  end
  object pplCCImovel: TppBDEPipeline
    DataSource = dsCCImovel
    UserName = 'lCCImovel'
    Left = 304
    Top = 96
    object pplCCImovelppField1: TppField
      FieldAlias = 'DESCALC'
      FieldName = 'DESCALC'
      FieldLength = 150
      DisplayWidth = 250
      Position = 0
    end
    object pplCCImovelppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplCCImovelppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVELMESTRE'
      FieldName = 'IDIMOVELMESTRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplCCImovelppField4: TppField
      FieldAlias = 'NOME_MESTRE'
      FieldName = 'NOME_MESTRE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplCCImovelppField5: TppField
      FieldAlias = 'IMOVEL_EXTENSO'
      FieldName = 'IMOVEL_EXTENSO'
      FieldLength = 123
      DisplayWidth = 123
      Position = 4
    end
    object pplCCImovelppField6: TppField
      FieldAlias = 'DESCCUSTORECIMO'
      FieldName = 'DESCCUSTORECIMO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object pplCCImovelppField7: TppField
      FieldAlias = 'DATALANCAMENTO'
      FieldName = 'DATALANCAMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object pplCCImovelppField8: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object pplCCImovelppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'MESCOMPETENCIA'
      FieldName = 'MESCOMPETENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplCCImovelppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANOCOMPETENCIA'
      FieldName = 'ANOCOMPETENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplCCImovelppField11: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 35
      DisplayWidth = 35
      Position = 10
    end
    object pplCCImovelppField12: TppField
      FieldAlias = 'RECPAG'
      FieldName = 'RECPAG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 11
    end
    object pplCCImovelppField13: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 12
    end
    object pplCCImovelppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplCCImovelppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplCCImovelppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODALTERADOR'
      FieldName = 'CODALTERADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplCCImovelppField17: TppField
      FieldAlias = 'OPERACAO'
      FieldName = 'OPERACAO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 16
    end
    object pplCCImovelppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplCCImovelppField19: TppField
      FieldAlias = 'DEBCRE'
      FieldName = 'DEBCRE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 18
    end
    object pplCCImovelppField20: TppField
      FieldAlias = 'HISTORICOCOMPL'
      FieldName = 'HISTORICOCOMPL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 19
    end
    object pplCCImovelppField21: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 20
    end
    object pplCCImovelppField22: TppField
      FieldAlias = 'NF_FORCLI'
      FieldName = 'NF_FORCLI'
      FieldLength = 60
      DisplayWidth = 60
      Position = 21
    end
    object pplCCImovelppField23: TppField
      FieldAlias = 'RS_FORCLI'
      FieldName = 'RS_FORCLI'
      FieldLength = 60
      DisplayWidth = 60
      Position = 22
    end
    object pplCCImovelppField24: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 23
    end
    object pplCCImovelppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_RECEBER'
      FieldName = 'TOT_RECEBER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplCCImovelppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_RECEBIDO'
      FieldName = 'TOT_RECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplCCImovelppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_PAGAR'
      FieldName = 'TOT_PAGAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplCCImovelppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_PAGO'
      FieldName = 'TOT_PAGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object pplCCImovelppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO_RECEB'
      FieldName = 'SALDO_RECEB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object pplCCImovelppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO_PAGAR'
      FieldName = 'SALDO_PAGAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object pplCCImovelppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMAPGR'
      FieldName = 'NUMAPGR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
  end
  object qryCCContrato: TwwQuery
    OnCalcFields = qryCCContratoCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATOIMOVEL, C.CONNUMERO, C.CONNOME,'
      ''
      '   P.NOME AS LOCATARIO,'
      ''
      '   I.IDIMOVEL, I.IDIMOVELMESTRE,'
      '   IM.IDIMOVEL AS IDMESTRE, IM.IMONOME AS NOME_MESTRE,'
      ''
      
        '   (IM.IMONOME||'#39' - '#39'||DECODE(CX.CIMDESCRICAO, NULL, I.IMONOME, ' +
        'CX.CIMDESCRICAO)) AS IMOVEL_EXTENSO,'
      ''
      '   T.DESCCUSTORECIMO,'
      ''
      
        '   LI.DATALANCAMENTO, LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.A' +
        'NOCOMPETENCIA,'
      ''
      '   TA.DESCRICAO,'
      ''
      '   D.RECPAG, D.STATUS, D.NODOCUMENTO, D.NUMAPGR,'
      ''
      '   LD.CODDOCUMENTO, LD.CODALTERADOR, LD.OPERACAO,'
      '   LD.VALOR, LD.DEBCRE, LD.HISTORICOCOMPL, LD.DATALANCTO,'
      ''
      '   PFC.NOME AS NF_FORCLI, PFC.RAZAOSOCIAL AS RS_FORCLI,'
      ''
      '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', LI.DATAVENCIMENTO,'
      
        '      DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LI.DATAVENCIMENTO, LD.DATA' +
        'LANCTO)) AS DATA,'
      ''
      '   ('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE(' +
        'LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '   ) AS TOT_RECEBER,'
      ''
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) AS TOT_RECEBIDO,'
      ''
      '   ('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE(' +
        'LD.DEBCRE, '#39'C'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '   ) AS TOT_PAGAR,'
      ''
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) AS TOT_PAGO,'
      ''
      '   ('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE(' +
        'LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0)'
      '   ) AS SALDO_RECEB,'
      ''
      '   ('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE(' +
        'LD.DEBCRE, '#39'C'#39', LD.VALOR, LD.VALOR * -1), 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0)'
      '   ) AS SALDO_PAGAR'
      ''
      'FROM'
      '   PESSOA P, PESSOA PFC,'
      '   DOCUMENTO D, TIPOALTERADOR TA, LANCTODOCUM LD,'
      '   CONTRATOIMOVEL C, IMOVEL I, IMOVEL IM,'
      '   TIPOCUSTORECIMOV T, LANCAMENTOSIMOVEL LI,'
      '   CONTRATOXIMOVEL CX'
      ''
      'WHERE'
      '   1=2 AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL(+) )'
      '   AND ( LI.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      '   AND ( LI.IDIMOVEL = CX.IDIMOVEL )'
      '   AND ( LI.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL )'
      '   AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO(+) )'
      '   AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO(+) )'
      '   AND ( LD.CODALTERADOR = TA.CODALTERADOR(+) )'
      '   AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO )'
      '   AND ( C.IDLOCATARIO = P.IDPESSOA )'
      '   AND ( LI.IDFORCLI = PFC.IDPESSOA )'
      ''
      'ORDER BY'
      '   C.CONNOME, IM.IMONOME, I.IMONOME,'
      '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', LI.DATAVENCIMENTO,'
      
        '      DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LI.DATAVENCIMENTO, LD.DATA' +
        'LANCTO))')
    ValidateWithMask = True
    Left = 112
    Top = 48
    object qryCCContratoCONTRATOEXTENSO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CONTRATOEXTENSO'
      Size = 130
      Calculated = True
    end
    object qryCCContratoDESCALC: TStringField
      DisplayWidth = 150
      FieldKind = fkCalculated
      FieldName = 'DESCALC'
      Size = 150
      Calculated = True
    end
    object qryCCContratoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryCCContratoCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryCCContratoCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object qryCCContratoLOCATARIO: TStringField
      FieldName = 'LOCATARIO'
      Size = 60
    end
    object qryCCContratoIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryCCContratoIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object qryCCContratoIDMESTRE: TFloatField
      FieldName = 'IDMESTRE'
    end
    object qryCCContratoNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object qryCCContratoDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object qryCCContratoDATALANCAMENTO: TDateTimeField
      FieldName = 'DATALANCAMENTO'
    end
    object qryCCContratoDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryCCContratoMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object qryCCContratoANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object qryCCContratoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryCCContratoRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
    object qryCCContratoSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object qryCCContratoNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object qryCCContratoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryCCContratoCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
    end
    object qryCCContratoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 2
    end
    object qryCCContratoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryCCContratoDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Size = 1
    end
    object qryCCContratoHISTORICOCOMPL: TStringField
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object qryCCContratoDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
    end
    object qryCCContratoNF_FORCLI: TStringField
      FieldName = 'NF_FORCLI'
      Size = 60
    end
    object qryCCContratoRS_FORCLI: TStringField
      FieldName = 'RS_FORCLI'
      Size = 60
    end
    object qryCCContratoDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object qryCCContratoTOT_RECEBER: TFloatField
      FieldName = 'TOT_RECEBER'
    end
    object qryCCContratoTOT_RECEBIDO: TFloatField
      FieldName = 'TOT_RECEBIDO'
    end
    object qryCCContratoTOT_PAGAR: TFloatField
      FieldName = 'TOT_PAGAR'
    end
    object qryCCContratoTOT_PAGO: TFloatField
      FieldName = 'TOT_PAGO'
    end
    object qryCCContratoSALDO_RECEB: TFloatField
      FieldName = 'SALDO_RECEB'
    end
    object qryCCContratoSALDO_PAGAR: TFloatField
      FieldName = 'SALDO_PAGAR'
    end
    object qryCCContratoIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryCCContratoNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
    end
  end
  object dsCCContrato: TwwDataSource
    DataSet = qryCCContrato
    Left = 112
    Top = 68
  end
  object pplCCContrato: TppBDEPipeline
    DataSource = dsCCContrato
    UserName = 'lCCContrato'
    Left = 112
    Top = 88
  end
  object rptCCContrato: TppReport
    AutoStop = False
    DataPipeline = pplCCContrato
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 11906
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 112
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplCCContrato'
    object rptCCContrato_CabecalhoRelat: TppHeaderBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 39423
      mmPrintPosition = 0
      object ppLabel14: TppLabel
        UserName = 'ppLabel14'
        AutoSize = False
        Caption = 'Conta Corrente por Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 37835
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel15: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel15'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 37835
        mmTop = 1588
        mmWidth = 197380
        BandType = 0
      end
      object rptCCContratoLabel10: TppLabel
        UserName = 'rptCCContratoLabel10'
        Caption = 'Mês de Competência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 18521
        mmWidth = 33338
        BandType = 0
      end
      object rptCCContratoLabel11: TppLabel
        UserName = 'rptCCContratoLabel11'
        Caption = 'Período de Datas:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 21960
        mmWidth = 26988
        BandType = 0
      end
      object rptCCContrato_lblCompetencia: TppLabel
        UserName = 'rptCCContrato_lblCompetencia'
        Caption = 'rptCCContrato_lblCompetencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 18521
        mmWidth = 39423
        BandType = 0
      end
      object rptCCContrato_lblDatas: TppLabel
        UserName = 'rptCCContrato_lblDatas'
        Caption = 'rptCCContrato_lblDatas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 21960
        mmWidth = 29898
        BandType = 0
      end
      object rptCCContratoLabel12: TppLabel
        UserName = 'rptCCContratoLabel12'
        Caption = 'Administradora:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 8202
        mmTop = 27252
        mmWidth = 25135
        BandType = 0
      end
      object rptCCContrato_lblAdministradora: TppLabel
        UserName = 'rptCCContrato_lblAdministradora'
        Caption = 'Administradora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 27252
        mmWidth = 19050
        BandType = 0
      end
      object rptCCContratoLabel7: TppLabel
        UserName = 'rptCCContratoLabel7'
        Caption = 'Tipo de Receita / Despesa:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 187061
        mmTop = 21960
        mmWidth = 39688
        BandType = 0
      end
      object rptCCContrato_lblTipoRecDes: TppLabel
        UserName = 'rptCCContrato_lblTipoRecDes'
        AutoSize = False
        Caption = 'rptCCContrato_lblTipoRecDes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 226484
        mmTop = 21960
        mmWidth = 45773
        BandType = 0
      end
      object rptCCContrato_lblRecPag: TppLabel
        UserName = 'rptCCContrato_lblRecPag'
        AutoSize = False
        Caption = 'rptCCContrato_lblRecPag'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 226484
        mmTop = 27252
        mmWidth = 45773
        BandType = 0
      end
      object rptCCContrato_lblPrevEfetivo: TppLabel
        UserName = 'rptCCContrato_lblPrevEfetivo'
        AutoSize = False
        Caption = 'rptCCContrato_lblPrevEfetivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 226484
        mmTop = 31485
        mmWidth = 45773
        BandType = 0
      end
      object rptCCContrato_lblContratosVigentes: TppLabel
        UserName = 'rptCCContrato_lblContratosVigentes'
        Caption = 'Apenas Contratos vigentes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 31485
        mmWidth = 34131
        BandType = 0
      end
      object rptCCContrato_lblEmAberto: TppLabel
        UserName = 'rptCCContrato_lblEmAberto'
        AutoSize = False
        Caption = 'Apenas lançamentos em aberto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 226484
        mmTop = 35719
        mmWidth = 45773
        BandType = 0
      end
      object rptCCContrato_lblTipoData: TppLabel
        UserName = 'rptCCContrato_lblTipoData'
        Caption = 'por Data de Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 35719
        mmWidth = 30692
        BandType = 0
      end
      object rptCCContrato_lblTipoImovel: TppLabel
        UserName = 'rptCCContrato_lblTipoImovel'
        AutoSize = False
        Caption = 'Todos os Tipos de Imóvel / Segmento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 84667
        mmTop = 31485
        mmWidth = 102659
        BandType = 0
      end
      object ppLogoCCContrato: TppImage
        UserName = 'ppLogoCCContrato'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 20108
      mmPrintPosition = 0
      object rptCCContrato_FundoBandaDetalhe: TppShape
        OnPrint = rptFolhaAluguel_FundoBandaDetalhePrint
        UserName = 'rptCCContrato_FundoBandaDetalhe'
        Brush.Color = 13040076
        ParentHeight = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 20108
        mmLeft = 0
        mmTop = 0
        mmWidth = 272257
        BandType = 4
      end
      object rptCCContrato_Separador: TppLine
        OnPrint = rptCCContrato_SeparadorPrint
        UserName = 'rptCCContrato_Separador'
        ParentHeight = True
        ParentWidth = True
        StretchWithParent = True
        Visible = False
        Weight = 0.75
        mmHeight = 20108
        mmLeft = 0
        mmTop = 0
        mmWidth = 271993
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'ppDBMemo1'
        CharWrap = True
        DataField = 'IMOVEL_EXTENSO'
        DataPipeline = pplCCContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCContrato'
        mmHeight = 15875
        mmLeft = 0
        mmTop = 794
        mmWidth = 55563
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptCCContratoDBMemo1: TppDBMemo
        UserName = 'rptCCContratoDBMemo1'
        CharWrap = True
        DataField = 'DESCCUSTORECIMO'
        DataPipeline = pplCCContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCContrato'
        mmHeight = 15875
        mmLeft = 102129
        mmTop = 794
        mmWidth = 24077
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptCCContratoDBText5: TppDBText
        UserName = 'rptCCContratoDBText5'
        BlankWhenZero = True
        DataField = 'TOT_PAGO'
        DataPipeline = pplCCContrato
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCContrato'
        mmHeight = 2646
        mmLeft = 229130
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object rptCCContratoDBText6: TppDBText
        UserName = 'rptCCContratoDBText6'
        DataField = 'DATA'
        DataPipeline = pplCCContrato
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplCCContrato'
        mmHeight = 2646
        mmLeft = 258234
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object rptCCContratoLabel13: TppLabel
        UserName = 'rptCCContratoLabel13'
        AutoSize = False
        Caption = ' / '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 249238
        mmTop = 794
        mmWidth = 2381
        BandType = 4
      end
      object rptCCContratoDBText4: TppDBText
        UserName = 'rptCCContratoDBText4'
        DataField = 'MESCOMPETENCIA'
        DataPipeline = pplCCContrato
        DisplayFormat = '00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCContrato'
        mmHeight = 2646
        mmLeft = 246328
        mmTop = 794
        mmWidth = 3175
        BandType = 4
      end
      object rptCCContratoDBText7: TppDBText
        UserName = 'rptCCContratoDBText7'
        DataField = 'ANOCOMPETENCIA'
        DataPipeline = pplCCContrato
        DisplayFormat = '0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCContrato'
        mmHeight = 2646
        mmLeft = 251355
        mmTop = 794
        mmWidth = 6350
        BandType = 4
      end
      object rptCCContratoDBMemo2: TppDBMemo
        UserName = 'rptCCContratoDBMemo2'
        CharWrap = True
        DataField = 'DESCALC'
        DataPipeline = pplCCContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCContrato'
        mmHeight = 15875
        mmLeft = 127529
        mmTop = 794
        mmWidth = 24606
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptCCContratoDBText2: TppDBText
        UserName = 'rptCCContratoDBText2'
        BlankWhenZero = True
        DataField = 'TOT_PAGAR'
        DataPipeline = pplCCContrato
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCContrato'
        mmHeight = 2646
        mmLeft = 213784
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object rptCCContratoDBText8: TppDBText
        UserName = 'rptCCContratoDBText8'
        BlankWhenZero = True
        DataField = 'TOT_RECEBIDO'
        DataPipeline = pplCCContrato
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCContrato'
        mmHeight = 2646
        mmLeft = 198438
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object rptCCContratoDBText9: TppDBText
        UserName = 'rptCCContratoDBText9'
        BlankWhenZero = True
        DataField = 'TOT_RECEBER'
        DataPipeline = pplCCContrato
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCContrato'
        mmHeight = 2646
        mmLeft = 183092
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object rptCCContratoDBMemo3: TppDBMemo
        UserName = 'rptCCContratoDBMemo3'
        CharWrap = True
        DataField = 'NF_FORCLI'
        DataPipeline = pplCCContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCContrato'
        mmHeight = 15875
        mmLeft = 56356
        mmTop = 794
        mmWidth = 44979
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptCCContratoDBText10: TppDBText
        UserName = 'rptCCContratoDBText10'
        DataField = 'NODOCUMENTO'
        DataPipeline = pplCCContrato
        DisplayFormat = '####################0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCContrato'
        mmHeight = 2646
        mmLeft = 153194
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
      object rptCCContratoDBText11: TppDBText
        UserName = 'rptCCContratoDBText11'
        BlankWhenZero = True
        DataField = 'NUMAPGR'
        DataPipeline = pplCCContrato
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCContrato'
        mmHeight = 2381
        mmLeft = 173302
        mmTop = 794
        mmWidth = 8731
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 12965
      mmPrintPosition = 0
      object CCContratoLinha4: TppLine
        UserName = 'CCContratoLinha4'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 271993
        BandType = 8
      end
      object ppLabel21: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel21'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc7: TppSystemVariable
        UserName = 'Calc7'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 114829
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc8: TppSystemVariable
        UserName = 'Calc8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 236803
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplCCContrato
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 13229
      DataPipelineName = 'pplCCContrato'
      object rptCCContrato_CabecalhoGrupo: TppGroupHeaderBand
        AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
        BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
        mmBottomOffset = 40
        mmHeight = 13758
        mmPrintPosition = 0
        object CCContratoLinha1: TppLine
          UserName = 'CCContratoLinha1'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 10054
          mmWidth = 271993
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'ppLabel22'
          Caption = 'Contrato:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 0
          mmTop = 3175
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object CCContratoLinha2: TppLine
          UserName = 'CCContratoLinha2'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 13494
          mmWidth = 271993
          BandType = 3
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'ppLabel23'
          Caption = 'Imóvel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 0
          mmTop = 10583
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object rptCCContratoDBText1: TppDBText
          UserName = 'rptCCContratoDBText1'
          AutoSize = True
          DataField = 'CONTRATOEXTENSO'
          DataPipeline = pplCCContrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplCCContrato'
          mmHeight = 2910
          mmLeft = 14288
          mmTop = 3175
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object rptCCContratoLabel2: TppLabel
          UserName = 'rptCCContratoLabel2'
          Caption = 'Locatário:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 0
          mmTop = 6615
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object rptCCContratoDBText3: TppDBText
          UserName = 'rptCCContratoDBText3'
          AutoSize = True
          DataField = 'LOCATARIO'
          DataPipeline = pplCCContrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplCCContrato'
          mmHeight = 2910
          mmLeft = 14288
          mmTop = 6615
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object rptCCContratoLabel3: TppLabel
          UserName = 'rptCCContratoLabel3'
          Caption = 'Tipo Receita / Despesa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 102129
          mmTop = 10583
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
        end
        object rptCCContratoLabel5: TppLabel
          UserName = 'rptCCContratoLabel5'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 262467
          mmTop = 10583
          mmWidth = 5292
          BandType = 3
          GroupNo = 0
        end
        object rptCCContratoLabel9: TppLabel
          UserName = 'rptCCContratoLabel9'
          Caption = 'Alterador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 134409
          mmTop = 10583
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object rptCCContratoLabel1: TppLabel
          UserName = 'rptCCContratoLabel1'
          Caption = 'Compet.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 246328
          mmTop = 10583
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object rptCCContratoLabel15: TppLabel
          UserName = 'rptCCContratoLabel15'
          Caption = 'A Pagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 219869
          mmTop = 10583
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object rptCCContratoLabel4: TppLabel
          UserName = 'rptCCContratoLabel4'
          Caption = 'Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 238125
          mmTop = 10583
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object rptCCContratoLabel14: TppLabel
          UserName = 'rptCCContratoLabel14'
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 202142
          mmTop = 10583
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object rptCCContratoLabel16: TppLabel
          UserName = 'rptCCContratoLabel16'
          Caption = 'A Receber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 186267
          mmTop = 10583
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object rptCCContratoLabel8: TppLabel
          UserName = 'rptCCContratoLabel8'
          Caption = 'Favorecido / Debitado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 56356
          mmTop = 10583
          mmWidth = 26723
          BandType = 3
          GroupNo = 0
        end
        object rptCCContratoLabel18: TppLabel
          UserName = 'rptCCContratoLabel18'
          Caption = 'Nº Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 153723
          mmTop = 10583
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rptCCContratoLabel19: TppLabel
          UserName = 'rptCCContratoLabel19'
          Caption = 'Nº AP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 175684
          mmTop = 10583
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
      end
      object rptCCContrato_RodapeRelat: TppGroupFooterBand
        AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
        BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
        mmBottomOffset = 40
        mmHeight = 17727
        mmPrintPosition = 0
        object rptCCContratoShape1: TppShape
          UserName = 'rptCCContratoShape1'
          Pen.Width = 2
          mmHeight = 5027
          mmLeft = 182034
          mmTop = 3969
          mmWidth = 63500
          BandType = 5
          GroupNo = 0
        end
        object CCContratoLinha3: TppLine
          UserName = 'CCContratoLinha3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 271993
          BandType = 5
          GroupNo = 0
        end
        object rptCCContratoDBCalc1: TppDBCalc
          UserName = 'rptCCContratoDBCalc1'
          DataField = 'TOT_PAGAR'
          DataPipeline = pplCCContrato
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCContrato'
          mmHeight = 2646
          mmLeft = 213784
          mmTop = 5027
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object rptCCContratoDBCalc2: TppDBCalc
          UserName = 'rptCCContratoDBCalc2'
          DataField = 'TOT_PAGO'
          DataPipeline = pplCCContrato
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCContrato'
          mmHeight = 2646
          mmLeft = 229130
          mmTop = 5027
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object rptCCContratoDBCalc3: TppDBCalc
          UserName = 'rptCCContratoDBCalc3'
          DataField = 'TOT_RECEBER'
          DataPipeline = pplCCContrato
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCContrato'
          mmHeight = 2646
          mmLeft = 183092
          mmTop = 5027
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object rptCCContratoDBCalc4: TppDBCalc
          UserName = 'rptCCContratoDBCalc4'
          DataField = 'TOT_RECEBIDO'
          DataPipeline = pplCCContrato
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCContrato'
          mmHeight = 2646
          mmLeft = 198438
          mmTop = 5027
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object rptCCContratoLabel6: TppLabel
          UserName = 'rptCCContratoLabel6'
          Caption = 'Total do Contrato:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 159015
          mmTop = 5027
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object rptCCContratoShape2: TppShape
          UserName = 'rptCCContratoShape2'
          Pen.Width = 2
          mmHeight = 5027
          mmLeft = 182034
          mmTop = 8202
          mmWidth = 63500
          BandType = 5
          GroupNo = 0
        end
        object rptCCContratoLabel17: TppLabel
          UserName = 'rptCCContratoLabel17'
          Caption = 'Saldo:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 172773
          mmTop = 8996
          mmWidth = 9525
          BandType = 5
          GroupNo = 0
        end
        object rptCCContratoDBCalc5: TppDBCalc
          UserName = 'rptCCContratoDBCalc5'
          DataField = 'SALDO_RECEB'
          DataPipeline = pplCCContrato
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCContrato'
          mmHeight = 2646
          mmLeft = 183092
          mmTop = 9260
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object rptCCContratoDBCalc6: TppDBCalc
          UserName = 'rptCCContratoDBCalc6'
          DataField = 'SALDO_PAGAR'
          DataPipeline = pplCCContrato
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCContrato'
          mmHeight = 2646
          mmLeft = 213784
          mmTop = 9260
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryCCMestre: TwwQuery
    OnCalcFields = qryCCMestreCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   I.IDIMOVEL, I.IDIMOVELMESTRE, IM.IMONOME AS NOME_MESTRE,'
      '   I.IMONOME,'
      ''
      '   T.DESCCUSTORECIMO,'
      ''
      
        '   LI.DATALANCAMENTO, LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.A' +
        'NOCOMPETENCIA,'
      ''
      '   TA.DESCRICAO,'
      ''
      '   D.RECPAG, D.STATUS, D.NODOCUMENTO, NUMAPGR,'
      ''
      '   LD.CODDOCUMENTO, LD.CODALTERADOR, LD.OPERACAO,'
      '   LD.VALOR, LD.DEBCRE, LD.HISTORICOCOMPL, LD.DATALANCTO,'
      ''
      '   PFC.NOME AS NF_FORCLI, PFC.RAZAOSOCIAL AS RS_FORCLI,'
      ''
      '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', LI.DATAVENCIMENTO,'
      
        '      DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LI.DATAVENCIMENTO, LD.DATA' +
        'LANCTO)) AS DATA,'
      ''
      '   ('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE(' +
        'LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '   ) AS TOT_RECEBER,'
      ''
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) AS TOT_RECEBIDO,'
      ''
      '   ('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE(' +
        'LD.DEBCRE, '#39'C'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '   ) AS TOT_PAGAR,'
      ''
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) AS TOT_PAGO,'
      ''
      '   ('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE(' +
        'LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0)'
      '   ) AS SALDO_RECEB,'
      ''
      '   ('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE(' +
        'LD.DEBCRE, '#39'C'#39', LD.VALOR, LD.VALOR * -1), 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0)'
      '   ) AS SALDO_PAGAR'
      ''
      'FROM'
      '   PESSOA PFC,'
      '   DOCUMENTO D, IMOVEL I, IMOVEL IM,'
      '   TIPOCUSTORECIMOV T, LANCAMENTOSIMOVEL LI,'
      '   CONTRATOXIMOVEL CX, CONTRATOIMOVEL C,'
      '   TIPOALTERADOR TA, LANCTODOCUM LD'
      ''
      'WHERE'
      ''
      '   1=2 AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   AND ( LI.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( LI.IDIMOVEL = CX.IDIMOVEL(+) )'
      '   AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) )'
      '   AND ( C.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL )'
      '   AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )'
      '   AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )'
      '   AND ( LD.CODALTERADOR = TA.CODALTERADOR(+) )'
      '   AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO )'
      '   AND ( LI.IDFORCLI = PFC.IDPESSOA )'
      ''
      'ORDER BY'
      '   IM.IMONOME, I.IMONOME,'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LI.DATAVENCIMENTO, LD.DATALAN' +
        'CTO)')
    ValidateWithMask = True
    Left = 378
    Top = 56
    object qryCCMestreDESCALC: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCALC'
      Size = 150
      Calculated = True
    end
    object qryCCMestreIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryCCMestreIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object qryCCMestreNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object qryCCMestreDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object qryCCMestreDATALANCAMENTO: TDateTimeField
      FieldName = 'DATALANCAMENTO'
    end
    object qryCCMestreDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryCCMestreMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object qryCCMestreANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object qryCCMestreDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryCCMestreRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
    object qryCCMestreSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object qryCCMestreNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object qryCCMestreCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryCCMestreCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
    end
    object qryCCMestreOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 2
    end
    object qryCCMestreVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryCCMestreDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Size = 1
    end
    object qryCCMestreHISTORICOCOMPL: TStringField
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object qryCCMestreDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
    end
    object qryCCMestreNF_FORCLI: TStringField
      FieldName = 'NF_FORCLI'
      Size = 60
    end
    object qryCCMestreRS_FORCLI: TStringField
      FieldName = 'RS_FORCLI'
      Size = 60
    end
    object qryCCMestreDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object qryCCMestreTOT_RECEBER: TFloatField
      FieldName = 'TOT_RECEBER'
    end
    object qryCCMestreTOT_RECEBIDO: TFloatField
      FieldName = 'TOT_RECEBIDO'
    end
    object qryCCMestreTOT_PAGAR: TFloatField
      FieldName = 'TOT_PAGAR'
    end
    object qryCCMestreTOT_PAGO: TFloatField
      FieldName = 'TOT_PAGO'
    end
    object qryCCMestreSALDO_RECEB: TFloatField
      FieldName = 'SALDO_RECEB'
    end
    object qryCCMestreSALDO_PAGAR: TFloatField
      FieldName = 'SALDO_PAGAR'
    end
    object qryCCMestreIMONOME: TStringField
      FieldName = 'IMONOME'
      Size = 60
    end
    object qryCCMestreNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
    end
  end
  object dsCCMestre: TwwDataSource
    DataSet = qryCCMestre
    Left = 378
    Top = 68
  end
  object pplCCMestre: TppBDEPipeline
    DataSource = dsCCMestre
    UserName = 'lCCMestre'
    Left = 378
    Top = 80
    object pplCCMestreppField1: TppField
      FieldAlias = 'DESCALC'
      FieldName = 'DESCALC'
      FieldLength = 150
      DisplayWidth = 150
      Position = 0
    end
    object pplCCMestreppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplCCMestreppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVELMESTRE'
      FieldName = 'IDIMOVELMESTRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplCCMestreppField4: TppField
      FieldAlias = 'NOME_MESTRE'
      FieldName = 'NOME_MESTRE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplCCMestreppField5: TppField
      FieldAlias = 'DESCCUSTORECIMO'
      FieldName = 'DESCCUSTORECIMO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pplCCMestreppField6: TppField
      FieldAlias = 'DATALANCAMENTO'
      FieldName = 'DATALANCAMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object pplCCMestreppField7: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object pplCCMestreppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'MESCOMPETENCIA'
      FieldName = 'MESCOMPETENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplCCMestreppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANOCOMPETENCIA'
      FieldName = 'ANOCOMPETENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplCCMestreppField10: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 35
      DisplayWidth = 35
      Position = 9
    end
    object pplCCMestreppField11: TppField
      FieldAlias = 'RECPAG'
      FieldName = 'RECPAG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 10
    end
    object pplCCMestreppField12: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 11
    end
    object pplCCMestreppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplCCMestreppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplCCMestreppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODALTERADOR'
      FieldName = 'CODALTERADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplCCMestreppField16: TppField
      FieldAlias = 'OPERACAO'
      FieldName = 'OPERACAO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 15
    end
    object pplCCMestreppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplCCMestreppField18: TppField
      FieldAlias = 'DEBCRE'
      FieldName = 'DEBCRE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 17
    end
    object pplCCMestreppField19: TppField
      FieldAlias = 'HISTORICOCOMPL'
      FieldName = 'HISTORICOCOMPL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 18
    end
    object pplCCMestreppField20: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 19
    end
    object pplCCMestreppField21: TppField
      FieldAlias = 'NF_FORCLI'
      FieldName = 'NF_FORCLI'
      FieldLength = 60
      DisplayWidth = 60
      Position = 20
    end
    object pplCCMestreppField22: TppField
      FieldAlias = 'RS_FORCLI'
      FieldName = 'RS_FORCLI'
      FieldLength = 60
      DisplayWidth = 60
      Position = 21
    end
    object pplCCMestreppField23: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 22
    end
    object pplCCMestreppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_RECEBER'
      FieldName = 'TOT_RECEBER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplCCMestreppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_RECEBIDO'
      FieldName = 'TOT_RECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplCCMestreppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_PAGAR'
      FieldName = 'TOT_PAGAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplCCMestreppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_PAGO'
      FieldName = 'TOT_PAGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplCCMestreppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO_RECEB'
      FieldName = 'SALDO_RECEB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object pplCCMestreppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO_PAGAR'
      FieldName = 'SALDO_PAGAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object pplCCMestreppField30: TppField
      FieldAlias = 'IMONOME'
      FieldName = 'IMONOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 29
    end
    object pplCCMestreppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMAPGR'
      FieldName = 'NUMAPGR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
  end
  object rptCCImovel: TppReport
    AutoStop = False
    DataPipeline = pplCCImovel
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 11906
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 304
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplCCImovel'
    object rptCCImovel_CabecalhoRelat: TppHeaderBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 39423
      mmPrintPosition = 0
      object ppLabel26: TppLabel
        UserName = 'ppLabel26'
        AutoSize = False
        Caption = 'Conta Corrente por Imóvel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 37835
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel27: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel27'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 37835
        mmTop = 1588
        mmWidth = 197380
        BandType = 0
      end
      object rptCCImovelLabel1: TppLabel
        UserName = 'rptCCImovelLabel1'
        Caption = 'Mês de Competência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 18521
        mmWidth = 30692
        BandType = 0
      end
      object rptCCImovelLabel2: TppLabel
        UserName = 'rptCCImovelLabel2'
        Caption = 'Período de Datas:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 6350
        mmTop = 22490
        mmWidth = 25665
        BandType = 0
      end
      object rptCCImovel_lblCompetencia: TppLabel
        UserName = 'rptCCImovel_lblCompetencia'
        Caption = 'rptCCImovel_lblCompetencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 18785
        mmWidth = 36777
        BandType = 0
      end
      object rptCCImovel_lblDatas: TppLabel
        UserName = 'rptCCImovel_lblDatas'
        Caption = 'rptCCImovel_lblDatas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 22754
        mmWidth = 26458
        BandType = 0
      end
      object rptCCImovelLabel13: TppLabel
        UserName = 'rptCCImovelLabel13'
        Caption = 'Tipo de Receita / Despesa:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 185209
        mmTop = 18521
        mmWidth = 39688
        BandType = 0
      end
      object rptCCImovel_lblTipoRecDes: TppLabel
        UserName = 'rptCCImovel_lblTipoRecDes'
        AutoSize = False
        Caption = 'rptCCImovel_lblTipoRecDes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 224632
        mmTop = 18521
        mmWidth = 47625
        BandType = 0
      end
      object rptCCImovel_lblRecPag: TppLabel
        UserName = 'rptCCImovel_lblRecPag'
        AutoSize = False
        Caption = 'rptCCImovel_lblRecPag'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 224632
        mmTop = 26458
        mmWidth = 47625
        BandType = 0
      end
      object rptCCImovel_lblPrevEfetivo: TppLabel
        UserName = 'rptCCImovel_lblPrevEfetivo'
        AutoSize = False
        Caption = 'rptCCImovel_lblPrevEfetivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 224632
        mmTop = 30692
        mmWidth = 47625
        BandType = 0
      end
      object rptCCImovel_lblEmAberto: TppLabel
        UserName = 'rptCCImovel_lblEmAberto'
        AutoSize = False
        Caption = 'Apenas lançamentos em aberto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 224632
        mmTop = 34925
        mmWidth = 47625
        BandType = 0
      end
      object rptCCImovel_lblSitImovel: TppLabel
        UserName = 'rptCCImovel_lblSitImovel'
        Caption = '< Todas >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33338
        mmTop = 26988
        mmWidth = 12700
        BandType = 0
      end
      object rptCCImovel_lblTipoImovel: TppLabel
        UserName = 'rptCCImovel_lblTipoImovel'
        AutoSize = False
        Caption = 'Todos os Tipos de Imóvel / Segmento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 84667
        mmTop = 28046
        mmWidth = 102659
        BandType = 0
      end
      object ppLogoCCImovel: TppImage
        UserName = 'ppLogoCCImovel'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel67: TppLabel
        UserName = 'Label67'
        Caption = 'Situação do Imóvel: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 4763
        mmTop = 26723
        mmWidth = 27781
        BandType = 0
      end
      object rptCCImovel_lblVago: TppLabel
        UserName = 'rptCCImovel_lblVago'
        AutoSize = False
        Caption = 'Apenas imóveis vagos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 224632
        mmTop = 22490
        mmWidth = 47625
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 20108
      mmPrintPosition = 0
      object rptCCImovel_FundoBandaDetalhe: TppShape
        OnPrint = rptFolhaAluguel_FundoBandaDetalhePrint
        UserName = 'rptCCImovel_FundoBandaDetalhe'
        Brush.Color = 13040076
        ParentHeight = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 20108
        mmLeft = 0
        mmTop = 0
        mmWidth = 272257
        BandType = 4
      end
      object rptCCImovel_Separador: TppLine
        OnPrint = rptCCContrato_SeparadorPrint
        UserName = 'rptCCImovel_Separador'
        ParentHeight = True
        ParentWidth = True
        StretchWithParent = True
        Visible = False
        Weight = 0.75
        mmHeight = 20108
        mmLeft = 0
        mmTop = 0
        mmWidth = 271993
        BandType = 4
      end
      object rptCCImovelDBText1: TppDBText
        UserName = 'rptCCImovelDBText1'
        BlankWhenZero = True
        DataField = 'TOT_PAGO'
        DataPipeline = pplCCImovel
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovel'
        mmHeight = 2646
        mmLeft = 229130
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object rptCCImovelDBText2: TppDBText
        UserName = 'rptCCImovelDBText2'
        DataField = 'DATA'
        DataPipeline = pplCCImovel
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplCCImovel'
        mmHeight = 2646
        mmLeft = 258234
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object rptCCImovelLabel3: TppLabel
        UserName = 'rptCCImovelLabel3'
        AutoSize = False
        Caption = ' / '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 249238
        mmTop = 794
        mmWidth = 2381
        BandType = 4
      end
      object rptCCImovelDBText3: TppDBText
        UserName = 'rptCCImovelDBText3'
        DataField = 'MESCOMPETENCIA'
        DataPipeline = pplCCImovel
        DisplayFormat = '00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplCCImovel'
        mmHeight = 2646
        mmLeft = 245798
        mmTop = 794
        mmWidth = 3704
        BandType = 4
      end
      object rptCCImovelDBText4: TppDBText
        UserName = 'rptCCImovelDBText4'
        DataField = 'ANOCOMPETENCIA'
        DataPipeline = pplCCImovel
        DisplayFormat = '0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCImovel'
        mmHeight = 2646
        mmLeft = 251355
        mmTop = 794
        mmWidth = 6350
        BandType = 4
      end
      object rptCCImovelDBText5: TppDBText
        UserName = 'rptCCImovelDBText5'
        BlankWhenZero = True
        DataField = 'TOT_PAGAR'
        DataPipeline = pplCCImovel
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovel'
        mmHeight = 2646
        mmLeft = 213784
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object rptCCImovelDBText6: TppDBText
        UserName = 'rptCCImovelDBText6'
        BlankWhenZero = True
        DataField = 'TOT_RECEBIDO'
        DataPipeline = pplCCImovel
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovel'
        mmHeight = 2646
        mmLeft = 198438
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object rptCCImovelDBText7: TppDBText
        UserName = 'rptCCImovelDBText7'
        BlankWhenZero = True
        DataField = 'TOT_RECEBER'
        DataPipeline = pplCCImovel
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovel'
        mmHeight = 2646
        mmLeft = 183092
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object rptCCImovelDBMemo2: TppDBMemo
        UserName = 'rptCCImovelDBMemo2'
        CharWrap = True
        DataField = 'NF_FORCLI'
        DataPipeline = pplCCImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCImovel'
        mmHeight = 15875
        mmLeft = 0
        mmTop = 794
        mmWidth = 63236
        BandType = 4
        mmBottomOffset = 529
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptCCImovelDBMemo3: TppDBMemo
        UserName = 'rptCCImovelDBMemo3'
        CharWrap = True
        DataField = 'DESCCUSTORECIMO'
        DataPipeline = pplCCImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCImovel'
        mmHeight = 15875
        mmLeft = 65088
        mmTop = 794
        mmWidth = 40746
        BandType = 4
        mmBottomOffset = 529
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptCCImovelDBMemo4: TppDBMemo
        UserName = 'rptCCImovelDBMemo4'
        CharWrap = True
        DataField = 'DESCALC'
        DataPipeline = pplCCImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCImovel'
        mmHeight = 15875
        mmLeft = 107686
        mmTop = 794
        mmWidth = 41010
        BandType = 4
        mmBottomOffset = 529
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptCCImovelDBText9: TppDBText
        UserName = 'rptCCImovelDBText9'
        DataField = 'NODOCUMENTO'
        DataPipeline = pplCCImovel
        DisplayFormat = '####################0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCImovel'
        mmHeight = 2646
        mmLeft = 150548
        mmTop = 794
        mmWidth = 21167
        BandType = 4
      end
      object rptCCImovelDBText10: TppDBText
        UserName = 'rptCCImovelDBText10'
        BlankWhenZero = True
        DataField = 'NUMAPGR'
        DataPipeline = pplCCImovel
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovel'
        mmHeight = 2381
        mmLeft = 173302
        mmTop = 794
        mmWidth = 8731
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine11: TppLine
        UserName = 'ppLine11'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 271993
        BandType = 8
      end
      object ppLabel28: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel28'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc11: TppSystemVariable
        UserName = 'Calc11'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 114300
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc12: TppSystemVariable
        UserName = 'Calc12'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 236803
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
    object ppSummaryBand6: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 31221
      mmPrintPosition = 0
      object ppRegion4: TppRegion
        UserName = 'Region4'
        KeepTogether = True
        Brush.Style = bsClear
        Pen.Style = psClear
        Transparent = True
        mmHeight = 9525
        mmLeft = 161132
        mmTop = 0
        mmWidth = 86519
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppShape19: TppShape
          UserName = 'Shape19'
          mmHeight = 3969
          mmLeft = 182299
          mmTop = 4498
          mmWidth = 64029
          BandType = 7
        end
        object ppShape20: TppShape
          UserName = 'Shape20'
          mmHeight = 3704
          mmLeft = 182299
          mmTop = 1058
          mmWidth = 64029
          BandType = 7
        end
        object ppDBCalc38: TppDBCalc
          UserName = 'DBCalc38'
          DataField = 'TOT_RECEBER'
          DataPipeline = pplCCImovel
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovel'
          mmHeight = 2646
          mmLeft = 182828
          mmTop = 1588
          mmWidth = 15081
          BandType = 7
        end
        object ppDBCalc39: TppDBCalc
          UserName = 'DBCalc39'
          DataField = 'TOT_RECEBIDO'
          DataPipeline = pplCCImovel
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovel'
          mmHeight = 2646
          mmLeft = 198967
          mmTop = 1588
          mmWidth = 15081
          BandType = 7
        end
        object ppDBCalc40: TppDBCalc
          UserName = 'DBCalc40'
          DataField = 'TOT_PAGAR'
          DataPipeline = pplCCImovel
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovel'
          mmHeight = 2646
          mmLeft = 214842
          mmTop = 1588
          mmWidth = 15081
          BandType = 7
        end
        object ppDBCalc41: TppDBCalc
          UserName = 'DBCalc41'
          DataField = 'TOT_PAGO'
          DataPipeline = pplCCImovel
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovel'
          mmHeight = 2646
          mmLeft = 230717
          mmTop = 1588
          mmWidth = 15081
          BandType = 7
        end
        object ppLabel69: TppLabel
          UserName = 'Label69'
          Caption = 'Saldo:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 171980
          mmTop = 5027
          mmWidth = 9525
          BandType = 7
        end
        object ppDBCalc42: TppDBCalc
          UserName = 'DBCalc42'
          DataField = 'SALDO_RECEB'
          DataPipeline = pplCCImovel
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovel'
          mmHeight = 2646
          mmLeft = 182828
          mmTop = 5292
          mmWidth = 15081
          BandType = 7
        end
        object ppDBCalc43: TppDBCalc
          UserName = 'DBCalc43'
          DataField = 'SALDO_PAGAR'
          DataPipeline = pplCCImovel
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovel'
          mmHeight = 2646
          mmLeft = 214842
          mmTop = 5292
          mmWidth = 15081
          BandType = 7
        end
        object ppLabel71: TppLabel
          UserName = 'Label71'
          Caption = 'Total da Geral:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 162454
          mmTop = 1323
          mmWidth = 19050
          BandType = 7
        end
      end
      object ppSubReport2: TppSubReport
        OnPrint = ppSubReport2Print
        UserName = 'subTotalGeral'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplTotalGeral'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 12435
        mmWidth = 271993
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = pplTotalGeral
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6615
          PrinterSetup.mmMarginLeft = 13229
          PrinterSetup.mmMarginRight = 11906
          PrinterSetup.mmMarginTop = 6615
          PrinterSetup.mmPaperHeight = 210080
          PrinterSetup.mmPaperWidth = 297128
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utScreenPixels
          Left = 424
          Top = 272
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplTotalGeral'
          object ppTitleBand3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 8467
            mmPrintPosition = 0
            object ppLabel201: TppLabel
              UserName = 'Label201'
              Caption = 'RESUMO DE SEGREGAÇÃO TOTAL GERAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 529
              mmTop = 0
              mmWidth = 58843
              BandType = 1
            end
            object ppLabel202: TppLabel
              UserName = 'Label202'
              Caption = 'Plano'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 0
              mmTop = 5027
              mmWidth = 12171
              BandType = 1
            end
            object ppLabel203: TppLabel
              UserName = 'Label203'
              Caption = 'Patrocinador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 38629
              mmTop = 4763
              mmWidth = 29369
              BandType = 1
            end
            object ppLabel204: TppLabel
              UserName = 'Label204'
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 91546
              mmTop = 4233
              mmWidth = 7673
              BandType = 1
            end
            object ppLabel205: TppLabel
              UserName = 'Label205'
              Caption = 'A Receber(R$)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 108744
              mmTop = 4763
              mmWidth = 22754
              BandType = 1
            end
            object ppLabel206: TppLabel
              UserName = 'Label206'
              Caption = 'Recebido(R$)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 137584
              mmTop = 4763
              mmWidth = 19050
              BandType = 1
            end
            object ppLabel207: TppLabel
              UserName = 'Label207'
              Caption = 'A Pagar(R$)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 158486
              mmTop = 4763
              mmWidth = 23019
              BandType = 1
            end
            object ppLabel208: TppLabel
              UserName = 'Label208'
              Caption = 'Pago(R$)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 188384
              mmTop = 4763
              mmWidth = 18256
              BandType = 1
            end
          end
          object ppDetailBand14: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3175
            mmPrintPosition = 0
            object ppDBText98: TppDBText
              UserName = 'DBText98'
              DataField = 'PLANOPREV'
              DataPipeline = pplTotalGeral
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplTotalGeral'
              mmHeight = 3175
              mmLeft = 0
              mmTop = 0
              mmWidth = 36513
              BandType = 4
            end
            object ppDBText99: TppDBText
              UserName = 'DBText99'
              DataField = 'PATROCINADORA'
              DataPipeline = pplTotalGeral
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplTotalGeral'
              mmHeight = 3175
              mmLeft = 38629
              mmTop = 0
              mmWidth = 42333
              BandType = 4
            end
            object ppDBText100: TppDBText
              UserName = 'DBText100'
              DataField = 'PERCENTRATEIO'
              DataPipeline = pplTotalGeral
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplTotalGeral'
              mmHeight = 3175
              mmLeft = 84402
              mmTop = 0
              mmWidth = 15346
              BandType = 4
            end
            object ppDBText101: TppDBText
              UserName = 'DBText101'
              DataField = 'TOT_ARECEBER'
              DataPipeline = pplTotalGeral
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplTotalGeral'
              mmHeight = 3175
              mmLeft = 102129
              mmTop = 0
              mmWidth = 28840
              BandType = 4
            end
            object ppDBText105: TppDBText
              UserName = 'DBText105'
              DataField = 'TOT_RECEBIDO'
              DataPipeline = pplTotalGeral
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplTotalGeral'
              mmHeight = 3175
              mmLeft = 134144
              mmTop = 0
              mmWidth = 22225
              BandType = 4
            end
            object ppDBText107: TppDBText
              UserName = 'DBText107'
              DataField = 'TOT_APAGAR'
              DataPipeline = pplTotalGeral
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplTotalGeral'
              mmHeight = 3175
              mmLeft = 158750
              mmTop = 0
              mmWidth = 23019
              BandType = 4
            end
            object ppDBText108: TppDBText
              UserName = 'DBText108'
              DataField = 'TOT_RECEBIDO'
              DataPipeline = pplTotalGeral
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplTotalGeral'
              mmHeight = 3175
              mmLeft = 184150
              mmTop = 0
              mmWidth = 22754
              BandType = 4
            end
          end
          object ppSummaryBand10: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
          end
        end
      end
      object ppSubReport3: TppSubReport
        OnPrint = ppSubReport3Print
        UserName = 'subSaldoGeral'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSubReport2
        TraverseAllData = False
        DataPipelineName = 'pplSaldoGeral'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 20108
        mmWidth = 271993
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = pplSaldoGeral
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6615
          PrinterSetup.mmMarginLeft = 13229
          PrinterSetup.mmMarginRight = 11906
          PrinterSetup.mmMarginTop = 6615
          PrinterSetup.mmPaperHeight = 210080
          PrinterSetup.mmPaperWidth = 297128
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utScreenPixels
          Left = 432
          Top = 280
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplSaldoGeral'
          object ppTitleBand6: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 8467
            mmPrintPosition = 0
            object ppLabel222: TppLabel
              UserName = 'Label222'
              Caption = 'RESUMO DE SEGREGAÇÃO SALDO GERAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 0
              mmTop = 0
              mmWidth = 59394
              BandType = 1
            end
            object ppLabel224: TppLabel
              UserName = 'Label224'
              Caption = 'Plano'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 0
              mmTop = 5027
              mmWidth = 12171
              BandType = 1
            end
            object ppLabel225: TppLabel
              UserName = 'Label225'
              Caption = 'Patrocinador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 37306
              mmTop = 4763
              mmWidth = 29369
              BandType = 1
            end
            object ppLabel226: TppLabel
              UserName = 'Label2201'
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 90488
              mmTop = 4763
              mmWidth = 7673
              BandType = 1
            end
            object ppLabel227: TppLabel
              UserName = 'Label227'
              Caption = 'A Receber(R$)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 108215
              mmTop = 4763
              mmWidth = 22754
              BandType = 1
            end
            object ppLabel228: TppLabel
              UserName = 'Label228'
              Caption = 'A Pagar(R$)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 157957
              mmTop = 4763
              mmWidth = 23019
              BandType = 1
            end
          end
          object ppDetailBand18: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3175
            mmPrintPosition = 0
            object ppDBText121: TppDBText
              UserName = 'DBText121'
              DataField = 'PLANOPREV'
              DataPipeline = pplSaldoGeral
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'pplSaldoGeral'
              mmHeight = 3175
              mmLeft = 0
              mmTop = 0
              mmWidth = 36513
              BandType = 4
            end
            object ppDBText123: TppDBText
              UserName = 'DBText123'
              DataField = 'PATROCINADORA'
              DataPipeline = pplSaldoGeral
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'pplSaldoGeral'
              mmHeight = 3175
              mmLeft = 37306
              mmTop = 0
              mmWidth = 42333
              BandType = 4
            end
            object ppDBText124: TppDBText
              UserName = 'DBText124'
              DataField = 'PERCENTRATEIO'
              DataPipeline = pplSaldoGeral
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplSaldoGeral'
              mmHeight = 3175
              mmLeft = 82550
              mmTop = 0
              mmWidth = 15346
              BandType = 4
            end
            object ppDBText125: TppDBText
              UserName = 'DBText1201'
              DataField = 'SALDO_RECEB'
              DataPipeline = pplSaldoGeral
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplSaldoGeral'
              mmHeight = 3175
              mmLeft = 102129
              mmTop = 0
              mmWidth = 28840
              BandType = 4
            end
            object ppDBText126: TppDBText
              UserName = 'DBText126'
              DataField = 'SALDO_PAGAR'
              DataPipeline = pplSaldoGeral
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplSaldoGeral'
              mmHeight = 3175
              mmLeft = 158221
              mmTop = 0
              mmWidth = 23019
              BandType = 4
            end
          end
          object ppSummaryBand13: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'IMOVEL_EXTENSO'
      DataPipeline = pplCCImovel
      OutlineSettings.CreateNode = True
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 13229
      DataPipelineName = 'pplCCImovel'
      object rptCCImovel_CabecalhoGrupo: TppGroupHeaderBand
        AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
        BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
        mmBottomOffset = 40
        mmHeight = 11642
        mmPrintPosition = 0
        object rptCCImovelLine1: TppLine
          UserName = 'rptCCImovelLine1'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 7938
          mmWidth = 271993
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelLabel4: TppLabel
          UserName = 'rptCCImovelLabel4'
          Caption = 'Imóvel:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 0
          mmTop = 3704
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelLabel7: TppLabel
          UserName = 'rptCCImovelLabel7'
          Caption = 'Tipo de Receita / Despesa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 65088
          mmTop = 8467
          mmWidth = 30163
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelLabel8: TppLabel
          UserName = 'rptCCImovelLabel8'
          Caption = 'Alterador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 107686
          mmTop = 8467
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelLabel9: TppLabel
          UserName = 'rptCCImovelLabel9'
          Caption = 'A Receber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 186267
          mmTop = 8467
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelLabel10: TppLabel
          UserName = 'rptCCImovelLabel10'
          Caption = 'Favorecido / Debitado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 0
          mmTop = 8467
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelLabel11: TppLabel
          UserName = 'rptCCImovelLabel11'
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 202142
          mmTop = 8467
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelLabel12: TppLabel
          UserName = 'rptCCImovelLabel12'
          Caption = 'A Pagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 219869
          mmTop = 8467
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelLabel14: TppLabel
          UserName = 'rptCCImovelLabel14'
          Caption = 'Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 238125
          mmTop = 8467
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelLabel17: TppLabel
          UserName = 'rptCCImovelLabel17'
          Caption = 'Compet.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 246328
          mmTop = 8467
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelLabel18: TppLabel
          UserName = 'rptCCImovelLabel18'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 262467
          mmTop = 8467
          mmWidth = 5292
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelLine2: TppLine
          UserName = 'rptCCImovelLine2'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 10848
          mmWidth = 271993
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelDBText8: TppDBText
          UserName = 'rptCCImovelDBText8'
          AutoSize = True
          DataField = 'IMOVEL_EXTENSO'
          DataPipeline = pplCCImovel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplCCImovel'
          mmHeight = 2910
          mmLeft = 10583
          mmTop = 3704
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelLabel5: TppLabel
          UserName = 'rptCCImovelLabel5'
          Caption = 'Nº do Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 150548
          mmTop = 8467
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelLabel6: TppLabel
          UserName = 'rptCCImovelLabel6'
          Caption = 'Nº AP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 175684
          mmTop = 8467
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
      end
      object rptCCImovel_RodapeGrupo: TppGroupFooterBand
        AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
        BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
        PrintHeight = phDynamic
        mmBottomOffset = 40
        mmHeight = 34396
        mmPrintPosition = 0
        object rptCCImovelShape1: TppShape
          UserName = 'rptCCImovelShape1'
          Pen.Width = 2
          mmHeight = 5027
          mmLeft = 182034
          mmTop = 3969
          mmWidth = 63500
          BandType = 5
          GroupNo = 0
        end
        object ppLine28: TppLine
          UserName = 'ppLine28'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 271993
          BandType = 5
          GroupNo = 0
        end
        object rptCCImovelDBCalc1: TppDBCalc
          UserName = 'rptCCImovelDBCalc1'
          DataField = 'TOT_RECEBER'
          DataPipeline = pplCCImovel
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovel'
          mmHeight = 2646
          mmLeft = 183092
          mmTop = 5027
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object rptCCImovelDBCalc2: TppDBCalc
          UserName = 'rptCCImovelDBCalc2'
          DataField = 'TOT_RECEBIDO'
          DataPipeline = pplCCImovel
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovel'
          mmHeight = 2646
          mmLeft = 198438
          mmTop = 5027
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object rptCCImovelDBCalc3: TppDBCalc
          UserName = 'rptCCImovelDBCalc3'
          DataField = 'TOT_PAGAR'
          DataPipeline = pplCCImovel
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovel'
          mmHeight = 2646
          mmLeft = 213784
          mmTop = 5027
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object rptCCImovelDBCalc4: TppDBCalc
          UserName = 'rptCCImovelDBCalc4'
          DataField = 'TOT_PAGO'
          DataPipeline = pplCCImovel
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovel'
          mmHeight = 2646
          mmLeft = 229130
          mmTop = 5027
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object rptCCImovelShape2: TppShape
          UserName = 'rptCCImovelShape2'
          Pen.Width = 2
          mmHeight = 5027
          mmLeft = 182034
          mmTop = 8202
          mmWidth = 63500
          BandType = 5
          GroupNo = 0
        end
        object rptCCImovelLabel15: TppLabel
          UserName = 'rptCCImovelLabel15'
          Caption = 'Saldo:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 172244
          mmTop = 8996
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object rptCCImovelDBCalc5: TppDBCalc
          UserName = 'rptCCImovelDBCalc5'
          DataField = 'SALDO_RECEB'
          DataPipeline = pplCCImovel
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovel'
          mmHeight = 2646
          mmLeft = 183092
          mmTop = 9260
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object rptCCImovelDBCalc6: TppDBCalc
          UserName = 'rptCCImovelDBCalc6'
          DataField = 'SALDO_PAGAR'
          DataPipeline = pplCCImovel
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovel'
          mmHeight = 2646
          mmLeft = 213784
          mmTop = 9260
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object rptCCImovelLabel16: TppLabel
          UserName = 'rptCCImovelLabel16'
          Caption = 'Total do Imóvel:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 161661
          mmTop = 5027
          mmWidth = 20638
          BandType = 5
          GroupNo = 0
        end
        object ppSubReport4: TppSubReport
          OnPrint = ppSubReport4Print
          UserName = 'subTotalImovel'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplTotalImovel'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 15081
          mmWidth = 271993
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport4: TppChildReport
            AutoStop = False
            DataPipeline = pplTotalImovel
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.Orientation = poLandscape
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6615
            PrinterSetup.mmMarginLeft = 13229
            PrinterSetup.mmMarginRight = 11906
            PrinterSetup.mmMarginTop = 6615
            PrinterSetup.mmPaperHeight = 210080
            PrinterSetup.mmPaperWidth = 297128
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Left = 448
            Top = 296
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplTotalImovel'
            object ppTitleBand4: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 10583
              mmPrintPosition = 0
              object ppLabel209: TppLabel
                UserName = 'Label209'
                Caption = 'RESUMO DE SEGREGAÇÃO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 0
                mmTop = 0
                mmWidth = 38100
                BandType = 1
              end
              object ppLabel210: TppLabel
                UserName = 'Label210'
                Caption = 'Plano'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 0
                mmTop = 6350
                mmWidth = 12171
                BandType = 1
              end
              object ppLabel211: TppLabel
                UserName = 'Label211'
                Caption = 'Patrocinador'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 37306
                mmTop = 6350
                mmWidth = 29369
                BandType = 1
              end
              object ppLabel212: TppLabel
                UserName = 'Label212'
                Caption = '%'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 90223
                mmTop = 7144
                mmWidth = 7673
                BandType = 1
              end
              object ppLabel213: TppLabel
                UserName = 'Label213'
                Caption = 'A Receber(R$)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 107950
                mmTop = 7144
                mmWidth = 22754
                BandType = 1
              end
              object ppLabel214: TppLabel
                UserName = 'Label214'
                Caption = 'Recebido(R$)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 136790
                mmTop = 7144
                mmWidth = 19050
                BandType = 1
              end
              object ppLabel215: TppLabel
                UserName = 'Label215'
                Caption = 'A Pagar(R$)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 156898
                mmTop = 7144
                mmWidth = 23019
                BandType = 1
              end
              object ppLabel216: TppLabel
                UserName = 'Label216'
                Caption = 'Pago(R$)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 186796
                mmTop = 7144
                mmWidth = 18256
                BandType = 1
              end
            end
            object ppDetailBand15: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 3175
              mmPrintPosition = 0
              object ppDBText109: TppDBText
                UserName = 'DBText109'
                DataField = 'PLANOPREV'
                DataPipeline = pplTotalImovel
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplTotalImovel'
                mmHeight = 3175
                mmLeft = 0
                mmTop = 0
                mmWidth = 36513
                BandType = 4
              end
              object ppDBText111: TppDBText
                UserName = 'DBText111'
                DataField = 'PATROCINADORA'
                DataPipeline = pplTotalImovel
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplTotalImovel'
                mmHeight = 3175
                mmLeft = 37306
                mmTop = 0
                mmWidth = 42333
                BandType = 4
              end
              object ppDBText112: TppDBText
                UserName = 'DBText1001'
                DataField = 'PERCENTRATEIO'
                DataPipeline = pplTotalImovel
                DisplayFormat = '###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplTotalImovel'
                mmHeight = 3175
                mmLeft = 82550
                mmTop = 0
                mmWidth = 15346
                BandType = 4
              end
              object ppDBText113: TppDBText
                UserName = 'DBText113'
                DataField = 'TOT_ARECEBER'
                DataPipeline = pplTotalImovel
                DisplayFormat = '###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplTotalImovel'
                mmHeight = 3175
                mmLeft = 101600
                mmTop = 0
                mmWidth = 28840
                BandType = 4
              end
              object ppDBText114: TppDBText
                UserName = 'DBText114'
                DataField = 'TOT_RECEBIDO'
                DataPipeline = pplTotalImovel
                DisplayFormat = '###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplTotalImovel'
                mmHeight = 3175
                mmLeft = 133350
                mmTop = 0
                mmWidth = 22225
                BandType = 4
              end
              object ppDBText115: TppDBText
                UserName = 'DBText115'
                DataField = 'TOT_APAGAR'
                DataPipeline = pplTotalImovel
                DisplayFormat = '###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplTotalImovel'
                mmHeight = 3175
                mmLeft = 156898
                mmTop = 0
                mmWidth = 23019
                BandType = 4
              end
              object ppDBText116: TppDBText
                UserName = 'DBText116'
                DataField = 'TOT_RECEBIDO'
                DataPipeline = pplTotalImovel
                DisplayFormat = '###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplTotalImovel'
                mmHeight = 3175
                mmLeft = 182298
                mmTop = 0
                mmWidth = 23019
                BandType = 4
              end
            end
            object ppSummaryBand11: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 4233
              mmPrintPosition = 0
            end
          end
        end
        object ppSubReport5: TppSubReport
          OnPrint = ppSubReport5Print
          UserName = 'subSaldoImovel'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ShiftRelativeTo = ppSubReport4
          TraverseAllData = False
          DataPipelineName = 'pplSaldoImovel'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 21431
          mmWidth = 271993
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport5: TppChildReport
            AutoStop = False
            DataPipeline = pplSaldoImovel
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.Orientation = poLandscape
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6615
            PrinterSetup.mmMarginLeft = 13229
            PrinterSetup.mmMarginRight = 11906
            PrinterSetup.mmMarginTop = 6615
            PrinterSetup.mmPaperHeight = 210080
            PrinterSetup.mmPaperWidth = 297128
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Left = 464
            Top = 312
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplSaldoImovel'
            object ppTitleBand5: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 8467
              mmPrintPosition = 0
              object ppLabel217: TppLabel
                UserName = 'Label217'
                Caption = 'RESUMO DE SEGREGAÇÃO SALDOS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3387
                mmLeft = 0
                mmTop = 0
                mmWidth = 50715
                BandType = 1
              end
              object ppLabel218: TppLabel
                UserName = 'Label218'
                Caption = 'Plano'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 0
                mmTop = 5027
                mmWidth = 12171
                BandType = 1
              end
              object ppLabel219: TppLabel
                UserName = 'Label219'
                Caption = 'Patrocinador'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 37306
                mmTop = 4763
                mmWidth = 29369
                BandType = 1
              end
              object ppLabel220: TppLabel
                UserName = 'Label220'
                Caption = '%'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 90488
                mmTop = 4763
                mmWidth = 7673
                BandType = 1
              end
              object ppLabel221: TppLabel
                UserName = 'Label221'
                Caption = 'A Receber(R$)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 108215
                mmTop = 4763
                mmWidth = 22754
                BandType = 1
              end
              object ppLabel223: TppLabel
                UserName = 'Label223'
                Caption = 'A Pagar(R$)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 157957
                mmTop = 4763
                mmWidth = 23019
                BandType = 1
              end
            end
            object ppDetailBand17: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 3175
              mmPrintPosition = 0
              object ppDBText117: TppDBText
                UserName = 'DBText117'
                DataField = 'PLANOPREV'
                DataPipeline = pplSaldoImovel
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplSaldoImovel'
                mmHeight = 3175
                mmLeft = 0
                mmTop = 0
                mmWidth = 36513
                BandType = 4
              end
              object ppDBText118: TppDBText
                UserName = 'DBText118'
                DataField = 'PATROCINADORA'
                DataPipeline = pplSaldoImovel
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplSaldoImovel'
                mmHeight = 3175
                mmLeft = 38100
                mmTop = 0
                mmWidth = 42333
                BandType = 4
              end
              object ppDBText119: TppDBText
                UserName = 'DBText119'
                DataField = 'PERCENTRATEIO'
                DataPipeline = pplSaldoImovel
                DisplayFormat = '###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplSaldoImovel'
                mmHeight = 3175
                mmLeft = 83344
                mmTop = 0
                mmWidth = 15346
                BandType = 4
              end
              object ppDBText120: TppDBText
                UserName = 'DBText120'
                DataField = 'TOT_ARECEBER'
                DataPipeline = pplSaldoImovel
                DisplayFormat = '###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplSaldoImovel'
                mmHeight = 3175
                mmLeft = 101600
                mmTop = 0
                mmWidth = 28840
                BandType = 4
              end
              object ppDBText122: TppDBText
                UserName = 'DBText122'
                DataField = 'TOT_APAGAR'
                DataPipeline = pplSaldoImovel
                DisplayFormat = '###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplSaldoImovel'
                mmHeight = 3175
                mmLeft = 157692
                mmTop = 0
                mmWidth = 23019
                BandType = 4
              end
            end
            object ppSummaryBand12: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
    end
  end
  object qryCCLocatario: TwwQuery
    OnCalcFields = qryCCLocatarioCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATOIMOVEL, C.CONNUMERO, C.CONNOME,'
      ''
      '   P.NOME AS LOCATARIO,'
      ''
      '   I.IDIMOVEL, I.IDIMOVELMESTRE,'
      '   IM.IDIMOVEL AS IDMESTRE, IM.IMONOME AS NOME_MESTRE,'
      ''
      
        '   (IM.IMONOME||'#39' - '#39'||DECODE(CX.CIMDESCRICAO, NULL, I.IMONOME, ' +
        'CX.CIMDESCRICAO)) AS IMOVEL_EXTENSO,'
      ''
      '   T.DESCCUSTORECIMO,'
      ''
      
        '   LI.DATALANCAMENTO, LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.A' +
        'NOCOMPETENCIA,'
      ''
      '   TA.DESCRICAO,'
      ''
      '   D.RECPAG, D.STATUS, D.NODOCUMENTO, D.NUMAPGR,'
      ''
      '   LD.CODDOCUMENTO, LD.CODALTERADOR, LD.OPERACAO,'
      '   LD.VALOR, LD.DEBCRE, LD.HISTORICOCOMPL, LD.DATALANCTO,'
      ''
      '   PFC.NOME AS NF_FORCLI, PFC.RAZAOSOCIAL AS RS_FORCLI,'
      ''
      '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', LI.DATAVENCIMENTO,'
      
        '      DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LI.DATAVENCIMENTO, LD.DATA' +
        'LANCTO)) AS DATA,'
      ''
      '   ('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE(' +
        'LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '   ) AS TOT_RECEBER,'
      ''
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) AS TOT_RECEBIDO,'
      ''
      '   ('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE(' +
        'LD.DEBCRE, '#39'C'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '   ) AS TOT_PAGAR,'
      ''
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) AS TOT_PAGO,'
      ''
      '   ('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE(' +
        'LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0)'
      '   ) AS SALDO_RECEB,'
      ''
      '   ('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE(' +
        'LD.DEBCRE, '#39'C'#39', LD.VALOR, LD.VALOR * -1), 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0)'
      '   ) AS SALDO_PAGAR'
      ''
      'FROM'
      '   PESSOA P, PESSOA PFC,'
      '   DOCUMENTO D, TIPOALTERADOR TA, LANCTODOCUM LD,'
      '   CONTRATOIMOVEL C, IMOVEL I, IMOVEL IM,'
      '   TIPOCUSTORECIMOV T, LANCAMENTOSIMOVEL LI,'
      '   CONTRATOXIMOVEL CX'
      ''
      'WHERE'
      '   1=2 AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL(+) )'
      '   AND ( LI.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      '   AND ( LI.IDIMOVEL = CX.IDIMOVEL )'
      '   AND ( LI.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL )'
      '   AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO(+) )'
      '   AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO(+) )'
      '   AND ( LD.CODALTERADOR = TA.CODALTERADOR(+) )'
      '   AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO )'
      '   AND ( C.IDLOCATARIO = P.IDPESSOA )'
      '   AND ( LI.IDFORCLI = PFC.IDPESSOA )'
      ''
      'ORDER BY'
      '   P.NOME, IM.IMONOME, I.IMONOME,'
      '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', LI.DATAVENCIMENTO,'
      
        '      DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LI.DATAVENCIMENTO, LD.DATA' +
        'LANCTO))')
    ValidateWithMask = True
    Left = 458
    Top = 56
    object StringField66: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCALC'
      Size = 150
      Calculated = True
    end
    object StringField67: TStringField
      FieldKind = fkCalculated
      FieldName = 'CONTRATOEXTENSO'
      Size = 130
      Calculated = True
    end
    object qryCCLocatarioIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryCCLocatarioCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryCCLocatarioCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object qryCCLocatarioLOCATARIO: TStringField
      FieldName = 'LOCATARIO'
      Size = 60
    end
    object qryCCLocatarioIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryCCLocatarioIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object qryCCLocatarioIDMESTRE: TFloatField
      FieldName = 'IDMESTRE'
    end
    object qryCCLocatarioNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object qryCCLocatarioIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryCCLocatarioDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object qryCCLocatarioDATALANCAMENTO: TDateTimeField
      FieldName = 'DATALANCAMENTO'
    end
    object qryCCLocatarioDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryCCLocatarioMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object qryCCLocatarioANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object qryCCLocatarioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryCCLocatarioRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
    object qryCCLocatarioSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object qryCCLocatarioNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object qryCCLocatarioCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryCCLocatarioCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
    end
    object qryCCLocatarioOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 2
    end
    object qryCCLocatarioVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryCCLocatarioDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Size = 1
    end
    object qryCCLocatarioHISTORICOCOMPL: TStringField
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object qryCCLocatarioDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
    end
    object qryCCLocatarioNF_FORCLI: TStringField
      FieldName = 'NF_FORCLI'
      Size = 60
    end
    object qryCCLocatarioRS_FORCLI: TStringField
      FieldName = 'RS_FORCLI'
      Size = 60
    end
    object qryCCLocatarioDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object qryCCLocatarioTOT_RECEBER: TFloatField
      FieldName = 'TOT_RECEBER'
    end
    object qryCCLocatarioTOT_RECEBIDO: TFloatField
      FieldName = 'TOT_RECEBIDO'
    end
    object qryCCLocatarioTOT_PAGAR: TFloatField
      FieldName = 'TOT_PAGAR'
    end
    object qryCCLocatarioTOT_PAGO: TFloatField
      FieldName = 'TOT_PAGO'
    end
    object qryCCLocatarioSALDO_RECEB: TFloatField
      FieldName = 'SALDO_RECEB'
    end
    object qryCCLocatarioSALDO_PAGAR: TFloatField
      FieldName = 'SALDO_PAGAR'
    end
    object qryCCLocatarioNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
    end
  end
  object dsCCLocatario: TwwDataSource
    DataSet = qryCCLocatario
    Left = 458
    Top = 68
  end
  object pplCCLocatario: TppBDEPipeline
    DataSource = dsCCLocatario
    UserName = 'lCCLocatario'
    Left = 458
    Top = 80
    object pplCCLocatarioppField1: TppField
      FieldAlias = 'DESCALC'
      FieldName = 'DESCALC'
      FieldLength = 150
      DisplayWidth = 150
      Position = 0
    end
    object pplCCLocatarioppField2: TppField
      FieldAlias = 'CONTRATOEXTENSO'
      FieldName = 'CONTRATOEXTENSO'
      FieldLength = 130
      DisplayWidth = 130
      Position = 1
    end
    object pplCCLocatarioppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplCCLocatarioppField4: TppField
      FieldAlias = 'CONNUMERO'
      FieldName = 'CONNUMERO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 3
    end
    object pplCCLocatarioppField5: TppField
      FieldAlias = 'CONNOME'
      FieldName = 'CONNOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pplCCLocatarioppField6: TppField
      FieldAlias = 'LOCATARIO'
      FieldName = 'LOCATARIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object pplCCLocatarioppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplCCLocatarioppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVELMESTRE'
      FieldName = 'IDIMOVELMESTRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplCCLocatarioppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDMESTRE'
      FieldName = 'IDMESTRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplCCLocatarioppField10: TppField
      FieldAlias = 'NOME_MESTRE'
      FieldName = 'NOME_MESTRE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 9
    end
    object pplCCLocatarioppField11: TppField
      FieldAlias = 'IMOVEL_EXTENSO'
      FieldName = 'IMOVEL_EXTENSO'
      FieldLength = 123
      DisplayWidth = 123
      Position = 10
    end
    object pplCCLocatarioppField12: TppField
      FieldAlias = 'DESCCUSTORECIMO'
      FieldName = 'DESCCUSTORECIMO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 11
    end
    object pplCCLocatarioppField13: TppField
      FieldAlias = 'DATALANCAMENTO'
      FieldName = 'DATALANCAMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 12
    end
    object pplCCLocatarioppField14: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 13
    end
    object pplCCLocatarioppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'MESCOMPETENCIA'
      FieldName = 'MESCOMPETENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplCCLocatarioppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANOCOMPETENCIA'
      FieldName = 'ANOCOMPETENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplCCLocatarioppField17: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 35
      DisplayWidth = 35
      Position = 16
    end
    object pplCCLocatarioppField18: TppField
      FieldAlias = 'RECPAG'
      FieldName = 'RECPAG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 17
    end
    object pplCCLocatarioppField19: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 18
    end
    object pplCCLocatarioppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplCCLocatarioppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplCCLocatarioppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODALTERADOR'
      FieldName = 'CODALTERADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplCCLocatarioppField23: TppField
      FieldAlias = 'OPERACAO'
      FieldName = 'OPERACAO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 22
    end
    object pplCCLocatarioppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplCCLocatarioppField25: TppField
      FieldAlias = 'DEBCRE'
      FieldName = 'DEBCRE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 24
    end
    object pplCCLocatarioppField26: TppField
      FieldAlias = 'HISTORICOCOMPL'
      FieldName = 'HISTORICOCOMPL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 25
    end
    object pplCCLocatarioppField27: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 26
    end
    object pplCCLocatarioppField28: TppField
      FieldAlias = 'NF_FORCLI'
      FieldName = 'NF_FORCLI'
      FieldLength = 60
      DisplayWidth = 60
      Position = 27
    end
    object pplCCLocatarioppField29: TppField
      FieldAlias = 'RS_FORCLI'
      FieldName = 'RS_FORCLI'
      FieldLength = 60
      DisplayWidth = 60
      Position = 28
    end
    object pplCCLocatarioppField30: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 29
    end
    object pplCCLocatarioppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_RECEBER'
      FieldName = 'TOT_RECEBER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object pplCCLocatarioppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_RECEBIDO'
      FieldName = 'TOT_RECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object pplCCLocatarioppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_PAGAR'
      FieldName = 'TOT_PAGAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object pplCCLocatarioppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_PAGO'
      FieldName = 'TOT_PAGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object pplCCLocatarioppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO_RECEB'
      FieldName = 'SALDO_RECEB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object pplCCLocatarioppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO_PAGAR'
      FieldName = 'SALDO_PAGAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object pplCCLocatarioppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMAPGR'
      FieldName = 'NUMAPGR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
  end
  object rptCCMestre: TppReport
    AutoStop = False
    DataPipeline = pplCCMestre
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 11906
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 378
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplCCMestre'
    object ppHeaderBand8: TppHeaderBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 39423
      mmPrintPosition = 0
      object ppLabel6: TppLabel
        UserName = 'ppLabel6'
        AutoSize = False
        Caption = 'Conta Corrente por Imóvel Mestre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 37306
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel29: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel29'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 37306
        mmTop = 1588
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'ppLabel30'
        Caption = 'Mês de Competência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 18521
        mmWidth = 33338
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'ppLabel32'
        Caption = 'Período de Datas:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 21960
        mmWidth = 26988
        BandType = 0
      end
      object rptCCMestre_lblCompetencia: TppLabel
        UserName = 'rptCCMestre_lblCompetencia'
        Caption = 'rptCCMestre_lblCompetencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 18521
        mmWidth = 35719
        BandType = 0
      end
      object rptCCMestre_lblDatas: TppLabel
        UserName = 'rptCCMestre_lblDatas'
        Caption = 'rptCCMestre_lblDatas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 21960
        mmWidth = 26988
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'ppLabel50'
        Caption = 'Tipo de Receita / Despesa:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 187061
        mmTop = 21960
        mmWidth = 39688
        BandType = 0
      end
      object rptCCMestre_lblTipoRecDes: TppLabel
        UserName = 'rptCCMestre_lblTipoRecDes'
        AutoSize = False
        Caption = 'rptCCMestre_lblTipoRecDes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 226484
        mmTop = 21960
        mmWidth = 45773
        BandType = 0
      end
      object rptCCMestre_lblRecPag: TppLabel
        UserName = 'rptCCMestre_lblRecPag'
        AutoSize = False
        Caption = 'rptCCMestre_lblRecPag'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 226484
        mmTop = 27252
        mmWidth = 45773
        BandType = 0
      end
      object rptCCMestre_lblPrevEfetivo: TppLabel
        UserName = 'rptCCMestre_lblPrevEfetivo'
        AutoSize = False
        Caption = 'rptCCMestre_lblPrevEfetivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 226484
        mmTop = 31485
        mmWidth = 45773
        BandType = 0
      end
      object rptCCMestre_lblEmAberto: TppLabel
        UserName = 'rptCCMestre_lblEmAberto'
        AutoSize = False
        Caption = 'Apenas lançamentos em aberto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 226484
        mmTop = 35719
        mmWidth = 45773
        BandType = 0
      end
      object rptCCMestre_lblTipoData: TppLabel
        UserName = 'rptCCMestre_lblTipoData'
        Caption = 'por Data de Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 33073
        mmTop = 35719
        mmWidth = 30692
        BandType = 0
      end
      object rptCCMestre_lblTipoImovel: TppLabel
        UserName = 'rptCCMestre_lblTipoImovel'
        AutoSize = False
        Caption = 'Todos os Tipos de Imóvel / Segmento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 84667
        mmTop = 31485
        mmWidth = 102659
        BandType = 0
      end
      object ppLogoCCImovelMestre: TppImage
        UserName = 'ppLogoCCImovelMestre'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 20108
      mmPrintPosition = 0
      object rptCCMestre_FundoBandaDetalhe: TppShape
        OnPrint = rptFolhaAluguel_FundoBandaDetalhePrint
        UserName = 'rptCCMestre_FundoBandaDetalhe'
        Brush.Color = 13040076
        ParentHeight = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 20108
        mmLeft = 0
        mmTop = 0
        mmWidth = 272257
        BandType = 4
      end
      object rptCCMestre_Separador: TppLine
        OnPrint = rptCCContrato_SeparadorPrint
        UserName = 'rptCCMestre_Separador'
        ParentHeight = True
        ParentWidth = True
        StretchWithParent = True
        Visible = False
        Weight = 0.75
        mmHeight = 20108
        mmLeft = 0
        mmTop = 0
        mmWidth = 271993
        BandType = 4
      end
      object ppDBMemo6: TppDBMemo
        UserName = 'ppDBMemo6'
        CharWrap = True
        DataField = 'IMONOME'
        DataPipeline = pplCCMestre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCMestre'
        mmHeight = 15875
        mmLeft = 0
        mmTop = 794
        mmWidth = 42863
        BandType = 4
        mmBottomOffset = 529
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo7: TppDBMemo
        UserName = 'ppDBMemo7'
        CharWrap = True
        DataField = 'DESCCUSTORECIMO'
        DataPipeline = pplCCMestre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCMestre'
        mmHeight = 15875
        mmLeft = 95779
        mmTop = 794
        mmWidth = 30427
        BandType = 4
        mmBottomOffset = 529
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText4: TppDBText
        UserName = 'ppDBText4'
        BlankWhenZero = True
        DataField = 'TOT_PAGO'
        DataPipeline = pplCCMestre
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestre'
        mmHeight = 2646
        mmLeft = 229130
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'ppDBText9'
        DataField = 'DATA'
        DataPipeline = pplCCMestre
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplCCMestre'
        mmHeight = 2646
        mmLeft = 258234
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppLabel70: TppLabel
        UserName = 'ppLabel70'
        AutoSize = False
        Caption = ' / '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 249238
        mmTop = 794
        mmWidth = 2381
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'ppDBText10'
        DataField = 'MESCOMPETENCIA'
        DataPipeline = pplCCMestre
        DisplayFormat = '00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCMestre'
        mmHeight = 2646
        mmLeft = 246328
        mmTop = 794
        mmWidth = 3175
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'ppDBText11'
        DataField = 'ANOCOMPETENCIA'
        DataPipeline = pplCCMestre
        DisplayFormat = '0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCMestre'
        mmHeight = 2646
        mmLeft = 251355
        mmTop = 794
        mmWidth = 6350
        BandType = 4
      end
      object ppDBMemo8: TppDBMemo
        UserName = 'ppDBMemo8'
        CharWrap = True
        DataField = 'DESCALC'
        DataPipeline = pplCCMestre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCMestre'
        mmHeight = 15875
        mmLeft = 127000
        mmTop = 794
        mmWidth = 25400
        BandType = 4
        mmBottomOffset = 529
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText25: TppDBText
        UserName = 'ppDBText25'
        BlankWhenZero = True
        DataField = 'TOT_PAGAR'
        DataPipeline = pplCCMestre
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestre'
        mmHeight = 2646
        mmLeft = 213784
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'ppDBText26'
        BlankWhenZero = True
        DataField = 'TOT_RECEBIDO'
        DataPipeline = pplCCMestre
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestre'
        mmHeight = 2646
        mmLeft = 198438
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText45: TppDBText
        UserName = 'ppDBText45'
        BlankWhenZero = True
        DataField = 'TOT_RECEBER'
        DataPipeline = pplCCMestre
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestre'
        mmHeight = 2646
        mmLeft = 183092
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBMemo9: TppDBMemo
        UserName = 'ppDBMemo9'
        CharWrap = True
        DataField = 'NF_FORCLI'
        DataPipeline = pplCCMestre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCMestre'
        mmHeight = 15875
        mmLeft = 43656
        mmTop = 794
        mmWidth = 51329
        BandType = 4
        mmBottomOffset = 529
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText46: TppDBText
        UserName = 'ppDBText46'
        DataField = 'NODOCUMENTO'
        DataPipeline = pplCCMestre
        DisplayFormat = '####################0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCMestre'
        mmHeight = 2646
        mmLeft = 153194
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
      object rptCCMestreDBText1: TppDBText
        UserName = 'rptCCMestreDBText1'
        BlankWhenZero = True
        DataField = 'NUMAPGR'
        DataPipeline = pplCCMestre
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestre'
        mmHeight = 2381
        mmLeft = 173302
        mmTop = 794
        mmWidth = 8731
        BandType = 4
      end
    end
    object ppFooterBand8: TppFooterBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine8: TppLine
        UserName = 'ppLine8'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 271993
        BandType = 8
      end
      object ppLabel99: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel99'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc15: TppSystemVariable
        UserName = 'Calc15'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 114300
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc16: TppSystemVariable
        UserName = 'Calc16'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 236803
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppShape7: TppShape
        UserName = 'Shape7'
        Pen.Width = 2
        mmHeight = 5027
        mmLeft = 182298
        mmTop = 5821
        mmWidth = 63500
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'TOT_PAGAR'
        DataPipeline = pplCCMestre
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestre'
        mmHeight = 2646
        mmLeft = 214048
        mmTop = 6879
        mmWidth = 15081
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'TOT_PAGO'
        DataPipeline = pplCCMestre
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestre'
        mmHeight = 2646
        mmLeft = 229394
        mmTop = 6879
        mmWidth = 15081
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'TOT_RECEBER'
        DataPipeline = pplCCMestre
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestre'
        mmHeight = 2646
        mmLeft = 183357
        mmTop = 6879
        mmWidth = 15081
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'TOT_RECEBIDO'
        DataPipeline = pplCCMestre
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestre'
        mmHeight = 2646
        mmLeft = 198702
        mmTop = 6879
        mmWidth = 15081
        BandType = 7
      end
      object ppLabel52: TppLabel
        UserName = 'Label52'
        Caption = 'Total Geral:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 166688
        mmTop = 6879
        mmWidth = 15875
        BandType = 7
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        Pen.Width = 2
        mmHeight = 5027
        mmLeft = 182298
        mmTop = 10054
        mmWidth = 63500
        BandType = 7
      end
      object ppLabel53: TppLabel
        UserName = 'Label53'
        Caption = 'Saldo:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 172509
        mmTop = 10848
        mmWidth = 10054
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc11'
        DataField = 'SALDO_RECEB'
        DataPipeline = pplCCMestre
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestre'
        mmHeight = 2646
        mmLeft = 183357
        mmTop = 11113
        mmWidth = 15081
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'SALDO_PAGAR'
        DataPipeline = pplCCMestre
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestre'
        mmHeight = 2646
        mmLeft = 214048
        mmTop = 11113
        mmWidth = 15081
        BandType = 7
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'NOME_MESTRE'
      DataPipeline = pplCCMestre
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 13229
      DataPipelineName = 'pplCCMestre'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
        BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
        mmBottomOffset = 40
        mmHeight = 13758
        mmPrintPosition = 0
        object ppLine9: TppLine
          UserName = 'ppLine9'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 10054
          mmWidth = 271993
          BandType = 3
          GroupNo = 0
        end
        object ppLabel100: TppLabel
          UserName = 'ppLabel100'
          Caption = 'Imóvel Mestre:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 0
          mmTop = 6350
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object ppLine10: TppLine
          UserName = 'ppLine10'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 13494
          mmWidth = 271993
          BandType = 3
          GroupNo = 0
        end
        object ppLabel101: TppLabel
          UserName = 'ppLabel101'
          Caption = 'Imóvel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 0
          mmTop = 10583
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppDBText49: TppDBText
          UserName = 'ppDBText49'
          AutoSize = True
          DataField = 'NOME_MESTRE'
          DataPipeline = pplCCMestre
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplCCMestre'
          mmHeight = 2910
          mmLeft = 19050
          mmTop = 6350
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object ppLabel103: TppLabel
          UserName = 'ppLabel103'
          Caption = 'Tipo Receita / Despesa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 95779
          mmTop = 10583
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
        end
        object ppLabel104: TppLabel
          UserName = 'ppLabel104'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 262467
          mmTop = 10583
          mmWidth = 5292
          BandType = 3
          GroupNo = 0
        end
        object ppLabel108: TppLabel
          UserName = 'ppLabel108'
          Caption = 'Alterador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 134409
          mmTop = 10583
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppLabel109: TppLabel
          UserName = 'ppLabel109'
          Caption = 'Compet.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 246328
          mmTop = 10583
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object ppLabel110: TppLabel
          UserName = 'ppLabel110'
          Caption = 'A Pagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 219869
          mmTop = 10583
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object ppLabel111: TppLabel
          UserName = 'ppLabel111'
          Caption = 'Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 238125
          mmTop = 10583
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object ppLabel113: TppLabel
          UserName = 'ppLabel113'
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 202142
          mmTop = 10583
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object ppLabel114: TppLabel
          UserName = 'ppLabel114'
          Caption = 'A Receber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 186267
          mmTop = 10583
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel115: TppLabel
          UserName = 'ppLabel115'
          Caption = 'Favorecido / Debitado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 43656
          mmTop = 10583
          mmWidth = 26723
          BandType = 3
          GroupNo = 0
        end
        object ppLabel117: TppLabel
          UserName = 'ppLabel117'
          Caption = 'Nº Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 153194
          mmTop = 10583
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rptCCMestreLabel1: TppLabel
          UserName = 'rptCCMestreLabel1'
          Caption = 'Nº AP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 175684
          mmTop = 10583
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
        BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
        mmBottomOffset = 40
        mmHeight = 15610
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'ppShape1'
          Pen.Width = 2
          mmHeight = 5027
          mmLeft = 182034
          mmTop = 3969
          mmWidth = 63500
          BandType = 5
          GroupNo = 0
        end
        object ppLine13: TppLine
          UserName = 'ppLine13'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 271993
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'ppDBCalc1'
          DataField = 'TOT_PAGAR'
          DataPipeline = pplCCMestre
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestre'
          mmHeight = 2646
          mmLeft = 213784
          mmTop = 5027
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'ppDBCalc2'
          DataField = 'TOT_PAGO'
          DataPipeline = pplCCMestre
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestre'
          mmHeight = 2646
          mmLeft = 229130
          mmTop = 5027
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'ppDBCalc3'
          DataField = 'TOT_RECEBER'
          DataPipeline = pplCCMestre
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestre'
          mmHeight = 2646
          mmLeft = 183092
          mmTop = 5027
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'ppDBCalc4'
          DataField = 'TOT_RECEBIDO'
          DataPipeline = pplCCMestre
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestre'
          mmHeight = 2646
          mmLeft = 198438
          mmTop = 5027
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppLabel118: TppLabel
          UserName = 'ppLabel118'
          Caption = 'Total do Imóvel Mestre:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 152665
          mmTop = 5027
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
        object ppShape2: TppShape
          UserName = 'ppShape2'
          Pen.Width = 2
          mmHeight = 5027
          mmLeft = 182034
          mmTop = 8202
          mmWidth = 63500
          BandType = 5
          GroupNo = 0
        end
        object ppLabel119: TppLabel
          UserName = 'ppLabel119'
          Caption = 'Saldo:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 172244
          mmTop = 8996
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'ppDBCalc8'
          DataField = 'SALDO_RECEB'
          DataPipeline = pplCCMestre
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestre'
          mmHeight = 2646
          mmLeft = 183092
          mmTop = 9260
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'ppDBCalc9'
          DataField = 'SALDO_PAGAR'
          DataPipeline = pplCCMestre
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestre'
          mmHeight = 2646
          mmLeft = 213784
          mmTop = 9260
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object rptCCLocatario: TppReport
    AutoStop = False
    DataPipeline = pplCCLocatario
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 11906
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 458
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplCCLocatario'
    object ppHeaderBand16: TppHeaderBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 39423
      mmPrintPosition = 0
      object ppLabel48: TppLabel
        UserName = 'ppLabel48'
        AutoSize = False
        Caption = 'Conta Corrente por Locatário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 37835
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel49: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel49'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 37835
        mmTop = 1588
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'ppLabel61'
        Caption = 'Mês de Competência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 18521
        mmWidth = 33338
        BandType = 0
      end
      object ppLabel102: TppLabel
        UserName = 'ppLabel102'
        Caption = 'Período de Datas:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 21960
        mmWidth = 26988
        BandType = 0
      end
      object rptCCLocatario_lblCompetencia: TppLabel
        UserName = 'rptCCLocatario_lblCompetencia'
        Caption = 'rptCCLocatario_lblCompetencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 18521
        mmWidth = 38365
        BandType = 0
      end
      object rptCCLocatario_lblDatas: TppLabel
        UserName = 'rptCCLocatario_lblDatas'
        Caption = 'rptCCLocatario_lblDatas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 21960
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel134: TppLabel
        UserName = 'ppLabel134'
        Caption = 'Tipo de Receita / Despesa:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 187061
        mmTop = 21960
        mmWidth = 39688
        BandType = 0
      end
      object rptCCLocatario_lblTipoRecDes: TppLabel
        UserName = 'rptCCLocatario_lblTipoRecDes'
        AutoSize = False
        Caption = 'rptCCLocatario_lblTipoRecDes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 226484
        mmTop = 21960
        mmWidth = 45773
        BandType = 0
      end
      object rptCCLocatario_lblRecPag: TppLabel
        UserName = 'rptCCLocatario_lblRecPag'
        AutoSize = False
        Caption = 'rptCCLocatario_lblRecPag'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 226484
        mmTop = 27252
        mmWidth = 45773
        BandType = 0
      end
      object rptCCLocatario_lblPrevEfetivo: TppLabel
        UserName = 'rptCCLocatario_lblPrevEfetivo'
        AutoSize = False
        Caption = 'rptCCLocatario_lblPrevEfetivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 226484
        mmTop = 31485
        mmWidth = 45773
        BandType = 0
      end
      object rptCCLocatario_lblContratosVigentes: TppLabel
        UserName = 'rptCCLocatario_lblContratosVigentes'
        Caption = 'Apenas Contratos vigentes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 33073
        mmTop = 31485
        mmWidth = 34925
        BandType = 0
      end
      object rptCCLocatario_lblEmAberto: TppLabel
        UserName = 'rptCCLocatario_lblEmAberto'
        AutoSize = False
        Caption = 'Apenas lançamentos em aberto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 226484
        mmTop = 35719
        mmWidth = 45773
        BandType = 0
      end
      object rptCCLocatario_lblTipoData: TppLabel
        UserName = 'rptCCLocatario_lblTipoData'
        Caption = 'por Data de Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 33073
        mmTop = 35719
        mmWidth = 30692
        BandType = 0
      end
      object rptCCLocatario_lblTipoImovel: TppLabel
        UserName = 'rptCCLocatario_lblTipoImovel'
        AutoSize = False
        Caption = 'Todos os Tipos de Imóvel / Segmento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 84667
        mmTop = 31485
        mmWidth = 102659
        BandType = 0
      end
      object ppLogoCCLocatario: TppImage
        UserName = 'ppLogoCCLocatario'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand13: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 20108
      mmPrintPosition = 0
      object rptCCLocatario_FundoBandaDetalhe: TppShape
        OnPrint = rptFolhaAluguel_FundoBandaDetalhePrint
        UserName = 'rptCCLocatario_FundoBandaDetalhe'
        Brush.Color = 13040076
        ParentHeight = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 20108
        mmLeft = 0
        mmTop = 0
        mmWidth = 272257
        BandType = 4
      end
      object rptCCLocatario_Separador: TppLine
        OnPrint = rptCCContrato_SeparadorPrint
        UserName = 'rptCCLocatario_Separador'
        ParentHeight = True
        ParentWidth = True
        StretchWithParent = True
        Visible = False
        Weight = 0.75
        mmHeight = 20108
        mmLeft = 0
        mmTop = 0
        mmWidth = 271993
        BandType = 4
      end
      object ppDBMemo10: TppDBMemo
        UserName = 'ppDBMemo10'
        CharWrap = True
        DataField = 'IMOVEL_EXTENSO'
        DataPipeline = pplCCLocatario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCLocatario'
        mmHeight = 15875
        mmLeft = 0
        mmTop = 794
        mmWidth = 49742
        BandType = 4
        mmBottomOffset = 529
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo17: TppDBMemo
        UserName = 'ppDBMemo17'
        CharWrap = True
        DataField = 'DESCCUSTORECIMO'
        DataPipeline = pplCCLocatario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCLocatario'
        mmHeight = 15875
        mmLeft = 108479
        mmTop = 794
        mmWidth = 27252
        BandType = 4
        mmBottomOffset = 529
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText27: TppDBText
        UserName = 'ppDBText27'
        BlankWhenZero = True
        DataField = 'TOT_PAGO'
        DataPipeline = pplCCLocatario
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCLocatario'
        mmHeight = 2646
        mmLeft = 230982
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'ppDBText51'
        DataField = 'DATA'
        DataPipeline = pplCCLocatario
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplCCLocatario'
        mmHeight = 2646
        mmLeft = 259028
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppLabel145: TppLabel
        UserName = 'ppLabel145'
        AutoSize = False
        Caption = ' / '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 250032
        mmTop = 794
        mmWidth = 2381
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'ppDBText52'
        DataField = 'MESCOMPETENCIA'
        DataPipeline = pplCCLocatario
        DisplayFormat = '00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCLocatario'
        mmHeight = 2646
        mmLeft = 247121
        mmTop = 794
        mmWidth = 3175
        BandType = 4
      end
      object ppDBText53: TppDBText
        UserName = 'ppDBText53'
        DataField = 'ANOCOMPETENCIA'
        DataPipeline = pplCCLocatario
        DisplayFormat = '0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCLocatario'
        mmHeight = 2646
        mmLeft = 252148
        mmTop = 794
        mmWidth = 6350
        BandType = 4
      end
      object ppDBMemo20: TppDBMemo
        UserName = 'ppDBMemo20'
        CharWrap = True
        DataField = 'DESCALC'
        DataPipeline = pplCCLocatario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCLocatario'
        mmHeight = 15875
        mmLeft = 136261
        mmTop = 794
        mmWidth = 21696
        BandType = 4
        mmBottomOffset = 529
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText54: TppDBText
        UserName = 'ppDBText54'
        BlankWhenZero = True
        DataField = 'TOT_PAGAR'
        DataPipeline = pplCCLocatario
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCLocatario'
        mmHeight = 2646
        mmLeft = 215636
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText55: TppDBText
        UserName = 'ppDBText55'
        BlankWhenZero = True
        DataField = 'TOT_RECEBIDO'
        DataPipeline = pplCCLocatario
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCLocatario'
        mmHeight = 2646
        mmLeft = 200290
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText56: TppDBText
        UserName = 'ppDBText56'
        BlankWhenZero = True
        DataField = 'TOT_RECEBER'
        DataPipeline = pplCCLocatario
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCLocatario'
        mmHeight = 2646
        mmLeft = 184944
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBMemo22: TppDBMemo
        UserName = 'ppDBMemo22'
        CharWrap = True
        DataField = 'NF_FORCLI'
        DataPipeline = pplCCLocatario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCLocatario'
        mmHeight = 15875
        mmLeft = 66146
        mmTop = 794
        mmWidth = 41804
        BandType = 4
        mmBottomOffset = 529
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText57: TppDBText
        UserName = 'ppDBText57'
        DataField = 'NODOCUMENTO'
        DataPipeline = pplCCLocatario
        DisplayFormat = '####################0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCLocatario'
        mmHeight = 2646
        mmLeft = 158486
        mmTop = 794
        mmWidth = 16933
        BandType = 4
      end
      object rptCCLocatarioDBText1: TppDBText
        UserName = 'rptCCLocatarioDBText1'
        BlankWhenZero = True
        DataField = 'NUMAPGR'
        DataPipeline = pplCCLocatario
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCLocatario'
        mmHeight = 2381
        mmLeft = 175684
        mmTop = 794
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        BlankWhenZero = True
        DataField = 'CONNUMERO'
        DataPipeline = pplCCLocatario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCLocatario'
        mmHeight = 2381
        mmLeft = 50536
        mmTop = 794
        mmWidth = 14817
        BandType = 4
      end
    end
    object ppFooterBand16: TppFooterBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine16: TppLine
        UserName = 'ppLine16'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 271993
        BandType = 8
      end
      object ppLabel146: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel146'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc17: TppSystemVariable
        UserName = 'Calc17'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 114829
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc18: TppSystemVariable
        UserName = 'Calc18'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 236803
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'LOCATARIO'
      DataPipeline = pplCCLocatario
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 13229
      DataPipelineName = 'pplCCLocatario'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
        BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
        mmBottomOffset = 40
        mmHeight = 13758
        mmPrintPosition = 0
        object ppLine18: TppLine
          UserName = 'ppLine18'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 10054
          mmWidth = 271993
          BandType = 3
          GroupNo = 0
        end
        object ppLine19: TppLine
          UserName = 'ppLine19'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 13494
          mmWidth = 271993
          BandType = 3
          GroupNo = 0
        end
        object ppLabel151: TppLabel
          UserName = 'ppLabel151'
          Caption = 'Imóvel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 0
          mmTop = 10583
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object ppLabel156: TppLabel
          UserName = 'ppLabel156'
          Caption = 'Locatário:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 0
          mmTop = 6615
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object ppDBText65: TppDBText
          UserName = 'ppDBText65'
          AutoSize = True
          DataField = 'LOCATARIO'
          DataPipeline = pplCCLocatario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplCCLocatario'
          mmHeight = 2910
          mmLeft = 14288
          mmTop = 6615
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppLabel159: TppLabel
          UserName = 'ppLabel159'
          Caption = 'Tipo Receita / Despesa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 108479
          mmTop = 10583
          mmWidth = 26723
          BandType = 3
          GroupNo = 0
        end
        object ppLabel160: TppLabel
          UserName = 'ppLabel160'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 262467
          mmTop = 10583
          mmWidth = 5292
          BandType = 3
          GroupNo = 0
        end
        object ppLabel161: TppLabel
          UserName = 'ppLabel161'
          Caption = 'Alterador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 140494
          mmTop = 10583
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppLabel163: TppLabel
          UserName = 'ppLabel163'
          Caption = 'Compet.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 247121
          mmTop = 10583
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLabel164: TppLabel
          UserName = 'ppLabel164'
          Caption = 'A Pagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 221721
          mmTop = 10583
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object ppLabel165: TppLabel
          UserName = 'ppLabel165'
          Caption = 'Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 239978
          mmTop = 10583
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object ppLabel168: TppLabel
          UserName = 'ppLabel168'
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 203994
          mmTop = 10583
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object ppLabel169: TppLabel
          UserName = 'ppLabel169'
          Caption = 'A Receber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 188119
          mmTop = 10583
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel170: TppLabel
          UserName = 'ppLabel170'
          Caption = 'Favorecido / Debitado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 66146
          mmTop = 10583
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppLabel171: TppLabel
          UserName = 'ppLabel171'
          Caption = 'Nº Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 158486
          mmTop = 10583
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object rptCCLocatarioLabel1: TppLabel
          UserName = 'rptCCLocatarioLabel1'
          Caption = 'Nº AP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 178065
          mmTop = 10583
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object ppLabel54: TppLabel
          UserName = 'ppLabel1701'
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 50536
          mmTop = 10583
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
        BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
        mmBottomOffset = 40
        mmHeight = 17727
        mmPrintPosition = 0
        object ppShape5: TppShape
          UserName = 'ppShape5'
          Pen.Width = 2
          mmHeight = 5027
          mmLeft = 183886
          mmTop = 3969
          mmWidth = 63500
          BandType = 5
          GroupNo = 0
        end
        object ppLine20: TppLine
          UserName = 'ppLine20'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 271993
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc26: TppDBCalc
          UserName = 'ppDBCalc26'
          DataField = 'TOT_PAGAR'
          DataPipeline = pplCCLocatario
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCLocatario'
          mmHeight = 2646
          mmLeft = 215636
          mmTop = 5027
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc27: TppDBCalc
          UserName = 'ppDBCalc27'
          DataField = 'TOT_PAGO'
          DataPipeline = pplCCLocatario
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCLocatario'
          mmHeight = 2646
          mmLeft = 230982
          mmTop = 5027
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc28: TppDBCalc
          UserName = 'ppDBCalc28'
          DataField = 'TOT_RECEBER'
          DataPipeline = pplCCLocatario
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCLocatario'
          mmHeight = 2646
          mmLeft = 184944
          mmTop = 5027
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc29: TppDBCalc
          UserName = 'ppDBCalc29'
          DataField = 'TOT_RECEBIDO'
          DataPipeline = pplCCLocatario
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCLocatario'
          mmHeight = 2646
          mmLeft = 200290
          mmTop = 5027
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppLabel172: TppLabel
          UserName = 'ppLabel172'
          Caption = 'Total do Contrato:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 159809
          mmTop = 5027
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object ppShape6: TppShape
          UserName = 'ppShape6'
          Pen.Width = 2
          mmHeight = 5027
          mmLeft = 183886
          mmTop = 8202
          mmWidth = 63500
          BandType = 5
          GroupNo = 0
        end
        object ppLabel173: TppLabel
          UserName = 'ppLabel173'
          Caption = 'Saldo:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 174096
          mmTop = 8996
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc30: TppDBCalc
          UserName = 'ppDBCalc30'
          DataField = 'SALDO_RECEB'
          DataPipeline = pplCCLocatario
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCLocatario'
          mmHeight = 2646
          mmLeft = 184944
          mmTop = 9260
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc31: TppDBCalc
          UserName = 'ppDBCalc31'
          DataField = 'SALDO_PAGAR'
          DataPipeline = pplCCLocatario
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCLocatario'
          mmHeight = 2646
          mmLeft = 215636
          mmTop = 9260
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object dsInadimplenciaContrato: TwwDataSource
    DataSet = qryInadimplenciaContrato
    Left = 256
    Top = 196
  end
  object pplInadimplenciaContrato: TppBDEPipeline
    DataSource = dsInadimplenciaContrato
    UserName = 'lInadimplenciaContrato'
    Left = 256
    Top = 208
    object pplInadimplenciaContratoppField1: TppField
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplInadimplenciaContratoppField2: TppField
      FieldAlias = 'NUMERO_CONTRATO'
      FieldName = 'NUMERO_CONTRATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplInadimplenciaContratoppField3: TppField
      FieldAlias = 'NOME_CONTRATO'
      FieldName = 'NOME_CONTRATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplInadimplenciaContratoppField4: TppField
      FieldAlias = 'CONDATAINICIO'
      FieldName = 'CONDATAINICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplInadimplenciaContratoppField5: TppField
      FieldAlias = 'CONDATAFIM'
      FieldName = 'CONDATAFIM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplInadimplenciaContratoppField6: TppField
      FieldAlias = 'IDLOCATARIO'
      FieldName = 'IDLOCATARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pfldInadimplenciaContratoppField7: TppField
      FieldAlias = 'NF_LOCATARIO'
      FieldName = 'NF_LOCATARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pfldInadimplenciaContratoppField8: TppField
      FieldAlias = 'RS_LOCATARIO'
      FieldName = 'RS_LOCATARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplInadimplenciaContratoppField7: TppField
      FieldAlias = 'IDADMINIMOVEL'
      FieldName = 'IDADMINIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplInadimplenciaContratoppField8: TppField
      FieldAlias = 'NF_ADMINISTRADORA'
      FieldName = 'NF_ADMINISTRADORA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplInadimplenciaContratoppField9: TppField
      FieldAlias = 'RS_ADMINISTRADORA'
      FieldName = 'RS_ADMINISTRADORA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplInadimplenciaContratoppField10: TppField
      FieldAlias = 'TOT_RECEBER'
      FieldName = 'TOT_RECEBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplInadimplenciaContratoppField11: TppField
      FieldAlias = 'DESCR_SITCONTR'
      FieldName = 'DESCR_SITCONTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
  end
  object rptInadimplenciaContrato: TppReport
    AutoStop = False
    DataPipeline = pplInadimplenciaContrato
    NoDataBehaviors = [ndMessageOnPage, ndBlankReport]
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13229
    PrinterSetup.mmMarginLeft = 6615
    PrinterSetup.mmMarginRight = 6615
    PrinterSetup.mmMarginTop = 13229
    PrinterSetup.mmPaperHeight = 297128
    PrinterSetup.mmPaperWidth = 210080
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 256
    Top = 152
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplInadimplenciaContrato'
    object ppHeaderBand23: TppHeaderBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 40217
      mmPrintPosition = 0
      object ppLabel187: TppLabel
        UserName = 'ppLabel187'
        AutoSize = False
        Caption = 'Inadimplência por Contrato - Sintético ( Correção Diária )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8731
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel239: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel239'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1588
        mmWidth = 196850
        BandType = 0
      end
      object ppLine82: TppLine
        UserName = 'ppLine82'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 39688
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel242: TppLabel
        UserName = 'ppLabel242'
        Caption = 'Locatário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 20373
        mmTop = 36248
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel243: TppLabel
        UserName = 'ppLabel243'
        Caption = 'Vigência do Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 114036
        mmTop = 35983
        mmWidth = 30427
        BandType = 0
      end
      object ppLabel244: TppLabel
        UserName = 'ppLabel244'
        Caption = 'Administradora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 67998
        mmTop = 35983
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel251: TppLabel
        UserName = 'ppLabel251'
        Caption = 'Nº Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 35983
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel256: TppLabel
        UserName = 'ppLabel256'
        Caption = 'Mês de competência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 2381
        mmTop = 20108
        mmWidth = 30427
        BandType = 0
      end
      object rptInadimplenciaContratoLabel1: TppLabel
        UserName = 'rptInadimplenciaContratoLabel1'
        Caption = 'Valor Devido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 35983
        mmWidth = 18256
        BandType = 0
      end
      object rptInadimplenciaContratoLabel3: TppLabel
        UserName = 'rptInadimplenciaContratoLabel3'
        Caption = 'Data Limite:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 118534
        mmTop = 19579
        mmWidth = 17992
        BandType = 0
      end
      object rptInadimplenciaContratolblMesCompetencia: TppLabel
        UserName = 'rptInadimplenciaContratolblMesCompetencia'
        Caption = 'rptInadimplenciaContratolblMesCompetencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 32544
        mmTop = 20108
        mmWidth = 56621
        BandType = 0
      end
      object rptInadimplenciaContratolblDataLimite: TppLabel
        UserName = 'rptInadimplenciaContratolblDataLimite'
        Caption = 'rptInadimplenciaContratolblDataLimite'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 136261
        mmTop = 19579
        mmWidth = 48154
        BandType = 0
      end
      object ppLogoInadimplContrato: TppImage
        UserName = 'ppLogoInadimplContrato'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel155: TppLabel
        UserName = 'Label155'
        Caption = 'Responsável:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 12435
        mmTop = 24077
        mmWidth = 20108
        BandType = 0
      end
      object rptInadimplenciaContratolblResponsavel1: TppLabel
        UserName = 'rptInadimplenciaContratolblResponsavel1'
        Caption = '<Todos>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 32279
        mmTop = 24077
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel183: TppLabel
        UserName = 'Label183'
        Caption = 'Última atualização:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 109538
        mmTop = 23019
        mmWidth = 27252
        BandType = 0
      end
      object rptInadimplContratolblDataAtualiza1: TppLabel
        UserName = 'rptInadimplContratolblDataAtualiza1'
        Caption = 'rptInadimplContratolblDataAtualiza1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 136790
        mmTop = 23019
        mmWidth = 45244
        BandType = 0
      end
      object plbl1: TppLabel
        UserName = 'plbl1'
        Caption = 'Situação Contratual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 147638
        mmTop = 35983
        mmWidth = 29104
        BandType = 0
      end
    end
    object ppDetailBand23: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 18521
      mmPrintPosition = 0
      object rptInadimplenciaContratoShape2: TppShape
        OnPrint = rptFolhaAluguel_FundoBandaDetalhePrint
        UserName = 'rptInadimplenciaContratoShape2'
        Brush.Color = 13040076
        ParentHeight = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 18521
        mmLeft = 0
        mmTop = 0
        mmWidth = 197115
        BandType = 4
      end
      object ppLine86: TppLine
        OnPrint = rptCCContrato_SeparadorPrint
        UserName = 'ppLine86'
        ParentHeight = True
        ParentWidth = True
        ShiftWithParent = True
        Weight = 0.75
        mmHeight = 18521
        mmLeft = 0
        mmTop = 0
        mmWidth = 196850
        BandType = 4
      end
      object ppDBText102: TppDBText
        UserName = 'ppDBText102'
        DataField = 'CONDATAINICIO'
        DataPipeline = pplInadimplenciaContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplInadimplenciaContrato'
        mmHeight = 3704
        mmLeft = 114036
        mmTop = 794
        mmWidth = 14817
        BandType = 4
      end
      object ppDBMemo28: TppDBMemo
        UserName = 'ppDBMemo28'
        CharWrap = False
        DataField = 'NF_LOCATARIO'
        DataPipeline = pplInadimplenciaContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplInadimplenciaContrato'
        mmHeight = 15875
        mmLeft = 20373
        mmTop = 794
        mmWidth = 46567
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText103: TppDBText
        UserName = 'ppDBText103'
        DataField = 'CONDATAFIM'
        DataPipeline = pplInadimplenciaContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplInadimplenciaContrato'
        mmHeight = 3704
        mmLeft = 131498
        mmTop = 794
        mmWidth = 15346
        BandType = 4
      end
      object ppLabel269: TppLabel
        UserName = 'ppLabel269'
        Caption = ' a '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 128852
        mmTop = 794
        mmWidth = 3175
        BandType = 4
      end
      object ppDBMemo29: TppDBMemo
        UserName = 'ppDBMemo29'
        CharWrap = False
        DataField = 'NF_ADMINISTRADORA'
        DataPipeline = pplInadimplenciaContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplInadimplenciaContrato'
        mmHeight = 15875
        mmLeft = 67998
        mmTop = 794
        mmWidth = 45244
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo30: TppDBMemo
        UserName = 'ppDBMemo30'
        CharWrap = False
        DataField = 'NUMERO_CONTRATO'
        DataPipeline = pplInadimplenciaContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplInadimplenciaContrato'
        mmHeight = 15875
        mmLeft = 0
        mmTop = 794
        mmWidth = 19579
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptInadimplenciaContratoDBText1: TppDBText
        UserName = 'rptInadimplenciaContratoDBText1'
        DataField = 'TOT_RECEBER'
        DataPipeline = pplInadimplenciaContrato
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplenciaContrato'
        mmHeight = 3704
        mmLeft = 177007
        mmTop = 794
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText93: TppDBText
        UserName = 'DBText93'
        DataField = 'DESCR_SITCONTR'
        DataPipeline = pplInadimplenciaContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplInadimplenciaContrato'
        mmHeight = 3704
        mmLeft = 147638
        mmTop = 794
        mmWidth = 28575
        BandType = 4
      end
      object ppLabel233: TppLabel
        UserName = 'Label233'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 4191
        mmLeft = 62581
        mmTop = 10054
        mmWidth = 60579
        BandType = 4
      end
    end
    object ppFooterBand23: TppFooterBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 7144
      mmPrintPosition = 0
      object ppLine87: TppLine
        UserName = 'ppLine87'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 196850
        BandType = 8
      end
      object ppLabel270: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel270'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc44: TppSystemVariable
        UserName = 'Calc44'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 76729
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc45: TppSystemVariable
        UserName = 'Calc45'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 3175
        mmWidth = 38100
        BandType = 8
      end
    end
    object rptInadimplenciaContratoSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 35983
      mmPrintPosition = 0
      object rptInadimplenciaContratoShape1: TppShape
        UserName = 'rptInadimplenciaContratoShape1'
        Pen.Width = 2
        mmHeight = 6615
        mmLeft = 140229
        mmTop = 4498
        mmWidth = 48948
        BandType = 7
      end
      object rptInadimplenciaContratoLabel2: TppLabel
        UserName = 'rptInadimplenciaContratoLabel2'
        Caption = 'Total Devido:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 141552
        mmTop = 5821
        mmWidth = 20108
        BandType = 7
      end
      object rptInadimplenciaContratoDBCalc1: TppDBCalc
        UserName = 'rptInadimplenciaContratoDBCalc1'
        DataField = 'TOT_RECEBER'
        DataPipeline = pplInadimplenciaContrato
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplenciaContrato'
        mmHeight = 3704
        mmLeft = 161396
        mmTop = 5821
        mmWidth = 26194
        BandType = 7
      end
      object rptInadimplenciaContratoLine1: TppLine
        UserName = 'rptInadimplenciaContratoLine1'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 196850
        BandType = 7
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplGrupoSeg'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 23813
        mmWidth = 196850
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplGrupoSeg
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 13229
          PrinterSetup.mmMarginLeft = 6615
          PrinterSetup.mmMarginRight = 6615
          PrinterSetup.mmMarginTop = 13229
          PrinterSetup.mmPaperHeight = 297128
          PrinterSetup.mmPaperWidth = 210080
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utScreenPixels
          Left = 416
          Top = 264
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplGrupoSeg'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 8467
            mmPrintPosition = 0
            object lblTituloGrupoSqg: TppLabel
              UserName = 'Label1'
              Caption = 'Resumo de Segregação - Por Total Devido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 265
              mmTop = 0
              mmWidth = 62706
              BandType = 1
            end
            object lbl1: TppLabel
              UserName = 'Label2'
              Caption = 'Plano'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 0
              mmTop = 5027
              mmWidth = 12171
              BandType = 1
            end
            object lbl2: TppLabel
              UserName = 'Label3'
              Caption = 'Patrocinador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 39158
              mmTop = 5027
              mmWidth = 29369
              BandType = 1
            end
            object lbl3: TppLabel
              UserName = 'Label4'
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 97102
              mmTop = 5027
              mmWidth = 2381
              BandType = 1
            end
            object lbl4: TppLabel
              UserName = 'Label5'
              Caption = 'Valor(R$)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 118798
              mmTop = 5027
              mmWidth = 12700
              BandType = 1
            end
          end
          object ppDetailBand12: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3175
            mmPrintPosition = 0
            object ppDBText94: TppDBText
              UserName = 'DBText12'
              DataField = 'PLANOPREV'
              DataPipeline = pplGrupoSeg
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplGrupoSeg'
              mmHeight = 3175
              mmLeft = 0
              mmTop = 0
              mmWidth = 36513
              BandType = 4
            end
            object ppDBText95: TppDBText
              UserName = 'DBText13'
              DataField = 'PATROCINADORA'
              DataPipeline = pplGrupoSeg
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplGrupoSeg'
              mmHeight = 3175
              mmLeft = 38100
              mmTop = 0
              mmWidth = 42333
              BandType = 4
            end
            object ppDBText96: TppDBText
              UserName = 'DBText14'
              DataField = 'PERCENT'
              DataPipeline = pplGrupoSeg
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplGrupoSeg'
              mmHeight = 3175
              mmLeft = 84138
              mmTop = 0
              mmWidth = 15346
              BandType = 4
            end
            object ppDBText97: TppDBText
              UserName = 'DBText15'
              DataField = 'VALOR'
              DataPipeline = pplGrupoSeg
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplGrupoSeg'
              mmHeight = 3175
              mmLeft = 102659
              mmTop = 0
              mmWidth = 28840
              BandType = 4
            end
          end
          object ppSummaryBand9: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
    end
  end
  object qryInadimplenciaContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATOIMOVEL,'
      '   C.CONNUMERO AS NUMERO_CONTRATO,'
      '   C.CONNOME AS NOME_CONTRATO,'
      '   C.CONDATAINICIO, C.CONDATAFIM,'
      '   SC.DESCRICAO AS DESCR_SITCONTR,'
      ''
      
        '   C.IDLOCATARIO, PL.NOME AS NF_LOCATARIO, PL.RAZAOSOCIAL AS RS_' +
        'LOCATARIO,'
      
        '   C.IDADMINIMOVEL, PA.NOME AS NF_ADMINISTRADORA, PL.RAZAOSOCIAL' +
        ' AS RS_ADMINISTRADORA,'
      ''
      '   (REC_DES.TOT_RECEBER - REC_DES.RECEBIDO) AS TOT_RECEBER'
      ''
      'FROM'
      '   PESSOA PL, '
      '   PESSOA PA, '
      '   CONTRATOIMOVEL C,'
      '   SITCONTIMOB SC,'
      ''
      '   ('
      '   SELECT'
      '      LI.IDCONTRATOIMOVEL,'
      ''
      '      SUM('
      
        '      DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39', LD.V' +
        'ALOR, 0), 0) +'
      
        '      DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39', DECO' +
        'DE(LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '      ) AS TOT_RECEBER,'
      ''
      
        '      SUM(DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', ' +
        'LD.VALOR, 0), 0)) AS RECEBIDO'
      ''
      '   FROM'
      '      DOCUMENTO D, LANCTODOCUM LD, LANCAMENTOSIMOVEL LI'
      ''
      '   WHERE'
      '      ( LI.IDCONTRATOIMOVEL IS NOT NULL )'
      '      AND ( (D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL) )'
      '      AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )'
      '      AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )'
      '   GROUP BY'
      '      LI.IDCONTRATOIMOVEL'
      '   ) REC_DES'
      ''
      'WHERE'
      '   ( C.IDLOCATARIO = PL.IDPESSOA(+) )'
      '   AND ( (REC_DES.TOT_RECEBER - REC_DES.RECEBIDO) <> 0 )'
      '   AND ( C.IDADMINIMOVEL = PA.IDPESSOA(+) )'
      '   AND ( C.IDCONTRATOIMOVEL = REC_DES.IDCONTRATOIMOVEL(+) )'
      '   AND ( C.IDSITCONTIMOB    = SC.IDSITCONTIMOB (+) )'
      ''
      'ORDER BY'
      '   C.CONNUMERO, PL.NOME'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 256
    Top = 220
    object qryInadimplenciaContratoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryInadimplenciaContratoNUMERO_CONTRATO: TStringField
      FieldName = 'NUMERO_CONTRATO'
    end
    object qryInadimplenciaContratoNOME_CONTRATO: TStringField
      FieldName = 'NOME_CONTRATO'
      Size = 60
    end
    object qryInadimplenciaContratoCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
    end
    object qryInadimplenciaContratoCONDATAFIM: TDateTimeField
      FieldName = 'CONDATAFIM'
    end
    object qryInadimplenciaContratoIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
    end
    object qryInadimplenciaContratoNF_LOCATARIO: TStringField
      FieldName = 'NF_LOCATARIO'
      Size = 60
    end
    object qryInadimplenciaContratoRS_LOCATARIO: TStringField
      FieldName = 'RS_LOCATARIO'
      Size = 60
    end
    object qryInadimplenciaContratoIDADMINIMOVEL: TFloatField
      FieldName = 'IDADMINIMOVEL'
    end
    object qryInadimplenciaContratoNF_ADMINISTRADORA: TStringField
      FieldName = 'NF_ADMINISTRADORA'
      Size = 60
    end
    object qryInadimplenciaContratoRS_ADMINISTRADORA: TStringField
      FieldName = 'RS_ADMINISTRADORA'
      Size = 60
    end
    object qryInadimplenciaContratoTOT_RECEBER: TFloatField
      FieldName = 'TOT_RECEBER'
    end
    object strngfldInadimplenciaContratoDESCR_SITCONTR: TStringField
      FieldName = 'DESCR_SITCONTR'
      Size = 60
    end
  end
  object dsInadimplenciaMestre: TwwDataSource
    DataSet = qryInadimplenciaMestre
    Left = 380
    Top = 172
  end
  object pplInadimplenciaMestre: TppBDEPipeline
    DataSource = dsInadimplenciaMestre
    UserName = 'lInadimplenciaMestre'
    Left = 382
    Top = 212
    object pplInadimplenciaMestreppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplInadimplenciaMestreppField2: TppField
      FieldAlias = 'NOME_MESTRE'
      FieldName = 'NOME_MESTRE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplInadimplenciaMestreppField3: TppField
      FieldAlias = 'IMOMATRICULA'
      FieldName = 'IMOMATRICULA'
      FieldLength = 20
      DisplayWidth = 20
      Position = 2
    end
    object pplInadimplenciaMestreppField4: TppField
      FieldAlias = 'IMOCODIGO'
      FieldName = 'IMOCODIGO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 3
    end
    object pplInadimplenciaMestreppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_RECEBER'
      FieldName = 'TOT_RECEBER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pfldInadimplenciaMestreppField6: TppField
      FieldAlias = 'DESCR_SITCONTR'
      FieldName = 'DESCR_SITCONTR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
  end
  object rptInadimplenciaMestre: TppReport
    AutoStop = False
    DataPipeline = pplInadimplenciaMestre
    NoDataBehaviors = [ndMessageOnPage, ndBlankReport]
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13229
    PrinterSetup.mmMarginLeft = 6615
    PrinterSetup.mmMarginRight = 6615
    PrinterSetup.mmMarginTop = 13229
    PrinterSetup.mmPaperHeight = 297128
    PrinterSetup.mmPaperWidth = 210080
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 382
    Top = 130
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplInadimplenciaMestre'
    object ppHeaderBand25: TppHeaderBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 40217
      mmPrintPosition = 0
      object ppLabel246: TppLabel
        UserName = 'ppLabel246'
        AutoSize = False
        Caption = 'Inadimplência por Imóvel Mestre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8731
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel253: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel253'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1588
        mmWidth = 196850
        BandType = 0
      end
      object ppLine89: TppLine
        UserName = 'ppLine89'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 39688
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel255: TppLabel
        UserName = 'ppLabel255'
        Caption = 'Imóvel Mestre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 42069
        mmTop = 35983
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel259: TppLabel
        UserName = 'ppLabel259'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 35983
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel260: TppLabel
        UserName = 'ppLabel260'
        Caption = 'Mês de competência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 2381
        mmTop = 20108
        mmWidth = 30427
        BandType = 0
      end
      object ppLabel261: TppLabel
        UserName = 'ppLabel261'
        Caption = 'Valor Devido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 35983
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel262: TppLabel
        UserName = 'ppLabel262'
        Caption = 'Data Limite:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 130175
        mmTop = 20108
        mmWidth = 17992
        BandType = 0
      end
      object rptInadimplenciaMestrelblMesCompetencia: TppLabel
        UserName = 'rptInadimplenciaMestrelblMesCompetencia'
        Caption = 'rptInadimplenciaMestrelblMesCompetencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 32544
        mmTop = 20108
        mmWidth = 51858
        BandType = 0
      end
      object rptInadimplenciaMestrelblDataLimite: TppLabel
        UserName = 'rptInadimplenciaMestrelblDataLimite'
        Caption = 'rptInadimplenciaMestrelblDataLimite'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 148167
        mmTop = 20108
        mmWidth = 45773
        BandType = 0
      end
      object ppLogoInadimplImovelM: TppImage
        UserName = 'ppLogoInadimplImovelM'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel192: TppLabel
        UserName = 'Label1901'
        Caption = 'Última atualização:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 121179
        mmTop = 23813
        mmWidth = 27252
        BandType = 0
      end
      object rptInadimplenciaMestrelblDataAtualiza1: TppLabel
        UserName = 'rptInadimplenciaMestrelblDataAtualiza1'
        Caption = 'rptInadimplenciaMestrelblDataAtualiza1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 148432
        mmTop = 23813
        mmWidth = 50006
        BandType = 0
      end
      object plbl4: TppLabel
        UserName = 'plbl4'
        Caption = 'Situação Contratual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 137054
        mmTop = 35719
        mmWidth = 38100
        BandType = 0
      end
    end
    object ppDetailBand25: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 18521
      mmPrintPosition = 0
      object rptInadimplenciaMestreShape1: TppShape
        OnPrint = rptFolhaAluguel_FundoBandaDetalhePrint
        UserName = 'rptInadimplenciaMestreShape1'
        Brush.Color = 13040076
        ParentHeight = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 18521
        mmLeft = 0
        mmTop = 0
        mmWidth = 197115
        BandType = 4
      end
      object rptInadimplenciaMestreLine1: TppLine
        OnPrint = rptCCContrato_SeparadorPrint
        UserName = 'rptInadimplenciaMestreLine1'
        ParentHeight = True
        ParentWidth = True
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 18521
        mmLeft = 0
        mmTop = 0
        mmWidth = 196850
        BandType = 4
      end
      object ppDBMemo31: TppDBMemo
        UserName = 'ppDBMemo31'
        CharWrap = True
        DataField = 'NOME_MESTRE'
        DataPipeline = pplInadimplenciaMestre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplInadimplenciaMestre'
        mmHeight = 15875
        mmLeft = 42069
        mmTop = 794
        mmWidth = 92340
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText104: TppDBText
        UserName = 'ppDBText104'
        DataField = 'TOT_RECEBER'
        DataPipeline = pplInadimplenciaMestre
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplenciaMestre'
        mmHeight = 3704
        mmLeft = 177007
        mmTop = 794
        mmWidth = 19844
        BandType = 4
      end
      object rptInadimplenciaMestreDBText1: TppDBText
        UserName = 'rptInadimplenciaMestreDBText1'
        DataField = 'IMOCODIGO'
        DataPipeline = pplInadimplenciaMestre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplInadimplenciaMestre'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 794
        mmWidth = 35190
        BandType = 4
      end
      object pdbtxtsITcONTR2: TppDBText
        UserName = 'pdbtxtsITcONTR2'
        DataField = 'DESCR_SITCONTR'
        DataPipeline = pplInadimplenciaMestre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplInadimplenciaMestre'
        mmHeight = 3704
        mmLeft = 137054
        mmTop = 794
        mmWidth = 37835
        BandType = 4
      end
      object ppLabel231: TppLabel
        UserName = 'LblInadimplencia1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 64294
        mmTop = 10054
        mmWidth = 57150
        BandType = 4
      end
    end
    object ppFooterBand25: TppFooterBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine91: TppLine
        UserName = 'ppLine91'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 196850
        BandType = 8
      end
      object ppLabel265: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel265'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc48: TppSystemVariable
        UserName = 'Calc48'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 76729
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc49: TppSystemVariable
        UserName = 'Calc49'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 3175
        mmWidth = 38100
        BandType = 8
      end
    end
    object ppSummaryBand4: TppSummaryBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 18521
      mmPrintPosition = 0
      object ppShape15: TppShape
        UserName = 'ppShape15'
        Pen.Width = 2
        mmHeight = 6615
        mmLeft = 148432
        mmTop = 5027
        mmWidth = 48948
        BandType = 7
      end
      object ppLabel266: TppLabel
        UserName = 'ppLabel266'
        Caption = 'Total Devido:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 149754
        mmTop = 6350
        mmWidth = 20108
        BandType = 7
      end
      object ppDBCalc50: TppDBCalc
        UserName = 'ppDBCalc50'
        DataField = 'TOT_RECEBER'
        DataPipeline = pplInadimplenciaMestre
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplenciaMestre'
        mmHeight = 3704
        mmLeft = 169598
        mmTop = 6350
        mmWidth = 26194
        BandType = 7
      end
      object ppLine92: TppLine
        UserName = 'ppLine92'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 196850
        BandType = 7
      end
    end
  end
  object qryInadimplenciaMestre: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '/* WO16764'
      'SELECT'
      '   IM.IDIMOVEL,'
      '   IM.IMONOME AS NOME_MESTRE, IM.IMOCODIGO,'
      '   SC.DESCRICAO AS DESCR_SITCONTR,'
      '   (REC_DES.TOT_RECEBER - REC_DES.RECEBIDO) AS TOT_RECEBER'
      ''
      'FROM'
      '   IMOVEL IM,'
      '   SITCONTIMOB SC,'
      ''
      '   ('
      '   SELECT'
      '      IM.IDIMOVEL,'
      '      C.IDSITCONTIMOB,'
      ''
      '      SUM('
      
        '           DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39',' +
        ' LD.VALOR, 0), 0) +'
      
        '           DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39',' +
        ' DECODE(LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '          ) AS TOT_RECEBER,'
      ''
      
        '      SUM(DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', ' +
        'LD.VALOR, 0), 0)) AS RECEBIDO,'
      ''
      '      SUM('
      
        '           DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'P'#39',' +
        ' LD.VALOR, 0), 0) +'
      
        '           DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'P'#39',' +
        ' DECODE(LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '         ) AS TOT_PAGAR,'
      ''
      
        '      SUM(DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'P'#39', ' +
        'LD.VALOR, 0), 0)) AS PAGO'
      ''
      '   FROM'
      '      DOCUMENTO D, LANCTODOCUM LD,'
      '      LANCAMENTOSIMOVEL LI, IMOVEL I,'
      '      IMOVEL IM, CONTRATOIMOVEL C'
      ''
      '   WHERE'
      '      ( LI.IDIMOVEL IS NOT NULL )'
      '      AND LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL'
      '      AND ( (D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL) )'
      '      AND ( LI.IDIMOVEL = I.IDIMOVEL )'
      '      AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '      AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )'
      '      AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )'
      ''
      '   GROUP BY'
      '      IM.IDIMOVEL,'
      '      C.IDSITCONTIMOB'
      '   ) REC_DES'
      ''
      'WHERE'
      '   1=2 '
      '   AND (REC_DES.IDSITCONTIMOB = SC.IDSITCONTIMOB)'
      '   AND ( (REC_DES.TOT_RECEBER - REC_DES.RECEBIDO) <> 0 )'
      '   AND ( IM.IDIMOVEL = REC_DES.IDIMOVEL )'
      ''
      'ORDER BY'
      '   IM.IMONOME'
      ' '
      '*/'
      
        ' SELECT A.IDIMOVELMESTRE AS IDIMOVEL,A.NOME_MESTRE,'#39#39' AS IMOCODI' +
        'GO,'#39#39' AS DESCR_SITCONTR,'
      
        '/* SUM(A.TOT_RECEBER) AS TOT_RECEBER,SUM(TOT_RECEBIDO) AS TOT_RE' +
        'CEBIDO, */'
      ' '#9#9'SUM(A.TOT_RECEBER - A.TOT_RECEBIDO) AS TOT_RECEBER '
      ' FROM '
      ' ( SELECT '
      '   I.IDIMOVEL, I.IDIMOVELMESTRE, IM.IMONOME AS NOME_MESTRE, '
      '   I.IMONOME, '
      '   I.IMOCODIGO,'
      '   I.CODTIPIMOVEL, '
      '   T.DESCCUSTORECIMO, '
      
        '   LI.DATALANCAMENTO, LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.A' +
        'NOCOMPETENCIA, '
      '   LI.IDLANCIMOVEL, TA.DESCRICAO, '
      '   D.RECPAG, D.STATUS, D.NODOCUMENTO, D.NUMAPGR, '
      '   PFC.NOME AS NF_FORCLI, PFC.RAZAOSOCIAL AS RS_FORCLI, '
      '   LD.CODDOCUMENTO, LD.CODALTERADOR, LD.OPERACAO, '
      '   LD.VALOR, '
      '   LD.DEBCRE, LD.HISTORICOCOMPL, LD.DATALANCTO, '
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', LI.DATAVENCIMENTO, '#39'2'#39', LI.DA' +
        'TAVENCIMENTO, '#39'4'#39', LD.DATALANCTO, DECODE(RP.DATABAIXA, NULL, LD.' +
        'DATALANCTO, RP.DATABAIXA) ) AS DATA, '
      '   ( '
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'1'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0' +
        ') + '
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0' +
        ') + '
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'3'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0' +
        ') + '
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'12'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0' +
        ') + '
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALO' +
        'R * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) '
      '   ) AS TOT_RECEBER, '
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE(' +
        'LD.DEBCRE, '#39'C'#39', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR' +
        ' * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) AS TOT_RECEBIDO, '
      '   ( '
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'1'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0' +
        ') + '
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'2'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0' +
        ') + '
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'3'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0' +
        ') + '
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'12'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0' +
        ') + '
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'4'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALO' +
        'R * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0) '
      '   ) AS TOT_PAGAR, '
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'5'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALO' +
        'R * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0) AS TOT_PAGO, '
      '   ( '
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'1'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0' +
        ') + '
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0' +
        ') + '
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'3'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0' +
        ') + '
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'12'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0' +
        ') + '
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALO' +
        'R * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) - '
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALO' +
        'R * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) '
      '   ) AS SALDO_RECEB, '
      '   ( '
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'1'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0' +
        ') + '
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'2'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0' +
        ') + '
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'3'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0' +
        ') + '
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'12'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0' +
        ') + '
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'4'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALO' +
        'R * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0)  - '
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'5'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALO' +
        'R * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0) '
      '   ) AS SALDO_PAGAR '
      'FROM                                        '
      '   PESSOA PFC,                              '
      '   DOCUMENTO D, LANCTODOCUM LD,             '
      '  ( SELECT CODDOCUMENTO, VALOR              '
      '    FROM LANCTODOCUM                        '
      '   WHERE RTRIM(OPERACAO) = '#39'1'#39' OR         '
      '         RTRIM(OPERACAO) = '#39'2'#39' OR         '
      '         RTRIM(OPERACAO) = '#39'3'#39' OR         '
      '         RTRIM(OPERACAO) = '#39'12'#39') TRD,     '
      '   RECBTOPAGTO RP, TIPOALTERADOR TA,        '
      '   IMOVEL I, IMOVEL IM,                     '
      '   TIPOCUSTORECIMOV T, LANCAMENTOSIMOVEL LI '
      'WHERE                                       '
      '   ( LI.MESCOMPETENCIA = 4 AND LI.ANOCOMPETENCIA = 2025 ) AND '
      ''
      '   ( I.IDIMOVELMESTRE = 129 ) AND '
      '   ( I.IDIMOVELMESTRE = IM.IDIMOVEL )                  '
      '   AND ( LI.IDIMOVEL = I.IDIMOVEL )                    '
      '   AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )            '
      '   AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )            '
      '   AND ( LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) )        '
      '   AND ( D.CODDOCUMENTO = TRD.CODDOCUMENTO )           '
      '   AND ( LD.NUMLANCTO = RP.NUMLANCTO(+) )              '
      '   AND ( LD.CODALTERADOR = TA.CODALTERADOR(+) )        '
      '   AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO )  '
      '   AND ( D.IDFORCLI = PFC.IDPESSOA(+) )                '
      ') A'
      'GROUP BY A.IDIMOVELMESTRE,A.NOME_MESTRE '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 386
    Top = 244
    object qryInadimplenciaMestreIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryInadimplenciaMestreNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object qryInadimplenciaMestreTOT_RECEBER: TFloatField
      FieldName = 'TOT_RECEBER'
    end
  end
  object dsInadimplenciaLocatario: TwwDataSource
    DataSet = qryInadimplenciaLocatario
    Left = 512
    Top = 196
  end
  object pplInadimplenciaLocatario: TppBDEPipeline
    DataSource = dsInadimplenciaLocatario
    UserName = 'lInadimplenciaLocatario'
    Left = 512
    Top = 208
    object pplInadimplenciaLocatarioppField1: TppField
      FieldAlias = 'NF_LOCATARIO'
      FieldName = 'NF_LOCATARIO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplInadimplenciaLocatarioppField2: TppField
      FieldAlias = 'RS_LOCATARIO'
      FieldName = 'RS_LOCATARIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplInadimplenciaLocatarioppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_RECEBER'
      FieldName = 'TOT_RECEBER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pfldInadimplenciaLocatarioppField4: TppField
      FieldAlias = 'DESCR_SITCONTR'
      FieldName = 'DESCR_SITCONTR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
  end
  object rptInadimplenciaLocatario: TppReport
    AutoStop = False
    DataPipeline = pplInadimplenciaLocatario
    NoDataBehaviors = [ndBlankReport]
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13229
    PrinterSetup.mmMarginLeft = 6615
    PrinterSetup.mmMarginRight = 6615
    PrinterSetup.mmMarginTop = 13229
    PrinterSetup.mmPaperHeight = 297128
    PrinterSetup.mmPaperWidth = 210080
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 512
    Top = 152
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplInadimplenciaLocatario'
    object ppHeaderBand26: TppHeaderBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 40217
      mmPrintPosition = 0
      object ppLabel263: TppLabel
        UserName = 'ppLabel263'
        AutoSize = False
        Caption = 'Inadimplência por Locatário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8731
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel264: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel264'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1588
        mmWidth = 196850
        BandType = 0
      end
      object ppLine93: TppLine
        UserName = 'ppLine93'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 39688
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel267: TppLabel
        UserName = 'ppLabel267'
        Caption = 'Nome / Nome Fantasia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 35983
        mmWidth = 32015
        BandType = 0
      end
      object ppLabel271: TppLabel
        UserName = 'ppLabel271'
        Caption = 'Razão Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 70115
        mmTop = 35983
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel273: TppLabel
        UserName = 'ppLabel273'
        Caption = 'Mês de competência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 19579
        mmWidth = 32808
        BandType = 0
      end
      object ppLabel274: TppLabel
        UserName = 'ppLabel274'
        Caption = 'Valor Devido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 35983
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel275: TppLabel
        UserName = 'ppLabel275'
        Caption = 'Data Limite:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 124619
        mmTop = 19844
        mmWidth = 17992
        BandType = 0
      end
      object rptInadimplenciaLocatariolblMesCompetencia: TppLabel
        UserName = 'rptInadimplenciaLocatariolblMesCompetencia'
        Caption = 'rptInadimplenciaLocatariolblMesCompetencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 32544
        mmTop = 19844
        mmWidth = 54769
        BandType = 0
      end
      object rptInadimplenciaLocatariolblDataLimite: TppLabel
        UserName = 'rptInadimplenciaLocatariolblDataLimite'
        Caption = 'rptInadimplenciaLocatariolblDataLimite'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 142346
        mmTop = 19844
        mmWidth = 46567
        BandType = 0
      end
      object ppLogoInadimplLocatario: TppImage
        UserName = 'ppLogoInadimplLocatario'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel190: TppLabel
        UserName = 'Label190'
        Caption = 'Última atualização:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 115359
        mmTop = 23813
        mmWidth = 27252
        BandType = 0
      end
      object rptInadimplenciaLocatariolblDataAtualiza1: TppLabel
        UserName = 'rptInadimplenciaLocatariolblDataAtualiza1'
        Caption = 'rptInadimplenciaLocatariolblDataAtualiza1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 142611
        mmTop = 23813
        mmWidth = 52917
        BandType = 0
      end
      object plbl5: TppLabel
        UserName = 'plbl5'
        Caption = 'Situação Contratual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 146844
        mmTop = 35983
        mmWidth = 29369
        BandType = 0
      end
    end
    object ppDetailBand26: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 18521
      mmPrintPosition = 0
      object rptInadimplenciaLocatarioShape1: TppShape
        OnPrint = rptFolhaAluguel_FundoBandaDetalhePrint
        UserName = 'rptInadimplenciaLocatarioShape1'
        Brush.Color = 13040076
        ParentHeight = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 18521
        mmLeft = 0
        mmTop = 0
        mmWidth = 196850
        BandType = 4
      end
      object ppLine94: TppLine
        OnPrint = rptCCContrato_SeparadorPrint
        UserName = 'ppLine94'
        ParentHeight = True
        ParentWidth = True
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 18521
        mmLeft = 0
        mmTop = 0
        mmWidth = 196850
        BandType = 4
      end
      object ppDBMemo33: TppDBMemo
        UserName = 'ppDBMemo33'
        CharWrap = False
        DataField = 'NF_LOCATARIO'
        DataPipeline = pplInadimplenciaLocatario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplInadimplenciaLocatario'
        mmHeight = 15875
        mmLeft = 0
        mmTop = 794
        mmWidth = 68527
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText110: TppDBText
        UserName = 'ppDBText110'
        DataField = 'TOT_RECEBER'
        DataPipeline = pplInadimplenciaLocatario
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplenciaLocatario'
        mmHeight = 3704
        mmLeft = 177007
        mmTop = 794
        mmWidth = 19844
        BandType = 4
      end
      object rptInadimplenciaLocatarioDBMemo1: TppDBMemo
        UserName = 'rptInadimplenciaLocatarioDBMemo1'
        CharWrap = False
        DataField = 'RS_LOCATARIO'
        DataPipeline = pplInadimplenciaLocatario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplInadimplenciaLocatario'
        mmHeight = 15875
        mmLeft = 70115
        mmTop = 794
        mmWidth = 75671
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object pdbtxtsITcONTR3: TppDBText
        UserName = 'pdbtxtsITcONTR3'
        DataField = 'DESCR_SITCONTR'
        DataPipeline = pplInadimplenciaLocatario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplInadimplenciaLocatario'
        mmHeight = 3440
        mmLeft = 147373
        mmTop = 1058
        mmWidth = 28575
        BandType = 4
      end
    end
    object ppFooterBand26: TppFooterBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine95: TppLine
        UserName = 'ppLine95'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 196850
        BandType = 8
      end
      object ppLabel279: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel279'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc50: TppSystemVariable
        UserName = 'ppCalc501'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 76729
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc51: TppSystemVariable
        UserName = 'Calc51'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 3175
        mmWidth = 38100
        BandType = 8
      end
    end
    object ppSummaryBand5: TppSummaryBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 18521
      mmPrintPosition = 0
      object ppShape16: TppShape
        UserName = 'ppShape16'
        Pen.Width = 2
        mmHeight = 6615
        mmLeft = 148696
        mmTop = 4763
        mmWidth = 48683
        BandType = 7
      end
      object ppLabel280: TppLabel
        UserName = 'ppLabel280'
        Caption = 'Total Devido:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 150019
        mmTop = 6085
        mmWidth = 20108
        BandType = 7
      end
      object ppDBCalc51: TppDBCalc
        UserName = 'ppDBCalc51'
        DataField = 'TOT_RECEBER'
        DataPipeline = pplInadimplenciaLocatario
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplenciaLocatario'
        mmHeight = 3704
        mmLeft = 169863
        mmTop = 6085
        mmWidth = 26194
        BandType = 7
      end
      object ppLine96: TppLine
        UserName = 'ppLine96'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 196850
        BandType = 7
      end
      object ppLabel235: TppLabel
        UserName = 'Label235'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 60061
        mmTop = 6615
        mmWidth = 60590
        BandType = 7
      end
    end
  end
  object qryInadimplenciaLocatario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PL.NOME AS NF_LOCATARIO, PL.RAZAOSOCIAL AS RS_LOCATARIO,'
      '   SC.DESCRICAO AS DESCR_SITCONTR,'
      '   (REC_DES.TOT_RECEBER - REC_DES.RECEBIDO) AS TOT_RECEBER'
      'FROM'
      '   PESSOA PL, LOCATARIO L,'
      '   SITCONTIMOB SC,'
      '   ('
      '   SELECT'
      '      L.IDLOCATARIO,'
      '      C.IDSITCONTIMOB,'
      ''
      '      SUM('
      
        '           DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39',' +
        ' LD.VALOR, 0), 0) +'
      
        '           DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39',' +
        ' DECODE(LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '         ) AS TOT_RECEBER,'
      ''
      
        '      SUM(DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', ' +
        'LD.VALOR, 0), 0)) AS RECEBIDO,'
      ''
      '      SUM('
      
        '           DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'P'#39',' +
        ' LD.VALOR, 0), 0) +'
      
        '           DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'P'#39',' +
        ' DECODE(LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '          ) AS TOT_PAGAR,'
      ''
      
        '      SUM(DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'P'#39', ' +
        'LD.VALOR, 0), 0)) AS PAGO'
      ''
      '   FROM'
      '      DOCUMENTO D, LANCTODOCUM LD,'
      '      LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C,'
      '      LOCATARIO L'
      ''
      '   WHERE'
      '      ( LI.IDCONTRATOIMOVEL IS NOT NULL )'
      '      AND ( (D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL) )'
      '      AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )'
      '      AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )'
      '      AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      '      AND ( C.IDLOCATARIO = L.IDLOCATARIO )'
      ''
      '   GROUP BY'
      '      L.IDLOCATARIO,'
      '      C.IDSITCONTIMOB'
      '   ) REC_DES'
      ''
      'WHERE'
      '   1=2 '
      '   AND ( REC_DES.IDSITCONTIMOB = SC.IDSITCONTIMOB(+) )'
      '   AND ( (REC_DES.TOT_RECEBER - REC_DES.RECEBIDO) <> 0 )'
      '   AND ( L.IDLOCATARIO = PL.IDPESSOA )'
      '   AND ( L.IDLOCATARIO = REC_DES.IDLOCATARIO )'
      ''
      'ORDER BY'
      '   PL.NOME'
      ' ')
    ValidateWithMask = True
    Left = 512
    Top = 220
    object qryInadimplenciaLocatarioNF_LOCATARIO: TStringField
      FieldName = 'NF_LOCATARIO'
      Size = 60
    end
    object qryInadimplenciaLocatarioRS_LOCATARIO: TStringField
      FieldName = 'RS_LOCATARIO'
      Size = 60
    end
    object qryInadimplenciaLocatarioTOT_RECEBER: TFloatField
      FieldName = 'TOT_RECEBER'
    end
    object strngfldInadimplenciaLocatarioDESCR_SITCONTR: TStringField
      FieldName = 'DESCR_SITCONTR'
      Size = 60
    end
  end
  object qryDivergenciaLanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IMOVEL_EXTENSO, CONTRATO_EXTENSO, DESCCUSTORECIMO,'
      ''
      '   DATALANCAMENTO, DATAVENCIMENTO, TRGDTINCLUSAO, DATA_BAIXA,'
      '   MESCOMPETENCIA, ANOCOMPETENCIA,'
      '   FLGORIGEMLANC, FLGESTORNADO,'
      ''
      '   RECPAG, VALOR_OM_LANC, VALOR_LANC, '
      '   VLRLANCOMRECEB, VLRLANCOMPAGAR, VLRLANCRECEB, VLRLANCPAGAR,'
      '   VLRJUROS, VLRMULTA, VLRCORRECAOMON, DATACORRECAO,'
      
        '   TOT_PAGAR, TOT_PAGO, TOT_RECEBER, TOT_RECEBIDO, PREVISTO, EFE' +
        'TIVO,'
      ''
      '   LOGIN_USUARIO, NF_USUARIO, NF_FORCLI, RS_FORCLI,'
      ''
      '   IDDOCUMENTO, NODOCUMENTO, PORTADOR_FORMA,'
      ''
      '   IMOCODIGO, CODTIPIMOVEL, FLGATIVO, STATUS_IMOVEL'
      ''
      'FROM'
      '   VWLANCAMENTO VW'
      ''
      'WHERE'
      '   1=2 AND ( STATUS_DOC = '#39'2'#39' )'
      '   AND ( DATA_BAIXA > DATAVENCIMENTO )'
      '   AND ( ABS(EFETIVO - PREVISTO) > 0.01 )'
      '')
    ValidateWithMask = True
    Left = 611
    Top = 56
    object qryDivergenciaLancIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryDivergenciaLancCONTRATO_EXTENSO: TStringField
      FieldName = 'CONTRATO_EXTENSO'
      Size = 83
    end
    object qryDivergenciaLancDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object qryDivergenciaLancDATALANCAMENTO: TDateTimeField
      FieldName = 'DATALANCAMENTO'
    end
    object qryDivergenciaLancDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryDivergenciaLancTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object qryDivergenciaLancDATA_BAIXA: TDateTimeField
      FieldName = 'DATA_BAIXA'
    end
    object qryDivergenciaLancMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object qryDivergenciaLancANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object qryDivergenciaLancFLGORIGEMLANC: TStringField
      FieldName = 'FLGORIGEMLANC'
      Size = 1
    end
    object qryDivergenciaLancFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
    end
    object qryDivergenciaLancRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
    object qryDivergenciaLancVALOR_OM_LANC: TFloatField
      FieldName = 'VALOR_OM_LANC'
    end
    object qryDivergenciaLancVALOR_LANC: TFloatField
      FieldName = 'VALOR_LANC'
    end
    object qryDivergenciaLancVLRLANCOMRECEB: TFloatField
      FieldName = 'VLRLANCOMRECEB'
    end
    object qryDivergenciaLancVLRLANCOMPAGAR: TFloatField
      FieldName = 'VLRLANCOMPAGAR'
    end
    object qryDivergenciaLancVLRLANCRECEB: TFloatField
      FieldName = 'VLRLANCRECEB'
    end
    object qryDivergenciaLancVLRLANCPAGAR: TFloatField
      FieldName = 'VLRLANCPAGAR'
    end
    object qryDivergenciaLancVLRJUROS: TFloatField
      FieldName = 'VLRJUROS'
    end
    object qryDivergenciaLancVLRMULTA: TFloatField
      FieldName = 'VLRMULTA'
    end
    object qryDivergenciaLancVLRCORRECAOMON: TFloatField
      FieldName = 'VLRCORRECAOMON'
    end
    object qryDivergenciaLancDATACORRECAO: TDateTimeField
      FieldName = 'DATACORRECAO'
    end
    object qryDivergenciaLancTOT_PAGAR: TFloatField
      FieldName = 'TOT_PAGAR'
    end
    object qryDivergenciaLancTOT_PAGO: TFloatField
      FieldName = 'TOT_PAGO'
    end
    object qryDivergenciaLancTOT_RECEBER: TFloatField
      FieldName = 'TOT_RECEBER'
    end
    object qryDivergenciaLancTOT_RECEBIDO: TFloatField
      FieldName = 'TOT_RECEBIDO'
    end
    object qryDivergenciaLancPREVISTO: TFloatField
      FieldName = 'PREVISTO'
    end
    object qryDivergenciaLancEFETIVO: TFloatField
      FieldName = 'EFETIVO'
    end
    object qryDivergenciaLancLOGIN_USUARIO: TStringField
      FieldName = 'LOGIN_USUARIO'
    end
    object qryDivergenciaLancNF_USUARIO: TStringField
      FieldName = 'NF_USUARIO'
      Size = 60
    end
    object qryDivergenciaLancNF_FORCLI: TStringField
      FieldName = 'NF_FORCLI'
      Size = 60
    end
    object qryDivergenciaLancRS_FORCLI: TStringField
      FieldName = 'RS_FORCLI'
      Size = 60
    end
    object qryDivergenciaLancIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
    end
    object qryDivergenciaLancNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object qryDivergenciaLancPORTADOR_FORMA: TStringField
      FieldName = 'PORTADOR_FORMA'
      Size = 50
    end
    object qryDivergenciaLancIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object qryDivergenciaLancCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryDivergenciaLancFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
    end
    object qryDivergenciaLancSTATUS_IMOVEL: TStringField
      FieldName = 'STATUS_IMOVEL'
      Size = 1
    end
  end
  object rptDivergenciaLanc: TppReport
    AutoStop = False
    DataPipeline = pplDivergenciaLanc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 611
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplDivergenciaLanc'
    object ppHeaderBand17: TppHeaderBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 0
      mmHeight = 39158
      mmPrintPosition = 0
      object ppLabel9: TppLabel
        UserName = 'ppLabel9'
        AutoSize = False
        Caption = 'Lançamentos com Divergência de Valores'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 39158
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel40: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel40'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 39158
        mmTop = 1588
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'ppLabel11'
        Caption = 'Mês de Competência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 21960
        mmWidth = 33338
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'ppLabel34'
        Caption = 'Período de Datas:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 6615
        mmTop = 25400
        mmWidth = 26988
        BandType = 0
      end
      object rptDivergenciaLanc_lblCompetencia: TppLabel
        UserName = 'rptDivergenciaLanc_lblCompetencia'
        Caption = '   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 33338
        mmTop = 21960
        mmWidth = 12171
        BandType = 0
      end
      object rptDivergenciaLanc_lblDatas: TppLabel
        UserName = 'rptDivergenciaLanc_lblDatas'
        Caption = 'rptDivergenciaLanc_lblDatas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33338
        mmTop = 25400
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'ppLabel39'
        Caption = 'Tipo de Receita / Despesa:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 185738
        mmTop = 21960
        mmWidth = 39688
        BandType = 0
      end
      object rptDivergenciaLanc_lblTipoRecDes: TppLabel
        UserName = 'rptDivergenciaLanc_lblTipoRecDes'
        AutoSize = False
        Caption = 'rptDivergenciaLanc_lblTipoRecDes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 225161
        mmTop = 21960
        mmWidth = 45773
        BandType = 0
      end
      object ppLine27: TppLine
        UserName = 'ppLine27'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 38894
        mmWidth = 270670
        BandType = 0
      end
      object ppLabel58: TppLabel
        UserName = 'ppLabel58'
        Caption = 'Compet.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 228336
        mmTop = 35983
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel121: TppLabel
        UserName = 'ppLabel121'
        Caption = 'Data de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 259292
        mmTop = 33338
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel124: TppLabel
        UserName = 'ppLabel124'
        Caption = 'Favorecido / Debitado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 67469
        mmTop = 35983
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel125: TppLabel
        UserName = 'ppLabel125'
        Caption = 'Tipo de Receita '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 123296
        mmTop = 35983
        mmWidth = 19315
        BandType = 0
      end
      object rptLancImovelLabel1: TppLabel
        UserName = 'rptLancImovelLabel1'
        Caption = 'Valor Previsto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 187855
        mmTop = 35983
        mmWidth = 16933
        BandType = 0
      end
      object rptLancImovelLabel2: TppLabel
        UserName = 'rptLancImovelLabel2'
        Caption = 'Valor Efetivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 209550
        mmTop = 35983
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'ppLabel2'
        Caption = 'Nº Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 162190
        mmTop = 35983
        mmWidth = 17198
        BandType = 0
      end
      object rptLancImovelLabel3: TppLabel
        UserName = 'rptLancImovelLabel3'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 246063
        mmTop = 33338
        mmWidth = 5292
        BandType = 0
      end
      object rptLancImovelLabel4: TppLabel
        UserName = 'rptLancImovelLabel4'
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 241830
        mmTop = 35983
        mmWidth = 14023
        BandType = 0
      end
      object rptLancImovelLabel5: TppLabel
        UserName = 'rptLancImovelLabel5'
        Caption = 'Baixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 260615
        mmTop = 35983
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel123: TppLabel
        UserName = 'ppLabel123'
        Caption = 'Imóvel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 35983
        mmWidth = 7673
        BandType = 0
      end
      object ppLogoLctoDivergencias: TppImage
        UserName = 'ppLogoLctoDivergencias'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand16: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 19844
      mmPrintPosition = 0
      object rptDivergenciaLancShape1: TppShape
        OnPrint = rptFolhaAluguel_FundoBandaDetalhePrint
        UserName = 'rptDivergenciaLancShape1'
        Brush.Color = 13040076
        ParentHeight = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 19844
        mmLeft = 0
        mmTop = 0
        mmWidth = 270934
        BandType = 4
      end
      object rptLancImovel_Separador: TppLine
        OnPrint = rptCCContrato_SeparadorPrint
        UserName = 'rptLancImovel_Separador'
        ParentHeight = True
        ParentWidth = True
        StretchWithParent = True
        Visible = False
        Weight = 0.75
        mmHeight = 19844
        mmLeft = 0
        mmTop = 0
        mmWidth = 270670
        BandType = 4
      end
      object ppDBText64: TppDBText
        UserName = 'ppDBText64'
        DataField = 'DATAVENCIMENTO'
        DataPipeline = pplDivergenciaLanc
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplDivergenciaLanc'
        mmHeight = 3175
        mmLeft = 241565
        mmTop = 794
        mmWidth = 14288
        BandType = 4
      end
      object ppLabel38: TppLabel
        UserName = 'ppLabel38'
        AutoSize = False
        Caption = ' / '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 231246
        mmTop = 794
        mmWidth = 2381
        BandType = 4
      end
      object ppDBText66: TppDBText
        UserName = 'ppDBText66'
        DataField = 'MESCOMPETENCIA'
        DataPipeline = pplDivergenciaLanc
        DisplayFormat = '00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDivergenciaLanc'
        mmHeight = 3175
        mmLeft = 228336
        mmTop = 794
        mmWidth = 3175
        BandType = 4
      end
      object ppDBText67: TppDBText
        UserName = 'ppDBText67'
        DataField = 'ANOCOMPETENCIA'
        DataPipeline = pplDivergenciaLanc
        DisplayFormat = '0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDivergenciaLanc'
        mmHeight = 3175
        mmLeft = 233363
        mmTop = 794
        mmWidth = 6350
        BandType = 4
      end
      object ppDBMemo23: TppDBMemo
        UserName = 'ppDBMemo23'
        CharWrap = True
        DataField = 'IMOVEL_EXTENSO'
        DataPipeline = pplDivergenciaLanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplDivergenciaLanc'
        mmHeight = 15875
        mmLeft = 0
        mmTop = 794
        mmWidth = 66675
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo26: TppDBMemo
        UserName = 'ppDBMemo26'
        CharWrap = True
        DataField = 'NF_FORCLI'
        DataPipeline = pplDivergenciaLanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplDivergenciaLanc'
        mmHeight = 15875
        mmLeft = 67469
        mmTop = 794
        mmWidth = 55033
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo27: TppDBMemo
        UserName = 'ppDBMemo27'
        CharWrap = True
        DataField = 'DESCCUSTORECIMO'
        DataPipeline = pplDivergenciaLanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplDivergenciaLanc'
        mmHeight = 15875
        mmLeft = 123296
        mmTop = 794
        mmWidth = 37835
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptLancImovelDBText1: TppDBText
        UserName = 'rptLancImovelDBText1'
        DataField = 'PREVISTO'
        DataPipeline = pplDivergenciaLanc
        DisplayFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDivergenciaLanc'
        mmHeight = 3175
        mmLeft = 185473
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
      object rptLancImovelDBText2: TppDBText
        UserName = 'rptLancImovelDBText2'
        DataField = 'EFETIVO'
        DataPipeline = pplDivergenciaLanc
        DisplayFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDivergenciaLanc'
        mmHeight = 3175
        mmLeft = 205582
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'ppDBText1'
        DataField = 'NODOCUMENTO'
        DataPipeline = pplDivergenciaLanc
        DisplayFormat = '####################0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDivergenciaLanc'
        mmHeight = 3175
        mmLeft = 162190
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object rptLancImovelDBText3: TppDBText
        UserName = 'rptLancImovelDBText3'
        DataField = 'DATA_BAIXA'
        DataPipeline = pplDivergenciaLanc
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplDivergenciaLanc'
        mmHeight = 3175
        mmLeft = 256646
        mmTop = 794
        mmWidth = 14288
        BandType = 4
      end
    end
    object ppFooterBand17: TppFooterBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 0
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine26: TppLine
        UserName = 'ppLine26'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 270670
        BandType = 8
      end
      object ppLabel41: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel41'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc26: TppSystemVariable
        UserName = 'Calc26'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 113506
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc31: TppSystemVariable
        UserName = 'Calc31'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 233363
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
    object rptDivergenciaLancSummaryBand1: TppSummaryBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 0
      mmHeight = 14817
      mmPrintPosition = 0
      object ppLine39: TppLine
        UserName = 'ppLine39'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 270670
        BandType = 7
      end
      object rptLancImovelShape1: TppShape
        UserName = 'rptLancImovelShape1'
        Pen.Width = 2
        mmHeight = 5027
        mmLeft = 184415
        mmTop = 3440
        mmWidth = 41804
        BandType = 7
      end
      object rptLancImovelDBCalc1: TppDBCalc
        UserName = 'rptLancImovelDBCalc1'
        DataField = 'PREVISTO'
        DataPipeline = pplDivergenciaLanc
        DisplayFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDivergenciaLanc'
        mmHeight = 3175
        mmLeft = 185473
        mmTop = 4233
        mmWidth = 19315
        BandType = 7
      end
      object rptLancImovelDBCalc2: TppDBCalc
        UserName = 'rptLancImovelDBCalc2'
        DataField = 'EFETIVO'
        DataPipeline = pplDivergenciaLanc
        DisplayFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDivergenciaLanc'
        mmHeight = 3175
        mmLeft = 205582
        mmTop = 4233
        mmWidth = 19315
        BandType = 7
      end
      object rptLancImovelLabel6: TppLabel
        UserName = 'rptLancImovelLabel6'
        Caption = 'Total Geral:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 168540
        mmTop = 4233
        mmWidth = 16140
        BandType = 7
      end
    end
  end
  object dsDivergenciaLanc: TwwDataSource
    DataSet = qryDivergenciaLanc
    Left = 611
    Top = 68
  end
  object pplDivergenciaLanc: TppBDEPipeline
    DataSource = dsDivergenciaLanc
    UserName = 'lDivergenciaLanc'
    Left = 611
    Top = 80
  end
  object rptFolhaAluguel: TppReport
    AutoStop = False
    DataPipeline = pplFolhaAluguel
    NoDataBehaviors = [ndBlankReport]
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13229
    PrinterSetup.mmMarginLeft = 6615
    PrinterSetup.mmMarginRight = 6615
    PrinterSetup.mmMarginTop = 13229
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 640
    Top = 152
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplFolhaAluguel'
    object ppHeaderBand1: TppHeaderBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 40217
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        AutoSize = False
        Caption = 'Folha de Aluguéis por Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8731
        mmWidth = 282840
        BandType = 0
      end
      object ppLabel3: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel3'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1588
        mmWidth = 282840
        BandType = 0
      end
      object rptContratoLabel1: TppLabel
        UserName = 'rptContratoLabel1'
        Caption = 'Nr.Contr.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 35983
        mmWidth = 10583
        BandType = 0
      end
      object rptContratoLabel4: TppLabel
        UserName = 'rptContratoLabel4'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 228336
        mmTop = 35983
        mmWidth = 6085
        BandType = 0
      end
      object rptContratoLabel6: TppLabel
        UserName = 'rptContratoLabel6'
        Caption = 'Tipo de Receita '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 122502
        mmTop = 35983
        mmWidth = 18785
        BandType = 0
      end
      object rptContratoLabel7: TppLabel
        UserName = 'rptContratoLabel7'
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 178859
        mmTop = 35983
        mmWidth = 13758
        BandType = 0
      end
      object rptContratoLine1: TppLine
        UserName = 'rptContratoLine1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 794
        mmLeft = 0
        mmTop = 39423
        mmWidth = 283898
        BandType = 0
      end
      object rptFolhaAluguelLabel1: TppLabel
        UserName = 'rptFolhaAluguelLabel1'
        Caption = 'Mês Competência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 18521
        mmWidth = 28840
        BandType = 0
      end
      object rptFolhaAluguelLabel2: TppLabel
        UserName = 'rptFolhaAluguelLabel2'
        Caption = 'Administradora:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 23019
        mmWidth = 25135
        BandType = 0
      end
      object rptFolhaAluguel_lblCompetencia: TppLabel
        UserName = 'rptFolhaAluguel_lblCompetencia'
        Caption = 'rptFolhaAluguel_lblCompetencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 28575
        mmTop = 18521
        mmWidth = 41010
        BandType = 0
      end
      object rptFolhaAluguel_lblAdministradora: TppLabel
        UserName = 'rptFolhaAluguel_lblAdministradora'
        Caption = 'Administradora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 28575
        mmTop = 23019
        mmWidth = 19315
        BandType = 0
      end
      object rptFolhaAluguelLabel5: TppLabel
        UserName = 'rptFolhaAluguelLabel5'
        Caption = 'Forma de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 56886
        mmTop = 35983
        mmWidth = 24871
        BandType = 0
      end
      object rptFolhaAluguelLabel3: TppLabel
        UserName = 'rptFolhaAluguelLabel3'
        Caption = 'Responsável:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 7673
        mmTop = 27517
        mmWidth = 21167
        BandType = 0
      end
      object rptFolhaAluguel_lblResponsavel: TppLabel
        UserName = 'rptFolhaAluguel_lblResponsavel'
        Caption = 'Responsável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 28575
        mmTop = 27517
        mmWidth = 16669
        BandType = 0
      end
      object ppLogoFolhaAluguel: TppImage
        UserName = 'ppLogoFolhaAluguel'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'Label68'
        Caption = 'Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 17727
        mmTop = 35983
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel129: TppLabel
        UserName = 'Label129'
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 145257
        mmTop = 35983
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel130: TppLabel
        UserName = 'Label130'
        Caption = 'Nosso Número'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 160338
        mmTop = 35983
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel131: TppLabel
        UserName = 'Label131'
        Caption = 'Descontos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 245005
        mmTop = 35983
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel132: TppLabel
        UserName = 'Label132'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 276490
        mmTop = 35983
        mmWidth = 5821
        BandType = 0
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 0
        mmTop = 34925
        mmWidth = 283898
        BandType = 0
      end
      object ppLabel137: TppLabel
        UserName = 'Label137'
        Caption = 'Origem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 111125
        mmTop = 35983
        mmWidth = 8996
        BandType = 0
      end
      object plblDATAPROGRAMADA: TppLabel
        UserName = 'plblDATAPROGRAMADA'
        Caption = 'Data Programada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 195263
        mmTop = 36248
        mmWidth = 20278
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 16669
      mmPrintPosition = 0
      object rptFolhaAluguel_Separador: TppLine
        OnPrint = rptCCContrato_SeparadorPrint
        UserName = 'rptFolhaAluguel_Separador'
        ParentHeight = True
        ParentWidth = True
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 16669
        mmLeft = 0
        mmTop = 0
        mmWidth = 283898
        BandType = 4
      end
      object rptFolhaAluguel_FundoBandaDetalhe: TppShape
        OnPrint = rptFolhaAluguel_FundoBandaDetalhePrint
        UserName = 'rptFolhaAluguel_FundoBandaDetalhe'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 16669
        mmLeft = 0
        mmTop = 0
        mmWidth = 283898
        BandType = 4
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'ppDBMemo3'
        CharWrap = True
        DataField = 'TIPO_RECDES'
        DataPipeline = pplFolhaAluguel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplFolhaAluguel'
        mmHeight = 15875
        mmLeft = 121179
        mmTop = 529
        mmWidth = 23019
        BandType = 4
        mmBottomOffset = 1058
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText3: TppDBText
        UserName = 'ppDBText3'
        DataField = 'DATAVENCIMENTO'
        DataPipeline = pplFolhaAluguel
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplFolhaAluguel'
        mmHeight = 2910
        mmLeft = 178859
        mmTop = 265
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'ppDBText12'
        BlankWhenZero = True
        DataField = 'TOT_CONTRATO'
        DataPipeline = pplFolhaAluguel
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFolhaAluguel'
        mmHeight = 2910
        mmLeft = 223309
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object rptContratoDBMemo1: TppDBMemo
        UserName = 'rptContratoDBMemo1'
        CharWrap = True
        DataField = 'CONNOME'
        DataPipeline = pplFolhaAluguel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplFolhaAluguel'
        mmHeight = 15875
        mmLeft = 17727
        mmTop = 529
        mmWidth = 38629
        BandType = 4
        mmBottomOffset = 1058
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptFolhaAluguelDBMemo1: TppDBMemo
        UserName = 'rptFolhaAluguelDBMemo1'
        CharWrap = True
        DataField = 'FORMA_PAGAMENTO'
        DataPipeline = pplFolhaAluguel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplFolhaAluguel'
        mmHeight = 15875
        mmLeft = 56886
        mmTop = 529
        mmWidth = 53711
        BandType = 4
        mmBottomOffset = 1058
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText68: TppDBText
        UserName = 'DBText68'
        DataField = 'CONNUMERO'
        DataPipeline = pplFolhaAluguel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFolhaAluguel'
        mmHeight = 2910
        mmLeft = 0
        mmTop = 529
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText69: TppDBText
        UserName = 'DBText69'
        DataField = 'NOSSONUMERO'
        DataPipeline = pplFolhaAluguel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFolhaAluguel'
        mmHeight = 2910
        mmLeft = 161132
        mmTop = 265
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText70: TppDBText
        UserName = 'DBText70'
        DataField = 'IDDOCUMENTO'
        DataPipeline = pplFolhaAluguel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFolhaAluguel'
        mmHeight = 2910
        mmLeft = 145257
        mmTop = 265
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText71: TppDBText
        UserName = 'DBText71'
        BlankWhenZero = True
        DataField = 'TOT_DESC'
        DataPipeline = pplFolhaAluguel
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFolhaAluguel'
        mmHeight = 2910
        mmLeft = 243417
        mmTop = 529
        mmWidth = 18521
        BandType = 4
      end
      object ppTotal: TppVariable
        UserName = 'Total'
        AutoSize = False
        CalcOrder = 0
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 263261
        mmTop = 529
        mmWidth = 19050
        BandType = 4
      end
      object ppDBMemo21: TppDBMemo
        UserName = 'DBMemo21'
        CharWrap = True
        DataField = 'DESCORIGEMLANC'
        DataPipeline = pplFolhaAluguel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplFolhaAluguel'
        mmHeight = 15875
        mmLeft = 111125
        mmTop = 529
        mmWidth = 9525
        BandType = 4
        mmBottomOffset = 1058
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object pdbtxtDATAPROGRAMADA: TppDBText
        UserName = 'pdbtxtDATAPROGRAMADA'
        DataField = 'DATAPROGRAMADA'
        DataPipeline = pplFolhaAluguel
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplFolhaAluguel'
        mmHeight = 2910
        mmLeft = 195263
        mmTop = 265
        mmWidth = 14817
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 283898
        BandType = 8
      end
      object ppLabel25: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel25'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 283634
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 247650
        mmTop = 2910
        mmWidth = 35454
        BandType = 8
      end
    end
    object rptFolhaAluguelSummaryBand1: TppSummaryBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
      object rptFolhaAluguelLine1: TppLine
        UserName = 'rptFolhaAluguelLine1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 283898
        BandType = 7
      end
      object rptFolhaAluguelLabel4: TppLabel
        UserName = 'rptFolhaAluguelLabel4'
        Caption = 'Total de Contratos:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 2381
        mmTop = 3440
        mmWidth = 24342
        BandType = 7
      end
      object ppDBCalc79: TppDBCalc
        UserName = 'DBCalc79'
        DataField = 'CONNUMERO'
        DataPipeline = pplFolhaAluguel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pplFolhaAluguel'
        mmHeight = 2910
        mmLeft = 27781
        mmTop = 3440
        mmWidth = 22754
        BandType = 7
      end
      object ppRegion1: TppRegion
        UserName = 'Region1'
        mmHeight = 6085
        mmLeft = 220663
        mmTop = 1852
        mmWidth = 62706
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppDBCalc83: TppDBCalc
          UserName = 'DBCalc83'
          DataField = 'TOT_CONTRATO'
          DataPipeline = pplFolhaAluguel
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFolhaAluguel'
          mmHeight = 2910
          mmLeft = 222515
          mmTop = 3440
          mmWidth = 19315
          BandType = 7
        end
        object ppDBCalc84: TppDBCalc
          UserName = 'DBCalc84'
          DataField = 'TOT_DESC'
          DataPipeline = pplFolhaAluguel
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFolhaAluguel'
          mmHeight = 2910
          mmLeft = 243682
          mmTop = 3440
          mmWidth = 18521
          BandType = 7
        end
        object ppDBCalc85: TppDBCalc
          UserName = 'DBCalc801'
          DataField = 'VLR_TOTAL'
          DataPipeline = pplFolhaAluguel
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFolhaAluguel'
          mmHeight = 2910
          mmLeft = 263261
          mmTop = 3440
          mmWidth = 19050
          BandType = 7
        end
      end
      object ppLabel198: TppLabel
        UserName = 'Label198'
        Caption = 'Valor Total da Folha de Aluguéis:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 179388
        mmTop = 3440
        mmWidth = 38629
        BandType = 7
      end
      object IResAluguelSegreg: TppSubReport
        OnPrint = IResAluguelSegregPrint
        UserName = 'IResAluguelSegreg'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplTotal'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 11642
        mmWidth = 283898
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport8: TppChildReport
          AutoStop = False
          DataPipeline = pplTotal
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 13229
          PrinterSetup.mmMarginLeft = 6615
          PrinterSetup.mmMarginRight = 6615
          PrinterSetup.mmMarginTop = 13229
          PrinterSetup.mmPaperHeight = 210080
          PrinterSetup.mmPaperWidth = 297128
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utScreenPixels
          Left = 480
          Top = 264
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplTotal'
          object ppTitleBand7: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object ppLTopResumoAlug: TppLine
              UserName = 'LTopResumoAlug'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 529
              mmTop = 6879
              mmWidth = 110596
              BandType = 1
            end
            object ppLblSegFolhaAluguel: TppLabel
              UserName = 'LblSegFolhaAluguel'
              Caption = 'Resumo de Segregação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 4106
              mmLeft = 529
              mmTop = 1323
              mmWidth = 39836
              BandType = 1
            end
            object pplblPlanoPrev: TppLabel
              UserName = 'lblPlanoPrev'
              Caption = 'Plano'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3810
              mmLeft = 529
              mmTop = 7938
              mmWidth = 8678
              BandType = 1
            end
            object ppLAlugSegreg: TppLine
              UserName = 'LAlugSegreg'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 529
              mmTop = 12171
              mmWidth = 110596
              BandType = 1
            end
            object pplblPatroSegAluguel: TppLabel
              UserName = 'lblPatroSegAluguel'
              Caption = 'Patrocinadora'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3810
              mmLeft = 43921
              mmTop = 7938
              mmWidth = 21421
              BandType = 1
            end
            object ppLblPercSegAluguel: TppLabel
              UserName = 'LblPercSegAluguel'
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3810
              mmLeft = 74348
              mmTop = 7938
              mmWidth = 2709
              BandType = 1
            end
            object ppLblVlrSegAluguel: TppLabel
              UserName = 'LblVlrSegAluguel'
              Caption = 'Valor (R$)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3810
              mmLeft = 91281
              mmTop = 7938
              mmWidth = 15028
              BandType = 1
            end
          end
          object ppDetailBand21: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppdbPlanoAlug: TppDBText
              UserName = 'dbPlanoAlug'
              DataField = 'PLANOPREV'
              DataPipeline = pplTotal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'pplTotal'
              mmHeight = 3704
              mmLeft = 529
              mmTop = 265
              mmWidth = 35983
              BandType = 4
            end
            object ppdbPatroAlug: TppDBText
              UserName = 'dbPatroAlug'
              DataField = 'PATRO'
              DataPipeline = pplTotal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'pplTotal'
              mmHeight = 3598
              mmLeft = 43656
              mmTop = 265
              mmWidth = 17198
              BandType = 4
            end
            object ppdbPercAlug: TppDBText
              UserName = 'dbPercAlug'
              DataField = 'PERCENTRATEIO'
              DataPipeline = pplTotal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplTotal'
              mmHeight = 3598
              mmLeft = 69321
              mmTop = 265
              mmWidth = 13229
              BandType = 4
            end
            object ppdbVlrAlugSegreg: TppDBText
              UserName = 'dbVlrAlugSegreg'
              DataField = 'VALOR'
              DataPipeline = pplTotal
              DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplTotal'
              mmHeight = 3598
              mmLeft = 87577
              mmTop = 265
              mmWidth = 18785
              BandType = 4
            end
          end
          object ppSummaryBand14: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650611
        44657461696C4265666F72655072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F75726365067E70726F63656475726520446574
        61696C4265666F72655072696E743B0D0A626567696E0D0A202020546F74616C
        2E4173457874656E646564203A3D206C466F6C6861416C756775656C5B27544F
        545F434F4E545241544F275D202D206C466F6C6861416C756775656C5B27544F
        545F44455343275D3B0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        0644657461696C094576656E744E616D65060B4265666F72655072696E740745
        76656E74494402180000}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object qryFolhaAluguel: TwwQuery
    OnCalcFields = qryFolhaAluguelCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   DECODE(LI.FLGORIGEMLANC, '#39'F'#39', '#39'FOL'#39','#39'M'#39','#39'MAN'#39','#39'I'#39','#39'IMP'#39') AS D' +
        'ESCORIGEMLANC,'
      '   LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO,'
      '   SUM(LI.VLRLANCRECEB) AS TOT_CONTRATO,'
      '   DE.TOT_DESC,'
      '   C.CONNUMERO, C.CONNOME,'
      ''
      '   PF.DESCRICAO AS FORMA_PAGAMENTO,'
      '   T.DESCCUSTORECIMO AS TIPO_RECDES,'
      '   LI.IDDOCUMENTO, D.NOSSONUMERO,'
      ''
      
        '   ( NVL(SUM(LI.VLRLANCRECEB),0) - NVL(DE.TOT_DESC,0) ) AS VLR_T' +
        'OTAL'
      '   , D.DATAPROGRAMADA'
      'FROM'
      '   DOCUMENTO D,'
      '   LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C,'
      '   TIPOCUSTORECIMOV T, PORTADORFORMA PF,'
      '   ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC'
      '       FROM ALTERALANCIMOVEL A, TIPOALTERADOR T'
      '      WHERE A.CODALTERADOR = T.CODALTERADOR'
      '        AND T.ACRESDECRES = '#39'C'#39
      '      GROUP BY IDDOCUMENTO ) DE'
      ''
      'WHERE'
      '1=2 AND ( LI.RECPAG = '#39'R'#39' )'
      '    AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      '    AND ( C.CODPORTFORMA = PF.CODPORTFORMA )'
      '    AND ( C.FLGTIPOCONTRATO = '#39'L'#39' )'
      '    AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO )'
      '    AND ( LI.MESCOMPETENCIA =:MES )'
      '    AND ( LI.ANOCOMPETENCIA =:ANO )'
      '    AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO(+) )'
      '    AND ( LI.IDDOCUMENTO = DE.IDDOCUMENTO(+) )'
      
        '    AND ( (:PIDAMINIMOVEL IS NULL) OR (C.IDADMINIMOVEL =:PIDAMIN' +
        'IMOVEL) )'
      
        '    AND ( (:PIDRESPONSAVEL IS NULL) OR (C.IDRESPONSAVEL =:PIDRES' +
        'PONSAVEL) )'
      
        '    AND ( (:PIDCONTRATO IS NULL) OR (C.IDCONTRATOIMOVEL =:PIDCON' +
        'TRATO) )'
      
        '    AND ( (:PIDLOCATARIO IS NULL) OR (C.IDLOCATARIO =:PIDLOCATAR' +
        'IO) )'
      
        '    AND ( (:PORIGEMLANCAMENTO IS NULL) OR (LI.FLGORIGEMLANC  = :' +
        'PORIGEMLANCAMENTO) )'
      ''
      
        '    AND ( ( (:PFILTRO IS NULL) AND ((:PIDTIPORECEITA IS NULL) OR' +
        ' (LI.IDTIPOCUSTORECIMO <> :PIDTIPORECEITA)) ) OR'
      
        '          ( (:PFILTRO IS NOT NULL) AND ((:PIDTIPORECEITA IS NULL' +
        ') OR (LI.IDTIPOCUSTORECIMO = :PIDTIPORECEITA)) ) )'
      ''
      'GROUP BY'
      '   DECODE(LI.FLGORIGEMLANC, '#39'F'#39', '#39'FOL'#39','#39'M'#39','#39'MAN'#39','#39'I'#39','#39'IMP'#39'),'
      '   LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO,'
      '   DE.TOT_DESC, C.CONNUMERO, C.CONNOME,'
      '   PF.DESCRICAO,'
      '   T.IDTIPOCUSTORECIMO,'
      '   T.DESCCUSTORECIMO, LI.IDDOCUMENTO,'
      '   D.NOSSONUMERO'
      ', D.DATAPROGRAMADA'
      'ORDER BY'
      
        '   DECODE('#39'NOME'#39', '#39'NOME'#39', C.CONNOME, '#39'NUMERO'#39', C.CONNUMERO, '#39'VAL' +
        'OR'#39', SUM(LI.VLRLANCRECEB), '#39'NOSSONUMERO'#39', D.NOSSONUMERO, '#39'DATAVE' +
        'NCIMENTO'#39', LI.DATAVENCIMENTO)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 640
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDAMINIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDAMINIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORIGEMLANCAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORIGEMLANCAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPORECEITA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPORECEITA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPORECEITA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPORECEITA'
        ParamType = ptInput
      end>
    object qryFolhaAluguelIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'LANCAMENTOSIMOVEL.IDCONTRATOIMOVEL'
    end
    object qryFolhaAluguelDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
      Origin = 'LANCAMENTOSIMOVEL.DATAVENCIMENTO'
    end
    object qryFolhaAluguelTOT_CONTRATO: TFloatField
      FieldName = 'TOT_CONTRATO'
      Origin = 'LANCAMENTOSIMOVEL.VLRLANCRECEB'
    end
    object qryFolhaAluguelCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
      Origin = '"CM.CONTRATOIMOVEL".CONNUMERO'
    end
    object qryFolhaAluguelCONNOME: TStringField
      FieldName = 'CONNOME'
      Origin = '"CM.CONTRATOIMOVEL".CONNOME'
      Size = 60
    end
    object qryFolhaAluguelFORMA_PAGAMENTO: TStringField
      FieldName = 'FORMA_PAGAMENTO'
      Origin = 'PORTADORFORMA.DESCRICAO'
      Size = 50
    end
    object qryFolhaAluguelTIPO_RECDES: TStringField
      FieldName = 'TIPO_RECDES'
      Origin = 'TIPOCUSTORECIMOV.DESCCUSTORECIMO'
      Size = 60
    end
    object qryFolhaAluguelCONTRATO_EXTENSO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CONTRATO_EXTENSO'
      Size = 100
      Calculated = True
    end
    object qryFolhaAluguelNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
    end
    object qryFolhaAluguelTOT_DESC: TFloatField
      FieldName = 'TOT_DESC'
    end
    object qryFolhaAluguelIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
    end
    object qryFolhaAluguelDESCORIGEMLANC: TStringField
      FieldName = 'DESCORIGEMLANC'
      Size = 6
    end
    object dtmfldFolhaAluguelDATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
    end
    object qryFolhaAluguelVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
  end
  object dsFolhaAluguel: TwwDataSource
    DataSet = qryFolhaAluguel
    Left = 640
    Top = 212
  end
  object pplFolhaAluguel: TppBDEPipeline
    DataSource = dsFolhaAluguel
    UserName = 'lFolhaAluguel'
    Left = 652
    Top = 260
    object pplFolhaAluguelppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplFolhaAluguelppField2: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object pplFolhaAluguelppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_CONTRATO'
      FieldName = 'TOT_CONTRATO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplFolhaAluguelppField4: TppField
      FieldAlias = 'CONNUMERO'
      FieldName = 'CONNUMERO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 3
    end
    object pplFolhaAluguelppField5: TppField
      FieldAlias = 'CONNOME'
      FieldName = 'CONNOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pplFolhaAluguelppField6: TppField
      FieldAlias = 'FORMA_PAGAMENTO'
      FieldName = 'FORMA_PAGAMENTO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object pplFolhaAluguelppField7: TppField
      FieldAlias = 'TIPO_RECDES'
      FieldName = 'TIPO_RECDES'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object pplFolhaAluguelppField8: TppField
      FieldAlias = 'CONTRATO_EXTENSO'
      FieldName = 'CONTRATO_EXTENSO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 7
    end
    object pplFolhaAluguelppField9: TppField
      FieldAlias = 'NOSSONUMERO'
      FieldName = 'NOSSONUMERO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 8
    end
    object pplFolhaAluguelppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_DESC'
      FieldName = 'TOT_DESC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplFolhaAluguelppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDDOCUMENTO'
      FieldName = 'IDDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplFolhaAluguelppField12: TppField
      FieldAlias = 'DESCORIGEMLANC'
      FieldName = 'DESCORIGEMLANC'
      FieldLength = 6
      DisplayWidth = 6
      Position = 11
    end
    object pfldFolhaAluguelDATAPROGRAMADA: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object pplFolhaAluguelppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_TOTAL'
      FieldName = 'VLR_TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
  end
  object qryCC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   I.IDIMOVEL, I.IDIMOVELMESTRE, IM.IMONOME AS NOME_MESTRE,'
      '   I.IMONOME,'
      ''
      '   (IM.IMONOME||'#39' - '#39'||I.IMONOME) AS NOME_EXTENSO,'
      ''
      '   T.DESCCUSTORECIMO,'
      ''
      
        '   LI.DATALANCAMENTO, LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.A' +
        'NOCOMPETENCIA,'
      ''
      '   TA.DESCRICAO,'
      ''
      '   D.RECPAG, D.STATUS, D.NODOCUMENTO, D.NUMAPGR,'
      ''
      '   LD.CODDOCUMENTO, LD.CODALTERADOR, LD.OPERACAO,'
      '   LD.VALOR, LD.DEBCRE, LD.HISTORICOCOMPL, LD.DATALANCTO,'
      ''
      '   PFC.NOME AS NF_FORCLI, PFC.RAZAOSOCIAL AS RS_FORCLI,'
      ''
      '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', LI.DATAVENCIMENTO,'
      
        '      DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LI.DATAVENCIMENTO, LD.DATA' +
        'LANCTO)) AS DATA,'
      ''
      '   ('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE(' +
        'LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '   ) AS TOT_RECEBER,'
      ''
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) AS TOT_RECEBIDO,'
      ''
      '   ('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE(' +
        'LD.DEBCRE, '#39'C'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '   ) AS TOT_PAGAR,'
      ''
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) AS TOT_PAGO,'
      ''
      '   ('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE(' +
        'LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0)'
      '   ) AS SALDO_RECEB,'
      ''
      '   ('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE(' +
        'LD.DEBCRE, '#39'C'#39', LD.VALOR, LD.VALOR * -1), 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0)'
      '   ) AS SALDO_PAGAR'
      ''
      'FROM'
      '   PESSOA PFC,'
      '   DOCUMENTO D, IMOVEL I, IMOVEL IM,'
      '   TIPOCUSTORECIMOV T, LANCAMENTOSIMOVEL LI,'
      '   CONTRATOXIMOVEL CX, CONTRATOIMOVEL C,'
      '   TIPOALTERADOR TA, LANCTODOCUM LD'
      ''
      'WHERE'
      ''
      '   1=2 AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   AND ( LI.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( LI.IDIMOVEL = CX.IDIMOVEL(+) )'
      '   AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) )'
      '   AND ( C.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL )'
      '   AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )'
      '   AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )'
      '   AND ( LD.CODALTERADOR = TA.CODALTERADOR(+) )'
      '   AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO )'
      '   AND ( LI.IDFORCLI = PFC.IDPESSOA )'
      ''
      'ORDER BY'
      '   IM.IMONOME, I.IMONOME,'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LI.DATAVENCIMENTO, LD.DATALAN' +
        'CTO)')
    ValidateWithMask = True
    Left = 530
    Top = 56
    object StringField1: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCALC'
      Size = 25
      Calculated = True
    end
    object FloatField1: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object FloatField2: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object StringField2: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object StringField3: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATALANCAMENTO'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object FloatField3: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object FloatField4: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object StringField4: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object StringField5: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
    object StringField6: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object FloatField5: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object FloatField6: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object FloatField7: TFloatField
      FieldName = 'CODALTERADOR'
    end
    object StringField7: TStringField
      FieldName = 'OPERACAO'
      Size = 2
    end
    object FloatField8: TFloatField
      FieldName = 'VALOR'
    end
    object StringField8: TStringField
      FieldName = 'DEBCRE'
      Size = 1
    end
    object StringField9: TStringField
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DATALANCTO'
    end
    object StringField10: TStringField
      FieldName = 'NF_FORCLI'
      Size = 60
    end
    object StringField11: TStringField
      FieldName = 'RS_FORCLI'
      Size = 60
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'DATA'
    end
    object FloatField9: TFloatField
      FieldName = 'TOT_RECEBER'
    end
    object FloatField10: TFloatField
      FieldName = 'TOT_RECEBIDO'
    end
    object FloatField11: TFloatField
      FieldName = 'TOT_PAGAR'
    end
    object FloatField12: TFloatField
      FieldName = 'TOT_PAGO'
    end
    object FloatField13: TFloatField
      FieldName = 'SALDO_RECEB'
    end
    object FloatField14: TFloatField
      FieldName = 'SALDO_PAGAR'
    end
    object StringField12: TStringField
      FieldName = 'IMONOME'
      Size = 60
    end
    object qryCCNOME_EXTENSO: TStringField
      FieldName = 'NOME_EXTENSO'
      Size = 123
    end
    object qryCCNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
    end
  end
  object dsCC: TwwDataSource
    DataSet = qryCC
    Left = 530
    Top = 68
  end
  object pplCC: TppBDEPipeline
    DataSource = dsCC
    UserName = 'lCC'
    Left = 530
    Top = 80
  end
  object rptCC: TppReport
    AutoStop = False
    DataPipeline = pplCC
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 11906
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 530
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplCC'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 40
      mmHeight = 50536
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        AutoSize = False
        Caption = 'Conta Corrente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 37306
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'ppLabel5'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 37306
        mmTop = 1588
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
        Caption = 'Mês de Competência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 18521
        mmWidth = 33338
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'ppLabel8'
        Caption = 'Período de Datas:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 21960
        mmWidth = 26988
        BandType = 0
      end
      object rptCC_lblCompetencia: TppLabel
        UserName = 'rptCC_lblCompetencia'
        Caption = 'rptCC_lblCompetencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 18521
        mmWidth = 27517
        BandType = 0
      end
      object rptCC_lblDatas: TppLabel
        UserName = 'rptCC_lblDatas'
        Caption = 'rptCC_lblDatas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 21960
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'ppLabel13'
        Caption = 'Tipo de Receita / Despesa:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 187061
        mmTop = 21960
        mmWidth = 39688
        BandType = 0
      end
      object rptCC_lblTipoRecDes: TppLabel
        UserName = 'rptCC_lblTipoRecDes'
        AutoSize = False
        Caption = 'rptCC_lblTipoRecDes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 226484
        mmTop = 21960
        mmWidth = 45773
        BandType = 0
      end
      object rptCC_lblRecPag: TppLabel
        UserName = 'rptCC_lblRecPag'
        AutoSize = False
        Caption = 'rptCC_lblRecPag'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 226484
        mmTop = 27252
        mmWidth = 45773
        BandType = 0
      end
      object rptCC_lblPrevEfetivo: TppLabel
        UserName = 'rptCC_lblPrevEfetivo'
        AutoSize = False
        Caption = 'rptCC_lblPrevEfetivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 226484
        mmTop = 31485
        mmWidth = 45773
        BandType = 0
      end
      object rptCC_lblEmAberto: TppLabel
        UserName = 'rptCC_lblEmAberto'
        AutoSize = False
        Caption = 'Apenas lançamentos em aberto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 226484
        mmTop = 35719
        mmWidth = 45773
        BandType = 0
      end
      object rptCCLine2: TppLine
        UserName = 'rptCCLine2'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 50006
        mmWidth = 271993
        BandType = 0
      end
      object rptCCLabel1: TppLabel
        UserName = 'rptCCLabel1'
        Caption = 'Imóvel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 47096
        mmWidth = 7673
        BandType = 0
      end
      object rptCCLabel2: TppLabel
        UserName = 'rptCCLabel2'
        Caption = 'Favorecido / Debitado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 43656
        mmTop = 47096
        mmWidth = 26723
        BandType = 0
      end
      object rptCCLabel3: TppLabel
        UserName = 'rptCCLabel3'
        Caption = 'Tipo Receita / Despesa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 94721
        mmTop = 47096
        mmWidth = 27252
        BandType = 0
      end
      object rptCCLabel4: TppLabel
        UserName = 'rptCCLabel4'
        Caption = 'Alterador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 134938
        mmTop = 47096
        mmWidth = 10848
        BandType = 0
      end
      object rptCCLabel5: TppLabel
        UserName = 'rptCCLabel5'
        Caption = 'Nº Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 153459
        mmTop = 47096
        mmWidth = 17198
        BandType = 0
      end
      object rptCCLabel6: TppLabel
        UserName = 'rptCCLabel6'
        Caption = 'A Receber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 186267
        mmTop = 47096
        mmWidth = 11906
        BandType = 0
      end
      object rptCCLabel7: TppLabel
        UserName = 'rptCCLabel7'
        Caption = 'Recebido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 202142
        mmTop = 47096
        mmWidth = 11377
        BandType = 0
      end
      object rptCCLabel8: TppLabel
        UserName = 'rptCCLabel8'
        Caption = 'A Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 219869
        mmTop = 47096
        mmWidth = 8996
        BandType = 0
      end
      object rptCCLabel9: TppLabel
        UserName = 'rptCCLabel9'
        Caption = 'Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 238125
        mmTop = 47096
        mmWidth = 6085
        BandType = 0
      end
      object rptCCLabel10: TppLabel
        UserName = 'rptCCLabel10'
        Caption = 'Compet.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 246328
        mmTop = 47096
        mmWidth = 10054
        BandType = 0
      end
      object rptCCLabel11: TppLabel
        UserName = 'rptCCLabel11'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 262467
        mmTop = 47096
        mmWidth = 5292
        BandType = 0
      end
      object rptCC_lblTipoData: TppLabel
        UserName = 'rptCC_lblTipoData'
        Caption = 'por Data de Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 33073
        mmTop = 35719
        mmWidth = 30692
        BandType = 0
      end
      object rptCC_lblTipoImovel: TppLabel
        UserName = 'rptCC_lblTipoImovel'
        AutoSize = False
        Caption = 'Todos os Tipos de Imóvel / Segmento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 84667
        mmTop = 31485
        mmWidth = 102659
        BandType = 0
      end
      object rptCCLabel12: TppLabel
        UserName = 'rptCCLabel12'
        Caption = 'Nº AP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 175684
        mmTop = 47096
        mmWidth = 6350
        BandType = 0
      end
      object ppLogoContaCorrente: TppImage
        UserName = 'ppLogoContaCorrente'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 20108
      mmPrintPosition = 0
      object ppShape3: TppShape
        UserName = 'ppShape3'
        Brush.Color = 13040076
        ParentHeight = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 20108
        mmLeft = 0
        mmTop = 0
        mmWidth = 272257
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'ppLine1'
        ParentHeight = True
        ParentWidth = True
        StretchWithParent = True
        Visible = False
        Weight = 0.75
        mmHeight = 20108
        mmLeft = 0
        mmTop = 0
        mmWidth = 271993
        BandType = 4
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'ppDBMemo2'
        CharWrap = True
        DataField = 'NOME_EXTENSO'
        DataPipeline = pplCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCC'
        mmHeight = 15875
        mmLeft = 0
        mmTop = 794
        mmWidth = 42863
        BandType = 4
        mmBottomOffset = 529
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo4: TppDBMemo
        UserName = 'ppDBMemo4'
        CharWrap = True
        DataField = 'DESCCUSTORECIMO'
        DataPipeline = pplCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCC'
        mmHeight = 15875
        mmLeft = 94721
        mmTop = 794
        mmWidth = 32544
        BandType = 4
        mmBottomOffset = 529
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText2: TppDBText
        UserName = 'ppDBText2'
        BlankWhenZero = True
        DataField = 'TOT_PAGO'
        DataPipeline = pplCC
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCC'
        mmHeight = 2646
        mmLeft = 229130
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'ppDBText5'
        DataField = 'DATA'
        DataPipeline = pplCC
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplCC'
        mmHeight = 2646
        mmLeft = 258234
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'ppLabel20'
        AutoSize = False
        Caption = ' / '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 249238
        mmTop = 794
        mmWidth = 2381
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'ppDBText6'
        DataField = 'MESCOMPETENCIA'
        DataPipeline = pplCC
        DisplayFormat = '00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCC'
        mmHeight = 2646
        mmLeft = 246328
        mmTop = 794
        mmWidth = 3175
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'ppDBText7'
        DataField = 'ANOCOMPETENCIA'
        DataPipeline = pplCC
        DisplayFormat = '0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCC'
        mmHeight = 2646
        mmLeft = 251355
        mmTop = 794
        mmWidth = 6350
        BandType = 4
      end
      object ppDBMemo5: TppDBMemo
        UserName = 'ppDBMemo5'
        CharWrap = True
        DataField = 'DESCALC'
        DataPipeline = pplCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCC'
        mmHeight = 15875
        mmLeft = 128059
        mmTop = 794
        mmWidth = 24342
        BandType = 4
        mmBottomOffset = 529
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText8: TppDBText
        UserName = 'ppDBText8'
        BlankWhenZero = True
        DataField = 'TOT_PAGAR'
        DataPipeline = pplCC
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCC'
        mmHeight = 2646
        mmLeft = 213784
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'ppDBText13'
        BlankWhenZero = True
        DataField = 'TOT_RECEBIDO'
        DataPipeline = pplCC
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCC'
        mmHeight = 2646
        mmLeft = 198438
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'ppDBText14'
        BlankWhenZero = True
        DataField = 'TOT_RECEBER'
        DataPipeline = pplCC
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCC'
        mmHeight = 2646
        mmLeft = 183092
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBMemo11: TppDBMemo
        UserName = 'ppDBMemo11'
        CharWrap = True
        DataField = 'NF_FORCLI'
        DataPipeline = pplCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCC'
        mmHeight = 15875
        mmLeft = 43656
        mmTop = 794
        mmWidth = 50271
        BandType = 4
        mmBottomOffset = 529
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText15: TppDBText
        UserName = 'ppDBText15'
        DataField = 'NODOCUMENTO'
        DataPipeline = pplCC
        DisplayFormat = '####################0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCC'
        mmHeight = 2646
        mmLeft = 153459
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
      object rptCCDBText1: TppDBText
        UserName = 'rptCCDBText1'
        BlankWhenZero = True
        DataField = 'NUMAPGR'
        DataPipeline = pplCC
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCC'
        mmHeight = 2381
        mmLeft = 173302
        mmTop = 794
        mmWidth = 8731
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 40
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'ppLine3'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 271993
        BandType = 8
      end
      object ppLabel24: TppLabel
        UserName = 'ppLabel24'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc3: TppSystemVariable
        UserName = 'Calc3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 114300
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc4: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 236803
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
  end
  object ppLiberaLanc: TppBDEPipeline
    DataSource = dsLiberaLanc
    UserName = 'ppLiberaLanc'
    Left = 40
    Top = 352
    object ppLiberaLancppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDDOCUMENTO'
      FieldName = 'IDDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppLiberaLancppField2: TppField
      FieldAlias = 'NOMEUSUARIO'
      FieldName = 'NOMEUSUARIO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object ppLiberaLancppField3: TppField
      FieldAlias = 'MOTIVO'
      FieldName = 'MOTIVO'
      FieldLength = 200
      DisplayWidth = 200
      Position = 2
    end
    object ppLiberaLancppField4: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object ppLiberaLancppField5: TppField
      FieldAlias = 'DESCCUSTORECIMO'
      FieldName = 'DESCCUSTORECIMO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object ppLiberaLancppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL_LANC'
      FieldName = 'TOTAL_LANC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
  end
  object dsLiberaLanc: TwwDataSource
    DataSet = qryLiberaLanc
    Left = 40
    Top = 340
  end
  object qryLiberaLanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.IDDOCUMENTO,'
      '               US.NOMEUSUARIO,'
      '               C.MOTIVO,'
      '               C.DATA,'
      '               LAN.DESCCUSTORECIMO,'
      '               LAN.TOTAL_LANC'
      ''
      'FROM    CONCILIADOC C,'
      '        USUARIOSISTEMA US,'
      '        ('
      '        SELECT VL.IDPESSOA,'
      '                VL.IDDOCUMENTO,'
      '                VL.DESCCUSTORECIMO,'
      '                VL.IDTIPOCUSTORECIMO,'
      '                SUM(VL.VALOR_LANC) AS TOTAL_LANC'
      '         FROM VWLANCAMENTO VL'
      
        '         GROUP BY VL.IDPESSOA, VL.IDDOCUMENTO, VL.DESCCUSTORECIM' +
        'O, VL.IDTIPOCUSTORECIMO'
      '         ) LAN'
      ''
      'WHERE (C.IDUSUARIO = US.IDUSUARIO)'
      '  1=2 AND AND (C.IDDOCUMENTO = LAN.IDDOCUMENTO)'
      ''
      '  AND (LAN.IDPESSOA = :PIDPESSOA)'
      
        '  AND ((:PIDUSUARIOSISTEMA IS NULL) OR (C.IDUSUARIO = :PIDUSUARI' +
        'OSISTEMA))'
      
        '  AND ((:PIDTIPOCUSTORECIMO IS NULL) OR (LAN.IDTIPOCUSTORECIMO =' +
        ' :PIDTIPOCUSTORECIMO))'
      
        '  AND ((:PDATALIBERA1 IS NULL) OR (C.DATA BETWEEN :PDATALIBERA1 ' +
        'AND :PDATALIBERA2))'
      ''
      'ORDER BY C.DATA'
      ' ')
    ValidateWithMask = True
    Left = 40
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
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
        Name = 'PIDTIPOCUSTORECIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCUSTORECIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALIBERA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALIBERA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALIBERA2'
        ParamType = ptUnknown
      end>
  end
  object rptLiberaLanc: TppReport
    AutoStop = False
    DataPipeline = ppLiberaLanc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 40
    Top = 280
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppLiberaLanc'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21960
      mmPrintPosition = 0
      object ppLabel10: TppLabel
        UserName = 'Label11'
        Caption = 'Lançamentos Liberados'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 76200
        mmTop = 8731
        mmWidth = 48948
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel12: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84138
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label1'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 3175
        mmTop = 17198
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label2'
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 22754
        mmTop = 17198
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label3'
        Caption = 'Liberado por'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 168011
        mmTop = 17198
        mmWidth = 16933
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20902
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Motivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 112977
        mmTop = 17198
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = 'Receita / Despesa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 42598
        mmTop = 17198
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 101865
        mmTop = 17198
        mmWidth = 6879
        BandType = 0
      end
      object ppLogoLancLiberados: TppImage
        UserName = 'ppLogoLancLiberados'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText16: TppDBText
        UserName = 'DBText1'
        DataField = 'DATA'
        DataPipeline = ppLiberaLanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLiberaLanc'
        mmHeight = 4498
        mmLeft = 3175
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText2'
        DataField = 'IDDOCUMENTO'
        DataPipeline = ppLiberaLanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLiberaLanc'
        mmHeight = 4498
        mmLeft = 22754
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText3'
        DataField = 'NOMEUSUARIO'
        DataPipeline = ppLiberaLanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLiberaLanc'
        mmHeight = 4498
        mmLeft = 168011
        mmTop = 0
        mmWidth = 26988
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'TOTAL_LANC'
        DataPipeline = ppLiberaLanc
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLiberaLanc'
        mmHeight = 4498
        mmLeft = 94456
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object ppDBMemo12: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'MOTIVO'
        DataPipeline = ppLiberaLanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppLiberaLanc'
        mmHeight = 4498
        mmLeft = 110861
        mmTop = 0
        mmWidth = 55563
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo13: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'DESCCUSTORECIMO'
        DataPipeline = ppLiberaLanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppLiberaLanc'
        mmHeight = 4498
        mmLeft = 42333
        mmTop = 0
        mmWidth = 50536
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object ppLine5: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel16: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object dsFolhaComparativa: TwwDataSource
    DataSet = qryFolhaComparativa
    Left = 144
    Top = 356
  end
  object rptFolhaComparativa: TppReport
    AutoStop = False
    DataPipeline = ppFolhaComparativa
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 144
    Top = 280
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppFolhaComparativa'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30427
      mmPrintPosition = 0
      object ppLabel36: TppLabel
        UserName = 'Label11'
        Caption = 'Comparativo de Folha de Aluguel'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 529
        mmTop = 8467
        mmWidth = 196586
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 24871
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel37: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5556
        mmLeft = 529
        mmTop = 1588
        mmWidth = 196586
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label1'
        Caption = 'Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 25665
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label3'
        Caption = 'Situação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 182034
        mmTop = 25665
        mmWidth = 11906
        BandType = 0
      end
      object rptFolhaComparativa_lblPeriodoFim: TppLabel
        UserName = 'rptFolhaComparativa_lblPeriodoFim'
        Caption = 'lblPeriodoFim'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 123031
        mmTop = 25665
        mmWidth = 18256
        BandType = 0
      end
      object rptFolhaComparativa_lblPeriodoIni: TppLabel
        UserName = 'rptFolhaComparativa_lblPeriodoFim1'
        Caption = 'lblPeriodoIni'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 103717
        mmTop = 25665
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        AutoSize = False
        Caption = 'Responsável:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 16404
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        AutoSize = False
        Caption = 'Contrato:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 7938
        mmTop = 20108
        mmWidth = 13758
        BandType = 0
      end
      object rptFolhaComparativa_responsavel: TppLabel
        UserName = 'rptFolhaComparativa_responsavel'
        Caption = 'rptFolhaComparativa_responsavel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 22754
        mmTop = 16404
        mmWidth = 46567
        BandType = 0
      end
      object rptFolhaComparativa_contrato: TppLabel
        UserName = 'rptFolhaComparativa_contrato'
        Caption = 'rptFolhaComparativa_contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 22754
        mmTop = 20108
        mmWidth = 41275
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 29103
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = 'Início'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 145786
        mmTop = 25665
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label51'
        Caption = 'Término'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 164042
        mmTop = 25665
        mmWidth = 11113
        BandType = 0
      end
      object ppLogoComparaAluguel: TppImage
        UserName = 'ppLogoComparaAluguel'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppLine15: TppLine
        OnPrint = rptCCContrato_SeparadorPrint
        UserName = 'Line3'
        ParentHeight = True
        ParentWidth = True
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppShape4: TppShape
        OnPrint = rptFolhaAluguel_FundoBandaDetalhePrint
        UserName = 'Shape1'
        Brush.Color = 391845
        ParentHeight = True
        ParentWidth = True
        Pen.Color = clNone
        Pen.Style = psClear
        StretchWithParent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText1'
        DataField = 'CONTRATO_EXTENSO'
        DataPipeline = ppFolhaComparativa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFolhaComparativa'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 103452
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText3'
        DataField = 'SITUACAO'
        DataPipeline = ppFolhaComparativa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFolhaComparativa'
        mmHeight = 3704
        mmLeft = 182034
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'VALOR_ATU'
        DataPipeline = ppFolhaComparativa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppFolhaComparativa'
        mmHeight = 3175
        mmLeft = 124619
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'VALOR_ANT'
        DataPipeline = ppFolhaComparativa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppFolhaComparativa'
        mmHeight = 3175
        mmLeft = 103452
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'CONDATAINICIO'
        DataPipeline = ppFolhaComparativa
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFolhaComparativa'
        mmHeight = 3704
        mmLeft = 145786
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText201'
        DataField = 'CONDATAFIM'
        DataPipeline = ppFolhaComparativa
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFolhaComparativa'
        mmHeight = 3704
        mmLeft = 164042
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
      object ppLine14: TppLine
        UserName = 'Line14'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel46: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema1'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
    end
  end
  object ppFolhaComparativa: TppBDEPipeline
    DataSource = dsFolhaComparativa
    UserName = 'ppFolhaComparativa'
    Left = 144
    Top = 342
    object ppFolhaComparativappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppFolhaComparativappField2: TppField
      FieldAlias = 'CONTRATO_EXTENSO'
      FieldName = 'CONTRATO_EXTENSO'
      FieldLength = 83
      DisplayWidth = 83
      Position = 1
    end
    object ppFolhaComparativappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_ANT'
      FieldName = 'VALOR_ANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppFolhaComparativappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_ATU'
      FieldName = 'VALOR_ATU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppFolhaComparativappField5: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object ppFolhaComparativappField6: TppField
      FieldAlias = 'FLGSTATUS'
      FieldName = 'FLGSTATUS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object ppFolhaComparativappField7: TppField
      FieldAlias = 'CONNUMERO'
      FieldName = 'CONNUMERO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object ppFolhaComparativappField8: TppField
      FieldAlias = 'CONNOME'
      FieldName = 'CONNOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object ppFolhaComparativappField9: TppField
      FieldAlias = 'CONDATAINICIO'
      FieldName = 'CONDATAINICIO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object ppFolhaComparativappField10: TppField
      FieldAlias = 'CONDATAFIM'
      FieldName = 'CONDATAFIM'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 9
    end
  end
  object qryFolhaComparativa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CI.IDCONTRATOIMOVEL, CI.CONNUMERO, CI.CONNOME,'
      
        '   DECODE(CI.CONNUMERO, NULL, CI.CONNOME, (CI.CONNUMERO||'#39' - '#39'||' +
        'CI.CONNOME)) AS CONTRATO_EXTENSO,'
      '   ANT.VALOR AS VALOR_ANT, ATU.VALOR AS VALOR_ATU,'
      
        '   DECODE(CI.FLGSTATUS, '#39'R'#39', '#39'Rescindido'#39', '#39'V'#39', '#39'Vigente'#39', '#39'Ence' +
        'rrado'#39') AS SITUACAO,'
      '   CI.FLGSTATUS, CI.CONDATAINICIO, CI.CONDATAFIM'
      ''
      'FROM'
      '   CONTRATOIMOVEL CI,'
      '   ('
      '    SELECT'
      '       IDCONTRATOIMOVEL, SUM(VLRLANCOMRECEB) AS VALOR'
      '    FROM'
      '       LANCAMENTOSIMOVEL'
      '    WHERE'
      '       ( MESCOMPETENCIA = :PMESINI )'
      '       AND ( ANOCOMPETENCIA = :PANOINI )'
      '       AND ( FLGORIGEMLANC = '#39'F'#39' )'
      '    GROUP BY'
      '       IDCONTRATOIMOVEL'
      '   ) ANT,'
      '   ('
      '    SELECT'
      '       IDCONTRATOIMOVEL, SUM(VLRLANCOMRECEB) AS VALOR'
      '    FROM'
      '       LANCAMENTOSIMOVEL'
      '    WHERE'
      '       ( MESCOMPETENCIA = :PMESFIM )'
      '       AND ( ANOCOMPETENCIA = :PANOFIM )'
      '       AND ( FLGORIGEMLANC = '#39'F'#39' )'
      '    GROUP BY'
      '       IDCONTRATOIMOVEL'
      '   ) ATU'
      ''
      'WHERE'
      '   1=2 AND ( CI.IDCONTRATOIMOVEL = ANT.IDCONTRATOIMOVEL (+) )'
      '   AND ( CI.IDCONTRATOIMOVEL = ATU.IDCONTRATOIMOVEL (+) )'
      '   AND ( CI.FLGCOBRANCAAUTO = 1 )'
      
        '   AND ( (CI.FLGSTATUS = '#39'V'#39') OR (ANT.VALOR IS NOT NULL) OR (ATU' +
        '.VALOR IS NOT NULL) )'
      
        '   AND ( ( :PIDRESPONSAVEL IS NULL ) OR ( CI.IDRESPONSAVEL = :PI' +
        'DRESPONSAVEL ) )'
      
        '   AND ( ( :PIDCONTRATOIMOVEL IS NULL ) OR ( CI.IDCONTRATOIMOVEL' +
        ' = :PIDCONTRATOIMOVEL ) )'
      ''
      'ORDER BY'
      '   DECODE(:ORDEM, '#39'NOME'#39', CI.CONNOME, CI.CONNUMERO)'
      ''
      '')
    ValidateWithMask = True
    Left = 144
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PMESINI'
        ParamType = ptUnknown
        Value = '9'
      end
      item
        DataType = ftInteger
        Name = 'PANOINI'
        ParamType = ptUnknown
        Value = '2001'
      end
      item
        DataType = ftInteger
        Name = 'PMESFIM'
        ParamType = ptUnknown
        Value = '10'
      end
      item
        DataType = ftInteger
        Name = 'PANOFIM'
        ParamType = ptUnknown
        Value = '2001'
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
        Name = 'ORDEM'
        ParamType = ptUnknown
      end>
    object qryFolhaComparativaIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryFolhaComparativaCONTRATO_EXTENSO: TStringField
      FieldName = 'CONTRATO_EXTENSO'
      Size = 83
    end
    object qryFolhaComparativaVALOR_ANT: TFloatField
      FieldName = 'VALOR_ANT'
    end
    object qryFolhaComparativaVALOR_ATU: TFloatField
      FieldName = 'VALOR_ATU'
    end
    object qryFolhaComparativaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 10
    end
    object qryFolhaComparativaFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      FixedChar = True
      Size = 1
    end
    object qryFolhaComparativaCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryFolhaComparativaCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object qryFolhaComparativaCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
    end
    object qryFolhaComparativaCONDATAFIM: TDateTimeField
      FieldName = 'CONDATAFIM'
    end
  end
  object qryCCPlanoPatro: TwwQuery
    OnCalcFields = qryCCPlanoPatroCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   FT.NOME_PLANO,'
      '   FT.NOME_PATRO,'
      '   I.IDIMOVELMESTRE, IM.IMONOME AS NOME_MESTRE,'
      '   T.DESCCUSTORECIMO,'
      
        '   LI.DATALANCAMENTO, LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.A' +
        'NOCOMPETENCIA,'
      '   TA.DESCRICAO,'
      '   D.RECPAG, D.STATUS, D.NODOCUMENTO, D.NUMAPGR,'
      '   LD.CODDOCUMENTO, LD.CODALTERADOR, LD.OPERACAO,'
      '   LD.VALOR, LD.DEBCRE, LD.HISTORICOCOMPL, LD.DATALANCTO,'
      '   PFC.NOME AS NF_FORCLI, PFC.RAZAOSOCIAL AS RS_FORCLI,'
      ''
      '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', LI.DATAVENCIMENTO,'
      
        '      DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LI.DATAVENCIMENTO, LD.DATA' +
        'LANCTO)) AS DATA,'
      ''
      '   SUM(('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE(' +
        'LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '   ) * FT.FATOR) AS TOT_RECEBER,'
      ''
      
        '   SUM(DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', LD.' +
        'VALOR, 0), 0) * FT.FATOR) AS TOT_RECEBIDO,'
      ''
      '   SUM(('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE(' +
        'LD.DEBCRE, '#39'C'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '   ) * FT.FATOR) AS TOT_PAGAR,'
      ''
      
        '   SUM(DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'P'#39', LD.' +
        'VALOR, 0), 0) * FT.FATOR) AS TOT_PAGO,'
      ''
      '   SUM(('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE(' +
        'LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', LD.VALO' +
        'R, 0), 0)'
      '   ) * FT.FATOR) AS SALDO_RECEB,'
      ''
      '   SUM(('
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE(' +
        'LD.DEBCRE, '#39'C'#39', LD.VALOR, LD.VALOR * -1), 0), 0) +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'P'#39', LD.VALO' +
        'R, 0), 0)'
      '   ) * FT.FATOR) AS SALDO_PAGAR'
      ''
      'FROM'
      '   PESSOA PFC,'
      '   DOCUMENTO D, IMOVEL I, IMOVEL IM,'
      '   TIPOCUSTORECIMOV T, LANCAMENTOSIMOVEL LI,'
      '   CONTRATOXIMOVEL CX, CONTRATOIMOVEL C,'
      '   TIPOALTERADOR TA, LANCTODOCUM LD,'
      ''
      '   (SELECT PI.IDIMOVEL, PI.IDPATRO, PI.IDPLANOPREV,'
      '       PE.NOME AS NOME_PATRO, PL.NOME AS NOME_PLANO,'
      '       PI.FLGTIPO, PI.PPIPERCENTRATEIO, TT.TOTAL,'
      '       ROUND(DECODE(PI.FLGTIPO,'#39'P'#39',(PI.PPIPERCENTRATEIO / 100),'
      '                         '#39'C'#39',(PI.PPIPERCENTRATEIO / TT.TOTAL),'
      '                        NULL), 4) AS FATOR'
      '      FROM PLANOPATROXIMOVEL PI, PESSOA PE, PLANPREVCONTABIL PL,'
      '          (SELECT IDIMOVEL,'
      '                  SUM(PPIPERCENTRATEIO) AS TOTAL'
      '             FROM PLANOPATROXIMOVEL'
      '             GROUP BY IDIMOVEL) TT'
      '     WHERE PI.IDIMOVEL    = TT.IDIMOVEL'
      '       AND PI.IDPATRO     = PE.IDPESSOA'
      '       AND PI.IDPLANOPREV = PL.IDPLANOPREV ) FT'
      ''
      'WHERE  ( LI.ANOCOMPETENCIA = 2003 )'
      '   AND ( LI.MESCOMPETENCIA = 9 )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   AND ( LI.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( LI.IDIMOVEL = CX.IDIMOVEL(+) )'
      '   AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) )'
      '   AND ( C.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL )'
      '   AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )'
      '   AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )'
      '   AND ( LD.CODALTERADOR = TA.CODALTERADOR(+) )'
      '   AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO )'
      '   AND ( LI.IDFORCLI = PFC.IDPESSOA )'
      '   AND ( I.IDIMOVEL = FT.IDIMOVEL )'
      ''
      
        'GROUP BY FT.NOME_PLANO, FT.NOME_PATRO, I.IDIMOVELMESTRE, IM.IMON' +
        'OME,'
      
        '   T.DESCCUSTORECIMO, LI.DATALANCAMENTO, LI.DATAVENCIMENTO, LI.M' +
        'ESCOMPETENCIA, LI.ANOCOMPETENCIA,'
      '   TA.DESCRICAO, D.RECPAG, D.STATUS, D.NODOCUMENTO, D.NUMAPGR,'
      '   LD.CODDOCUMENTO, LD.CODALTERADOR, LD.OPERACAO,'
      '   LD.VALOR, LD.DEBCRE, LD.HISTORICOCOMPL, LD.DATALANCTO,'
      '   PFC.NOME, PFC.RAZAOSOCIAL,'
      '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', LI.DATAVENCIMENTO,'
      
        '      DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LI.DATAVENCIMENTO, LD.DATA' +
        'LANCTO))'
      ''
      'ORDER BY'
      '   FT.NOME_PATRO,'
      '   FT.NOME_PLANO,'
      '   NOME_MESTRE,'
      '   NF_FORCLI,'
      '   NODOCUMENTO,'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LI.DATAVENCIMENTO, LD.DATALAN' +
        'CTO)'
      ''
      '')
    ValidateWithMask = True
    Left = 255
    Top = 329
    object StringField13: TStringField
      DisplayWidth = 250
      FieldKind = fkCalculated
      FieldName = 'DESCALC'
      Size = 150
      Calculated = True
    end
    object FloatField16: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object StringField14: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object qryCCPlanoPatroNOME_PLANO: TStringField
      FieldName = 'NOME_PLANO'
      Size = 50
    end
    object qryCCPlanoPatroNOME_PATRO: TStringField
      FieldName = 'NOME_PATRO'
      Size = 60
    end
    object StringField16: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'DATALANCAMENTO'
    end
    object DateTimeField6: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object FloatField17: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object FloatField18: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object StringField17: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object StringField18: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
    object StringField19: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object FloatField19: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object FloatField20: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object FloatField21: TFloatField
      FieldName = 'CODALTERADOR'
    end
    object StringField20: TStringField
      FieldName = 'OPERACAO'
      Size = 2
    end
    object FloatField22: TFloatField
      FieldName = 'VALOR'
    end
    object StringField21: TStringField
      FieldName = 'DEBCRE'
      Size = 1
    end
    object StringField22: TStringField
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object DateTimeField7: TDateTimeField
      FieldName = 'DATALANCTO'
    end
    object StringField23: TStringField
      FieldName = 'NF_FORCLI'
      Size = 60
    end
    object StringField24: TStringField
      FieldName = 'RS_FORCLI'
      Size = 60
    end
    object DateTimeField8: TDateTimeField
      FieldName = 'DATA'
    end
    object FloatField23: TFloatField
      FieldName = 'TOT_RECEBER'
    end
    object FloatField24: TFloatField
      FieldName = 'TOT_RECEBIDO'
    end
    object FloatField25: TFloatField
      FieldName = 'TOT_PAGAR'
    end
    object FloatField26: TFloatField
      FieldName = 'TOT_PAGO'
    end
    object FloatField27: TFloatField
      FieldName = 'SALDO_RECEB'
    end
    object FloatField28: TFloatField
      FieldName = 'SALDO_PAGAR'
    end
    object FloatField29: TFloatField
      FieldName = 'NUMAPGR'
    end
  end
  object dsCCPlanoPatro: TwwDataSource
    DataSet = qryCCPlanoPatro
    Left = 255
    Top = 341
  end
  object pplCCPlanoPatro: TppBDEPipeline
    DataSource = dsCCPlanoPatro
    UserName = 'pplCCPlanoPatro'
    Left = 255
    Top = 353
  end
  object rptCCPlanoPatro: TppReport
    AutoStop = False
    DataPipeline = pplCCPlanoPatro
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 11906
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 255
    Top = 281
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplCCPlanoPatro'
    object ppHeaderBand5: TppHeaderBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 47361
      mmPrintPosition = 0
      object ppLabel56: TppLabel
        UserName = 'ppLabel26'
        AutoSize = False
        Caption = 'Conta Corrente por Plano Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 37835
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel57: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel27'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 37835
        mmTop = 1588
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'rptCCImovelLabel1'
        Caption = 'Mês de Competência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 17992
        mmWidth = 30692
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'rptCCImovelLabel2'
        Caption = 'Período de Datas:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 6350
        mmTop = 21431
        mmWidth = 25665
        BandType = 0
      end
      object rptCCPlanoPatro_lblCompetencia: TppLabel
        UserName = 'rptCCPlanoPatro_lblCompetencia'
        Caption = 'rptCCPlanoPatro_lblCompetencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 17992
        mmWidth = 42598
        BandType = 0
      end
      object rptCCPlanoPatro_lblDatas: TppLabel
        UserName = 'rptCCPlanoPatro_lblDatas'
        Caption = 'rptCCPlanoPatro_lblDatas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 21431
        mmWidth = 33073
        BandType = 0
      end
      object ppLabel64: TppLabel
        UserName = 'rptCCImovelLabel13'
        Caption = 'Tipo de Receita / Despesa:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 185209
        mmTop = 17992
        mmWidth = 39688
        BandType = 0
      end
      object rptCCPlanoPatro_lblTipoRecDes: TppLabel
        UserName = 'rptCCPlanoPatro_lblTipoRecDes'
        AutoSize = False
        Caption = 'rptCCPlanoPatro_lblTipoRecDes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 224632
        mmTop = 17992
        mmWidth = 47625
        BandType = 0
      end
      object rptCCPlanoPatro_lblRecPag: TppLabel
        UserName = 'rptCCPlanoPatro_lblRecPag'
        AutoSize = False
        Caption = 'rptCCPlanoPatro_lblRecPag'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 224632
        mmTop = 22225
        mmWidth = 47625
        BandType = 0
      end
      object rptCCPlanoPatro_lblPrevEfetivo: TppLabel
        UserName = 'rptCCPlanoPatro_lblPrevEfetivo'
        AutoSize = False
        Caption = 'rptCCPlanoPatro_lblPrevEfetivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 224632
        mmTop = 26458
        mmWidth = 47625
        BandType = 0
      end
      object rptCCPlanoPatro_lblEmAberto: TppLabel
        UserName = 'rptCCPlanoPatro_lblEmAberto'
        AutoSize = False
        Caption = 'Apenas lançamentos em aberto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 224632
        mmTop = 30692
        mmWidth = 47625
        BandType = 0
      end
      object rptCCPlanoPatro_lblTipoData: TppLabel
        UserName = 'rptCCPlanoPatro_lblTipoData'
        Caption = 'por Data de Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 24871
        mmWidth = 30692
        BandType = 0
      end
      object rptCCPlanoPatro_lblTipoImovel: TppLabel
        UserName = 'rptCCPlanoPatro_lblTipoImovel'
        AutoSize = False
        Caption = 'Todos os Tipos de Imóvel / Segmento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 85461
        mmTop = 24871
        mmWidth = 102659
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'rptCCImovelLabel101'
        Caption = 'Favorecido / Debitado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 9260
        mmTop = 42598
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'Label76'
        Caption = 'Tipo de Receita / Despesa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 65617
        mmTop = 42598
        mmWidth = 30163
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'Label77'
        Caption = 'Alterador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 108215
        mmTop = 42598
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel78: TppLabel
        UserName = 'Label78'
        Caption = 'Nº do Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 151077
        mmTop = 42598
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel79: TppLabel
        UserName = 'Label79'
        Caption = 'Nº AP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 176213
        mmTop = 42598
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'Label80'
        Caption = 'A Receber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 186532
        mmTop = 42598
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel81: TppLabel
        UserName = 'Label81'
        Caption = 'Recebido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 203200
        mmTop = 42598
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel82: TppLabel
        UserName = 'Label82'
        Caption = 'A Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 220134
        mmTop = 42598
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel83: TppLabel
        UserName = 'Label83'
        Caption = 'Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 238655
        mmTop = 42598
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'Label84'
        Caption = 'Compet.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 246857
        mmTop = 42598
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel85: TppLabel
        UserName = 'Label85'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 262996
        mmTop = 42598
        mmWidth = 5292
        BandType = 0
      end
      object ppLine25: TppLine
        UserName = 'Line25'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 45773
        mmWidth = 271993
        BandType = 0
      end
      object ppLine29: TppLine
        UserName = 'Line29'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 41804
        mmWidth = 271993
        BandType = 0
      end
      object ppLogoCCPlanoPatro: TppImage
        UserName = 'ppLogoCCPlanoPatro'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText41: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME_PATRO'
        DataPipeline = pplCCPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplCCPlanoPatro'
        mmHeight = 4233
        mmLeft = 27252
        mmTop = 32015
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel126: TppLabel
        UserName = 'Label126'
        Caption = 'Patrocinadora:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 32015
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel127: TppLabel
        UserName = 'Label127'
        Caption = 'Plano:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 36777
        mmWidth = 12700
        BandType = 0
      end
      object ppDBText40: TppDBText
        UserName = 'DBText40'
        AutoSize = True
        DataField = 'NOME_PLANO'
        DataPipeline = pplCCPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplCCPlanoPatro'
        mmHeight = 4233
        mmLeft = 14817
        mmTop = 36777
        mmWidth = 13758
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 20108
      mmPrintPosition = 0
      object ppLine22: TppLine
        OnPrint = rptCCContrato_SeparadorPrint
        UserName = 'rptCCImovel_Separador'
        ParentHeight = True
        ParentWidth = True
        StretchWithParent = True
        Visible = False
        Weight = 0.75
        mmHeight = 20108
        mmLeft = 0
        mmTop = 0
        mmWidth = 271993
        BandType = 4
      end
      object ppShape9: TppShape
        OnPrint = rptFolhaAluguel_FundoBandaDetalhePrint
        UserName = 'rptCCImovel_FundoBandaDetalhe'
        Brush.Color = 13040076
        ParentHeight = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 20108
        mmLeft = 7408
        mmTop = 0
        mmWidth = 264584
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'rptCCImovelDBText1'
        BlankWhenZero = True
        DataField = 'TOT_PAGO'
        DataPipeline = pplCCPlanoPatro
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCPlanoPatro'
        mmHeight = 2646
        mmLeft = 229130
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'rptCCImovelDBText2'
        DataField = 'DATA'
        DataPipeline = pplCCPlanoPatro
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplCCPlanoPatro'
        mmHeight = 2646
        mmLeft = 258234
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppLabel72: TppLabel
        UserName = 'rptCCImovelLabel3'
        AutoSize = False
        Caption = ' / '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 249238
        mmTop = 794
        mmWidth = 2381
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'rptCCImovelDBText3'
        DataField = 'MESCOMPETENCIA'
        DataPipeline = pplCCPlanoPatro
        DisplayFormat = '00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplCCPlanoPatro'
        mmHeight = 2646
        mmLeft = 245798
        mmTop = 794
        mmWidth = 3704
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'rptCCImovelDBText4'
        DataField = 'ANOCOMPETENCIA'
        DataPipeline = pplCCPlanoPatro
        DisplayFormat = '0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCPlanoPatro'
        mmHeight = 2646
        mmLeft = 251355
        mmTop = 794
        mmWidth = 6350
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'rptCCImovelDBText5'
        BlankWhenZero = True
        DataField = 'TOT_PAGAR'
        DataPipeline = pplCCPlanoPatro
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCPlanoPatro'
        mmHeight = 2646
        mmLeft = 213784
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'rptCCImovelDBText6'
        BlankWhenZero = True
        DataField = 'TOT_RECEBIDO'
        DataPipeline = pplCCPlanoPatro
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCPlanoPatro'
        mmHeight = 2646
        mmLeft = 198438
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'rptCCImovelDBText7'
        BlankWhenZero = True
        DataField = 'TOT_RECEBER'
        DataPipeline = pplCCPlanoPatro
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCPlanoPatro'
        mmHeight = 2646
        mmLeft = 183092
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBMemo14: TppDBMemo
        UserName = 'rptCCImovelDBMemo2'
        CharWrap = True
        DataField = 'NF_FORCLI'
        DataPipeline = pplCCPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCPlanoPatro'
        mmHeight = 15875
        mmLeft = 7938
        mmTop = 794
        mmWidth = 56092
        BandType = 4
        mmBottomOffset = 529
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo15: TppDBMemo
        UserName = 'rptCCImovelDBMemo3'
        CharWrap = True
        DataField = 'DESCCUSTORECIMO'
        DataPipeline = pplCCPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCPlanoPatro'
        mmHeight = 15875
        mmLeft = 65088
        mmTop = 794
        mmWidth = 40746
        BandType = 4
        mmBottomOffset = 529
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo16: TppDBMemo
        UserName = 'rptCCImovelDBMemo4'
        CharWrap = True
        DataField = 'DESCALC'
        DataPipeline = pplCCPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCPlanoPatro'
        mmHeight = 15875
        mmLeft = 107686
        mmTop = 794
        mmWidth = 41010
        BandType = 4
        mmBottomOffset = 529
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText38: TppDBText
        UserName = 'rptCCImovelDBText9'
        DataField = 'NODOCUMENTO'
        DataPipeline = pplCCPlanoPatro
        DisplayFormat = '####################0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCPlanoPatro'
        mmHeight = 2646
        mmLeft = 150548
        mmTop = 794
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'rptCCImovelDBText10'
        BlankWhenZero = True
        DataField = 'NUMAPGR'
        DataPipeline = pplCCPlanoPatro
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCPlanoPatro'
        mmHeight = 2381
        mmLeft = 173302
        mmTop = 794
        mmWidth = 8731
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLine23: TppLine
        UserName = 'ppLine11'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 271993
        BandType = 8
      end
      object ppLabel73: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel28'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'Calc11'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 114300
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'Calc12'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 236803
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
    object ppSummaryBand8: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppRegion7: TppRegion
        UserName = 'Region7'
        KeepTogether = True
        Brush.Style = bsClear
        Pen.Style = psClear
        Transparent = True
        mmHeight = 10848
        mmLeft = 150813
        mmTop = 1058
        mmWidth = 96838
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppShape22: TppShape
          UserName = 'Shape22'
          mmHeight = 3969
          mmLeft = 182563
          mmTop = 6349
          mmWidth = 64029
          BandType = 7
        end
        object ppShape23: TppShape
          UserName = 'Shape23'
          mmHeight = 3704
          mmLeft = 182563
          mmTop = 3439
          mmWidth = 64029
          BandType = 7
        end
        object ppDBCalc57: TppDBCalc
          UserName = 'DBCalc203'
          DataField = 'TOT_RECEBER'
          DataPipeline = pplCCPlanoPatro
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCPlanoPatro'
          mmHeight = 2646
          mmLeft = 183092
          mmTop = 3969
          mmWidth = 15081
          BandType = 7
        end
        object ppDBCalc58: TppDBCalc
          UserName = 'DBCalc58'
          DataField = 'TOT_RECEBIDO'
          DataPipeline = pplCCPlanoPatro
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCPlanoPatro'
          mmHeight = 2646
          mmLeft = 199232
          mmTop = 3969
          mmWidth = 15081
          BandType = 7
        end
        object ppDBCalc59: TppDBCalc
          UserName = 'DBCalc59'
          DataField = 'TOT_PAGAR'
          DataPipeline = pplCCPlanoPatro
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCPlanoPatro'
          mmHeight = 2646
          mmLeft = 215107
          mmTop = 3969
          mmWidth = 15081
          BandType = 7
        end
        object ppDBCalc60: TppDBCalc
          UserName = 'DBCalc60'
          DataField = 'TOT_PAGO'
          DataPipeline = pplCCPlanoPatro
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCPlanoPatro'
          mmHeight = 2646
          mmLeft = 230982
          mmTop = 3969
          mmWidth = 15081
          BandType = 7
        end
        object ppLabel74: TppLabel
          UserName = 'Label74'
          Caption = 'Saldo:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 172244
          mmTop = 7408
          mmWidth = 9525
          BandType = 7
        end
        object ppDBCalc61: TppDBCalc
          UserName = 'DBCalc61'
          DataField = 'SALDO_RECEB'
          DataPipeline = pplCCPlanoPatro
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCPlanoPatro'
          mmHeight = 2646
          mmLeft = 183092
          mmTop = 7673
          mmWidth = 15081
          BandType = 7
        end
        object ppDBCalc62: TppDBCalc
          UserName = 'DBCalc62'
          DataField = 'SALDO_PAGAR'
          DataPipeline = pplCCPlanoPatro
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCPlanoPatro'
          mmHeight = 2646
          mmLeft = 215107
          mmTop = 7673
          mmWidth = 15081
          BandType = 7
        end
      end
      object ppLabel128: TppLabel
        UserName = 'Label128'
        Caption = 'Total Geral:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 166159
        mmTop = 3704
        mmWidth = 15610
        BandType = 7
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'NOME_PATRO'
      DataPipeline = pplCCPlanoPatro
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCCPlanoPatro'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object ppRegion2: TppRegion
          UserName = 'Region2'
          KeepTogether = True
          Brush.Style = bsClear
          Pen.Style = psClear
          Transparent = True
          mmHeight = 9525
          mmLeft = 150548
          mmTop = 0
          mmWidth = 96838
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppShape12: TppShape
            UserName = 'Shape12'
            mmHeight = 3969
            mmLeft = 182298
            mmTop = 4498
            mmWidth = 64029
            BandType = 5
            GroupNo = 0
          end
          object ppShape13: TppShape
            UserName = 'Shape13'
            mmHeight = 3704
            mmLeft = 182298
            mmTop = 1058
            mmWidth = 64029
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc20: TppDBCalc
            UserName = 'DBCalc20'
            DataField = 'TOT_RECEBER'
            DataPipeline = pplCCPlanoPatro
            DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 6
            Font.Style = []
            ResetGroup = ppGroup7
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplCCPlanoPatro'
            mmHeight = 2646
            mmLeft = 182827
            mmTop = 1588
            mmWidth = 15081
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc21: TppDBCalc
            UserName = 'DBCalc21'
            DataField = 'TOT_RECEBIDO'
            DataPipeline = pplCCPlanoPatro
            DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 6
            Font.Style = []
            ResetGroup = ppGroup7
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplCCPlanoPatro'
            mmHeight = 2646
            mmLeft = 198967
            mmTop = 1588
            mmWidth = 15081
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc22: TppDBCalc
            UserName = 'DBCalc22'
            DataField = 'TOT_PAGAR'
            DataPipeline = pplCCPlanoPatro
            DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 6
            Font.Style = []
            ResetGroup = ppGroup7
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplCCPlanoPatro'
            mmHeight = 2646
            mmLeft = 214842
            mmTop = 1588
            mmWidth = 15081
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc23: TppDBCalc
            UserName = 'DBCalc23'
            DataField = 'TOT_PAGO'
            DataPipeline = pplCCPlanoPatro
            DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 6
            Font.Style = []
            ResetGroup = ppGroup7
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplCCPlanoPatro'
            mmHeight = 2646
            mmLeft = 230717
            mmTop = 1588
            mmWidth = 15081
            BandType = 5
            GroupNo = 0
          end
          object ppLabel65: TppLabel
            UserName = 'Label65'
            Caption = 'Saldo:   '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 7
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 2910
            mmLeft = 171979
            mmTop = 5027
            mmWidth = 9525
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc24: TppDBCalc
            UserName = 'DBCalc24'
            DataField = 'SALDO_RECEB'
            DataPipeline = pplCCPlanoPatro
            DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 6
            Font.Style = []
            ResetGroup = ppGroup7
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplCCPlanoPatro'
            mmHeight = 2646
            mmLeft = 182827
            mmTop = 5292
            mmWidth = 15081
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc25: TppDBCalc
            UserName = 'DBCalc25'
            DataField = 'SALDO_PAGAR'
            DataPipeline = pplCCPlanoPatro
            DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 6
            Font.Style = []
            ResetGroup = ppGroup7
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplCCPlanoPatro'
            mmHeight = 2646
            mmLeft = 214842
            mmTop = 5292
            mmWidth = 15081
            BandType = 5
            GroupNo = 0
          end
          object ppLabel66: TppLabel
            UserName = 'Label66'
            Caption = 'Total da Patrocinadora:   '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 7
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 2910
            mmLeft = 152135
            mmTop = 1323
            mmWidth = 29369
            BandType = 5
            GroupNo = 0
          end
        end
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'NOME_PLANO'
      DataPipeline = pplCCPlanoPatro
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCCPlanoPatro'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11113
        mmPrintPosition = 0
        object ppRegion3: TppRegion
          UserName = 'Region3'
          KeepTogether = True
          Brush.Style = bsClear
          Pen.Style = psClear
          Transparent = True
          mmHeight = 9525
          mmLeft = 160338
          mmTop = 0
          mmWidth = 86784
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppShape10: TppShape
            UserName = 'Shape10'
            mmHeight = 3969
            mmLeft = 182034
            mmTop = 4498
            mmWidth = 64029
            BandType = 5
            GroupNo = 1
          end
          object ppShape11: TppShape
            UserName = 'Shape11'
            mmHeight = 3704
            mmLeft = 182034
            mmTop = 1058
            mmWidth = 64029
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc14: TppDBCalc
            UserName = 'DBCalc202'
            DataField = 'TOT_RECEBER'
            DataPipeline = pplCCPlanoPatro
            DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 6
            Font.Style = []
            ResetGroup = ppGroup6
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplCCPlanoPatro'
            mmHeight = 2646
            mmLeft = 182563
            mmTop = 1588
            mmWidth = 15081
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc15: TppDBCalc
            UserName = 'DBCalc15'
            DataField = 'TOT_RECEBIDO'
            DataPipeline = pplCCPlanoPatro
            DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 6
            Font.Style = []
            ResetGroup = ppGroup6
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplCCPlanoPatro'
            mmHeight = 2646
            mmLeft = 198703
            mmTop = 1588
            mmWidth = 15081
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc16: TppDBCalc
            UserName = 'DBCalc16'
            DataField = 'TOT_PAGAR'
            DataPipeline = pplCCPlanoPatro
            DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 6
            Font.Style = []
            ResetGroup = ppGroup6
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplCCPlanoPatro'
            mmHeight = 2646
            mmLeft = 214578
            mmTop = 1588
            mmWidth = 15081
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc17: TppDBCalc
            UserName = 'DBCalc17'
            DataField = 'TOT_PAGO'
            DataPipeline = pplCCPlanoPatro
            DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 6
            Font.Style = []
            ResetGroup = ppGroup6
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplCCPlanoPatro'
            mmHeight = 2646
            mmLeft = 230453
            mmTop = 1588
            mmWidth = 15081
            BandType = 5
            GroupNo = 1
          end
          object ppLabel62: TppLabel
            UserName = 'Label62'
            Caption = 'Saldo:   '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 7
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 2910
            mmLeft = 171715
            mmTop = 5027
            mmWidth = 9525
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc18: TppDBCalc
            UserName = 'DBCalc18'
            DataField = 'SALDO_RECEB'
            DataPipeline = pplCCPlanoPatro
            DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 6
            Font.Style = []
            ResetGroup = ppGroup6
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplCCPlanoPatro'
            mmHeight = 2646
            mmLeft = 182563
            mmTop = 5292
            mmWidth = 15081
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc19: TppDBCalc
            UserName = 'DBCalc19'
            DataField = 'SALDO_PAGAR'
            DataPipeline = pplCCPlanoPatro
            DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 6
            Font.Style = []
            ResetGroup = ppGroup6
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplCCPlanoPatro'
            mmHeight = 2646
            mmLeft = 214578
            mmTop = 5292
            mmWidth = 15081
            BandType = 5
            GroupNo = 1
          end
          object ppLabel63: TppLabel
            UserName = 'Label63'
            Caption = 'Total do Plano:   '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 7
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 2910
            mmLeft = 161661
            mmTop = 1323
            mmWidth = 19579
            BandType = 5
            GroupNo = 1
          end
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'NOME_MESTRE'
      DataPipeline = pplCCPlanoPatro
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCCPlanoPatro'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppDBText42: TppDBText
          UserName = 'DBText42'
          AutoSize = True
          DataField = 'NOME_MESTRE'
          DataPipeline = pplCCPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplCCPlanoPatro'
          mmHeight = 3440
          mmLeft = 1323
          mmTop = 1588
          mmWidth = 24606
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65061B
        70704C6162656C32364F6E44726177436F6D6D616E64436C69636B0B50726F67
        72616D54797065070B747450726F63656475726506536F75726365064E70726F
        6365647572652070704C6162656C32364F6E44726177436F6D6D616E64436C69
        636B286144726177436F6D6D616E643A20544F626A656374293B0D0A62656769
        6E0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060970704C6162
        656C3236094576656E744E616D6506124F6E44726177436F6D6D616E64436C69
        636B074576656E74494402550000}
    end
  end
  object dsInadimplContrAnalitico: TwwDataSource
    DataSet = qryInadimplContrAnalitico
    Left = 368
    Top = 330
  end
  object pplInadimplContrAnalitico: TppBDEPipeline
    DataSource = dsInadimplContrAnalitico
    UserName = 'lInadimplenciaContrato1'
    Left = 368
    Top = 343
    object pplInadimplContrAnaliticoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplInadimplContrAnaliticoppField2: TppField
      FieldAlias = 'NUMERO_CONTRATO'
      FieldName = 'NUMERO_CONTRATO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object pplInadimplContrAnaliticoppField3: TppField
      FieldAlias = 'NOME_CONTRATO'
      FieldName = 'NOME_CONTRATO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplInadimplContrAnaliticoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplInadimplContrAnaliticoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_RECEBER'
      FieldName = 'TOT_RECEBER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplInadimplContrAnaliticoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'RECEBIDO'
      FieldName = 'RECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplInadimplContrAnaliticoppField7: TppField
      FieldAlias = 'COMPETENCIA'
      FieldName = 'COMPETENCIA'
      FieldLength = 81
      DisplayWidth = 81
      Position = 6
    end
    object pplInadimplContrAnaliticoppField8: TppField
      FieldAlias = 'CONDATAINICIO'
      FieldName = 'CONDATAINICIO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object pplInadimplContrAnaliticoppField9: TppField
      FieldAlias = 'CONDATAFIM'
      FieldName = 'CONDATAFIM'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object pplInadimplContrAnaliticoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDLOCATARIO'
      FieldName = 'IDLOCATARIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplInadimplContrAnaliticoppField11: TppField
      FieldAlias = 'NF_LOCATARIO'
      FieldName = 'NF_LOCATARIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 10
    end
    object pplInadimplContrAnaliticoppField12: TppField
      FieldAlias = 'RS_LOCATARIO'
      FieldName = 'RS_LOCATARIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 11
    end
    object pplInadimplContrAnaliticoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDADMINIMOVEL'
      FieldName = 'IDADMINIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplInadimplContrAnaliticoppField14: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 13
    end
    object pplInadimplContrAnaliticoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'CORRECAO'
      FieldName = 'CORRECAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplInadimplContrAnaliticoppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'JUROS'
      FieldName = 'JUROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplInadimplContrAnaliticoppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'MULTA'
      FieldName = 'MULTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplInadimplContrAnaliticoppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplInadimplContrAnaliticoppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIAS'
      FieldName = 'DIAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplInadimplContrAnaliticoppField20: TppField
      FieldAlias = 'DESCTIPOIMOVEL'
      FieldName = 'DESCTIPOIMOVEL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 19
    end
    object pfldInadimplContrAnaliticoppField21: TppField
      FieldAlias = 'DESCR_SITCONTR'
      FieldName = 'DESCR_SITCONTR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 20
    end
  end
  object rptInadimplContrAnalitico: TppReport
    AutoStop = False
    DataPipeline = pplInadimplContrAnalitico
    NoDataBehaviors = [ndBlankReport]
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13229
    PrinterSetup.mmMarginLeft = 6615
    PrinterSetup.mmMarginRight = 6615
    PrinterSetup.mmMarginTop = 13229
    PrinterSetup.mmPaperHeight = 297128
    PrinterSetup.mmPaperWidth = 210080
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 368
    Top = 280
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplInadimplContrAnalitico'
    object ppHeaderBand6: TppHeaderBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 40217
      mmPrintPosition = 0
      object ppLabel86: TppLabel
        UserName = 'ppLabel187'
        AutoSize = False
        Caption = 'Inadimplência por Contrato - Analítico ( Correção Diária )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8731
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel87: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel239'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1588
        mmWidth = 196850
        BandType = 0
      end
      object ppLine30: TppLine
        UserName = 'ppLine82'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 39688
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel92: TppLabel
        UserName = 'ppLabel256'
        Caption = 'Mês de competência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 6085
        mmTop = 19579
        mmWidth = 30427
        BandType = 0
      end
      object ppLabel93: TppLabel
        UserName = 'rptInadimplenciaContratoLabel1'
        AutoSize = False
        Caption = 'Valor Devido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 52123
        mmTop = 35983
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel94: TppLabel
        UserName = 'rptInadimplenciaContratoLabel3'
        Caption = 'Data Limite:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 110861
        mmTop = 20108
        mmWidth = 17992
        BandType = 0
      end
      object rptInadimplContrAnaliticolblMesCompetencia: TppLabel
        UserName = 'rptInadimplContrAnaliticolblMesCompetencia'
        Caption = 'rptInadimplContrAnaliticolblMesCompetencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 36777
        mmTop = 19579
        mmWidth = 56621
        BandType = 0
      end
      object rptInadimplContrAnaliticolblDataLimite: TppLabel
        UserName = 'rptInadimplContrAnaliticolblDataLimite'
        Caption = 'rptInadimplContrAnaliticolblDataLimite'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 128588
        mmTop = 20108
        mmWidth = 48154
        BandType = 0
      end
      object ppLabel96: TppLabel
        UserName = 'Label96'
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 35983
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel106: TppLabel
        UserName = 'Label106'
        Caption = 'Comp.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 22225
        mmTop = 35983
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel107: TppLabel
        UserName = 'Label107'
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 34131
        mmTop = 35983
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel112: TppLabel
        UserName = 'Label112'
        AutoSize = False
        Caption = 'Correção'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 98425
        mmTop = 35983
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel116: TppLabel
        UserName = 'Label116'
        AutoSize = False
        Caption = 'Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 123561
        mmTop = 35983
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel120: TppLabel
        UserName = 'Label120'
        AutoSize = False
        Caption = 'Multa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 148961
        mmTop = 35983
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'Label122'
        Caption = 'Total a Receber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 173832
        mmTop = 35983
        mmWidth = 21167
        BandType = 0
      end
      object ppLine35: TppLine
        UserName = 'Line35'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 35454
        mmWidth = 196850
        BandType = 0
      end
      object ppLogoInadimplContrAnalitico: TppImage
        UserName = 'ppLogoInadimplContrAnalitico'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel133: TppLabel
        UserName = 'Label133'
        Caption = 'Segmento:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 19579
        mmTop = 23283
        mmWidth = 16404
        BandType = 0
      end
      object rptInadimplContrAnaliticolblSegmento: TppLabel
        UserName = 'rptInadimplContrAnaliticolblSegmento'
        Caption = '< Todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 36777
        mmTop = 23283
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel135: TppLabel
        UserName = 'Label135'
        AutoSize = False
        Caption = 'Valor Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 74613
        mmTop = 36248
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel136: TppLabel
        UserName = 'Label136'
        Caption = 'Tipo de Receita:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 105569
        mmTop = 23283
        mmWidth = 23548
        BandType = 0
      end
      object rptInadimplContrAnaliticolblReceita: TppLabel
        UserName = 'rptInadimplContrAnaliticolblReceita'
        Caption = '< Todas >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 128852
        mmTop = 23283
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel154: TppLabel
        UserName = 'Label154'
        Caption = 'Responsável:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 15610
        mmTop = 26988
        mmWidth = 20108
        BandType = 0
      end
      object rptInadimplContrAnaliticolblResponsabilidade: TppLabel
        UserName = 'rptInadimplContrAnaliticolblResponsabilidade'
        Caption = '< Todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 36777
        mmTop = 26988
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel157: TppLabel
        UserName = 'Label157'
        Caption = 'Última atualização:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 26723
        mmWidth = 27252
        BandType = 0
      end
      object rptInadimplContrAnaliticolblDataAtualiza1: TppLabel
        UserName = 'rptInadimplContrAnaliticolblDataAtualiza1'
        Caption = 'rptInadimplContrAnaliticolblDataAtualiza1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 128852
        mmTop = 26723
        mmWidth = 52123
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 4498
      mmPrintPosition = 0
      object ppShape21: TppShape
        OnPrint = rptFolhaAluguel_FundoBandaDetalhePrint
        UserName = 'rptInadimplenciaContratoShape2'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 196850
        BandType = 4
      end
      object ppLine31: TppLine
        OnPrint = rptCCContrato_SeparadorPrint
        UserName = 'ppLine86'
        Pen.Style = psClear
        ParentHeight = True
        ParentWidth = True
        ShiftWithParent = True
        Weight = 0.75
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 196850
        BandType = 4
      end
      object ppDBText47: TppDBText
        UserName = 'rptInadimplenciaContratoDBText1'
        DataField = 'TOT_RECEBER'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3440
        mmLeft = 52123
        mmTop = 265
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'DBText50'
        DataField = 'COMPETENCIA'
        DataPipeline = pplInadimplContrAnalitico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3440
        mmLeft = 18521
        mmTop = 265
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText58: TppDBText
        UserName = 'DBText58'
        DataField = 'CODDOCUMENTO'
        DataPipeline = pplInadimplContrAnalitico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText59: TppDBText
        UserName = 'DBText59'
        DataField = 'DATAVENCIMENTO'
        DataPipeline = pplInadimplContrAnalitico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3440
        mmLeft = 33073
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText60: TppDBText
        UserName = 'DBText60'
        DataField = 'CORRECAO'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3704
        mmLeft = 98690
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'DBText61'
        DataField = 'JUROS'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'DBText62'
        DataField = 'MULTA'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3704
        mmLeft = 148961
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'DBText63'
        AutoSize = True
        DataField = 'TOTAL'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3260
        mmLeft = 182160
        mmTop = 265
        mmWidth = 12573
        BandType = 4
      end
      object ppDBText72: TppDBText
        UserName = 'DBText72'
        DataField = 'RECEBIDO'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3440
        mmLeft = 75142
        mmTop = 529
        mmWidth = 19844
        BandType = 4
      end
      object ppLabel234: TppLabel
        UserName = 'Label234'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 4191
        mmLeft = 66940
        mmTop = 265
        mmWidth = 60579
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLine32: TppLine
        UserName = 'ppLine87'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 196850
        BandType = 8
      end
      object ppLabel98: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel270'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 3175
        mmWidth = 23813
        BandType = 8
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'Calc44'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 72496
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'Calc45'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 158486
        mmTop = 3175
        mmWidth = 38100
        BandType = 8
      end
    end
    object ppSummaryBand7: TppSummaryBand
      mmBottomOffset = 40
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine33: TppLine
        UserName = 'rptInadimplenciaContratoLine1'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 196850
        BandType = 7
      end
      object ppRegion6: TppRegion
        UserName = 'Region6'
        mmHeight = 5027
        mmLeft = 7144
        mmTop = 1852
        mmWidth = 189442
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppDBCalc44: TppDBCalc
          UserName = 'DBCalc44'
          AutoSize = True
          DataField = 'TOT_RECEBER'
          DataPipeline = pplInadimplContrAnalitico
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3387
          mmLeft = 40259
          mmTop = 2910
          mmWidth = 31708
          BandType = 7
        end
        object ppLabel105: TppLabel
          UserName = 'Label105'
          Caption = 'Totai Gerais:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 10848
          mmTop = 2910
          mmWidth = 17198
          BandType = 7
        end
        object ppDBCalc53: TppDBCalc
          UserName = 'DBCalc53'
          DataField = 'CORRECAO'
          DataPipeline = pplInadimplContrAnalitico
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3440
          mmLeft = 95515
          mmTop = 2910
          mmWidth = 20373
          BandType = 7
        end
        object ppDBCalc54: TppDBCalc
          UserName = 'DBCalc54'
          AutoSize = True
          DataField = 'JUROS'
          DataPipeline = pplInadimplContrAnalitico
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3387
          mmLeft = 120576
          mmTop = 2910
          mmWidth = 20447
          BandType = 7
        end
        object ppDBCalc55: TppDBCalc
          UserName = 'DBCalc55'
          AutoSize = True
          DataField = 'MULTA'
          DataPipeline = pplInadimplContrAnalitico
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3387
          mmLeft = 145670
          mmTop = 2910
          mmWidth = 20489
          BandType = 7
        end
        object ppDBCalc56: TppDBCalc
          UserName = 'DBCalc56'
          AutoSize = True
          DataField = 'TOTAL'
          DataPipeline = pplInadimplContrAnalitico
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3387
          mmLeft = 174795
          mmTop = 2910
          mmWidth = 19939
          BandType = 7
        end
        object ppDBCalc33: TppDBCalc
          UserName = 'DBCalc33'
          DataField = 'RECEBIDO'
          DataPipeline = pplInadimplContrAnalitico
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3440
          mmLeft = 73290
          mmTop = 2910
          mmWidth = 21696
          BandType = 7
        end
      end
    end
    object ppPageStyle1: TppPageStyle
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGrpInadimpContrAnaliticoSeg: TppGroup
      BreakName = 'DESCTIPOIMOVEL'
      DataPipeline = pplInadimplContrAnalitico
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'GrpInadimpContrAnaliticoSeg'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplInadimplContrAnalitico'
      object ppGrpInadimpContrAnaliticoSegHeader: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object ppLabel199: TppLabel
          UserName = 'Label199'
          Caption = 'Segmento: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4657
          mmLeft = 1058
          mmTop = 2117
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object ppDBText91: TppDBText
          UserName = 'DBText91'
          DataField = 'DESCTIPOIMOVEL'
          DataPipeline = pplInadimplContrAnalitico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 4763
          mmLeft = 29104
          mmTop = 2117
          mmWidth = 75671
          BandType = 3
          GroupNo = 0
        end
        object ppLine50: TppLine
          UserName = 'Line50'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 196850
          BandType = 3
          GroupNo = 0
        end
        object ppLine51: TppLine
          UserName = 'Line501'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 8467
          mmWidth = 196850
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGrpInadimpContrAnaliticoSegFooter: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object ppRegion10: TppRegion
          UserName = 'Region10'
          mmHeight = 8202
          mmLeft = 7144
          mmTop = 1323
          mmWidth = 189442
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppDBCalc86: TppDBCalc
            UserName = 'DBCalc86'
            AutoSize = True
            DataField = 'TOT_RECEBER'
            DataPipeline = pplInadimplContrAnalitico
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGrpInadimpContrAnaliticoSeg
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplInadimplContrAnalitico'
            mmHeight = 3387
            mmLeft = 40259
            mmTop = 3704
            mmWidth = 31708
            BandType = 5
            GroupNo = 0
          end
          object ppLabel200: TppLabel
            UserName = 'Label200'
            Caption = 'Totais do Segmento:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3387
            mmLeft = 10848
            mmTop = 3704
            mmWidth = 28067
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc87: TppDBCalc
            UserName = 'DBCalc87'
            DataField = 'CORRECAO'
            DataPipeline = pplInadimplContrAnalitico
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGrpInadimpContrAnaliticoSeg
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplInadimplContrAnalitico'
            mmHeight = 3440
            mmLeft = 96838
            mmTop = 3704
            mmWidth = 19050
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc88: TppDBCalc
            UserName = 'DBCalc88'
            AutoSize = True
            DataField = 'JUROS'
            DataPipeline = pplInadimplContrAnalitico
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGrpInadimpContrAnaliticoSeg
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplInadimplContrAnalitico'
            mmHeight = 3387
            mmLeft = 120576
            mmTop = 3704
            mmWidth = 20447
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc89: TppDBCalc
            UserName = 'DBCalc89'
            AutoSize = True
            DataField = 'MULTA'
            DataPipeline = pplInadimplContrAnalitico
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGrpInadimpContrAnaliticoSeg
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplInadimplContrAnalitico'
            mmHeight = 3387
            mmLeft = 145670
            mmTop = 3704
            mmWidth = 20489
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc90: TppDBCalc
            UserName = 'DbCalcTotal1'
            AutoSize = True
            DataField = 'TOTAL'
            DataPipeline = pplInadimplContrAnalitico
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGrpInadimpContrAnaliticoSeg
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplInadimplContrAnalitico'
            mmHeight = 3387
            mmLeft = 174795
            mmTop = 3704
            mmWidth = 19939
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc91: TppDBCalc
            UserName = 'DBCalc91'
            DataField = 'RECEBIDO'
            DataPipeline = pplInadimplContrAnalitico
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGrpInadimpContrAnaliticoSeg
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplInadimplContrAnalitico'
            mmHeight = 3440
            mmLeft = 73025
            mmTop = 3704
            mmWidth = 21960
            BandType = 5
            GroupNo = 0
          end
        end
      end
    end
    object ppGroup14: TppGroup
      BreakName = 'NUMERO_CONTRATO'
      DataPipeline = pplInadimplContrAnalitico
      OutlineSettings.CreateNode = True
      UserName = 'Group14'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplInadimplContrAnalitico'
      object ppGroupHeaderBand11: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 9525
        mmPrintPosition = 0
        object ppDBText48: TppDBText
          UserName = 'DBText48'
          DataField = 'NUMERO_CONTRATO'
          DataPipeline = pplInadimplContrAnalitico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3175
          mmLeft = 18521
          mmTop = 794
          mmWidth = 57150
          BandType = 3
          GroupNo = 1
        end
        object ppLabel91: TppLabel
          UserName = 'ppLabel251'
          Caption = 'Nº Contrato: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 794
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object ppDBMemo18: TppDBMemo
          UserName = 'ppDBMemo28'
          CharWrap = False
          DataField = 'NF_LOCATARIO'
          DataPipeline = pplInadimplContrAnalitico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Stretch = True
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3969
          mmLeft = 92340
          mmTop = 529
          mmWidth = 103717
          BandType = 3
          GroupNo = 1
          mmBottomOffset = 794
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppLabel88: TppLabel
          UserName = 'ppLabel242'
          Caption = 'Locatário: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 78581
          mmTop = 529
          mmWidth = 13229
          BandType = 3
          GroupNo = 1
        end
        object ppDBMemo19: TppDBMemo
          UserName = 'ppDBMemo29'
          CharWrap = False
          DataField = 'NF_ADMINISTRADORA'
          DataPipeline = pplInadimplContrAnalitico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Stretch = True
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3704
          mmLeft = 22754
          mmTop = 5292
          mmWidth = 52652
          BandType = 3
          GroupNo = 1
          mmBottomOffset = 794
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppLabel90: TppLabel
          UserName = 'ppLabel244'
          Caption = 'Administradora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 5292
          mmWidth = 19844
          BandType = 3
          GroupNo = 1
        end
        object ppLabel89: TppLabel
          UserName = 'ppLabel243'
          Caption = 'Vigência do Contrato:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 78846
          mmTop = 5292
          mmWidth = 27252
          BandType = 3
          GroupNo = 1
        end
        object ppDBText43: TppDBText
          UserName = 'ppDBText102'
          DataField = 'CONDATAINICIO'
          DataPipeline = pplInadimplContrAnalitico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3704
          mmLeft = 109273
          mmTop = 5292
          mmWidth = 14817
          BandType = 3
          GroupNo = 1
        end
        object ppLabel97: TppLabel
          UserName = 'ppLabel269'
          Caption = ' a '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 124090
          mmTop = 5292
          mmWidth = 3175
          BandType = 3
          GroupNo = 1
        end
        object ppDBText44: TppDBText
          UserName = 'ppDBText103'
          DataField = 'CONDATAFIM'
          DataPipeline = pplInadimplContrAnalitico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3704
          mmLeft = 126736
          mmTop = 5292
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object plbl2: TppLabel
          UserName = 'plbl2'
          Caption = 'Situação contratual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 145521
          mmTop = 5556
          mmWidth = 24342
          BandType = 3
          GroupNo = 1
        end
        object pdbtxtsITcONTR1: TppDBText
          UserName = 'pdbtxtsITcONTR1'
          DataField = 'DESCR_SITCONTR'
          DataPipeline = pplInadimplContrAnalitico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3175
          mmLeft = 170921
          mmTop = 5556
          mmWidth = 24871
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand11: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 14288
        mmPrintPosition = 0
        object ppRegion5: TppRegion
          UserName = 'Region5'
          mmHeight = 5821
          mmLeft = 7144
          mmTop = 0
          mmWidth = 189442
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppDBCalc45: TppDBCalc
            UserName = 'DBCalc45'
            AutoSize = True
            DataField = 'TOT_RECEBER'
            DataPipeline = pplInadimplContrAnalitico
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup14
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplInadimplContrAnalitico'
            mmHeight = 3387
            mmLeft = 40259
            mmTop = 794
            mmWidth = 31708
            BandType = 5
            GroupNo = 1
          end
          object ppLabel95: TppLabel
            UserName = 'Label95'
            Caption = 'Totais do Contrato:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3175
            mmLeft = 10848
            mmTop = 794
            mmWidth = 25665
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc46: TppDBCalc
            UserName = 'DBCalc46'
            DataField = 'CORRECAO'
            DataPipeline = pplInadimplContrAnalitico
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup14
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplInadimplContrAnalitico'
            mmHeight = 3440
            mmLeft = 96838
            mmTop = 794
            mmWidth = 19050
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc47: TppDBCalc
            UserName = 'DBCalc47'
            AutoSize = True
            DataField = 'JUROS'
            DataPipeline = pplInadimplContrAnalitico
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup14
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplInadimplContrAnalitico'
            mmHeight = 3387
            mmLeft = 120576
            mmTop = 794
            mmWidth = 20447
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc48: TppDBCalc
            UserName = 'DBCalc48'
            AutoSize = True
            DataField = 'MULTA'
            DataPipeline = pplInadimplContrAnalitico
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup14
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplInadimplContrAnalitico'
            mmHeight = 3387
            mmLeft = 145670
            mmTop = 794
            mmWidth = 20489
            BandType = 5
            GroupNo = 1
          end
          object ppDbCalcTotal: TppDBCalc
            UserName = 'DbCalcTotal'
            AutoSize = True
            DataField = 'TOTAL'
            DataPipeline = pplInadimplContrAnalitico
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup14
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplInadimplContrAnalitico'
            mmHeight = 3387
            mmLeft = 174795
            mmTop = 794
            mmWidth = 19939
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc32: TppDBCalc
            UserName = 'DBCalc32'
            DataField = 'RECEBIDO'
            DataPipeline = pplInadimplContrAnalitico
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup14
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplInadimplContrAnalitico'
            mmHeight = 3440
            mmLeft = 73025
            mmTop = 794
            mmWidth = 21960
            BandType = 5
            GroupNo = 1
          end
        end
        object ppLine34: TppLine
          UserName = 'Line34'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 0
          mmWidth = 196850
          BandType = 5
          GroupNo = 1
        end
        object ppVarDias: TppVariable
          UserName = 'VarDias'
          CalcOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          Visible = False
          mmHeight = 3969
          mmLeft = 98954
          mmTop = 8467
          mmWidth = 12435
          BandType = 5
          GroupNo = 1
        end
        object ppRegion8: TppRegion
          UserName = 'Region8'
          mmHeight = 6615
          mmLeft = 114829
          mmTop = 6350
          mmWidth = 81756
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel153: TppLabel
            UserName = 'Label153'
            Caption = 'Provisão de Perdas:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3175
            mmLeft = 117475
            mmTop = 7938
            mmWidth = 26458
            BandType = 5
            GroupNo = 1
          end
          object ppVarPerPerdas: TppVariable
            UserName = 'VarPerPerdas'
            CalcOrder = 1
            DataType = dtInteger
            DisplayFormat = '0.00 %'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3704
            mmLeft = 148961
            mmTop = 7938
            mmWidth = 17198
            BandType = 5
            GroupNo = 1
          end
          object ppVarVlrPerdas: TppVariable
            UserName = 'VarVlrPerdas'
            CalcOrder = 2
            DataType = dtExtended
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3704
            mmLeft = 171450
            mmTop = 7938
            mmWidth = 23283
            BandType = 5
            GroupNo = 1
          end
        end
      end
    end
    object raCodeModule3: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650611
        44657461696C4265666F72655072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F7572636506B970726F63656475726520446574
        61696C4265666F72655072696E743B0D0A626567696E0D0A2020206966206C49
        6E6164696D706C656E636961436F6E747261746F315B2744494153275D203E20
        566172446961732E4173496E7465676572207468656E20626567696E0D0A2020
        20202020566172446961732E4173496E7465676572203A3D206C496E6164696D
        706C656E636961436F6E747261746F315B2744494153275D3B20200D0A202020
        656E643B0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060644657461
        696C094576656E744E616D65060B4265666F72655072696E74074576656E7449
        4402180001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D6506115265706F72744265666F72655072696E740B50726F6772616D547970
        65070B747450726F63656475726506536F75726365064670726F636564757265
        205265706F72744265666F72655072696E743B0D0A626567696E0D0A20205661
        72446961732E4173496E7465676572203A3D20303B0D0A656E643B0D0A0D436F
        6D706F6E656E744E616D6506065265706F7274094576656E744E616D65060B42
        65666F72655072696E74074576656E74494402010001060F5472614576656E74
        48616E646C65720B50726F6772616D4E616D65061647726F7570313441667465
        7247726F7570427265616B0B50726F6772616D54797065070B747450726F6365
        6475726506536F75726365064B70726F6365647572652047726F757031344166
        74657247726F7570427265616B3B0D0A626567696E0D0A202056617244696173
        2E4173496E7465676572203A3D20303B0D0A656E643B0D0A0D436F6D706F6E65
        6E744E616D65060747726F75703134094576656E744E616D65060F4166746572
        47726F7570427265616B074576656E744944021B0001060F5472614576656E74
        48616E646C65720B50726F6772616D4E616D65061C47726F7570466F6F746572
        42616E6431314265666F72655072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F757263650C6802000070726F63656475726520
        47726F7570466F6F74657242616E6431314265666F72655072696E743B0D0A62
        6567696E0D0A2020205661725065725065726461732E4173496E746567657220
        203A3D20303B0D0A202020566172566C725065726461732E4173457874656E64
        6564203A3D20303B0D0A202020696620566172446961732E4173496E74656765
        72203E203630207468656E20626567696E0D0A20202020202069662056617244
        6961732E4173496E7465676572203C20313231207468656E20626567696E0D0A
        2020202020202020205661725065725065726461732E4173496E746567657220
        3A3D2032353B0D0A202020202020656E6420656C736520696620566172446961
        732E4173496E7465676572203C20323431207468656E20626567696E0D0A2020
        202020202020205661725065725065726461732E4173496E7465676572203A3D
        2035303B0D0A202020202020656E6420656C736520696620566172446961732E
        4173496E7465676572203C20333631207468656E20626567696E0D0A20202020
        20202020205661725065725065726461732E4173496E7465676572203A3D2037
        353B0D0A202020202020656E6420656C736520626567696E0D0A202020202020
        2020205661725065725065726461732E4173496E7465676572203A3D20313030
        3B0D0A202020202020656E643B2020200D0A2020200D0A202020202020566172
        566C725065726461732E4173457874656E646564203A3D20446243616C63546F
        74616C2E56616C7565202A20285661725065725065726461732E4173496E7465
        676572202F20313030293B0D0A202020656E643B0D0A0D0A656E643B0D0A0D43
        6F6D706F6E656E744E616D65061147726F7570466F6F74657242616E64313109
        4576656E744E616D65060B4265666F72655072696E74074576656E7449440218
        0000}
    end
  end
  object qryInadimplContrAnalitico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATOIMOVEL,'
      '   C.CONNUMERO AS NUMERO_CONTRATO,'
      '   C.CONNOME AS NOME_CONTRATO,'
      '   DD.CODDOCUMENTO,'
      '   DD.TOT_RECEBER,'
      '   DD.RECEBIDO,'
      '   T.DESCTIPOIMOVEL,'
      '   CM.VLRACUM AS CORRECAO,'
      '   JR.VLRACUM AS JUROS,'
      '   MT.VLRACUM AS MULTA,'
      '   ((DD.TOT_RECEBER - DD.RECEBIDO) +'
      '     DECODE(CM.VLRACUM, NULL, 0, CM.VLRACUM) +'
      '     DECODE(JR.VLRACUM, NULL, 0, JR.VLRACUM) +'
      '     DECODE(MT.VLRACUM, NULL, 0, MT.VLRACUM)'
      '   ) AS TOTAL,'
      
        '   (DD.MESCOMPETENCIA || '#39'/'#39' || DD.ANOCOMPETENCIA) AS COMPETENCI' +
        'A,'
      '   0 AS DIAS,'
      '   DD.DATAVENCIMENTO,'
      '   C.CONDATAINICIO,'
      '   C.CONDATAFIM,'
      '   C.IDLOCATARIO,'
      '   PL.NOME AS NF_LOCATARIO,'
      '   PL.RAZAOSOCIAL AS RS_LOCATARIO,'
      '   C.IDADMINIMOVEL,'
      '   SC.DESCRICAO AS DESCR_SITCONTR'
      ''
      'FROM'
      '   PESSOA PL,'
      '   PESSOA PA,'
      '   CONTRATOIMOVEL C,'
      '   TIPOIMOVEL T,'
      '   SITCONTIMOB SC,'
      ''
      '   (SELECT'
      '      LI.CODDOCUMENTO,'
      '      LI.IDCONTRATOIMOVEL,'
      '      LI.MESCOMPETENCIA,'
      '      LI.ANOCOMPETENCIA,'
      '      LI.DATAVENCIMENTO,'
      '      LI.CODTIPIMOVEL,'
      ''
      '      SUM('
      
        '        DECODE(RTRIM(LD.OPERACAO),  '#39'1'#39', DECODE(D.RECPAG, '#39'R'#39', D' +
        'ECODE(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), ' +
        '0), 0) +'
      
        '        DECODE(RTRIM(LD.OPERACAO),  '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39', D' +
        'ECODE(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), ' +
        '0), 0) +'
      
        '        DECODE(RTRIM(LD.OPERACAO),  '#39'3'#39', DECODE(D.RECPAG, '#39'R'#39', D' +
        'ECODE(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), ' +
        '0), 0) +'
      
        '        DECODE(RTRIM(LD.OPERACAO),  '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39', D' +
        'ECODE(LD.DEBCRE, '#39'D'#39', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD' +
        '.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0)'
      '        ) AS TOT_RECEBER,'
      ''
      '      SUM('
      
        '        DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', LD' +
        '.VALOR, 0), 0) * LI.VLRLANCRECEB / TRD.VALOR'
      '        ) AS RECEBIDO'
      ''
      
        '    FROM DOCUMENTO D, LANCTODOCUM LD, LANCAMENTOSIMOVEL LI, TIPO' +
        'IMOVEL T,'
      '        (SELECT CODDOCUMENTO, VALOR'
      '           FROM LANCTODOCUM'
      
        '          WHERE RTRIM(OPERACAO) = '#39'1'#39' OR RTRIM(OPERACAO) = '#39'2'#39' O' +
        'R RTRIM(OPERACAO) = '#39'3'#39') TRD'
      ''
      '   WHERE ( LI.IDCONTRATOIMOVEL IS NOT NULL )'
      '     AND ( (D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL) )'
      '     AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )'
      '     AND ( D.CODDOCUMENTO  = LD.CODDOCUMENTO )'
      '     AND ( D.CODDOCUMENTO  = TRD.CODDOCUMENTO )'
      '     AND ( LI.CODTIPIMOVEL = T.CODTIPIMOVEL )'
      '     AND ( (LD.CODALTERADOR IS NULL) OR'
      '           (LD.CODALTERADOR <> T.CODALTMULTA AND'
      '            LD.CODALTERADOR <> T.CODALTJUROS AND'
      '            LD.CODALTERADOR <> T.CODALTCORRMON) )'
      '   GROUP BY LI.CODDOCUMENTO,'
      '            LI.IDCONTRATOIMOVEL,'
      '            LI.MESCOMPETENCIA,'
      '            LI.ANOCOMPETENCIA,'
      '            LI.DATAVENCIMENTO,'
      '            LI.CODTIPIMOVEL'
      '   ) DD,'
      ''
      
        '   /* BUSCA O VALOR ACUMULADO DE CORREÇÃO MONETÁRIA NA ÚLTIMA DA' +
        'TA CALCULADA */'
      
        '   (SELECT LO.CODDOCUMENTO, LO.IDOPERACAO, SUM(LO.VLRACUM) AS VL' +
        'RACUM'
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,'
      '          ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA'
      '              FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2'
      '             WHERE LO2.IDOPERACAO = PI2.IDOPERATUALCM'
      '             GROUP BY LO2.CODDOCUMENTO'
      '           ) UD'
      '    WHERE LO.IDOPERACAO   = PI.IDOPERATUALCM'
      '      AND LO.DATAOPER     = UD.ULTDIA'
      '      AND LO.CODDOCUMENTO = UD.CODDOCUMENTO (+)'
      '    GROUP BY LO.CODDOCUMENTO,'
      '             LO.IDOPERACAO'
      '   ) CM,'
      ''
      
        '   /* BUSCA O VALOR ACUMULADO DE JUROS NA ÚLTIMA DATA CALCULADA ' +
        '*/'
      
        '   (SELECT LO.CODDOCUMENTO, LO.IDOPERACAO, SUM(LO.VLRACUM) AS VL' +
        'RACUM'
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,'
      '          ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA'
      '              FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2'
      '             WHERE LO2.IDOPERACAO = PI2.IDOPERATUALJUROS'
      '             GROUP BY LO2.CODDOCUMENTO'
      '           ) UD'
      '    WHERE LO.IDOPERACAO   = PI.IDOPERATUALJUROS'
      '      AND LO.DATAOPER     = UD.ULTDIA'
      '      AND LO.CODDOCUMENTO = UD.CODDOCUMENTO (+)'
      '    GROUP BY LO.CODDOCUMENTO,'
      '             LO.IDOPERACAO'
      '   ) JR,'
      ''
      
        '   /* BUSCA O VALOR ACUMULADO DE MULTA NA ÚLTIMA DATA CALCULADA ' +
        '*/'
      
        '   (SELECT LO.CODDOCUMENTO, LO.IDOPERACAO, SUM(LO.VLRACUM) AS VL' +
        'RACUM'
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,'
      '          ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA'
      '              FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2'
      '             WHERE LO2.IDOPERACAO = PI2.IDOPERATUALMULTA'
      '             GROUP BY LO2.CODDOCUMENTO'
      '           ) UD'
      '    WHERE LO.IDOPERACAO   = PI.IDOPERATUALMULTA'
      '      AND LO.DATAOPER     = UD.ULTDIA'
      '      AND LO.CODDOCUMENTO = UD.CODDOCUMENTO (+)'
      '    GROUP BY LO.CODDOCUMENTO,'
      '             LO.IDOPERACAO'
      '   ) MT'
      ''
      'WHERE  ( C.IDLOCATARIO      = PL.IDPESSOA(+) )'
      '   AND ( C.IDADMINIMOVEL    = PA.IDPESSOA(+) )'
      ''
      '   AND ( DD.CODTIPIMOVEL    = T.CODTIPIMOVEL(+) )'
      ''
      '   AND ((DD.TOT_RECEBER     - DD.RECEBIDO) <> 0 )'
      '   AND ( C.IDCONTRATOIMOVEL = DD.IDCONTRATOIMOVEL )'
      '   AND ( DD.CODDOCUMENTO    = CM.CODDOCUMENTO (+) )'
      '   AND ( DD.CODDOCUMENTO    = JR.CODDOCUMENTO (+) )'
      '   AND ( DD.CODDOCUMENTO    = MT.CODDOCUMENTO (+) )'
      '   AND ( C.IDSITCONTIMOB    = SC.IDSITCONTIMOB (+) )'
      ''
      ''
      'ORDER BY'
      
        '   C.CONNUMERO, PL.NOME, DD.DATAVENCIMENTO, COMPETENCIA, DD.CODD' +
        'OCUMENTO'
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
      ' ')
    ValidateWithMask = True
    Left = 368
    Top = 356
    object qryInadimplContrAnaliticoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryInadimplContrAnaliticoNUMERO_CONTRATO: TStringField
      FieldName = 'NUMERO_CONTRATO'
    end
    object qryInadimplContrAnaliticoNOME_CONTRATO: TStringField
      FieldName = 'NOME_CONTRATO'
      Size = 60
    end
    object qryInadimplContrAnaliticoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryInadimplContrAnaliticoTOT_RECEBER: TFloatField
      FieldName = 'TOT_RECEBER'
    end
    object qryInadimplContrAnaliticoRECEBIDO: TFloatField
      FieldName = 'RECEBIDO'
    end
    object qryInadimplContrAnaliticoCOMPETENCIA: TStringField
      FieldName = 'COMPETENCIA'
      Size = 81
    end
    object qryInadimplContrAnaliticoCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
    end
    object qryInadimplContrAnaliticoCONDATAFIM: TDateTimeField
      FieldName = 'CONDATAFIM'
    end
    object qryInadimplContrAnaliticoIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
    end
    object qryInadimplContrAnaliticoNF_LOCATARIO: TStringField
      FieldName = 'NF_LOCATARIO'
      Size = 60
    end
    object qryInadimplContrAnaliticoRS_LOCATARIO: TStringField
      FieldName = 'RS_LOCATARIO'
      Size = 60
    end
    object qryInadimplContrAnaliticoIDADMINIMOVEL: TFloatField
      FieldName = 'IDADMINIMOVEL'
    end
    object qryInadimplContrAnaliticoDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryInadimplContrAnaliticoCORRECAO: TFloatField
      FieldName = 'CORRECAO'
    end
    object qryInadimplContrAnaliticoJUROS: TFloatField
      FieldName = 'JUROS'
    end
    object qryInadimplContrAnaliticoMULTA: TFloatField
      FieldName = 'MULTA'
    end
    object qryInadimplContrAnaliticoTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object qryInadimplContrAnaliticoDIAS: TFloatField
      FieldName = 'DIAS'
    end
    object qryInadimplContrAnaliticoDESCTIPOIMOVEL: TStringField
      FieldName = 'DESCTIPOIMOVEL'
      Size = 60
    end
    object strngfldInadimplContrAnaliticoDESCR_SITCONTR: TStringField
      FieldName = 'DESCR_SITCONTR'
      Size = 60
    end
  end
  object qryCCConsolidado: TwwQuery
    OnCalcFields = qryCCConsolidadoCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATOIMOVEL,'
      '   C.CONNUMERO,'
      '   C.CONNOME,'
      '   P.NOME AS LOCATARIO,'
      '   I.IDIMOVEL,'
      '   I.IDIMOVELMESTRE,'
      '   I.CODTIPIMOVEL,'
      '   IM.IDIMOVEL AS IDMESTRE,'
      '   IM.IMONOME AS NOME_MESTRE,'
      '   (IM.IMONOME||'#39' - '#39'||I.IMONOME) AS IMOVEL_EXTENSO,'
      '   TI.DESCTIPOIMOVEL,'
      '   LI.DATALANCAMENTO,'
      '   LI.DATAVENCIMENTO,'
      '   LI.MESCOMPETENCIA,'
      '   LI.ANOCOMPETENCIA,'
      '   T.DESCCUSTORECIMO,'
      '   TA.DESCRICAO,'
      '   D.RECPAG, D.STATUS, D.NODOCUMENTO, D.NUMAPGR,'
      '   PFC.NOME AS NF_FORCLI,'
      '   PFC.RAZAOSOCIAL AS RS_FORCLI,'
      '   LD.CODDOCUMENTO,'
      '   LD.CODALTERADOR,'
      '   LD.OPERACAO,'
      '   LD.VALOR,'
      '   LD.DEBCRE,'
      '   LD.HISTORICOCOMPL,'
      '   LD.DATALANCTO,'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', LI.DATAVENCIMENTO, '#39'2'#39', LI.DA' +
        'TAVENCIMENTO, '#39'4'#39', LD.DATALANCTO, RP.DATABAIXA) AS DATA,'
      ''
      '   SUM('
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'1'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0' +
        ') +'
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0' +
        ') +'
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'3'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0' +
        ') +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'12'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0' +
        ') +'
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALO' +
        'R * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0)'
      '   ) AS TOT_RECEBER,'
      ''
      
        '   SUM( DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', DE' +
        'CODE(LD.DEBCRE, '#39'C'#39', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.' +
        'VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0))'
      '   AS TOT_RECEBIDO,'
      ''
      '   SUM('
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'1'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0' +
        ') +'
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'2'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0' +
        ') +'
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'3'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0' +
        ') +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'12'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0' +
        ') +'
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'4'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALO' +
        'R * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0)'
      '   ) AS TOT_PAGAR,'
      ''
      
        '   SUM(DECODE(RTRIM(LD.OPERACAO),  '#39'5'#39', DECODE(D.RECPAG, '#39'P'#39', DE' +
        'CODE(LD.DEBCRE, '#39'D'#39', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.' +
        'VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0))'
      '   AS TOT_PAGO,'
      ''
      '   SUM('
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'1'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0' +
        ') +'
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0' +
        ') +'
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'3'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0' +
        ') +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'12'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0' +
        ') +'
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALO' +
        'R * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) -'
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALO' +
        'R * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0)'
      '   ) AS SALDO_RECEB,'
      ''
      '   SUM('
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'1'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0' +
        ') +'
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'2'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0' +
        ') +'
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'3'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0' +
        ') +'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'12'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0' +
        ') +'
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'4'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'C'#39', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALO' +
        'R * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0)  -'
      
        '   DECODE(RTRIM(LD.OPERACAO),  '#39'5'#39', DECODE(D.RECPAG, '#39'P'#39', DECODE' +
        '(LD.DEBCRE, '#39'D'#39', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALO' +
        'R * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0)'
      '   ) AS SALDO_PAGAR'
      'FROM'
      '   PESSOA P, '
      '   PESSOA PFC,'
      '   DOCUMENTO D, '
      '   LANCTODOCUM LD,'
      '   ( SELECT CODDOCUMENTO, VALOR'
      '     FROM LANCTODOCUM'
      '     WHERE RTRIM(OPERACAO) = '#39'1'#39' '
      '        OR RTRIM(OPERACAO) = '#39'2'#39' '
      '        OR RTRIM(OPERACAO) = '#39'3'#39
      '        OR RTRIM(OPERACAO) = '#39'12'#39
      '   ) TRD,'
      '   RECBTOPAGTO RP, '
      '   TIPOALTERADOR TA,'
      '   CONTRATOIMOVEL C, '
      '   IMOVEL I, '
      '   IMOVEL IM,'
      '   TIPOCUSTORECIMOV T, '
      '   LANCAMENTOSIMOVEL LI,'
      '   TIPOIMOVEL TI '
      'WHERE'
      '         LI.MESCOMPETENCIA = 4 AND LI.ANOCOMPETENCIA = 2002  '
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   AND ( LI.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      '   AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )'
      '   AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )'
      '   AND ( LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) )'
      '   AND ( D.CODDOCUMENTO = TRD.CODDOCUMENTO )'
      '   AND ( LD.NUMLANCTO = RP.NUMLANCTO(+) )'
      '   AND ( LD.CODALTERADOR = TA.CODALTERADOR(+) )'
      '   AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO )'
      '   AND ( C.IDLOCATARIO = P.IDPESSOA )'
      '   AND ( D.IDFORCLI = PFC.IDPESSOA(+) )'
      '   AND ( TI.CODTIPIMOVEL = I.CODTIPIMOVEL (+) )'
      ''
      'GROUP BY'
      '   C.IDCONTRATOIMOVEL,'
      '   C.CONNUMERO,'
      '   C.CONNOME,'
      '   P.NOME,'
      '   I.IDIMOVEL,'
      '   I.CODTIPIMOVEL,'
      '   IM.IDIMOVEL,'
      '   I.IDIMOVELMESTRE,'
      '   IM.IMONOME,'
      '   TI.CODTIPIMOVEL,'
      '   TI.DESCTIPOIMOVEL, '
      '   I.IMONOME,'
      '   LI.DATALANCAMENTO,'
      '   LI.DATAVENCIMENTO,'
      '   LI.MESCOMPETENCIA,'
      '   LI.ANOCOMPETENCIA,'
      '   T.DESCCUSTORECIMO,'
      '   TA.DESCRICAO,'
      '   D.RECPAG,'
      '   D.STATUS,'
      '   D.NODOCUMENTO,'
      '   D.NUMAPGR,'
      '   PFC.NOME,'
      '   PFC.RAZAOSOCIAL,'
      '   LD.CODDOCUMENTO,'
      '   LD.CODALTERADOR,'
      '   LD.OPERACAO,'
      '   LD.VALOR,'
      '   LD.DEBCRE,'
      '   LD.HISTORICOCOMPL,'
      '   LD.DATALANCTO,'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', LI.DATAVENCIMENTO, '#39'2'#39', LI.DA' +
        'TAVENCIMENTO, '#39'4'#39', LD.DATALANCTO, RP.DATABAIXA)'
      'ORDER BY '
      '   I.CODTIPIMOVEL,'
      '   IM.IMONOME,'
      '   C.CONNOME,'
      '   P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 203
    Top = 56
    object StringField15: TStringField
      FieldKind = fkCalculated
      FieldName = 'CONTRATOEXTENSO'
      Size = 130
      Calculated = True
    end
    object StringField25: TStringField
      DisplayWidth = 150
      FieldKind = fkCalculated
      FieldName = 'DESCALC'
      Size = 150
      Calculated = True
    end
    object FloatField15: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object StringField26: TStringField
      FieldName = 'CONNUMERO'
    end
    object StringField27: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object StringField28: TStringField
      FieldName = 'LOCATARIO'
      Size = 60
    end
    object FloatField31: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object FloatField32: TFloatField
      FieldName = 'IDMESTRE'
    end
    object StringField29: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object StringField30: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object DateTimeField9: TDateTimeField
      FieldName = 'DATALANCAMENTO'
    end
    object DateTimeField10: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object FloatField33: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object FloatField34: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object StringField31: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object StringField32: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
    object StringField33: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object FloatField35: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object FloatField36: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object FloatField37: TFloatField
      FieldName = 'CODALTERADOR'
    end
    object StringField34: TStringField
      FieldName = 'OPERACAO'
      Size = 2
    end
    object FloatField38: TFloatField
      FieldName = 'VALOR'
    end
    object StringField35: TStringField
      FieldName = 'DEBCRE'
      Size = 1
    end
    object StringField36: TStringField
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object DateTimeField11: TDateTimeField
      FieldName = 'DATALANCTO'
    end
    object StringField37: TStringField
      FieldName = 'NF_FORCLI'
      Size = 60
    end
    object StringField38: TStringField
      FieldName = 'RS_FORCLI'
      Size = 60
    end
    object DateTimeField12: TDateTimeField
      FieldName = 'DATA'
    end
    object FloatField39: TFloatField
      FieldName = 'TOT_RECEBER'
    end
    object FloatField40: TFloatField
      FieldName = 'TOT_RECEBIDO'
    end
    object FloatField41: TFloatField
      FieldName = 'TOT_PAGAR'
    end
    object FloatField42: TFloatField
      FieldName = 'TOT_PAGO'
    end
    object FloatField43: TFloatField
      FieldName = 'SALDO_RECEB'
    end
    object FloatField44: TFloatField
      FieldName = 'SALDO_PAGAR'
    end
    object FloatField45: TFloatField
      FieldName = 'NUMAPGR'
    end
    object qryCCConsolidadoCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryCCConsolidadoDESCTIPOIMOVEL: TStringField
      FieldName = 'DESCTIPOIMOVEL'
      Size = 60
    end
  end
  object dsCCConsolidado: TwwDataSource
    DataSet = qryCCConsolidado
    Left = 203
    Top = 68
  end
  object pplCCConsolidado: TppBDEPipeline
    DataSource = dsCCConsolidado
    UserName = 'lCCContrato1'
    Left = 203
    Top = 80
  end
  object rptCCConsolidado: TppReport
    AutoStop = False
    DataPipeline = pplCCConsolidado
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 297128
    PrinterSetup.mmPaperWidth = 210080
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 203
    Top = 8
    Version = '7.04'
    mmColumnWidth = 184944
    DataPipelineName = 'pplCCConsolidado'
    object ppHeaderBand7: TppHeaderBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 39423
      mmPrintPosition = 0
      object ppLabel138: TppLabel
        UserName = 'ppLabel14'
        AutoSize = False
        Caption = 'Conta Corrente por Contrato Consolidado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8467
        mmWidth = 189971
        BandType = 0
      end
      object ppLabel139: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel15'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 265
        mmTop = 1323
        mmWidth = 189707
        BandType = 0
      end
      object ppLabel140: TppLabel
        UserName = 'rptCCContratoLabel10'
        Caption = 'Mês de Competência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 18521
        mmWidth = 33338
        BandType = 0
      end
      object ppLabel141: TppLabel
        UserName = 'rptCCContratoLabel11'
        Caption = 'Período de Datas:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 21960
        mmWidth = 26988
        BandType = 0
      end
      object rptCCConsolidado_lblCompetencia: TppLabel
        UserName = 'rptCCConsolidado_lblCompetencia'
        Caption = 'rptCCConsolidado_lblCompetencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 18521
        mmWidth = 44186
        BandType = 0
      end
      object rptCCConsolidado_lblDatas: TppLabel
        UserName = 'rptCCConsolidado_lblDatas'
        Caption = 'rptCCConsolidado_lblDatas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 21960
        mmWidth = 34925
        BandType = 0
      end
      object ppLabel144: TppLabel
        UserName = 'rptCCContratoLabel12'
        Caption = 'Administradora:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 8202
        mmTop = 27252
        mmWidth = 25135
        BandType = 0
      end
      object rptCCConsolidado_lblAdministradora: TppLabel
        UserName = 'rptCCConsolidado_lblAdministradora'
        Caption = 'Administradora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 27252
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel148: TppLabel
        UserName = 'rptCCContratoLabel7'
        Caption = 'Tipo de Receita / Despesa:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 104246
        mmTop = 21431
        mmWidth = 37571
        BandType = 0
      end
      object rptCCConsolidado_lblTipoRecDes: TppLabel
        UserName = 'rptCCConsolidado_lblTipoRecDes'
        AutoSize = False
        Caption = 'rptCCConsolidado_lblTipoRecDes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 143669
        mmTop = 21431
        mmWidth = 45773
        BandType = 0
      end
      object rptCCConsolidado_lblRecPag: TppLabel
        UserName = 'rptCCConsolidado_lblRecPag'
        AutoSize = False
        Caption = 'rptCCConsolidado_lblRecPag'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 143669
        mmTop = 26723
        mmWidth = 45773
        BandType = 0
      end
      object rptCCConsolidado_lblPrevEfetivo: TppLabel
        UserName = 'rptCCConsolidado_lblPrevEfetivo'
        AutoSize = False
        Caption = 'rptCCConsolidado_lblPrevEfetivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 143669
        mmTop = 30956
        mmWidth = 45773
        BandType = 0
      end
      object rptCCConsolidado_lblContratosVigentes: TppLabel
        UserName = 'rptCCConsolidado_lblContratosVigentes'
        Caption = 'Apenas Contratos vigentes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 31485
        mmWidth = 34131
        BandType = 0
      end
      object rptCCConsolidado_lblEmAberto: TppLabel
        UserName = 'rptCCConsolidado_lblEmAberto'
        AutoSize = False
        Caption = 'Apenas lançamentos em aberto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 143669
        mmTop = 35190
        mmWidth = 45773
        BandType = 0
      end
      object rptCCConsolidado_lblTipoData: TppLabel
        UserName = 'rptCCConsolidado_lblTipoData'
        Caption = 'por Data de Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 35719
        mmWidth = 30692
        BandType = 0
      end
      object rptCCConsolidado_lblTipoImovel: TppLabel
        UserName = 'rptCCConsolidado_lblTipoImovel'
        AutoSize = False
        Caption = 'Todos os Tipos de Imóvel / Segmento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 74348
        mmTop = 31485
        mmWidth = 57415
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'ppLogoCCContrato'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 18785
      mmPrintPosition = 0
      object ppShape17: TppShape
        OnPrint = rptFolhaAluguel_FundoBandaDetalhePrint
        UserName = 'rptCCContrato_FundoBandaDetalhe'
        Brush.Color = 13040076
        ParentHeight = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 18785
        mmLeft = 0
        mmTop = 0
        mmWidth = 190500
        BandType = 4
      end
      object ppLine36: TppLine
        OnPrint = rptCCContrato_SeparadorPrint
        UserName = 'rptCCContrato_Separador'
        ParentHeight = True
        ParentWidth = True
        StretchWithParent = True
        Visible = False
        Weight = 0.75
        mmHeight = 18785
        mmLeft = 0
        mmTop = 0
        mmWidth = 190080
        BandType = 4
      end
      object ppDBMemo25: TppDBMemo
        UserName = 'rptCCContratoDBMemo1'
        CharWrap = True
        DataField = 'DESCCUSTORECIMO'
        DataPipeline = pplCCConsolidado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCConsolidado'
        mmHeight = 15875
        mmLeft = 2381
        mmTop = 794
        mmWidth = 44186
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText73: TppDBText
        UserName = 'rptCCContratoDBText5'
        BlankWhenZero = True
        DataField = 'TOT_PAGO'
        DataPipeline = pplCCConsolidado
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCConsolidado'
        mmHeight = 2646
        mmLeft = 148432
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText74: TppDBText
        UserName = 'rptCCContratoDBText6'
        DataField = 'DATA'
        DataPipeline = pplCCConsolidado
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplCCConsolidado'
        mmHeight = 2646
        mmLeft = 176742
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppLabel158: TppLabel
        UserName = 'rptCCContratoLabel13'
        AutoSize = False
        Caption = ' / '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 168011
        mmTop = 794
        mmWidth = 2381
        BandType = 4
      end
      object ppDBText75: TppDBText
        UserName = 'rptCCContratoDBText4'
        DataField = 'MESCOMPETENCIA'
        DataPipeline = pplCCConsolidado
        DisplayFormat = '00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCConsolidado'
        mmHeight = 2646
        mmLeft = 165100
        mmTop = 794
        mmWidth = 3175
        BandType = 4
      end
      object ppDBText76: TppDBText
        UserName = 'rptCCContratoDBText7'
        DataField = 'ANOCOMPETENCIA'
        DataPipeline = pplCCConsolidado
        DisplayFormat = '0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCConsolidado'
        mmHeight = 2646
        mmLeft = 170127
        mmTop = 794
        mmWidth = 6350
        BandType = 4
      end
      object ppDBMemo34: TppDBMemo
        UserName = 'rptCCContratoDBMemo2'
        CharWrap = True
        DataField = 'DESCALC'
        DataPipeline = pplCCConsolidado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCConsolidado'
        mmHeight = 15875
        mmLeft = 47096
        mmTop = 794
        mmWidth = 28840
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText77: TppDBText
        UserName = 'rptCCContratoDBText2'
        BlankWhenZero = True
        DataField = 'TOT_PAGAR'
        DataPipeline = pplCCConsolidado
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCConsolidado'
        mmHeight = 2646
        mmLeft = 133086
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText78: TppDBText
        UserName = 'rptCCContratoDBText8'
        BlankWhenZero = True
        DataField = 'TOT_RECEBIDO'
        DataPipeline = pplCCConsolidado
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCConsolidado'
        mmHeight = 2646
        mmLeft = 117740
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText79: TppDBText
        UserName = 'rptCCContratoDBText9'
        BlankWhenZero = True
        DataField = 'TOT_RECEBER'
        DataPipeline = pplCCConsolidado
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCConsolidado'
        mmHeight = 2646
        mmLeft = 102394
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText80: TppDBText
        UserName = 'rptCCContratoDBText10'
        DataField = 'NODOCUMENTO'
        DataPipeline = pplCCConsolidado
        DisplayFormat = '####################0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCConsolidado'
        mmHeight = 2646
        mmLeft = 76200
        mmTop = 794
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText81: TppDBText
        UserName = 'rptCCContratoDBText11'
        BlankWhenZero = True
        DataField = 'NUMAPGR'
        DataPipeline = pplCCConsolidado
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCConsolidado'
        mmHeight = 2381
        mmLeft = 93398
        mmTop = 794
        mmWidth = 8731
        BandType = 4
      end
    end
    object ppFooterBand10: TppFooterBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine37: TppLine
        UserName = 'CCContratoLinha4'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 190080
        BandType = 8
      end
      object ppLabel162: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel21'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'Calc7'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 90752
        mmTop = 3175
        mmWidth = 31221
        BandType = 8
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'Calc8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 151342
        mmTop = 3175
        mmWidth = 35983
        BandType = 8
      end
    end
    object ppGroup9: TppGroup
      BreakName = 'CODTIPIMOVEL'
      DataPipeline = pplCCConsolidado
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCCConsolidado'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
        BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
        mmBottomOffset = 40
        mmHeight = 7144
        mmPrintPosition = 0
        object ppLabel149: TppLabel
          UserName = 'Label149'
          Caption = 'Segmento :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 1852
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object ppDBText86: TppDBText
          UserName = 'DBText86'
          AutoSize = True
          DataField = 'DESCTIPOIMOVEL'
          DataPipeline = pplCCConsolidado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 3969
          mmLeft = 20373
          mmTop = 1852
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object ppLine44: TppLine
          UserName = 'Line44'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 189971
          BandType = 3
          GroupNo = 0
        end
        object ppLine45: TppLine
          UserName = 'Line45'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 265
          mmTop = 6615
          mmWidth = 189971
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
        BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
        mmBottomOffset = 40
        mmHeight = 11906
        mmPrintPosition = 0
        object ppLine41: TppLine
          UserName = 'Line41'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 265
          mmWidth = 190080
          BandType = 5
          GroupNo = 0
        end
        object ppShape25: TppShape
          UserName = 'Shape25'
          Pen.Width = 2
          mmHeight = 5027
          mmLeft = 101336
          mmTop = 1588
          mmWidth = 63500
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc65: TppDBCalc
          UserName = 'DBCalc65'
          DataField = 'TOT_PAGAR'
          DataPipeline = pplCCConsolidado
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 2646
          mmLeft = 133086
          mmTop = 2646
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc66: TppDBCalc
          UserName = 'DBCalc66'
          DataField = 'TOT_PAGO'
          DataPipeline = pplCCConsolidado
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 2646
          mmLeft = 148432
          mmTop = 2646
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc67: TppDBCalc
          UserName = 'DBCalc67'
          DataField = 'TOT_RECEBER'
          DataPipeline = pplCCConsolidado
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 2646
          mmLeft = 102394
          mmTop = 2646
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc68: TppDBCalc
          UserName = 'DBCalc68'
          DataField = 'TOT_RECEBIDO'
          DataPipeline = pplCCConsolidado
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 2646
          mmLeft = 117740
          mmTop = 2646
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppLabel143: TppLabel
          UserName = 'Label143'
          AutoSize = False
          Caption = 'Total do Segmento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 77258
          mmTop = 2910
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object ppShape26: TppShape
          UserName = 'Shape26'
          Pen.Width = 2
          mmHeight = 5027
          mmLeft = 101336
          mmTop = 5821
          mmWidth = 63500
          BandType = 5
          GroupNo = 0
        end
        object ppLabel147: TppLabel
          UserName = 'Label147'
          AutoSize = False
          Caption = 'Saldo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 92869
          mmTop = 6350
          mmWidth = 8202
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc69: TppDBCalc
          UserName = 'DBCalc69'
          DataField = 'SALDO_RECEB'
          DataPipeline = pplCCConsolidado
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 2646
          mmLeft = 102394
          mmTop = 6879
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc70: TppDBCalc
          UserName = 'DBCalc70'
          DataField = 'SALDO_PAGAR'
          DataPipeline = pplCCConsolidado
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 2646
          mmLeft = 133086
          mmTop = 6879
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup12: TppGroup
      BreakName = 'NOME_MESTRE'
      DataPipeline = pplCCConsolidado
      OutlineSettings.CreateNode = True
      UserName = 'Group12'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCCConsolidado'
      object ppGroupHeaderBand9: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppLabel142: TppLabel
          UserName = 'Label142'
          AutoSize = False
          Caption = 'Imovel Mestre:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 1058
          mmTop = 1588
          mmWidth = 23283
          BandType = 3
          GroupNo = 1
        end
        object ppDBText84: TppDBText
          UserName = 'DBText84'
          AutoSize = True
          DataField = 'NOME_MESTRE'
          DataPipeline = pplCCConsolidado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 3175
          mmLeft = 24871
          mmTop = 1588
          mmWidth = 21960
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11642
        mmPrintPosition = 0
        object ppShape27: TppShape
          UserName = 'Shape27'
          Pen.Width = 2
          mmHeight = 5027
          mmLeft = 101336
          mmTop = 1588
          mmWidth = 63500
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc71: TppDBCalc
          UserName = 'DBCalc71'
          DataField = 'TOT_PAGAR'
          DataPipeline = pplCCConsolidado
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 2646
          mmLeft = 133086
          mmTop = 2117
          mmWidth = 15081
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc72: TppDBCalc
          UserName = 'DBCalc72'
          DataField = 'TOT_PAGO'
          DataPipeline = pplCCConsolidado
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 2646
          mmLeft = 148432
          mmTop = 2117
          mmWidth = 15081
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc73: TppDBCalc
          UserName = 'DBCalc73'
          DataField = 'TOT_RECEBER'
          DataPipeline = pplCCConsolidado
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 2646
          mmLeft = 102394
          mmTop = 2117
          mmWidth = 15081
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc74: TppDBCalc
          UserName = 'DBCalc74'
          DataField = 'TOT_RECEBIDO'
          DataPipeline = pplCCConsolidado
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 2646
          mmLeft = 117740
          mmTop = 2117
          mmWidth = 15081
          BandType = 5
          GroupNo = 1
        end
        object ppLabel150: TppLabel
          UserName = 'Label150'
          AutoSize = False
          Caption = 'Total do Empreendimento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 66940
          mmTop = 2646
          mmWidth = 34131
          BandType = 5
          GroupNo = 1
        end
        object ppShape28: TppShape
          UserName = 'Shape28'
          Pen.Width = 2
          mmHeight = 5027
          mmLeft = 101336
          mmTop = 5027
          mmWidth = 63500
          BandType = 5
          GroupNo = 1
        end
        object ppLabel152: TppLabel
          UserName = 'Label152'
          AutoSize = False
          Caption = 'Saldo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 93134
          mmTop = 6085
          mmWidth = 7938
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc75: TppDBCalc
          UserName = 'DBCalc75'
          DataField = 'SALDO_RECEB'
          DataPipeline = pplCCConsolidado
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 2646
          mmLeft = 102394
          mmTop = 6085
          mmWidth = 15081
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc76: TppDBCalc
          UserName = 'DBCalc701'
          DataField = 'SALDO_PAGAR'
          DataPipeline = pplCCConsolidado
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 2646
          mmLeft = 133086
          mmTop = 6085
          mmWidth = 15081
          BandType = 5
          GroupNo = 1
        end
        object ppLine43: TppLine
          UserName = 'Line43'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 190080
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup11: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplCCConsolidado
      OutlineSettings.CreateNode = True
      UserName = 'Group11'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCCConsolidado'
      object ppGroupHeaderBand8: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppLabel166: TppLabel
          UserName = 'ppLabel22'
          Caption = 'Contrato:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 2381
          mmTop = 1323
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object ppLabel174: TppLabel
          UserName = 'rptCCContratoLabel2'
          Caption = 'Locatário:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 2381
          mmTop = 4498
          mmWidth = 13758
          BandType = 3
          GroupNo = 1
        end
        object ppDBText83: TppDBText
          UserName = 'rptCCContratoDBText3'
          AutoSize = True
          DataField = 'LOCATARIO'
          DataPipeline = pplCCConsolidado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 2910
          mmLeft = 16669
          mmTop = 4498
          mmWidth = 14288
          BandType = 3
          GroupNo = 1
        end
        object ppDBText82: TppDBText
          UserName = 'rptCCContratoDBText1'
          AutoSize = True
          DataField = 'CONTRATOEXTENSO'
          DataPipeline = pplCCConsolidado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 2910
          mmLeft = 16669
          mmTop = 1323
          mmWidth = 25665
          BandType = 3
          GroupNo = 1
        end
        object ppLabel175: TppLabel
          UserName = 'rptCCContratoLabel3'
          Caption = 'Tipo Receita / Despesa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 2381
          mmTop = 9260
          mmWidth = 26458
          BandType = 3
          GroupNo = 1
        end
        object ppLabel177: TppLabel
          UserName = 'rptCCContratoLabel9'
          Caption = 'Alterador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 47890
          mmTop = 9260
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppLabel184: TppLabel
          UserName = 'rptCCContratoLabel18'
          Caption = 'Nº Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 76200
          mmTop = 9260
          mmWidth = 16669
          BandType = 3
          GroupNo = 1
        end
        object ppLabel185: TppLabel
          UserName = 'rptCCContratoLabel19'
          Caption = 'Nº AP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 95515
          mmTop = 9260
          mmWidth = 6615
          BandType = 3
          GroupNo = 1
        end
        object ppLabel182: TppLabel
          UserName = 'rptCCContratoLabel16'
          Caption = 'A Receber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 105304
          mmTop = 9260
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object ppLabel181: TppLabel
          UserName = 'rptCCContratoLabel14'
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 121973
          mmTop = 9260
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppLabel179: TppLabel
          UserName = 'rptCCContratoLabel15'
          Caption = 'A Pagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 139171
          mmTop = 9260
          mmWidth = 8996
          BandType = 3
          GroupNo = 1
        end
        object ppLabel180: TppLabel
          UserName = 'rptCCContratoLabel4'
          Caption = 'Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 157427
          mmTop = 9260
          mmWidth = 6085
          BandType = 3
          GroupNo = 1
        end
        object ppLabel178: TppLabel
          UserName = 'rptCCContratoLabel1'
          Caption = 'Compet.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 165365
          mmTop = 9260
          mmWidth = 9790
          BandType = 3
          GroupNo = 1
        end
        object ppLabel176: TppLabel
          UserName = 'rptCCContratoLabel5'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 180446
          mmTop = 9260
          mmWidth = 5292
          BandType = 3
          GroupNo = 1
        end
        object ppLine40: TppLine
          UserName = 'CCContratoLinha2'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 11906
          mmWidth = 190080
          BandType = 3
          GroupNo = 1
        end
        object ppLine38: TppLine
          UserName = 'CCContratoLinha1'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 8731
          mmWidth = 190080
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 13494
        mmPrintPosition = 0
        object ppShape18: TppShape
          UserName = 'rptCCContratoShape1'
          Pen.Width = 2
          mmHeight = 5027
          mmLeft = 101336
          mmTop = 1323
          mmWidth = 63500
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc34: TppDBCalc
          UserName = 'rptCCContratoDBCalc1'
          DataField = 'TOT_PAGAR'
          DataPipeline = pplCCConsolidado
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 2646
          mmLeft = 133086
          mmTop = 2381
          mmWidth = 15081
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc35: TppDBCalc
          UserName = 'rptCCContratoDBCalc2'
          DataField = 'TOT_PAGO'
          DataPipeline = pplCCConsolidado
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 2646
          mmLeft = 148432
          mmTop = 2381
          mmWidth = 15081
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc36: TppDBCalc
          UserName = 'rptCCContratoDBCalc3'
          DataField = 'TOT_RECEBER'
          DataPipeline = pplCCConsolidado
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 2646
          mmLeft = 102394
          mmTop = 2381
          mmWidth = 15081
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc37: TppDBCalc
          UserName = 'rptCCContratoDBCalc4'
          DataField = 'TOT_RECEBIDO'
          DataPipeline = pplCCConsolidado
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 2646
          mmLeft = 117740
          mmTop = 2381
          mmWidth = 15081
          BandType = 5
          GroupNo = 1
        end
        object ppLabel186: TppLabel
          UserName = 'rptCCContratoLabel6'
          AutoSize = False
          Caption = 'Total do Contrato:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 78846
          mmTop = 2646
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object ppShape24: TppShape
          UserName = 'rptCCContratoShape2'
          Pen.Width = 2
          mmHeight = 5027
          mmLeft = 101336
          mmTop = 5556
          mmWidth = 63500
          BandType = 5
          GroupNo = 1
        end
        object ppLabel188: TppLabel
          UserName = 'rptCCContratoLabel17'
          AutoSize = False
          Caption = 'Saldo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 93134
          mmTop = 6085
          mmWidth = 7938
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc63: TppDBCalc
          UserName = 'rptCCContratoDBCalc5'
          DataField = 'SALDO_RECEB'
          DataPipeline = pplCCConsolidado
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 2646
          mmLeft = 102394
          mmTop = 6615
          mmWidth = 15081
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc64: TppDBCalc
          UserName = 'rptCCContratoDBCalc6'
          DataField = 'SALDO_PAGAR'
          DataPipeline = pplCCConsolidado
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCConsolidado'
          mmHeight = 2646
          mmLeft = 133086
          mmTop = 6615
          mmWidth = 15081
          BandType = 5
          GroupNo = 1
        end
        object ppLine42: TppLine
          UserName = 'Line42'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 265
          mmWidth = 190080
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object qryResumoFolha: TwwQuery
    OnCalcFields = qryFolhaAluguelCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT LI.CODTIPIMOVEL, TI.DESCTIPOIMOVEL,  SUM(LI.VLRLANCRECEB)' +
        ' AS TOT_CONTRATO,'
      
        '       NVL(SUM(DE.TOT_DESC),0) AS TOT_DESC, T.DESCCUSTORECIMO AS' +
        ' TIPO_RECDES,'
      
        '       ( NVL(SUM(LI.VLRLANCRECEB),0) - NVL(SUM(DE.TOT_DESC),0) )' +
        ' AS TOTAL'
      
        'FROM LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, TIPOCUSTORECIMOV T,' +
        ' TIPOIMOVEL TI,'
      '   ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC'
      '     FROM ALTERALANCIMOVEL A, TIPOALTERADOR T'
      '     WHERE A.CODALTERADOR = T.CODALTERADOR'
      '       AND T.ACRESDECRES  = '#39'C'#39
      '     GROUP BY IDDOCUMENTO ) DE'
      'WHERE ( LI.RECPAG            = '#39'R'#39' )'
      '  AND ( LI.IDCONTRATOIMOVEL  = C.IDCONTRATOIMOVEL )'
      '  AND ( C.FLGTIPOCONTRATO    = '#39'L'#39' )'
      '  AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO )'
      '  AND ( LI.CODTIPIMOVEL      =     TI.CODTIPIMOVEL )'
      '  AND ( LI.MESCOMPETENCIA    = :MES )'
      '  AND ( LI.ANOCOMPETENCIA    = :ANO )'
      '  AND ( LI.IDDOCUMENTO       = DE.IDDOCUMENTO(+) )'
      
        '  AND ( (:PIDAMINIMOVEL IS NULL)     OR (C.IDADMINIMOVEL    = :P' +
        'IDAMINIMOVEL) )'
      
        '  AND ( (:PIDRESPONSAVEL IS NULL)    OR (C.IDRESPONSAVEL    = :P' +
        'IDRESPONSAVEL) )'
      
        '  AND ( (:PIDCONTRATO IS NULL)       OR (C.IDCONTRATOIMOVEL = :P' +
        'IDCONTRATO) )'
      
        '  AND ( (:PIDLOCATARIO IS NULL)      OR (C.IDLOCATARIO      = :P' +
        'IDLOCATARIO) )'
      
        '  AND ( ( (:PFILTRO IS NULL)     AND ((:PIDTIPORECEITA IS NULL) ' +
        'OR (LI.IDTIPOCUSTORECIMO <> :PIDTIPORECEITA)) ) OR'
      
        '        ( (:PFILTRO IS NOT NULL) AND ((:PIDTIPORECEITA IS NULL) ' +
        'OR (LI.IDTIPOCUSTORECIMO =  :PIDTIPORECEITA)) ) )'
      
        'GROUP BY T.IDTIPOCUSTORECIMO, T.DESCCUSTORECIMO, LI.CODTIPIMOVEL' +
        ', TI.DESCTIPOIMOVEL'
      'ORDER BY TI.DESCTIPOIMOVEL, LI.CODTIPIMOVEL, T.DESCCUSTORECIMO')
    ValidateWithMask = True
    Left = 576
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MES'
        ParamType = ptUnknown
        Value = '10'
      end
      item
        DataType = ftInteger
        Name = 'ANO'
        ParamType = ptUnknown
        Value = '2004'
      end
      item
        DataType = ftInteger
        Name = 'PIDAMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDAMINIMOVEL'
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
        Name = 'PIDCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFILTRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPORECEITA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPORECEITA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFILTRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPORECEITA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPORECEITA'
        ParamType = ptUnknown
      end>
    object qryResumoFolhaCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryResumoFolhaDESCTIPOIMOVEL: TStringField
      FieldName = 'DESCTIPOIMOVEL'
      Size = 60
    end
    object qryResumoFolhaTOT_CONTRATO: TFloatField
      FieldName = 'TOT_CONTRATO'
    end
    object qryResumoFolhaTOT_DESC: TFloatField
      FieldName = 'TOT_DESC'
    end
    object qryResumoFolhaTIPO_RECDES: TStringField
      FieldName = 'TIPO_RECDES'
      Size = 60
    end
    object qryResumoFolhaTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object dsResumoFolha: TwwDataSource
    DataSet = qryResumoFolha
    Left = 576
    Top = 284
  end
  object pplResumoFolha: TppBDEPipeline
    DataSource = dsResumoFolha
    UserName = 'lResumoFolha'
    Left = 576
    Top = 272
    object pplResumoFolhappField1: TppField
      FieldAlias = 'CODTIPIMOVEL'
      FieldName = 'CODTIPIMOVEL'
      FieldLength = 5
      DisplayWidth = 5
      Position = 0
    end
    object pplResumoFolhappField2: TppField
      FieldAlias = 'DESCTIPOIMOVEL'
      FieldName = 'DESCTIPOIMOVEL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplResumoFolhappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_CONTRATO'
      FieldName = 'TOT_CONTRATO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplResumoFolhappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_DESC'
      FieldName = 'TOT_DESC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplResumoFolhappField5: TppField
      FieldAlias = 'TIPO_RECDES'
      FieldName = 'TIPO_RECDES'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pplResumoFolhappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
  end
  object sqlGrupoSeg: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '        0 AS IDPATRO,'
      '        0 AS IDPLANOPREV,'
      '        0.00000 AS VALOR,'
      '        0.00000 AS PERCENT,'
      
        '        '#39'                                                       ' +
        '     '#39' AS PATROCINADORA,'
      
        '        '#39'                                                  '#39' AS ' +
        'PLANOPREV'
      'FROM'
      '        DUAL'
      'WHERE 1 = 2')
    ClientDataSet = cdsGrupoSeg
    Left = 820
    Top = 336
  end
  object cdsGrupoSeg: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 816
    Top = 384
    Data = {
      D90000009619E0BD010000001800000006000000000003000000D90007494450
      4154524F08000400000000000B4944504C414E4F505245560800040000000000
      0556414C4F5208000400000000000750455243454E5408000400000000000D50
      4154524F43494E41444F52410100490000000200075355425459504502004900
      0A0046697865644368617200055749445448020002003C0009504C414E4F5052
      455601004900000002000753554254595045020049000A004669786564436861
      72000557494454480200020032000100044C4349440400010009080000}
    object cdsGrupoSegIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object cdsGrupoSegIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object cdsGrupoSegVALOR: TFloatField
      FieldName = 'VALOR'
      currency = True
    end
    object cdsGrupoSegPERCENT: TFloatField
      FieldName = 'PERCENT'
    end
    object cdsGrupoSegPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      FixedChar = True
      Size = 60
    end
    object cdsGrupoSegPLANOPREV: TStringField
      FieldName = 'PLANOPREV'
      FixedChar = True
      Size = 50
    end
  end
  object dsGrupoSeg: TDataSource
    AutoEdit = False
    DataSet = cdsGrupoSeg
    Left = 888
    Top = 384
  end
  object pplGrupoSeg: TppBDEPipeline
    DataSource = dsGrupoSeg
    RefreshAfterPost = True
    UserName = 'lPerdas1'
    Left = 888
    Top = 336
    object pplGrupoSegppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplGrupoSegppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplGrupoSegppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplGrupoSegppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENT'
      FieldName = 'PERCENT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplGrupoSegppField5: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pplGrupoSegppField6: TppField
      FieldAlias = 'PLANOPREV'
      FieldName = 'PLANOPREV'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
  end
  object pplTotalImovel: TppBDEPipeline
    DataSource = dsTotalImovel
    RefreshAfterPost = True
    UserName = 'lTotalImovel'
    Left = 208
    Top = 440
    object pplTotalImovelppField1: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 68
      DisplayWidth = 68
      Position = 0
    end
    object pplTotalImovelppField2: TppField
      FieldAlias = 'PLANOPREV'
      FieldName = 'PLANOPREV'
      FieldLength = 62
      DisplayWidth = 62
      Position = 1
    end
    object pplTotalImovelppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTRATEIO'
      FieldName = 'PERCENTRATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplTotalImovelppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_APAGAR'
      FieldName = 'TOT_APAGAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplTotalImovelppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_PAGO'
      FieldName = 'TOT_PAGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplTotalImovelppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_ARECEBER'
      FieldName = 'TOT_ARECEBER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplTotalImovelppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_RECEBIDO'
      FieldName = 'TOT_RECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object dsTotalImovel: TDataSource
    AutoEdit = False
    DataSet = cdsTotalImovel
    Left = 208
    Top = 408
  end
  object cdsTotalImovel: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 480
    Data = {
      3C0100009619E0BD01000000180000000A0000000000030000003C010D504154
      524F43494E41444F524101004900000002000753554254595045020049000A00
      4669786564436861720005574944544802000200440009504C414E4F50524556
      01004900000002000753554254595045020049000A0046697865644368617200
      055749445448020002003E001050504950455243454E5452415445494F080004
      00000000000D50455243454E5452415445494F08000400000000000A544F545F
      415041474152080004000000000008544F545F5041474F08000400000000000C
      544F545F415245434542455208000400000000000C544F545F52454345424944
      4F08000400000000000B53414C444F5F504147415208000400000000000B5341
      4C444F5F524543454208000400000000000100044C4349440400010009080000}
    object cdsTotalImovelPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      FixedChar = True
      Size = 68
    end
    object cdsTotalImovelPLANOPREV: TStringField
      FieldName = 'PLANOPREV'
      FixedChar = True
      Size = 62
    end
    object cdsTotalImovelPERCENTRATEIO: TFloatField
      FieldName = 'PERCENTRATEIO'
    end
    object cdsTotalImovelTOT_APAGAR: TFloatField
      FieldName = 'TOT_APAGAR'
    end
    object cdsTotalImovelTOT_PAGO: TFloatField
      FieldName = 'TOT_PAGO'
    end
    object cdsTotalImovelTOT_ARECEBER: TFloatField
      FieldName = 'TOT_ARECEBER'
    end
    object cdsTotalImovelTOT_RECEBIDO: TFloatField
      FieldName = 'TOT_RECEBIDO'
    end
  end
  object sqlTotalImovel: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '               '#39'                                                ' +
        '                    '#39' AS PATROCINADORA,'
      
        '               '#39'                                                ' +
        '              '#39'AS PLANOPREV,'
      '               0.00000 AS PPIPERCENTRATEIO,'
      '               0.00000 AS PERCENTRATEIO,'
      '               0.00000 AS TOT_APAGAR,'
      '               0.00000 AS TOT_PAGO,'
      '               0.00000 AS TOT_ARECEBER,'
      '               0.00000 AS TOT_RECEBIDO,'
      '               0.00000 AS SALDO_PAGAR,'
      '               0.00000 AS SALDO_RECEB'
      '       FROM'
      '               DUAL'
      '       WHERE   1=2'
      ''
      ''
      ' '
      ' ')
    ClientDataSet = cdsSaldoGeral
    Left = 28
    Top = 408
  end
  object cdsTotalGeral: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 488
    Data = {
      3C0100009619E0BD01000000180000000A0000000000030000003C010D504154
      524F43494E41444F524101004900000002000753554254595045020049000A00
      4669786564436861720005574944544802000200440009504C414E4F50524556
      01004900000002000753554254595045020049000A0046697865644368617200
      055749445448020002003E001050504950455243454E5452415445494F080004
      00000000000D50455243454E5452415445494F08000400000000000A544F545F
      415041474152080004000000000008544F545F5041474F08000400000000000C
      544F545F415245434542455208000400000000000C544F545F52454345424944
      4F08000400000000000B53414C444F5F504147415208000400000000000B5341
      4C444F5F524543454208000400000000000100044C4349440400010009080000}
    object cdsTotalGeralPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      FixedChar = True
      Size = 68
    end
    object cdsTotalGeralPLANOPREV: TStringField
      FieldName = 'PLANOPREV'
      FixedChar = True
      Size = 62
    end
    object cdsTotalGeralPPIPERCENTRATEIO: TFloatField
      FieldName = 'PPIPERCENTRATEIO'
    end
    object cdsTotalGeralPERCENTRATEIO: TFloatField
      FieldName = 'PERCENTRATEIO'
    end
    object cdsTotalGeralTOT_APAGAR: TFloatField
      FieldName = 'TOT_APAGAR'
    end
    object cdsTotalGeralTOT_PAGO: TFloatField
      FieldName = 'TOT_PAGO'
    end
    object cdsTotalGeralTOT_ARECEBER: TFloatField
      FieldName = 'TOT_ARECEBER'
    end
    object cdsTotalGeralTOT_RECEBIDO: TFloatField
      FieldName = 'TOT_RECEBIDO'
    end
    object cdsTotalGeralSALDO_PAGAR: TFloatField
      FieldName = 'SALDO_PAGAR'
    end
    object cdsTotalGeralSALDO_RECEB: TFloatField
      FieldName = 'SALDO_RECEB'
    end
  end
  object dsTotalGeral: TDataSource
    AutoEdit = False
    DataSet = cdsTotalGeral
    Left = 120
    Top = 448
  end
  object pplTotalGeral: TppBDEPipeline
    DataSource = dsTotalGeral
    RefreshAfterPost = True
    UserName = 'lTotalImovel1'
    Left = 128
    Top = 408
    object pplTotalGeralppField1: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 68
      DisplayWidth = 68
      Position = 0
    end
    object pplTotalGeralppField2: TppField
      FieldAlias = 'PLANOPREV'
      FieldName = 'PLANOPREV'
      FieldLength = 62
      DisplayWidth = 62
      Position = 1
    end
    object pplTotalGeralppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PPIPERCENTRATEIO'
      FieldName = 'PPIPERCENTRATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplTotalGeralppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTRATEIO'
      FieldName = 'PERCENTRATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplTotalGeralppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_APAGAR'
      FieldName = 'TOT_APAGAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplTotalGeralppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_PAGO'
      FieldName = 'TOT_PAGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplTotalGeralppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_ARECEBER'
      FieldName = 'TOT_ARECEBER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplTotalGeralppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_RECEBIDO'
      FieldName = 'TOT_RECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplTotalGeralppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO_PAGAR'
      FieldName = 'SALDO_PAGAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplTotalGeralppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO_RECEB'
      FieldName = 'SALDO_RECEB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
  object pplSaldoImovel: TppBDEPipeline
    DataSource = dsSaldoImovel
    RefreshAfterPost = True
    UserName = 'lTotalImovel2'
    Left = 288
    Top = 440
    object pplSaldoImovelppField1: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 68
      DisplayWidth = 68
      Position = 0
    end
    object pplSaldoImovelppField2: TppField
      FieldAlias = 'PLANOPREV'
      FieldName = 'PLANOPREV'
      FieldLength = 62
      DisplayWidth = 62
      Position = 1
    end
    object pplSaldoImovelppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTRATEIO'
      FieldName = 'PERCENTRATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplSaldoImovelppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_APAGAR'
      FieldName = 'TOT_APAGAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplSaldoImovelppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_PAGO'
      FieldName = 'TOT_PAGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplSaldoImovelppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_ARECEBER'
      FieldName = 'TOT_ARECEBER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplSaldoImovelppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_RECEBIDO'
      FieldName = 'TOT_RECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object dsSaldoImovel: TDataSource
    AutoEdit = False
    DataSet = cdsSaldoImovel
    Left = 288
    Top = 408
  end
  object cdsSaldoImovel: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 480
    Data = {
      3C0100009619E0BD01000000180000000A0000000000030000003C010D504154
      524F43494E41444F524101004900000002000753554254595045020049000A00
      4669786564436861720005574944544802000200440009504C414E4F50524556
      01004900000002000753554254595045020049000A0046697865644368617200
      055749445448020002003E001050504950455243454E5452415445494F080004
      00000000000D50455243454E5452415445494F08000400000000000A544F545F
      415041474152080004000000000008544F545F5041474F08000400000000000C
      544F545F415245434542455208000400000000000C544F545F52454345424944
      4F08000400000000000B53414C444F5F504147415208000400000000000B5341
      4C444F5F524543454208000400000000000100044C4349440400010009080000}
    object cdsSaldoImovelPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      FixedChar = True
      Size = 68
    end
    object cdsSaldoImovelPLANOPREV: TStringField
      FieldName = 'PLANOPREV'
      FixedChar = True
      Size = 62
    end
    object cdsSaldoImovelPERCENTRATEIO: TFloatField
      FieldName = 'PERCENTRATEIO'
    end
    object cdsSaldoImovelTOT_APAGAR: TFloatField
      FieldName = 'TOT_APAGAR'
    end
    object cdsSaldoImovelTOT_PAGO: TFloatField
      FieldName = 'TOT_PAGO'
    end
    object cdsSaldoImovelTOT_ARECEBER: TFloatField
      FieldName = 'TOT_ARECEBER'
    end
    object cdsSaldoImovelTOT_RECEBIDO: TFloatField
      FieldName = 'TOT_RECEBIDO'
    end
  end
  object pplSaldoGeral: TppBDEPipeline
    DataSource = dsSaldoGeral
    RefreshAfterPost = True
    UserName = 'lTotalImovel3'
    Left = 376
    Top = 448
    object pplSaldoGeralppField1: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 68
      DisplayWidth = 68
      Position = 0
    end
    object pplSaldoGeralppField2: TppField
      FieldAlias = 'PLANOPREV'
      FieldName = 'PLANOPREV'
      FieldLength = 62
      DisplayWidth = 62
      Position = 1
    end
    object pplSaldoGeralppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PPIPERCENTRATEIO'
      FieldName = 'PPIPERCENTRATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplSaldoGeralppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTRATEIO'
      FieldName = 'PERCENTRATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplSaldoGeralppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_APAGAR'
      FieldName = 'TOT_APAGAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplSaldoGeralppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_PAGO'
      FieldName = 'TOT_PAGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplSaldoGeralppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_ARECEBER'
      FieldName = 'TOT_ARECEBER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplSaldoGeralppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_RECEBIDO'
      FieldName = 'TOT_RECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplSaldoGeralppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO_PAGAR'
      FieldName = 'SALDO_PAGAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplSaldoGeralppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO_RECEB'
      FieldName = 'SALDO_RECEB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
  object dsSaldoGeral: TDataSource
    AutoEdit = False
    DataSet = cdsSaldoGeral
    Left = 376
    Top = 408
  end
  object cdsSaldoGeral: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 480
    Data = {
      3C0100009619E0BD01000000180000000A0000000000030000003C010D504154
      524F43494E41444F524101004900000002000753554254595045020049000A00
      4669786564436861720005574944544802000200440009504C414E4F50524556
      01004900000002000753554254595045020049000A0046697865644368617200
      055749445448020002003E001050504950455243454E5452415445494F080004
      00000000000D50455243454E5452415445494F08000400000000000A544F545F
      415041474152080004000000000008544F545F5041474F08000400000000000C
      544F545F415245434542455208000400000000000C544F545F52454345424944
      4F08000400000000000B53414C444F5F504147415208000400000000000B5341
      4C444F5F524543454208000400000000000100044C4349440400010009080000}
    object cdsSaldoGeralPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      FixedChar = True
      Size = 68
    end
    object cdsSaldoGeralPLANOPREV: TStringField
      FieldName = 'PLANOPREV'
      FixedChar = True
      Size = 62
    end
    object cdsSaldoGeralPPIPERCENTRATEIO: TFloatField
      FieldName = 'PPIPERCENTRATEIO'
    end
    object cdsSaldoGeralPERCENTRATEIO: TFloatField
      FieldName = 'PERCENTRATEIO'
    end
    object cdsSaldoGeralTOT_APAGAR: TFloatField
      FieldName = 'TOT_APAGAR'
    end
    object cdsSaldoGeralTOT_PAGO: TFloatField
      FieldName = 'TOT_PAGO'
    end
    object cdsSaldoGeralTOT_ARECEBER: TFloatField
      FieldName = 'TOT_ARECEBER'
    end
    object cdsSaldoGeralTOT_RECEBIDO: TFloatField
      FieldName = 'TOT_RECEBIDO'
    end
    object cdsSaldoGeralSALDO_PAGAR: TFloatField
      FieldName = 'SALDO_PAGAR'
    end
    object cdsSaldoGeralSALDO_RECEB: TFloatField
      FieldName = 'SALDO_RECEB'
    end
  end
  object dsInadimplenciaImovel: TwwDataSource
    DataSet = qryInadimplenciaImovel
    Left = 872
    Top = 140
  end
  object pplInadimplenciaImovel: TppBDEPipeline
    DataSource = dsInadimplenciaImovel
    UserName = 'lInadimplenciaImovel'
    Left = 876
    Top = 160
    object pplInadimplenciaImovelppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplInadimplenciaImovelppField2: TppField
      FieldAlias = 'CODTIPIMOVEL'
      FieldName = 'CODTIPIMOVEL'
      FieldLength = 5
      DisplayWidth = 5
      Position = 1
    end
    object pplInadimplenciaImovelppField3: TppField
      FieldAlias = 'NOME_IMOVEL'
      FieldName = 'NOME_IMOVEL'
      FieldLength = 100
      DisplayWidth = 100
      Position = 2
    end
    object pplInadimplenciaImovelppField4: TppField
      FieldAlias = 'IMOMATRICULA'
      FieldName = 'IMOMATRICULA'
      FieldLength = 20
      DisplayWidth = 20
      Position = 3
    end
    object pplInadimplenciaImovelppField5: TppField
      FieldAlias = 'IMOCODIGO'
      FieldName = 'IMOCODIGO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object pplInadimplenciaImovelppField6: TppField
      FieldAlias = 'DESCTIPOIMOVEL'
      FieldName = 'DESCTIPOIMOVEL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object pplInadimplenciaImovelppField7: TppField
      FieldAlias = 'NOME_MESTRE'
      FieldName = 'NOME_MESTRE'
      FieldLength = 100
      DisplayWidth = 100
      Position = 6
    end
    object pplInadimplenciaImovelppField8: TppField
      FieldAlias = 'IMOVEL_COMPOSTO'
      FieldName = 'IMOVEL_COMPOSTO'
      FieldLength = 203
      DisplayWidth = 203
      Position = 7
    end
    object pplInadimplenciaImovelppField9: TppField
      FieldAlias = 'DESCR_SITCONTR'
      FieldName = 'DESCR_SITCONTR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object pplInadimplenciaImovelppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_RECEBER'
      FieldName = 'TOT_RECEBER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
  object rptInadimplenciaImovel: TppReport
    AutoStop = False
    DataPipeline = pplInadimplenciaImovel
    NoDataBehaviors = [ndBlankReport]
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13229
    PrinterSetup.mmMarginLeft = 6615
    PrinterSetup.mmMarginRight = 6615
    PrinterSetup.mmMarginTop = 13229
    PrinterSetup.mmPaperHeight = 297128
    PrinterSetup.mmPaperWidth = 210080
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 864
    Top = 224
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplInadimplenciaImovel'
    object ppHeaderBand24: TppHeaderBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 40217
      mmPrintPosition = 0
      object ppLabel240: TppLabel
        UserName = 'ppLabel240'
        AutoSize = False
        Caption = 'Inadimplência por Imóvel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8731
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel241: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel241'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1588
        mmWidth = 196850
        BandType = 0
      end
      object ppLine83: TppLine
        UserName = 'ppLine83'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 39688
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel245: TppLabel
        UserName = 'ppLabel245'
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 35454
        mmTop = 35983
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel247: TppLabel
        UserName = 'ppLabel247'
        Caption = 'Imóvel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 71173
        mmTop = 36248
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel248: TppLabel
        UserName = 'ppLabel248'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 35983
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel249: TppLabel
        UserName = 'ppLabel249'
        Caption = 'Mês de competência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 2646
        mmTop = 20108
        mmWidth = 30427
        BandType = 0
      end
      object ppLabel250: TppLabel
        UserName = 'ppLabel250'
        Caption = 'Valor Devido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 35983
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel252: TppLabel
        UserName = 'ppLabel252'
        Caption = 'Data Limite:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 127265
        mmTop = 20108
        mmWidth = 17992
        BandType = 0
      end
      object rptInadimplenciaImovellblMesCompetencia: TppLabel
        UserName = 'rptInadimplenciaImovellblMesCompetencia'
        Caption = 'rptInadimplenciaImovellblMesCompetencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33602
        mmTop = 20108
        mmWidth = 53975
        BandType = 0
      end
      object rptInadimplenciaImovellblDataLimite: TppLabel
        UserName = 'rptInadimplenciaImovellblDataLimite'
        Caption = 'rptInadimplenciaImovellblDataLimite'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 145521
        mmTop = 20108
        mmWidth = 43392
        BandType = 0
      end
      object ppLogoInadimplImovel: TppImage
        UserName = 'ppLogoInadimplImovel'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel167: TppLabel
        UserName = 'Label167'
        Caption = 'Última atualização:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 118269
        mmTop = 23813
        mmWidth = 27252
        BandType = 0
      end
      object rptInadimplenciaImovellblDataAtualiza1: TppLabel
        UserName = 'rptInadimplenciaImovellblDataAtualiza1'
        Caption = 'rptInadimplenciaImovellblDataAtualiza1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 145521
        mmTop = 23813
        mmWidth = 49742
        BandType = 0
      end
      object plbl3: TppLabel
        UserName = 'plbl3'
        Caption = 'Situação Contratual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 144992
        mmTop = 36248
        mmWidth = 30427
        BandType = 0
      end
    end
    object ppDetailBand24: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 18521
      mmPrintPosition = 0
      object rptInadimplenciaImovelShape1: TppShape
        OnPrint = rptFolhaAluguel_FundoBandaDetalhePrint
        UserName = 'rptInadimplenciaImovelShape1'
        Brush.Color = 13040076
        ParentHeight = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 18521
        mmLeft = 0
        mmTop = 0
        mmWidth = 197115
        BandType = 4
      end
      object ppLine84: TppLine
        OnPrint = rptCCContrato_SeparadorPrint
        UserName = 'ppLine84'
        ParentHeight = True
        ParentWidth = True
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 18521
        mmLeft = 0
        mmTop = 0
        mmWidth = 196850
        BandType = 4
      end
      object ppDBMemo32: TppDBMemo
        UserName = 'ppDBMemo32'
        CharWrap = True
        DataField = 'IMOVEL_COMPOSTO'
        DataPipeline = pplInadimplenciaImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplInadimplenciaImovel'
        mmHeight = 15875
        mmLeft = 71173
        mmTop = 794
        mmWidth = 71438
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText106: TppDBText
        UserName = 'ppDBText106'
        DataField = 'TOT_RECEBER'
        DataPipeline = pplInadimplenciaImovel
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplenciaImovel'
        mmHeight = 3704
        mmLeft = 177007
        mmTop = 794
        mmWidth = 19844
        BandType = 4
      end
      object rptInadimplenciaImovelDBText2: TppDBText
        UserName = 'rptInadimplenciaImovelDBText2'
        DataField = 'IMOMATRICULA'
        DataPipeline = pplInadimplenciaImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplInadimplenciaImovel'
        mmHeight = 3704
        mmLeft = 35454
        mmTop = 794
        mmWidth = 34925
        BandType = 4
      end
      object rptInadimplenciaImovelDBText1: TppDBText
        UserName = 'rptInadimplenciaImovelDBText1'
        DataField = 'IMOCODIGO'
        DataPipeline = pplInadimplenciaImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplInadimplenciaImovel'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 794
        mmWidth = 33338
        BandType = 4
      end
      object ppDBText92: TppDBText
        UserName = 'DBText92'
        DataField = 'DESCR_SITCONTR'
        DataPipeline = pplInadimplenciaImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplInadimplenciaImovel'
        mmHeight = 3704
        mmLeft = 144992
        mmTop = 794
        mmWidth = 30692
        BandType = 4
      end
      object LblInadimplencia: TppLabel
        UserName = 'LblInadimplencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 70908
        mmTop = 10319
        mmWidth = 57150
        BandType = 4
      end
    end
    object ppFooterBand24: TppFooterBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine85: TppLine
        UserName = 'ppLine85'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 196850
        BandType = 8
      end
      object ppLabel257: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel257'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc46: TppSystemVariable
        UserName = 'Calc46'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 76729
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc47: TppSystemVariable
        UserName = 'Calc47'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 3175
        mmWidth = 38100
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      AfterPrint = rptCCContrato_CabecalhoRelatBeforePrint
      BeforePrint = rptCCContrato_CabecalhoRelatBeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 36248
      mmPrintPosition = 0
      object ppShape14: TppShape
        UserName = 'ppShape14'
        Pen.Width = 2
        mmHeight = 6615
        mmLeft = 148432
        mmTop = 4763
        mmWidth = 48948
        BandType = 7
      end
      object ppLabel258: TppLabel
        UserName = 'ppLabel258'
        Caption = 'Total Devido:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 149754
        mmTop = 6085
        mmWidth = 20108
        BandType = 7
      end
      object ppDBCalc49: TppDBCalc
        UserName = 'ppDBCalc49'
        DataField = 'TOT_RECEBER'
        DataPipeline = pplInadimplenciaImovel
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplenciaImovel'
        mmHeight = 3704
        mmLeft = 169598
        mmTop = 6085
        mmWidth = 26194
        BandType = 7
      end
      object ppLine88: TppLine
        UserName = 'ppLine88'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 196850
        BandType = 7
      end
      object ppRegion11: TppRegion
        UserName = 'Region11'
        Stretch = True
        mmHeight = 19315
        mmLeft = 1588
        mmTop = 12965
        mmWidth = 137054
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppSubReport6: TppSubReport
          OnPrint = ppSubReport6Print
          UserName = 'SubReport2'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ParentWidth = False
          TraverseAllData = False
          DataPipelineName = 'pplTotal'
          mmHeight = 5027
          mmLeft = 3704
          mmTop = 25929
          mmWidth = 131234
          BandType = 7
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport6: TppChildReport
            AutoStop = False
            DataPipeline = pplTotal
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 13229
            PrinterSetup.mmMarginLeft = 6615
            PrinterSetup.mmMarginRight = 6615
            PrinterSetup.mmMarginTop = 13229
            PrinterSetup.mmPaperHeight = 297128
            PrinterSetup.mmPaperWidth = 210080
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Left = 344
            Top = 200
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplTotal'
            object ppHeaderBand10: TppHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppDetailBand19: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 4233
              mmPrintPosition = 0
              object ppDBText30: TppDBText
                UserName = 'DBText16'
                AutoSize = True
                DataField = 'VALOR'
                DataPipeline = pplTotal
                DisplayFormat = '###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplTotal'
                mmHeight = 3260
                mmLeft = 120915
                mmTop = 529
                mmWidth = 9610
                BandType = 4
              end
              object ppDBText127: TppDBText
                UserName = 'DBText15'
                DataField = 'PERCENTRATEIO'
                DataPipeline = pplTotal
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'pplTotal'
                mmHeight = 3175
                mmLeft = 91017
                mmTop = 529
                mmWidth = 19315
                BandType = 4
              end
              object ppDBText128: TppDBText
                UserName = 'DBText13'
                AutoSize = True
                DataField = 'PLANOPREV'
                DataPipeline = pplTotal
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'pplTotal'
                mmHeight = 3260
                mmLeft = 2646
                mmTop = 529
                mmWidth = 17357
                BandType = 4
              end
              object ppDBText129: TppDBText
                UserName = 'DBText14'
                AutoSize = True
                DataField = 'PATRO'
                DataPipeline = pplTotal
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'pplTotal'
                mmHeight = 3260
                mmLeft = 59267
                mmTop = 265
                mmWidth = 9779
                BandType = 4
              end
            end
            object ppFooterBand12: TppFooterBand
              mmBottomOffset = 0
              mmHeight = 1852
              mmPrintPosition = 0
            end
          end
        end
        object ppLine47: TppLine
          UserName = 'Line47'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 2911
          mmTop = 24606
          mmWidth = 134144
          BandType = 7
        end
        object ppLabel55: TppLabel
          UserName = 'Label1'
          Caption = 'Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 5292
          mmTop = 20108
          mmWidth = 7673
          BandType = 7
        end
        object ppLabel196: TppLabel
          UserName = 'Label196'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 61913
          mmTop = 20638
          mmWidth = 19050
          BandType = 7
        end
        object ppLabel197: TppLabel
          UserName = 'Label197'
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 102129
          mmTop = 20638
          mmWidth = 2910
          BandType = 7
        end
        object ppLabel229: TppLabel
          UserName = 'Label229'
          Caption = 'Valor (R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 119063
          mmTop = 20373
          mmWidth = 14023
          BandType = 7
        end
        object ppLabel230: TppLabel
          UserName = 'Label230'
          Caption = 'Resumo de Segregação - Por Valor Devido'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 3440
          mmTop = 14817
          mmWidth = 71173
          BandType = 7
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCTIPOIMOVEL'
      DataPipeline = pplInadimplenciaImovel
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplInadimplenciaImovel'
      object ppGrpSegmentoCab: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppDBText130: TppDBText
          UserName = 'DBText30'
          DataField = 'DESCTIPOIMOVEL'
          DataPipeline = pplInadimplenciaImovel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplInadimplenciaImovel'
          mmHeight = 4763
          mmLeft = 0
          mmTop = 794
          mmWidth = 151607
          BandType = 3
          GroupNo = 0
        end
        object ppLine17: TppLine
          UserName = 'Line17'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5821
          mmWidth = 196850
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGrpSegmentoRod: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 30692
        mmPrintPosition = 0
        object ppLabel232: TppLabel
          UserName = 'Label55'
          Caption = 'Total do Segmento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 140229
          mmTop = 1588
          mmWidth = 24871
          BandType = 5
          GroupNo = 0
        end
        object ppLine21: TppLine
          UserName = 'Line21'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 529
          mmWidth = 196850
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'TOT_RECEBER'
          DataPipeline = pplInadimplenciaImovel
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadimplenciaImovel'
          mmHeight = 3175
          mmLeft = 166952
          mmTop = 1588
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object ppRegion9: TppRegion
          UserName = 'Region9'
          Stretch = True
          mmHeight = 19050
          mmLeft = 1588
          mmTop = 7938
          mmWidth = 136525
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppSubReport7: TppSubReport
            OnPrint = ppSubReport7Print
            UserName = 'SubReport1'
            ExpandAll = False
            NewPrintJob = False
            OutlineSettings.CreateNode = True
            ParentWidth = False
            TraverseAllData = False
            DataPipelineName = 'pplInadimplencia'
            mmHeight = 5027
            mmLeft = 3704
            mmTop = 20108
            mmWidth = 131234
            BandType = 5
            GroupNo = 0
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            object ppChildReport7: TppChildReport
              AutoStop = False
              DataPipeline = pplInadimplencia
              PrinterSetup.BinName = 'Default'
              PrinterSetup.DocumentName = 'PpModeloReport1'
              PrinterSetup.PaperName = 'A4'
              PrinterSetup.PrinterName = 'Default'
              PrinterSetup.mmMarginBottom = 13229
              PrinterSetup.mmMarginLeft = 6615
              PrinterSetup.mmMarginRight = 6615
              PrinterSetup.mmMarginTop = 13229
              PrinterSetup.mmPaperHeight = 297128
              PrinterSetup.mmPaperWidth = 210080
              PrinterSetup.PaperSize = 9
              Template.SaveTo = stDatabase
              Units = utScreenPixels
              Left = 336
              Top = 200
              Version = '7.04'
              mmColumnWidth = 0
              DataPipelineName = 'pplInadimplencia'
              object ppHeaderBand9: TppHeaderBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppDetailBand20: TppDetailBand
                mmBottomOffset = 0
                mmHeight = 4233
                mmPrintPosition = 0
                object ppDBText131: TppDBText
                  UserName = 'DBText95'
                  AutoSize = True
                  DataField = 'PLANOPREV'
                  DataPipeline = pplInadimplencia
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ParentDataPipeline = False
                  Transparent = True
                  DataPipelineName = 'pplInadimplencia'
                  mmHeight = 3260
                  mmLeft = 2646
                  mmTop = 529
                  mmWidth = 17357
                  BandType = 4
                end
                object ppDBText132: TppDBText
                  UserName = 'DBText96'
                  AutoSize = True
                  DataField = 'PATRO'
                  DataPipeline = pplInadimplencia
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ParentDataPipeline = False
                  Transparent = True
                  DataPipelineName = 'pplInadimplencia'
                  mmHeight = 3260
                  mmLeft = 59267
                  mmTop = 529
                  mmWidth = 9779
                  BandType = 4
                end
                object ppDBText133: TppDBText
                  UserName = 'DBText97'
                  DataField = 'PERCENTRATEIO'
                  DataPipeline = pplInadimplencia
                  DisplayFormat = '#,##0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ParentDataPipeline = False
                  TextAlignment = taCentered
                  Transparent = True
                  DataPipelineName = 'pplInadimplencia'
                  mmHeight = 3175
                  mmLeft = 91017
                  mmTop = 529
                  mmWidth = 19315
                  BandType = 4
                end
                object ppDBText134: TppDBText
                  UserName = 'DBText98'
                  AutoSize = True
                  DataField = 'VALOR'
                  DataPipeline = pplInadimplencia
                  DisplayFormat = '###,##0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ParentDataPipeline = False
                  TextAlignment = taRightJustified
                  Transparent = True
                  DataPipelineName = 'pplInadimplencia'
                  mmHeight = 3260
                  mmLeft = 120830
                  mmTop = 529
                  mmWidth = 9610
                  BandType = 4
                end
              end
              object ppFooterBand11: TppFooterBand
                mmBottomOffset = 0
                mmHeight = 2381
                mmPrintPosition = 0
              end
            end
          end
          object ppLabel189: TppLabel
            UserName = 'Label189'
            Caption = 'Plano'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            mmHeight = 3440
            mmLeft = 5293
            mmTop = 15081
            mmWidth = 7673
            BandType = 5
            GroupNo = 0
          end
          object ppLabel191: TppLabel
            UserName = 'Label191'
            Caption = 'Patrocinadora'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            mmHeight = 3440
            mmLeft = 61913
            mmTop = 14817
            mmWidth = 19050
            BandType = 5
            GroupNo = 0
          end
          object ppLabel193: TppLabel
            UserName = 'Label193'
            Caption = '%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            mmHeight = 3440
            mmLeft = 102130
            mmTop = 15081
            mmWidth = 2910
            BandType = 5
            GroupNo = 0
          end
          object ppLabel194: TppLabel
            UserName = 'Label194'
            Caption = 'Valor (R$)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            mmHeight = 3440
            mmLeft = 119064
            mmTop = 15081
            mmWidth = 14023
            BandType = 5
            GroupNo = 0
          end
          object ppLine46: TppLine
            UserName = 'Line46'
            Weight = 0.75
            mmHeight = 794
            mmLeft = 2647
            mmTop = 18785
            mmWidth = 134144
            BandType = 5
            GroupNo = 0
          end
          object ppLabel195: TppLabel
            UserName = 'Label195'
            Caption = 'Resumo de Segregação - Por Segmento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            mmHeight = 4233
            mmLeft = 4763
            mmTop = 9790
            mmWidth = 66675
            BandType = 5
            GroupNo = 0
          end
        end
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object qryInadimplenciaImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   I.IDIMOVEL, I.CODTIPIMOVEL,'
      
        '   I.IMONOME AS NOME_IMOVEL, I.IMOMATRICULA, I.IMOCODIGO, T.DESC' +
        'TIPOIMOVEL,'
      '   IM.IMONOME AS NOME_MESTRE,'
      '   IM.IMONOME||'#39' - '#39'||I.IMONOME AS IMOVEL_COMPOSTO,'
      '   SC.DESCRICAO AS DESCR_SITCONTR,'
      '   (REC_DES.TOT_RECEBER - REC_DES.RECEBIDO) AS TOT_RECEBER'
      'FROM'
      '   IMOVEL I, IMOVEL IM, TIPOIMOVEL T,'
      '   SITCONTIMOB SC,'
      '   ('
      '   SELECT '
      '      LI.IDIMOVEL,'
      '      C.IDSITCONTIMOB,'
      '      SUM(  '
      
        '            DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39 +
        ', LD.VALOR, 0), 0) +'
      
        '            DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39 +
        ', DECODE(LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '          ) AS TOT_RECEBER,'
      ''
      
        '      SUM(DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', ' +
        'LD.VALOR, 0), 0)) AS RECEBIDO,'
      ''
      '      SUM( '
      
        '           DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', DECODE(D.RECPAG, '#39'P'#39',' +
        ' LD.VALOR, 0), 0) +'
      
        '           DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'P'#39',' +
        ' DECODE(LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '         ) AS TOT_PAGAR,'
      ''
      
        '      SUM(DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'P'#39', ' +
        'LD.VALOR, 0), 0)) AS PAGO'
      ''
      '   FROM'
      '      DOCUMENTO D, '
      '      LANCTODOCUM LD,'
      '      LANCAMENTOSIMOVEL LI, '
      '      IMOVEL I, '
      '      CONTRATOIMOVEL C'
      ''
      '   WHERE  ( LI.IDIMOVEL IS NOT NULL )'
      '      AND ( (D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL) )'
      '      AND ( LI.IDIMOVEL = I.IDIMOVEL )'
      '      AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )'
      '      AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      '      AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )'
      ''
      '   GROUP BY'
      '      LI.IDIMOVEL,'
      '      C.IDSITCONTIMOB'
      '   ) REC_DES'
      ''
      'WHERE 1=2 '
      '  AND REC_DES.IDSITCONTIMOB = REC_DES.IDSITCONTIMOB'
      '  AND ( (REC_DES.TOT_RECEBER - REC_DES.RECEBIDO) <> 0 )'
      '  AND ( I.IDIMOVEL = REC_DES.IDIMOVEL )'
      '  AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '  AND ( I.CODTIPIMOVEL = T.CODTIPIMOVEL )'
      ''
      'ORDER BY'
      '   T.DESCTIPOIMOVEL, IM.IMONOME, I.IMONOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 872
    Top = 124
    object qryInadimplenciaImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryInadimplenciaImovelCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryInadimplenciaImovelNOME_IMOVEL: TStringField
      FieldName = 'NOME_IMOVEL'
      Size = 100
    end
    object qryInadimplenciaImovelIMOMATRICULA: TStringField
      FieldName = 'IMOMATRICULA'
    end
    object qryInadimplenciaImovelIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object qryInadimplenciaImovelDESCTIPOIMOVEL: TStringField
      FieldName = 'DESCTIPOIMOVEL'
      Size = 60
    end
    object qryInadimplenciaImovelNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 100
    end
    object qryInadimplenciaImovelIMOVEL_COMPOSTO: TStringField
      FieldName = 'IMOVEL_COMPOSTO'
      Size = 203
    end
    object qryInadimplenciaImovelDESCR_SITCONTR: TStringField
      FieldName = 'DESCR_SITCONTR'
      Size = 60
    end
    object qryInadimplenciaImovelTOT_RECEBER: TFloatField
      FieldName = 'TOT_RECEBER'
    end
  end
  object pplInadimplencia: TppBDEPipeline
    DataSource = dsInadimplencia
    SkipWhenNoRecords = False
    UserName = 'lInadimplencia'
    Left = 744
    Top = 144
    object pplInadimplenciappField1: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 25
      DisplayWidth = 25
      Position = 0
    end
    object pplInadimplenciappField2: TppField
      FieldAlias = 'PLANOPREV'
      FieldName = 'PLANOPREV'
      FieldLength = 62
      DisplayWidth = 62
      Position = 1
    end
    object pplInadimplenciappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTRATEIO'
      FieldName = 'PERCENTRATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplInadimplenciappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplInadimplenciappField5: TppField
      FieldAlias = 'DESCTIPOIMOVEL'
      FieldName = 'DESCTIPOIMOVEL'
      FieldLength = 5
      DisplayWidth = 5
      Position = 4
    end
  end
  object pplTotal: TppBDEPipeline
    DataSource = dsTotal
    SkipWhenNoRecords = False
    UserName = 'lTotal'
    Left = 744
    Top = 208
    object pplTotalppField1: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 47
      DisplayWidth = 47
      Position = 0
    end
    object pplTotalppField2: TppField
      FieldAlias = 'PLANOPREV'
      FieldName = 'PLANOPREV'
      FieldLength = 70
      DisplayWidth = 70
      Position = 1
    end
    object pplTotalppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTRATEIO'
      FieldName = 'PERCENTRATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplTotalppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
  end
  object dsInadimplencia: TwwDataSource
    DataSet = cdsInadimplencia
    Left = 744
    Top = 164
  end
  object dsTotal: TDataSource
    DataSet = cdsTotal
    Left = 744
    Top = 264
  end
  object sqlTotal: TCMSqlParams
    SQL.Strings = (
      
        'SELECT '#39'                                               '#39'  AS PAT' +
        'RO,'
      
        '       '#39'                                                        ' +
        '              '#39' AS PLANOPREV,       '
      '       0.00  AS PERCENTRATEIO,'
      '       0.00  AS VALOR'
      '  FROM DUAL'
      ' WHERE 1 = 2 ')
    ClientDataSet = cdsTotal
    Left = 744
    Top = 224
  end
  object cdsTotal: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 744
    Top = 240
    Data = {
      B30000009619E0BD010000001800000004000000000003000000B30005504154
      524F01004900000002000753554254595045020049000A004669786564436861
      7200055749445448020002002F0009504C414E4F505245560100490000000200
      0753554254595045020049000A00466978656443686172000557494454480200
      020046000D50455243454E5452415445494F08000400000000000556414C4F52
      08000400000000000100044C4349440400010009080000}
    object cdsTotalPATRO: TStringField
      FieldName = 'PATRO'
      FixedChar = True
      Size = 47
    end
    object cdsTotalPLANOPREV: TStringField
      FieldName = 'PLANOPREV'
      FixedChar = True
      Size = 70
    end
    object cdsTotalPERCENTRATEIO: TFloatField
      FieldName = 'PERCENTRATEIO'
    end
    object cdsTotalVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object sqlInadimplencia: TCMSqlParams
    SQL.Strings = (
      'SELECT '#39'                         '#39' AS PATRO,'
      
        '       '#39'                                                        ' +
        '      '#39' AS PLANOPREV,    '
      '       0.00 AS PERCENTRATEIO,'
      '       0.00 AS VALOR,'
      '       '#39'     '#39' AS DESCTIPOIMOVEL'
      '  FROM DUAL'
      ' WHERE 1 = 2')
    ClientDataSet = cdsInadimplencia
    Left = 744
    Top = 128
  end
  object cdsInadimplencia: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'DESCTIPOIMOVEL'
    MasterFields = 'DESCTIPOIMOVEL'
    MasterSource = dsInadimplenciaImovel
    PacketRecords = 0
    Params = <>
    Left = 752
    Top = 80
    Data = {
      EE0000009619E0BD010000001800000005000000000003000000EE0005504154
      524F01004900000002000753554254595045020049000A004669786564436861
      720005574944544802000200190009504C414E4F505245560100490000000200
      0753554254595045020049000A00466978656443686172000557494454480200
      02003E000D50455243454E5452415445494F08000400000000000556414C4F52
      08000400000000000E444553435449504F494D4F56454C010049000000020007
      53554254595045020049000A0046697865644368617200055749445448020002
      0005000100044C4349440400010009080000}
    object cdsInadimplenciaPATRO: TStringField
      FieldName = 'PATRO'
      FixedChar = True
      Size = 25
    end
    object cdsInadimplenciaPLANOPREV: TStringField
      FieldName = 'PLANOPREV'
      FixedChar = True
      Size = 62
    end
    object cdsInadimplenciaPERCENTRATEIO: TFloatField
      FieldName = 'PERCENTRATEIO'
    end
    object cdsInadimplenciaVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object cdsInadimplenciaDESCTIPOIMOVEL: TStringField
      FieldName = 'DESCTIPOIMOVEL'
      FixedChar = True
      Size = 5
    end
  end
  object qryResAluguelSegreg: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CTI.IDCONTRATOIMOVEL,'
      '       PES.NOME AS PATRO,'
      '       PPC.NOME AS PLANOPREV,'
      
        '       SUM((PPI.PPIPERCENTRATEIO * 100) / PT.PPIPERCENTRATEIO) A' +
        'S PERCENTRATEIO,'
      '       0 AS VALOR'
      '  FROM PLANOPATROXIMOVEL PPI,'
      '       CONTRATOXIMOVEL CXI,'
      '       PESSOA PES,'
      '       PLANPREVCONTABIL PPC,'
      '       CONTRATOIMOVEL CTI,'
      '       (SELECT SUM(PPI.PPIPERCENTRATEIO) AS PPIPERCENTRATEIO'
      '          FROM PLANOPATROXIMOVEL PPI,'
      '               CONTRATOXIMOVEL   CXI,'
      '               CONTRATOIMOVEL    CTI'
      '         WHERE CTI.IDCONTRATOIMOVEL = 2731'
      '           AND CXI.IDCONTRATOIMOVEL = CTI.IDCONTRATOIMOVEL'
      '           AND PPI.IDIMOVEL = CXI.IDIMOVEL) PT'
      ' WHERE CTI.IDCONTRATOIMOVEL = 2731'
      '   AND CXI.IDCONTRATOIMOVEL = CTI.IDCONTRATOIMOVEL'
      '   AND PPI.IDIMOVEL = CXI.IDIMOVEL'
      '   AND PPI.IDPATRO = PES.IDPESSOA'
      '   AND PPI.IDPLANOPREV = PPC.IDPLANOPREV'
      
        ' GROUP BY  CTI.IDCONTRATOIMOVEL, PES.NOME, PPC.NOME,PT.PPIPERCEN' +
        'TRATEIO'
      ' ORDER BY PERCENTRATEIO DESC')
    UpdateObject = updResAluguelSegreg
    ValidateWithMask = True
    Left = 580
    Top = 343
  end
  object dsResAluguelSegreg: TwwDataSource
    DataSet = qryResAluguelSegreg
    Left = 580
    Top = 355
  end
  object pplResAluguelSegreg: TppBDEPipeline
    DataSource = dsResAluguelSegreg
    UserName = 'lResAluguelSegreg'
    Left = 660
    Top = 334
    object pplResAluguelSegregppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplResAluguelSegregppField2: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplResAluguelSegregppField3: TppField
      FieldAlias = 'PLANOPREV'
      FieldName = 'PLANOPREV'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object pplResAluguelSegregppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTRATEIO'
      FieldName = 'PERCENTRATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplResAluguelSegregppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
  end
  object updResAluguelSegreg: TUpdateSQL
    Left = 648
    Top = 408
  end
end
