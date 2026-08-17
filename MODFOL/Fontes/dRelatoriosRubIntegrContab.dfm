inherited dtmRelatoriosRubIntegrContab: TdtmRelatoriosRubIntegrContab
  Left = 300
  Top = 195
  Width = 281
  Height = 206
  Caption = 'dtmRelatoriosRubIntegrContab'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
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
  inherited qryExemplo: TwwQuery
    Active = True
  end
  object rpRubIntegrContab: TppReport
    AutoStop = False
    DataPipeline = ppRubIntegrContab
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relação das Rubricas de Integração Contábil'
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
    Language = lgPortugueseBrazil
    Left = 106
    Top = 112
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 16669
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Relação das Rubricas de Integração Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 2911
        mmTop = 9790
        mmWidth = 191824
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'EMPRESA'
        DataPipeline = ppRubIntegrContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 2911
        mmTop = 1852
        mmWidth = 191824
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 32279
      mmPrintPosition = 0
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Conta Contábil a Crédito:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 1058
        mmWidth = 37571
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CONTACREDITO'
        DataPipeline = ppRubIntegrContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 42598
        mmTop = 1058
        mmWidth = 52123
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Conta Contábil a Débito:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 103452
        mmTop = 1058
        mmWidth = 37571
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CONTADEBITO'
        DataPipeline = ppRubIntegrContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 142611
        mmTop = 1058
        mmWidth = 52123
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Centro de Custo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 6085
        mmWidth = 26194
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'CENTRO_CUSTO'
        DataPipeline = ppRubIntegrContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 31221
        mmTop = 6085
        mmWidth = 72761
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = ' Tipo de Desembolso:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 11113
        mmWidth = 33073
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'TIPO_DESEMB'
        DataPipeline = ppRubIntegrContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 38100
        mmTop = 11113
        mmWidth = 65881
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Favorecido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 16140
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'FAVORECIDO'
        DataPipeline = ppRubIntegrContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 23548
        mmTop = 16140
        mmWidth = 72761
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Centro de Responsabilidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 21167
        mmWidth = 43921
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'CENT_RESPON'
        DataPipeline = ppRubIntegrContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 48948
        mmTop = 21167
        mmWidth = 72761
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Unidade de Negócios:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 26194
        mmWidth = 33602
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'UNID_NEGOC'
        DataPipeline = ppRubIntegrContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 38629
        mmTop = 26194
        mmWidth = 72761
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 2910
        mmTop = 30956
        mmWidth = 191823
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      AfterPrint = ppSummaryBand1AfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCRPROVDESC'
      DataPipeline = ppRubIntegrContab
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          Pen.Color = clSilver
          mmHeight = 7144
          mmLeft = 2910
          mmTop = 0
          mmWidth = 191823
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DESCRPROVDESC'
          DataPipeline = ppRubIntegrContab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 67998
          mmTop = 1588
          mmWidth = 72761
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'TIPO'
          DataPipeline = ppRubIntegrContab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 157692
          mmTop = 1588
          mmWidth = 32808
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Rubrica:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 53446
          mmTop = 1588
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Tipo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 147109
          mmTop = 1588
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          DataField = 'CODPROVDESC'
          DataPipeline = ppRubIntegrContab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 18521
          mmTop = 1588
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Código:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 3969
          mmTop = 1588
          mmWidth = 12965
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
  object ppRubIntegrContab: TppBDEPipeline
    DataSource = dsRubIntegrContab
    UserName = 'lExemplo1'
    Left = 106
    Top = 99
    object ppCadRubIntegrContabppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 0
    end
    object ppCadRubIntegrContabppField2: TppField
      FieldAlias = 'CODPROVDESC'
      FieldName = 'CODPROVDESC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 1
    end
    object ppCadRubIntegrContabppField3: TppField
      FieldAlias = 'DESCRPROVDESC'
      FieldName = 'DESCRPROVDESC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 2
    end
    object ppCadRubIntegrContabppField4: TppField
      FieldAlias = 'CONTACREDITO'
      FieldName = 'CONTACREDITO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
    object ppCadRubIntegrContabppField5: TppField
      FieldAlias = 'CONTADEBITO'
      FieldName = 'CONTADEBITO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object ppCadRubIntegrContabppField6: TppField
      FieldAlias = 'CENTRO_CUSTO'
      FieldName = 'CENTRO_CUSTO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object ppCadRubIntegrContabppField7: TppField
      FieldAlias = 'TIPO_DESEMB'
      FieldName = 'TIPO_DESEMB'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object ppCadRubIntegrContabppField8: TppField
      FieldAlias = 'RECDES'
      FieldName = 'RECDES'
      FieldLength = 1
      DisplayWidth = 1
      Position = 7
    end
    object ppCadRubIntegrContabppField9: TppField
      FieldAlias = 'FAVORECIDO'
      FieldName = 'FAVORECIDO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
    object ppCadRubIntegrContabppField10: TppField
      FieldAlias = 'CENT_RESPON'
      FieldName = 'CENT_RESPON'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
    object ppCadRubIntegrContabppField11: TppField
      FieldAlias = 'UNID_NEGOC'
      FieldName = 'UNID_NEGOC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 10
    end
  end
  object dsRubIntegrContab: TwwDataSource
    DataSet = qryRubIntegrContab
    Left = 106
    Top = 86
  end
  object qryRubIntegrContab: TwwQuery
    Active = True
    AfterOpen = qryRubIntegrContabAfterOpen
    AfterScroll = qryRubIntegrContabAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'1'#39' AS EMPRESA,'
      '  '#39'1'#39' AS CODPROVDESC,'
      '  '#39'1'#39' AS DESCRPROVDESC,'
      '  '#39'1'#39' AS CONTACREDITO,'
      '  '#39'1'#39' AS CONTADEBITO,'
      '  '#39'1'#39' AS CENTRO_CUSTO,'
      '  '#39'1'#39' AS TIPO_DESEMB,'
      '  '#39'1'#39' AS RECDES,'
      '  '#39'1'#39' AS FAVORECIDO,'
      '  '#39'1'#39' AS CENT_RESPON,'
      '  '#39'1'#39' AS UNID_NEGOC'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    ValidateWithMask = True
    Left = 106
    Top = 72
  end
end
