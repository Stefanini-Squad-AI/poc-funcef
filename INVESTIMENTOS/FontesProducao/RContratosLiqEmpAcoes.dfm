inherited DmRContratosLiqEmpAcoes: TDmRContratosLiqEmpAcoes
  Left = 384
  Top = 146
  Width = 570
  Height = 424
  Caption = 'DmRContratosLiqEmpAcoes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 189
    Top = 24
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
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
    Left = 127
    Top = 24
  end
  inherited qryExemplo: TwwQuery
    Left = 66
    Top = 24
  end
  inherited rpExemplo: TppReport
    Left = 250
    Top = 24
    DataPipelineName = 'pplExemplo'
  end
  object pplRContratosLiqEmpAcoes: TppBDEPipeline
    DataSource = dsRContratosLiqEmpAcoes
    UserName = 'lRContratosLiqEmpAcoes'
    Left = 423
    Top = 106
    object pplRContratosLiqEmpAcoesppField1: TppField
      FieldAlias = 'NUMCONTRATOCUSTODIA'
      FieldName = 'NUMCONTRATOCUSTODIA'
      FieldLength = 20
      DisplayWidth = 15
      Position = 0
    end
    object pplRContratosLiqEmpAcoesppField2: TppField
      FieldAlias = 'DATAOPERACAO'
      FieldName = 'DATAOPERACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 10
      Position = 1
    end
    object pplRContratosLiqEmpAcoesppField3: TppField
      FieldAlias = 'DATAVENCOPER'
      FieldName = 'DATAVENCOPER'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 10
      Position = 2
    end
    object pplRContratosLiqEmpAcoesppField4: TppField
      FieldAlias = 'SIGLAACAOBOLSA'
      FieldName = 'SIGLAACAOBOLSA'
      FieldLength = 10
      DisplayWidth = 12
      Position = 3
    end
    object pplRContratosLiqEmpAcoesppField5: TppField
      FieldAlias = 'SGLCORRETVALORES'
      FieldName = 'SGLCORRETVALORES'
      FieldLength = 10
      DisplayWidth = 15
      Position = 4
    end
    object pplRContratosLiqEmpAcoesppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDHISTEMPACOES'
      FieldName = 'QTDHISTEMPACOES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 12
      Position = 5
    end
    object pplRContratosLiqEmpAcoesppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'PUOPERACAO'
      FieldName = 'PUOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 6
    end
    object pplRContratosLiqEmpAcoesppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 7
    end
    object pplRContratosLiqEmpAcoesppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'TAXAOPERACAO'
      FieldName = 'TAXAOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplRContratosLiqEmpAcoesppField10: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 60
      DisplayWidth = 25
      Position = 9
    end
    object pplRContratosLiqEmpAcoesppField11: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 113
      DisplayWidth = 30
      Position = 10
    end
    object pplRContratosLiqEmpAcoesppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'SLDJUROSIMPORTA'
      FieldName = 'SLDJUROSIMPORTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 12
      Position = 11
    end
    object pplRContratosLiqEmpAcoesppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'SLDJUROS'
      FieldName = 'SLDJUROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 12
      Position = 12
    end
    object pplRContratosLiqEmpAcoesppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRESGATE'
      FieldName = 'VLRRESGATE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplRContratosLiqEmpAcoesppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplRContratosLiqEmpAcoesppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINVESTIMENTO'
      FieldName = 'IDINVESTIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplRContratosLiqEmpAcoesppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOOPERACAO'
      FieldName = 'IDTIPOOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplRContratosLiqEmpAcoesppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCUSTODIANTE'
      FieldName = 'IDCUSTODIANTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplRContratosLiqEmpAcoesppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOINVEST'
      FieldName = 'IDTIPOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
  end
  object dsRContratosLiqEmpAcoes: TwwDataSource
    DataSet = qryRContratosLiqEmpAcoes
    Left = 273
    Top = 176
  end
  object qryRContratosLiqEmpAcoes: TwwQuery
    AfterScroll = qryRContratosLiqEmpAcoesAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT OE.DATAOPERACAO, OE.DATAVENCOPER, HE.NUMCONTRATOCUSTODIA,'
      
        '       AXB.SIGLAACAOBOLSA, CV.SGLCORRETVALORES, HE.QTDHISTEMPACO' +
        'ES, OE.PUOPERACAO, OE.TAXAOPERACAO,'
      
        '       OE.VLROPERACAO, HE.SLDJUROSIMPORTA, HE.SLDJUROS, PL.PLANP' +
        'RVCONTABPATRO,'
      '       CI.DESCCARTINVEST, OE.VLRRESGATE,'
      
        '       OE.IDCARTEIRAINVEST, OE.IDINVESTIMENTO, OE.IDTIPOOPERACAO' +
        ', OE.IDCUSTODIANTE, OE.IDTIPOINVEST'
      
        'FROM HISTEMPACOES HE, OPEREMPACOES OE, CORRETVALORES CV, ACOESXB' +
        'OLSA AXB,'
      '     VWPLANPREVCTBPATR PL, CARTEIRAINVEST CI'
      'WHERE'
      
        '      HE.DATAHISTEMPACOES    BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYY' +
        'Y'#39') AND TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      
        '  AND OE.DATAOPERACAO        BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYY' +
        'Y'#39') AND TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      ''
      '  AND (((:IDPLANPREVCTBPATR IS NOT NULL)                  AND'
      '     (HE.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))         OR'
      '       (:IDPLANPREVCTBPATR IS NULL) )'
      ''
      '  AND (((:IDINVESTIMENTO IS NOT NULL)                     AND'
      '     (HE.IDINVESTIMENTO = :IDINVESTIMENTO))               OR'
      '       (:IDINVESTIMENTO IS NULL) )'
      ''
      '  AND (((:NUMCONTRATOCUSTODIA IS NOT NULL)                AND'
      '     (HE.NUMCONTRATOCUSTODIA = :NUMCONTRATOCUSTODIA))     OR'
      '       (:NUMCONTRATOCUSTODIA IS NULL) )'
      ''
      '  AND HE.IDTIPOOPERACAO = -10052'
      ''
      '  AND OE.NUMCONTRATOCUSTODIA = HE.NUMCONTRATOCUSTODIA'
      '  AND OE.IDPLANPREVCTBPATR   = HE.IDPLANPREVCTBPATR'
      '  AND OE.IDCARTEIRAINVEST    = HE.IDCARTEIRAINVEST'
      '--  AND OE.IDINVESTIMENTO      = HE.IDINVESTIMENTO'
      '  AND OE.IDTIPOOPERACAO      = HE.IDTIPOOPERACAO'
      '  AND OE.IDCUSTODIANTE       = HE.IDCUSTODIANTE'
      '  AND OE.IDTIPOINVEST        = HE.IDTIPOINVEST'
      '  AND CV.IDCORRETVALORES     = OE.IDCORRETVALORES'
      '  AND AXB.IDACAO             = HE.IDINVESTIMENTO'
      '  AND PL.IDPLANPREVCTBPATR   = HE.IDPLANPREVCTBPATR'
      '  AND CI.IDCARTEIRAINVEST    = HE.IDCARTEIRAINVEST'
      'ORDER BY PL.PLANPRVCONTABPATRO, AXB.SIGLAACAOBOLSA'
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
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 74
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
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
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMCONTRATOCUSTODIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMCONTRATOCUSTODIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMCONTRATOCUSTODIA'
        ParamType = ptUnknown
      end>
    object qryRContratosLiqEmpAcoesNUMCONTRATOCUSTODIA: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 15
      FieldName = 'NUMCONTRATOCUSTODIA'
      FixedChar = True
    end
    object qryRContratosLiqEmpAcoesDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data ~Contratação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryRContratosLiqEmpAcoesDATAVENCOPER: TDateTimeField
      DisplayLabel = 'Data ~Vencto'
      DisplayWidth = 10
      FieldName = 'DATAVENCOPER'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryRContratosLiqEmpAcoesSIGLAACAOBOLSA: TStringField
      DisplayLabel = 'Papel'
      DisplayWidth = 12
      FieldName = 'SIGLAACAOBOLSA'
      Size = 10
    end
    object qryRContratosLiqEmpAcoesSGLCORRETVALORES: TStringField
      DisplayLabel = 'Corretora'
      DisplayWidth = 15
      FieldName = 'SGLCORRETVALORES'
      Size = 10
    end
    object qryRContratosLiqEmpAcoesQTDHISTEMPACOES: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 12
      FieldName = 'QTDHISTEMPACOES'
      DisplayFormat = '###,###,##0'
    end
    object qryRContratosLiqEmpAcoesPUOPERACAO: TFloatField
      DisplayLabel = 'PU'
      DisplayWidth = 15
      FieldName = 'PUOPERACAO'
      DisplayFormat = '#,##0.00000'
    end
    object qryRContratosLiqEmpAcoesVLROPERACAO: TFloatField
      DisplayLabel = 'Valor Operação'
      DisplayWidth = 15
      FieldName = 'VLROPERACAO'
      DisplayFormat = '#,##0.00'
    end
    object qryRContratosLiqEmpAcoesTAXAOPERACAO: TFloatField
      DisplayLabel = 'Taxa'
      DisplayWidth = 10
      FieldName = 'TAXAOPERACAO'
      DisplayFormat = '#,##0.00'
    end
    object qryRContratosLiqEmpAcoesDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 25
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryRContratosLiqEmpAcoesPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryRContratosLiqEmpAcoesSLDJUROSIMPORTA: TFloatField
      DisplayLabel = 'Juros (Importado)'
      DisplayWidth = 12
      FieldName = 'SLDJUROSIMPORTA'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryRContratosLiqEmpAcoesSLDJUROS: TFloatField
      DisplayLabel = 'Juros(Calculado)'
      DisplayWidth = 12
      FieldName = 'SLDJUROS'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryRContratosLiqEmpAcoesVLRRESGATE: TFloatField
      FieldName = 'VLRRESGATE'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryRContratosLiqEmpAcoesIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryRContratosLiqEmpAcoesIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryRContratosLiqEmpAcoesIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryRContratosLiqEmpAcoesIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object qryRContratosLiqEmpAcoesIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
  end
  object qryRContratosLiqEmpAcoesOutros: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       CASE'
      '         WHEN OE.TIPOMOVIMENTO = 2 THEN'
      '          '#39'Reversão Parcial'#39
      '         WHEN OE.TIPOMOVIMENTO = 3 THEN'
      '          '#39'Reversão Total'#39
      '       END AS TIPOMOVIMENTO,'
      
        '       HE.DATAHISTEMPACOES, OE.DATAVENCOPER, HE.DATAHISTEMPACOES' +
        ' AS DATAREVERSAO,'
      
        '       HE.NUMCONTRATOCUSTODIA, HE.IDTIPOOPERACAO, HE.SLDHISTEMPA' +
        'COES,'
      '       HE.QTDHISTEMPACOES, OE.PUOPERACAO, OE.VLROPERACAO,'
      
        '       HE.VLRJUROSIMPORTA, HE.VLRJUROS, HE.SLDJUROSIMPORTA, HE.S' +
        'LDJUROS, 0.00 AS RECEITA,'
      
        '       PL.PLANPRVCONTABPATRO, CI.DESCCARTINVEST, AXB.SIGLAACAOBO' +
        'LSA, HE.IDCARTEIRAINVEST, HE.IDINVESTIMENTO'
      
        '  FROM HISTEMPACOES      HE, OPEREMPACOES      OE, CORRETVALORES' +
        '     CV,'
      
        '       ACOESXBOLSA       AXB, VWPLANPREVCTBPATR PL, CARTEIRAINVE' +
        'ST    CI'
      ''
      
        '   WHERE ((('#39#39' IS NOT NULL) AND (HE.IDPLANPREVCTBPATR = '#39#39')) OR ' +
        '('#39#39' IS NULL))'
      ''
      
        '   AND ((('#39#39' IS NOT NULL) AND (HE.IDINVESTIMENTO = '#39#39')) OR ('#39#39' I' +
        'S NULL))'
      ''
      '   AND HE.NUMCONTRATOCUSTODIA IN'
      
        ' ---------------------------------------------------------------' +
        '-----'
      '       (SELECT HE.NUMCONTRATOCUSTODIA'
      '          FROM HISTEMPACOES HE, OPEREMPACOES OE'
      
        '         WHERE HE.DATAHISTEMPACOES BETWEEN TO_DATE(:DATAINI,'#39'DD/' +
        'MM/YYYY'#39') AND TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      
        '           AND OE.DATAOPERACAO     BETWEEN TO_DATE(:DATAINI,'#39'DD/' +
        'MM/YYYY'#39') AND TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      ''
      
        '           AND (((:IDPLANPREVCTBPATR IS NOT NULL) AND (HE.IDPLAN' +
        'PREVCTBPATR = :IDPLANPREVCTBPATR)) OR'
      '               (:IDPLANPREVCTBPATR IS NULL))'
      ''
      
        '           AND (((:IDINVESTIMENTO IS NOT NULL) AND (HE.IDINVESTI' +
        'MENTO = :IDINVESTIMENTO)) OR'
      '               (:IDINVESTIMENTO IS NULL))'
      ''
      
        '           AND (((:NUMCONTRATOCUSTODIA IS NOT NULL) AND (HE.NUMC' +
        'ONTRATOCUSTODIA = :NUMCONTRATOCUSTODIA)) OR'
      '               (:NUMCONTRATOCUSTODIA IS NULL) )'
      ''
      '           AND HE.IDTIPOOPERACAO = -10052'
      '           AND OE.NUMCONTRATOCUSTODIA = HE.NUMCONTRATOCUSTODIA'
      '           AND OE.IDPLANPREVCTBPATR   = HE.IDPLANPREVCTBPATR'
      '           AND OE.IDCARTEIRAINVEST    = HE.IDCARTEIRAINVEST'
      '           AND OE.IDINVESTIMENTO      = HE.IDINVESTIMENTO'
      '           AND OE.IDTIPOOPERACAO      = HE.IDTIPOOPERACAO'
      '           AND OE.IDCUSTODIANTE       = HE.IDCUSTODIANTE'
      '           AND OE.IDTIPOINVEST        = HE.IDTIPOINVEST       )'
      
        ' ---------------------------------------------------------------' +
        '-----'
      '   AND OE.IDTIPOOPERACAO = -10053'
      '   AND OE.NUMCONTRATOCUSTODIA = HE.NUMCONTRATOCUSTODIA'
      '   AND OE.IDPLANPREVCTBPATR   = HE.IDPLANPREVCTBPATR'
      '   AND OE.IDCARTEIRAINVEST    = HE.IDCARTEIRAINVEST'
      '   AND OE.IDINVESTIMENTO      = HE.IDINVESTIMENTO'
      '   AND OE.IDTIPOOPERACAO      = HE.IDTIPOOPERACAO'
      '   AND OE.IDCUSTODIANTE       = HE.IDCUSTODIANTE'
      '   AND OE.IDTIPOINVEST        = HE.IDTIPOINVEST'
      '   AND OE.DATAOPERACAO        = HE.DATAHISTEMPACOES'
      ''
      '   AND CV.IDCORRETVALORES = OE.IDCORRETVALORES'
      '   AND AXB.IDACAO = HE.IDINVESTIMENTO'
      '   AND PL.IDPLANPREVCTBPATR = HE.IDPLANPREVCTBPATR'
      '   AND CI.IDCARTEIRAINVEST = HE.IDCARTEIRAINVEST'
      
        '--==============================================================' +
        '==================--'
      '   UNION'
      
        '--==============================================================' +
        '==================--'
      '   SELECT '#39'Juros Diários'#39' AS TIPOMOVIMENTO,'
      
        '       HE.DATAHISTEMPACOES, NULL AS DATAVENCOPER, NULL AS DATARE' +
        'VERSAO,                                   '
      
        '       HE.NUMCONTRATOCUSTODIA, HE.IDTIPOOPERACAO,  HE.SLDHISTEMP' +
        'ACOES,'
      
        '       HE.QTDHISTEMPACOES, NULL AS PUOPERACAO, NULL AS VLROPERAC' +
        'AO,                     '
      
        '       HE.VLRJUROSIMPORTA, HE.VLRJUROS, HE.SLDJUROSIMPORTA, HE.S' +
        'LDJUROS, 0.00 AS RECEITA,'
      
        '       PL.PLANPRVCONTABPATRO, CI.DESCCARTINVEST, AXB.SIGLAACAOBO' +
        'LSA, HE.IDCARTEIRAINVEST, HE.IDINVESTIMENTO'
      '   FROM HISTEMPACOES HE, CORRETVALORES CV, ACOESXBOLSA AXB,'
      '     VWPLANPREVCTBPATR PL, CARTEIRAINVEST CI  '
      '   WHERE'
      '     ((('#39#39' IS NOT NULL)                  AND'
      '     (HE.IDPLANPREVCTBPATR = '#39#39'))         OR'
      '       ('#39#39' IS NULL) )'
      ''
      '   AND ((('#39#39' IS NOT NULL)                     AND'
      '     (HE.IDINVESTIMENTO = '#39#39'))               OR'
      '       ('#39#39' IS NULL) )'
      ''
      '   AND ((('#39#39'             IS NOT NULL)                AND'
      '     (HE.NUMCONTRATOCUSTODIA = '#39#39'            ))     OR'
      '       ('#39#39'             IS NULL) )'
      ''
      '   AND HE.IDTIPOOPERACAO = -54'
      ''
      '   AND CV.IDCORRETVALORES     = HE.IDCORRETVALORES'
      '   AND AXB.IDACAO             = HE.IDINVESTIMENTO'
      '   AND PL.IDPLANPREVCTBPATR   = HE.IDPLANPREVCTBPATR'
      '   AND CI.IDCARTEIRAINVEST    = HE.IDCARTEIRAINVEST'
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
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 82
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
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
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMCONTRATOCUSTODIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMCONTRATOCUSTODIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMCONTRATOCUSTODIA'
        ParamType = ptUnknown
      end>
    object qryRContratosLiqEmpAcoesOutrosDATAHISTEMPACOES: TDateTimeField
      FieldName = 'DATAHISTEMPACOES'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryRContratosLiqEmpAcoesOutrosDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryRContratosLiqEmpAcoesOutrosNUMCONTRATOCUSTODIA: TStringField
      FieldName = 'NUMCONTRATOCUSTODIA'
      FixedChar = True
    end
    object qryRContratosLiqEmpAcoesOutrosIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryRContratosLiqEmpAcoesOutrosQTDHISTEMPACOES: TFloatField
      FieldName = 'QTDHISTEMPACOES'
    end
    object qryRContratosLiqEmpAcoesOutrosPUOPERACAO: TFloatField
      FieldName = 'PUOPERACAO'
      DisplayFormat = '#,##0.00000'
    end
    object qryRContratosLiqEmpAcoesOutrosVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      DisplayFormat = '#,##0.00'
    end
    object qryRContratosLiqEmpAcoesOutrosSLDJUROSIMPORTA: TFloatField
      FieldName = 'SLDJUROSIMPORTA'
      DisplayFormat = '#,##0.00'
    end
    object qryRContratosLiqEmpAcoesOutrosPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryRContratosLiqEmpAcoesOutrosDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryRContratosLiqEmpAcoesOutrosVLRJUROSIMPORTA: TFloatField
      FieldName = 'VLRJUROSIMPORTA'
      DisplayFormat = '#,##0.00'
    end
    object qryRContratosLiqEmpAcoesOutrosTIPOMOVIMENTO: TStringField
      FieldName = 'TIPOMOVIMENTO'
      Size = 16
    end
    object qryRContratosLiqEmpAcoesOutrosSIGLAACAOBOLSA: TStringField
      FieldName = 'SIGLAACAOBOLSA'
      Size = 10
    end
    object qryRContratosLiqEmpAcoesOutrosDATAREVERSAO: TDateTimeField
      FieldName = 'DATAREVERSAO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryRContratosLiqEmpAcoesOutrosSLDHISTEMPACOES: TFloatField
      FieldName = 'SLDHISTEMPACOES'
      DisplayFormat = '#,##0.00'
    end
    object qryRContratosLiqEmpAcoesOutrosIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryRContratosLiqEmpAcoesOutrosIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryRContratosLiqEmpAcoesOutrosRECEITA: TFloatField
      FieldName = 'RECEITA'
    end
  end
  object pplRContratosLiqEmpAcoesOutros: TppBDEPipeline
    DataSource = dsRContratosLiqEmpAcoesOutros
    UserName = 'lRContratosLiqEmpAcoes1'
    Left = 435
    Top = 178
    object pplRContratosLiqEmpAcoesOutrosppField1: TppField
      FieldAlias = 'DATAHISTEMPACOES'
      FieldName = 'DATAHISTEMPACOES'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 0
      Position = 0
    end
    object pplRContratosLiqEmpAcoesOutrosppField2: TppField
      FieldAlias = 'DATAVENCOPER'
      FieldName = 'DATAVENCOPER'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object pplRContratosLiqEmpAcoesOutrosppField3: TppField
      FieldAlias = 'NUMCONTRATOCUSTODIA'
      FieldName = 'NUMCONTRATOCUSTODIA'
      FieldLength = 20
      DisplayWidth = 20
      Position = 2
    end
    object pplRContratosLiqEmpAcoesOutrosppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOOPERACAO'
      FieldName = 'IDTIPOOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplRContratosLiqEmpAcoesOutrosppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDHISTEMPACOES'
      FieldName = 'QTDHISTEMPACOES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplRContratosLiqEmpAcoesOutrosppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PUOPERACAO'
      FieldName = 'PUOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplRContratosLiqEmpAcoesOutrosppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplRContratosLiqEmpAcoesOutrosppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'SLDJUROSIMPORTA'
      FieldName = 'SLDJUROSIMPORTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplRContratosLiqEmpAcoesOutrosppField9: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 113
      DisplayWidth = 113
      Position = 8
    end
    object pplRContratosLiqEmpAcoesOutrosppField10: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 9
    end
    object pplRContratosLiqEmpAcoesOutrosppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRJUROSIMPORTA'
      FieldName = 'VLRJUROSIMPORTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplRContratosLiqEmpAcoesOutrosppField12: TppField
      FieldAlias = 'TIPOMOVIMENTO'
      FieldName = 'TIPOMOVIMENTO'
      FieldLength = 16
      DisplayWidth = 16
      Position = 11
    end
    object pplRContratosLiqEmpAcoesOutrosppField13: TppField
      FieldAlias = 'SIGLAACAOBOLSA'
      FieldName = 'SIGLAACAOBOLSA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object pplRContratosLiqEmpAcoesOutrosppField14: TppField
      FieldAlias = 'DATAREVERSAO'
      FieldName = 'DATAREVERSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 13
    end
    object pplRContratosLiqEmpAcoesOutrosppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'SLDHISTEMPACOES'
      FieldName = 'SLDHISTEMPACOES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplRContratosLiqEmpAcoesOutrosppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplRContratosLiqEmpAcoesOutrosppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINVESTIMENTO'
      FieldName = 'IDINVESTIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplRContratosLiqEmpAcoesOutrosppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'RECEITA'
      FieldName = 'RECEITA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
  end
  object dsRContratosLiqEmpAcoesOutros: TwwDataSource
    DataSet = qryRContratosLiqEmpAcoesOutros
    Left = 277
    Top = 248
  end
  object rpRContratosLiqEmpAcoes: TppReport
    AutoStop = False
    DataPipeline = pplRContratosLiqEmpAcoes
    NoDataBehaviors = [ndBlankReport]
    OnStartPage = rpRContratosLiqEmpAcoesxStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Contratos Liquidados'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 74
    Top = 102
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplRContratosLiqEmpAcoes'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27940
      mmPrintPosition = 0
      object lblPosicao: TppLabel
        UserName = 'Label11'
        Caption = 'Contratos Liquidados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 36407
        BandType = 0
      end
      object ppLabel12: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppDBImage2: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmOperComum.pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText1'
        DataField = 'DESCCARTINVEST'
        DataPipeline = pplRContratosLiqEmpAcoes
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRContratosLiqEmpAcoes'
        mmHeight = 3683
        mmLeft = 165629
        mmTop = 14023
        mmWidth = 116946
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'LPeriodo4'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 11853
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 6085
        mmLeft = 0
        mmTop = 21696
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label1'
        Caption = 'Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2910
        mmTop = 23019
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label2'
        Caption = 'Data contratação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 29633
        mmTop = 23019
        mmWidth = 23019
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label3'
        Caption = 'Data Vencto.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 60590
        mmTop = 23019
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label4'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 151342
        mmTop = 23019
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label5'
        Caption = 'PU'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 187590
        mmTop = 23019
        mmWidth = 3969
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label6'
        Caption = 'Valor Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 203994
        mmTop = 23019
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label7'
        Caption = 'Taxa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 243417
        mmTop = 23019
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label10'
        Caption = 'Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 84667
        mmTop = 23019
        mmWidth = 17484
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label12'
        Caption = 'Corretora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 119063
        mmTop = 23019
        mmWidth = 12965
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 10922
      mmPrintPosition = 0
      object ppShape2: TppShape
        OnPrint = shpRenFixSaldoDetPaiPrint
        UserName = 'shpRenFixSaldoDetPai'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText3'
        DataField = 'NUMCONTRATOCUSTODIA'
        DataPipeline = pplRContratosLiqEmpAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplRContratosLiqEmpAcoes'
        mmHeight = 3259
        mmLeft = 2910
        mmTop = 529
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'DATAOPERACAO'
        DataPipeline = pplRContratosLiqEmpAcoes
        DisplayFormat = 'DD/MM/YYYY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplRContratosLiqEmpAcoes'
        mmHeight = 3387
        mmLeft = 30956
        mmTop = 529
        mmWidth = 23199
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'DATAVENCOPER'
        DataPipeline = pplRContratosLiqEmpAcoes
        DisplayFormat = 'DD/MM/YYYY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplRContratosLiqEmpAcoes'
        mmHeight = 3387
        mmLeft = 60590
        mmTop = 529
        mmWidth = 22818
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText6'
        DataField = 'SIGLAACAOBOLSA'
        DataPipeline = pplRContratosLiqEmpAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplRContratosLiqEmpAcoes'
        mmHeight = 3175
        mmLeft = 84667
        mmTop = 529
        mmWidth = 29104
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText7'
        DataField = 'PUOPERACAO'
        DataPipeline = pplRContratosLiqEmpAcoes
        DisplayFormat = '#,##0.00000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRContratosLiqEmpAcoes'
        mmHeight = 3175
        mmLeft = 175155
        mmTop = 529
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText8'
        DataField = 'VLROPERACAO'
        DataPipeline = pplRContratosLiqEmpAcoes
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRContratosLiqEmpAcoes'
        mmHeight = 3175
        mmLeft = 204523
        mmTop = 529
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText9'
        DataField = 'TAXAOPERACAO'
        DataPipeline = pplRContratosLiqEmpAcoes
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRContratosLiqEmpAcoes'
        mmHeight = 3175
        mmLeft = 234686
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText12'
        DataField = 'SGLCORRETVALORES'
        DataPipeline = pplRContratosLiqEmpAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplRContratosLiqEmpAcoes'
        mmHeight = 3175
        mmLeft = 119063
        mmTop = 529
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText13'
        DataField = 'QTDHISTEMPACOES'
        DataPipeline = pplRContratosLiqEmpAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRContratosLiqEmpAcoes'
        mmHeight = 3175
        mmLeft = 146050
        mmTop = 529
        mmWidth = 20902
        BandType = 4
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport2'
        DrillDownComponent = ppDBText15
        ExpandAll = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplRContratosLiqEmpAcoesOutros'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 6085
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplRContratosLiqEmpAcoesOutros
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Contratos Liquidados'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 232
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplRContratosLiqEmpAcoesOutros'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 5842
            mmPrintPosition = 0
            object ppShape6: TppShape
              UserName = 'Shape6'
              Brush.Color = clSilver
              mmHeight = 5027
              mmLeft = 37306
              mmTop = 265
              mmWidth = 246857
              BandType = 1
            end
            object ppLabel2: TppLabel
              UserName = 'Label1'
              Caption = 'Tipo Operação'
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 40217
              mmTop = 1058
              mmWidth = 19844
              BandType = 1
            end
            object ppLabel3: TppLabel
              UserName = 'Label2'
              Caption = 'Data Operação'
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 101071
              mmTop = 1058
              mmWidth = 19844
              BandType = 1
            end
            object ppLabel4: TppLabel
              UserName = 'Label201'
              Caption = 'Data Reversão'
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 137848
              mmTop = 1058
              mmWidth = 19579
              BandType = 1
            end
            object ppLabel5: TppLabel
              UserName = 'Label3'
              Caption = 'Valor Juros'
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 175419
              mmTop = 1058
              mmWidth = 17198
              BandType = 1
            end
            object ppLabel6: TppLabel
              UserName = 'Label4'
              Caption = 'Saldo'
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 246328
              mmTop = 1058
              mmWidth = 8996
              BandType = 1
            end
            object ppLabel7: TppLabel
              UserName = 'Label5'
              Caption = 'Receita Bruta'
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 204788
              mmTop = 1058
              mmWidth = 18256
              BandType = 1
            end
          end
          object ppDetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4572
            mmPrintPosition = 0
            object ppShape4: TppShape
              OnPrint = ppShape4Print
              UserName = 'shpDetalhe1'
              Pen.Style = psClear
              ShiftWithParent = True
              mmHeight = 4318
              mmLeft = 38100
              mmTop = 0
              mmWidth = 246063
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'dbVendasQtd2'
              BlankWhenZero = True
              DataField = 'VLRJUROSIMPORTA'
              DataPipeline = pplRContratosLiqEmpAcoesOutros
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplRContratosLiqEmpAcoesOutros'
              mmHeight = 3175
              mmLeft = 168805
              mmTop = 529
              mmWidth = 22754
              BandType = 4
            end
            object ppDBText29: TppDBText
              UserName = 'ppdbDescInvest3'
              DataField = 'TIPOMOVIMENTO'
              DataPipeline = pplRContratosLiqEmpAcoesOutros
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'pplRContratosLiqEmpAcoesOutros'
              mmHeight = 3440
              mmLeft = 39688
              mmTop = 529
              mmWidth = 51329
              BandType = 4
            end
            object ppDBText31: TppDBText
              UserName = 'DBText3'
              DataField = 'DATAHISTEMPACOES'
              DataPipeline = pplRContratosLiqEmpAcoesOutros
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplRContratosLiqEmpAcoesOutros'
              mmHeight = 3175
              mmLeft = 102394
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText32: TppDBText
              UserName = 'DBText10'
              DataField = 'DATAREVERSAO'
              DataPipeline = pplRContratosLiqEmpAcoesOutros
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplRContratosLiqEmpAcoesOutros'
              mmHeight = 3175
              mmLeft = 139171
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText2: TppDBText
              UserName = 'DBText1'
              BlankWhenZero = True
              DataField = 'RECEITA'
              DataPipeline = pplRContratosLiqEmpAcoesOutros
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplRContratosLiqEmpAcoesOutros'
              mmHeight = 3175
              mmLeft = 200290
              mmTop = 529
              mmWidth = 22754
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object ppLine2: TppLine
              UserName = 'Line1'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 0
              mmTop = 4763
              mmWidth = 284300
              BandType = 7
            end
            object ppDBCalc1: TppDBCalc
              UserName = 'DBCalc1'
              DataField = 'VLRJUROSIMPORTA'
              DataPipeline = pplRContratosLiqEmpAcoesOutros
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplRContratosLiqEmpAcoesOutros'
              mmHeight = 3387
              mmLeft = 168806
              mmTop = 794
              mmWidth = 22753
              BandType = 7
            end
            object ppDBCalc2: TppDBCalc
              UserName = 'DBCalc2'
              DataField = 'RECEITA'
              DataPipeline = pplRContratosLiqEmpAcoesOutros
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplRContratosLiqEmpAcoesOutros'
              mmHeight = 3387
              mmLeft = 200290
              mmTop = 794
              mmWidth = 22753
              BandType = 7
            end
            object ppDBCalc3: TppDBCalc
              UserName = 'DBCalc3'
              DataField = 'SLDJUROSIMPORTA'
              DataPipeline = pplRContratosLiqEmpAcoesOutros
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplRContratosLiqEmpAcoesOutros'
              mmHeight = 3387
              mmLeft = 231775
              mmTop = 794
              mmWidth = 22753
              BandType = 7
            end
            object ppLabel8: TppLabel
              UserName = 'Label6'
              Caption = 'Saldos Totais do Contrato......'
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 120650
              mmTop = 794
              mmWidth = 39878
              BandType = 7
            end
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel32: TppLabel
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
      object ppSystemVariable4: TppSystemVariable
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
        mmLeft = 258498
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
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
        mmLeft = 0
        mmTop = 3175
        mmWidth = 284428
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = pplRContratosLiqEmpAcoes
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRContratosLiqEmpAcoes'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppShape5: TppShape
          UserName = 'shpRenFixSaldoDetPai1'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 0
          mmTop = 264
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'DBText2'
          DataField = 'PLANPRVCONTABPATRO'
          DataPipeline = pplRContratosLiqEmpAcoes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplRContratosLiqEmpAcoes'
          mmHeight = 3387
          mmLeft = 35719
          mmTop = 794
          mmWidth = 88371
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label101'
          Caption = 'Plano / Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 2117
          mmTop = 794
          mmWidth = 30184
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList1: TppParameterList
    end
  end
end
