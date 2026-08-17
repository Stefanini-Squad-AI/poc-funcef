inherited dtmRelItensEnvioAnalMutuario: TdtmRelItensEnvioAnalMutuario
  Left = 549
  Top = 307
  Width = 243
  Height = 165
  Caption = ''
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
  end
  object pplItensEnvioAnalMutuario: TppBDEPipeline
    DataSource = dtsItensEnvioAnalMutuario
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lExemplo1'
    Left = 144
    Top = 56
  end
  object dtsItensEnvioAnalMutuario: TwwDataSource
    AutoEdit = False
    DataSet = qryItensEnvioAnalMutuario
    Left = 144
    Top = 68
  end
  object rptItensEnvioAnalMutuario: TppReport
    AutoStop = False
    DataPipeline = pplItensEnvioAnalMutuario
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Itens Enviados (Sintético)'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 (210 x 297 mm) '
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
    Left = 144
    Top = 8
    Version = '5.5'
    mmColumnWidth = 270542
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24606
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 
          'Valores Enviados/Recebidos por Patrocinadora (analítico por Mutu' +
          'ário)'
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
        mmLeft = 35719
        mmTop = 16669
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
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLine4: TppLine
        OnPrint = ppLine4Print
        UserName = 'Line4'
        Pen.Style = psClear
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 5821
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 5821
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NOME'
        DataPipeline = pplItensEnvioAnalMutuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 39158
        mmTop = 1058
        mmWidth = 94192
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLR_PREV_PATRO'
        DataPipeline = pplItensEnvioAnalMutuario
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 137319
        mmTop = 1058
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VLR_EFET_PATRO'
        DataPipeline = pplItensEnvioAnalMutuario
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 158486
        mmTop = 1058
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VLR_PREV_BENEF'
        DataPipeline = pplItensEnvioAnalMutuario
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 182563
        mmTop = 1058
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VLR_EFET_BENEF'
        DataPipeline = pplItensEnvioAnalMutuario
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 203730
        mmTop = 1058
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'VLR_PREV_FIN'
        DataPipeline = pplItensEnvioAnalMutuario
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 227807
        mmTop = 1058
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'VLR_EFET_FIN'
        DataPipeline = pplItensEnvioAnalMutuario
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 248973
        mmTop = 1058
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'MATRICULA'
        DataPipeline = pplItensEnvioAnalMutuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 20108
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
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
      mmHeight = 20902
      mmPrintPosition = 0
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
        mmLeft = 118004
        mmTop = 5556
        mmWidth = 17727
        BandType = 7
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 6350
        mmLeft = 135732
        mmTop = 4233
        mmWidth = 134409
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'VLR_EFET_PATRO'
        DataPipeline = pplItensEnvioAnalMutuario
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 158486
        mmTop = 5556
        mmWidth = 19315
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'VLR_PREV_BENEF'
        DataPipeline = pplItensEnvioAnalMutuario
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 182563
        mmTop = 5556
        mmWidth = 19315
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'VLR_EFET_BENEF'
        DataPipeline = pplItensEnvioAnalMutuario
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 203730
        mmTop = 5556
        mmWidth = 19315
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc11'
        DataField = 'VLR_PREV_PATRO'
        DataPipeline = pplItensEnvioAnalMutuario
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 137319
        mmTop = 5556
        mmWidth = 19315
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'VLR_PREV_FIN'
        DataPipeline = pplItensEnvioAnalMutuario
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 227807
        mmTop = 5556
        mmWidth = 19315
        BandType = 7
      end
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc13'
        DataField = 'VLR_EFET_FIN'
        DataPipeline = pplItensEnvioAnalMutuario
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 248973
        mmTop = 5556
        mmWidth = 19315
        BandType = 7
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        Pen.Width = 2
        mmHeight = 6350
        mmLeft = 18785
        mmTop = 4233
        mmWidth = 32544
        BandType = 7
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        Caption = 'Mutuário(s)  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 31750
        mmTop = 5556
        mmWidth = 16669
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc14'
        DataField = 'NOME'
        DataPipeline = pplItensEnvioAnalMutuario
        DisplayFormat = '#,#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 3175
        mmLeft = 20108
        mmTop = 5556
        mmWidth = 10848
        BandType = 7
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'PATRO'
      DataPipeline = pplItensEnvioAnalMutuario
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11113
        mmPrintPosition = 0
        object ppShape1: TppShape
          OnPrint = ppShape1Print
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          Pen.Width = 0
          mmHeight = 11113
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'PATRO'
          DataPipeline = pplItensEnvioAnalMutuario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3175
          mmLeft = 2117
          mmTop = 529
          mmWidth = 92604
          BandType = 3
          GroupNo = 1
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 10583
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'Vlr.Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 137319
          mmTop = 7144
          mmWidth = 19315
          BandType = 3
          GroupNo = 1
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Folha da Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 142082
          mmTop = 2646
          mmWidth = 30692
          BandType = 3
          GroupNo = 1
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          AutoSize = False
          Caption = 'Vlr.Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 158486
          mmTop = 7144
          mmWidth = 19315
          BandType = 3
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Vlr.Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 182563
          mmTop = 7144
          mmWidth = 19315
          BandType = 3
          GroupNo = 1
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Vlr.Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 203730
          mmTop = 7144
          mmWidth = 19315
          BandType = 3
          GroupNo = 1
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = 'Folha de Benefícios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 189707
          mmTop = 2646
          mmWidth = 25929
          BandType = 3
          GroupNo = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Vlr.Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 227807
          mmTop = 7144
          mmWidth = 19315
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Vlr.Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 248973
          mmTop = 7144
          mmWidth = 19315
          BandType = 3
          GroupNo = 1
        end
        object ppLine8: TppLine
          UserName = 'Line8'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 227542
          mmTop = 6085
          mmWidth = 41010
          BandType = 3
          GroupNo = 1
        end
        object ppLabel21: TppLabel
          UserName = 'Label201'
          Caption = 'Financeiro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 241036
          mmTop = 2646
          mmWidth = 14023
          BandType = 3
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 20108
          mmTop = 7144
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Mutuário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 39158
          mmTop = 7144
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 182298
          mmTop = 6085
          mmWidth = 41010
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 137054
          mmTop = 6085
          mmWidth = 41010
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 17463
        mmPrintPosition = 0
        object ppShape4: TppShape
          UserName = 'Shape4'
          Pen.Width = 2
          mmHeight = 6350
          mmLeft = 135732
          mmTop = 2381
          mmWidth = 134409
          BandType = 5
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLR_PREV_PATRO'
          DataPipeline = pplItensEnvioAnalMutuario
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 137319
          mmTop = 3704
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VLR_EFET_BENEF'
          DataPipeline = pplItensEnvioAnalMutuario
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 203730
          mmTop = 3704
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VLR_EFET_PATRO'
          DataPipeline = pplItensEnvioAnalMutuario
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 158486
          mmTop = 3704
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'VLR_PREV_FIN'
          DataPipeline = pplItensEnvioAnalMutuario
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 227807
          mmTop = 3704
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'VLR_PREV_BENEF'
          DataPipeline = pplItensEnvioAnalMutuario
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 182563
          mmTop = 3704
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'VLR_EFET_FIN'
          DataPipeline = pplItensEnvioAnalMutuario
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 248973
          mmTop = 3704
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label2'
          Caption = 'Total da Patrocinadora:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 102659
          mmTop = 3704
          mmWidth = 33073
          BandType = 5
          GroupNo = 0
        end
        object ppShape5: TppShape
          UserName = 'Shape5'
          Pen.Width = 2
          mmHeight = 6350
          mmLeft = 18785
          mmTop = 2381
          mmWidth = 32544
          BandType = 5
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label101'
          Caption = 'Mutuário(s)  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 31750
          mmTop = 3704
          mmWidth = 16669
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'NOME'
          DataPipeline = pplItensEnvioAnalMutuario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3175
          mmLeft = 20108
          mmTop = 3704
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryItensEnvioAnalMutuario: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.IDPATRO, PTR.NOME AS PATRO,'
      '   CON.IDPLANOPREV, PLP.NOME AS PLANO,'
      ''
      '   CON.NOME, CON.MATRICULA,'
      ''
      '   NVL(HMB.VLRPREVISTO, 0) AS VLR_PREV_BENEF,'
      '   NVL(HMB.VLREFETIVO, 0)  AS VLR_EFET_BENEF,'
      '   NVL(HMP.VLRPREVISTO, 0) AS VLR_PREV_PATRO,'
      '   NVL(HMP.VLREFETIVO, 0)  AS VLR_EFET_PATRO,'
      '   NVL(HMF.VLRPREVISTO, 0) AS VLR_PREV_FIN,'
      '   NVL(HMF.VLREFETIVO, 0)  AS VLR_EFET_FIN'
      'FROM'
      '   PESSOA       PTR,'
      '   PLANPREV     PLP,'
      ''
      '   ('
      '   SELECT DISTINCT'
      '      IDPATRO, IDPLANOPREV, IDBENEF,'
      '      NOME, MATRICULA, IDEMPRESAPROP'
      '   FROM'
      '      VWCONTRATOEP'
      '   ) CON,'
      ''
      '   ('
      
        '   SELECT                                                       ' +
        '                        '
      
        '      CON.IDBENEF,                                              ' +
        '                        '
      
        '      SUM(HME.HMEVLRPREVISTO) AS VLRPREVISTO, SUM(HME.HMEVLREFET' +
        'IVO) AS VLREFETIVO      '
      
        '   FROM                                                         ' +
        '                        '
      '      VW_MOVEP       HME,'
      '      CONTRATOEMPTMO CON'
      '   WHERE'
      '          HME.HMEFORMACOBRANCA = '#39'F'#39
      '      AND HME.HMETIPOFOLHA     = '#39'B'#39
      '      AND HME.EVENTO           IN (1, 2, 3, 4)'
      '      AND HME.FLGENVIO         IS NULL'
      
        '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0' +
        ') )'
      '      AND HME.HMEANOCOBRANCA   = 2002'
      '      AND HME.HMEMESCOBRANCA   = 7'
      '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '      AND HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO'
      '   GROUP BY'
      '      CON.IDBENEF'
      '   ) HMB,'
      ''
      '   ('
      '   SELECT'
      '      CON.IDBENEF,'
      
        '      SUM(HME.HMEVLRPREVISTO) AS VLRPREVISTO, SUM(HME.HMEVLREFET' +
        'IVO) AS VLREFETIVO'
      '   FROM'
      '      VW_MOVEP       HME,'
      '      CONTRATOEMPTMO CON'
      '   WHERE'
      '          HME.HMEFORMACOBRANCA = '#39'F'#39
      '      AND HME.HMETIPOFOLHA     = '#39'P'#39
      '      AND HME.EVENTO           IN (1, 2, 3, 4)'
      '      AND HME.FLGENVIO         IS NULL'
      
        '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0' +
        ') )'
      '      AND HME.HMEANOCOBRANCA   = 2002'
      '      AND HME.HMEMESCOBRANCA   = 7'
      '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '      AND HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO'
      '   GROUP BY'
      '      CON.IDBENEF'
      '   ) HMP,'
      ''
      '   ('
      '   SELECT'
      '      CON.IDBENEF,'
      
        '      SUM(HME.HMEVLRPREVISTO) AS VLRPREVISTO, SUM(HME.HMEVLREFET' +
        'IVO) AS VLREFETIVO'
      '   FROM'
      '      VW_MOVEP       HME,'
      '      CONTRATOEMPTMO CON'
      '   WHERE'
      '          HME.HMEFORMACOBRANCA = '#39'C'#39
      '      AND HME.EVENTO           IN (1, 2, 3, 4)'
      '      AND HME.FLGENVIO         IS NULL'
      
        '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0' +
        ') )'
      '      AND HME.HMEANOCOBRANCA   = 2002'
      '      AND HME.HMEMESCOBRANCA   = 7'
      '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '      AND HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO'
      '   GROUP BY'
      '      CON.IDBENEF'
      '   ) HMF'
      ''
      'WHERE'
      '       CON.IDPATRO      = PTR.IDPESSOA'
      '   AND CON.IDPLANOPREV  = PLP.IDPLANOPREV'
      '   AND CON.IDBENEF      = HMB.IDBENEF(+)'
      '   AND CON.IDBENEF      = HMP.IDBENEF(+)'
      '   AND CON.IDBENEF      = HMF.IDBENEF(+)'
      ''
      'ORDER BY'
      '   PTR.NOME, CON.NOME')
    ValidateWithMask = True
    Left = 144
    Top = 80
    object qryItensEnvioAnalMutuarioIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryItensEnvioAnalMutuarioPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryItensEnvioAnalMutuarioIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryItensEnvioAnalMutuarioPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object qryItensEnvioAnalMutuarioNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryItensEnvioAnalMutuarioMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryItensEnvioAnalMutuarioVLR_PREV_BENEF: TFloatField
      FieldName = 'VLR_PREV_BENEF'
    end
    object qryItensEnvioAnalMutuarioVLR_EFET_BENEF: TFloatField
      FieldName = 'VLR_EFET_BENEF'
    end
    object qryItensEnvioAnalMutuarioVLR_PREV_PATRO: TFloatField
      FieldName = 'VLR_PREV_PATRO'
    end
    object qryItensEnvioAnalMutuarioVLR_EFET_PATRO: TFloatField
      FieldName = 'VLR_EFET_PATRO'
    end
    object qryItensEnvioAnalMutuarioVLR_PREV_FIN: TFloatField
      FieldName = 'VLR_PREV_FIN'
    end
    object qryItensEnvioAnalMutuarioVLR_EFET_FIN: TFloatField
      FieldName = 'VLR_EFET_FIN'
    end
  end
end
