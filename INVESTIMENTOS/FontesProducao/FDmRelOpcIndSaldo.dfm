inherited DmRelOpcIndSaldo: TDmRelOpcIndSaldo
  Left = 355
  Top = 191
  Width = 240
  Height = 262
  Caption = 'DmRelOpcIndSaldo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 173
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
    Left = 167
  end
  inherited qryExemplo: TwwQuery
    Left = 170
  end
  inherited rpExemplo: TppReport
    Left = 170
    DataPipelineName = 'pplExemplo'
  end
  object pplHistOpcInd: TppBDEPipeline
    DataSource = dsHistOpcInd
    OpenDataSource = False
    UserName = 'lHistOpcInd'
    Left = 36
    Top = 56
    object pplHistOpcIndppField1: TppField
      FieldAlias = 'DATAHISTOPCIND'
      FieldName = 'DATAHISTOPCIND'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 11
      Position = 0
    end
    object pplHistOpcIndppField2: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 60
      DisplayWidth = 38
      Position = 1
    end
    object pplHistOpcIndppField3: TppField
      FieldAlias = 'IDBOLETA'
      FieldName = 'IDBOLETA'
      FieldLength = 30
      DisplayWidth = 10
      Position = 2
    end
    object pplHistOpcIndppField4: TppField
      FieldAlias = 'IDLOTE'
      FieldName = 'IDLOTE'
      FieldLength = 10
      DisplayWidth = 5
      Position = 3
    end
    object pplHistOpcIndppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'SLDQTDHISTOPCIND'
      FieldName = 'SLDQTDHISTOPCIND'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 4
    end
    object pplHistOpcIndppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'SLDVLRHISTOPCIND'
      FieldName = 'SLDVLRHISTOPCIND'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 19
      Position = 5
    end
    object pplHistOpcIndppField7: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 136
      DisplayWidth = 40
      Position = 6
    end
    object pplHistOpcIndppField8: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 60
      DisplayWidth = 30
      Position = 7
    end
    object pplHistOpcIndppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'AJUSTE'
      FieldName = 'AJUSTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplHistOpcIndppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'CESTA'
      FieldName = 'CESTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
  object pplItemOpcInd: TppBDEPipeline
    DataSource = dsItenOpcInd
    OpenDataSource = False
    UserName = 'lItemOpcInd'
    Left = 125
    Top = 56
  end
  object dsHistOpcInd: TwwDataSource
    DataSet = qryHistOpcInd
    Left = 37
    Top = 112
  end
  object dsItenOpcInd: TwwDataSource
    AutoEdit = False
    DataSet = qryItensOpcInd
    Left = 126
    Top = 112
  end
  object rptOpcIndSaldo: TppReport
    AutoStop = False
    DataPipeline = pplHistOpcInd
    OnStartPage = rptOpcIndSaldoStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Saldos de Opções de Índice'
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
    Left = 82
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplHistOpcInd'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24606
      mmPrintPosition = 0
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        mmHeight = 5027
        mmLeft = 0
        mmTop = 19579
        mmWidth = 197380
        BandType = 0
      end
      object rptRenFixSaldoTitulo: TppLabel
        UserName = 'rptRenFixSaldoTitulo'
        Caption = 'Saldos de Opções de Índice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 47096
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
      object ppLabel1: TppLabel
        UserName = 'LPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
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
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 6085
        mmTop = 1588
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 13229
        mmTop = 20108
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3969
        mmLeft = 144727
        mmTop = 20108
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Valor da Cesta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 114565
        mmTop = 20108
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label1'
        Caption = 'Ajuste da Cesta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 83079
        mmTop = 20108
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 188913
        mmTop = 20108
        mmWidth = 7938
        BandType = 0
      end
    end
    object ppbBandaDetalhe: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
      object shpRenFixSaldoDetPai: TppShape
        UserName = 'shpRenFixSaldoDetPai'
        Pen.Style = psClear
        mmHeight = 3440
        mmLeft = 18521
        mmTop = 0
        mmWidth = 177800
        BandType = 4
      end
      object dbtDescInvestimento: TppDBText
        UserName = 'dbtDescInvestimento'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = pplHistOpcInd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplHistOpcInd'
        mmHeight = 3175
        mmLeft = 13229
        mmTop = 0
        mmWidth = 70379
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'dbQuantidade1'
        DataField = 'SLDQTDHISTOPCIND'
        DataPipeline = pplHistOpcInd
        DisplayFormat = '###,###,###,###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistOpcInd'
        mmHeight = 3175
        mmLeft = 136790
        mmTop = 0
        mmWidth = 27252
        BandType = 4
      end
      object srptOpcIndSaldo: TppSubReport
        UserName = 'srptOpcIndSaldo'
        DrillDownComponent = dbtDescInvestimento
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        Visible = False
        DataPipelineName = 'pplItemOpcInd'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 4498
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplItemOpcInd
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Saldos de Opções de Índice'
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
          Left = 112
          Top = 112
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplItemOpcInd'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 6615
            mmPrintPosition = 0
            object ppShape1: TppShape
              UserName = 'Shape1'
              Brush.Color = clSilver
              mmHeight = 4233
              mmLeft = 29104
              mmTop = 2381
              mmWidth = 168275
              BandType = 1
            end
            object ppLabel13: TppLabel
              UserName = 'Label13'
              Caption = 'Descrição do Item'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 35454
              mmTop = 2910
              mmWidth = 23813
              BandType = 1
            end
            object ppLabel2: TppLabel
              UserName = 'Label1'
              Caption = 'Valor do Item'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 138907
              mmTop = 2910
              mmWidth = 25135
              BandType = 1
            end
            object ppLabel4: TppLabel
              UserName = 'Label4'
              Caption = 'Saldo do Item'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 178859
              mmTop = 2910
              mmWidth = 17992
              BandType = 1
            end
          end
          object ppDetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object shpRenFixSaldoDetFilho: TppShape
              OnPrint = shpRenFixSaldoDetFilhoPrint
              UserName = 'shpRenFixSaldoDetFilho'
              Pen.Style = psClear
              mmHeight = 4233
              mmLeft = 28840
              mmTop = 529
              mmWidth = 168275
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              DataField = 'DESITEMOPCIND'
              DataPipeline = pplItemOpcInd
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplItemOpcInd'
              mmHeight = 3175
              mmLeft = 35454
              mmTop = 265
              mmWidth = 79111
              BandType = 4
            end
            object dbtValorItem: TppDBText
              UserName = 'dbtValorItem'
              DataField = 'SLDHISTOPCIND'
              DataPipeline = pplItemOpcInd
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplItemOpcInd'
              mmHeight = 3175
              mmLeft = 165894
              mmTop = 265
              mmWidth = 30956
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'VLRHISTOPCIND'
              DataPipeline = pplItemOpcInd
              DisplayFormat = '###,###,###,###,##0.00#######'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplItemOpcInd'
              mmHeight = 3175
              mmLeft = 120121
              mmTop = 265
              mmWidth = 43921
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
            object ppLine1: TppLine
              UserName = 'Line1'
              Weight = 0.75
              mmHeight = 1852
              mmLeft = 28840
              mmTop = 529
              mmWidth = 168011
              BandType = 7
            end
          end
        end
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CESTA'
        DataPipeline = pplHistOpcInd
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistOpcInd'
        mmHeight = 3175
        mmLeft = 108479
        mmTop = 0
        mmWidth = 28310
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'AJUSTE'
        DataPipeline = pplHistOpcInd
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistOpcInd'
        mmHeight = 3175
        mmLeft = 83608
        mmTop = 0
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText1'
        DataField = 'SLDVLRHISTOPCIND'
        DataPipeline = pplHistOpcInd
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistOpcInd'
        mmHeight = 3175
        mmLeft = 165100
        mmTop = 0
        mmWidth = 31750
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
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
        mmWidth = 196586
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
        mmWidth = 282046
        BandType = 8
      end
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
        mmLeft = 195792
        mmTop = 3175
        mmWidth = 86784
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape4'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 197644
        BandType = 7
      end
      object ppLabel7: TppLabel
        UserName = 'Label3'
        Caption = 'Total na Data: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 0
        mmWidth = 22225
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'SLDVLRHISTOPCIND'
        DataPipeline = pplHistOpcInd
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        LookAhead = True
        DataPipelineName = 'pplHistOpcInd'
        mmHeight = 3175
        mmLeft = 165894
        mmTop = 265
        mmWidth = 30956
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'CESTA'
        DataPipeline = pplHistOpcInd
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistOpcInd'
        mmHeight = 3175
        mmLeft = 105304
        mmTop = 265
        mmWidth = 31485
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'AJUSTE'
        DataPipeline = pplHistOpcInd
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistOpcInd'
        mmHeight = 3175
        mmLeft = 76465
        mmTop = 265
        mmWidth = 30692
        BandType = 7
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = pplHistOpcInd
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplHistOpcInd'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rdpPlano: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object shpTotalPlano: TppShape
          UserName = 'shpTotalPlano'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 3969
          mmLeft = 265
          mmTop = 0
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'Total do Plano / Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 529
          mmTop = 0
          mmWidth = 43656
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'SLDVLRHISTOPCIND'
          DataPipeline = pplHistOpcInd
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplHistOpcInd'
          mmHeight = 3175
          mmLeft = 165894
          mmTop = 0
          mmWidth = 30956
          BandType = 5
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 265
          mmTop = 3969
          mmWidth = 197115
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'CESTA'
          DataPipeline = pplHistOpcInd
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplHistOpcInd'
          mmHeight = 3175
          mmLeft = 105304
          mmTop = 0
          mmWidth = 31485
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'AJUSTE'
          DataPipeline = pplHistOpcInd
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplHistOpcInd'
          mmHeight = 3175
          mmLeft = 75936
          mmTop = 0
          mmWidth = 31221
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DATAHISTRENFIX'
      DataPipeline = pplHistOpcInd
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplHistOpcInd'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object shpTitData: TppShape
          UserName = 'shpTitData'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 197644
          BandType = 3
          GroupNo = 0
        end
        object dbDataOper: TppDBText
          UserName = 'dbDataOper'
          DataField = 'DATAHISTOPCIND'
          DataPipeline = pplHistOpcInd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ReprintOnSubsequent = True
          SuppressRepeatedValues = True
          Transparent = True
          DataPipelineName = 'pplHistOpcInd'
          mmHeight = 3440
          mmLeft = 13229
          mmTop = 265
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label2'
          Caption = 'Data: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 3440
          mmTop = 0
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryItensOpcInd: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      
        'SELECT I.DESITEMOPCIND, R.NOMEREGRA, H.VLRHISTOPCIND, H.SLDHISTO' +
        'PCIND,'
      '       H.IDHISTOPCIND, H.IDITEMOPCIND, IDREGRAUSADA'
      'FROM'
      '       HISTOPCINDXITENS H, ITEMOPCIND I, REGRA R'
      'WHERE'
      '     H.IDHISTOPCIND IN'
      '       (SELECT IDHISTOPCIND'
      '        FROM HISTOPCIND H1'
      '        WHERE (H1.DATAHISTOPCIND || H1.IDHISTOPCIND) IN'
      
        '                  (SELECT MAX(DATAHISTOPCIND) || MAX(IDHISTOPCIN' +
        'D)'
      '                   FROM HISTOPCIND'
      
        '                   WHERE DATAHISTOPCIND <= TO_DATE(:DATAHISTOPCI' +
        'ND, '#39'DD/MM/YYYY'#39')'
      
        '                     AND (((:IDINVESTIMENTO IS NOT NULL) AND (ID' +
        'INVESTIMENTO = :IDINVESTIMENTO)) OR'
      '                           (:IDINVESTIMENTO IS NULL))'
      
        '                     AND (((:IDBOLETA IS NOT NULL) AND (IDBOLETA' +
        ' = :IDBOLETA)) OR'
      '                           (:IDBOLETA IS NULL))'
      
        '                     AND (((:IDPLANPREVCTBPATR IS NOT NULL) AND ' +
        '(IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)) OR'
      '                           (:IDPLANPREVCTBPATR IS NULL))'
      '                   GROUP BY IDINVESTIMENTO))'
      '  AND (H.IDITEMOPCIND = I.IDITEMOPCIND(+))'
      '  AND (H.IDREGRAUSADA = R.IDREGRA(+))'
      'ORDER BY H.IDHISTOPCIND, H.IDITEMOPCIND'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAHISTOPCIND'
        ParamType = ptResult
        Value = '05/06/2003'
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
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end>
    object qryItensOpcIndDESITEMOPCIND: TStringField
      DisplayLabel = 'Item'
      DisplayWidth = 32
      FieldName = 'DESITEMOPCIND'
      Size = 60
    end
    object qryItensOpcIndNOMEREGRA: TStringField
      DisplayLabel = 'Regra'
      DisplayWidth = 34
      FieldName = 'NOMEREGRA'
      Size = 60
    end
    object qryItensOpcIndVLRHISTOPCIND: TFloatField
      DisplayLabel = 'Valor do Item'
      DisplayWidth = 19
      FieldName = 'VLRHISTOPCIND'
      DisplayFormat = '###,###,###,###0.00'
    end
    object qryItensOpcIndSLDHISTOPCIND: TFloatField
      DisplayLabel = 'Saldo do Item'
      DisplayWidth = 18
      FieldName = 'SLDHISTOPCIND'
      DisplayFormat = '###,###,###,###0.00'
    end
    object qryItensOpcIndIDHISTOPCIND: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHISTOPCIND'
      Visible = False
    end
    object qryItensOpcIndIDITEMOPCIND: TFloatField
      DisplayWidth = 10
      FieldName = 'IDITEMOPCIND'
      Visible = False
    end
    object qryItensOpcIndIDREGRAUSADA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRAUSADA'
      Visible = False
    end
  end
  object qryHistOpcInd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        PP.PLANPRVCONTABPATRO,'
      '        C.DESCCARTINVEST,'
      '        I.DESCINVESTIMENTO,   H.DATAHISTOPCIND,'
      
        '        H.IDBOLETA,            H.IDLOTE,           H.SLDQTDHISTO' +
        'PCIND,'
      '--      H.IDHISTOPCIND,'
      '        SUM(AJU.SLDHISTOPCIND) AS AJUSTE,'
      '        SUM(CES.SLDHISTOPCIND) AS CESTA,'
      
        '        SUM(AJU.SLDHISTOPCIND) + SUM(CES.SLDHISTOPCIND) AS SLDVL' +
        'RHISTOPCIND'
      'FROM'
      '  HISTOPCIND H, INVESTIMENTO I, CARTEIRAINVEST C, OPCOES O,'
      ''
      
        '  (SELECT PA.IDPLANPREVCTBPATR, ('#39'Plano / Patrocinadora: '#39' || PL' +
        '.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      '   FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      '   WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '     AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      ''
      
        '  (SELECT I.DESITEMOPCIND, H.SLDHISTOPCIND, H.IDHISTOPCIND, H.ID' +
        'ITEMOPCIND'
      '   FROM HISTOPCINDXITENS H, ITEMOPCIND I'
      '   WHERE  H.IDHISTOPCIND IN'
      '         (SELECT IDHISTOPCIND'
      '          FROM HISTOPCIND H1'
      '            WHERE (H1.DATAHISTOPCIND || H1.IDHISTOPCIND) IN'
      '                (SELECT MAX(DATAHISTOPCIND) || MAX(IDHISTOPCIND)'
      '             FROM HISTOPCIND'
      
        '               WHERE'#9' DATAHISTOPCIND <= TO_DATE(:DATAHISTOPCIND,' +
        ' '#39'DD/MM/YYYY'#39')'
      
        '                 AND (((:IDINVESTIMENTO IS NOT NULL) AND (IDINVE' +
        'STIMENTO = :IDINVESTIMENTO)) OR'
      '                       (:IDINVESTIMENTO IS NULL))'
      
        '                 AND (((:IDBOLETA IS NOT NULL) AND (IDBOLETA = :' +
        'IDBOLETA)) OR'
      '                       (:IDBOLETA IS NULL))'
      
        '                 AND (((:IDPLANPREVCTBPATR IS NOT NULL) AND (IDP' +
        'LANPREVCTBPATR = :IDPLANPREVCTBPATR)) OR'
      '                       (:IDPLANPREVCTBPATR IS NULL))'
      '               GROUP BY IDINVESTIMENTO))  AND'
      '         (H.IDITEMOPCIND = -8)            AND'
      '         (I.IDITEMOPCIND(+) = H.IDITEMOPCIND)) AJU,'
      ''
      
        '  (SELECT I.DESITEMOPCIND, H.SLDHISTOPCIND, H.IDHISTOPCIND, H.ID' +
        'ITEMOPCIND'
      '   FROM HISTOPCINDXITENS H, ITEMOPCIND I'
      '   WHERE  H.IDHISTOPCIND IN'
      '         (SELECT IDHISTOPCIND'
      '          FROM HISTOPCIND H1'
      '            WHERE (H1.DATAHISTOPCIND || H1.IDHISTOPCIND) IN'
      '                (SELECT MAX(DATAHISTOPCIND) || MAX(IDHISTOPCIND)'
      '             FROM HISTOPCIND'
      
        '               WHERE'#9' DATAHISTOPCIND <= TO_DATE(:DATAHISTOPCIND,' +
        ' '#39'DD/MM/YYYY'#39')'
      
        '                 AND (((:IDINVESTIMENTO IS NOT NULL) AND (IDINVE' +
        'STIMENTO = :IDINVESTIMENTO)) OR'
      '                       (:IDINVESTIMENTO IS NULL))'
      
        '                 AND (((:IDBOLETA IS NOT NULL) AND (IDBOLETA = :' +
        'IDBOLETA)) OR'
      '                       (:IDBOLETA IS NULL))'
      
        '                 AND (((:IDPLANPREVCTBPATR IS NOT NULL) AND (IDP' +
        'LANPREVCTBPATR = :IDPLANPREVCTBPATR)) OR'
      '                       (:IDPLANPREVCTBPATR IS NULL))'
      '               GROUP BY IDINVESTIMENTO))  AND'
      '         (H.IDITEMOPCIND = -7)            AND'
      '         (I.IDITEMOPCIND(+) = H.IDITEMOPCIND)) CES'
      'WHERE'
      '      (H.DATAHISTOPCIND || H.IDHISTOPCIND IN'
      '          (SELECT MAX(DATAHISTOPCIND) || MAX(IDHISTOPCIND)'
      '           FROM HISTOPCIND'
      
        '           WHERE DATAHISTOPCIND <= TO_DATE(:DATAHISTOPCIND, '#39'DD/' +
        'MM/YYYY'#39')'
      
        '             AND (((:IDINVESTIMENTO IS NOT NULL) AND (IDINVESTIM' +
        'ENTO = :IDINVESTIMENTO)) OR'
      '                   (:IDINVESTIMENTO IS NULL))'
      
        '             AND (((:IDBOLETA IS NOT NULL) AND (IDBOLETA = :IDBO' +
        'LETA)) OR'
      '                   (:IDBOLETA IS NULL))'
      
        '             AND (((:IDPLANPREVCTBPATR IS NOT NULL) AND (IDPLANP' +
        'REVCTBPATR = :IDPLANPREVCTBPATR)) OR'
      '                   (:IDPLANPREVCTBPATR IS NULL))'
      '           GROUP BY IDINVESTIMENTO))'
      '  AND (H.SLDVLRHISTOPCIND  > 0)'
      '  AND (H.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (H.IDINVESTIMENTO    = I.IDINVESTIMENTO)'
      '  AND (H.IDCARTEIRAINVEST  = C.IDCARTEIRAINVEST)'
      '  AND (H.IDINVESTIMENTO    = O.IDINVESTIMENTO)'
      '  AND (AJU.IDHISTOPCIND    = H.IDHISTOPCIND)'
      '  AND (CES.IDHISTOPCIND    = H.IDHISTOPCIND)'
      ''
      
        'GROUP BY PP.PLANPRVCONTABPATRO, C.DESCCARTINVEST, I.DESCINVESTIM' +
        'ENTO, H.DATAHISTOPCIND,'
      
        '          H.IDBOLETA,           H.IDLOTE,         H.SLDQTDHISTOP' +
        'CIND'
      ''
      'ORDER BY I.DESCINVESTIMENTO          '
      ''
      '')
    ValidateWithMask = True
    Left = 38
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAHISTOPCIND'
        ParamType = ptResult
        Value = '14/04/2004'
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
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTOPCIND'
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
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTOPCIND'
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
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end>
    object qryHistOpcIndDATAHISTOPCIND: TDateTimeField
      DisplayLabel = 'Data do Saldo'
      DisplayWidth = 11
      FieldName = 'DATAHISTOPCIND'
    end
    object qryHistOpcIndDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 38
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryHistOpcIndIDBOLETA: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 10
      FieldName = 'IDBOLETA'
      Size = 30
    end
    object qryHistOpcIndIDLOTE: TStringField
      DisplayLabel = 'Lote'
      DisplayWidth = 5
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryHistOpcIndSLDQTDHISTOPCIND: TFloatField
      DisplayLabel = 'Saldo Quantidade'
      DisplayWidth = 18
      FieldName = 'SLDQTDHISTOPCIND'
      DisplayFormat = '###,###,###,###'
    end
    object qryHistOpcIndSLDVLRHISTOPCIND: TFloatField
      DisplayLabel = 'Saldo Valor'
      DisplayWidth = 19
      FieldName = 'SLDVLRHISTOPCIND'
      DisplayFormat = '###,###,###,###0.00'
    end
    object qryHistOpcIndPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 40
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 136
    end
    object qryHistOpcIndDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira de Investimenot'
      DisplayWidth = 30
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryHistOpcIndAJUSTE: TFloatField
      FieldName = 'AJUSTE'
      Visible = False
    end
    object qryHistOpcIndCESTA: TFloatField
      FieldName = 'CESTA'
      Visible = False
    end
  end
  object qryHistOpcIndANTIGA: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PP.PLANPRVCONTABPATRO, C.DESCCARTINVEST,   I.DESCINVESTIM' +
        'ENTO,   H.DATAHISTOPCIND,'
      
        '       H.IDBOLETA,            H.IDLOTE,           H.SLDQTDHISTOP' +
        'CIND,'
      '       H.IDHISTOPCIND,'
      '     AJU.SLDHISTOPCIND AS AJUSTE,'
      '     CES.SLDHISTOPCIND AS CESTA,'
      '     AJU.SLDHISTOPCIND + CES.SLDHISTOPCIND AS SLDVLRHISTOPCIND'
      'FROM'
      '  HISTOPCIND H, INVESTIMENTO I, CARTEIRAINVEST C, OPCOES O,'
      ''
      
        '  (SELECT PA.IDPLANPREVCTBPATR, ('#39'Plano / Patrocinadora: '#39' || PL' +
        '.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      '   FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      '   WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '     AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      ''
      
        '  (SELECT I.DESITEMOPCIND, H.SLDHISTOPCIND, H.IDHISTOPCIND, H.ID' +
        'ITEMOPCIND'
      '   FROM HISTOPCINDXITENS H, ITEMOPCIND I'
      '   WHERE  H.IDHISTOPCIND IN'
      '         (SELECT IDHISTOPCIND'
      '          FROM HISTOPCIND H1'
      '            WHERE (H1.DATAHISTOPCIND || H1.IDHISTOPCIND) IN'
      '                (SELECT MAX(DATAHISTOPCIND) || MAX(IDHISTOPCIND)'
      '             FROM HISTOPCIND'
      
        '               WHERE'#9' DATAHISTOPCIND <= TO_DATE(:DATAHISTOPCIND,' +
        ' '#39'DD/MM/YYYY'#39')'
      
        '                 AND (((:IDINVESTIMENTO IS NOT NULL) AND (IDINVE' +
        'STIMENTO = :IDINVESTIMENTO)) OR'
      '                       (:IDINVESTIMENTO IS NULL))'
      
        '                 AND (((:IDBOLETA IS NOT NULL) AND (IDBOLETA = :' +
        'IDBOLETA)) OR'
      '                       (:IDBOLETA IS NULL))'
      
        '                 AND (((:IDPLANPREVCTBPATR IS NOT NULL) AND (IDP' +
        'LANPREVCTBPATR = :IDPLANPREVCTBPATR)) OR'
      '                       (:IDPLANPREVCTBPATR IS NULL))'
      '               GROUP BY IDINVESTIMENTO))  AND'
      '         (H.IDITEMOPCIND = -8)            AND'
      '         (I.IDITEMOPCIND(+) = H.IDITEMOPCIND)) AJU,'
      ''
      
        '  (SELECT I.DESITEMOPCIND, H.SLDHISTOPCIND, H.IDHISTOPCIND, H.ID' +
        'ITEMOPCIND'
      '   FROM HISTOPCINDXITENS H, ITEMOPCIND I'
      '   WHERE  H.IDHISTOPCIND IN'
      '         (SELECT IDHISTOPCIND'
      '          FROM HISTOPCIND H1'
      '            WHERE (H1.DATAHISTOPCIND || H1.IDHISTOPCIND) IN'
      '                (SELECT MAX(DATAHISTOPCIND) || MAX(IDHISTOPCIND)'
      '             FROM HISTOPCIND'
      
        '               WHERE'#9' DATAHISTOPCIND <= TO_DATE(:DATAHISTOPCIND,' +
        ' '#39'DD/MM/YYYY'#39')'
      
        '                 AND (((:IDINVESTIMENTO IS NOT NULL) AND (IDINVE' +
        'STIMENTO = :IDINVESTIMENTO)) OR'
      '                       (:IDINVESTIMENTO IS NULL))'
      
        '                 AND (((:IDBOLETA IS NOT NULL) AND (IDBOLETA = :' +
        'IDBOLETA)) OR'
      '                       (:IDBOLETA IS NULL))'
      
        '                 AND (((:IDPLANPREVCTBPATR IS NOT NULL) AND (IDP' +
        'LANPREVCTBPATR = :IDPLANPREVCTBPATR)) OR'
      '                       (:IDPLANPREVCTBPATR IS NULL))'
      '               GROUP BY IDINVESTIMENTO))  AND'
      '         (H.IDITEMOPCIND = -7)            AND'
      '         (I.IDITEMOPCIND(+) = H.IDITEMOPCIND)) CES'
      'WHERE'
      '      (H.DATAHISTOPCIND || H.IDHISTOPCIND IN'
      '          (SELECT MAX(DATAHISTOPCIND) || MAX(IDHISTOPCIND)'
      '           FROM HISTOPCIND'
      
        '           WHERE DATAHISTOPCIND <= TO_DATE(:DATAHISTOPCIND, '#39'DD/' +
        'MM/YYYY'#39')'
      
        '             AND (((:IDINVESTIMENTO IS NOT NULL) AND (IDINVESTIM' +
        'ENTO = :IDINVESTIMENTO)) OR'
      '                   (:IDINVESTIMENTO IS NULL))'
      
        '             AND (((:IDBOLETA IS NOT NULL) AND (IDBOLETA = :IDBO' +
        'LETA)) OR'
      '                   (:IDBOLETA IS NULL))'
      
        '             AND (((:IDPLANPREVCTBPATR IS NOT NULL) AND (IDPLANP' +
        'REVCTBPATR = :IDPLANPREVCTBPATR)) OR'
      '                   (:IDPLANPREVCTBPATR IS NULL))'
      '           GROUP BY IDINVESTIMENTO))'
      '  AND (H.SLDVLRHISTOPCIND  > 0)'
      '  AND (H.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (H.IDINVESTIMENTO    = I.IDINVESTIMENTO)'
      '  AND (H.IDCARTEIRAINVEST  = C.IDCARTEIRAINVEST)'
      '  AND (H.IDINVESTIMENTO    = O.IDINVESTIMENTO)'
      '  AND (AJU.IDHISTOPCIND    = H.IDHISTOPCIND)'
      '  AND (CES.IDHISTOPCIND    = H.IDHISTOPCIND)'
      ''
      'ORDER BY PP.PLANPRVCONTABPATRO, C.DESCCARTINVEST,'
      '         H.IDBOLETA, H.IDLOTE, O.STAOPCCOMPRA'
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
      ' ')
    ValidateWithMask = True
    Left = 158
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAHISTOPCIND'
        ParamType = ptResult
        Value = '05/06/2003'
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
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTOPCIND'
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
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTOPCIND'
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
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end>
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data do Saldo'
      DisplayWidth = 11
      FieldName = 'DATAHISTOPCIND'
    end
    object StringField1: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 38
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object StringField2: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 10
      FieldName = 'IDBOLETA'
      Size = 30
    end
    object StringField3: TStringField
      DisplayLabel = 'Lote'
      DisplayWidth = 5
      FieldName = 'IDLOTE'
      Size = 10
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Saldo Quantidade'
      DisplayWidth = 18
      FieldName = 'SLDQTDHISTOPCIND'
      DisplayFormat = '###,###,###,###'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Saldo Valor'
      DisplayWidth = 19
      FieldName = 'SLDVLRHISTOPCIND'
      DisplayFormat = '###,###,###,###0.00'
    end
    object StringField4: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 40
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 136
    end
    object StringField5: TStringField
      DisplayLabel = 'Carteira de Investimenot'
      DisplayWidth = 30
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object FloatField3: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHISTOPCIND'
      Visible = False
    end
    object FloatField4: TFloatField
      FieldName = 'AJUSTE'
      Visible = False
    end
    object FloatField5: TFloatField
      FieldName = 'CESTA'
    end
  end
end
