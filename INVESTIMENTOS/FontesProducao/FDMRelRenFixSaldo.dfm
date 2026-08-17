inherited DmRelRenFixSaldo: TDmRelRenFixSaldo
  Left = 417
  Top = 304
  Width = 387
  Height = 267
  Caption = 'DmRelRenFixSaldo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 181
    Top = 8
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
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
    Left = 183
    Top = 8
  end
  inherited qryExemplo: TwwQuery
    Left = 178
    Top = 8
  end
  inherited rpExemplo: TppReport
    Left = 178
    Top = 8
    DataPipelineName = 'pplExemplo'
    inherited HeaderBand1: TppHeaderBand
      mmHeight = 25135
      inherited Label11: TppLabel
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taLeftJustified
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8202
        mmWidth = 31750
      end
      inherited Line1: TppLine
        mmTop = 23548
        mmWidth = 197380
      end
      inherited LblEmpresa: TppLabel
        Font.Size = 12
        TextAlignment = taLeftJustified
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
      end
      object ppLCarteiraEx: TppLabel
        UserName = 'LCarteira1'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182827
        mmTop = 12171
        mmWidth = 12171
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
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'LPeriodo1'
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
    end
  end
  object rptRenFixSaldo: TppReport
    AutoStop = False
    DataPipeline = pplHistorico
    OnStartPage = rptRenFixSaldoStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Saldos de Renda Fixa'
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
    AfterPrint = rptRenFixSaldoAfterPrint
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rptRenFixSaldoBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 42
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplHistorico'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28310
      mmPrintPosition = 0
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        mmHeight = 8996
        mmLeft = 0
        mmTop = 19050
        mmWidth = 284692
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 172244
        mmTop = 19844
        mmWidth = 15611
        BandType = 0
      end
      object pplblVlrBruto: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Valor Líquido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 261144
        mmTop = 19845
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Classe de Risco Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 3439
        mmTop = 24077
        mmWidth = 41275
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Aplicação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 139965
        mmTop = 19844
        mmWidth = 14288
        BandType = 0
      end
      object rptRenFixSaldoTitulo: TppLabel
        UserName = 'rptRenFixSaldoTitulo'
        Caption = 'Saldos de Renda Fixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8202
        mmWidth = 36777
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
        mmHeight = 5027
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object ppLPeriodo: TppLabel
        UserName = 'LPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        Visible = False
        mmHeight = 3683
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 11853
        BandType = 0
      end
      object ppDbLogo: TppDBImage
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
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 'Carteira    Hipotecária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3175
        mmLeft = 100013
        mmTop = 19579
        mmWidth = 35190
        BandType = 0
      end
      object ppLCarteira: TppDBText
        UserName = 'ppLCarteira'
        AutoSize = True
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = pplHistorico
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 3683
        mmLeft = 243841
        mmTop = 14023
        mmWidth = 39793
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2911
        mmLeft = 3440
        mmTop = 19845
        mmWidth = 53975
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3175
        mmLeft = 115359
        mmTop = 22490
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3175
        mmLeft = 100013
        mmTop = 22490
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 156104
        mmTop = 19844
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Caption = 'Carteira SPC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 59002
        mmTop = 24077
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'IOF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 237067
        mmTop = 19845
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Valor Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 190236
        mmTop = 19845
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'Vigência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 156104
        mmTop = 24077
        mmWidth = 14288
        BandType = 0
      end
      object pplPerPenhora: TppLabel
        UserName = 'lPerPenhora'
        AutoSize = False
        Caption = '% Penhorado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 172509
        mmTop = 24077
        mmWidth = 15611
        BandType = 0
      end
      object pplQtdPenhora: TppLabel
        UserName = 'lQtdPenhora'
        AutoSize = False
        Caption = 'Qtd Penhorada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 190236
        mmTop = 24077
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label102'
        AutoSize = False
        Caption = 'Agio/Desagio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 214048
        mmTop = 19844
        mmWidth = 22225
        BandType = 0
      end
      object dbDataOper: TppDBText
        UserName = 'dbDataOper'
        DataField = 'DATAHISTRENFIX'
        DataPipeline = pplHistorico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        ReprintOnSubsequent = True
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 3683
        mmLeft = 39688
        mmTop = 14023
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label301'
        Caption = 'Cód. ISIN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 59002
        mmTop = 19844
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = 'Inv. p/ negociação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 75142
        mmTop = 19844
        mmWidth = 23548
        BandType = 0
      end
    end
    object bndDetalhe: TppDetailBand
      AfterPrint = bndDetalheAfterPrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 12700
      mmPrintPosition = 0
      object shpRenFixSaldoDetPai: TppShape
        OnPrint = shpRenFixSaldoDetPaiPrint
        UserName = 'shpRenFixSaldoDetPai'
        Pen.Style = psClear
        mmHeight = 7938
        mmLeft = 0
        mmTop = 529
        mmWidth = 284428
        BandType = 4
      end
      object dbQuantidade: TppDBText
        UserName = 'dbQuantidade'
        DataField = 'SALDOQTDHISTRENFI'
        DataPipeline = pplHistorico
        DisplayFormat = '###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 172244
        mmTop = 529
        mmWidth = 15611
        BandType = 4
      end
      object dbValorOperacao: TppDBText
        UserName = 'dbValorOperacao'
        DataField = 'SALDOVLRHISTLIQ'
        DataPipeline = pplHistorico
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 261143
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
      object srptRenFixSaldo: TppSubReport
        OnPrint = srptRenFixSaldoPrint
        UserName = 'srptRenFixSaldo'
        DrillDownComponent = dbtDescInvestimento
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplItems'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 7673
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplItems
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Saldos de Renda Fixa'
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
          Left = 456
          Top = 296
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplItems'
          object cabSubRelItens: TppHeaderBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppShape1: TppShape
              UserName = 'Shape1'
              Brush.Color = clSilver
              mmHeight = 4233
              mmLeft = 18785
              mmTop = 0
              mmWidth = 265113
              BandType = 0
            end
            object ppLabel13: TppLabel
              UserName = 'Label13'
              Caption = 'Descrição do Item'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 19315
              mmTop = 529
              mmWidth = 21167
              BandType = 0
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              Caption = 'P.U. do Item'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 120121
              mmTop = 529
              mmWidth = 14288
              BandType = 0
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'Valor do Item'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 163777
              mmTop = 529
              mmWidth = 15610
              BandType = 0
            end
            object ppLabel15: TppLabel
              UserName = 'Label15'
              Caption = 'Regra Utilizada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 264848
              mmTop = 529
              mmWidth = 17727
              BandType = 0
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object shpRenFixSaldoDetFilho: TppShape
              OnPrint = shpRenFixSaldoDetFilhoPrint
              UserName = 'shpRenFixSaldoDetFilho'
              Pen.Style = psClear
              mmHeight = 4233
              mmLeft = 18785
              mmTop = 0
              mmWidth = 265378
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              DataField = 'DESCITEMRENFIX'
              DataPipeline = pplItems
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplItems'
              mmHeight = 3175
              mmLeft = 19315
              mmTop = 529
              mmWidth = 79111
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              DataField = 'NOMEREGRA'
              DataPipeline = pplItems
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplItems'
              mmHeight = 3175
              mmLeft = 196321
              mmTop = 529
              mmWidth = 87313
              BandType = 4
            end
            object dbtValorItem: TppDBText
              OnPrint = dbtValorItemPrint
              UserName = 'dbtValorItem'
              DataField = 'VLRITEM'
              DataPipeline = pplItems
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplItems'
              mmHeight = 3175
              mmLeft = 148961
              mmTop = 529
              mmWidth = 30956
              BandType = 4
            end
            object ppDBPUItem: TppDBText
              OnPrint = ppDBPUItemPrint
              UserName = 'DBPUItem'
              DataField = 'PUITEM'
              DataPipeline = pplItems
              DisplayFormat = '###,###,###,###,##0.00#######'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplItems'
              mmHeight = 3175
              mmLeft = 106892
              mmTop = 529
              mmWidth = 28310
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 2910
            mmPrintPosition = 0
            object ppLine1: TppLine
              UserName = 'Line1'
              Weight = 0.75
              mmHeight = 1852
              mmLeft = 18785
              mmTop = 0
              mmWidth = 265642
              BandType = 7
            end
          end
          object ppGroup3: TppGroup
            BreakName = 'DESCCURVARENFIX'
            DataPipeline = pplItems
            OutlineSettings.CreateNode = True
            UserName = 'Group3'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'pplItems'
            object ppGroupHeaderBand3: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object ppShape2: TppShape
                UserName = 'Shape2'
                Brush.Color = clSilver
                Pen.Style = psClear
                mmHeight = 4763
                mmLeft = 18785
                mmTop = 0
                mmWidth = 265378
                BandType = 3
                GroupNo = 0
              end
              object ppDBText2: TppDBText
                UserName = 'DBText2'
                DataField = 'DESCCURVARENFIX'
                DataPipeline = pplItems
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                DataPipelineName = 'pplItems'
                mmHeight = 3175
                mmLeft = 29633
                mmTop = 794
                mmWidth = 91546
                BandType = 3
                GroupNo = 0
              end
              object ppLabel12: TppLabel
                UserName = 'Label12'
                Caption = 'Perfil: '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 19315
                mmTop = 794
                mmWidth = 8467
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand3: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
      object dbtDescInvestimento: TppDBText
        UserName = 'dbtDescInvestimento'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = pplHistorico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 3439
        mmTop = 529
        mmWidth = 53975
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DATAOPERACAO'
        DataPipeline = pplHistorico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 139965
        mmTop = 529
        mmWidth = 14288
        BandType = 4
      end
      object dbtNomeClassRisco: TppDBText
        OnPrint = dbtNomeClassRiscoPrint
        UserName = 'dbtNomeClassRisco'
        DataField = 'NOMECLASSRISCO'
        DataPipeline = pplHistorico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 3439
        mmTop = 4234
        mmWidth = 54240
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'dbQuantidade1'
        DataField = 'QTDCARTHIPO'
        DataPipeline = pplHistorico
        DisplayFormat = '###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 98161
        mmTop = 529
        mmWidth = 19845
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VLRCARTHIPO'
        DataPipeline = pplHistorico
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 119063
        mmTop = 529
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'VENCOPERACAO'
        DataPipeline = pplHistorico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 155840
        mmTop = 529
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText11: TppDBText
        OnPrint = dbtNomeClassRiscoPrint
        UserName = 'dbtNomeClassRisco1'
        DataField = 'DESCARTEIRASPC'
        DataPipeline = pplHistorico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 59002
        mmTop = 4234
        mmWidth = 59267
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'dbValorOperacao1'
        DataField = 'VLRIOF'
        DataPipeline = pplHistorico
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 237596
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'dbValorOperacao2'
        DataField = 'SALDOVLRHISTRENFI'
        DataPipeline = pplHistorico
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 190500
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText101'
        DataField = 'DATAVIGENCIA'
        DataPipeline = pplHistorico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 155840
        mmTop = 4233
        mmWidth = 14288
        BandType = 4
      end
      object ppdbPercPenhora: TppDBText
        UserName = 'dbQuantidade2'
        DataField = 'PERCPENHORA'
        DataPipeline = pplHistorico
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 172244
        mmTop = 4233
        mmWidth = 15611
        BandType = 4
      end
      object ppdbQtdPenhora: TppDBText
        UserName = 'dbQtdPenhora'
        DataField = 'QTDPENHORA'
        DataPipeline = pplHistorico
        DisplayFormat = '###,###,###,###,##0.0000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 190500
        mmTop = 4233
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'VLRAGDESAG'
        DataPipeline = pplHistorico
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 214048
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'CODISIN'
        DataPipeline = pplHistorico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 59002
        mmTop = 529
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText1'
        DataField = 'FLGNEGOCIACAO'
        DataPipeline = pplHistorico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 85196
        mmTop = 529
        mmWidth = 7144
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7144
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
        mmWidth = 283634
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
        mmWidth = 283634
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
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
        mmLeft = 258498
        mmTop = 3175
        mmWidth = 25400
        BandType = 8
      end
    end
    object bndSumario: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape4'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
      end
      object ppLabel7: TppLabel
        UserName = 'Label3'
        Caption = 'Total na Data: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 3440
        mmTop = 0
        mmWidth = 16933
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'SALDOVLRHISTLIQ'
        DataPipeline = pplHistorico
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        LookAhead = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 261144
        mmTop = 0
        mmWidth = 22225
        BandType = 7
      end
      object ppDBCalc16: TppDBCalc
        UserName = 'DBCalc16'
        DataField = 'SALDOVLRHISTRENFI'
        DataPipeline = pplHistorico
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 190500
        mmTop = 0
        mmWidth = 22225
        BandType = 7
      end
      object ppDBCalc17: TppDBCalc
        UserName = 'DBCalc17'
        DataField = 'VLRIOF'
        DataPipeline = pplHistorico
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 237597
        mmTop = 0
        mmWidth = 22225
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'VLRAGDESAG'
        DataPipeline = pplHistorico
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 214048
        mmTop = 0
        mmWidth = 22225
        BandType = 7
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = pplHistorico
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplHistorico'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
        object ppShape3: TppShape
          UserName = 'shpTitData1'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 4233
          mmLeft = 529
          mmTop = 0
          mmWidth = 284163
          BandType = 3
          GroupNo = 0
        end
      end
      object bndRodapePlano: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object shpTotalPlano: TppShape
          UserName = 'shpTotalPlano'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 3969
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'Total do Plano / Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 3440
          mmTop = 529
          mmWidth = 33073
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'SALDOVLRHISTLIQ'
          DataPipeline = pplHistorico
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplHistorico'
          mmHeight = 2910
          mmLeft = 261143
          mmTop = 794
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          DataField = 'SALDOVLRHISTRENFI'
          DataPipeline = pplHistorico
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplHistorico'
          mmHeight = 2910
          mmLeft = 190500
          mmTop = 794
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'VLRIOF'
          DataPipeline = pplHistorico
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplHistorico'
          mmHeight = 2910
          mmLeft = 237597
          mmTop = 794
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'VLRAGDESAG'
          DataPipeline = pplHistorico
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplHistorico'
          mmHeight = 2910
          mmLeft = 214048
          mmTop = 794
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DATAHISTRENFIX'
      DataPipeline = pplHistorico
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplHistorico'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'DESCCLASSETIT'
      DataPipeline = pplHistorico
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplHistorico'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object shpClasseTit: TppShape
          UserName = 'shpTitData2'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 3970
          mmLeft = 0
          mmTop = 0
          mmWidth = 284692
          BandType = 3
          GroupNo = 2
        end
        object ppLabel1: TppLabel
          UserName = 'Label9'
          Caption = 'Classe :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 3440
          mmTop = 529
          mmWidth = 9525
          BandType = 3
          GroupNo = 2
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          DataField = 'DESCCLASSETIT'
          DataPipeline = pplHistorico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplHistorico'
          mmHeight = 2910
          mmLeft = 14552
          mmTop = 529
          mmWidth = 60590
          BandType = 3
          GroupNo = 2
        end
      end
      object bndRodapeClasse: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppShape7: TppShape
          UserName = 'shpTotalPlano1'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 3970
          mmLeft = 0
          mmTop = 0
          mmWidth = 284692
          BandType = 5
          GroupNo = 2
        end
        object ppLabel25: TppLabel
          UserName = 'Label25'
          Caption = 'Total da Classe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 3440
          mmTop = 529
          mmWidth = 16933
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'SALDOVLRHISTLIQ'
          DataPipeline = pplHistorico
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplHistorico'
          mmHeight = 2910
          mmLeft = 261143
          mmTop = 529
          mmWidth = 22225
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'SALDOVLRHISTRENFI'
          DataPipeline = pplHistorico
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplHistorico'
          mmHeight = 2910
          mmLeft = 190500
          mmTop = 528
          mmWidth = 22225
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'VLRIOF'
          DataPipeline = pplHistorico
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplHistorico'
          mmHeight = 2910
          mmLeft = 237597
          mmTop = 528
          mmWidth = 22225
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'VLRAGDESAG'
          DataPipeline = pplHistorico
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplHistorico'
          mmHeight = 2910
          mmLeft = 214048
          mmTop = 529
          mmWidth = 22225
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'SIGLAEMISSOR'
      DataPipeline = pplHistorico
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplHistorico'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object shpTitEmissor: TppShape
          UserName = 'shpTitEmissor'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 3970
          mmLeft = 0
          mmTop = 0
          mmWidth = 284692
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          Caption = 'Emissor: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 3440
          mmTop = 529
          mmWidth = 11113
          BandType = 3
          GroupNo = 1
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'SIGLAEMISSOR'
          DataPipeline = pplHistorico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplHistorico'
          mmHeight = 2910
          mmLeft = 16404
          mmTop = 529
          mmWidth = 60590
          BandType = 3
          GroupNo = 1
        end
      end
      object bndRodapeSigla: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object shpTotalEmissor: TppShape
          UserName = 'shpTotalEmissor'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 3969
          mmLeft = 0
          mmTop = 0
          mmWidth = 284692
          BandType = 5
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label4'
          Caption = 'Total do Emissor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 3440
          mmTop = 529
          mmWidth = 18785
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'SALDOVLRHISTRENFI'
          DataPipeline = pplHistorico
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplHistorico'
          mmHeight = 2910
          mmLeft = 190500
          mmTop = 529
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'VLRIOF'
          DataPipeline = pplHistorico
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplHistorico'
          mmHeight = 2910
          mmLeft = 237597
          mmTop = 529
          mmWidth = 22225
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'SALDOVLRHISTLIQ'
          DataPipeline = pplHistorico
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplHistorico'
          mmHeight = 2910
          mmLeft = 261143
          mmTop = 529
          mmWidth = 22225
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'VLRAGDESAG'
          DataPipeline = pplHistorico
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplHistorico'
          mmHeight = 2910
          mmLeft = 214048
          mmTop = 529
          mmWidth = 22225
          BandType = 5
          GroupNo = 3
        end
      end
    end
  end
  object pplHistorico: TppBDEPipeline
    DataSource = dsHistorico
    UserName = 'lHistorico'
    Left = 28
    Top = 56
  end
  object pplItems: TppBDEPipeline
    DataSource = dsItens
    UserName = 'pplItems'
    Left = 93
    Top = 56
  end
  object dsHistorico: TwwDataSource
    DataSet = qryHistorico
    Left = 29
    Top = 112
  end
  object dsItens: TwwDataSource
    DataSet = qryItens
    Left = 94
    Top = 112
  end
  object qryHistorico: TwwQuery
    AfterScroll = qryHistoricoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   DECODE(OPERAP.DATAOPERACAO,NULL,OP.DATAOPERACAO,OPERAP.DATAOP' +
        'ERACAO) AS DATAOPERACAO,'
      
        '   PP.PLANPRVCONTABPATRO, TO_DATE(:DATAHISTRENFIX,'#39'DD/MM/YYYY'#39') ' +
        'AS DATAHISTRENFIX,'
      
        '   EM.SIGLAEMISSOR, IV.DESCINVESTIMENTO ||'#39' : '#39'|| OP.BOLETA AS D' +
        'ESCINVESTIMENTO, IV.CODISIN, '
      '   IV.DESCINVESTIMENTO AS INVESTIMENTO,'
      '   HO.DATAVIGENCIA, HO.DATAVENCTOATU AS VENCOPERACAO,'
      
        '   TO_NUMBER(DECODE(IV.IDCLASSETIT, PV.IDCLASSETIT, NULL, HR.SAL' +
        'DOQTDHISTRENFI)) AS SALDOQTDHISTRENFI,'
      '   HR.SALDOVLRHISTRENFI,'
      '   NVL(IOF.VLRACUIOF,0) AS VLRIOF,'
      '   NVL(AGI.VLRACUADE,0) AS VLRAGIO,'
      '   NVL(DGI.VLRACUADE,0) AS VLRDESAGIO,'
      ''
      
        '   DECODE(NVL(AGI.VLRACUADE,0),0,DECODE(NVL(DGI.VLRACUADE,0),0,0' +
        ',NVL(DGI.VLRACUADE,0)),NVL(AGI.VLRACUADE,0)) AS VLRAGDESAG,'
      ''
      '   NVL(PEN.QTDPENHORA,0) AS QTDPENHORA,'
      
        '   ((NVL(PEN.QTDPENHORA,0) * 100)/ HR.SALDOQTDHISTRENFI) AS PERC' +
        'PENHORA,'
      
        '   (HR.SALDOVLRHISTRENFI - NVL(IOF.VLRACUIOF,0) + NVL(AGI.VLRACU' +
        'ADE,0) + NVL(DGI.VLRACUADE,0)) AS SALDOVLRHISTLIQ,'
      '   HR.IDHISTRENFIX, CR.NIVELCLASSRISCO,'
      '   CS.DESCARTEIRASPC, CR.CORCLASSRISCO, CR.NOMECLASSRISCO,'
      '   OP2.QTDCARTHIPO,'
      
        '   DECODE(HR.SALDOQTDHISTRENFI, 0, 0,(OP2.QTDCARTHIPO * (HR.SALD' +
        'OVLRHISTRENFI / HR.SALDOQTDHISTRENFI))) AS VLRCARTHIPO,'
      
        '   DECODE(OP.FLGNEGOCIACAO,'#39'S'#39','#39'Sim'#39', DECODE(OP.FLGNEGOCIACAO,'#39'N' +
        #39','#39'Não'#39', OP.FLGNEGOCIACAO)) AS FLGNEGOCIACAO,'
      '   CL.DESCCLASSETIT,'
      
        '   COUNT(*) OVER(PARTITION BY PP.PLANPRVCONTABPATRO) CONTADORPLA' +
        'NPATRO,'
      '   COUNT(*) OVER(PARTITION BY HR.DATAHISTRENFIX) CONTADORDATA,'
      '   COUNT(*) OVER(PARTITION BY CL.DESCCLASSETIT) CONTADORCLASSE,'
      '   COUNT(*) OVER(PARTITION BY EM.SIGLAEMISSOR) CONTADOREMISSOR'
      'FROM'
      
        '   HISTRENFIX HR, OPERRENFIX OP, INVESTIMENTO IV, EMISSOR EM, PA' +
        'RAMINVEST PV, CARTEIRASPC CS,'
      '   CLASSRISCORENFIX CR, CLASSETITRENFIX CL, HISTOPERRENFIX HO,'
      
        '   (SELECT PA.IDPLANPREVCTBPATR, ('#39'Plano / Patrocinadora: '#39' || P' +
        'L.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      '    FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      '    WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '      AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      
        '   (SELECT IDOPERRENFIX, IDOPERRENFIXAPLIC, NVL(QTDCARTHIPO,0) A' +
        'S QTDCARTHIPO'
      '    FROM OPERRENFIX'
      '    WHERE IDOPERRENFIX IN (SELECT MAX(IDOPERRENFIX)'
      '                       FROM OPERRENFIX'
      '                       GROUP BY IDOPERRENFIXAPLIC)) OP2,'
      '   (SELECT OPE.DATAOPERACAO,OPI.IDOPERRENFIX,OPI.BOLETA'
      '    FROM OPERRENFIX OPI,'
      
        '      (SELECT OP.DATAOPERACAO, OP.IDOPERRENFIXAPLIC,OPA.BOLETA, ' +
        'OPA.IDOPERRENFIX'
      '       FROM OPERRENFIX OP,'
      
        '         (SELECT OP1.IDOPERRENFIXAPLIC, OP1.BOLETA, OP1.IDOPERRE' +
        'NFIX'
      '          FROM OPERRENFIX OP1, INVESTIMENTO IV'
      '          WHERE (OP1.IDTIPOOPERACAO = -97)'
      
        '            AND ((:IDINVESTIMENTO IS NULL) OR (OP1.IDINVESTIMENT' +
        'O = :IDINVESTIMENTO))'
      
        '            AND ((:IDEMISSOR IS NULL)      OR (IV.IDEMISSOR = :I' +
        'DEMISSOR))'
      
        '            AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP1.IDPLANPREV' +
        'CTBPATR = :IDPLANPREVCTBPATR))'
      
        '            AND (OP1.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/M' +
        'M/YYYY'#39') AND'
      
        '                                          TO_DATE(:DATAHISTRENFI' +
        'X,'#39'DD/MM/YYYY'#39'))'
      '            AND (OP1.IDINVESTIMENTO = IV.IDINVESTIMENTO)) OPA'
      '       WHERE'
      '          (OP.IDOPERRENFIX = OPA.IDOPERRENFIXAPLIC) AND'
      '          (OP.IDOPERRENFIX = OP.IDOPERRENFIXAPLIC)) OPE'
      '    WHERE'
      '       (OPI.BOLETA = OPE.BOLETA) AND'
      '       (OPI.IDOPERRENFIXorig = OPE.IDOPERRENFIXAPLIC) AND'
      '       (OPI.IDTIPOOPERACAO = -98)) OPERAP,'
      
        '   (SELECT NVL(DECODE(NVL(HT.VLRACUITEM,0),0,HT.PUACUITEM,HT.VLR' +
        'ACUITEM),0) AS VLRACUIOF,'
      '           H.IDHISTRENFIX'
      
        '    FROM HISTRENFIXXITENS HT, HISTRENFIX H, INVESTIMENTO IV, HIS' +
        'TOPERRENFIX HO'
      
        '    WHERE (H.DATAHISTRENFIX BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY' +
        #39') AND'
      
        '                                    TO_DATE(:DATAHISTRENFIX,'#39'DD/' +
        'MM/YYYY'#39'))'
      '      AND ((H.DATAHISTRENFIX - HO.DATAVIGENCIA) < 30)'
      
        '      AND ((:IDINVESTIMENTO IS NULL)    OR (H.IDINVESTIMENTO = :' +
        'IDINVESTIMENTO))'
      
        '      AND ((:IDEMISSOR IS NULL)         OR (IV.IDEMISSOR = :IDEM' +
        'ISSOR))'
      
        '      AND ((:IDPLANPREVCTBPATR IS NULL) OR (H.IDPLANPREVCTBPATR ' +
        '= :IDPLANPREVCTBPATR))'
      '      AND (HT.IDITEMRENFIX = -8)'
      '      AND H.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '      AND HT.IDHISTRENFIX = H.IDHISTRENFIX'
      '      AND H.IDOPERRENFIXAPLIC = HO.IDOPERRENFIX )IOF,'
      ''
      
        '   (SELECT NVL(DECODE(NVL(HT.VLRACUITEM,0),0,HT.PUACUITEM,HT.VLR' +
        'ACUITEM),0) AS VLRACUADE,'
      '           H.IDHISTRENFIX'
      
        '    FROM HISTRENFIXXITENS HT, HISTRENFIX H, INVESTIMENTO IV, HIS' +
        'TOPERRENFIX HO'
      
        '    WHERE (H.DATAHISTRENFIX = TO_DATE(:DATAHISTRENFIX,'#39'DD/MM/YYY' +
        'Y'#39'))'
      
        '      AND ((:IDINVESTIMENTO IS NULL)    OR (H.IDINVESTIMENTO = :' +
        'IDINVESTIMENTO))'
      
        '      AND ((:IDEMISSOR IS NULL)         OR (IV.IDEMISSOR = :IDEM' +
        'ISSOR))'
      
        '      AND ((:IDPLANPREVCTBPATR IS NULL) OR (H.IDPLANPREVCTBPATR ' +
        '= :IDPLANPREVCTBPATR))'
      '      AND (HT.IDITEMRENFIX = -19)'
      '      AND H.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '      AND HT.IDHISTRENFIX = H.IDHISTRENFIX'
      '      AND H.IDOPERRENFIXAPLIC = HO.IDOPERRENFIX )AGI,'
      ''
      
        '   (SELECT NVL(DECODE(NVL(HT.VLRACUITEM,0),0,HT.PUACUITEM,HT.VLR' +
        'ACUITEM),0) AS VLRACUADE,'
      '           H.IDHISTRENFIX'
      
        '    FROM HISTRENFIXXITENS HT, HISTRENFIX H, INVESTIMENTO IV, HIS' +
        'TOPERRENFIX HO'
      
        '    WHERE (H.DATAHISTRENFIX = TO_DATE(:DATAHISTRENFIX,'#39'DD/MM/YYY' +
        'Y'#39'))'
      
        '      AND ((:IDINVESTIMENTO IS NULL)    OR (H.IDINVESTIMENTO = :' +
        'IDINVESTIMENTO))'
      
        '      AND ((:IDEMISSOR IS NULL)         OR (IV.IDEMISSOR = :IDEM' +
        'ISSOR))'
      
        '      AND ((:IDPLANPREVCTBPATR IS NULL) OR (H.IDPLANPREVCTBPATR ' +
        '= :IDPLANPREVCTBPATR))'
      '      AND (HT.IDITEMRENFIX = -20)'
      '      AND H.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '      AND HT.IDHISTRENFIX = H.IDHISTRENFIX'
      '      AND H.IDOPERRENFIXAPLIC = HO.IDOPERRENFIX )DGI,'
      ''
      '    (SELECT NVL(HT.PUACUITEM,0) AS QTDPENHORA,'
      '           H.IDHISTRENFIX'
      '    FROM HISTRENFIXXITENS HT, HISTRENFIX H, INVESTIMENTO IV'
      
        '    WHERE (H.DATAHISTRENFIX = TO_DATE(:DATAHISTRENFIX,'#39'DD/MM/YYY' +
        'Y'#39'))'
      
        '      AND ((:IDINVESTIMENTO IS NULL)    OR (H.IDINVESTIMENTO = :' +
        'IDINVESTIMENTO))'
      
        '      AND ((:IDEMISSOR IS NULL)         OR (IV.IDEMISSOR = :IDEM' +
        'ISSOR))'
      
        '      AND ((:IDPLANPREVCTBPATR IS NULL) OR (H.IDPLANPREVCTBPATR ' +
        '= :IDPLANPREVCTBPATR))'
      '      AND (HT.IDITEMRENFIX = -23)'
      '      AND H.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '      AND HT.IDHISTRENFIX = H.IDHISTRENFIX) PEN'
      ''
      
        'WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (HR.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      
        '  AND ((:IDINVESTIMENTO IS NULL)    OR (HR.IDINVESTIMENTO = :IDI' +
        'NVESTIMENTO))'
      
        '  AND ((:IDEMISSOR IS NULL)         OR (IV.IDEMISSOR = :IDEMISSO' +
        'R))'
      
        '  AND ((:IDCLASSETIT IS NULL)       OR (CL.IDCLASSETIT = :IDCLAS' +
        'SETIT))'
      
        '  AND ((OP.VENCOPERACAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')) OR (O' +
        'P.VENCOPERACAO IS NULL))'
      
        '  AND (((:TIPOMAIOR IS NOT NULL) AND (OP.DATAOPERACAO >= TO_DATE' +
        '(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') )) OR'
      
        '       ((:TIPOMENOR IS NOT NULL) AND (OP.DATAOPERACAO  < TO_DATE' +
        '(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') )) OR'
      '       ((:TIPOMAIOR IS NULL) AND (:TIPOMENOR IS NULL) ))'
      
        '  AND (HR.IDHISTRENFIX IN (SELECT DECODE(:ABERTURA,1,DECODE(H.ID' +
        'TIPOOPERACAO,-98,H.IDHISTRENFIX,H.IDHISTRENFIX),H.IDHISTRENFIX)'
      '                           FROM'
      
        '                              (SELECT DECODE(:ABERTURA,1,MIN(H1.' +
        'IDHISTRENFIX), MAX(H1.IDHISTRENFIX)) AS IDHISTRENFIX'
      '                              FROM HISTRENFIX H1'
      
        '                              WHERE (H1.DATAHISTRENFIX BETWEEN T' +
        'O_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      
        '                                                               T' +
        'O_DATE(:DATAHISTRENFIX,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND ((:IDINVESTIMENTO IS NULL)  ' +
        '  OR (H1.IDINVESTIMENTO = :IDINVESTIMENTO))'
      
        '                                AND ((:IDPLANPREVCTBPATR IS NULL' +
        ') OR (H1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                                AND ((H1.DATAHISTRENFIX || H1.ID' +
        'INVESTIMENTO || H1.IDOPERRENFIXAPLIC || H1.IDPLANPREVCTBPATR) IN'
      
        '                                            (SELECT MAX(H2.DATAH' +
        'ISTRENFIX) || H2.IDINVESTIMENTO || H2.IDOPERRENFIXAPLIC || H2.ID' +
        'PLANPREVCTBPATR'
      '                                             FROM HISTRENFIX H2'
      
        '                                             WHERE (H2.DATAHISTR' +
        'ENFIX BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      
        '                                                                ' +
        '              TO_DATE(:DATAHISTRENFIX,'#39'DD/MM/YYYY'#39'))'
      
        '                                               AND ((:IDPLANPREV' +
        'CTBPATR IS NULL) OR (H2.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                                             GROUP BY H2.IDINVES' +
        'TIMENTO, H2.IDOPERRENFIXAPLIC, H2.IDPLANPREVCTBPATR))'
      
        '                              GROUP BY H1.DATAHISTRENFIX, H1.IDI' +
        'NVESTIMENTO, H1.IDOPERRENFIXAPLIC, H1.IDPLANPREVCTBPATR)H2,'
      '                              HISTRENFIX H'
      
        '                          WHERE H.IDHISTRENFIX = H2.IDHISTRENFIX' +
        '))'
      ''
      '  AND (HR.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (IV.IDEMISSOR = EM.IDEMISSOR)'
      '  AND (IV.IDCLASSETIT = CL.IDCLASSETIT)'
      '  AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '  AND (HR.IDOPERRENFIXAPLIC = OP2.IDOPERRENFIXAPLIC)'
      '  AND (OP.IDCLASSRISCORENFIX = CR.IDCLASSRISCORENFIX(+))'
      '  AND (HR.IDOPERRENFIX = OPERAP.IDOPERRENFIX(+))'
      '  AND ('
      
        '       (((IV.IDCLASSETIT IN (PV.IDCLASSETIT, PV.IDCLASSPOUPBLOQ)' +
        ') AND (HR.SALDOVLRHISTRENFI > 0)) OR'
      '        (HR.SALDOQTDHISTRENFI > 0))'
      '        OR'
      '       ((HR.IDTIPOOPERACAO <> -98) AND (:ABERTURA = 1))'
      '      )'
      '  AND (CS.IDCARTEIRASPC(+) = IV.IDCARTEIRASPC)'
      '  AND (HR.IDHISTRENFIX = IOF.IDHISTRENFIX(+))'
      '  AND (HR.IDHISTRENFIX = PEN.IDHISTRENFIX(+))'
      '  AND (HR.IDHISTRENFIX = AGI.IDHISTRENFIX(+))'
      '  AND (HR.IDHISTRENFIX = DGI.IDHISTRENFIX(+))'
      '  AND (HO.IDOPERRENFIX = OP.IDOPERRENFIXAPLIC)'
      '  AND (HO.DATAVIGENCIA = (SELECT MAX(HO1.DATAVIGENCIA)'
      '                          FROM HISTOPERRENFIX HO1'
      
        '                          WHERE HO1.IDOPERRENFIX = OP.IDOPERRENF' +
        'IXAPLIC'
      
        '                            AND TRUNC(DATAVIGENCIA) <= TO_DATE(:' +
        'DATAHISTRENFIX,'#39'DD/MM/YYYY'#39')))'
      
        '  AND (((PEN.QTDPENHORA > 0) AND (:FLGPENHORA = 1)) OR (:FLGPENH' +
        'ORA = 0))'
      
        'ORDER BY PP.PLANPRVCONTABPATRO, DATAHISTRENFIX, CL.DESCCLASSETIT' +
        ',EM.SIGLAEMISSOR,'
      
        '         CR.NIVELCLASSRISCO, IV.DESCINVESTIMENTO, OP.DATAOPERACA' +
        'O'
      ' '
      '  '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 30
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
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
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
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
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
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
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
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
        Name = 'DATAHISTRENFIX'
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
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
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
        Name = 'DATAHISTRENFIX'
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
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
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
        Name = 'DATAHISTRENFIX'
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
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
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
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
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
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ABERTURA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'ABERTURA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
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
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
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
        Name = 'ABERTURA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'FLGPENHORA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGPENHORA'
        ParamType = ptUnknown
      end>
    object qryHistoricoPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 43
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryHistoricoDATAHISTRENFIX: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 11
      FieldName = 'DATAHISTRENFIX'
    end
    object qryHistoricoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 45
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryHistoricoDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Dt Aplicação'
      DisplayWidth = 12
      FieldName = 'DATAOPERACAO'
    end
    object qryHistoricoSALDOQTDHISTRENFI: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 14
      FieldName = 'SALDOQTDHISTRENFI'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryHistoricoSALDOVLRHISTRENFI: TFloatField
      DisplayLabel = 'Valor Bruto'
      DisplayWidth = 17
      FieldName = 'SALDOVLRHISTRENFI'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryHistoricoVLRIOF: TFloatField
      DisplayLabel = 'Valor IOF'
      DisplayWidth = 16
      FieldName = 'VLRIOF'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryHistoricoSALDOVLRHISTLIQ: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 17
      FieldName = 'SALDOVLRHISTLIQ'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryHistoricoFLGNEGOCIACAO: TStringField
      DisplayLabel = 'Investimento para Negociação'
      DisplayWidth = 24
      FieldName = 'FLGNEGOCIACAO'
      FixedChar = True
      Size = 1
    end
    object qryHistoricoQTDCARTHIPO: TFloatField
      DisplayLabel = 'Qtd. Carteira Hipotecária'
      DisplayWidth = 20
      FieldName = 'QTDCARTHIPO'
      DisplayFormat = '###,###,###,##0.000000000'
    end
    object qryHistoricoVLRCARTHIPO: TFloatField
      DisplayLabel = 'Vlr. Carteira Hipotecária'
      DisplayWidth = 19
      FieldName = 'VLRCARTHIPO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryHistoricoNOMECLASSRISCO: TStringField
      DisplayLabel = 'Classe de Risco - Operação'
      DisplayWidth = 34
      FieldName = 'NOMECLASSRISCO'
      Size = 60
    end
    object qryHistoricoDESCARTEIRASPC: TStringField
      DisplayLabel = 'Carteira SPC'
      DisplayWidth = 43
      FieldName = 'DESCARTEIRASPC'
      Size = 60
    end
    object qryHistoricoPERCPENHORA: TFloatField
      DisplayLabel = '% Penhorado'
      DisplayWidth = 10
      FieldName = 'PERCPENHORA'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryHistoricoQTDPENHORA: TFloatField
      DisplayLabel = 'Qtd. Penhorada'
      DisplayWidth = 20
      FieldName = 'QTDPENHORA'
      DisplayFormat = '###,###,###,##0.000000000'
    end
    object qryHistoricoVLRAGDESAG: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRAGDESAG'
      Visible = False
    end
    object qryHistoricoVENCOPERACAO: TDateTimeField
      DisplayLabel = 'Dt Vencimento'
      DisplayWidth = 11
      FieldName = 'VENCOPERACAO'
      Visible = False
    end
    object qryHistoricoSIGLAEMISSOR: TStringField
      FieldName = 'SIGLAEMISSOR'
      Visible = False
      Size = 15
    end
    object qryHistoricoIDHISTRENFIX: TFloatField
      FieldName = 'IDHISTRENFIX'
      Visible = False
    end
    object qryHistoricoNIVELCLASSRISCO: TFloatField
      FieldName = 'NIVELCLASSRISCO'
      Visible = False
    end
    object qryHistoricoCORCLASSRISCO: TFloatField
      FieldName = 'CORCLASSRISCO'
      Visible = False
    end
    object qryHistoricoDESCCLASSETIT: TStringField
      FieldName = 'DESCCLASSETIT'
      Visible = False
      Size = 30
    end
    object qryHistoricoDATAVIGENCIA: TDateTimeField
      FieldName = 'DATAVIGENCIA'
      Visible = False
    end
    object qryHistoricoCONTADORPLANPATRO: TFloatField
      FieldName = 'CONTADORPLANPATRO'
      Visible = False
    end
    object qryHistoricoCONTADORDATA: TFloatField
      FieldName = 'CONTADORDATA'
      Visible = False
    end
    object qryHistoricoCONTADORCLASSE: TFloatField
      FieldName = 'CONTADORCLASSE'
      Visible = False
    end
    object qryHistoricoCONTADOREMISSOR: TFloatField
      FieldName = 'CONTADOREMISSOR'
      Visible = False
    end
    object qryHistoricoINVESTIMENTO: TStringField
      FieldName = 'INVESTIMENTO'
      Visible = False
      Size = 60
    end
    object qryHistoricoCODISIN: TStringField
      FieldName = 'CODISIN'
      Visible = False
      Size = 14
    end
  end
  object qryItens: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '   T.IDHISTRENFIX, T.DESCCURVARENFIX, T.DESCITEMRENFIX,'
      '   DECODE(T.IDITEMRENFIX,-15, P.PERCFLUXO, T.PUITEM) AS PUITEM,'
      
        '   T.VLRITEM, T.PUACUITEM, T.SEQCALCULO, T.NOMEREGRA, T.IDITEMRE' +
        'NFIX'
      'FROM'
      '   (SELECT'
      
        '       HIT.IDHISTRENFIX, CUF.DESCCURVARENFIX, ITR.DESCITEMRENFIX' +
        ','
      '       (DECODE(ITR.TIPOITEM,'#39'P'#39',HIT.PUACUITEM,'
      '                            '#39'C'#39',HIT.PUACUITEM,'
      
        '                            '#39'T'#39',DECODE(IV.IDCLASSETIT,PV.IDCLASS' +
        'ETIT,NULL,HIT.PUACUITEM),'
      
        '                            '#39'M'#39',DECODE(IV.IDCLASSETIT,PV.IDCLASS' +
        'ETIT,NULL,HIT.PUACUITEM),'
      '                            NULL)) AS PUITEM,'
      ''
      '       (DECODE(NVL(VLRITEM,0),0,'
      
        '                            (DECODE(SIGN(HIT.IDITEMRENFIX),1,DEC' +
        'ODE(ITR.TIPOITEM,'#39'N'#39',HIT.PUACUITEM,'
      
        '                                                                ' +
        '                 '#39'V'#39',HIT.PUACUITEM,'
      
        '                                                                ' +
        '                 '#39'R'#39',HIT.PUACUITEM,'
      
        '                                                                ' +
        '                 '#39'C'#39',NULL,'
      
        '                                                                ' +
        '                 DECODE(IV.IDCLASSETIT,PV.IDCLASSETIT, HIT.PUACU' +
        'ITEM, (HIT.PUACUITEM * HR.SALDOQTDHISTRENFI))'
      
        '                                                                ' +
        '   ),'
      
        '                                                             DEC' +
        'ODE(ITR.TIPOITEM,'#39'V'#39',HIT.PUACUITEM,'
      
        '                                                                ' +
        '                 '#39'L'#39',HIT.PUACUITEM,'
      
        '                                                                ' +
        '                 DECODE(ITR.TIPOITEM,'#39'I'#39',HIT.PUACUITEM,NULL)'
      
        '                                                                ' +
        '   )'
      '                                   )'
      '                            ),'
      ''
      
        '                            (DECODE(ITR.IDITEMRENFIX,-8,HIT.PUAC' +
        'UITEM,'
      
        '                                                        DECODE(I' +
        'TR.IDITEMRENFIX,-15,HIT.PUACUITEM,DECODE(NVL(VLRITEM,0),0,HIT.PU' +
        'ACUITEM,HIT.VLRITEM)))))'
      
        '--                            (DECODE(ITR.IDITEMRENFIX,-8,HIT.PU' +
        'ACUITEM,DECODE(VLRITEM,0,HIT.PUACUITEM,HIT.VLRITEM))))'
      '       ) AS VLRITEM,'
      
        '        HIT.PUACUITEM, CXI.SEQCALCULO, RGR.NOMEREGRA, HIT.IDITEM' +
        'RENFIX,'
      '        HR.IDINVESTIMENTO, CUF.IDCURVARENFIX'
      ''
      '    FROM'
      
        '       HISTRENFIXXITENS HIT, HISTRENFIX HR, CURVASRENFIX CUF, IT' +
        'EMRENFIX ITR, CURVASXITEMRENFIX CXI, REGRA RGR,'
      '       INVESTIMENTO IV, PARAMINVEST PV, CLASSETITRENFIX CL'
      ''
      
        '    WHERE ((:IDINVESTIMENTO IS NULL) OR (IV.IDINVESTIMENTO = :ID' +
        'INVESTIMENTO))'
      
        '      AND ((:IDEMISSOR IS NULL)      OR (IV.IDEMISSOR = :IDEMISS' +
        'OR))'
      
        '      AND ((:IDCLASSETIT IS NULL)    OR (CL.IDCLASSETIT = :IDCLA' +
        'SSETIT))'
      
        '      AND (HIT.IDHISTRENFIX IN (SELECT DECODE(:ABERTURA,1,MIN(H3' +
        '.IDHISTRENFIX), MAX(H3.IDHISTRENFIX))'
      '                                FROM HISTRENFIX H3'
      
        '                                WHERE (H3.DATAHISTRENFIX BETWEEN' +
        ' TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      
        '                                                                ' +
        ' TO_DATE(:DATAHISTRENFIX,'#39'DD/MM/YYYY'#39'))'
      
        '                                  AND ((:IDINVESTIMENTO IS NULL)' +
        ' OR (H3.IDINVESTIMENTO = :IDINVESTIMENTO))'
      
        '                                  AND ((:IDPLANPREVCTBPATR IS NU' +
        'LL) OR (H3.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                                  AND ((H3.DATAHISTRENFIX || H3.' +
        'IDINVESTIMENTO || H3.IDOPERRENFIXAPLIC || H3.IDPLANPREVCTBPATR) ' +
        'IN'
      
        '                                               (SELECT MAX(H4.DA' +
        'TAHISTRENFIX) || H4.IDINVESTIMENTO || H4.IDOPERRENFIXAPLIC || H4' +
        '.IDPLANPREVCTBPATR'
      
        '                                                FROM HISTRENFIX ' +
        'H4'
      
        '                                                WHERE (H4.DATAHI' +
        'STRENFIX BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      
        '                                                                ' +
        '                 TO_DATE(:DATAHISTRENFIX,'#39'DD/MM/YYYY'#39'))'
      
        '                                                  AND ((:IDINVES' +
        'TIMENTO IS NULL) OR (H4.IDINVESTIMENTO = :IDINVESTIMENTO))'
      
        '                                                  AND ((:IDPLANP' +
        'REVCTBPATR IS NULL) OR (H4.IDPLANPREVCTBPATR = :IDPLANPREVCTBPAT' +
        'R))'
      
        '                                                GROUP BY H4.IDIN' +
        'VESTIMENTO, H4.IDOPERRENFIXAPLIC, H4.IDPLANPREVCTBPATR))'
      
        '                                GROUP BY H3.IDINVESTIMENTO, H3.I' +
        'DOPERRENFIXAPLIC, H3.IDPLANPREVCTBPATR))'
      '      AND HIT.IDCURVARENFIX = CUF.IDCURVARENFIX'
      '      AND HIT.IDITEMRENFIX = ITR.IDITEMRENFIX'
      '      AND HIT.IDCURVARENFIX = CXI.IDCURVARENFIX'
      '      AND HIT.IDITEMRENFIX = CXI.IDITEMRENFIX'
      '      AND HIT.IDREGRACALCULO = RGR.IDREGRA(+)'
      '      AND HIT.IDHISTRENFIX = HR.IDHISTRENFIX'
      '      AND HR.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '      AND IV.IDCLASSETIT = CL.IDCLASSETIT'
      
        '      AND (((IV.IDCLASSETIT = PV.IDCLASSETIT) AND (HIT.IDITEMREN' +
        'FIX <> -2)) OR (IV.IDCLASSETIT <> PV.IDCLASSETIT))'
      
        '    GROUP BY HIT.IDHISTRENFIX, CUF.DESCCURVARENFIX, ITR.DESCITEM' +
        'RENFIX,'
      '               (DECODE(ITR.TIPOITEM,'#39'P'#39',HIT.PUACUITEM,'
      '                            '#39'C'#39',HIT.PUACUITEM,'
      
        '                            '#39'T'#39',DECODE(IV.IDCLASSETIT,PV.IDCLASS' +
        'ETIT,NULL,HIT.PUACUITEM),'
      
        '                            '#39'M'#39',DECODE(IV.IDCLASSETIT,PV.IDCLASS' +
        'ETIT,NULL,HIT.PUACUITEM),'
      '                            NULL)),'
      ''
      '               (DECODE(NVL(VLRITEM,0),0,'
      
        '                            (DECODE(SIGN(HIT.IDITEMRENFIX),1,DEC' +
        'ODE(ITR.TIPOITEM,'#39'N'#39',HIT.PUACUITEM,'
      
        '                                                                ' +
        '                 '#39'V'#39',HIT.PUACUITEM,'
      
        '                                                                ' +
        '                 '#39'R'#39',HIT.PUACUITEM,'
      
        '                                                                ' +
        '                 '#39'C'#39',NULL,'
      
        '                                                                ' +
        '                 DECODE(IV.IDCLASSETIT,PV.IDCLASSETIT, HIT.PUACU' +
        'ITEM, (HIT.PUACUITEM * HR.SALDOQTDHISTRENFI))),'
      
        '                                                             DEC' +
        'ODE(ITR.TIPOITEM,'#39'V'#39',HIT.PUACUITEM,'
      
        '                                                                ' +
        '                 '#39'L'#39',HIT.PUACUITEM,'
      
        '                                                                ' +
        '                 DECODE(ITR.TIPOITEM,'#39'I'#39',HIT.PUACUITEM,NULL)))),'
      
        '                            (DECODE(ITR.IDITEMRENFIX,-8,HIT.PUAC' +
        'UITEM,'
      
        '                                                        DECODE(I' +
        'TR.IDITEMRENFIX,-15,HIT.PUACUITEM,DECODE(NVL(VLRITEM,0),0,HIT.PU' +
        'ACUITEM,'
      
        '                                                                ' +
        '         HIT.VLRITEM)))))),'
      ''
      
        '--                            (DECODE(ITR.IDITEMRENFIX,-8,HIT.PU' +
        'ACUITEM,DECODE(VLRITEM,0,HIT.PUACUITEM,HIT.VLRITEM))))),'
      ''
      
        '                HIT.PUACUITEM, CXI.SEQCALCULO, RGR.NOMEREGRA, HI' +
        'T.IDITEMRENFIX,'
      '                HR.IDINVESTIMENTO, CUF.IDCURVARENFIX'
      ''
      '   ) T,'
      '   (SELECT IDINVESTIMENTO, IDCURVARENFIX, PERCFLUXO'
      '    FROM FLUXOINVESTRENFIX'
      '    WHERE IDITEMRENFIX = -15'
      
        '       AND IDINVESTIMENTO||DATAFLUXO IN (SELECT IDINVESTIMENTO||' +
        'MAX(DATAFLUXO)'
      '                                         FROM FLUXOINVESTRENFIX'
      
        '                                         WHERE IDITEMRENFIX = -1' +
        '5'
      
        '                                            AND ((:IDINVESTIMENT' +
        'O IS NULL) OR (IDINVESTIMENTO = :IDINVESTIMENTO))'
      
        '                                            AND DATAFLUXO <= TO_' +
        'DATE(:DATAHISTRENFIX,'#39'DD/MM/YYYY'#39')'
      
        '                                         GROUP BY IDINVESTIMENTO' +
        ')'
      '   ) P'
      'WHERE T.IDINVESTIMENTO = P.IDINVESTIMENTO(+)'
      '  AND T.IDCURVARENFIX = P.IDCURVARENFIX(+)'
      
        'ORDER BY IDHISTRENFIX, DESCCURVARENFIX, SEQCALCULO, DESCITEMRENF' +
        'IX'
      ''
      ' ')
    ValidateWithMask = True
    Left = 95
    Top = 168
    ParamData = <
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
        Name = 'IDEMISSOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ABERTURA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
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
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
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
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptInput
      end>
    object qryItensDESCCURVARENFIX: TStringField
      DisplayLabel = 'Perfil de Atualização'
      DisplayWidth = 31
      FieldName = 'DESCCURVARENFIX'
      Origin = 'BASEDADOS.CURVASRENFIX.DESCCURVARENFIX'
      Size = 60
    end
    object qryItensDESCITEMRENFIX: TStringField
      DisplayLabel = 'Item'
      DisplayWidth = 23
      FieldName = 'DESCITEMRENFIX'
      Origin = 'BASEDADOS.ITEMRENFIX.DESCITEMRENFIX'
      Size = 60
    end
    object qryItensPUITEM: TFloatField
      DisplayLabel = 'P.U. do Item'
      DisplayWidth = 14
      FieldName = 'PUITEM'
      DisplayFormat = '###,###,###,##0.00000000'
    end
    object qryItensVLRITEM: TFloatField
      DisplayLabel = 'Valor do Item'
      DisplayWidth = 16
      FieldName = 'VLRITEM'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryItensNOMEREGRA: TStringField
      DisplayLabel = 'Regra Utilizada'
      DisplayWidth = 32
      FieldName = 'NOMEREGRA'
      Origin = 'BASEDADOS.REGRA.NOMEREGRA'
      Size = 60
    end
    object qryItensSEQCALCULO: TFloatField
      DisplayLabel = 'Seq. de Cálculo'
      DisplayWidth = 12
      FieldName = 'SEQCALCULO'
      Origin = 'BASEDADOS.CURVASXITEMRENFIX.SEQCALCULO'
    end
    object qryItensPUACUITEM: TFloatField
      DisplayWidth = 10
      FieldName = 'PUACUITEM'
      Visible = False
    end
    object qryItensIDHISTRENFIX: TFloatField
      FieldName = 'IDHISTRENFIX'
      Origin = 'BASEDADOS.HISTRENFIXXITENS.IDHISTRENFIX'
      Visible = False
    end
    object qryItensIDITEMRENFIX: TFloatField
      FieldName = 'IDITEMRENFIX'
      Visible = False
    end
  end
  object qryClasseRisco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCLASSRISCORENFIX, NOMECLASSRISCO, '
      '       TO_CHAR(NIVELCLASSRISCO) AS NIVELCLASSRISCO, '
      '       CORCLASSRISCO'
      'FROM CLASSRISCORENFIX'
      'UNION'
      'SELECT 0 AS IDCLASSRISCORENFIX,'
      '       '#39'SEM CLASSIFICAÇÃO'#39' AS NOMECLASSRISCO,'
      '       '#39#39' AS NIVELCLASSRISCO,'
      '       0 AS CORCLASSRISCO'
      'FROM DUAL'
      'ORDER BY NIVELCLASSRISCO '
      ' ')
    ValidateWithMask = True
    Left = 160
    Top = 168
    object qryClasseRiscoIDCLASSRISCORENFIX: TFloatField
      FieldName = 'IDCLASSRISCORENFIX'
      Origin = 'BASEDADOS."CLASSRISCORENFIX".IDCLASSRISCORENFIX'
    end
    object qryClasseRiscoNOMECLASSRISCO: TStringField
      FieldName = 'NOMECLASSRISCO'
      Origin = 'BASEDADOS."CLASSRISCORENFIX".NOMECLASSRISCO'
      Size = 60
    end
    object qryClasseRiscoCORCLASSRISCO: TFloatField
      FieldName = 'CORCLASSRISCO'
      Origin = 'BASEDADOS."CLASSRISCORENFIX".CORCLASSRISCO'
    end
    object qryClasseRiscoNIVELCLASSRISCO: TStringField
      FieldName = 'NIVELCLASSRISCO'
      Size = 40
    end
  end
  object dsClasseRisco: TwwDataSource
    AutoEdit = False
    DataSet = qryClasseRisco
    Left = 160
    Top = 112
  end
  object pplClasseRisco: TppBDEPipeline
    DataSource = dsClasseRisco
    UserName = 'lClasseRisco'
    Left = 160
    Top = 56
    object pplClasseRiscoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCLASSRISCORENFIX'
      FieldName = 'IDCLASSRISCORENFIX'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplClasseRiscoppField2: TppField
      FieldAlias = 'NOMECLASSRISCO'
      FieldName = 'NOMECLASSRISCO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplClasseRiscoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'CORCLASSRISCO'
      FieldName = 'CORCLASSRISCO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplClasseRiscoppField4: TppField
      FieldAlias = 'NIVELCLASSRISCO'
      FieldName = 'NIVELCLASSRISCO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 3
    end
  end
  object pplSaldoRenFixCons: TppBDEPipeline
    DataSource = DtsSaldoRenFixCons
    UserName = 'lSaldoRenFixCons'
    Left = 284
    Top = 64
    object pplSaldoRenFixConsppField1: TppField
      FieldAlias = 'INVESTIMENTO'
      FieldName = 'INVESTIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplSaldoRenFixConsppField2: TppField
      FieldAlias = 'DATAHISTRENFIX'
      FieldName = 'DATAHISTRENFIX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplSaldoRenFixConsppField3: TppField
      FieldAlias = 'FLGNEGOCIACAO'
      FieldName = 'FLGNEGOCIACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplSaldoRenFixConsppField4: TppField
      FieldAlias = 'DESCARTEIRASPC'
      FieldName = 'DESCARTEIRASPC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplSaldoRenFixConsppField5: TppField
      FieldAlias = 'DATAOPERACAO'
      FieldName = 'DATAOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplSaldoRenFixConsppField6: TppField
      FieldAlias = 'VENCOPERACAO'
      FieldName = 'VENCOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplSaldoRenFixConsppField7: TppField
      FieldAlias = 'DATAVIGENCIA'
      FieldName = 'DATAVIGENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplSaldoRenFixConsppField8: TppField
      FieldAlias = 'SALDOVLRHISTRENFI'
      FieldName = 'SALDOVLRHISTRENFI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplSaldoRenFixConsppField9: TppField
      FieldAlias = 'SALDOQTDHISTRENFI'
      FieldName = 'SALDOQTDHISTRENFI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplSaldoRenFixConsppField10: TppField
      FieldAlias = 'VLRIOF'
      FieldName = 'VLRIOF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplSaldoRenFixConsppField11: TppField
      FieldAlias = 'QTDPENHORA'
      FieldName = 'QTDPENHORA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplSaldoRenFixConsppField12: TppField
      FieldAlias = 'PERCPENHORA'
      FieldName = 'PERCPENHORA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplSaldoRenFixConsppField13: TppField
      FieldAlias = 'SALDOVLRHISTLIQ'
      FieldName = 'SALDOVLRHISTLIQ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplSaldoRenFixConsppField14: TppField
      FieldAlias = 'QTDCARTHIPO'
      FieldName = 'QTDCARTHIPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplSaldoRenFixConsppField15: TppField
      FieldAlias = 'VLRCARTHIPO'
      FieldName = 'VLRCARTHIPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplSaldoRenFixConsppField16: TppField
      FieldAlias = 'DESCCLASSETIT'
      FieldName = 'DESCCLASSETIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplSaldoRenFixConsppField17: TppField
      FieldAlias = 'SIGLAEMISSOR'
      FieldName = 'SIGLAEMISSOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
  end
  object DtsSaldoRenFixCons: TwwDataSource
    DataSet = QrySaldoRenFixCons
    Left = 285
    Top = 112
  end
  object QrySaldoRenFixCons: TwwQuery
    AfterScroll = qryHistoricoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '-- montado em tempo de execucao'
      'SELECT INVESTIMENTO, CODISIN, DATAHISTRENFIX,DESCCLASSETIT,'
      ''
      'SIGLAEMISSOR,FLGNEGOCIACAO,'
      ''
      'DESCARTEIRASPC,DATAOPERACAO,VENCOPERACAO,DATAVIGENCIA,'
      ''
      'SUM(SALDOVLRHISTRENFI) AS SALDOVLRHISTRENFI,'
      ''
      'SUM(SALDOQTDHISTRENFI) AS SALDOQTDHISTRENFI,'
      ''
      'SUM(VLRIOF) AS VLRIOF, '
      ''
      'SUM(QTDPENHORA) AS QTDPENHORA,'
      ''
      'SUM(PERCPENHORA) AS PERCPENHORA,'
      ''
      'SUM(SALDOVLRHISTLIQ) AS SALDOVLRHISTLIQ,'
      ''
      'SUM(QTDCARTHIPO) AS QTDCARTHIPO,'
      ''
      'SUM(VLRCARTHIPO) AS VLRCARTHIPO FROM ( '
      ''
      'SELECT'
      
        '   DECODE(OPERAP.DATAOPERACAO,NULL,OP.DATAOPERACAO,OPERAP.DATAOP' +
        'ERACAO) AS DATAOPERACAO,'
      
        '   PP.PLANPRVCONTABPATRO, TO_DATE(:DATAHISTRENFIX,'#39'DD/MM/YYYY'#39') ' +
        'AS DATAHISTRENFIX,'
      
        '   EM.SIGLAEMISSOR, IV.DESCINVESTIMENTO ||'#39' : '#39'|| OP.BOLETA AS D' +
        'ESCINVESTIMENTO, IV.CODISIN, '
      '   IV.DESCINVESTIMENTO AS INVESTIMENTO,'
      '   HO.DATAVIGENCIA, HO.DATAVENCTOATU AS VENCOPERACAO,'
      
        '   TO_NUMBER(DECODE(IV.IDCLASSETIT, PV.IDCLASSETIT, NULL, HR.SAL' +
        'DOQTDHISTRENFI)) AS SALDOQTDHISTRENFI,'
      '   HR.SALDOVLRHISTRENFI,'
      '   NVL(IOF.VLRACUIOF,0) AS VLRIOF,'
      '   NVL(PEN.QTDPENHORA,0) AS QTDPENHORA,'
      
        '   ((NVL(PEN.QTDPENHORA,0) * 100)/ HR.SALDOQTDHISTRENFI) AS PERC' +
        'PENHORA,'
      
        '   (HR.SALDOVLRHISTRENFI - NVL(IOF.VLRACUIOF,0)) AS SALDOVLRHIST' +
        'LIQ,'
      '   HR.IDHISTRENFIX, CR.NIVELCLASSRISCO,'
      '   CS.DESCARTEIRASPC, CR.CORCLASSRISCO, CR.NOMECLASSRISCO,'
      '   OP2.QTDCARTHIPO,'
      
        '   DECODE(HR.SALDOQTDHISTRENFI, 0, 0,(OP2.QTDCARTHIPO * (HR.SALD' +
        'OVLRHISTRENFI / HR.SALDOQTDHISTRENFI))) AS VLRCARTHIPO,'
      
        '   DECODE(OP.FLGNEGOCIACAO,'#39'S'#39','#39'Sim'#39', DECODE(OP.FLGNEGOCIACAO,'#39'N' +
        #39','#39'Não'#39', OP.FLGNEGOCIACAO)) AS FLGNEGOCIACAO,'
      '   CL.DESCCLASSETIT,'
      
        '   COUNT(*) OVER(PARTITION BY PP.PLANPRVCONTABPATRO) CONTADORPLA' +
        'NPATRO,'
      '   COUNT(*) OVER(PARTITION BY HR.DATAHISTRENFIX) CONTADORDATA,'
      '   COUNT(*) OVER(PARTITION BY CL.DESCCLASSETIT) CONTADORCLASSE,'
      '   COUNT(*) OVER(PARTITION BY EM.SIGLAEMISSOR) CONTADOREMISSOR'
      'FROM'
      
        '   HISTRENFIX HR, OPERRENFIX OP, INVESTIMENTO IV, EMISSOR EM, PA' +
        'RAMINVEST PV, CARTEIRASPC CS,'
      '   CLASSRISCORENFIX CR, CLASSETITRENFIX CL, HISTOPERRENFIX HO,'
      
        '   (SELECT PA.IDPLANPREVCTBPATR, ('#39'Plano / Patrocinadora: '#39' || P' +
        'L.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      '    FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      '    WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '      AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      
        '   (SELECT IDOPERRENFIX, IDOPERRENFIXAPLIC, NVL(QTDCARTHIPO,0) A' +
        'S QTDCARTHIPO'
      '    FROM OPERRENFIX'
      '    WHERE IDOPERRENFIX IN (SELECT MAX(IDOPERRENFIX)'
      '                       FROM OPERRENFIX'
      '                       GROUP BY IDOPERRENFIXAPLIC)) OP2,'
      '   (SELECT OPE.DATAOPERACAO,OPI.IDOPERRENFIX,OPI.BOLETA'
      '    FROM OPERRENFIX OPI,'
      
        '      (SELECT OP.DATAOPERACAO, OP.IDOPERRENFIXAPLIC,OPA.BOLETA, ' +
        'OPA.IDOPERRENFIX'
      '       FROM OPERRENFIX OP,'
      
        '         (SELECT OP1.IDOPERRENFIXAPLIC, OP1.BOLETA, OP1.IDOPERRE' +
        'NFIX'
      '          FROM OPERRENFIX OP1, INVESTIMENTO IV'
      '          WHERE (OP1.IDTIPOOPERACAO = -97)'
      
        '            AND ((:IDINVESTIMENTO IS NULL) OR (OP1.IDINVESTIMENT' +
        'O = :IDINVESTIMENTO))'
      
        '            AND ((:IDEMISSOR IS NULL)      OR (IV.IDEMISSOR = :I' +
        'DEMISSOR))'
      
        '            AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP1.IDPLANPREV' +
        'CTBPATR = :IDPLANPREVCTBPATR))'
      
        '            AND (OP1.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/M' +
        'M/YYYY'#39') AND'
      
        '                                          TO_DATE(:DATAHISTRENFI' +
        'X,'#39'DD/MM/YYYY'#39'))'
      '            AND (OP1.IDINVESTIMENTO = IV.IDINVESTIMENTO)) OPA'
      '       WHERE'
      '          (OP.IDOPERRENFIX = OPA.IDOPERRENFIXAPLIC) AND'
      '          (OP.IDOPERRENFIX = OP.IDOPERRENFIXAPLIC)) OPE'
      '    WHERE'
      '       (OPI.BOLETA = OPE.BOLETA) AND'
      '       (OPI.IDOPERRENFIXorig = OPE.IDOPERRENFIXAPLIC) AND'
      '       (OPI.IDTIPOOPERACAO = -98)) OPERAP,'
      
        '   (SELECT NVL(DECODE(NVL(HT.VLRACUITEM,0),0,HT.PUACUITEM,HT.VLR' +
        'ACUITEM),0) AS VLRACUIOF,'
      '           H.IDHISTRENFIX'
      
        '    FROM HISTRENFIXXITENS HT, HISTRENFIX H, INVESTIMENTO IV, HIS' +
        'TOPERRENFIX HO'
      
        '    WHERE (H.DATAHISTRENFIX BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY' +
        #39') AND'
      
        '                                    TO_DATE(:DATAHISTRENFIX,'#39'DD/' +
        'MM/YYYY'#39'))'
      '      AND ((H.DATAHISTRENFIX - HO.DATAVIGENCIA) < 30)'
      
        '      AND ((:IDINVESTIMENTO IS NULL)    OR (H.IDINVESTIMENTO = :' +
        'IDINVESTIMENTO))'
      
        '      AND ((:IDEMISSOR IS NULL)         OR (IV.IDEMISSOR = :IDEM' +
        'ISSOR))'
      
        '      AND ((:IDPLANPREVCTBPATR IS NULL) OR (H.IDPLANPREVCTBPATR ' +
        '= :IDPLANPREVCTBPATR))'
      '      AND (HT.IDITEMRENFIX = -8)'
      '      AND H.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '      AND HT.IDHISTRENFIX = H.IDHISTRENFIX'
      '      AND H.IDOPERRENFIXAPLIC = HO.IDOPERRENFIX )IOF,'
      ''
      '    (SELECT NVL(HT.PUACUITEM,0) AS QTDPENHORA,'
      '           H.IDHISTRENFIX'
      '    FROM HISTRENFIXXITENS HT, HISTRENFIX H, INVESTIMENTO IV'
      
        '    WHERE (H.DATAHISTRENFIX = TO_DATE(:DATAHISTRENFIX,'#39'DD/MM/YYY' +
        'Y'#39'))'
      
        '      AND ((:IDINVESTIMENTO IS NULL)    OR (H.IDINVESTIMENTO = :' +
        'IDINVESTIMENTO))'
      
        '      AND ((:IDEMISSOR IS NULL)         OR (IV.IDEMISSOR = :IDEM' +
        'ISSOR))'
      
        '      AND ((:IDPLANPREVCTBPATR IS NULL) OR (H.IDPLANPREVCTBPATR ' +
        '= :IDPLANPREVCTBPATR))'
      '      AND (HT.IDITEMRENFIX = -23)'
      '      AND H.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '      AND HT.IDHISTRENFIX = H.IDHISTRENFIX) PEN'
      ''
      
        'WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (HR.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      
        '  AND ((:IDINVESTIMENTO IS NULL)    OR (HR.IDINVESTIMENTO = :IDI' +
        'NVESTIMENTO))'
      
        '  AND ((:IDEMISSOR IS NULL)         OR (IV.IDEMISSOR = :IDEMISSO' +
        'R))'
      
        '  AND ((:IDCLASSETIT IS NULL)       OR (CL.IDCLASSETIT = :IDCLAS' +
        'SETIT))'
      
        '  AND ((OP.VENCOPERACAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')) OR (O' +
        'P.VENCOPERACAO IS NULL))'
      
        '  AND (((:TIPOMAIOR IS NOT NULL) AND (OP.DATAOPERACAO >= TO_DATE' +
        '(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') )) OR'
      
        '       ((:TIPOMENOR IS NOT NULL) AND (OP.DATAOPERACAO  < TO_DATE' +
        '(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') )) OR'
      '       ((:TIPOMAIOR IS NULL) AND (:TIPOMENOR IS NULL) ))'
      
        '  AND (HR.IDHISTRENFIX IN (SELECT DECODE(:ABERTURA,1,DECODE(H.ID' +
        'TIPOOPERACAO,-98,H.IDHISTRENFIX,H.IDHISTRENFIX),H.IDHISTRENFIX)'
      '                           FROM'
      
        '                              (SELECT DECODE(:ABERTURA,1,MIN(H1.' +
        'IDHISTRENFIX), MAX(H1.IDHISTRENFIX)) AS IDHISTRENFIX'
      '                              FROM HISTRENFIX H1'
      
        '                              WHERE (H1.DATAHISTRENFIX BETWEEN T' +
        'O_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      
        '                                                               T' +
        'O_DATE(:DATAHISTRENFIX,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND ((:IDINVESTIMENTO IS NULL)  ' +
        '  OR (H1.IDINVESTIMENTO = :IDINVESTIMENTO))'
      
        '                                AND ((:IDPLANPREVCTBPATR IS NULL' +
        ') OR (H1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                                AND ((H1.DATAHISTRENFIX || H1.ID' +
        'INVESTIMENTO || H1.IDOPERRENFIXAPLIC || H1.IDPLANPREVCTBPATR) IN'
      
        '                                            (SELECT MAX(H2.DATAH' +
        'ISTRENFIX) || H2.IDINVESTIMENTO || H2.IDOPERRENFIXAPLIC || H2.ID' +
        'PLANPREVCTBPATR'
      '                                             FROM HISTRENFIX H2'
      
        '                                             WHERE (H2.DATAHISTR' +
        'ENFIX BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      
        '                                                                ' +
        '              TO_DATE(:DATAHISTRENFIX,'#39'DD/MM/YYYY'#39'))'
      
        '                                               AND ((:IDPLANPREV' +
        'CTBPATR IS NULL) OR (H2.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                                             GROUP BY H2.IDINVES' +
        'TIMENTO, H2.IDOPERRENFIXAPLIC, H2.IDPLANPREVCTBPATR))'
      
        '                              GROUP BY H1.DATAHISTRENFIX, H1.IDI' +
        'NVESTIMENTO, H1.IDOPERRENFIXAPLIC, H1.IDPLANPREVCTBPATR)H2,'
      '                              HISTRENFIX H'
      
        '                          WHERE H.IDHISTRENFIX = H2.IDHISTRENFIX' +
        '))'
      ''
      '  AND (HR.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (IV.IDEMISSOR = EM.IDEMISSOR)'
      '  AND (IV.IDCLASSETIT = CL.IDCLASSETIT)'
      '  AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '  AND (HR.IDOPERRENFIXAPLIC = OP2.IDOPERRENFIXAPLIC)'
      '  AND (OP.IDCLASSRISCORENFIX = CR.IDCLASSRISCORENFIX(+))'
      '  AND (HR.IDOPERRENFIX = OPERAP.IDOPERRENFIX(+))'
      '  AND ('
      
        '       (((IV.IDCLASSETIT IN (PV.IDCLASSETIT, PV.IDCLASSPOUPBLOQ)' +
        ') AND (HR.SALDOVLRHISTRENFI > 0)) OR'
      '        (HR.SALDOQTDHISTRENFI > 0))'
      '        OR'
      '       ((HR.IDTIPOOPERACAO <> -98) AND (:ABERTURA = 1))'
      '      )'
      '  AND (CS.IDCARTEIRASPC(+) = IV.IDCARTEIRASPC)'
      '  AND (HR.IDHISTRENFIX = IOF.IDHISTRENFIX(+))'
      '  AND (HR.IDHISTRENFIX = PEN.IDHISTRENFIX(+))'
      '  AND (HO.IDOPERRENFIX = OP.IDOPERRENFIXAPLIC)'
      '  AND (HO.DATAVIGENCIA = (SELECT MAX(HO1.DATAVIGENCIA)'
      '                          FROM HISTOPERRENFIX HO1'
      
        '                          WHERE HO1.IDOPERRENFIX = OP.IDOPERRENF' +
        'IXAPLIC'
      
        '                            AND TRUNC(DATAVIGENCIA) <= TO_DATE(:' +
        'DATAHISTRENFIX,'#39'DD/MM/YYYY'#39')))'
      
        '  AND (((PEN.QTDPENHORA > 0) AND (:FLGPENHORA = 1)) OR (:FLGPENH' +
        'ORA = 0))'
      
        'ORDER BY PP.PLANPRVCONTABPATRO, DATAHISTRENFIX, CL.DESCCLASSETIT' +
        ',EM.SIGLAEMISSOR,'
      
        '         CR.NIVELCLASSRISCO, IV.DESCINVESTIMENTO, OP.DATAOPERACA' +
        'O'
      ''
      ' )'
      ''
      
        ' GROUP BY INVESTIMENTO,CODISIN,DATAHISTRENFIX,DESCCLASSETIT,SIGL' +
        'AEMISSOR,FLGNEGOCIACAO,DESCARTEIRASPC,DATAOPERACAO,VENCOPERACAO,' +
        'DATAVIGENCIA'
      ''
      
        ' ORDER BY INVESTIMENTO,CODISIN,DATAHISTRENFIX,DESCCLASSETIT,SIGL' +
        'AEMISSOR,FLGNEGOCIACAO,DESCARTEIRASPC,DATAOPERACAO,VENCOPERACAO,' +
        'DATAVIGENCIA'
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
    Left = 286
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
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
        Name = 'IDEMISSOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
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
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
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
        Name = 'IDEMISSOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
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
        DataType = ftString
        Name = 'DATAHISTRENFIX'
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
        Name = 'IDEMISSOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
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
        Name = 'IDEMISSOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ABERTURA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ABERTURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
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
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
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
        Name = 'ABERTURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGPENHORA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGPENHORA'
        ParamType = ptInput
      end>
    object QrySaldoRenFixConsINVESTIMENTO: TStringField
      FieldName = 'INVESTIMENTO'
      Size = 60
    end
    object QrySaldoRenFixConsDATAHISTRENFIX: TDateTimeField
      FieldName = 'DATAHISTRENFIX'
    end
    object QrySaldoRenFixConsFLGNEGOCIACAO: TStringField
      FieldName = 'FLGNEGOCIACAO'
      Size = 3
    end
    object QrySaldoRenFixConsDESCARTEIRASPC: TStringField
      FieldName = 'DESCARTEIRASPC'
      Size = 60
    end
    object QrySaldoRenFixConsDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object QrySaldoRenFixConsVENCOPERACAO: TDateTimeField
      FieldName = 'VENCOPERACAO'
    end
    object QrySaldoRenFixConsDATAVIGENCIA: TDateTimeField
      FieldName = 'DATAVIGENCIA'
    end
    object QrySaldoRenFixConsSALDOVLRHISTRENFI: TFloatField
      FieldName = 'SALDOVLRHISTRENFI'
    end
    object QrySaldoRenFixConsSALDOQTDHISTRENFI: TFloatField
      FieldName = 'SALDOQTDHISTRENFI'
    end
    object QrySaldoRenFixConsVLRIOF: TFloatField
      FieldName = 'VLRIOF'
    end
    object QrySaldoRenFixConsQTDPENHORA: TFloatField
      FieldName = 'QTDPENHORA'
    end
    object QrySaldoRenFixConsPERCPENHORA: TFloatField
      FieldName = 'PERCPENHORA'
    end
    object QrySaldoRenFixConsSALDOVLRHISTLIQ: TFloatField
      FieldName = 'SALDOVLRHISTLIQ'
    end
    object QrySaldoRenFixConsQTDCARTHIPO: TFloatField
      FieldName = 'QTDCARTHIPO'
    end
    object QrySaldoRenFixConsVLRCARTHIPO: TFloatField
      FieldName = 'VLRCARTHIPO'
    end
    object QrySaldoRenFixConsDESCCLASSETIT: TStringField
      FieldName = 'DESCCLASSETIT'
      Size = 30
    end
    object QrySaldoRenFixConsSIGLAEMISSOR: TStringField
      FieldName = 'SIGLAEMISSOR'
      Size = 15
    end
  end
  object rptRenFixSaldoCons: TppReport
    AutoStop = False
    DataPipeline = pplSaldoRenFixCons
    OnStartPage = rptRenFixSaldoStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Saldos de Renda Fixa'
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
    AfterPrint = rptRenFixSaldoAfterPrint
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rptRenFixSaldoBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 282
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplSaldoRenFixCons'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28310
      mmPrintPosition = 0
      object ppShape5: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        mmHeight = 9260
        mmLeft = 0
        mmTop = 19050
        mmWidth = 284692
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 172244
        mmTop = 19844
        mmWidth = 15611
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Valor Líquido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 261144
        mmTop = 19845
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Classe de Risco Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 3439
        mmTop = 24077
        mmWidth = 41275
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Aplicação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 139965
        mmTop = 19844
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel35: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa1'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel36: TppLabel
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
        mmLeft = 6085
        mmTop = 1588
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 'Carteira    Hipotecária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3175
        mmLeft = 100013
        mmTop = 19579
        mmWidth = 35190
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'ppLCarteira'
        AutoSize = True
        DataField = 'PLANPRVCONTABPATRO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3683
        mmLeft = 243841
        mmTop = 14023
        mmWidth = 39793
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2911
        mmLeft = 3440
        mmTop = 19845
        mmWidth = 53975
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3175
        mmLeft = 115359
        mmTop = 22490
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3175
        mmLeft = 100013
        mmTop = 22490
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 156104
        mmTop = 19844
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Caption = 'Carteira SPC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 59002
        mmTop = 24077
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'IOF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 237067
        mmTop = 19845
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Valor Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 190236
        mmTop = 19845
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'Vigência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 156104
        mmTop = 24077
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'lPerPenhora'
        AutoSize = False
        Caption = '% Penhorado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 172509
        mmTop = 24077
        mmWidth = 15611
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'lQtdPenhora'
        AutoSize = False
        Caption = 'Qtd Penhorada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 190236
        mmTop = 24077
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label102'
        AutoSize = False
        Caption = 'Agio/Desagio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 214048
        mmTop = 19844
        mmWidth = 22225
        BandType = 0
      end
      object Titulo: TppLabel
        UserName = 'Titulo'
        Caption = 'Titulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 25400
        mmTop = 7938
        mmWidth = 9610
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        AutoSize = False
        Caption = 'Inv. p/ negociação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 75142
        mmTop = 19844
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'Label30'
        Caption = 'Cód. ISIN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 59002
        mmTop = 19844
        mmWidth = 10848
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      AfterPrint = bndDetalheAfterPrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppShape6: TppShape
        OnPrint = shpRenFixSaldoDetPaiPrint
        UserName = 'shpRenFixSaldoDetPai'
        Pen.Style = psClear
        mmHeight = 7938
        mmLeft = 0
        mmTop = 529
        mmWidth = 284428
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'dbQuantidade'
        DataField = 'SALDOQTDHISTRENFI'
        DataPipeline = pplSaldoRenFixCons
        DisplayFormat = '###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoRenFixCons'
        mmHeight = 2910
        mmLeft = 172244
        mmTop = 529
        mmWidth = 15611
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'dbValorOperacao'
        DataField = 'SALDOVLRHISTLIQ'
        DataPipeline = pplSaldoRenFixCons
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoRenFixCons'
        mmHeight = 2910
        mmLeft = 261143
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'dbtDescInvestimento'
        DataField = 'INVESTIMENTO'
        DataPipeline = pplSaldoRenFixCons
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplSaldoRenFixCons'
        mmHeight = 2910
        mmLeft = 3439
        mmTop = 529
        mmWidth = 53975
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText5'
        DataField = 'DATAOPERACAO'
        DataPipeline = pplSaldoRenFixCons
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplSaldoRenFixCons'
        mmHeight = 2910
        mmLeft = 139965
        mmTop = 529
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText26: TppDBText
        OnPrint = dbtNomeClassRiscoPrint
        UserName = 'dbtNomeClassRisco'
        DataField = 'NOMECLASSRISCO'
        DataPipeline = pplSaldoRenFixCons
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSaldoRenFixCons'
        mmHeight = 2910
        mmLeft = 3439
        mmTop = 4234
        mmWidth = 54240
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'dbQuantidade1'
        DataField = 'QTDCARTHIPO'
        DataPipeline = pplSaldoRenFixCons
        DisplayFormat = '###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoRenFixCons'
        mmHeight = 2910
        mmLeft = 98161
        mmTop = 529
        mmWidth = 19845
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText9'
        DataField = 'VLRCARTHIPO'
        DataPipeline = pplSaldoRenFixCons
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoRenFixCons'
        mmHeight = 2910
        mmLeft = 119063
        mmTop = 529
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText10'
        DataField = 'VENCOPERACAO'
        DataPipeline = pplSaldoRenFixCons
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplSaldoRenFixCons'
        mmHeight = 2910
        mmLeft = 155840
        mmTop = 529
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText31: TppDBText
        OnPrint = dbtNomeClassRiscoPrint
        UserName = 'dbtNomeClassRisco1'
        DataField = 'DESCARTEIRASPC'
        DataPipeline = pplSaldoRenFixCons
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSaldoRenFixCons'
        mmHeight = 2910
        mmLeft = 59002
        mmTop = 4234
        mmWidth = 59267
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'dbValorOperacao1'
        DataField = 'VLRIOF'
        DataPipeline = pplSaldoRenFixCons
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoRenFixCons'
        mmHeight = 2910
        mmLeft = 237596
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'dbValorOperacao2'
        DataField = 'SALDOVLRHISTRENFI'
        DataPipeline = pplSaldoRenFixCons
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoRenFixCons'
        mmHeight = 2910
        mmLeft = 190500
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText101'
        DataField = 'DATAVIGENCIA'
        DataPipeline = pplSaldoRenFixCons
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplSaldoRenFixCons'
        mmHeight = 2910
        mmLeft = 155840
        mmTop = 4233
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'dbQuantidade2'
        DataField = 'PERCPENHORA'
        DataPipeline = pplSaldoRenFixCons
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoRenFixCons'
        mmHeight = 2910
        mmLeft = 172244
        mmTop = 4233
        mmWidth = 15611
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'dbQtdPenhora'
        DataField = 'QTDPENHORA'
        DataPipeline = pplSaldoRenFixCons
        DisplayFormat = '###,###,###,###,##0.0000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoRenFixCons'
        mmHeight = 2910
        mmLeft = 190500
        mmTop = 4233
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText15'
        DataField = 'VLRAGDESAG'
        DataPipeline = pplSaldoRenFixCons
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoRenFixCons'
        mmHeight = 2910
        mmLeft = 214048
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText16'
        DataField = 'CODISIN'
        DataPipeline = pplHistorico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 59002
        mmTop = 529
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'FLGNEGOCIACAO'
        DataPipeline = pplHistorico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplHistorico'
        mmHeight = 2910
        mmLeft = 85196
        mmTop = 529
        mmWidth = 7144
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppLabel55: TppLabel
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
        mmWidth = 283634
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
        mmWidth = 283634
        BandType = 8
      end
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
        mmWidth = 25400
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppShape8: TppShape
        UserName = 'Shape8'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 5821
        mmLeft = 0
        mmTop = 0
        mmWidth = 284692
        BandType = 7
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'Total na Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 3440
        mmTop = 265
        mmWidth = 15367
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'SALDOVLRHISTRENFI'
        DataPipeline = pplSaldoRenFixCons
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoRenFixCons'
        mmHeight = 2910
        mmLeft = 190500
        mmTop = 265
        mmWidth = 22225
        BandType = 7
      end
      object ppDBCalc18: TppDBCalc
        UserName = 'DBCalc18'
        DataField = 'VLRAGDESAG'
        DataPipeline = pplSaldoRenFixCons
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoRenFixCons'
        mmHeight = 2910
        mmLeft = 214048
        mmTop = 265
        mmWidth = 22225
        BandType = 7
      end
      object ppDBCalc19: TppDBCalc
        UserName = 'DBCalc19'
        DataField = 'VLRIOF'
        DataPipeline = pplSaldoRenFixCons
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoRenFixCons'
        mmHeight = 2910
        mmLeft = 237596
        mmTop = 265
        mmWidth = 22225
        BandType = 7
      end
      object ppDBCalc20: TppDBCalc
        UserName = 'DBCalc20'
        DataField = 'SALDOVLRHISTLIQ'
        DataPipeline = pplSaldoRenFixCons
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoRenFixCons'
        mmHeight = 2910
        mmLeft = 261144
        mmTop = 265
        mmWidth = 22225
        BandType = 7
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'DESCCLASSETIT'
      DataPipeline = pplSaldoRenFixCons
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplSaldoRenFixCons'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppShape9: TppShape
          UserName = 'Shape9'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 6085
          mmLeft = 0
          mmTop = 0
          mmWidth = 284692
          BandType = 3
          GroupNo = 0
        end
        object ppDBText19: TppDBText
          UserName = 'DBText19'
          DataField = 'DESCCLASSETIT'
          DataPipeline = pplSaldoRenFixCons
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplSaldoRenFixCons'
          mmHeight = 2910
          mmLeft = 17198
          mmTop = 529
          mmWidth = 105834
          BandType = 3
          GroupNo = 0
        end
        object ppLabel50: TppLabel
          UserName = 'Label50'
          Caption = 'Classe:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 3440
          mmTop = 529
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppShape12: TppShape
          UserName = 'Shape12'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 6085
          mmLeft = 0
          mmTop = 0
          mmWidth = 284692
          BandType = 5
          GroupNo = 0
        end
        object ppLabel53: TppLabel
          UserName = 'Label53'
          Caption = 'Total da Classe:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 3440
          mmTop = 265
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc25: TppDBCalc
          UserName = 'DBCalc25'
          DataField = 'SALDOVLRHISTRENFI'
          DataPipeline = pplSaldoRenFixCons
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSaldoRenFixCons'
          mmHeight = 2910
          mmLeft = 190500
          mmTop = 265
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc26: TppDBCalc
          UserName = 'DBCalc26'
          DataField = 'VLRAGDESAG'
          DataPipeline = pplSaldoRenFixCons
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSaldoRenFixCons'
          mmHeight = 2910
          mmLeft = 214048
          mmTop = 265
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc27: TppDBCalc
          UserName = 'DBCalc27'
          DataField = 'VLRIOF'
          DataPipeline = pplSaldoRenFixCons
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSaldoRenFixCons'
          mmHeight = 2910
          mmLeft = 237596
          mmTop = 265
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc28: TppDBCalc
          UserName = 'DBCalc28'
          DataField = 'SALDOVLRHISTLIQ'
          DataPipeline = pplSaldoRenFixCons
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSaldoRenFixCons'
          mmHeight = 2910
          mmLeft = 261144
          mmTop = 265
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'SIGLAEMISSOR'
      DataPipeline = pplSaldoRenFixCons
      OutlineSettings.CreateNode = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplSaldoRenFixCons'
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppShape10: TppShape
          UserName = 'Shape10'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 6615
          mmLeft = 0
          mmTop = 0
          mmWidth = 284692
          BandType = 3
          GroupNo = 1
        end
        object ppDBText20: TppDBText
          UserName = 'DBText20'
          DataField = 'SIGLAEMISSOR'
          DataPipeline = pplSaldoRenFixCons
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplSaldoRenFixCons'
          mmHeight = 2910
          mmLeft = 17198
          mmTop = 794
          mmWidth = 65088
          BandType = 3
          GroupNo = 1
        end
        object ppLabel51: TppLabel
          UserName = 'Label51'
          Caption = 'Emissor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 3440
          mmTop = 794
          mmWidth = 10583
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppShape11: TppShape
          UserName = 'Shape11'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 8202
          mmLeft = 0
          mmTop = 0
          mmWidth = 284692
          BandType = 5
          GroupNo = 1
        end
        object ppLabel52: TppLabel
          UserName = 'Label52'
          Caption = 'Total do Emissor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 3440
          mmTop = 1323
          mmWidth = 19050
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc21: TppDBCalc
          UserName = 'DBCalc101'
          DataField = 'SALDOVLRHISTRENFI'
          DataPipeline = pplSaldoRenFixCons
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSaldoRenFixCons'
          mmHeight = 2910
          mmLeft = 190500
          mmTop = 1323
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc22: TppDBCalc
          UserName = 'DBCalc22'
          DataField = 'VLRAGDESAG'
          DataPipeline = pplSaldoRenFixCons
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSaldoRenFixCons'
          mmHeight = 2910
          mmLeft = 214048
          mmTop = 1323
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc23: TppDBCalc
          UserName = 'DBCalc23'
          DataField = 'VLRIOF'
          DataPipeline = pplSaldoRenFixCons
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSaldoRenFixCons'
          mmHeight = 2910
          mmLeft = 237596
          mmTop = 1323
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc24: TppDBCalc
          UserName = 'DBCalc201'
          DataField = 'SALDOVLRHISTLIQ'
          DataPipeline = pplSaldoRenFixCons
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSaldoRenFixCons'
          mmHeight = 2910
          mmLeft = 261144
          mmTop = 1323
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
end
