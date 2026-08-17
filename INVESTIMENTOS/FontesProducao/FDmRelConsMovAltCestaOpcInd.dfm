inherited DmRelConsMovAltCestaOpcInd: TDmRelConsMovAltCestaOpcInd
  Left = 154
  Top = 229
  Width = 513
  Height = 233
  Caption = 'DmRelConsMovAltCestaOpcInd'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 434
    Top = 8
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
    Left = 434
    Top = 8
  end
  inherited qryExemplo: TwwQuery
    Left = 434
    Top = 8
  end
  inherited rpExemplo: TppReport
    Left = 434
    Top = 8
  end
  object ppRConsMovAltCestaOpcInd: TppReport
    AutoStop = False
    DataPipeline = pplConsMovAltCestaOpcInd
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Consulta Movimentação de Alteração de Cesta - Analítico'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 63
    Top = 21
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34131
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'Label11'
        Caption = 'Alteração de Cesta de Opção de Índice - ANALÍTICO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 87842
        BandType = 0
      end
      object ppLabel9: TppLabel
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
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 24077
        mmWidth = 197115
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line4'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 33602
        mmWidth = 197115
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'RpConsCartRendVarShape1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 9260
        mmLeft = 265
        mmTop = 24342
        mmWidth = 197115
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label5'
        Caption = 'Quantidade Atual'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 6615
        mmLeft = 101336
        mmTop = 25929
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label7'
        Caption = 'Variação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 184944
        mmTop = 25929
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label3'
        Caption = 'Investimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 25929
        mmWidth = 17198
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9260
        mmLeft = 0
        mmTop = 24342
        mmWidth = 4233
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line5'
        Position = lpRight
        Weight = 0.75
        mmHeight = 9790
        mmLeft = 192617
        mmTop = 24077
        mmWidth = 4763
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText1'
        DataField = 'DESCCARTINVEST'
        DataPipeline = pplConsMovAltCestaOpcInd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 131763
        mmTop = 14023
        mmWidth = 65617
        BandType = 0
      end
      object ppLDataMov: TppLabel
        UserName = 'Label2'
        Caption = 'DataMov'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 14023
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Quantidade Anterior'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 6615
        mmLeft = 73554
        mmTop = 25929
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Quantidade Movimentada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 6615
        mmLeft = 122238
        mmTop = 25929
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Custo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 160602
        mmTop = 25929
        mmWidth = 7938
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppShape2: TppShape
        OnPrint = ppShape2Print
        UserName = 'shpDetalhe'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 197115
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText2'
        DataField = 'DESCINVESTIMENTO_1'
        DataPipeline = pplConsMovAltCestaOpcInd
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 529
        mmWidth = 57679
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText3'
        DataField = 'QTDATU'
        DataPipeline = pplConsMovAltCestaOpcInd
        DisplayFormat = '###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 89165
        mmTop = 529
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText5'
        DataField = 'VARIACAO'
        DataPipeline = pplConsMovAltCestaOpcInd
        DisplayFormat = '###,###,###,###0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 169598
        mmTop = 529
        mmWidth = 27781
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'QTDANT'
        DataPipeline = pplConsMovAltCestaOpcInd
        DisplayFormat = '###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 60854
        mmTop = 529
        mmWidth = 27781
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'DIF'
        DataPipeline = pplConsMovAltCestaOpcInd
        DisplayFormat = '###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 116681
        mmTop = 529
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'CUSTO'
        DataPipeline = pplConsMovAltCestaOpcInd
        DisplayFormat = '###,###,###,###0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 140494
        mmTop = 529
        mmWidth = 28046
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine10: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel26: TppLabel
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DESCCARTINVEST'
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCINVESTIMENTO'
      DataPipeline = pplConsMovAltCestaOpcInd
      KeepTogether = True
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppShape3: TppShape
          OnPrint = ppShape2Print
          UserName = 'shpDetalhe1'
          Brush.Color = clGray
          Pen.Style = psClear
          mmHeight = 4233
          mmLeft = 265
          mmTop = 265
          mmWidth = 88636
          BandType = 3
          GroupNo = 1
        end
        object ppDBText1: TppDBText
          UserName = 'DBText4'
          DataField = 'DESCINVESTIMENTO'
          DataPipeline = pplConsMovAltCestaOpcInd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2646
          mmTop = 529
          mmWidth = 85990
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
      end
    end
  end
  object pplConsMovAltCestaOpcInd: TppBDEPipeline
    DataSource = frmConsMovAltCestaOpcInd.DsConsMovAltCestaOpcInd
    UserName = 'ConsMovAltCestaOpcInd'
    Left = 63
    Top = 96
    object pplConsMovAltCestaOpcIndppField1: TppField
      FieldAlias = 'DESCINVESTIMENTO_1'
      FieldName = 'DESCINVESTIMENTO_1'
      FieldLength = 60
      DisplayWidth = 35
      Position = 0
    end
    object pplConsMovAltCestaOpcIndppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDANT'
      FieldName = 'QTDANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 14
      Position = 1
    end
    object pplConsMovAltCestaOpcIndppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDATU'
      FieldName = 'QTDATU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 14
      Position = 2
    end
    object pplConsMovAltCestaOpcIndppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIF'
      FieldName = 'DIF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 14
      Position = 3
    end
    object pplConsMovAltCestaOpcIndppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'CUSTO'
      FieldName = 'CUSTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 13
      Position = 4
    end
    object pplConsMovAltCestaOpcIndppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARIACAO'
      FieldName = 'VARIACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 13
      Position = 5
    end
    object pplConsMovAltCestaOpcIndppField7: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 60
      DisplayWidth = 35
      Position = 6
    end
    object pplConsMovAltCestaOpcIndppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCESTAOPCIND'
      FieldName = 'IDCESTAOPCIND'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplConsMovAltCestaOpcIndppField9: TppField
      FieldAlias = 'SGLCUSTODIANTE'
      FieldName = 'SGLCUSTODIANTE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object pplConsMovAltCestaOpcIndppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCUSTODIANTE'
      FieldName = 'IDCUSTODIANTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplConsMovAltCestaOpcIndppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINVESTIMENTO'
      FieldName = 'IDINVESTIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplConsMovAltCestaOpcIndppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDEMISSOR'
      FieldName = 'IDEMISSOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplConsMovAltCestaOpcIndppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplConsMovAltCestaOpcIndppField14: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 13
    end
  end
  object ppRConsMovAltCestaOpcIndSintetico: TppReport
    AutoStop = False
    DataPipeline = pplConsMovAltCestaOpcIndSintetico
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Consulta Movimentação de Alteração de Cesta - Sintético'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 234
    Top = 21
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33602
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Alteração de Cesta de Opção de Índice - SINTÉTICO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 87577
        BandType = 0
      end
      object ppLabel2: TppLabel
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
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmOperComum.pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object ppLDataMovSintetico: TppLabel
        UserName = 'LPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 23548
        mmWidth = 197115
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 33073
        mmWidth = 197115
        BandType = 0
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 9260
        mmLeft = 265
        mmTop = 23813
        mmWidth = 197115
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label1'
        Caption = 'Quantidade Atual'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 6615
        mmLeft = 101336
        mmTop = 25400
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Variação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 184944
        mmTop = 25400
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Investimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 25400
        mmWidth = 17198
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9260
        mmLeft = 0
        mmTop = 23813
        mmWidth = 4233
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpRight
        Weight = 0.75
        mmHeight = 9790
        mmLeft = 192617
        mmTop = 23283
        mmWidth = 4763
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Quantidade Anterior'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 6615
        mmLeft = 73554
        mmTop = 25400
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Quantidade Movimentada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 6615
        mmLeft = 122238
        mmTop = 25400
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Custo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 160602
        mmTop = 25400
        mmWidth = 7938
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'DESCCARTINVEST'
        DataPipeline = pplConsMovAltCestaOpcIndSintetico
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 115094
        mmTop = 14023
        mmWidth = 81492
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppShape5: TppShape
        OnPrint = ppShape2Print
        UserName = 'shpDetalhe2'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 529
        mmTop = 0
        mmWidth = 197115
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText1'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = pplConsMovAltCestaOpcIndSintetico
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 529
        mmWidth = 57679
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText2'
        DataField = 'QTDATU'
        DataPipeline = pplConsMovAltCestaOpcIndSintetico
        DisplayFormat = '###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 89165
        mmTop = 529
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText3'
        DataField = 'VARIACAO'
        DataPipeline = pplConsMovAltCestaOpcIndSintetico
        DisplayFormat = '###,###,###,###0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 168805
        mmTop = 529
        mmWidth = 27781
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText4'
        DataField = 'QTDANT'
        DataPipeline = pplConsMovAltCestaOpcIndSintetico
        DisplayFormat = '###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 60854
        mmTop = 529
        mmWidth = 27781
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'DIF'
        DataPipeline = pplConsMovAltCestaOpcIndSintetico
        DisplayFormat = '###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 116681
        mmTop = 529
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'CUSTO'
        DataPipeline = pplConsMovAltCestaOpcIndSintetico
        DisplayFormat = '###,###,###,###0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 140494
        mmTop = 529
        mmWidth = 28046
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 14288
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
      object ppLabel6: TppLabel
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
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 21696
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'VARIACAO'
        DataPipeline = pplConsMovAltCestaOpcIndSintetico
        DisplayFormat = '###,###,###,###0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 169863
        mmTop = 12965
        mmWidth = 26723
        BandType = 7
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'CUSTO'
        DataPipeline = pplConsMovAltCestaOpcIndSintetico
        DisplayFormat = '###,###,###,###0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 142082
        mmTop = 12965
        mmWidth = 26458
        BandType = 7
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'CUSTONEG'
        DataPipeline = pplConsMovAltCestaOpcIndSintetico
        DisplayFormat = '###,###,###,###0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 132557
        mmTop = 1323
        mmWidth = 35983
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'CUSTOPOS'
        DataPipeline = pplConsMovAltCestaOpcIndSintetico
        DisplayFormat = '###,###,###,###0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 132557
        mmTop = 6615
        mmWidth = 35983
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'VARIACAOPOS'
        DataPipeline = pplConsMovAltCestaOpcIndSintetico
        DisplayFormat = '###,###,###,###0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 169863
        mmTop = 6615
        mmWidth = 26723
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'VARIACAONEG'
        DataPipeline = pplConsMovAltCestaOpcIndSintetico
        DisplayFormat = '###,###,###,###0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 169863
        mmTop = 1323
        mmWidth = 26723
        BandType = 7
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 5821
        mmWidth = 197300
        BandType = 7
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 11113
        mmWidth = 197300
        BandType = 7
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 11642
        mmWidth = 197300
        BandType = 7
      end
      object ppLabel3: TppLabel
        UserName = 'Label2'
        Caption = 'Total a Débito'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 1323
        mmWidth = 18256
        BandType = 7
      end
      object ppLabel5: TppLabel
        UserName = 'Label3'
        Caption = 'Total a Crédito'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 6615
        mmWidth = 19315
        BandType = 7
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Total Geral'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 12965
        mmWidth = 14552
        BandType = 7
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'DESCINVESTIMENTO'
      DataPipeline = pplConsMovAltCestaOpcIndSintetico
      KeepTogether = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 265
        mmPrintPosition = 0
      end
    end
  end
  object pplConsMovAltCestaOpcIndSintetico: TppBDEPipeline
    DataSource = DsConsMovAltCestaOpcIndSintetico
    UserName = 'ConsMovAltCestaOpcInd1'
    Left = 231
    Top = 96
  end
  object DsConsMovAltCestaOpcIndSintetico: TwwDataSource
    DataSet = QryConsMovAltCestaOpcIndSintetico
    Left = 231
    Top = 152
  end
  object QryConsMovAltCestaOpcIndSintetico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  MV.DESCINVESTIMENTO, CA.DESCCARTINVEST, SUM(MV.QTDANT) A' +
        'S QTDANT, SUM(MV.QTDATU) AS QTDATU,'
      '         (SUM(MV.QTDANT) - SUM(MV.QTDATU)) AS DIF,'
      
        '   ROUND((SUM(MV.QTDANT) - SUM(MV.QTDATU)) * CUSTO.PUCUSTO,2) AS' +
        ' CUSTO,'
      
        '   ROUND((SUM(MV.QTDANT) - SUM(MV.QTDATU)) * CUSTO.PUVARIACAO,2)' +
        ' AS VARIACAO,'
      ''
      
        '   DECODE(ROUND((SUM(MV.QTDANT) - SUM(MV.QTDATU)) * CUSTO.PUCUST' +
        'O,2), '
      
        #9#9'ABS(ROUND((SUM(MV.QTDANT) - SUM(MV.QTDATU)) * CUSTO.PUCUSTO,2)' +
        ')*-1,'
      
        #9#9'        ROUND((SUM(MV.QTDANT) - SUM(MV.QTDATU)) * CUSTO.PUCUST' +
        'O,2),0) AS CUSTONEG,'
      ''
      
        '   DECODE(ROUND((SUM(MV.QTDANT) - SUM(MV.QTDATU)) * CUSTO.PUCUST' +
        'O,2), '
      
        #9'              ABS(ROUND((SUM(MV.QTDANT) - SUM(MV.QTDATU)) * CUS' +
        'TO.PUCUSTO,2)),'
      
        #9#9'        ROUND((SUM(MV.QTDANT) - SUM(MV.QTDATU)) * CUSTO.PUCUST' +
        'O,2),0) AS CUSTOPOS,'
      ''
      ''
      
        '   DECODE(ROUND((SUM(MV.QTDANT) - SUM(MV.QTDATU)) * CUSTO.PUVARI' +
        'ACAO,2), '
      
        #9#9'ABS(ROUND((SUM(MV.QTDANT) - SUM(MV.QTDATU)) * CUSTO.PUVARIACAO' +
        ',2))*-1,'
      
        #9#9'        ROUND((SUM(MV.QTDANT) - SUM(MV.QTDATU)) * CUSTO.PUVARI' +
        'ACAO,2),0) AS VARIACAONEG,'
      ''
      
        '   DECODE(ROUND((SUM(MV.QTDANT) - SUM(MV.QTDATU)) * CUSTO.PUVARI' +
        'ACAO,2), '
      
        #9#9'ABS(ROUND((SUM(MV.QTDANT) - SUM(MV.QTDATU)) * CUSTO.PUVARIACAO' +
        ',2)),'
      
        #9#9'        ROUND((SUM(MV.QTDANT) - SUM(MV.QTDATU)) * CUSTO.PUVARI' +
        'ACAO,2),0) AS VARIACAOPOS'
      ''
      
        'FROM (SELECT I.DESCINVESTIMENTO, C.IDINVESTIMENTO, T.SGLCUSTODIA' +
        'NTE, C.IDCUSTODIANTE,'
      '             I.IDEMISSOR, C.IDCARTEIRAINVEST,'
      
        '             C.DATAVIGENCIA AS DTVGATU,           C.QUANTIDADE A' +
        'S QTDATU,'
      
        '             TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS DTVGANT, 0 AS QTDANT, C' +
        '.IDCESTAOPCIND'
      '      FROM CESTAOPCIND C, INVESTIMENTO I, CUSTODIANTE T'
      '      WHERE C.DATAVIGENCIA = TO_DATE(:DATAATUAL,'#39'DD/MM/YYYY'#39')'
      
        '        AND (((:IDCESTAOPCIND IS NOT NULL) AND (C.IDCESTAOPCIND ' +
        '= :IDCESTAOPCIND)) OR'
      '              (:IDCESTAOPCIND IS NULL))'
      '        AND C.IDINVESTIMENTO = I.IDINVESTIMENTO'
      '        AND C.IDCUSTODIANTE = T.IDCUSTODIANTE'
      '        AND C.IDBOLETA IS NOT NULL'
      ''
      '      UNION'
      ''
      
        '      SELECT I.DESCINVESTIMENTO, C.IDINVESTIMENTO, T.SGLCUSTODIA' +
        'NTE, C.IDCUSTODIANTE,'
      '             I.IDEMISSOR, C.IDCARTEIRAINVEST,'
      '             TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS DTVGATU, 0 AS QTDATU,'
      
        '             C.DATAVIGENCIA AS DTVGANT,           C.QUANTIDADE A' +
        'S QTDANT, C.IDCESTAOPCIND'
      '      FROM CESTAOPCIND C, INVESTIMENTO I, CUSTODIANTE T'
      '      WHERE C.DATAVIGENCIA || C.IDCESTAOPCIND IN'
      
        '                       (SELECT MAX(DATAVIGENCIA) || MAX(IDCESTAO' +
        'PCIND)'
      '                        FROM CESTAOPCIND'
      
        '                        WHERE DATAVIGENCIA < TO_DATE(:DATAATUAL,' +
        #39'DD/MM/YYYY'#39')'
      
        '                          AND IDCESTAOPCIND IN (SELECT IDCESTAOP' +
        'CIND'
      '                                                FROM CESTAOPCIND'
      
        '                                                WHERE DATAVIGENC' +
        'IA = TO_DATE(:DATAATUAL,'#39'DD/MM/YYYY'#39')'
      
        '                                                  AND (((:IDCEST' +
        'AOPCIND IS NOT NULL) AND (IDCESTAOPCIND = :IDCESTAOPCIND)) OR'
      
        '                                                        (:IDCEST' +
        'AOPCIND IS NULL))'
      
        '                                                  AND IDBOLETA I' +
        'S NOT NULL'
      
        '                                                GROUP BY IDCESTA' +
        'OPCIND)'
      '                        GROUP BY IDCESTAOPCIND )'
      '        AND C.IDINVESTIMENTO = I.IDINVESTIMENTO'
      '        AND C.IDCUSTODIANTE = T.IDCUSTODIANTE'
      '     ) MV,'
      ''
      '('
      'SELECT'
      '  IV.DESCINVESTIMENTO,'
      '  H1.IDINVESTIMENTO,'
      '  H1.SALDOVLRCARTINV,'
      '  H1.IDCARTEIRAINVEST,'
      '  H1.SALDOQTDEINVCART,'
      '  H1.SALDOVARIACAO,'
      
        '  (NVL(H1.SALDOVARIACAO,1)/NVL(H1.SALDOQTDEINVCART,1)) AS PUVARI' +
        'ACAO,'
      '  (NVL(H1.SALDOAQUI,1)/NVL(H1.SALDOQTDEINVCART,1)) AS PUCUSTO'
      'FROM'
      '   HISTCARTINV H1, INVESTIMENTO IV'
      'WHERE'
      '   (H1.IDHISTCARTINV  IN'
      '     ('
      '      SELECT MAX(H2.IDHISTCARTINV)'
      '      FROM HISTCARTINV H2'
      '      WHERE'
      '           H2.IDTIPOINVEST       = 2                     AND'
      
        '        (((H2.DATAMOVCARTINV     = TO_DATE(:DATAATUAL,'#39'DD/MM/YYY' +
        'Y'#39')) )  OR'
      
        '         ((H2.DATAMOVCARTINV     < TO_DATE(:DATAATUAL,'#39'DD/MM/YYY' +
        'Y'#39'))    AND (H2.IDHISTCARTINV <9999999999)))'
      
        '      GROUP BY H2.IDINVESTIMENTO, H2.IDCARTEIRAINVEST ))        ' +
        '        AND'
      '   (H1.IDINVESTIMENTO     = IV.IDINVESTIMENTO(+))        AND'
      
        '   (NVL(H1.SALDOQTDEINVCART,0) > 0)) CUSTO, CARTEIRAINVEST CA, O' +
        'RDEMOPCIND OD, INVESTIMENTO OP'
      ''
      'WHERE'
      '   CUSTO.IDINVESTIMENTO         = MV.IDINVESTIMENTO      AND'
      '   CUSTO.IDCARTEIRAINVEST       = MV.IDCARTEIRAINVEST    AND'
      '   CA.IDCARTEIRAINVEST          = MV.IDCARTEIRAINVEST    AND'
      '   OD.IDCESTAOPCIND'#9'        = MV.IDCESTAOPCIND       AND'
      '   OP.IDINVESTIMENTO            = OD.IDINVESTIMENTO'
      ''
      
        'GROUP BY  MV.IDCARTEIRAINVEST,  MV.DESCINVESTIMENTO, CUSTO.PUCUS' +
        'TO, CUSTO.PUVARIACAO,'
      #9'  CUSTO.SALDOVLRCARTINV, CUSTO.SALDOQTDEINVCART,'
      '          CA.DESCCARTINVEST'
      ''
      'HAVING  (SUM( MV.QTDANT) - SUM( MV.QTDATU)) <> 0'
      ''
      'ORDER BY  MV.DESCINVESTIMENTO'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 231
    Top = 124
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAATUAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAATUAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAATUAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAATUAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAATUAL'
        ParamType = ptInput
      end>
    object QryConsMovAltCestaOpcIndSinteticoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryConsMovAltCestaOpcIndSinteticoDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object QryConsMovAltCestaOpcIndSinteticoQTDANT: TFloatField
      FieldName = 'QTDANT'
      DisplayFormat = '###,###,###,##0'
    end
    object QryConsMovAltCestaOpcIndSinteticoQTDATU: TFloatField
      FieldName = 'QTDATU'
      DisplayFormat = '###,###,###,##0'
    end
    object QryConsMovAltCestaOpcIndSinteticoDIF: TFloatField
      FieldName = 'DIF'
      DisplayFormat = '###,###,###,##0'
    end
    object QryConsMovAltCestaOpcIndSinteticoCUSTO: TFloatField
      FieldName = 'CUSTO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryConsMovAltCestaOpcIndSinteticoVARIACAO: TFloatField
      FieldName = 'VARIACAO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryConsMovAltCestaOpcIndSinteticoCUSTONEG: TFloatField
      FieldName = 'CUSTONEG'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryConsMovAltCestaOpcIndSinteticoCUSTOPOS: TFloatField
      FieldName = 'CUSTOPOS'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryConsMovAltCestaOpcIndSinteticoVARIACAONEG: TFloatField
      FieldName = 'VARIACAONEG'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryConsMovAltCestaOpcIndSinteticoVARIACAOPOS: TFloatField
      FieldName = 'VARIACAOPOS'
      DisplayFormat = '###,###,###,###0.00'
    end
  end
end
