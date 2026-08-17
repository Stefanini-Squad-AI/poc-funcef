inherited DmRelLanContRF: TDmRelLanContRF
  Left = 404
  Top = 129
  Width = 212
  Height = 281
  Caption = 'DmRelLanContRF'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 34
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
    Left = 34
  end
  inherited rpExemplo: TppReport
    Left = 34
    DataPipelineName = 'pplExemplo'
  end
  object dsLanContRF: TwwDataSource
    AutoEdit = False
    DataSet = qryLancContATURF
    Left = 40
    Top = 80
  end
  object pplLanContRF: TppBDEPipeline
    DataSource = dsLanContRF
    UserName = 'pplLanContRF'
    Left = 133
    Top = 80
    object pplLanContRFppField1: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplLanContRFppField2: TppField
      FieldAlias = 'DATAOPERACAO'
      FieldName = 'DATAOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplLanContRFppField3: TppField
      FieldAlias = 'PLNPLANIL'
      FieldName = 'PLNPLANIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplLanContRFppField4: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplLanContRFppField5: TppField
      FieldAlias = 'LACVALOR'
      FieldName = 'LACVALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplLanContRFppField6: TppField
      FieldAlias = 'SLDATUAL'
      FieldName = 'SLDATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplLanContRFppField7: TppField
      FieldAlias = 'SLDANT'
      FieldName = 'SLDANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplLanContRFppField8: TppField
      FieldAlias = 'VARIACAO'
      FieldName = 'VARIACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplLanContRFppField9: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplLanContRFppField10: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplLanContRFppField11: TppField
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplLanContRFppField12: TppField
      FieldAlias = 'IDINVESTIMENTO'
      FieldName = 'IDINVESTIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplLanContRFppField13: TppField
      FieldAlias = 'IDPLANPREVCTBPATR'
      FieldName = 'IDPLANPREVCTBPATR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplLanContRFppField14: TppField
      FieldAlias = 'COR'
      FieldName = 'COR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplLanContRFppField15: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplLanContRFppField16: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
  end
  object pprLanContRF: TppReport
    AutoStop = False
    DataPipeline = pplLanContRF
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Lançamentos Contábeis de Renda Fixa'
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
    Left = 130
    Top = 16
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplLanContRF'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 19579
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        Caption = 'Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 19844
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Saldo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 111125
        mmTop = 19844
        mmWidth = 24606
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 146579
        mmTop = 19844
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Variação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 179917
        mmTop = 19844
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Aplicação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 54769
        mmTop = 19844
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'DATA'
        DataPipeline = pplLanContRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        DataPipelineName = 'pplLanContRF'
        mmHeight = 3704
        mmLeft = 37835
        mmTop = 14023
        mmWidth = 40481
        BandType = 0
      end
      object rptRenFixSaldoTitulo: TppLabel
        UserName = 'rptRenFixSaldoTitulo'
        Caption = 'Lançamentos Contábeis de Renda Fixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 66146
        BandType = 0
      end
      object ppLabel16: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa1'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'LPeriodo1'
        Caption = 'Data:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 7673
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo1'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmOperComum.pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 6085
        mmTop = 1588
        mmWidth = 13229
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = pplLanContRF
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLanContRF'
        mmHeight = 3704
        mmLeft = 93927
        mmTop = 14023
        mmWidth = 101865
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        UserName = 'shpDetalhe'
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 33602
        mmTop = 0
        mmWidth = 163777
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PLNPLANIL'
        DataPipeline = pplLanContRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplLanContRF'
        mmHeight = 3175
        mmLeft = 33338
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'HISTORICO'
        DataPipeline = pplLanContRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLanContRF'
        mmHeight = 3175
        mmLeft = 54504
        mmTop = 265
        mmWidth = 121179
        BandType = 4
      end
      object dblValLanc: TppDBText
        OnPrint = dblValLancPrint
        UserName = 'dblValLanc'
        DataField = 'LACVALOR'
        DataPipeline = pplLanContRF
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLanContRF'
        mmHeight = 3175
        mmLeft = 177271
        mmTop = 265
        mmWidth = 18521
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
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
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = pplLanContRF
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplLanContRF'
      object grpCabPlano: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 2646
        mmPrintPosition = 0
      end
      object grpRodapePlano: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'LACVALOR'
          DataPipeline = pplLanContRF
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplLanContRF'
          mmHeight = 3175
          mmLeft = 173567
          mmTop = 794
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label10'
          Caption = 'Total dos Lançamentos Contábeis do Plano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1588
          mmTop = 529
          mmWidth = 67998
          BandType = 5
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 2117
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDINVESTIMENTO'
      DataPipeline = pplLanContRF
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplLanContRF'
      object grpCabInvestimento: TppGroupHeaderBand
        AfterPrint = grpCabInvestimentoAfterPrint
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object shpCabInvestimento: TppShape
          UserName = 'shpCabInvestimento'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DESCINVESTIMENTO'
          DataPipeline = pplLanContRF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplLanContRF'
          mmHeight = 3175
          mmLeft = 1588
          mmTop = 265
          mmWidth = 51065
          BandType = 3
          GroupNo = 1
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'SLDANT'
          DataPipeline = pplLanContRF
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplLanContRF'
          mmHeight = 3175
          mmLeft = 106892
          mmTop = 265
          mmWidth = 28840
          BandType = 3
          GroupNo = 1
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'SLDATUAL'
          DataPipeline = pplLanContRF
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplLanContRF'
          mmHeight = 3175
          mmLeft = 142346
          mmTop = 265
          mmWidth = 26194
          BandType = 3
          GroupNo = 1
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'VARIACAO'
          DataPipeline = pplLanContRF
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplLanContRF'
          mmHeight = 3175
          mmLeft = 173567
          mmTop = 265
          mmWidth = 21960
          BandType = 3
          GroupNo = 1
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'DATAOPERACAO'
          DataPipeline = pplLanContRF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplLanContRF'
          mmHeight = 3175
          mmLeft = 54504
          mmTop = 265
          mmWidth = 19050
          BandType = 3
          GroupNo = 1
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 33602
          mmTop = 7408
          mmWidth = 163513
          BandType = 3
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Planilha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 33867
          mmTop = 4763
          mmWidth = 18256
          BandType = 3
          GroupNo = 1
        end
        object ppLabel10: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 53975
          mmTop = 4763
          mmWidth = 26723
          BandType = 3
          GroupNo = 1
        end
        object ppLabel11: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Valor do Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 162454
          mmTop = 4763
          mmWidth = 33338
          BandType = 3
          GroupNo = 1
        end
      end
      object grpRodapeInvestimento: TppGroupFooterBand
        BeforePrint = grpRodapeInvestimentoBeforePrint
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 54504
          mmTop = 0
          mmWidth = 141552
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'LACVALOR'
          DataPipeline = pplLanContRF
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplLanContRF'
          mmHeight = 3175
          mmLeft = 173832
          mmTop = 529
          mmWidth = 21960
          BandType = 5
          GroupNo = 1
        end
        object ppLabel12: TppLabel
          UserName = 'Label9'
          Caption = 'Total dos Lançamentos Contábeis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 54240
          mmTop = 265
          mmWidth = 48419
          BandType = 5
          GroupNo = 1
        end
        object lblAlerta: TppLabel
          UserName = 'lblAlerta'
          Caption = 'Lançamento Divergente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          Visible = False
          mmHeight = 3969
          mmLeft = 123825
          mmTop = 265
          mmWidth = 36513
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object updLanContATURF: TUpdateSQL
    Left = 40
    Top = 192
  end
  object qryLancContATURF: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT TB.DATAHISTRENFIX AS DATA, PP.PLANPRVCONTABPATRO, IV.DESC' +
        'INVESTIMENTO, OP.DATAOPERACAO,'
      '       LC.PLANO, LC.PLACONTA, TB. PLNCODIGO, PL.PLNPLANIL,'
      '       (LC.LACHIST1 || LC.LACHIST2) AS HISTORICO, LC.LACVALOR,'
      
        '       TB.SALDOVLRHISTRENFI AS SLDATUAL, SLDA.SALDOVLRHISTRENFI ' +
        'AS SLDANT,'
      
        '       (TB.SALDOVLRHISTRENFI - SLDA.SALDOVLRHISTRENFI) AS VARIAC' +
        'AO,'
      
        '       (IV.DESCINVESTIMENTO || OP.IDOPERRENFIX || OP.DATAOPERACA' +
        'O) AS IDINVESTIMENTO,'
      '       TB.IDPLANPREVCTBPATR,'
      '       0 AS COR'
      'FROM LANCAMENTO LC, PLANILHA PL, OPERRENFIX OP, INVESTIMENTO IV,'
      
        '     (SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'#39' - '#39'|| PE.NOME) A' +
        'S PLANPRVCONTABPATRO'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      
        '     (SELECT HR.IDHISTRENFIX, HR.PLNCODIGO, HR.DATAHISTRENFIX, H' +
        'R.IDINVESTIMENTO, HR.IDOPERRENFIXAPLIC,'
      '             HR.SALDOVLRHISTRENFI, HR.IDPLANPREVCTBPATR'
      '      FROM   HISTRENFIX HR'
      
        '      WHERE  (HR.DATAHISTRENFIX = TO_DATE(:DATAATU,'#39'DD/MM/YYYY'#39')' +
        ')'
      
        '        AND  (((:IDINVESTIMENTO IS NOT NULL) AND (HR.IDINVESTIME' +
        'NTO = :IDINVESTIMENTO)) OR'
      '               (:IDINVESTIMENTO IS NULL))'
      
        '        AND  (((:IDOPERRENFIXAPLIC IS NOT NULL) AND (HR.IDOPERRE' +
        'NFIXAPLIC = :IDOPERRENFIXAPLIC)) OR'
      '               (:IDOPERRENFIXAPLIC IS NULL))'
      '        AND  (HR.IDHISTRENFIX IN (SELECT MAX(IDHISTRENFIX)'
      '                                  FROM HISTRENFIX'
      
        '                                  WHERE (DATAHISTRENFIX = TO_DAT' +
        'E(:DATAATU,'#39'DD/MM/YYYY'#39'))'
      
        '                                    AND (TIPMOVHISRENFIX = '#39'ATU'#39 +
        ' )'
      
        '                                    AND  (((:IDINVESTIMENTO IS N' +
        'OT NULL) AND (IDINVESTIMENTO = :IDINVESTIMENTO)) OR'
      
        '                                           (:IDINVESTIMENTO IS N' +
        'ULL))'
      
        '                                    AND  (((:IDOPERRENFIXAPLIC I' +
        'S NOT NULL) AND (IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC)) OR'
      
        '                                           (:IDOPERRENFIXAPLIC I' +
        'S NULL))'
      
        '                                  GROUP BY DATAHISTRENFIX, IDINV' +
        'ESTIMENTO, IDOPERRENFIXAPLIC))) TB,'
      
        '     (SELECT IDINVESTIMENTO, IDOPERRENFIXAPLIC, SALDOVLRHISTRENF' +
        'I'
      '      FROM   HISTRENFIX HR'
      '      WHERE ((HR.IDHISTRENFIX || HR.DATAHISTRENFIX) IN'
      
        '                                 (SELECT MAX(H.IDHISTRENFIX) || ' +
        'MAX(H.DATAHISTRENFIX)'
      
        '                                  FROM HISTRENFIX H, OPERRENFIX ' +
        'O'
      
        '                                  WHERE (((:IDINVESTIMENTO IS NO' +
        'T NULL) AND (O.IDINVESTIMENTO = :IDINVESTIMENTO)) OR'
      
        '                                          (:IDINVESTIMENTO IS NU' +
        'LL))'
      
        '                                    AND (((:IDOPERRENFIXAPLIC IS' +
        ' NOT NULL) AND (O.IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC)) OR'
      
        '                                          (:IDOPERRENFIXAPLIC IS' +
        ' NULL))'
      
        '                                    AND (((:IDINVESTIMENTO IS NO' +
        'T NULL) AND (H.IDINVESTIMENTO = :IDINVESTIMENTO)) OR'
      
        '                                          (:IDINVESTIMENTO IS NU' +
        'LL))'
      
        '                                    AND (((:IDOPERRENFIXAPLIC IS' +
        ' NOT NULL) AND (H.IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC)) OR'
      
        '                                          (:IDOPERRENFIXAPLIC IS' +
        ' NULL))'
      
        '                                    AND (H.IDOPERRENFIXAPLIC = O' +
        '.IDOPERRENFIX(+))'
      '                                    AND ('
      
        '                                         ((O.DATAOPERACAO = TO_D' +
        'ATE(:DATAATU,'#39'DD/MM/YYYY'#39'))'
      '                                          AND'
      
        '                                          ((H.DATAHISTRENFIX = T' +
        'O_DATE(:DATAATU,'#39'DD/MM/YYYY'#39')) AND (H.TIPMOVHISRENFIX = '#39'OPE'#39')))'
      '                                         OR'
      
        '                                         (H.DATAHISTRENFIX < TO_' +
        'DATE(:DATAATU,'#39'DD/MM/YYYY'#39')))'
      
        '                                  GROUP BY H.IDOPERRENFIXAPLIC))' +
        ') SLDA'
      
        'WHERE (((:IDINVESTIMENTO IS NOT NULL) AND (IV.IDINVESTIMENTO = :' +
        'IDINVESTIMENTO)) OR'
      '        (:IDINVESTIMENTO IS NULL))'
      
        '  AND (((:IDINVESTIMENTO IS NOT NULL) AND (OP.IDINVESTIMENTO = :' +
        'IDINVESTIMENTO)) OR'
      '        (:IDINVESTIMENTO IS NULL))'
      
        '  AND (((:IDOPERRENFIXAPLIC IS NOT NULL) AND (OP.IDOPERRENFIXAPL' +
        'IC = :IDOPERRENFIXAPLIC)) OR'
      '        (:IDOPERRENFIXAPLIC IS NULL))'
      '  AND LC.IDMODULO = 79'
      '  AND PL.IDMODULO = 79'
      '  AND LC.LACDEBCRE = '#39'D'#39
      '  AND PL.PLNDATDIA = TO_DATE(:DATAATU,'#39'DD/MM/YYYY'#39')'
      '  AND TB.PLNCODIGO = LC.PLNCODIGO'
      '  AND TB.PLNCODIGO = PL.PLNCODIGO'
      '  AND TB.IDINVESTIMENTO = OP.IDINVESTIMENTO'
      '  AND TB.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND TB.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX'
      '  AND TB.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      '  AND OP.IDINVESTIMENTO = SLDA.IDINVESTIMENTO(+)'
      '  AND OP.IDOPERRENFIX = SLDA.IDOPERRENFIXAPLIC(+)'
      ''
      '  AND ((:IDPLANPREVCTBPATR  IS NULL) OR'
      '       (TB.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      ''
      
        'ORDER BY DATA, PP.PLANPRVCONTABPATRO, DESCINVESTIMENTO, DATAOPER' +
        'ACAO,'
      '         TB.IDINVESTIMENTO, TB.IDOPERRENFIXAPLIC'
      ' ')
    UpdateObject = updLanContATURF
    ValidateWithMask = True
    Left = 40
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAATU'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAATU'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAATU'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAATU'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAATU'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAATU'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end>
    object qryLancContATURFDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 27
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryLancContATURFDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Aplicação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
    end
    object qryLancContATURFPLNPLANIL: TFloatField
      DisplayLabel = 'Planilha'
      DisplayWidth = 6
      FieldName = 'PLNPLANIL'
    end
    object qryLancContATURFHISTORICO: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 60
      FieldName = 'HISTORICO'
      Size = 80
    end
    object qryLancContATURFLACVALOR: TFloatField
      DisplayLabel = 'Valor do Lançamento'
      DisplayWidth = 18
      FieldName = 'LACVALOR'
    end
    object qryLancContATURFSLDATUAL: TFloatField
      DisplayLabel = 'Saldo Atual'
      DisplayWidth = 18
      FieldName = 'SLDATUAL'
    end
    object qryLancContATURFSLDANT: TFloatField
      DisplayLabel = 'Saldo Anterior'
      DisplayWidth = 18
      FieldName = 'SLDANT'
    end
    object qryLancContATURFVARIACAO: TFloatField
      DisplayLabel = 'Variação'
      DisplayWidth = 15
      FieldName = 'VARIACAO'
    end
    object qryLancContATURFDATA: TDateTimeField
      FieldName = 'DATA'
      Visible = False
    end
    object qryLancContATURFPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Visible = False
      Size = 113
    end
    object qryLancContATURFPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryLancContATURFIDINVESTIMENTO: TStringField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
      Size = 108
    end
    object qryLancContATURFIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryLancContATURFCOR: TFloatField
      FieldName = 'COR'
      Visible = False
    end
    object qryLancContATURFPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object qryLancContATURFPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Visible = False
      FixedChar = True
      Size = 18
    end
  end
  object qryPlanoConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLANATUREZA'
      'FROM PLANOCONTA'
      'WHERE PLANATUREZA IN ('#39'D'#39','#39'C'#39')'
      '  AND PLATIPO = '#39'A'#39
      '  AND PLACONTA = :PLACONTA'
      '  AND PLANO = :PLANO'
      ' ')
    ValidateWithMask = True
    Left = 136
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptResult
      end>
    object qryPlanoContaPLANATUREZA: TStringField
      DisplayLabel = 'Natureza'
      DisplayWidth = 20
      FieldName = 'PLANATUREZA'
      FixedChar = True
      Size = 1
    end
  end
end
