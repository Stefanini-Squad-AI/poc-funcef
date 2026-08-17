inherited dtmInformeFacultativo: TdtmInformeFacultativo
  Left = 289
  Top = 246
  Width = 349
  Height = 306
  Caption = 'dtmInformeFacultativo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    object pplExemploppField1: TppField
      FieldAlias = 'NOME_PART'
      FieldName = 'NOME_PART'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplExemploppField2: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object pplExemploppField3: TppField
      FieldAlias = 'CPF'
      FieldName = 'CPF'
      FieldLength = 18
      DisplayWidth = 18
      Position = 2
    end
    object pplExemploppField4: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplExemploppField5: TppField
      FieldAlias = 'CGC'
      FieldName = 'CGC'
      FieldLength = 18
      DisplayWidth = 18
      Position = 4
    end
    object pplExemploppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONTREMPR'
      FieldName = 'CONTREMPR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplExemploppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONTRPATRO'
      FieldName = 'CONTRPATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplExemploppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'CORRECAO'
      FieldName = 'CORRECAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplExemploppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'JUROS'
      FieldName = 'JUROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplExemploppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'MULTA'
      FieldName = 'MULTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplExemploppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'OUTROS'
      FieldName = 'OUTROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplExemploppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
  end
  inherited qryExemplo: TwwQuery
    SQL.Strings = (
      'SELECT'
      '    PES.NOME AS NOME_PART,'
      '    DEP.MATRICULA,'
      '    CPF.NUMDOCUMENTO AS CPF,'
      '    PAT.NOME AS PATRO,'
      '    CGC.NUMDOCUMENTO AS CGC,'
      '    0 AS CONTREMPR,'
      '    0 AS CONTRPATRO,'
      '    0 AS CORRECAO,'
      '    0 AS JUROS,'
      '    0 AS MULTA,'
      '    0 AS OUTROS,'
      '    0 AS TOTALrecebido'
      'FROM'
      '    PESSOA PES,'
      '    PESSOA PAT,'
      '    DOCPESSOA CPF,'
      '    DOCPESSOA CGC,'
      '    DEPENTIT DEP'
      'WHERE'
      '    DEP.IDPESSOA    = 25722'
      'AND PAT.IDPESSOA    = 1'
      'AND CPF.IDDOCUMENTO = 2'
      'AND CGC.IDDOCUMENTO = 1'
      'AND PES.IDPESSOA    = DEP.IDPESSOA'
      'AND PES.IDPESSOA    = CPF.IDPESSOA(+)'
      'AND CGC.IDPESSOA    = PAT.IDPESSOA'
      ' '
      ' ')
  end
  inherited rpExemplo: TppReport
    Left = 226
    DataPipelineName = 'pplExemplo'
  end
  object sqlInformeFacultativo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '    '#39'                                                  '#39' AS NOME' +
        '_PART,'
      '    '#39'          '#39'  AS MATRICULA,'
      '    '#39'           '#39' AS CPF,'
      
        '    '#39'                                                  '#39' AS PATR' +
        'O,'
      '    '#39'              '#39' AS CGC,'
      '    0 AS CONTREMPR,'
      '    0 AS CONTRPATRO,'
      '    0 AS CORRECAO,'
      '    0 AS JUROS,'
      '    0 AS MULTA,'
      '    0 AS OUTROS,'
      '    0 AS TOTAL,'
      '    0 AS TOTALRECEBIDO,'
      '    0 AS VALORRECEBIDO,'
      '    0 AS ATRASOANT,'
      '    0 AS DEVOLANT,'
      '    0 AS TOTALANT'
      'FROM'
      '    DUAL'
      'WHERE'
      '   1 = 2'
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
    ClientDataSet = cdsInformeFacultativo
    Left = 48
    Top = 96
  end
  object cdsInformeFacultativo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 152
  end
  object dsInformeFacultativo: TwwDataSource
    DataSet = cdsInformeFacultativo
    Left = 55
    Top = 208
  end
  object ppInformeFacultativo: TppBDEPipeline
    DataSource = dsInformeFacultativo
    UserName = 'lExemplo1'
    Left = 173
    Top = 104
  end
  object rptInformeFacultativo: TppReport
    AutoStop = False
    DataPipeline = ppInformeFacultativo
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
    Left = 178
    Top = 160
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppInformeFacultativo'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37306
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Demonstrativo Anual para Imposto de Renda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 45244
        mmTop = 9525
        mmWidth = 90488
        BandType = 0
      end
      object ppLabel2: TppLabel
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
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Contribuição Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4995
        mmLeft = 62733
        mmTop = 16933
        mmWidth = 56303
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Exercício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 3704
        mmTop = 26194
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Ano-Base'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42598
        mmTop = 26194
        mmWidth = 12435
        BandType = 0
      end
      object lblExercicio: TppLabel
        UserName = 'Label5'
        Caption = '2005'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 3704
        mmTop = 30427
        mmWidth = 9525
        BandType = 0
      end
      object lblAnoBase: TppLabel
        UserName = 'lblAnoBase'
        Caption = '2004'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 42598
        mmTop = 30427
        mmWidth = 9525
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 529
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel3: TppLabel
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
    object ppGroup1: TppGroup
      BreakName = 'NOME_PART'
      DataPipeline = ppInformeFacultativo
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppInformeFacultativo'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 107686
        mmPrintPosition = 0
        object ppShape4: TppShape
          UserName = 'Shape4'
          Shape = stRoundRect
          mmHeight = 47096
          mmLeft = 0
          mmTop = 35719
          mmWidth = 197115
          BandType = 3
          GroupNo = 0
        end
        object ppShape7: TppShape
          UserName = 'Shape7'
          Brush.Color = 14671839
          Pen.Style = psClear
          mmHeight = 4233
          mmLeft = 265
          mmTop = 73025
          mmWidth = 196586
          BandType = 3
          GroupNo = 0
        end
        object ppShape6: TppShape
          UserName = 'Shape6'
          Brush.Color = 14671839
          Pen.Style = psClear
          mmHeight = 4233
          mmLeft = 265
          mmTop = 64823
          mmWidth = 196586
          BandType = 3
          GroupNo = 0
        end
        object ppShape2: TppShape
          UserName = 'Shape2'
          Shape = stRoundRect
          mmHeight = 34131
          mmLeft = 265
          mmTop = 529
          mmWidth = 197115
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label1'
          Caption = '1 - DADOS DA EMPRESA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 2117
          mmTop = 3175
          mmWidth = 50536
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = '2 - DISCRIMINAÇÃO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 2117
          mmTop = 38629
          mmWidth = 40481
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label2'
          Caption = 'CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 6350
          mmTop = 10848
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Razão Social'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 52388
          mmTop = 10848
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label3'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 6350
          mmTop = 23813
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 109273
          mmTop = 23813
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'CPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 148432
          mmTop = 23813
          mmWidth = 5556
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'CGC'
          DataPipeline = ppInformeFacultativo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppInformeFacultativo'
          mmHeight = 3175
          mmLeft = 6350
          mmTop = 15346
          mmWidth = 38100
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'PATRO'
          DataPipeline = ppInformeFacultativo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppInformeFacultativo'
          mmHeight = 3969
          mmLeft = 52388
          mmTop = 15346
          mmWidth = 121973
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'NOME_PART'
          DataPipeline = ppInformeFacultativo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppInformeFacultativo'
          mmHeight = 3969
          mmLeft = 6350
          mmTop = 28046
          mmWidth = 95779
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'MATRICULA'
          DataPipeline = ppInformeFacultativo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppInformeFacultativo'
          mmHeight = 3969
          mmLeft = 109009
          mmTop = 28046
          mmWidth = 33338
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'CPF'
          DataPipeline = ppInformeFacultativo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppInformeFacultativo'
          mmHeight = 3969
          mmLeft = 147902
          mmTop = 28046
          mmWidth = 33338
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'DEDUÇÕES TRIBUTÁVEIS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 11377
          mmTop = 45773
          mmWidth = 43656
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'VALOR EM R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 146315
          mmTop = 45773
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          Caption = 'Contribuições Recebidas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 16933
          mmTop = 52388
          mmWidth = 42206
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText101'
          DataField = 'VALORRECEBIDO'
          DataPipeline = ppInformeFacultativo
          DisplayFormat = '##,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppInformeFacultativo'
          mmHeight = 4233
          mmLeft = 137054
          mmTop = 52388
          mmWidth = 33338
          BandType = 3
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = 'Devoluções Participante Anos Anteriores.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3260
          mmLeft = 11113
          mmTop = 65352
          mmWidth = 52366
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'Label202'
          Caption = 'Devoluções Patronal Anos Anteriores.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3260
          mmLeft = 11113
          mmTop = 69321
          mmWidth = 47921
          BandType = 3
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'Label25'
          Caption = 'Total Ano Anteriores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 11113
          mmTop = 73290
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'ATRASOANT'
          DataPipeline = ppInformeFacultativo
          DisplayFormat = '##,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppInformeFacultativo'
          mmHeight = 3175
          mmLeft = 137054
          mmTop = 65352
          mmWidth = 33338
          BandType = 3
          GroupNo = 0
        end
        object ppDBText14: TppDBText
          UserName = 'DBText103'
          DataField = 'DEVOLANT'
          DataPipeline = ppInformeFacultativo
          DisplayFormat = '##,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppInformeFacultativo'
          mmHeight = 3175
          mmLeft = 137054
          mmTop = 69321
          mmWidth = 33338
          BandType = 3
          GroupNo = 0
        end
        object ppDBText15: TppDBText
          UserName = 'DBText15'
          DataField = 'TOTALANT'
          DataPipeline = ppInformeFacultativo
          DisplayFormat = '##,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppInformeFacultativo'
          mmHeight = 3175
          mmLeft = 137054
          mmTop = 73290
          mmWidth = 33338
          BandType = 3
          GroupNo = 0
        end
        object ppLabel26: TppLabel
          UserName = 'Label7'
          Caption = 'INFORMATIVO - NÃO TRIBUTÁVEL NO ANO BASE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 11113
          mmTop = 59002
          mmWidth = 67204
          BandType = 3
          GroupNo = 0
        end
        object lblAnoBaseDet: TppLabel
          UserName = 'lblAnoBase1'
          Caption = '2004'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 79640
          mmTop = 59002
          mmWidth = 7408
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
  end
end
