inherited dtmRelResumoCarteiraPlanoPatro: TdtmRelResumoCarteiraPlanoPatro
  Left = 467
  Top = 238
  Width = 334
  Height = 167
  Caption = 'dtmRelResumoCarteiraPlanoPatro'
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
  object pplResumoCarteiraPlanoPatro: TppBDEPipeline
    DataSource = dsFechamentoCarteira
    OpenDataSource = False
    UserName = 'lExemplo1'
    Left = 136
    Top = 56
    object pplResumoCarteiraPlanoPatroppField1: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplResumoCarteiraPlanoPatroppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplResumoCarteiraPlanoPatroppField3: TppField
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplResumoCarteiraPlanoPatroppField4: TppField
      FieldAlias = 'DESCPLANO'
      FieldName = 'DESCPLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplResumoCarteiraPlanoPatroppField5: TppField
      FieldAlias = 'IDTIPOCONTREMPTMO'
      FieldName = 'IDTIPOCONTREMPTMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplResumoCarteiraPlanoPatroppField6: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplResumoCarteiraPlanoPatroppField7: TppField
      FieldAlias = 'SALDOANTERIOR'
      FieldName = 'SALDOANTERIOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplResumoCarteiraPlanoPatroppField8: TppField
      FieldAlias = 'VLRCONCMES'
      FieldName = 'VLRCONCMES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplResumoCarteiraPlanoPatroppField9: TppField
      FieldAlias = 'VLRRENOVMES'
      FieldName = 'VLRRENOVMES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplResumoCarteiraPlanoPatroppField10: TppField
      FieldAlias = 'VLRPARCMES'
      FieldName = 'VLRPARCMES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplResumoCarteiraPlanoPatroppField11: TppField
      FieldAlias = 'VLRENCARGO'
      FieldName = 'VLRENCARGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplResumoCarteiraPlanoPatroppField12: TppField
      FieldAlias = 'VLRAMORT'
      FieldName = 'VLRAMORT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplResumoCarteiraPlanoPatroppField13: TppField
      FieldAlias = 'VLRQUITACAO'
      FieldName = 'VLRQUITACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplResumoCarteiraPlanoPatroppField14: TppField
      FieldAlias = 'VLRQUITMORT'
      FieldName = 'VLRQUITMORT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplResumoCarteiraPlanoPatroppField15: TppField
      FieldAlias = 'SALDOATUAL'
      FieldName = 'SALDOATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplResumoCarteiraPlanoPatroppField16: TppField
      FieldAlias = 'IDTIPOEMPTMO'
      FieldName = 'IDTIPOEMPTMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplResumoCarteiraPlanoPatroppField17: TppField
      FieldAlias = 'DESCTIPOEMPTMO'
      FieldName = 'DESCTIPOEMPTMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
  end
  object dsFechamentoCarteira: TwwDataSource
    DataSet = qryResumoCarteira
    Left = 136
    Top = 68
  end
  object rptResumoCarteiraPlanoPatro: TppReport
    AutoStop = False
    DataPipeline = pplResumoCarteiraPlanoPatro
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Resumo da Carteira'
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
    Left = 136
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
        Caption = 'Resumo da Carteira por Plano/Patrocinadora'
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
        mmLeft = 37835
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
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLine4: TppLine
        OnPrint = ppLine4Print
        UserName = 'Line4'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 5292
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 5292
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'TCEDESCRICAO'
        DataPipeline = pplResumoCarteiraPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 4763
        mmTop = 1058
        mmWidth = 78581
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'SALDOANTERIOR'
        DataPipeline = pplResumoCarteiraPlanoPatro
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 84402
        mmTop = 1058
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLRCONCMES'
        DataPipeline = pplResumoCarteiraPlanoPatro
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 111919
        mmTop = 1058
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VLRRENOVMES'
        DataPipeline = pplResumoCarteiraPlanoPatro
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 133350
        mmTop = 1058
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VLRPARCMES'
        DataPipeline = pplResumoCarteiraPlanoPatro
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 153459
        mmTop = 1058
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'VLRENCARGO'
        DataPipeline = pplResumoCarteiraPlanoPatro
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 173567
        mmTop = 1058
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VLRAMORT'
        DataPipeline = pplResumoCarteiraPlanoPatro
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 193940
        mmTop = 1058
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VLRQUITACAO'
        DataPipeline = pplResumoCarteiraPlanoPatro
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 213784
        mmTop = 1058
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VLRQUITMORT'
        DataPipeline = pplResumoCarteiraPlanoPatro
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 234157
        mmTop = 1058
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'SALDOATUAL'
        DataPipeline = pplResumoCarteiraPlanoPatro
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 248709
        mmTop = 1058
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'TVLRCONCMES'
        DataPipeline = pplResumoCarteiraPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 105569
        mmTop = 1058
        mmWidth = 5556
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'TVLRRENOVMES'
        DataPipeline = pplResumoCarteiraPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 127265
        mmTop = 1058
        mmWidth = 5556
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'TVLRPARCMES'
        DataPipeline = pplResumoCarteiraPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 147638
        mmTop = 1058
        mmWidth = 5556
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'TVLRENCARGO'
        DataPipeline = pplResumoCarteiraPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 167746
        mmTop = 1058
        mmWidth = 5556
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'TVLRAMORT'
        DataPipeline = pplResumoCarteiraPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 187855
        mmTop = 1058
        mmWidth = 5556
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'TVLRQUITACAO'
        DataPipeline = pplResumoCarteiraPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 207963
        mmTop = 1058
        mmWidth = 5556
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'TVLRQUITMORT'
        DataPipeline = pplResumoCarteiraPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 228071
        mmTop = 1058
        mmWidth = 5556
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
        mmLeft = 238919
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 20902
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 5821
        mmLeft = 81756
        mmTop = 4498
        mmWidth = 188913
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
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'VLRRENOVMES'
        DataPipeline = pplResumoCarteiraPlanoPatro
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 133350
        mmTop = 5556
        mmWidth = 13758
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc11'
        DataField = 'VLRPARCMES'
        DataPipeline = pplResumoCarteiraPlanoPatro
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 153459
        mmTop = 5556
        mmWidth = 13758
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'SALDOANTERIOR'
        DataPipeline = pplResumoCarteiraPlanoPatro
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 84402
        mmTop = 5556
        mmWidth = 19315
        BandType = 7
      end
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc13'
        DataField = 'VLRCONCMES'
        DataPipeline = pplResumoCarteiraPlanoPatro
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 111919
        mmTop = 5556
        mmWidth = 13758
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc14'
        DataField = 'VLRENCARGO'
        DataPipeline = pplResumoCarteiraPlanoPatro
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 173567
        mmTop = 5556
        mmWidth = 13758
        BandType = 7
      end
      object ppDBCalc15: TppDBCalc
        UserName = 'DBCalc15'
        DataField = 'VLRAMORT'
        DataPipeline = pplResumoCarteiraPlanoPatro
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 193940
        mmTop = 5556
        mmWidth = 13758
        BandType = 7
      end
      object ppDBCalc16: TppDBCalc
        UserName = 'DBCalc16'
        DataField = 'VLRQUITACAO'
        DataPipeline = pplResumoCarteiraPlanoPatro
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 213784
        mmTop = 5556
        mmWidth = 13758
        BandType = 7
      end
      object ppDBCalc17: TppDBCalc
        UserName = 'DBCalc17'
        DataField = 'VLRQUITMORT'
        DataPipeline = pplResumoCarteiraPlanoPatro
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 234157
        mmTop = 5556
        mmWidth = 13758
        BandType = 7
      end
      object ppDBCalc18: TppDBCalc
        UserName = 'DBCalc18'
        DataField = 'SALDOATUAL'
        DataPipeline = pplResumoCarteiraPlanoPatro
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 248709
        mmTop = 5556
        mmWidth = 19315
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
        mmLeft = 62442
        mmTop = 5292
        mmWidth = 17727
        BandType = 7
      end
      object ppDBCalc58: TppDBCalc
        UserName = 'DBCalc58'
        DataField = 'TVLRCONCMES'
        DataPipeline = pplResumoCarteiraPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 105569
        mmTop = 5556
        mmWidth = 5556
        BandType = 7
      end
      object ppDBCalc59: TppDBCalc
        UserName = 'DBCalc59'
        DataField = 'TVLRRENOVMES'
        DataPipeline = pplResumoCarteiraPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 127265
        mmTop = 5556
        mmWidth = 5556
        BandType = 7
      end
      object ppDBCalc60: TppDBCalc
        UserName = 'DBCalc60'
        DataField = 'TVLRPARCMES'
        DataPipeline = pplResumoCarteiraPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 147638
        mmTop = 5556
        mmWidth = 5556
        BandType = 7
      end
      object ppDBCalc61: TppDBCalc
        UserName = 'DBCalc61'
        DataField = 'TVLRENCARGO'
        DataPipeline = pplResumoCarteiraPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 167746
        mmTop = 5556
        mmWidth = 5556
        BandType = 7
      end
      object ppDBCalc62: TppDBCalc
        UserName = 'DBCalc62'
        DataField = 'TVLRAMORT'
        DataPipeline = pplResumoCarteiraPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 187855
        mmTop = 5556
        mmWidth = 5556
        BandType = 7
      end
      object ppDBCalc63: TppDBCalc
        UserName = 'DBCalc63'
        DataField = 'TVLRQUITACAO'
        DataPipeline = pplResumoCarteiraPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 207963
        mmTop = 5556
        mmWidth = 5556
        BandType = 7
      end
      object ppDBCalc64: TppDBCalc
        UserName = 'DBCalc501'
        DataField = 'TVLRQUITMORT'
        DataPipeline = pplResumoCarteiraPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 228071
        mmTop = 5556
        mmWidth = 5556
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCTIPOEMPTMO'
      DataPipeline = pplResumoCarteiraPlanoPatro
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 8996
          mmLeft = 0
          mmTop = 529
          mmWidth = 270542
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'DESCTIPOEMPTMO'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 7938
          mmLeft = 1058
          mmTop = 1323
          mmWidth = 87048
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 9260
          mmWidth = 270542
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Saldo Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 252413
          mmTop = 5821
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label2'
          Caption = 'por Morte'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 234950
          mmTop = 5821
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Antecipadas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 211138
          mmTop = 5821
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Amortizações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 189442
          mmTop = 5821
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Encargos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 174625
          mmTop = 5821
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Geradas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 156104
          mmTop = 5821
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Renovações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 130704
          mmTop = 5821
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Concessões'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 109009
          mmTop = 5821
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          Caption = 'Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 89959
          mmTop = 5821
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 95779
          mmTop = 2646
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Parcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 155575
          mmTop = 2910
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label101'
          Caption = 'Quitações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 213784
          mmTop = 2381
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'Quitações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 234157
          mmTop = 2646
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 7938
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 5
          GroupNo = 0
        end
        object rptContratosAdminAnalShape1: TppShape
          UserName = 'rptContratosAdminAnalShape1'
          mmHeight = 5556
          mmLeft = 81756
          mmTop = 1852
          mmWidth = 188913
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLRRENOVMES'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 133350
          mmTop = 2646
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VLRPARCMES'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 153459
          mmTop = 2646
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'SALDOANTERIOR'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 84402
          mmTop = 2646
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'VLRCONCMES'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 111919
          mmTop = 2646
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'VLRENCARGO'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 173567
          mmTop = 2646
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'VLRAMORT'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 193940
          mmTop = 2646
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'VLRQUITACAO'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 213784
          mmTop = 2646
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'VLRQUITMORT'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 234157
          mmTop = 2646
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'SALDOATUAL'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 248709
          mmTop = 2646
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Total do Tipo de Empréstimo:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 35190
          mmTop = 2646
          mmWidth = 44979
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc51: TppDBCalc
          UserName = 'DBCalc51'
          DataField = 'TVLRCONCMES'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 105569
          mmTop = 2910
          mmWidth = 5556
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc52: TppDBCalc
          UserName = 'DBCalc52'
          DataField = 'TVLRRENOVMES'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 2646
          mmWidth = 5556
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc53: TppDBCalc
          UserName = 'DBCalc53'
          DataField = 'TVLRPARCMES'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 147638
          mmTop = 2646
          mmWidth = 5556
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc54: TppDBCalc
          UserName = 'DBCalc402'
          DataField = 'TVLRENCARGO'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 167746
          mmTop = 2646
          mmWidth = 5556
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc55: TppDBCalc
          UserName = 'DBCalc55'
          DataField = 'TVLRAMORT'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 187855
          mmTop = 2646
          mmWidth = 5556
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc56: TppDBCalc
          UserName = 'DBCalc56'
          DataField = 'TVLRQUITACAO'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 207963
          mmTop = 2646
          mmWidth = 5556
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc57: TppDBCalc
          UserName = 'DBCalc57'
          DataField = 'TVLRQUITMORT'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 228071
          mmTop = 2646
          mmWidth = 5556
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DESCPLANO'
      DataPipeline = pplResumoCarteiraPlanoPatro
      KeepTogether = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'DESCPLANO'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 4233
          mmLeft = 2381
          mmTop = 1058
          mmWidth = 87048
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
          mmTop = 5821
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppShape4: TppShape
          UserName = 'Shape4'
          mmHeight = 5556
          mmLeft = 81756
          mmTop = 1058
          mmWidth = 188913
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc21: TppDBCalc
          UserName = 'DBCalc21'
          DataField = 'SALDOANTERIOR'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 84402
          mmTop = 2117
          mmWidth = 19315
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc22: TppDBCalc
          UserName = 'DBCalc22'
          DataField = 'VLRCONCMES'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 111919
          mmTop = 2117
          mmWidth = 13758
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc19: TppDBCalc
          UserName = 'DBCalc19'
          DataField = 'VLRRENOVMES'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 133350
          mmTop = 2117
          mmWidth = 13758
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc20: TppDBCalc
          UserName = 'DBCalc20'
          DataField = 'VLRPARCMES'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 153459
          mmTop = 2117
          mmWidth = 13758
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc23: TppDBCalc
          UserName = 'DBCalc23'
          DataField = 'VLRENCARGO'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 173567
          mmTop = 2117
          mmWidth = 13758
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc24: TppDBCalc
          UserName = 'DBCalc24'
          DataField = 'VLRAMORT'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 193940
          mmTop = 2117
          mmWidth = 13758
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc25: TppDBCalc
          UserName = 'DBCalc25'
          DataField = 'VLRQUITACAO'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 213784
          mmTop = 2117
          mmWidth = 13758
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc26: TppDBCalc
          UserName = 'DBCalc26'
          DataField = 'VLRQUITMORT'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 234157
          mmTop = 2117
          mmWidth = 13758
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc27: TppDBCalc
          UserName = 'DBCalc27'
          DataField = 'SALDOATUAL'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 248709
          mmTop = 2117
          mmWidth = 19315
          BandType = 5
          GroupNo = 1
        end
        object ppLine9: TppLine
          UserName = 'Line9'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 265
          mmWidth = 270542
          BandType = 5
          GroupNo = 1
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = 'Total do Plano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 60061
          mmTop = 2117
          mmWidth = 20108
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc44: TppDBCalc
          UserName = 'DBCalc44'
          DataField = 'TVLRCONCMES'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 105569
          mmTop = 2117
          mmWidth = 5556
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc45: TppDBCalc
          UserName = 'DBCalc45'
          DataField = 'TVLRRENOVMES'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 2117
          mmWidth = 5556
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc46: TppDBCalc
          UserName = 'DBCalc46'
          DataField = 'TVLRPARCMES'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 147638
          mmTop = 2117
          mmWidth = 5556
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc47: TppDBCalc
          UserName = 'DBCalc401'
          DataField = 'TVLRENCARGO'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 167746
          mmTop = 2117
          mmWidth = 5556
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc48: TppDBCalc
          UserName = 'DBCalc48'
          DataField = 'TVLRAMORT'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 187855
          mmTop = 2117
          mmWidth = 5556
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc49: TppDBCalc
          UserName = 'DBCalc49'
          DataField = 'TVLRQUITACAO'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 207963
          mmTop = 2117
          mmWidth = 5556
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc50: TppDBCalc
          UserName = 'DBCalc50'
          DataField = 'TVLRQUITMORT'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 228071
          mmTop = 2117
          mmWidth = 5556
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'NOME'
      DataPipeline = pplResumoCarteiraPlanoPatro
      KeepTogether = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'NOME'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 4233
          mmLeft = 3969
          mmTop = 1058
          mmWidth = 87048
          BandType = 3
          GroupNo = 2
        end
        object ppLine8: TppLine
          UserName = 'Line8'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 5821
          mmWidth = 270542
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppShape5: TppShape
          UserName = 'Shape5'
          mmHeight = 5556
          mmLeft = 81756
          mmTop = 1588
          mmWidth = 188913
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc28: TppDBCalc
          UserName = 'DBCalc28'
          DataField = 'SALDOANTERIOR'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 84402
          mmTop = 2646
          mmWidth = 19315
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc29: TppDBCalc
          UserName = 'DBCalc29'
          DataField = 'VLRCONCMES'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 111919
          mmTop = 2646
          mmWidth = 13758
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc30: TppDBCalc
          UserName = 'DBCalc30'
          DataField = 'VLRRENOVMES'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 133350
          mmTop = 2646
          mmWidth = 13758
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc31: TppDBCalc
          UserName = 'DBCalc201'
          DataField = 'VLRPARCMES'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 153459
          mmTop = 2646
          mmWidth = 13758
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc32: TppDBCalc
          UserName = 'DBCalc32'
          DataField = 'VLRENCARGO'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 173567
          mmTop = 2646
          mmWidth = 13758
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc33: TppDBCalc
          UserName = 'DBCalc33'
          DataField = 'VLRAMORT'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 193940
          mmTop = 2646
          mmWidth = 13758
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc34: TppDBCalc
          UserName = 'DBCalc34'
          DataField = 'VLRQUITACAO'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 213784
          mmTop = 2646
          mmWidth = 13758
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc35: TppDBCalc
          UserName = 'DBCalc35'
          DataField = 'VLRQUITMORT'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 234157
          mmTop = 2646
          mmWidth = 13758
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc36: TppDBCalc
          UserName = 'DBCalc36'
          DataField = 'SALDOATUAL'
          DataPipeline = pplResumoCarteiraPlanoPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 248709
          mmTop = 2646
          mmWidth = 19315
          BandType = 5
          GroupNo = 2
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 265
          mmWidth = 270542
          BandType = 5
          GroupNo = 2
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          Caption = 'Total da Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 49213
          mmTop = 2646
          mmWidth = 30956
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc37: TppDBCalc
          UserName = 'DBCalc37'
          DataField = 'TVLRCONCMES'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 105569
          mmTop = 2646
          mmWidth = 5556
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc38: TppDBCalc
          UserName = 'DBCalc301'
          DataField = 'TVLRRENOVMES'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 2646
          mmWidth = 5556
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc39: TppDBCalc
          UserName = 'DBCalc39'
          DataField = 'TVLRPARCMES'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 147638
          mmTop = 2646
          mmWidth = 5556
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc40: TppDBCalc
          UserName = 'DBCalc40'
          DataField = 'TVLRENCARGO'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 167746
          mmTop = 2646
          mmWidth = 5556
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc41: TppDBCalc
          UserName = 'DBCalc41'
          DataField = 'TVLRAMORT'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 187855
          mmTop = 2646
          mmWidth = 5556
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc42: TppDBCalc
          UserName = 'DBCalc42'
          DataField = 'TVLRQUITACAO'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 207963
          mmTop = 2646
          mmWidth = 5556
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc43: TppDBCalc
          UserName = 'DBCalc43'
          DataField = 'TVLRQUITMORT'
          DataPipeline = pplResumoCarteiraPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 228071
          mmTop = 2646
          mmWidth = 5556
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object qryResumoCarteira: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      
        '   0                                                            ' +
        '  AS IDTIPOEMPTMO,'
      
        '   '#39'                                                            ' +
        #39' AS DESCTIPOEMPTMO,'
      
        '   0                                                            ' +
        '  AS IDPESSOA,'
      
        '   '#39'                                                            ' +
        #39' AS NOME,'
      
        '   0                                                            ' +
        '  AS IDPLANOPREV,'
      
        '   '#39'                                                  '#39'         ' +
        '  AS DESCPLANO,'
      
        '   0                                                            ' +
        '  AS IDTIPOCONTREMPTMO,'
      
        '   '#39'                                                            ' +
        #39' AS TCEDESCRICAO,'
      
        '   0                                                            ' +
        '  AS SALDOANTERIOR,'
      
        '   0                                                            ' +
        '  AS VLRCONCMES,'
      
        '   0                                                            ' +
        '  AS VLRRENOVMES,'
      
        '   0                                                            ' +
        '  AS VLRPARCMES,'
      
        '   0                                                            ' +
        '  AS VLRENCARGO,'
      
        '   0                                                            ' +
        '  AS VLRAMORT,'
      
        '   0                                                            ' +
        '  AS VLRQUITACAO,'
      
        '   0                                                            ' +
        '  AS VLRQUITMORT,'
      
        '   0                                                            ' +
        '  AS SALDOATUAL,'
      
        '   0                                                            ' +
        '  AS TSALDOANTERIOR,'
      
        '   0                                                            ' +
        '  AS TVLRCONCMES,'
      
        '   0                                                            ' +
        '  AS TVLRRENOVMES,'
      
        '   0                                                            ' +
        '  AS TVLRPARCMES,'
      
        '   0                                                            ' +
        '  AS TVLRENCARGO,'
      
        '   0                                                            ' +
        '  AS TVLRAMORT,'
      
        '   0                                                            ' +
        '  AS TVLRQUITACAO,'
      
        '   0                                                            ' +
        '  AS TVLRQUITMORT,'
      
        '   0                                                            ' +
        '  AS TSALDOATUAL'
      'FROM'
      '   DUAL'
      'WHERE 1 = 2'
      ''
      ' '
      ' '
      ' ')
    UpdateObject = UpdateSQL
    ValidateWithMask = True
    Left = 136
    Top = 80
    object qryResumoCarteiraIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryResumoCarteiraNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 60
    end
    object qryResumoCarteiraIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryResumoCarteiraDESCPLANO: TStringField
      FieldName = 'DESCPLANO'
      FixedChar = True
      Size = 50
    end
    object qryResumoCarteiraIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryResumoCarteiraTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      FixedChar = True
      Size = 60
    end
    object qryResumoCarteiraSALDOANTERIOR: TFloatField
      FieldName = 'SALDOANTERIOR'
    end
    object qryResumoCarteiraVLRCONCMES: TFloatField
      FieldName = 'VLRCONCMES'
    end
    object qryResumoCarteiraVLRRENOVMES: TFloatField
      FieldName = 'VLRRENOVMES'
    end
    object qryResumoCarteiraVLRPARCMES: TFloatField
      FieldName = 'VLRPARCMES'
    end
    object qryResumoCarteiraVLRENCARGO: TFloatField
      FieldName = 'VLRENCARGO'
    end
    object qryResumoCarteiraVLRAMORT: TFloatField
      FieldName = 'VLRAMORT'
    end
    object qryResumoCarteiraVLRQUITACAO: TFloatField
      FieldName = 'VLRQUITACAO'
    end
    object qryResumoCarteiraVLRQUITMORT: TFloatField
      FieldName = 'VLRQUITMORT'
    end
    object qryResumoCarteiraSALDOATUAL: TFloatField
      FieldName = 'SALDOATUAL'
    end
    object qryResumoCarteiraIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryResumoCarteiraDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      FixedChar = True
      Size = 60
    end
    object qryResumoCarteiraTSALDOANTERIOR: TFloatField
      FieldName = 'TSALDOANTERIOR'
    end
    object qryResumoCarteiraTVLRCONCMES: TFloatField
      FieldName = 'TVLRCONCMES'
    end
    object qryResumoCarteiraTVLRRENOVMES: TFloatField
      FieldName = 'TVLRRENOVMES'
    end
    object qryResumoCarteiraTVLRPARCMES: TFloatField
      FieldName = 'TVLRPARCMES'
    end
    object qryResumoCarteiraTVLRENCARGO: TFloatField
      FieldName = 'TVLRENCARGO'
    end
    object qryResumoCarteiraTVLRAMORT: TFloatField
      FieldName = 'TVLRAMORT'
    end
    object qryResumoCarteiraTVLRQUITACAO: TFloatField
      FieldName = 'TVLRQUITACAO'
    end
    object qryResumoCarteiraTVLRQUITMORT: TFloatField
      FieldName = 'TVLRQUITMORT'
    end
    object qryResumoCarteiraTSALDOATUAL: TFloatField
      FieldName = 'TSALDOATUAL'
    end
  end
  object UpdateSQL: TUpdateSQL
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (IDTIPOEMPTMO, DESCTIPOEMPTMO, IDPESSOA, NOME, IDPLANOPREV, '
      'DESCPLANO, '
      '   IDTIPOCONTREMPTMO, TCEDESCRICAO, SALDOANTERIOR, VLRCONCMES, '
      'VLRRENOVMES, '
      '   VLRPARCMES, VLRENCARGO, VLRAMORT, VLRQUITACAO, VLRQUITMORT, '
      'SALDOATUAL)'
      'values'
      
        '  (:IDTIPOEMPTMO, :DESCTIPOEMPTMO, :IDPESSOA, :NOME, :IDPLANOPRE' +
        'V, '
      ':DESCPLANO, '
      '   :IDTIPOCONTREMPTMO, :TCEDESCRICAO, :SALDOANTERIOR, '
      ':VLRCONCMES, :VLRRENOVMES, '
      '   :VLRPARCMES, :VLRENCARGO, :VLRAMORT, :VLRQUITACAO, '
      ':VLRQUITMORT, :SALDOATUAL)')
    Left = 264
    Top = 56
  end
end
