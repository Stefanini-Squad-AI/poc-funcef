inherited dtmRelContaCorrente: TdtmRelContaCorrente
  Left = 24
  Top = 318
  Width = 244
  Height = 167
  Caption = 'dtmRelContaCorrente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 32
    Top = 56
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
    Left = 32
    Top = 68
  end
  inherited qryExemplo: TwwQuery
    Left = 32
    Top = 80
  end
  inherited rpExemplo: TppReport
    Left = 32
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object pplContaCorrente: TppBDEPipeline
    DataSource = dsContaCorrente
    UserName = 'lExemplo1'
    Left = 136
    Top = 56
    object pplContaCorrenteppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOEMPTMO'
      FieldName = 'IDCONTRATOEMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplContaCorrenteppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplContaCorrenteppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplContaCorrenteppField4: TppField
      FieldAlias = 'DATAASSINATURA'
      FieldName = 'DATAASSINATURA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object pplContaCorrenteppField5: TppField
      FieldAlias = 'DATACREDITO'
      FieldName = 'DATACREDITO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object pplContaCorrenteppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMPARCELAS'
      FieldName = 'NUMPARCELAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplContaCorrenteppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEPARCELA'
      FieldName = 'HMEPARCELA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplContaCorrenteppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEVLRPREVISTO'
      FieldName = 'HMEVLRPREVISTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplContaCorrenteppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEVLREFETIVO'
      FieldName = 'HMEVLREFETIVO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplContaCorrenteppField10: TppField
      FieldAlias = 'HMEDATAPREVISTA'
      FieldName = 'HMEDATAPREVISTA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 9
    end
    object pplContaCorrenteppField11: TppField
      FieldAlias = 'HMEDATAVENCTO'
      FieldName = 'HMEDATAVENCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 10
    end
    object pplContaCorrenteppField12: TppField
      FieldAlias = 'HMEDATAEFETIVA'
      FieldName = 'HMEDATAEFETIVA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object pplContaCorrenteppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_ANT'
      FieldName = 'VLR_ANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplContaCorrenteppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_ATU'
      FieldName = 'VLR_ATU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplContaCorrenteppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_PAGO'
      FieldName = 'VLR_PAGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplContaCorrenteppField16: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 15
    end
    object pplContaCorrenteppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDSITPLANOPREV'
      FieldName = 'IDSITPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplContaCorrenteppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOCONTREMPTMO'
      FieldName = 'IDTIPOCONTREMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplContaCorrenteppField19: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 18
    end
    object pplContaCorrenteppField20: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 19
    end
    object pplContaCorrenteppField21: TppField
      FieldAlias = 'MATRICTIT'
      FieldName = 'MATRICTIT'
      FieldLength = 13
      DisplayWidth = 13
      Position = 20
    end
    object pplContaCorrenteppField22: TppField
      FieldAlias = 'NOMETIT'
      FieldName = 'NOMETIT'
      FieldLength = 60
      DisplayWidth = 60
      Position = 21
    end
    object pplContaCorrenteppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'SLD_DEV_ANT'
      FieldName = 'SLD_DEV_ANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplContaCorrenteppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_DEV_ANT'
      FieldName = 'VLR_DEV_ANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplContaCorrenteppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'SLD_DEV_ATU'
      FieldName = 'SLD_DEV_ATU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplContaCorrenteppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_DEV_ATU'
      FieldName = 'VLR_DEV_ATU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplContaCorrenteppField27: TppField
      FieldAlias = 'DESCSITCONTRATO'
      FieldName = 'DESCSITCONTRATO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 26
    end
    object pplContaCorrenteppField28: TppField
      FieldAlias = 'DATA_QUITACAO'
      FieldName = 'DATA_QUITACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 27
    end
  end
  object dsContaCorrente: TwwDataSource
    DataSet = qryContaCorrente
    Left = 184
    Top = 28
  end
  object rptContaCorrente: TppReport
    AutoStop = False
    DataPipeline = pplContaCorrente
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Conta Corrente'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 136
    Top = 8
    Version = '7.04'
    mmColumnWidth = 270542
    DataPipelineName = 'pplContaCorrente'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24606
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Conta Corrente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 11113
        mmTop = 8731
        mmWidth = 248444
        BandType = 0
      end
      object ppLabel2: TppLabel
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
        mmHeight = 5821
        mmLeft = 11113
        mmTop = 794
        mmWidth = 248444
        BandType = 0
      end
      object ppLabel13: TppLabel
        OnPrint = ppLabel13Print
        UserName = 'Label3'
        Caption = 'Label3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 36777
        mmTop = 16933
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Mês de Referência:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 16669
        mmWidth = 34925
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppLine4: TppLine
        OnPrint = ppLine4Print
        UserName = 'Line4'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NUMPARCELAS'
        DataPipeline = pplContaCorrente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContaCorrente'
        mmHeight = 3440
        mmLeft = 43392
        mmTop = 794
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplContaCorrente
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContaCorrente'
        mmHeight = 3440
        mmLeft = 61913
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'HMEVLREFETIVO'
        DataPipeline = pplContaCorrente
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContaCorrente'
        mmHeight = 3440
        mmLeft = 152136
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'HMEDATAEFETIVA'
        DataPipeline = pplContaCorrente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContaCorrente'
        mmHeight = 3440
        mmLeft = 213519
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'HMEDATAPREVISTA'
        DataPipeline = pplContaCorrente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContaCorrente'
        mmHeight = 3440
        mmLeft = 195263
        mmTop = 794
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'DATACREDITO'
        DataPipeline = pplContaCorrente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'pplContaCorrente'
        mmHeight = 3440
        mmLeft = 21431
        mmTop = 794
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'HMEPARCELA'
        DataPipeline = pplContaCorrente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContaCorrente'
        mmHeight = 3440
        mmLeft = 179917
        mmTop = 529
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplContaCorrente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        DataPipelineName = 'pplContaCorrente'
        mmHeight = 3440
        mmLeft = 794
        mmTop = 794
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'VLR_ANT'
        DataPipeline = pplContaCorrente
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContaCorrente'
        mmHeight = 3440
        mmLeft = 95250
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VLR_PAGO'
        DataPipeline = pplContaCorrente
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContaCorrente'
        mmHeight = 3440
        mmLeft = 120915
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'VLR_ATU'
        DataPipeline = pplContaCorrente
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContaCorrente'
        mmHeight = 3440
        mmLeft = 237067
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 270542
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 3175
        mmWidth = 23813
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
        mmLeft = 87842
        mmTop = 3175
        mmWidth = 94986
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
        mmLeft = 243153
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 6350
        mmLeft = 53711
        mmTop = 4498
        mmWidth = 215636
        BandType = 7
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 1588
        mmWidth = 270542
        BandType = 7
      end
      object ppLabel19: TppLabel
        UserName = 'Label4'
        Caption = 'Total Geral:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 32015
        mmTop = 5556
        mmWidth = 17727
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplContaCorrente
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContaCorrente'
        mmHeight = 3440
        mmLeft = 59796
        mmTop = 5821
        mmWidth = 21431
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'HMEVLREFETIVO'
        DataPipeline = pplContaCorrente
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContaCorrente'
        mmHeight = 3440
        mmLeft = 150019
        mmTop = 5821
        mmWidth = 21431
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'VLR_ANT'
        DataPipeline = pplContaCorrente
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContaCorrente'
        mmHeight = 3440
        mmLeft = 93134
        mmTop = 5821
        mmWidth = 21431
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'VLR_ATU'
        DataPipeline = pplContaCorrente
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContaCorrente'
        mmHeight = 3440
        mmLeft = 234950
        mmTop = 5821
        mmWidth = 21431
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc9'
        DataField = 'VLR_PAGO'
        DataPipeline = pplContaCorrente
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContaCorrente'
        mmHeight = 3440
        mmLeft = 118798
        mmTop = 5821
        mmWidth = 21431
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDSITPLANOPREV'
      DataPipeline = pplContaCorrente
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContaCorrente'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppShape5: TppShape
          UserName = 'Shape5'
          Brush.Color = clMenu
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 6350
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 0
        end
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'DESCRICAO'
          DataPipeline = pplContaCorrente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          DataPipelineName = 'pplContaCorrente'
          mmHeight = 4498
          mmLeft = 4763
          mmTop = 1058
          mmWidth = 48154
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object ppShape6: TppShape
          UserName = 'Shape6'
          mmHeight = 5821
          mmLeft = 53446
          mmTop = 3440
          mmWidth = 215636
          BandType = 5
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Total da Situação:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 26723
          mmTop = 4763
          mmWidth = 26194
          BandType = 5
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 1058
          mmWidth = 270542
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'VLR_ANT'
          DataPipeline = pplContaCorrente
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContaCorrente'
          mmHeight = 3175
          mmLeft = 93134
          mmTop = 4763
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc18: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'VLR_PAGO'
          DataPipeline = pplContaCorrente
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContaCorrente'
          mmHeight = 3175
          mmLeft = 120915
          mmTop = 4763
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc19: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'HMEVLREFETIVO'
          DataPipeline = pplContaCorrente
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContaCorrente'
          mmHeight = 3175
          mmLeft = 150019
          mmTop = 4763
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc20: TppDBCalc
          UserName = 'DBCalc16'
          DataField = 'VLR_ATU'
          DataPipeline = pplContaCorrente
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContaCorrente'
          mmHeight = 3175
          mmLeft = 234950
          mmTop = 4763
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'HMEVLRPREVISTO'
          DataPipeline = pplContaCorrente
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContaCorrente'
          mmHeight = 3175
          mmLeft = 59796
          mmTop = 4763
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDPESSOA'
      DataPipeline = pplContaCorrente
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContaCorrente'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 11642
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 11377
          mmLeft = 0
          mmTop = 265
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'MATRICULA'
          DataPipeline = pplContaCorrente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          DataPipelineName = 'pplContaCorrente'
          mmHeight = 4498
          mmLeft = 2381
          mmTop = 1852
          mmWidth = 23283
          BandType = 3
          GroupNo = 1
        end
        object ppLabel11: TppLabel
          UserName = 'Label101'
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 4763
          mmTop = 7408
          mmWidth = 11642
          BandType = 3
          GroupNo = 1
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Concessão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 20902
          mmTop = 7408
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'NOME'
          DataPipeline = pplContaCorrente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          DataPipelineName = 'pplContaCorrente'
          mmHeight = 4498
          mmLeft = 29104
          mmTop = 1852
          mmWidth = 84402
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          Caption = 'Nr. Parcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 42069
          mmTop = 7408
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Valor Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 63765
          mmTop = 7408
          mmWidth = 17463
          BandType = 3
          GroupNo = 1
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Total do Débito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 93398
          mmTop = 7408
          mmWidth = 20108
          BandType = 3
          GroupNo = 1
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Amortizações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 122238
          mmTop = 7673
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Vlr. Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 151871
          mmTop = 7408
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 177800
          mmTop = 7408
          mmWidth = 9790
          BandType = 3
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Data Vencto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 193940
          mmTop = 7408
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Data Pagto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 214048
          mmTop = 7408
          mmWidth = 14288
          BandType = 3
          GroupNo = 1
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 247386
          mmTop = 7938
          mmWidth = 7408
          BandType = 3
          GroupNo = 1
        end
        object ppDBText14: TppDBText
          UserName = 'DBText14'
          DataField = 'MATRICTIT'
          DataPipeline = pplContaCorrente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplContaCorrente'
          mmHeight = 4498
          mmLeft = 145786
          mmTop = 1852
          mmWidth = 23283
          BandType = 3
          GroupNo = 1
        end
        object ppDBText15: TppDBText
          UserName = 'DBText15'
          DataField = 'NOMETIT'
          DataPipeline = pplContaCorrente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplContaCorrente'
          mmHeight = 4498
          mmLeft = 171186
          mmTop = 1852
          mmWidth = 84402
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Total do Participante:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 19050
          mmTop = 1058
          mmWidth = 30692
          BandType = 5
          GroupNo = 1
        end
        object ppShape4: TppShape
          UserName = 'Shape4'
          mmHeight = 5821
          mmLeft = 53446
          mmTop = 265
          mmWidth = 215636
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLR_ANT'
          DataPipeline = pplContaCorrente
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContaCorrente'
          mmHeight = 3440
          mmLeft = 93134
          mmTop = 1588
          mmWidth = 21431
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'VLR_PAGO'
          DataPipeline = pplContaCorrente
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContaCorrente'
          mmHeight = 3440
          mmLeft = 120915
          mmTop = 1588
          mmWidth = 19315
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          DataField = 'HMEVLREFETIVO'
          DataPipeline = pplContaCorrente
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContaCorrente'
          mmHeight = 3440
          mmLeft = 150019
          mmTop = 1588
          mmWidth = 21431
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'VLR_ATU'
          DataPipeline = pplContaCorrente
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContaCorrente'
          mmHeight = 3440
          mmLeft = 234950
          mmTop = 1588
          mmWidth = 21431
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'HMEVLRPREVISTO'
          DataPipeline = pplContaCorrente
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContaCorrente'
          mmHeight = 3440
          mmLeft = 59796
          mmTop = 1588
          mmWidth = 21431
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'IDTIPOCONTREMPTMO'
      DataPipeline = pplContaCorrente
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContaCorrente'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand3BeforePrint
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'TCEDESCRICAO'
          DataPipeline = pplContaCorrente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          DataPipelineName = 'pplContaCorrente'
          mmHeight = 4498
          mmLeft = 2381
          mmTop = 1323
          mmWidth = 55298
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'HMEVLRPREVISTO'
          DataPipeline = pplContaCorrente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContaCorrente'
          mmHeight = 4498
          mmLeft = 59796
          mmTop = 1323
          mmWidth = 21431
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc101'
          DataField = 'VLR_ANT'
          DataPipeline = pplContaCorrente
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContaCorrente'
          mmHeight = 4498
          mmLeft = 93134
          mmTop = 1323
          mmWidth = 21431
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc102'
          DataField = 'VLR_PAGO'
          DataPipeline = pplContaCorrente
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContaCorrente'
          mmHeight = 4498
          mmLeft = 120915
          mmTop = 1323
          mmWidth = 19315
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc103'
          DataField = 'HMEVLREFETIVO'
          DataPipeline = pplContaCorrente
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContaCorrente'
          mmHeight = 4498
          mmLeft = 150019
          mmTop = 1323
          mmWidth = 21431
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc104'
          DataField = 'VLR_ATU'
          DataPipeline = pplContaCorrente
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContaCorrente'
          mmHeight = 4498
          mmLeft = 234950
          mmTop = 1323
          mmWidth = 21431
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object qryContaCorrente: TwwQuery
    BeforeOpen = qryContaCorrenteBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   0     AS IDSITPLANOPREV,'
      '   0     AS IDPESSOA,'
      '   0     AS IDTIPOCONTREMPTMO,'
      '   0     AS IDCONTRATOEMPTMO,'
      ''
      '   '#39' '#39'   AS MATRICTIT,'
      '   '#39' '#39'   AS MATRICULA,'
      '   '#39' '#39'   AS DESCRICAO,'
      ''
      '   '#39' '#39'   AS TCEDESCRICAO,'
      ''
      '   '#39' '#39'   AS NOME,'
      '   '#39' '#39'   AS NOMETIT,'
      ''
      '   to_date('#39'31/12/2002'#39', '#39'dd/mm/yyyy'#39')    AS DATAASSINATURA,'
      '   to_date('#39'31/12/2002'#39', '#39'dd/mm/yyyy'#39')    AS DATACREDITO,'
      ''
      '   0     AS NUMPARCELAS,'
      '   0     AS HMEPARCELA,'
      '   0     AS HMEVLRPREVISTO,'
      '   0     AS HMEVLREFETIVO,'
      ''
      '   to_date('#39'31/12/2002'#39', '#39'dd/mm/yyyy'#39')    AS HMEDATAPREVISTA,'
      '   to_date('#39'31/12/2002'#39', '#39'dd/mm/yyyy'#39')    AS HMEDATAVENCTO,'
      '   to_date('#39'31/12/2002'#39', '#39'dd/mm/yyyy'#39')    AS HMEDATAEFETIVA,'
      ''
      '   0     AS VLR_ANT,'
      '   0     AS VLR_ATU,'
      ''
      '   0     AS SLD_DEV_ANT,'
      '   0     AS VLR_DEV_ANT,'
      '   0     AS SLD_DEV_ATU,'
      '   0     AS VLR_DEV_ATU,'
      ''
      '   0     AS VLR_PAGO,'
      '   '#39'                              '#39' AS DESCSITCONTRATO,'
      '   to_date('#39'31/12/2002'#39', '#39'dd/mm/yyyy'#39') AS DATA_QUITACAO'
      ''
      'FROM'
      '   DUAL'
      'WHERE 1 = 2'
      ' ')
    ValidateWithMask = True
    Left = 88
    Top = 80
    object qryContaCorrenteIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContaCorrenteIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryContaCorrenteNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryContaCorrenteDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object qryContaCorrenteDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryContaCorrenteNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryContaCorrenteHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryContaCorrenteHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryContaCorrenteHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryContaCorrenteHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryContaCorrenteHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryContaCorrenteHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
    end
    object qryContaCorrenteVLR_ANT: TFloatField
      FieldName = 'VLR_ANT'
    end
    object qryContaCorrenteVLR_ATU: TFloatField
      FieldName = 'VLR_ATU'
    end
    object qryContaCorrenteVLR_PAGO: TFloatField
      FieldName = 'VLR_PAGO'
    end
    object qryContaCorrenteMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryContaCorrenteIDSITPLANOPREV: TFloatField
      FieldName = 'IDSITPLANOPREV'
    end
    object qryContaCorrenteIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryContaCorrenteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryContaCorrenteTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryContaCorrenteMATRICTIT: TStringField
      FieldName = 'MATRICTIT'
      Size = 13
    end
    object qryContaCorrenteNOMETIT: TStringField
      FieldName = 'NOMETIT'
      Size = 60
    end
    object qryContaCorrenteSLD_DEV_ANT: TFloatField
      FieldName = 'SLD_DEV_ANT'
    end
    object qryContaCorrenteVLR_DEV_ANT: TFloatField
      FieldName = 'VLR_DEV_ANT'
    end
    object qryContaCorrenteSLD_DEV_ATU: TFloatField
      FieldName = 'SLD_DEV_ATU'
    end
    object qryContaCorrenteVLR_DEV_ATU: TFloatField
      FieldName = 'VLR_DEV_ATU'
    end
    object qryContaCorrenteDESCSITCONTRATO: TStringField
      FieldName = 'DESCSITCONTRATO'
      FixedChar = True
      Size = 30
    end
    object qryContaCorrenteDATA_QUITACAO: TDateTimeField
      FieldName = 'DATA_QUITACAO'
    end
  end
end
