inherited dtmRelItensEnvioContratoCAPCAR: TdtmRelItensEnvioContratoCAPCAR
  Left = 255
  Top = 219
  Width = 257
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
  object pplItensEnvioContratoCAPCAR: TppBDEPipeline
    DataSource = dtsItensEnvioContratoCAPCAR
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lExemplo1'
    Left = 152
    Top = 56
  end
  object dtsItensEnvioContratoCAPCAR: TwwDataSource
    AutoEdit = False
    DataSet = qryItensEnvioContratoCAPCAR
    Left = 152
    Top = 68
  end
  object rtpItensEnvioContratoCAPCAR: TppReport
    AutoStop = False
    DataPipeline = pplItensEnvioContratoCAPCAR
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Itens Enviados (Sintético)'
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
    Left = 152
    Top = 8
    Version = '5.5'
    mmColumnWidth = 270542
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28575
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 
          'Valores Enviados/Recebidos por Patrocinadora (sintético por Cont' +
          'rato)'
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
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 39688
        mmTop = 16669
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Situação dos Participantes:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 21167
        mmWidth = 39158
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Mês de Referência:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 11377
        mmTop = 16669
        mmWidth = 28046
        BandType = 0
      end
      object dtmRelItensEnviolContrato_lblSitPart: TppLabel
        UserName = 'dtmRelItensEnviolContrato_lblSitPart'
        Caption = '< Todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 39688
        mmTop = 21167
        mmWidth = 12700
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
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
      object ppLine4: TppLine
        OnPrint = ppLine4Print
        UserName = 'Line4'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 5821
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NOME'
        DataPipeline = pplItensEnvioContratoCAPCAR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 35983
        mmTop = 1058
        mmWidth = 65881
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLR_PREV_PATRO'
        DataPipeline = pplItensEnvioContratoCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 151077
        mmTop = 1058
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VLR_EFET_PATRO'
        DataPipeline = pplItensEnvioContratoCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 170127
        mmTop = 1058
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VLR_PREV_BENEF'
        DataPipeline = pplItensEnvioContratoCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 191294
        mmTop = 1058
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VLR_EFET_BENEF'
        DataPipeline = pplItensEnvioContratoCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 210344
        mmTop = 1058
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'VLR_PREV_FIN'
        DataPipeline = pplItensEnvioContratoCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 231511
        mmTop = 1058
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'VLR_EFET_FIN'
        DataPipeline = pplItensEnvioContratoCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 250561
        mmTop = 1058
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplItensEnvioContratoCAPCAR
        DisplayFormat = '#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 1058
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'MATRICULA'
        DataPipeline = pplItensEnvioContratoCAPCAR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 17992
        mmTop = 1058
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'TCEDESCRICAO'
        DataPipeline = pplItensEnvioContratoCAPCAR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 103717
        mmTop = 1058
        mmWidth = 47625
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
        mmLeft = 242888
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
        mmLeft = 132027
        mmTop = 5556
        mmWidth = 17727
        BandType = 7
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 6350
        mmLeft = 149490
        mmTop = 4233
        mmWidth = 120915
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'VLR_EFET_PATRO'
        DataPipeline = pplItensEnvioContratoCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 170127
        mmTop = 5556
        mmWidth = 18256
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'VLR_PREV_BENEF'
        DataPipeline = pplItensEnvioContratoCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 191294
        mmTop = 5556
        mmWidth = 18256
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'VLR_EFET_BENEF'
        DataPipeline = pplItensEnvioContratoCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 210344
        mmTop = 5556
        mmWidth = 18256
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc11'
        DataField = 'VLR_PREV_PATRO'
        DataPipeline = pplItensEnvioContratoCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 151077
        mmTop = 5556
        mmWidth = 18256
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'VLR_PREV_FIN'
        DataPipeline = pplItensEnvioContratoCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 231511
        mmTop = 5556
        mmWidth = 18256
        BandType = 7
      end
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc13'
        DataField = 'VLR_EFET_FIN'
        DataPipeline = pplItensEnvioContratoCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 250561
        mmTop = 5556
        mmWidth = 18256
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
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Contrato(s)  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 31750
        mmTop = 5556
        mmWidth = 16404
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc14'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplItensEnvioContratoCAPCAR
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
      DataPipeline = pplItensEnvioContratoCAPCAR
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
          Brush.Color = 15263976
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
          DataPipeline = pplItensEnvioContratoCAPCAR
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3175
          mmLeft = 1058
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
          Caption = 'Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 151077
          mmTop = 7144
          mmWidth = 18256
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
          mmLeft = 155311
          mmTop = 2381
          mmWidth = 30692
          BandType = 3
          GroupNo = 1
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          AutoSize = False
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 169863
          mmTop = 7144
          mmWidth = 18521
          BandType = 3
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 191294
          mmTop = 7144
          mmWidth = 18256
          BandType = 3
          GroupNo = 1
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 210080
          mmTop = 7144
          mmWidth = 18521
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
          mmLeft = 197909
          mmTop = 2646
          mmWidth = 25929
          BandType = 3
          GroupNo = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 231511
          mmTop = 7144
          mmWidth = 18256
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 250296
          mmTop = 7144
          mmWidth = 18521
          BandType = 3
          GroupNo = 1
        end
        object ppLine8: TppLine
          UserName = 'Line8'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 233363
          mmTop = 6085
          mmWidth = 35719
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
          mmLeft = 244211
          mmTop = 2646
          mmWidth = 14023
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 1058
          mmTop = 7144
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
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
          mmLeft = 17992
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
          mmLeft = 35983
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
          mmLeft = 193146
          mmTop = 6085
          mmWidth = 35719
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 152929
          mmTop = 6085
          mmWidth = 35719
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          AutoSize = False
          Caption = 'Tipo de Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 103717
          mmTop = 7144
          mmWidth = 26194
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 17463
        mmPrintPosition = 0
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
        object ppShape4: TppShape
          UserName = 'Shape4'
          Pen.Width = 2
          mmHeight = 6350
          mmLeft = 149490
          mmTop = 2381
          mmWidth = 120915
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
          DataPipeline = pplItensEnvioContratoCAPCAR
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
          mmLeft = 151077
          mmTop = 3704
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VLR_EFET_BENEF'
          DataPipeline = pplItensEnvioContratoCAPCAR
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
          mmLeft = 210344
          mmTop = 3704
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VLR_EFET_PATRO'
          DataPipeline = pplItensEnvioContratoCAPCAR
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
          mmLeft = 170127
          mmTop = 3704
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'VLR_PREV_FIN'
          DataPipeline = pplItensEnvioContratoCAPCAR
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
          mmLeft = 231511
          mmTop = 3704
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'VLR_PREV_BENEF'
          DataPipeline = pplItensEnvioContratoCAPCAR
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
          mmLeft = 191294
          mmTop = 3704
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'VLR_EFET_FIN'
          DataPipeline = pplItensEnvioContratoCAPCAR
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
          mmLeft = 250561
          mmTop = 3704
          mmWidth = 18256
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
          mmLeft = 116681
          mmTop = 3704
          mmWidth = 33073
          BandType = 5
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Contrato(s)  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 31750
          mmTop = 3704
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplItensEnvioContratoCAPCAR
          DisplayFormat = '#,#0'
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
  object qryItensEnvioContratoCAPCAR: TwwQuery
    CachedUpdates = True
    BeforeOpen = qryItensEnvioContratoCAPCARBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.IDCONTRATOEMPTMO,'
      ''
      '   CON.IDPATRO, PTR.NOME AS PATRO,'
      '   CON.IDPLANOPREV, PLP.NOME AS PLANO,'
      ''
      '   CON.NOME, CON.MATRICULA, CON.TCEDESCRICAO,'
      ''
      '   NVL(HBP.VLRPREVISTO, 0) AS VLR_PREV_BENEF,'
      '   NVL(HBE.VLREFETIVO, 0)  AS VLR_EFET_BENEF,'
      '   NVL(HPP.VLRPREVISTO, 0) AS VLR_PREV_PATRO,'
      '   NVL(HPE.VLREFETIVO, 0)  AS VLR_EFET_PATRO,'
      '   NVL(HFP.VLRPREVISTO, 0) AS VLR_PREV_FIN,'
      '   NVL(HFE.VLREFETIVO, 0)  AS VLR_EFET_FIN'
      'FROM'
      '   PESSOA       PTR,'
      '   VWCONTRATOEP CON,'
      '   PLANPREV     PLP,'
      '   ('
      '   SELECT'
      '      HME.IDCONTRATOEMPTMO,'
      '      SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME'
      '   WHERE'
      '          HME.HMEFORMACOBRANCA = '#39'F'#39
      '      AND HME.HMETIPOFOLHA     = '#39'B'#39
      '      AND HME.HMETIPOMOV       IN (1, 2, 3, 4, 6, 7)'
      '      AND HME.FLGENVIO         IS NULL'
      
        '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0' +
        ') )'
      
        '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO = 0) ' +
        ')'
      
        '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO = 0) ' +
        ')'
      '      AND HME.HMEANOCOBRANCA   = 2002'
      '      AND HME.HMEMESCOBRANCA   = 2'
      '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '   GROUP BY'
      '      HME.IDCONTRATOEMPTMO'
      '   ) HBP,'
      '   ('
      '   SELECT'
      '      HME.IDCONTRATOEMPTMO,'
      '      SUM(NVL(HME.HMEVLREFETIVO, 0)) AS VLREFETIVO'
      '   FROM'
      '      HISTMOVEMPTMO HME'
      '   WHERE'
      '          HME.HMEFORMACOBRANCA = '#39'F'#39
      '      AND HME.HMETIPOFOLHA     = '#39'B'#39
      '      AND HME.HMETIPOMOV       IN (1, 2, 3, 4, 6, 7)'
      
        '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0' +
        ') )'
      
        '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO = 0) ' +
        ')'
      
        '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO = 0) ' +
        ')'
      '      AND HME.HMEANOCOBRANCA   = 2002'
      '      AND HME.HMEMESCOBRANCA   = 2'
      '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '   GROUP BY'
      '      HME.IDCONTRATOEMPTMO'
      '   ) HBE,'
      '   ('
      '   SELECT'
      '      HME.IDCONTRATOEMPTMO,'
      '      SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME'
      '   WHERE'
      '          HME.HMEFORMACOBRANCA = '#39'F'#39
      '      AND HME.HMETIPOFOLHA     = '#39'P'#39
      '      AND HME.HMETIPOMOV       IN (1, 2, 3, 4, 6, 7)'
      '      AND HME.FLGENVIO         IS NULL'
      
        '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0' +
        ') )'
      
        '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO = 0) ' +
        ')'
      
        '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO = 0) ' +
        ')'
      '      AND HME.HMEANOCOBRANCA   = 2002'
      '      AND HME.HMEMESCOBRANCA   = 2'
      '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '   GROUP BY'
      '      HME.IDCONTRATOEMPTMO'
      '   ) HPP,'
      '   ('
      '   SELECT'
      '      HME.IDCONTRATOEMPTMO,'
      '      SUM(NVL(HME.HMEVLREFETIVO, 0)) AS VLREFETIVO'
      '   FROM'
      '      HISTMOVEMPTMO HME'
      '   WHERE'
      '          HME.HMEFORMACOBRANCA = '#39'F'#39
      '      AND HME.HMETIPOFOLHA     = '#39'P'#39
      '      AND HME.HMETIPOMOV       IN (1, 2, 3, 4, 6, 7)'
      
        '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0' +
        ') )'
      
        '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO = 0) ' +
        ')'
      
        '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO = 0) ' +
        ')'
      '      AND HME.HMEANOCOBRANCA   = 2002'
      '      AND HME.HMEMESCOBRANCA   = 2'
      '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '   GROUP BY'
      '      HME.IDCONTRATOEMPTMO'
      '   ) HPE,'
      '   ('
      '   SELECT'
      '      HME.IDCONTRATOEMPTMO,'
      '      SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME'
      '   WHERE'
      '          HME.HMEFORMACOBRANCA = '#39'C'#39
      '      AND HME.HMETIPOMOV       IN (1, 2, 3, 4, 6, 7)'
      '      AND HME.FLGENVIO         IS NULL'
      
        '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0' +
        ') )'
      
        '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO = 0) ' +
        ')'
      
        '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO = 0) ' +
        ')'
      '      AND HME.HMEANOCOBRANCA   = 2002'
      '      AND HME.HMEMESCOBRANCA   = 2'
      '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '   GROUP BY'
      '      HME.IDCONTRATOEMPTMO'
      '   ) HFP,'
      '   ('
      '   SELECT'
      '      HME.IDCONTRATOEMPTMO,'
      '      SUM(NVL(HME.HMEVLREFETIVO, 0)) AS VLREFETIVO'
      '   FROM'
      '      HISTMOVEMPTMO HME'
      '   WHERE'
      '          HME.HMEFORMACOBRANCA = '#39'C'#39
      '      AND HME.HMETIPOMOV       IN (1, 2, 3, 4, 6, 7)'
      
        '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0' +
        ') )'
      
        '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO = 0) ' +
        ')'
      
        '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO = 0) ' +
        ')'
      '      AND HME.HMEANOCOBRANCA   = 2002'
      '      AND HME.HMEMESCOBRANCA   = 2'
      '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '   GROUP BY'
      '      HME.IDCONTRATOEMPTMO'
      '   ) HFE'
      ''
      'WHERE'
      '       CON.IDEMPRESAPROP    = 1'
      '   AND CON.IDPATRO          = PTR.IDPESSOA'
      '   AND CON.IDPLANOPREV      = PLP.IDPLANOPREV'
      '   AND CON.IDCONTRATOEMPTMO = HBP.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO = HBE.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO = HPP.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO = HPE.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO = HFP.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO = HFE.IDCONTRATOEMPTMO(+)'
      ''
      'ORDER BY'
      '   PTR.NOME, CON.NOME')
    ValidateWithMask = True
    Left = 152
    Top = 80
    object qryItensEnvioContratoCAPCARIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryItensEnvioContratoCAPCARIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryItensEnvioContratoCAPCARPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryItensEnvioContratoCAPCARIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryItensEnvioContratoCAPCARPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object qryItensEnvioContratoCAPCARNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryItensEnvioContratoCAPCARMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryItensEnvioContratoCAPCARTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryItensEnvioContratoCAPCARVLR_PREV_BENEF: TFloatField
      FieldName = 'VLR_PREV_BENEF'
    end
    object qryItensEnvioContratoCAPCARVLR_EFET_BENEF: TFloatField
      FieldName = 'VLR_EFET_BENEF'
    end
    object qryItensEnvioContratoCAPCARVLR_PREV_PATRO: TFloatField
      FieldName = 'VLR_PREV_PATRO'
    end
    object qryItensEnvioContratoCAPCARVLR_EFET_PATRO: TFloatField
      FieldName = 'VLR_EFET_PATRO'
    end
    object qryItensEnvioContratoCAPCARVLR_PREV_FIN: TFloatField
      FieldName = 'VLR_PREV_FIN'
    end
    object qryItensEnvioContratoCAPCARVLR_EFET_FIN: TFloatField
      FieldName = 'VLR_EFET_FIN'
    end
  end
end
