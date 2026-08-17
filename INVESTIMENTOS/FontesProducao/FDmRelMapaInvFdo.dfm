inherited DmRelMapaInvFdo: TDmRelMapaInvFdo
  Left = 372
  Top = 257
  Width = 789
  Height = 382
  Caption = 'DmRelMapaInvFdo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 29
    Top = 52
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
    Left = 29
    Top = 52
  end
  inherited qryExemplo: TwwQuery
    Left = 29
    Top = 52
  end
  inherited rpExemplo: TppReport
    Left = 29
    Top = 52
    DataPipelineName = 'pplExemplo'
  end
  object rptMapaInvestFdo: TppReport
    AutoStop = False
    DataPipeline = BDEMapaInvestFdo
    OnStartPage = rptMapaInvestFdoStartPage
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Mapa de Movimentação'
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 184
    Top = 5
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'BDEMapaInvestFdo'
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33073
      mmPrintPosition = 0
      object ppShape9: TppShape
        UserName = 'shpConsRentFndCab'
        Brush.Color = clSilver
        mmHeight = 10054
        mmLeft = 0
        mmTop = 22754
        mmWidth = 284163
        BandType = 0
      end
      object pplblVariacao: TppLabel
        UserName = 'pplblVariacao'
        Caption = 'Variação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 225955
        mmTop = 24342
        mmWidth = 10319
        BandType = 0
      end
      object pplblVlrAplicado: TppLabel
        UserName = 'pplblVlrAplicado'
        Caption = 'Valor Aplicado'
        Color = 14935011
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 80963
        mmTop = 24342
        mmWidth = 16933
        BandType = 0
      end
      object pplblIOF: TppLabel
        UserName = 'pplblIOF'
        Caption = 'IOF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 251355
        mmTop = 24342
        mmWidth = 3969
        BandType = 0
      end
      object pplblAplicacao: TppLabel
        UserName = 'pplblAplicacao'
        Caption = 'Aplicação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 194998
        mmTop = 24077
        mmWidth = 11377
        BandType = 0
      end
      object pplblResgates: TppLabel
        UserName = 'lblConsRFADifMes'
        Caption = 'Resgates'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 195527
        mmTop = 28840
        mmWidth = 10848
        BandType = 0
      end
      object pplblSldAnterior: TppLabel
        UserName = 'pplblSldAnterior'
        Caption = 'Saldo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 134144
        mmTop = 24342
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'Label4'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 114300
        mmTop = 24342
        mmWidth = 13494
        BandType = 0
      end
      object lblTitleFdoRF: TppLabel
        UserName = 'lblTitleFdoRF'
        Caption = 'Mapa de Movimentação em Fundos de Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 88900
        BandType = 0
      end
      object ppLabel38: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa4'
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
      object lblPeriodo: TppLabel
        UserName = 'LPeriodo4'
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
      object ppDBImage4: TppDBImage
        UserName = 'DbLogo4'
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
      object pplblDescFundo: TppLabel
        UserName = 'pplblDescFundo'
        Caption = 'Fundo de Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 24342
        mmWidth = 26458
        BandType = 0
      end
      object pplblSaldo: TppLabel
        UserName = 'lblConsRFADifMes1'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 276490
        mmTop = 24342
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Transferência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 159015
        mmTop = 24342
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      BeforePrint = ppDetailBand10BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 15346
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 9525
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppdbVlrVariacao: TppDBText
        UserName = 'ppdbVlrVariacao'
        DataField = 'VLRVARIACAO'
        DataPipeline = BDEMapaInvestFdo
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdo'
        mmHeight = 2646
        mmLeft = 215900
        mmTop = 529
        mmWidth = 20373
        BandType = 4
      end
      object ppdbVlrAplicacao: TppDBText
        UserName = 'ppdbVlrAplicacao'
        DataField = 'VLRAPLICACAO'
        DataPipeline = BDEMapaInvestFdo
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdo'
        mmHeight = 2646
        mmLeft = 182880
        mmTop = 529
        mmWidth = 23548
        BandType = 4
      end
      object ppdbSldAnterior: TppDBText
        UserName = 'ppdbSldAnterior'
        DataField = 'SALDOANTERIOR'
        DataPipeline = BDEMapaInvestFdo
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdo'
        mmHeight = 2646
        mmLeft = 128059
        mmTop = 529
        mmWidth = 23020
        BandType = 4
      end
      object ppdbVlrIOF: TppDBText
        UserName = 'ppdbVlrIOF'
        DataField = 'VLRIOFPROV'
        DataPipeline = BDEMapaInvestFdo
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdo'
        mmHeight = 2646
        mmLeft = 238760
        mmTop = 529
        mmWidth = 16669
        BandType = 4
      end
      object ppdbVlrResgate: TppDBText
        UserName = 'ppdbVlrResgate'
        DataField = 'VLRRESGATE'
        DataPipeline = BDEMapaInvestFdo
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdo'
        mmHeight = 2646
        mmLeft = 183092
        mmTop = 5821
        mmWidth = 23283
        BandType = 4
      end
      object ppdbSldQuantidade: TppDBText
        UserName = 'ppdbSldQuantidade'
        DataField = 'SALDOQTDCOTAS'
        DataPipeline = BDEMapaInvestFdo
        DisplayFormat = '###,###,##0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdo'
        mmHeight = 2647
        mmLeft = 98161
        mmTop = 529
        mmWidth = 29634
        BandType = 4
      end
      object ppdbDescFundo: TppDBText
        UserName = 'ppdbDescFundo'
        DataField = 'DESCFUNDOINVEST'
        DataPipeline = BDEMapaInvestFdo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdo'
        mmHeight = 2646
        mmLeft = 2117
        mmTop = 529
        mmWidth = 71702
        BandType = 4
      end
      object ppdbSldFundo: TppDBText
        UserName = 'ppdbSldFundo'
        DataField = 'SALDOVLRFUNDO'
        DataPipeline = BDEMapaInvestFdo
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdo'
        mmHeight = 2646
        mmLeft = 259821
        mmTop = 529
        mmWidth = 23548
        BandType = 4
      end
      object ppdbVlrAplicado: TppDBText
        UserName = 'ppdbVlrAplicado'
        DataField = 'VLRAPLICADO'
        DataPipeline = BDEMapaInvestFdo
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdo'
        mmHeight = 2646
        mmLeft = 74348
        mmTop = 529
        mmWidth = 23548
        BandType = 4
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        DrillDownComponent = ppdbDescFundo
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'BDEMapaInvestFdoAn'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 9260
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = BDEMapaInvestFdoAn
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Mapa de Movimentação'
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
          Left = 232
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'BDEMapaInvestFdoAn'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 10054
            mmPrintPosition = 0
            object ppShape1: TppShape
              UserName = 'shpConsRentFndCab1'
              Brush.Color = clSilver
              mmHeight = 10053
              mmLeft = 52388
              mmTop = 0
              mmWidth = 231511
              BandType = 1
            end
            object ppLabel1: TppLabel
              UserName = 'pplblDescFundo1'
              Caption = 'Data de Aplicação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 53181
              mmTop = 1323
              mmWidth = 20902
              BandType = 1
            end
            object ppLabel2: TppLabel
              UserName = 'pplblVlrAplicado1'
              Caption = 'Valor Aplicado'
              Color = 14935011
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 80963
              mmTop = 1323
              mmWidth = 16933
              BandType = 1
            end
            object ppLabel3: TppLabel
              UserName = 'Label3'
              Caption = 'Quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 114300
              mmTop = 1270
              mmWidth = 13494
              BandType = 1
            end
            object ppLabel4: TppLabel
              UserName = 'pplblSldAnterior1'
              Caption = 'Saldo Anterior'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 134144
              mmTop = 1323
              mmWidth = 16933
              BandType = 1
            end
            object ppLabel5: TppLabel
              UserName = 'pplblVariacao1'
              Caption = 'Variação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 226219
              mmTop = 1323
              mmWidth = 10054
              BandType = 1
            end
            object ppLabel6: TppLabel
              UserName = 'pplblIOF1'
              Caption = 'IOF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 251355
              mmTop = 1323
              mmWidth = 3969
              BandType = 1
            end
            object ppLabel7: TppLabel
              UserName = 'pplblAplicacao1'
              Caption = 'Aplicação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 194998
              mmTop = 1323
              mmWidth = 11377
              BandType = 1
            end
            object ppLabel8: TppLabel
              UserName = 'lblConsRFADifMes2'
              Caption = 'Resgates'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 195527
              mmTop = 6085
              mmWidth = 10848
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              Caption = 'Saldo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 276755
              mmTop = 1323
              mmWidth = 6615
              BandType = 1
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'Transferência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 159015
              mmTop = 1323
              mmWidth = 15875
              BandType = 1
            end
          end
          object ppDetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 9790
            mmPrintPosition = 0
            object shpDetalheFilho: TppShape
              OnPrint = shpDetalheFilhoPrint
              UserName = 'shpDetalhe1'
              Pen.Style = psClear
              mmHeight = 9525
              mmLeft = 52388
              mmTop = 265
              mmWidth = 231775
              BandType = 4
            end
            object ppDBText2: TppDBText
              UserName = 'ppdbDescFundo2'
              DataField = 'DATAAPLICACAO'
              DataPipeline = BDEMapaInvestFdoAn
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoAn'
              mmHeight = 2646
              mmLeft = 53181
              mmTop = 529
              mmWidth = 20902
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'ppdbVlrAplicado1'
              DataField = 'VLRAPLICADO'
              DataPipeline = BDEMapaInvestFdoAn
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoAn'
              mmHeight = 2646
              mmLeft = 74348
              mmTop = 529
              mmWidth = 23548
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'ppdbSldQuantidade1'
              DataField = 'SALDOQTDCOTAS'
              DataPipeline = BDEMapaInvestFdoAn
              DisplayFormat = '###,###,##0.000000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoAn'
              mmHeight = 2646
              mmLeft = 98161
              mmTop = 529
              mmWidth = 29634
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'ppdbSldAnterior1'
              DataField = 'SALDOANTERIOR'
              DataPipeline = BDEMapaInvestFdoAn
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoAn'
              mmHeight = 2646
              mmLeft = 128059
              mmTop = 529
              mmWidth = 23019
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'ppdbVlrVariacao1'
              DataField = 'VLRVARIACAO'
              DataPipeline = BDEMapaInvestFdoAn
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoAn'
              mmHeight = 2646
              mmLeft = 215900
              mmTop = 529
              mmWidth = 20373
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'ppdbVlrIOF1'
              DataField = 'VLRIOFPROV'
              DataPipeline = BDEMapaInvestFdoAn
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoAn'
              mmHeight = 2646
              mmLeft = 238760
              mmTop = 529
              mmWidth = 16669
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'ppdbVlrAplicacao1'
              DataField = 'VLRAPLICACAO'
              DataPipeline = BDEMapaInvestFdoAn
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoAn'
              mmHeight = 2646
              mmLeft = 182880
              mmTop = 529
              mmWidth = 23548
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'ppdbVlrResgate1'
              DataField = 'VLRRESGATE'
              DataPipeline = BDEMapaInvestFdoAn
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoAn'
              mmHeight = 2646
              mmLeft = 183092
              mmTop = 5821
              mmWidth = 23283
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'ppdbSldFundo1'
              DataField = 'SALDOVLRFUNDO'
              DataPipeline = BDEMapaInvestFdoAn
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoAn'
              mmHeight = 2646
              mmLeft = 259292
              mmTop = 529
              mmWidth = 24077
              BandType = 4
            end
            object ppDBText26: TppDBText
              UserName = 'DBText26'
              DataField = 'VLRTRANSF'
              DataPipeline = BDEMapaInvestFdoAn
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoAn'
              mmHeight = 2646
              mmLeft = 151607
              mmTop = 529
              mmWidth = 23283
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppLine3: TppLine
              UserName = 'Line1'
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 52388
              mmTop = 0
              mmWidth = 231511
              BandType = 7
            end
          end
        end
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'VLRTRANSF'
        DataPipeline = BDEMapaInvestFdo
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdo'
        mmHeight = 2646
        mmLeft = 151607
        mmTop = 529
        mmWidth = 23283
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppSystemVariable17: TppSystemVariable
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
        mmLeft = 0
        mmTop = 794
        mmWidth = 283634
        BandType = 8
      end
      object ppLabel82: TppLabel
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
        mmTop = 794
        mmWidth = 283369
        BandType = 8
      end
      object ppLine28: TppLine
        UserName = 'LineConsRentFnd2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
      object ppSystemVariable18: TppSystemVariable
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
        mmLeft = 237596
        mmTop = 794
        mmWidth = 45508
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'IDPLANPREVCTBPATR'
      DataPipeline = BDEMapaInvestFdo
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDEMapaInvestFdo'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'PLANPRVCONTABPATRO'
          DataPipeline = BDEMapaInvestFdo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdo'
          mmHeight = 4233
          mmLeft = 529
          mmTop = 1588
          mmWidth = 78846
          BandType = 3
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLine14: TppLine
          UserName = 'Line14'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 6085
          mmWidth = 284300
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
    object ppGroup1: TppGroup
      BreakName = 'DESCSEGMENTACAO'
      DataPipeline = BDEMapaInvestFdo
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDEMapaInvestFdo'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'ppdbDescFundo1'
          DataField = 'DESCSEGMENTACAO'
          DataPipeline = BDEMapaInvestFdo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdo'
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 1588
          mmWidth = 78846
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 6085
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        AfterGenerate = ppGroupFooterBand1AfterGenerate
        BeforePrint = ppGroupFooterBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 9525
        mmPrintPosition = 0
        object ppdbSumSldAnterior: TppDBCalc
          UserName = 'dbSumSldAnterior'
          DataField = 'SALDOANTERIOR'
          DataPipeline = BDEMapaInvestFdo
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdo'
          mmHeight = 2910
          mmLeft = 128059
          mmTop = 2117
          mmWidth = 23019
          BandType = 5
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label1'
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 53446
          mmTop = 2117
          mmWidth = 8202
          BandType = 5
          GroupNo = 0
        end
        object ppdbSumVlrAplicado: TppDBCalc
          UserName = 'dbSumVlrAplicado'
          DataField = 'VLRAPLICADO'
          DataPipeline = BDEMapaInvestFdo
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdo'
          mmHeight = 2911
          mmLeft = 74348
          mmTop = 2117
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppdbSumVlrVariacao: TppDBCalc
          UserName = 'dbSumVlrVariacao'
          DataField = 'VLRVARIACAO'
          DataPipeline = BDEMapaInvestFdo
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdo'
          mmHeight = 2910
          mmLeft = 215900
          mmTop = 2117
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppdbSumVlrAplicacao: TppDBCalc
          UserName = 'dbSumVlrAplicacao'
          DataField = 'VLRAPLICACAO'
          DataPipeline = BDEMapaInvestFdo
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdo'
          mmHeight = 2910
          mmLeft = 182827
          mmTop = 2117
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppdbSumVlrIOF: TppDBCalc
          UserName = 'dbSumVlrIOF'
          DataField = 'VLRIOFPROV'
          DataPipeline = BDEMapaInvestFdo
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdo'
          mmHeight = 2910
          mmLeft = 238655
          mmTop = 2117
          mmWidth = 16669
          BandType = 5
          GroupNo = 0
        end
        object ppdbSumVlrResgate: TppDBCalc
          UserName = 'dbSumVlrResgate'
          DataField = 'VLRRESGATE'
          DataPipeline = BDEMapaInvestFdo
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdo'
          mmHeight = 2910
          mmLeft = 183092
          mmTop = 6350
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object ppdbSumSldFundo: TppDBCalc
          UserName = 'dbSumSldFundo'
          DataField = 'SALDOVLRFUNDO'
          DataPipeline = BDEMapaInvestFdo
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdo'
          mmHeight = 2910
          mmLeft = 259821
          mmTop = 2117
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 52917
          mmTop = 529
          mmWidth = 231511
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VLRTRANSF'
          DataPipeline = BDEMapaInvestFdo
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdo'
          mmHeight = 2910
          mmLeft = 151607
          mmTop = 2117
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'SALDOQTDCOTAS'
          DataPipeline = BDEMapaInvestFdo
          DisplayFormat = '###,###,##0.000000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdo'
          mmHeight = 2910
          mmLeft = 98161
          mmTop = 2117
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object BDEMapaInvestFdo: TppBDEPipeline
    DataSource = dsMapaInvFdoSintetico
    UserName = 'BDEMapaInvestFdo'
    Left = 120
    Top = 52
    object BDEMapaInvestFdoppField1: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object BDEMapaInvestFdoppField2: TppField
      FieldAlias = 'DESCFUNDOINVEST'
      FieldName = 'DESCFUNDOINVEST'
      FieldLength = 60
      DisplayWidth = 40
      Position = 1
    end
    object BDEMapaInvestFdoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRAPLICADO'
      FieldName = 'VLRAPLICADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 2
    end
    object BDEMapaInvestFdoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOQTDCOTAS'
      FieldName = 'SALDOQTDCOTAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 26
      Position = 3
    end
    object BDEMapaInvestFdoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOANTERIOR'
      FieldName = 'SALDOANTERIOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 4
    end
    object BDEMapaInvestFdoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRTRANSF'
      FieldName = 'VLRTRANSF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 5
    end
    object BDEMapaInvestFdoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRAPLICACAO'
      FieldName = 'VLRAPLICACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 6
    end
    object BDEMapaInvestFdoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRESGATE'
      FieldName = 'VLRRESGATE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 7
    end
    object BDEMapaInvestFdoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRVARIACAO'
      FieldName = 'VLRVARIACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 8
    end
    object BDEMapaInvestFdoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIOFPROV'
      FieldName = 'VLRIOFPROV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 9
    end
    object BDEMapaInvestFdoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOVLRFUNDO'
      FieldName = 'SALDOVLRFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 10
    end
    object BDEMapaInvestFdoppField12: TppField
      FieldAlias = 'DESCSEGMENTACAO'
      FieldName = 'DESCSEGMENTACAO'
      FieldLength = 100
      DisplayWidth = 35
      Position = 11
    end
    object BDEMapaInvestFdoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIOF'
      FieldName = 'VLRIOF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 12
    end
    object BDEMapaInvestFdoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIRPROV'
      FieldName = 'VLRIRPROV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 13
    end
    object BDEMapaInvestFdoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOLIQUIDO'
      FieldName = 'SALDOLIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 13
      Position = 14
    end
    object BDEMapaInvestFdoppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFUNDOINVEST'
      FieldName = 'IDFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object BDEMapaInvestFdoppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANPREVCTBPATR'
      FieldName = 'IDPLANPREVCTBPATR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object BDEMapaInvestFdoppField18: TppField
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 88
      DisplayWidth = 88
      Position = 17
    end
    object BDEMapaInvestFdoppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOINVEST'
      FieldName = 'IDTIPOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object BDEMapaInvestFdoppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIF'
      FieldName = 'DIF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object BDEMapaInvestFdoppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDSEGMENTACAO'
      FieldName = 'IDSEGMENTACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
  end
  object qryMapaInvFdoSintetico: TwwQuery
    AfterScroll = qryMapaInvFdoSinteticoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SLDATU.ID,'
      '   NVL(SLDANT.SALDOANTERIOR,0) AS SALDOANTERIOR,'
      '   NVL(SLDATU.VLRAPLICADO,0) AS VLRAPLICADO,'
      '   NVL(SLDATU.VLRIRPROV,0) AS VLRIRPROV,'
      '   NVL(SLDATU.VLRIOFPROV,0)*-1  AS VLRIOFPROV,'
      '   NVL(OPE.VLRIOF,0)*-1 AS VLRIOF,'
      '   NVL(OPE.VLRRESGATE,0)*-1 AS VLRRESGATE,'
      '   NVL(OPE.VLRAPLICACAO,0) AS VLRAPLICACAO,'
      '  (NVL(TRP.VLRENTRADA,0) + NVL(TRP.VLRSAIDA,0)) AS VLRTRANSF,'
      '   NVL(ATU.VLRVARIACAO,0) AS VLRVARIACAO,'
      '   NVL(SLDATU.SALDOQTDCOTAS,0) AS SALDOQTDCOTAS,'
      
        '  (NVL(SLDATU.SALDOVLRFUNDO,0) - NVL(SLDATU.VLRIOFPROV,0)) AS SA' +
        'LDOVLRFUNDO,'
      '   NVL(SLDATU.SALDOLIQUIDO,0)   AS SALDOLIQUIDO,'
      '   SLDATU.IDTIPOINVEST,'
      '   SLDATU.IDFUNDOINVEST,'
      '   SLDATU.IDPLANPREVCTBPATR,'
      '   FI.DESCFUNDOINVEST,'
      '   FI.DESCSEGMENTACAO,'
      '   FI.IDSEGMENTACAO,'
      '   PLA.PLANPRVCONTABPATRO,'
      
        '   NVL((SLDANT.SALDOANTERIOR + OPE.VLRAPLICACAO - SLDATU.VLRIOFP' +
        'ROV - OPE.VLRRESGATE + NVL(ATU.VLRVARIACAO,0) - SLDATU.SALDOVLRF' +
        'UNDO),0) AS DIF'
      'FROM'
      
        '   (SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'#39' - '#39'|| PE.NOME) AS ' +
        'PLANPRVCONTABPATRO'
      '    FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      '    WHERE  (PA.IDPATRO = PE.IDPESSOA(+))'
      '       AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PLA,'
      ''
      
        '   (SELECT HF.DESCFUNDOINVEST, HF.IDFUNDOINVEST, TF.IDSEGMENTACA' +
        'O, SM.DESCSEGMENTACAO'
      
        '    FROM   HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF, SEGMENTACAOME' +
        'RCADO SM'
      
        '    WHERE (HF.IDFUNDOINVEST || TO_CHAR(HF.DTAVIGENCIA,'#39'DD/MM/YYY' +
        'Y, HH24:MI:SS'#39') IN'
      
        '               (SELECT HF1.IDFUNDOINVEST || TO_CHAR(MAX(HF1.DTAV' +
        'IGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '                FROM HISTFUNDOINVEST HF1'
      
        '                WHERE (((:DATAFIM IS NOT NULL) AND (TRUNC(HF1.DT' +
        'AVIGENCIA) < TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')+1)) OR'
      '                        (:DATAFIM IS NULL))'
      '                GROUP BY HF1.IDFUNDOINVEST))'
      '    AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST )'
      '    AND (TF.IDSEGMENTACAO = SM.IDSEGMENTACAO) ) FI,'
      ''
      '   (SELECT'
      
        '       (HI.IDFUNDOINVEST || HI.IDTIPOINVEST || HI.IDPLANPREVCTBP' +
        'ATR) AS ID,'
      '       0 AS SALDOANTERIOR,'
      '       SUM(NVL(HI.VLRAPLICADO,0)) AS VLRAPLICADO,'
      '       SUM(NVL(HI.VLRIRPROV,0)) AS VLRIRPROV  ,'
      '       SUM(NVL(HI.VLRIOFPROV,0)) AS VLRIOFPROV ,'
      '       0 AS VLRRESGATE, 0 AS VLRAPLICACAO, 0 AS VLRVARIACAO,'
      '       SUM(NVL(HI.SALDOQTDCOTAS,0)) AS SALDOQTDCOTAS ,'
      '       SUM(NVL(HI.SALDOVLRFUNDO,0)) AS SALDOVLRFUNDO ,'
      
        '       SUM((NVL(HI.SALDOVLRFUNDO,0) - (NVL(HI.VLRIOFPROV,0) + NV' +
        'L(HI.VLRIRPROV,0)))) AS  SALDOLIQUIDO,'
      '       HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR'
      '    FROM'
      '       HISTFUNDO HI,'
      '      (SELECT MAX(HI1.IDHISTFUNDO) AS IDHISTFUNDO'
      '       FROM HISTFUNDO HI1,'
      '           (SELECT'
      
        '               HI2.IDTIPOINVEST, HI2.IDPLANPREVCTBPATR, HI2.IDFU' +
        'NDOINVEST,'
      '               HI2.DATAAPLICACAO, HI2.DATAMOVFUNDO'
      '            FROM HISTFUNDO HI2'
      '            WHERE'
      '                 (HI2.IDTIPOINVEST = 5)'
      
        '            AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (HI2.ID' +
        'PLANPREVCTBPATR > 0)) OR'
      
        '                   ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI2.ID' +
        'PLANPREVCTBPATR = :IDPLANPREVCTBPATR)))'
      '            AND  (HI2.IDFUNDOINVEST > 0)'
      
        '            AND  (HI2.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/Y' +
        'YYY'#39'))'
      
        '            AND  (HI2.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD/' +
        'MM/YYYY'#39')   AND'
      
        '                                           TO_DATE(:DATAFIM,'#39'DD/' +
        'MM/YYYY'#39'))'
      
        '            GROUP BY HI2.IDTIPOINVEST, HI2.IDPLANPREVCTBPATR, HI' +
        '2.IDFUNDOINVEST, HI2.DATAAPLICACAO,'
      '                     HI2.DATAMOVFUNDO) HI3,'
      ''
      '           (SELECT TP.IDTIPOINVEST, TP.IDTIPOOPERACAO'
      '            FROM   TIPOOPERACAO TP'
      
        '            WHERE  (TP.IDTIPOINVEST = 5) AND (TP.NATUREZAOPERACA' +
        'O <> '#39'R'#39')) TP1'
      '       WHERE'
      '            (HI1.IDTIPOINVEST      = 5)'
      
        '       AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (HI1.IDPLANP' +
        'REVCTBPATR = HI3.IDPLANPREVCTBPATR)) OR'
      
        '              ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI1.IDPLANP' +
        'REVCTBPATR = :IDPLANPREVCTBPATR)))'
      '       AND  (HI1.IDFUNDOINVEST     = HI3.IDFUNDOINVEST)'
      '       AND  (HI1.DATAAPLICACAO     = HI3.DATAAPLICACAO)'
      '       AND  (HI1.DATAMOVFUNDO      = HI3.DATAMOVFUNDO)'
      '       AND  (HI1.TIPMOVFUNDO      <> '#39'PIR'#39')'
      '       AND  (HI1.IDTIPOINVEST      = TP1.IDTIPOINVEST)'
      '       AND  (HI1.IDTIPOOPERACAO    = TP1.IDTIPOOPERACAO)'
      
        '       GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPATR, HI1.IDF' +
        'UNDOINVEST, HI1.DATAAPLICACAO) HIMAX1'
      ''
      '    WHERE'
      '        (HI.IDHISTFUNDO = HIMAX1.IDHISTFUNDO)'
      '    AND (HI.IDCOMPOSICAOFUNDO IS NULL)'
      
        '    GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOIN' +
        'VEST) SLDATU,'
      ''
      '   (SELECT'
      
        '       (HI.IDFUNDOINVEST || HI.IDTIPOINVEST || HI.IDPLANPREVCTBP' +
        'ATR) AS ID,'
      '       SUM(NVL(HI.SALDOVLRFUNDO,0)) AS SALDOANTERIOR,'
      '       0 AS VLRAPLICADO,'
      
        '       0 AS VLRIRPROV  , 0 AS VLRIOFPROV , 0 AS VLRRESGATE, 0 AS' +
        ' VLRAPLICACAO,'
      
        '       0 AS VLRVARIACAO, 0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO,' +
        ' 0 AS  SALDOLIQUIDO,'
      '       HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR'
      '    FROM'
      '       HISTFUNDO HI,'
      '      (SELECT MAX(HI1.IDHISTFUNDO) AS IDHISTFUNDO'
      '       FROM HISTFUNDO HI1,'
      '           (SELECT'
      
        '                 HI2.IDTIPOINVEST, HI2.IDPLANPREVCTBPATR, HI2.ID' +
        'FUNDOINVEST,'
      '                 HI2.DATAAPLICACAO, HI2.DATAMOVFUNDO'
      '            FROM HISTFUNDO HI2'
      '            WHERE'
      '                    (HI2.IDTIPOINVEST = 5)'
      
        '            AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (HI2.ID' +
        'PLANPREVCTBPATR > 0)) OR'
      
        '                   ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI2.ID' +
        'PLANPREVCTBPATR = :IDPLANPREVCTBPATR)))'
      '            AND  (HI2.IDFUNDOINVEST > 0)'
      
        '            AND  (HI2.DATAAPLICACAO < TO_DATE(:DATAINI,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '            AND  (HI2.DATAMOVFUNDO  = TO_DATE(:DATAANT,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '            GROUP BY HI2.IDTIPOINVEST, HI2.IDPLANPREVCTBPATR, HI' +
        '2.IDFUNDOINVEST, HI2.DATAAPLICACAO,'
      '                     HI2.DATAMOVFUNDO) HI3,'
      ''
      '           (SELECT TP.IDTIPOINVEST, TP.IDTIPOOPERACAO'
      '            FROM   TIPOOPERACAO TP'
      
        '            WHERE  (TP.IDTIPOINVEST = 5) AND (TP.NATUREZAOPERACA' +
        'O <> '#39'R'#39')) TP1'
      '       WHERE'
      '           (HI1.IDTIPOINVEST      = 5)'
      
        '       AND  (((:IDPLANPREVCTBPATR IS NULL)     AND (HI1.IDPLANPR' +
        'EVCTBPATR = HI3.IDPLANPREVCTBPATR)) OR'
      
        '             ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI1.IDPLANPR' +
        'EVCTBPATR = :IDPLANPREVCTBPATR)))'
      '       AND (HI1.IDFUNDOINVEST     = HI3.IDFUNDOINVEST)'
      '       AND (HI1.DATAAPLICACAO     = HI3.DATAAPLICACAO)'
      '       AND (HI1.DATAMOVFUNDO      = HI3.DATAMOVFUNDO)'
      '       AND (HI1.TIPMOVFUNDO      <> '#39'PIR'#39')'
      '       AND (HI1.IDTIPOINVEST      = TP1.IDTIPOINVEST)'
      '       AND (HI1.IDTIPOOPERACAO    = TP1.IDTIPOOPERACAO)'
      
        '       GROUP BY  HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPATR, HI1.ID' +
        'FUNDOINVEST, HI1.DATAAPLICACAO) HIMAX2'
      '    WHERE'
      '        (HI.IDHISTFUNDO = HIMAX2.IDHISTFUNDO)'
      '    AND (HI.SALDOQTDCOTAS > 0)'
      '    AND (HI.IDCOMPOSICAOFUNDO IS NULL)'
      
        '    GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOIN' +
        'VEST) SLDANT,'
      ''
      '   (SELECT'
      
        '       (HI.IDFUNDOINVEST || HI.IDTIPOINVEST || HI.IDPLANPREVCTBP' +
        'ATR) AS ID,'
      
        '       0 AS SALDOANTERIOR, 0 AS VLRAPLICADO, 0 AS VLRIRPROV, 0 A' +
        'S VLRIOFPROV ,'
      
        '       SUM(DECODE(HI.NATURMOVFUNDO,'#39'A'#39',NVL(HI.VLRMOVFUNDO,0),0))' +
        ' AS VLRAPLICACAO,'
      
        '       SUM(DECODE(HI.NATURMOVFUNDO,'#39'D'#39',NVL(HI.VLRMOVFUNDO,0),0))' +
        ' AS VLRRESGATE,'
      '       SUM(NVL(IOF.VLRIOF,0)) AS VLRIOF,'
      '       0 AS VLRVARIACAO,'
      
        '       0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, 0 AS  SALDOLIQUID' +
        'O,'
      '       HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR'
      '    FROM'
      '       HISTFUNDO HI,'
      
        '      (SELECT OP.VLRIOF, OP.IDOPERACAOORIGEM, OP.IDPLANPREVCTBPA' +
        'TR, OP.DATAOPERACAO, OP.IDTIPOOPERACAO'
      '       FROM OPERACAOFUNDO OP'
      '       WHERE'
      '           (OP.IDTIPOINVEST   = 5)'
      
        '       AND (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLANPREV' +
        'CTBPATR > 0)) OR'
      
        '            ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREV' +
        'CTBPATR = :IDPLANPREVCTBPATR)))'
      '       AND (OP.IDFUNDOINVEST > 0)'
      
        '       AND (OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY' +
        #39')   AND'
      
        '                                    TO_DATE(:DATAFIM,'#39'DD/MM/YYYY' +
        #39'))'
      '       AND (OP.VLRIOF > 0) ) IOF'
      '    WHERE'
      '         (HI.IDTIPOINVEST = 5)'
      
        '    AND  (((:IDPLANPREVCTBPATR IS NULL)     AND (HI.IDPLANPREVCT' +
        'BPATR > 0)) OR'
      
        '          ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI.IDPLANPREVCT' +
        'BPATR = :IDPLANPREVCTBPATR)))'
      '    AND  (HI.IDFUNDOINVEST > 0)'
      '    AND  (HI.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      
        '    AND  (HI.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')' +
        '   AND'
      
        '                                  TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')' +
        ')'
      '    AND  (HI.TIPMOVFUNDO    = '#39'OPE'#39')'
      '    AND  (HI.IDTIPOOPERACAO NOT IN (-107,-108))'
      '    AND  (HI.IDCOMPOSICAOFUNDO IS NULL)'
      '    AND  (IOF.IDOPERACAOORIGEM(+) = HI.IDOPERACAOFUNDO)'
      '    AND  (IOF.IDTIPOOPERACAO(+) = HI.IDTIPOOPERACAO)'
      '    AND  (IOF.DATAOPERACAO(+) = HI.DATAMOVFUNDO)'
      '    AND  (IOF.IDPLANPREVCTBPATR(+) = HI.IDPLANPREVCTBPATR)'
      
        '    GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOIN' +
        'VEST) OPE,'
      ''
      '   (SELECT'
      
        '       (HI.IDFUNDOINVEST || HI.IDTIPOINVEST || HI.IDPLANPREVCTBP' +
        'ATR) AS ID,'
      
        '       0 AS SALDOANTERIOR, 0 AS VLRAPLICADO, 0 AS VLRIRPROV, 0 A' +
        'S VLRIOFPROV ,'
      
        '       SUM(DECODE(HI.NATURMOVFUNDO,'#39'A'#39',NVL(HI.VLRMOVFUNDO,0),0))' +
        ' AS VLRENTRADA,'
      
        '       SUM(DECODE(HI.NATURMOVFUNDO,'#39'D'#39',NVL(HI.VLRMOVFUNDO,0),0))' +
        '*-1 AS VLRSAIDA,'
      '       0 AS VLRVARIACAO,'
      
        '       0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, 0 AS  SALDOLIQUID' +
        'O,'
      '       HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR'
      '    FROM'
      '       HISTFUNDO HI,'
      '      (SELECT'
      '          MAX(HI1.IDHISTFUNDO) AS IDHISTFUNDO'
      '       FROM'
      '          HISTFUNDO HI1'
      '       WHERE'
      '            (HI1.IDTIPOINVEST = 5)'
      
        '       AND  (((:IDPLANPREVCTBPATR IS NULL)     AND (HI1.IDPLANPR' +
        'EVCTBPATR > 0)) OR'
      
        '             ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI1.IDPLANPR' +
        'EVCTBPATR = :IDPLANPREVCTBPATR)))'
      '       AND  (HI1.IDFUNDOINVEST > 0)'
      
        '       AND  (HI1.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')' +
        ')'
      
        '       AND  (HI1.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YY' +
        'YY'#39')   AND'
      
        '                                      TO_DATE(:DATAFIM,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '       AND ((HI1.TIPMOVFUNDO    = '#39'OPE'#39') OR (HI1.TIPMOVFUNDO = '#39 +
        'TRP'#39'))'
      '       AND  (HI1.IDTIPOOPERACAO IN (-107,-108))'
      '       AND  (HI1.IDCOMPOSICAOFUNDO IS NULL)'
      '       AND  (HI1.NATURMOVFUNDO <> '#39'X'#39')'
      
        '       GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPATR, HI1.IDF' +
        'UNDOINVEST,'
      
        '                HI1.DATAAPLICACAO, HI1.DATAMOVFUNDO, HI1.IDOPERA' +
        'CAOFUNDO) HMAX'
      '    WHERE'
      '       (HI.IDHISTFUNDO = HMAX.IDHISTFUNDO)'
      
        '    GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOIN' +
        'VEST) TRP,'
      ''
      '  (SELECT'
      '      VATUTRP.ID,'
      '      SUM(NVL(VATUTRP.SALDOANTERIOR,0)) AS SALDOANTERIOR,'
      '      SUM(NVL(VATUTRP.VLRAPLICADO,0))   AS VLRAPLICADO,'
      '      SUM(NVL(VATUTRP.VLRIRPROV,0))     AS VLRIRPROV,'
      '      SUM(NVL(VATUTRP.VLRIOFPROV,0))    AS VLRIOFPROV,'
      '      SUM(NVL(VATUTRP.VLRAPLICACAO,0))  AS VLRAPLICACAO,'
      '      SUM(NVL(VATUTRP.VLRRESGATE,0))    AS VLRRESGATE,'
      '      SUM(NVL(VATUTRP.VLRVARIACAO,0))   AS VLRVARIACAO,'
      '      SUM(NVL(VATUTRP.SALDOQTDCOTAS,0)) AS SALDOQTDCOTAS,'
      '      SUM(NVL(VATUTRP.SALDOVLRFUNDO,0)) AS SALDOVLRFUNDO,'
      '      SUM(NVL(VATUTRP.SALDOLIQUIDO,0))  AS SALDOLIQUIDO,'
      
        '      VATUTRP.IDTIPOINVEST, VATUTRP.IDFUNDOINVEST, VATUTRP.IDPLA' +
        'NPREVCTBPATR'
      '   FROM'
      '     (SELECT'
      
        '        (HI.IDFUNDOINVEST || HI.IDTIPOINVEST || HI.IDPLANPREVCTB' +
        'PATR) AS ID,'
      
        '         0 AS SALDOANTERIOR, 0 AS VLRAPLICADO, 0 AS VLRIRPROV, 0' +
        ' AS VLRIOFPROV ,'
      '         0 AS VLRAPLICACAO,'
      '         0 AS VLRRESGATE,'
      '         SUM(NVL(HI.VLRVARIACAO,0)) AS VLRVARIACAO,'
      
        '         0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, 0 AS  SALDOLIQU' +
        'IDO,'
      
        '         HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPAT' +
        'R'
      '      FROM'
      '         HISTFUNDO HI,'
      '         (SELECT MAX(H.IDHISTFUNDO) AS IDHISTFUNDO'
      '          FROM  HISTFUNDO H'
      '          WHERE'
      '               (H.IDTIPOINVEST   = 5)'
      
        '          AND (((:IDPLANPREVCTBPATR IS NULL)     AND (H.IDPLANPR' +
        'EVCTBPATR > 0)) OR'
      
        '               ((:IDPLANPREVCTBPATR IS NOT NULL) AND (H.IDPLANPR' +
        'EVCTBPATR = :IDPLANPREVCTBPATR)))'
      '          AND  (H.IDFUNDOINVEST > 0)'
      
        '          AND  (H.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39 +
        '))'
      
        '          AND  (H.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/Y' +
        'YYY'#39')   AND'
      
        '                                       TO_DATE(:DATAFIM,'#39'DD/MM/Y' +
        'YYY'#39'))'
      
        '          AND ((H.TIPMOVFUNDO    = '#39'ATU'#39') OR (H.TIPMOVFUNDO  = '#39 +
        'AJU'#39'))'
      '          AND  (H.IDCOMPOSICAOFUNDO IS NULL)'
      
        '          GROUP BY H.IDTIPOINVEST, H.IDPLANPREVCTBPATR, H.IDFUND' +
        'OINVEST, H.DATAAPLICACAO, H.DATAMOVFUNDO, H.IDOPERACAOFUNDO, H.T' +
        'IPMOVFUNDO) HIMAX3'
      '      WHERE'
      '          (HI.IDHISTFUNDO = HIMAX3.IDHISTFUNDO)'
      
        '      GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDO' +
        'INVEST'
      ''
      '      UNION'
      ''
      '      SELECT'
      
        '         (HI.IDFUNDOINVEST || HI.IDTIPOINVEST || HI.IDPLANPREVCT' +
        'BPATR) AS ID,'
      
        '          0 AS SALDOANTERIOR, 0 AS VLRAPLICADO, 0 AS VLRIRPROV, ' +
        '0 AS VLRIOFPROV ,'
      '          0 AS VLRAPLICACAO,'
      '          0 AS VLRRESGATE,'
      '          SUM(NVL(HI.VLRVARIACAO,0)) AS VLRVARIACAO,'
      
        '          0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, 0 AS  SALDOLIQ' +
        'UIDO,'
      
        '          HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPA' +
        'TR'
      '      FROM'
      '          HISTFUNDO HI,'
      '         (SELECT'
      '             MAX(HI1.IDHISTFUNDO) AS IDHISTFUNDO'
      '          FROM'
      '             HISTFUNDO HI1'
      '          WHERE'
      '              (HI1.IDTIPOINVEST = 5)'
      
        '          AND  (((:IDPLANPREVCTBPATR IS NULL)     AND (HI1.IDPLA' +
        'NPREVCTBPATR > 0)) OR'
      
        '                ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI1.IDPLA' +
        'NPREVCTBPATR = :IDPLANPREVCTBPATR)))'
      '          AND  (HI1.IDFUNDOINVEST > 0)'
      
        '          AND  (HI1.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYY' +
        'Y'#39'))'
      
        '          AND  (HI1.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM' +
        '/YYYY'#39')   AND'
      
        '                                         TO_DATE(:DATAFIM,'#39'DD/MM' +
        '/YYYY'#39'))'
      
        '          AND ((HI1.TIPMOVFUNDO    = '#39'OPE'#39') OR (HI1.TIPMOVFUNDO ' +
        '= '#39'TRP'#39'))'
      '          AND  (HI1.IDTIPOOPERACAO IN (-107,-108))'
      '          AND  (HI1.IDCOMPOSICAOFUNDO IS NULL)'
      
        '          GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPATR, HI1.' +
        'IDFUNDOINVEST,'
      
        '                   HI1.DATAAPLICACAO, HI1.DATAMOVFUNDO, HI1.IDOP' +
        'ERACAOFUNDO) HMAX'
      '      WHERE'
      '           NVL(HI.VLRVARIACAO,0) <> 0'
      '      AND     (HI.IDHISTFUNDO = HMAX.IDHISTFUNDO)'
      
        '      GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDO' +
        'INVEST) VATUTRP'
      
        '   GROUP BY  VATUTRP.ID, VATUTRP.IDTIPOINVEST, VATUTRP.IDFUNDOIN' +
        'VEST,'
      '             VATUTRP.IDPLANPREVCTBPATR) ATU'
      ''
      'WHERE'
      '    (SLDATU.ID = SLDANT.ID(+))'
      'AND (SLDATU.ID = OPE.ID(+))'
      'AND (SLDATU.ID = TRP.ID(+))'
      'AND (SLDATU.ID = ATU.ID(+))'
      'AND (SLDATU.IDFUNDOINVEST = FI.IDFUNDOINVEST)'
      'AND (SLDATU.IDPLANPREVCTBPATR = PLA.IDPLANPREVCTBPATR)'
      'ORDER BY  PLA.PLANPRVCONTABPATRO, FI.DESCFUNDOINVEST'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 121
    Top = 107
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
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
        Name = 'DATAANT'
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
        Name = 'DATAFIM'
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    object qryMapaInvFdoSinteticoPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patro'
      DisplayWidth = 26
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryMapaInvFdoSinteticoDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 40
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object qryMapaInvFdoSinteticoVLRAPLICADO: TFloatField
      DisplayLabel = 'Valor Aplicado'
      DisplayWidth = 18
      FieldName = 'VLRAPLICADO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvFdoSinteticoSALDOQTDCOTAS: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 26
      FieldName = 'SALDOQTDCOTAS'
      DisplayFormat = '###,###,###,###,##0.000000000'
    end
    object qryMapaInvFdoSinteticoSALDOANTERIOR: TFloatField
      DisplayLabel = 'Saldo Anterior'
      DisplayWidth = 18
      FieldName = 'SALDOANTERIOR'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvFdoSinteticoVLRTRANSF: TFloatField
      DisplayLabel = 'Transferência'
      DisplayWidth = 18
      FieldName = 'VLRTRANSF'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvFdoSinteticoVLRAPLICACAO: TFloatField
      DisplayLabel = 'Aplicação'
      DisplayWidth = 18
      FieldName = 'VLRAPLICACAO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvFdoSinteticoVLRRESGATE: TFloatField
      DisplayLabel = 'Resgate'
      DisplayWidth = 18
      FieldName = 'VLRRESGATE'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvFdoSinteticoVLRVARIACAO: TFloatField
      DisplayLabel = 'Variação'
      DisplayWidth = 16
      FieldName = 'VLRVARIACAO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvFdoSinteticoVLRIOFPROV: TFloatField
      DisplayLabel = 'IOF'
      DisplayWidth = 16
      FieldName = 'VLRIOFPROV'
      DisplayFormat = '###,###,##0.00'
    end
    object qryMapaInvFdoSinteticoSALDOVLRFUNDO: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 18
      FieldName = 'SALDOVLRFUNDO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvFdoSinteticoDESCSEGMENTACAO: TStringField
      DisplayLabel = 'Segmentação de Mercado'
      DisplayWidth = 35
      FieldName = 'DESCSEGMENTACAO'
      Size = 100
    end
    object qryMapaInvFdoSinteticoVLRIOF: TFloatField
      DisplayLabel = 'IOF Pago'
      DisplayWidth = 16
      FieldName = 'VLRIOF'
      Visible = False
      DisplayFormat = '###,###,##0.00'
    end
    object qryMapaInvFdoSinteticoVLRIRPROV: TFloatField
      DisplayLabel = 'IOF Pago'
      DisplayWidth = 16
      FieldName = 'VLRIRPROV'
      Visible = False
      DisplayFormat = '###,###,##0.00'
    end
    object qryMapaInvFdoSinteticoSALDOLIQUIDO: TFloatField
      DisplayWidth = 13
      FieldName = 'SALDOLIQUIDO'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvFdoSinteticoIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object qryMapaInvFdoSinteticoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryMapaInvFdoSinteticoID: TStringField
      FieldName = 'ID'
      Visible = False
      Size = 88
    end
    object qryMapaInvFdoSinteticoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryMapaInvFdoSinteticoDIF: TFloatField
      FieldName = 'DIF'
      Visible = False
    end
    object qryMapaInvFdoSinteticoIDSEGMENTACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSEGMENTACAO'
      Visible = False
    end
  end
  object dsMapaInvFdoSintetico: TwwDataSource
    DataSet = qryMapaInvFdoSintetico
    Left = 121
    Top = 155
  end
  object qryFundoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST'
      'FROM'
      '   TIPOFUNDOINVEST TFI,'
      
        '   (SELECT * FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_CHA' +
        'R(DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '            (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),'#39'D' +
        'D/MM/YYYY, HH24:MI:SS'#39')'
      '             FROM HISTFUNDOINVEST'
      
        '             WHERE DTAVIGENCIA < TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')+' +
        '1'
      '             GROUP BY IDFUNDOINVEST))) FUN'
      'WHERE'
      '   (FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST)'
      
        '   AND ((:IDTIPOFUNDOINVEST IS NULL) OR (FUN.IDTIPOFUNDOINVEST =' +
        ' :IDTIPOFUNDOINVEST))'
      '   AND (TFI.IDTIPOINVEST = 5)'
      'ORDER BY'
      '   FUN.DESCFUNDOINVEST'
      ''
      ''
      ''
      ''
      ''
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
      ' ')
    ValidateWithMask = True
    Left = 29
    Top = 218
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end>
  end
  object qryCarteiraSPC: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 241
    Top = 218
  end
  object qryCarteiraInvest: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 241
    Top = 266
  end
  object qryPlanPrevCtbPatr: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLAN' +
        'PRVCONTABPATRO'
      'FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      'WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '  AND (PA.IDPLANOPREV = PL.IDPLANOPREV)')
    ValidateWithMask = True
    Left = 121
    Top = 218
    object qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
  end
  object qryTipoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOINVEST, DESCTIPOINVEST'
      'FROM'
      '   TIPOINVEST'
      'WHERE'
      '   IDTIPOINVEST =:IDTIPOINVEST'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 29
    Top = 266
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
    object qryTipoInvestIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOINVEST.IDTIPOINVEST'
    end
    object qryTipoInvestDESCTIPOINVEST: TStringField
      FieldName = 'DESCTIPOINVEST'
      Origin = 'BASEDADOS.TIPOINVEST.DESCTIPOINVEST'
      Size = 60
    end
  end
  object qryMapaInvFdoAnalitico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SLDATU.ID, SLDATU.ID1,'
      '   SLDATU.DATAAPLICACAO,'
      '   SLDATU.DATAMOVFUNDO,'
      '   NVL(SLDANT.SALDOANTERIOR,0) AS SALDOANTERIOR,'
      '   NVL(SLDATU.VLRAPLICADO,0) AS VLRAPLICADO,'
      '   NVL(SLDATU.VLRIRPROV,0) AS VLRIRPROV,'
      '   NVL(SLDATU.VLRIOFPROV,0)*-1  AS VLRIOFPROV,'
      '   NVL(OPE.VLRIOF,0)*-1 AS VLRIOF,'
      '   NVL(OPE.VLRRESGATE,0)*-1 AS VLRRESGATE,'
      '   NVL(OPE.VLRAPLICACAO,0) AS VLRAPLICACAO,'
      '  (NVL(TRP.VLRENTRADA,0) + NVL(TRP.VLRSAIDA,0)) AS VLRTRANSF,'
      '   NVL(ATU.VLRVARIACAO,0) AS VLRVARIACAO,'
      '   NVL(SLDATU.SALDOQTDCOTAS,0) AS SALDOQTDCOTAS,'
      
        '  (NVL(SLDATU.SALDOVLRFUNDO,0) - NVL(SLDATU.VLRIOFPROV,0)) AS SA' +
        'LDOVLRFUNDO,'
      '   NVL(SLDATU.SALDOLIQUIDO,0)   AS SALDOLIQUIDO,'
      '   SLDATU.IDTIPOINVEST,'
      '   SLDATU.IDFUNDOINVEST,'
      '   SLDATU.IDPLANPREVCTBPATR'
      'FROM'
      '  (SELECT'
      
        '       (HI.IDFUNDOINVEST || HI.DATAAPLICACAO || HI.IDPLANPREVCTB' +
        'PATR) AS ID,'
      
        '       (HI.IDFUNDOINVEST || HI.IDTIPOINVEST || HI.IDPLANPREVCTBP' +
        'ATR) AS ID1,'
      '       HI.DATAAPLICACAO ,   HI.DATAMOVFUNDO ,'
      
        '       0 AS SALDOANTERIOR,  NVL(HI.VLRAPLICADO,0) AS VLRAPLICADO' +
        ','
      
        '       NVL(HI.VLRIRPROV,0) AS VLRIRPROV  , NVL(HI.VLRIOFPROV,0) ' +
        'AS VLRIOFPROV ,'
      '       0 AS VLRRESGATE, 0 AS VLRAPLICACAO, 0 AS VLRVARIACAO,'
      '       NVL(HI.SALDOQTDCOTAS,0) AS SALDOQTDCOTAS ,'
      '       NVL(HI.SALDOVLRFUNDO,0) AS SALDOVLRFUNDO ,'
      
        '       (NVL(HI.SALDOVLRFUNDO,0) - (NVL(HI.VLRIOFPROV,0) + NVL(HI' +
        '.VLRIRPROV,0))) AS  SALDOLIQUIDO,'
      '       HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR'
      '   FROM'
      '       HISTFUNDO HI,'
      '      (SELECT MAX(HI1.IDHISTFUNDO) AS IDHISTFUNDO'
      '       FROM HISTFUNDO HI1,'
      '          (SELECT'
      
        '                HI2.IDTIPOINVEST, HI2.IDPLANPREVCTBPATR, HI2.IDF' +
        'UNDOINVEST,'
      '                HI2.DATAAPLICACAO, HI2.DATAMOVFUNDO'
      '            FROM HISTFUNDO HI2'
      '            WHERE'
      '                  (HI2.IDTIPOINVEST = 5)'
      
        '            AND    (((:IDPLANPREVCTBPATR IS NULL)     AND (HI2.I' +
        'DPLANPREVCTBPATR > 0)) OR'
      
        '                    ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI2.I' +
        'DPLANPREVCTBPATR = :IDPLANPREVCTBPATR)))'
      '            AND   (HI2.IDFUNDOINVEST > 0)'
      
        '            AND   (HI2.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/' +
        'YYYY'#39'))'
      
        '            AND   (HI2.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD' +
        '/MM/YYYY'#39') AND'
      
        '                                            TO_DATE(:DATAFIM,'#39'DD' +
        '/MM/YYYY'#39'))'
      
        '            GROUP BY HI2.IDTIPOINVEST, HI2.IDPLANPREVCTBPATR, HI' +
        '2.IDFUNDOINVEST, HI2.DATAAPLICACAO,'
      '                     HI2.DATAMOVFUNDO) HI3,'
      ''
      '           (SELECT TP.IDTIPOINVEST, TP.IDTIPOOPERACAO'
      '            FROM   TIPOOPERACAO TP'
      
        '            WHERE  (TP.IDTIPOINVEST = 5) AND (TP.NATUREZAOPERACA' +
        'O <> '#39'R'#39')) TP1'
      '       WHERE'
      '            (HI1.IDTIPOINVEST = 5)'
      
        '       AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (HI1.IDPLANP' +
        'REVCTBPATR = HI3.IDPLANPREVCTBPATR)) OR'
      
        '              ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI1.IDPLANP' +
        'REVCTBPATR = :IDPLANPREVCTBPATR)))'
      '       AND  (HI1.IDFUNDOINVEST     = HI3.IDFUNDOINVEST)'
      '       AND  (HI1.DATAAPLICACAO     = HI3.DATAAPLICACAO)'
      '       AND  (HI1.DATAMOVFUNDO      = HI3.DATAMOVFUNDO)'
      '       AND  (HI1.TIPMOVFUNDO      <> '#39'PIR'#39')'
      '       AND  (HI1.IDTIPOINVEST      = TP1.IDTIPOINVEST)'
      '       AND  (HI1.IDTIPOOPERACAO    = TP1.IDTIPOOPERACAO)'
      
        '       GROUP BY  HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPATR, HI1.ID' +
        'FUNDOINVEST, HI1.DATAAPLICACAO) HIMAX1'
      '   WHERE'
      '       (HI.IDHISTFUNDO = HIMAX1.IDHISTFUNDO)'
      '   AND (HI.IDCOMPOSICAOFUNDO IS NULL)) SLDATU,'
      ''
      '  (SELECT'
      
        '       (HI.IDFUNDOINVEST || HI.DATAAPLICACAO || HI.IDPLANPREVCTB' +
        'PATR) AS ID,'
      
        '       (HI.IDFUNDOINVEST || HI.IDTIPOINVEST || HI.IDPLANPREVCTBP' +
        'ATR) AS ID1,'
      '       HI.DATAAPLICACAO , HI.DATAMOVFUNDO,'
      
        '       NVL(HI.SALDOVLRFUNDO,0) AS SALDOANTERIOR, 0 AS VLRAPLICAD' +
        'O,'
      
        '       0 AS VLRIRPROV  , 0 AS VLRIOFPROV , 0 AS VLRRESGATE, 0 AS' +
        ' VLRAPLICACAO,'
      
        '       0 AS VLRVARIACAO, 0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO,' +
        ' 0 AS  SALDOLIQUIDO,'
      '       HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR'
      '   FROM'
      '       HISTFUNDO HI,'
      '      (SELECT MAX(HI1.IDHISTFUNDO) AS IDHISTFUNDO'
      '       FROM HISTFUNDO HI1,'
      ''
      '           (SELECT /*+INDEX (HI2.XIE1HISTFUNDO)*/'
      
        '                 HI2.IDTIPOINVEST, HI2.IDPLANPREVCTBPATR, HI2.ID' +
        'FUNDOINVEST,'
      '                 HI2.DATAAPLICACAO, HI2.DATAMOVFUNDO'
      '            FROM HISTFUNDO HI2'
      '            WHERE'
      '                   (HI2.IDTIPOINVEST = 5)'
      
        '            AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (HI2.ID' +
        'PLANPREVCTBPATR > 0)) OR'
      
        '                   ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI2.ID' +
        'PLANPREVCTBPATR = :IDPLANPREVCTBPATR)))'
      '            AND  (HI2.IDFUNDOINVEST > 0)'
      
        '            AND  (HI2.DATAAPLICACAO < TO_DATE(:DATAINI,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '            AND  (HI2.DATAMOVFUNDO   = TO_DATE(:DATAANT,'#39'DD/MM/Y' +
        'YYY'#39'))'
      
        '            GROUP BY HI2.IDTIPOINVEST, HI2.IDPLANPREVCTBPATR, HI' +
        '2.IDFUNDOINVEST, HI2.DATAAPLICACAO,'
      '                     HI2.DATAMOVFUNDO) HI3,'
      '           (SELECT TP.IDTIPOINVEST, TP.IDTIPOOPERACAO'
      '            FROM   TIPOOPERACAO TP'
      
        '            WHERE  (TP.IDTIPOINVEST = 5) AND (TP.NATUREZAOPERACA' +
        'O <> '#39'R'#39')) TP1'
      '       WHERE'
      '           (HI1.IDTIPOINVEST = 5)'
      
        '       AND  (((:IDPLANPREVCTBPATR IS NULL)     AND (HI1.IDPLANPR' +
        'EVCTBPATR = HI3.IDPLANPREVCTBPATR)) OR'
      
        '             ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI1.IDPLANPR' +
        'EVCTBPATR = :IDPLANPREVCTBPATR)))'
      '       AND  (HI1.IDFUNDOINVEST     = HI3.IDFUNDOINVEST)'
      '       AND  (HI1.DATAAPLICACAO     = HI3.DATAAPLICACAO)'
      '       AND  (HI1.DATAMOVFUNDO      = HI3.DATAMOVFUNDO)'
      '       AND (HI1.TIPMOVFUNDO       <> '#39'PIR'#39')'
      '       AND (HI1.IDTIPOINVEST       = TP1.IDTIPOINVEST)'
      '       AND (HI1.IDTIPOOPERACAO     = TP1.IDTIPOOPERACAO)'
      
        '       GROUP BY  HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPATR, HI1.ID' +
        'FUNDOINVEST, HI1.DATAAPLICACAO) HIMAX2'
      '   WHERE'
      '       (HI.IDHISTFUNDO = HIMAX2.IDHISTFUNDO)'
      '   AND (HI.SALDOQTDCOTAS > 0)'
      '   AND (HI.IDCOMPOSICAOFUNDO IS NULL)) SLDANT,'
      ''
      '  (SELECT'
      
        '       (HI.IDFUNDOINVEST || HI.DATAAPLICACAO || HI.IDPLANPREVCTB' +
        'PATR) AS ID,'
      
        '       (HI.IDFUNDOINVEST || HI.IDTIPOINVEST  || HI.IDPLANPREVCTB' +
        'PATR) AS ID1,'
      '       HI.DATAAPLICACAO , '#39#39' AS DATAMOVFUNDO,'
      
        '       0 AS SALDOANTERIOR, 0 AS VLRAPLICADO, 0 AS VLRIRPROV, 0 A' +
        'S VLRIOFPROV ,'
      
        '       SUM(DECODE(HI.NATURMOVFUNDO,'#39'A'#39',NVL(HI.VLRMOVFUNDO,0),0))' +
        ' AS VLRAPLICACAO,'
      
        '       SUM(DECODE(HI.NATURMOVFUNDO,'#39'D'#39',NVL(HI.VLRMOVFUNDO,0),0))' +
        ' AS VLRRESGATE,'
      '       SUM(NVL(IOF.VLRIOF,0)) AS VLRIOF,'
      '       0 AS VLRVARIACAO,'
      
        '       0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, 0 AS  SALDOLIQUID' +
        'O,'
      '       HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR'
      '   FROM'
      '       HISTFUNDO HI,'
      
        '      (SELECT OP.VLRIOF, OP.IDOPERACAOORIGEM, OP.IDPLANPREVCTBPA' +
        'TR, OP.DATAOPERACAO, OP.IDTIPOOPERACAO'
      '       FROM OPERACAOFUNDO OP'
      '       WHERE'
      '           (OP.IDTIPOINVEST   = 5)'
      
        '       AND (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLANPREV' +
        'CTBPATR > 0)) OR'
      
        '            ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREV' +
        'CTBPATR = :IDPLANPREVCTBPATR)))'
      '       AND (OP.IDFUNDOINVEST > 0)'
      
        '       AND (OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY' +
        #39')   AND'
      
        '                                    TO_DATE(:DATAFIM,'#39'DD/MM/YYYY' +
        #39'))'
      '       AND (OP.VLRIOF > 0) ) IOF'
      '   WHERE'
      '        (HI.IDTIPOINVEST = 5)'
      
        '   AND  (((:IDPLANPREVCTBPATR IS NULL)     AND (HI.IDPLANPREVCTB' +
        'PATR > 0)) OR'
      
        '         ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI.IDPLANPREVCTB' +
        'PATR = :IDPLANPREVCTBPATR)))'
      '   AND  (HI.IDFUNDOINVEST > 0)'
      '   AND  (HI.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      
        '   AND  (HI.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') ' +
        '  AND'
      '                                 TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '   AND  (HI.TIPMOVFUNDO    = '#39'OPE'#39')'
      '   AND  (HI.IDTIPOOPERACAO NOT IN (-107,-108))'
      '   AND  (HI.IDCOMPOSICAOFUNDO IS NULL)'
      '   AND  (IOF.IDOPERACAOORIGEM(+) = HI.IDOPERACAOFUNDO)'
      '   AND  (IOF.IDTIPOOPERACAO(+) = HI.IDTIPOOPERACAO)'
      '   AND  (IOF.DATAOPERACAO(+) = HI.DATAMOVFUNDO)'
      '   AND  (IOF.IDPLANPREVCTBPATR(+) = HI.IDPLANPREVCTBPATR)'
      
        '   GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOINV' +
        'EST, HI.DATAAPLICACAO) OPE,'
      ''
      '  (SELECT'
      
        '       (HI.IDFUNDOINVEST || HI.DATAAPLICACAO || HI.IDPLANPREVCTB' +
        'PATR) AS ID,'
      
        '       (HI.IDFUNDOINVEST || HI.IDTIPOINVEST  || HI.IDPLANPREVCTB' +
        'PATR) AS ID1,'
      '       HI.DATAAPLICACAO , '#39#39' AS DATAMOVFUNDO,'
      
        '       0 AS SALDOANTERIOR, 0 AS VLRAPLICADO, 0 AS VLRIRPROV, 0 A' +
        'S VLRIOFPROV ,'
      
        '       SUM(DECODE(HI.NATURMOVFUNDO,'#39'A'#39',NVL(HI.VLRMOVFUNDO,0),0))' +
        ' AS VLRENTRADA,'
      
        '       SUM(DECODE(HI.NATURMOVFUNDO,'#39'D'#39',NVL(HI.VLRMOVFUNDO,0)*-1,' +
        '0)) AS VLRSAIDA,'
      '       0 AS VLRVARIACAO,'
      
        '       0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, 0 AS  SALDOLIQUID' +
        'O,'
      '       HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR'
      '   FROM'
      '       HISTFUNDO HI,'
      '      (SELECT'
      '           MAX(HI1.IDHISTFUNDO) AS IDHISTFUNDO'
      '       FROM'
      '           HISTFUNDO HI1'
      '       WHERE'
      '            (HI1.IDTIPOINVEST = 5)'
      
        '       AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (HI1.IDPLANP' +
        'REVCTBPATR > 0)) OR'
      
        '              ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI1.IDPLANP' +
        'REVCTBPATR = :IDPLANPREVCTBPATR)))'
      '       AND  (HI1.IDFUNDOINVEST > 0)'
      
        '       AND  (HI1.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')' +
        ')'
      
        '       AND  (HI1.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YY' +
        'YY'#39')   AND'
      
        '                                      TO_DATE(:DATAFIM,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '       AND ((HI1.TIPMOVFUNDO    = '#39'OPE'#39') OR (HI1.TIPMOVFUNDO = '#39 +
        'TRP'#39'))'
      '       AND  (HI1.IDTIPOOPERACAO IN (-107,-108))'
      '       AND  (HI1.IDCOMPOSICAOFUNDO IS NULL)'
      '       AND  (HI1.NATURMOVFUNDO <> '#39'X'#39')'
      
        '       GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPATR, HI1.IDF' +
        'UNDOINVEST,'
      
        '                HI1.DATAAPLICACAO, HI1.DATAMOVFUNDO, HI1.IDOPERA' +
        'CAOFUNDO) HMAX'
      '   WHERE'
      '      (HI.IDHISTFUNDO = HMAX.IDHISTFUNDO)'
      
        '   GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOINV' +
        'EST, HI.DATAAPLICACAO) TRP,'
      ''
      '  (SELECT'
      '     VATUTRP.ID,'
      '     VATUTRP.ID1,'
      '     VATUTRP.DATAAPLICACAO,'
      '     VATUTRP.DATAMOVFUNDO,'
      '     SUM(NVL(VATUTRP.SALDOANTERIOR,0)) AS SALDOANTERIOR,'
      '     SUM(NVL(VATUTRP.VLRAPLICADO,0))   AS VLRAPLICADO,'
      '     SUM(NVL(VATUTRP.VLRIRPROV,0))     AS VLRIRPROV,'
      '     SUM(NVL(VATUTRP.VLRIOFPROV,0))    AS VLRIOFPROV,'
      '     SUM(NVL(VATUTRP.VLRAPLICACAO,0))  AS VLRAPLICACAO,'
      '     SUM(NVL(VATUTRP.VLRRESGATE,0))    AS VLRRESGATE,'
      '     SUM(NVL(VATUTRP.VLRVARIACAO,0))   AS VLRVARIACAO,'
      '     SUM(NVL(VATUTRP.SALDOQTDCOTAS,0)) AS SALDOQTDCOTAS,'
      '     SUM(NVL(VATUTRP.SALDOVLRFUNDO,0)) AS SALDOVLRFUNDO,'
      '     SUM(NVL(VATUTRP.SALDOLIQUIDO,0))  AS SALDOLIQUIDO,'
      
        '     VATUTRP.IDTIPOINVEST, VATUTRP.IDFUNDOINVEST, VATUTRP.IDPLAN' +
        'PREVCTBPATR'
      '   FROM'
      '      (SELECT'
      
        '           (HI.IDFUNDOINVEST || HI.DATAAPLICACAO || HI.IDPLANPRE' +
        'VCTBPATR) AS ID,'
      
        '           (HI.IDFUNDOINVEST || HI.IDTIPOINVEST  || HI.IDPLANPRE' +
        'VCTBPATR) AS ID1,'
      '            HI.DATAAPLICACAO , '#39#39' AS DATAMOVFUNDO,'
      
        '            0 AS SALDOANTERIOR, 0 AS VLRAPLICADO, 0 AS VLRIRPROV' +
        ', 0 AS VLRIOFPROV ,'
      '            0 AS VLRAPLICACAO,'
      '            0 AS VLRRESGATE,'
      '            SUM(NVL(HI.VLRVARIACAO,0)) AS VLRVARIACAO,'
      
        '            0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, 0 AS  SALDOL' +
        'IQUIDO,'
      
        '            HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTB' +
        'PATR'
      '       FROM'
      '           HISTFUNDO HI,'
      '          (SELECT MAX(H.IDHISTFUNDO) AS IDHISTFUNDO'
      '           FROM  HISTFUNDO H'
      '           WHERE'
      '                (H.IDTIPOINVEST   = 5)'
      
        '           AND (((:IDPLANPREVCTBPATR IS NULL)     AND (H.IDPLANP' +
        'REVCTBPATR > 0)) OR'
      
        '                ((:IDPLANPREVCTBPATR IS NOT NULL) AND (H.IDPLANP' +
        'REVCTBPATR = :IDPLANPREVCTBPATR)))'
      '           AND  (H.IDFUNDOINVEST > 0)'
      
        '           AND  (H.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY' +
        #39'))'
      
        '           AND  (H.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/' +
        'YYYY'#39')   AND'
      
        '                                        TO_DATE(:DATAFIM,'#39'DD/MM/' +
        'YYYY'#39'))'
      
        '           AND ((H.TIPMOVFUNDO    = '#39'ATU'#39') OR (H.TIPMOVFUNDO  = ' +
        #39'AJU'#39'))'
      '           AND  (H.IDCOMPOSICAOFUNDO IS NULL)'
      
        '           GROUP BY H.IDTIPOINVEST, H.IDPLANPREVCTBPATR, H.IDFUN' +
        'DOINVEST, H.DATAAPLICACAO, H.DATAMOVFUNDO, H.IDOPERACAOFUNDO, H.' +
        'TIPMOVFUNDO) HIMAX3'
      '       WHERE'
      '          (HI.IDHISTFUNDO = HIMAX3.IDHISTFUNDO)'
      
        '       GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUND' +
        'OINVEST, HI.DATAAPLICACAO'
      ''
      '       UNION'
      ''
      '       SELECT'
      
        '           (HI.IDFUNDOINVEST || HI.DATAAPLICACAO || HI.IDPLANPRE' +
        'VCTBPATR) AS ID,'
      
        '           (HI.IDFUNDOINVEST || HI.IDTIPOINVEST  || HI.IDPLANPRE' +
        'VCTBPATR) AS ID1,'
      '            HI.DATAAPLICACAO , '#39#39' AS DATAMOVFUNDO,'
      
        '            0 AS SALDOANTERIOR, 0 AS VLRAPLICADO, 0 AS VLRIRPROV' +
        ', 0 AS VLRIOFPROV ,'
      '            0 AS VLRAPLICACAO,'
      '            0 AS VLRRESGATE,'
      '            SUM(NVL(HI.VLRVARIACAO,0)) AS VLRVARIACAO,'
      
        '            0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, 0 AS  SALDOL' +
        'IQUIDO,'
      
        '            HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTB' +
        'PATR'
      '       FROM'
      '           HISTFUNDO HI,'
      '          (SELECT'
      '               MAX(HI1.IDHISTFUNDO) AS IDHISTFUNDO'
      '           FROM'
      '               HISTFUNDO HI1'
      '           WHERE'
      '                (HI1.IDTIPOINVEST = 5)'
      
        '           AND  (((:IDPLANPREVCTBPATR IS NULL)     AND (HI1.IDPL' +
        'ANPREVCTBPATR > 0)) OR'
      
        '                 ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI1.IDPL' +
        'ANPREVCTBPATR = :IDPLANPREVCTBPATR)))'
      '           AND  (HI1.IDFUNDOINVEST > 0)'
      
        '           AND  (HI1.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '           AND  (HI1.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD/M' +
        'M/YYYY'#39')   AND'
      
        '                                          TO_DATE(:DATAFIM,'#39'DD/M' +
        'M/YYYY'#39'))'
      
        '           AND ((HI1.TIPMOVFUNDO    = '#39'OPE'#39') OR (HI1.TIPMOVFUNDO' +
        ' = '#39'TRP'#39'))'
      '           AND  (HI1.IDTIPOOPERACAO IN (-107,-108))'
      '           AND  (HI1.IDCOMPOSICAOFUNDO IS NULL)'
      
        '           GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPATR, HI1' +
        '.IDFUNDOINVEST,'
      
        '                    HI1.DATAAPLICACAO, HI1.DATAMOVFUNDO, HI1.IDO' +
        'PERACAOFUNDO) HMAX'
      '       WHERE'
      '           NVL(HI.VLRVARIACAO,0) <> 0'
      '       AND    (HI.IDHISTFUNDO = HMAX.IDHISTFUNDO)'
      
        '       GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUND' +
        'OINVEST, HI.DATAAPLICACAO) VATUTRP'
      
        '   GROUP BY VATUTRP.ID, VATUTRP.ID1, VATUTRP.DATAAPLICACAO, VATU' +
        'TRP.DATAMOVFUNDO,'
      
        '            VATUTRP.IDTIPOINVEST, VATUTRP.IDFUNDOINVEST, VATUTRP' +
        '.IDPLANPREVCTBPATR) ATU'
      'WHERE'
      '    (SLDATU.ID = SLDANT.ID(+))'
      'AND (SLDATU.ID = OPE.ID(+))'
      'AND (SLDATU.ID = TRP.ID(+))'
      'AND (SLDATU.ID = ATU.ID(+))'
      'ORDER BY  SLDATU.DATAAPLICACAO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 242
    Top = 107
    ParamData = <
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
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
        Name = 'DATAANT'
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
        Name = 'DATAFIM'
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    object DateTimeField1: TDateTimeField
      FieldName = 'DATAAPLICACAO'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DATAMOVFUNDO'
    end
    object FloatField1: TFloatField
      FieldName = 'VLRAPLICADO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object FloatField2: TFloatField
      FieldName = 'SALDOANTERIOR'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object FloatField3: TFloatField
      FieldName = 'VLRVARIACAO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object FloatField4: TFloatField
      FieldName = 'VLRAPLICACAO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object FloatField5: TFloatField
      FieldName = 'VLRRESGATE'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object FloatField6: TFloatField
      FieldName = 'VLRIRPROV'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object FloatField7: TFloatField
      FieldName = 'VLRIOFPROV'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object FloatField8: TFloatField
      FieldName = 'SALDOVLRFUNDO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object FloatField9: TFloatField
      FieldName = 'SALDOQTDCOTAS'
      DisplayFormat = '###,###,###,###,##0.000000000'
    end
    object FloatField10: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object FloatField12: TFloatField
      FieldName = 'IDFUNDOINVEST'
    end
    object FloatField13: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryMapaInvFdoAnaliticoID: TStringField
      FieldName = 'ID'
      Size = 88
    end
    object qryMapaInvFdoAnaliticoSALDOLIQUIDO: TFloatField
      FieldName = 'SALDOLIQUIDO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvFdoAnaliticoID1: TStringField
      FieldName = 'ID1'
      Size = 120
    end
    object qryMapaInvFdoAnaliticoVLRTRANSF: TFloatField
      FieldName = 'VLRTRANSF'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvFdoAnaliticoVLRIOF: TFloatField
      FieldName = 'VLRIOF'
    end
  end
  object BDEMapaInvestFdoAn: TppBDEPipeline
    DataSource = dsMapaInvFdoAnalitico
    UserName = 'BDEMapaInvestFdoAn'
    Left = 241
    Top = 55
  end
  object dsMapaInvFdoAnalitico: TwwDataSource
    DataSet = qryMapaInvFdoAnalitico
    Left = 241
    Top = 155
  end
  object qryFundoInvestAcoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   FUN.IDFUNDOINVEST, FUN.DESCFUNDOINVEST'
      'FROM'
      '  HISTFUNDOINVEST FUN'
      
        'WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI' +
        ':SS'#39') IN'
      
        '      (SELECT F.IDFUNDOINVEST || TO_CHAR(MAX(F.DTAVIGENCIA),'#39'DD/' +
        'MM/YYYY, HH24:MI:SS'#39')'
      '       FROM HISTFUNDOINVEST F, TIPOFUNDOINVEST T'
      '       WHERE'
      '           (T.IDTIPOINVEST      = :IDTIPOINVEST)  AND'
      
        '           ((:IDTIPOFUNDOINVEST IS NULL) OR (F.IDTIPOFUNDOINVEST' +
        ' = :IDTIPOFUNDOINVEST))  AND'
      
        '           ((:DATAMOVFUNDO IS NULL) OR (TRUNC(F.DTAVIGENCIA) < T' +
        'O_DATE(:DATAMOVFUNDO,'#39'DD/MM/YYYY'#39')+1)) AND'
      '           (T.IDTIPOFUNDOINVEST = F.IDTIPOFUNDOINVEST)'
      '       GROUP BY F.IDFUNDOINVEST))'
      
        'AND ((:IDTIPOFUNDOINVEST IS NULL) OR (FUN.IDTIPOFUNDOINVEST = :I' +
        'DTIPOFUNDOINVEST))'
      'ORDER BY FUN.DESCFUNDOINVEST')
    ValidateWithMask = True
    Left = 121
    Top = 266
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end>
    object qryFundoInvestAcoesDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object qryFundoInvestAcoesIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
  end
  object BDEMapaInvestFdoOutros: TppBDEPipeline
    DataSource = dsMapaInvestFdoOutros
    UserName = 'BDEMapaInvestFdoOutros'
    Left = 381
    Top = 55
    object BDEMapaInvestFdoOutrosppField1: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField2: TppField
      FieldAlias = 'DESCFUNDOINVEST'
      FieldName = 'DESCFUNDOINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField3: TppField
      FieldAlias = 'VLRAPLICADO'
      FieldName = 'VLRAPLICADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField4: TppField
      FieldAlias = 'SALDOQTDCOTAS'
      FieldName = 'SALDOQTDCOTAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField5: TppField
      FieldAlias = 'SALDOANTERIOR'
      FieldName = 'SALDOANTERIOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField6: TppField
      FieldAlias = 'VLRTAXAS'
      FieldName = 'VLRTAXAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField7: TppField
      FieldAlias = 'VLRAMORTIZ'
      FieldName = 'VLRAMORTIZ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField8: TppField
      FieldAlias = 'VLRAMORTIZREC'
      FieldName = 'VLRAMORTIZREC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField9: TppField
      FieldAlias = 'VLRDIVIDENDO'
      FieldName = 'VLRDIVIDENDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField10: TppField
      FieldAlias = 'VLRTRANSF'
      FieldName = 'VLRTRANSF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField11: TppField
      FieldAlias = 'VLRAPLICACAO'
      FieldName = 'VLRAPLICACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField12: TppField
      FieldAlias = 'VLRRESGATE'
      FieldName = 'VLRRESGATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField13: TppField
      FieldAlias = 'VLRVARIACAO'
      FieldName = 'VLRVARIACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField14: TppField
      FieldAlias = 'VLRINTEGRALIZ'
      FieldName = 'VLRINTEGRALIZ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField15: TppField
      FieldAlias = 'VLRIOFPROV'
      FieldName = 'VLRIOFPROV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField16: TppField
      FieldAlias = 'SALDOVLRFUNDO'
      FieldName = 'SALDOVLRFUNDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField17: TppField
      FieldAlias = 'DESCTIPOFUNDOINV'
      FieldName = 'DESCTIPOFUNDOINV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField18: TppField
      FieldAlias = 'DESCSEGMENTACAO'
      FieldName = 'DESCSEGMENTACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField19: TppField
      FieldAlias = 'IDSEGMENTACAO'
      FieldName = 'IDSEGMENTACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField20: TppField
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField21: TppField
      FieldAlias = 'VLRIRPROV'
      FieldName = 'VLRIRPROV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField22: TppField
      FieldAlias = 'SALDOLIQUIDO'
      FieldName = 'SALDOLIQUIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField23: TppField
      FieldAlias = 'IDTIPOINVEST'
      FieldName = 'IDTIPOINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField24: TppField
      FieldAlias = 'IDFUNDOINVEST'
      FieldName = 'IDFUNDOINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField25: TppField
      FieldAlias = 'IDPLANPREVCTBPATR'
      FieldName = 'IDPLANPREVCTBPATR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField26: TppField
      FieldAlias = 'DIF'
      FieldName = 'DIF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object BDEMapaInvestFdoOutrosppField27: TppField
      FieldAlias = 'IDTIPOFUNDOINVEST'
      FieldName = 'IDTIPOFUNDOINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
  end
  object qryMapaInvestFdoOutros: TwwQuery
    AfterScroll = qryMapaInvestFdoOutrosAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SLDATU.ID,'
      '   NVL(SLDANT.SALDOANTERIOR,0)     AS SALDOANTERIOR,'
      '   NVL(SLDATU.VLRAPLICADO,0)       AS VLRAPLICADO,'
      '  (NVL(TRP.VLRENTRADA,0) + NVL(TRP.VLRSAIDA,0)) AS VLRTRANSF,'
      '   NVL(SLDATU.VLRIRPROV,0)         AS VLRIRPROV,'
      '   NVL((SLDATU.VLRIOFPROV * -1),0) AS VLRIOFPROV,'
      '   NVL((OPE.VLRRESGATE * -1),0)    AS VLRRESGATE,'
      '   NVL(OPE.VLRAPLICACAO,0)         AS VLRAPLICACAO,'
      '   NVL(OPE.VLRINTEGRALIZ,0)        AS VLRINTEGRALIZ,'
      '   NVL(ATU.VLRVARIACAO,0)          AS VLRVARIACAO,'
      '   NVL(AMODIV.VLRAMORTIZ,0)        AS VLRAMORTIZ,'
      '   NVL(AMODIV.VLRAMORTIZREC,0)     AS VLRAMORTIZREC,'
      '   NVL(AMODIV.VLRDIVIDENDO,0)      AS VLRDIVIDENDO,'
      '   NVL(SLDATU.SALDOQTDCOTAS,0)     AS SALDOQTDCOTAS,'
      
        '  (NVL(SLDATU.SALDOVLRFUNDO,0) - NVL(SLDATU.VLRIOFPROV,0)) AS SA' +
        'LDOVLRFUNDO,'
      '   NVL(SLDATU.SALDOLIQUIDO,0)      AS SALDOLIQUIDO,'
      
        '   NVL((SLDANT.SALDOANTERIOR + OPE.VLRAPLICACAO - SLDATU.VLRIOFP' +
        'ROV - OPE.VLRRESGATE + ATU.VLRVARIACAO - SLDATU.SALDOVLRFUNDO),0' +
        ') AS DIF,'
      '   NVL(OPE.VLRTAXAS,0)             AS VLRTAXAS,'
      '   SLDATU.IDTIPOINVEST,'
      '   SLDATU.IDFUNDOINVEST,'
      '   SLDATU.IDTIPOFUNDOINVEST,'
      '   SLDATU.IDPLANPREVCTBPATR,'
      '   SLDATU.IDSEGMENTACAO,'
      '   SLDATU.DESCSEGMENTACAO,'
      '   SLDATU.DTAVIGENCIA,'
      '   TF.DESCTIPOFUNDOINV,'
      '   PLA.PLANPRVCONTABPATRO,'
      '   FI.DESCFUNDOINVEST'
      'FROM'
      
        '  (SELECT MAX(DTAVIGENCIA)DTAVIGENCIA, IDFUNDOINVEST  FROM HISTF' +
        'UNDOINVEST'
      
        '                          WHERE TO_DATE(DTAVIGENCIA,'#39'DD/MM/YY'#39') ' +
        '<= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')'
      '                          GROUP BY IDFUNDOINVEST) VIGENCIA,'
      '  (SELECT'
      
        '     (HI.IDTIPOINVEST || HI.IDPLANPREVCTBPATR || HI.IDFUNDOINVES' +
        'T || FI.IDTIPOFUNDOINVEST) AS ID,'
      '      0 AS SALDOANTERIOR,'
      '      SUM(NVL(HI.VLRAPLICADO,0)) AS VLRAPLICADO,'
      '      SUM(NVL(HI.VLRIRPROV,0)) AS VLRIRPROV  ,'
      '      SUM(NVL(HI.VLRIOFPROV,0)) AS VLRIOFPROV ,'
      '      0 AS VLRRESGATE, 0 AS VLRAPLICACAO, 0 AS VLRVARIACAO,'
      '      SUM(NVL(HI.SALDOQTDCOTAS,0)) AS SALDOQTDCOTAS ,'
      '      SUM(NVL(HI.SALDOVLRFUNDO,0)) AS SALDOVLRFUNDO ,'
      
        '      SUM((NVL(HI.SALDOVLRFUNDO,0) - (NVL(HI.VLRIOFPROV,0) + NVL' +
        '(HI.VLRIRPROV,0)))) AS  SALDOLIQUIDO,'
      
        '      HI.IDTIPOINVEST, HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR, F' +
        'I.IDTIPOFUNDOINVEST, FI.IDSEGMENTACAO, FI.DESCSEGMENTACAO, FI.DT' +
        'AVIGENCIA'
      '   FROM'
      '      HISTFUNDO HI,'
      
        '     (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIPOF' +
        'UNDOINVEST, TPF.IDSEGMENTACAO, SM.DESCSEGMENTACAO, HF1.DTAVIGENC' +
        'IA'
      
        '      FROM HISTFUNDOINVEST HF1, TIPOFUNDOINVEST TPF, SEGMENTACAO' +
        'MERCADO SM'
      
        '      WHERE (HF1.IDTIPOFUNDOINVEST || HF1.IDFUNDOINVEST || TO_CH' +
        'AR(HF1.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '            (SELECT HF.IDTIPOFUNDOINVEST || HF.IDFUNDOINVEST || ' +
        'TO_CHAR(MAX(HF.DTAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '             FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '             WHERE'
      '                 (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '             AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPOFUN' +
        'DOINVEST = :IDTIPOFUNDOINVEST))'
      
        '             AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAFIM,'#39'DD/M' +
        'M/YYYY'#39')+1)'
      '             AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)'
      '             GROUP BY HF.IDTIPOFUNDOINVEST, HF.IDFUNDOINVEST))'
      '      AND (HF1.IDTIPOFUNDOINVEST = TPF.IDTIPOFUNDOINVEST)'
      '      AND (TPF.IDSEGMENTACAO     = SM.IDSEGMENTACAO) ) FI,'
      ''
      '     (SELECT MAX(HI1.IDHISTFUNDO) AS IDHISTFUNDO'
      '      FROM HISTFUNDO HI1,'
      '          (SELECT'
      '                HI2.IDTIPOINVEST,'
      '                HI2.IDPLANPREVCTBPATR,'
      '                HI2.IDFUNDOINVEST,'
      '                HI2.DATAAPLICACAO,'
      '                HI2.DATAMOVFUNDO'
      '           FROM HISTFUNDO HI2'
      ''
      '           WHERE'
      '                (HI2.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '           AND   (((:IDPLANPREVCTBPATR IS NULL) AND (HI2.IDPLANP' +
        'REVCTBPATR > 0)) OR'
      
        '                  ((:IDPLANPREVCTBPATR IS NOT NULL) AND  (HI2.ID' +
        'PLANPREVCTBPATR = :IDPLANPREVCTBPATR)))'
      '           AND  (HI2.IDFUNDOINVEST > 0)'
      
        '           AND  (HI2.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '           AND  (HI2.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD/M' +
        'M/YYYY'#39')   AND'
      
        '                                          TO_DATE(:DATAFIM,'#39'DD/M' +
        'M/YYYY'#39'))'
      
        '           AND    ((:IDTIPOCOTA IS NULL) OR (HI2.IDTIPOCOTA = :I' +
        'DTIPOCOTA))'
      '           AND  (HI2.TIPMOVFUNDO   <> '#39'PIR'#39')'
      
        '           GROUP BY HI2.IDTIPOINVEST, HI2.IDPLANPREVCTBPATR, HI2' +
        '.IDFUNDOINVEST, HI2.DATAAPLICACAO,'
      '                   HI2.DATAMOVFUNDO, HI2.IDTIPOCOTA) HI3,'
      ''
      '          (SELECT TP.IDTIPOINVEST, TP.IDTIPOOPERACAO'
      '           FROM   TIPOOPERACAO TP'
      
        '           WHERE  (TP.IDTIPOINVEST = :IDTIPOINVEST) AND (TP.NATU' +
        'REZAOPERACAO <> '#39'R'#39')) TP1'
      '      WHERE'
      '           (HI1.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '      AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (HI1.IDPLANPR' +
        'EVCTBPATR = HI3.IDPLANPREVCTBPATR)) OR'
      
        '             ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI1.IDPLANPR' +
        'EVCTBPATR = :IDPLANPREVCTBPATR)))'
      '      AND  (HI1.IDFUNDOINVEST     = HI3.IDFUNDOINVEST)'
      '      AND  (HI1.DATAAPLICACAO     = HI3.DATAAPLICACAO)'
      '      AND  (HI1.DATAMOVFUNDO      = HI3.DATAMOVFUNDO)'
      
        '      AND    ((:IDTIPOCOTA IS NULL) OR (HI1.IDTIPOCOTA = :IDTIPO' +
        'COTA))'
      '      AND  (HI1.TIPMOVFUNDO   <> '#39'PIR'#39')'
      '      AND  (TP1.IDTIPOINVEST   = HI1.IDTIPOINVEST)'
      '      AND  (TP1.IDTIPOOPERACAO = HI1.IDTIPOOPERACAO)'
      
        '      GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPATR, HI1.IDFU' +
        'NDOINVEST, HI1.DATAAPLICACAO,'
      '               HI1.IDTIPOCOTA) HIMAX'
      '   WHERE'
      '       (HI.IDHISTFUNDO = HIMAX.IDHISTFUNDO)'
      '   AND (HI.IDCOMPOSICAOFUNDO IS NULL)'
      
        '   AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (FI.IDTIPOFUNDOINVEST =' +
        ' :IDTIPOFUNDOINVEST))'
      '   AND (FI.IDFUNDOINVEST  = HI.IDFUNDOINVEST)'
      
        '   GROUP BY  HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOIN' +
        'VEST, FI.IDTIPOFUNDOINVEST, FI.IDSEGMENTACAO, FI.DESCSEGMENTACAO' +
        ', FI.DTAVIGENCIA) SLDATU,'
      ''
      '  (SELECT'
      
        '     (HI.IDTIPOINVEST || HI.IDPLANPREVCTBPATR || HI.IDFUNDOINVES' +
        'T || FI.IDTIPOFUNDOINVEST) AS ID,'
      '      SUM(NVL(HI.SALDOVLRFUNDO,0)) AS SALDOANTERIOR,'
      '      0 AS VLRAPLICADO,'
      
        '      0 AS VLRIRPROV  , 0 AS VLRIOFPROV , 0 AS VLRRESGATE, 0 AS ' +
        'VLRAPLICACAO,'
      
        '      0 AS VLRVARIACAO, 0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, ' +
        '0 AS  SALDOLIQUIDO,'
      '      HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR'
      '   FROM'
      '      HISTFUNDO HI,'
      ''
      
        '     (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIPOF' +
        'UNDOINVEST'
      '      FROM HISTFUNDOINVEST HF1'
      
        '      WHERE (HF1.IDTIPOFUNDOINVEST || HF1.IDFUNDOINVEST || TO_CH' +
        'AR(HF1.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '            (SELECT HF.IDTIPOFUNDOINVEST || HF.IDFUNDOINVEST || ' +
        'TO_CHAR(MAX(HF.DTAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '             FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '             WHERE'
      '                 (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '             AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPOFUN' +
        'DOINVEST = :IDTIPOFUNDOINVEST))'
      
        '             AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAANT,'#39'DD/M' +
        'M/YYYY'#39')+1)'
      '             AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)'
      
        '             GROUP BY HF.IDTIPOFUNDOINVEST, HF.IDFUNDOINVEST))) ' +
        'FI,'
      ''
      '     (SELECT MAX(HI1.IDHISTFUNDO) AS IDHISTFUNDO'
      '      FROM HISTFUNDO HI1,'
      '          (SELECT'
      '                HI2.IDTIPOINVEST,'
      '                HI2.IDPLANPREVCTBPATR,'
      '                HI2.IDFUNDOINVEST,'
      '                HI2.DATAAPLICACAO,'
      '                HI2.DATAMOVFUNDO'
      '           FROM HISTFUNDO HI2'
      '           WHERE'
      '                (HI2.IDTIPOINVEST  = :IDTIPOINVEST)'
      
        '           AND   (((:IDPLANPREVCTBPATR IS NULL) AND (HI2.IDPLANP' +
        'REVCTBPATR > 0)) OR'
      
        '                  ((:IDPLANPREVCTBPATR IS NOT NULL) AND  (HI2.ID' +
        'PLANPREVCTBPATR = :IDPLANPREVCTBPATR)))'
      '           AND  (HI2.IDFUNDOINVEST > 0)'
      
        '           AND  (HI2.DATAAPLICACAO <= TO_DATE(:DATAANT,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '           AND  (HI2.DATAMOVFUNDO   = TO_DATE(:DATAANT,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '           AND    ((:IDTIPOCOTA IS NULL) OR (HI2.IDTIPOCOTA = :I' +
        'DTIPOCOTA))'
      '           AND  (HI2.TIPMOVFUNDO   <> '#39'PIR'#39')'
      
        '           GROUP BY HI2.IDTIPOINVEST, HI2.IDPLANPREVCTBPATR, HI2' +
        '.IDFUNDOINVEST, HI2.DATAAPLICACAO,'
      '                    HI2.DATAMOVFUNDO, HI2.IDTIPOCOTA) HI3,'
      ''
      '          (SELECT TP.IDTIPOINVEST, TP.IDTIPOOPERACAO'
      '           FROM   TIPOOPERACAO TP'
      
        '           WHERE (TP.IDTIPOINVEST = :IDTIPOINVEST) AND (TP.NATUR' +
        'EZAOPERACAO <> '#39'R'#39')) TP1'
      '      WHERE'
      '           (HI1.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '      AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (HI1.IDPLANPR' +
        'EVCTBPATR = HI3.IDPLANPREVCTBPATR)) OR'
      
        '             ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI1.IDPLANPR' +
        'EVCTBPATR = :IDPLANPREVCTBPATR)))'
      '      AND  (HI1.IDFUNDOINVEST     = HI3.IDFUNDOINVEST)'
      '      AND  (HI1.DATAAPLICACAO     = HI3.DATAAPLICACAO)'
      '      AND  (HI1.DATAMOVFUNDO      = HI3.DATAMOVFUNDO)'
      
        '      AND    ((:IDTIPOCOTA IS NULL) OR (HI1.IDTIPOCOTA =:IDTIPOC' +
        'OTA))'
      '      AND  (HI1.TIPMOVFUNDO   <> '#39'PIR'#39')'
      '      AND  (HI1.IDTIPOINVEST   = TP1.IDTIPOINVEST)'
      '      AND  (HI1.IDTIPOOPERACAO = TP1.IDTIPOOPERACAO)'
      
        '      GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPATR, HI1.IDFU' +
        'NDOINVEST, HI1.DATAAPLICACAO,'
      '               HI1.DATAMOVFUNDO, HI1.IDTIPOCOTA) HIMAX1'
      '   WHERE'
      '       (HI.IDHISTFUNDO = HIMAX1.IDHISTFUNDO)'
      '   AND (HI.SALDOQTDCOTAS > 0)'
      '   AND (HI.IDCOMPOSICAOFUNDO IS NULL)'
      '   AND (FI.IDFUNDOINVEST  = HI.IDFUNDOINVEST)'
      
        '   GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOINV' +
        'EST, FI.IDTIPOFUNDOINVEST) SLDANT,'
      ''
      '  (SELECT'
      '      ID,'
      
        '      SUM(SALDOANTERIOR) AS SALDOANTERIOR, SUM(VLRAPLICADO) AS V' +
        'LRAPLICADO, SUM(VLRIRPROV) AS VLRIRPROV,'
      '      SUM(VLRIOFPROV) AS VLRIOFPROV,'
      
        '      SUM(VLRAPLICACAO) AS VLRAPLICACAO, SUM(VLRINTEGRALIZ) AS V' +
        'LRINTEGRALIZ, SUM(VLRRESGATE) AS VLRRESGATE,'
      
        '      SUM(VLRVARIACAO) AS VLRVARIACAO, SUM(SALDOQTDCOTAS) AS SAL' +
        'DOQTDCOTAS, SUM(SALDOVLRFUNDO) AS SALDOVLRFUNDO,'
      
        '      SUM(SALDOLIQUIDO) AS SALDOLIQUIDO, SUM(VLRTAXAS) AS VLRTAX' +
        'AS,'
      '      IDTIPOINVEST, IDFUNDOINVEST, IDPLANPREVCTBPATR'
      '   FROM'
      '     (SELECT'
      
        '        (HI.IDTIPOINVEST || HI.IDPLANPREVCTBPATR || HI.IDFUNDOIN' +
        'VEST || FI.IDTIPOFUNDOINVEST) AS ID,'
      
        '         0 AS SALDOANTERIOR, 0 AS VLRAPLICADO, 0 AS VLRIRPROV, 0' +
        ' AS VLRIOFPROV ,'
      '         SUM(DECODE(HI.NATURMOVFUNDO,'#39'A'#39','
      '                       DECODE(HI.IDTIPOOPERACAO,-100,0,'
      '                           DECODE(HI.IDTIPOOPERACAO,-1005,0,'
      
        '                                 DECODE(HI.IDTIPOOPERACAO,-105,0' +
        ',HI.VLRMOVFUNDO))),0)) AS VLRAPLICACAO,'
      '         SUM(DECODE(HI.NATURMOVFUNDO,'#39'A'#39','
      
        '                       DECODE(HI.IDTIPOOPERACAO,-100,HI.VLRMOVFU' +
        'NDO,'
      '                           DECODE(HI.IDTIPOOPERACAO,-1005,0,'
      
        '                                 DECODE(HI.IDTIPOOPERACAO,-105,H' +
        'I.VLRMOVFUNDO,0))),0)) AS VLRINTEGRALIZ,'
      
        '         SUM(DECODE(HI.NATURMOVFUNDO,'#39'D'#39',NVL(HI.VLRMOVFUNDO,0),0' +
        ')) AS VLRRESGATE,'
      '         0 AS VLRVARIACAO,'
      
        '         0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, 0 AS  SALDOLIQU' +
        'IDO,'
      ''
      
        '         SUM(DECODE(HI.IDTIPOOPERACAO, -43, DECODE(HMIN.IDHISTFU' +
        'NDO, HI.IDHISTFUNDO,'
      
        '                                                    NVL(TX.VLRTA' +
        'XAS,0), 0), NVL(TX.VLRTAXAS,0)))+'
      
        '         SUM(DECODE((SELECT MIN(O.IDOPERACAOFUNDO) FROM OPERACAO' +
        'FUNDO O'
      
        '                     WHERE O.IDPEDIDOFUNDO = PD.IDPEDIDOFUNDO AN' +
        'D O.IDTIPOOPERACAO <> -177), PD.IDOPERACAOFUNDO,'
      '                     NVL(RGT.VLRTAXAS,0),0)) AS VLRTAXAS,'
      ''
      '         HI.IDTIPOINVEST, HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR'
      '      FROM'
      '         HISTFUNDO HI,'
      ''
      '        (SELECT MIN(H.IDHISTFUNDO) AS IDHISTFUNDO,'
      '                H.IDOPERACAOFUNDO'
      '         FROM HISTFUNDO H'
      '         WHERE'
      '              (H.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '         AND  (((:IDPLANPREVCTBPATR IS NULL)     AND (H.IDPLANPR' +
        'EVCTBPATR > 0)) OR'
      
        '               ((:IDPLANPREVCTBPATR IS NOT NULL) AND (H.IDPLANPR' +
        'EVCTBPATR = :IDPLANPREVCTBPATR)))'
      '         AND  (H.IDFUNDOINVEST > 0)'
      
        '         AND  (H.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')' +
        ')'
      
        '         AND  (H.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YY' +
        'YY'#39')   AND'
      
        '                                       TO_DATE(:DATAFIM,'#39'DD/MM/Y' +
        'YYY'#39'))'
      
        '         AND   ((:IDTIPOCOTA IS NULL) OR (H.IDTIPOCOTA = :IDTIPO' +
        'COTA))'
      '         AND   (H.TIPMOVFUNDO    = '#39'OPE'#39')'
      '         AND   (H.IDCOMPOSICAOFUNDO IS NULL)'
      '         GROUP BY H.IDOPERACAOFUNDO) HMIN,'
      ''
      
        '        (SELECT OP.VLRTAXAS, OP.IDOPERACAOORIGEM FROM OPERACAOFU' +
        'NDO OP'
      '         WHERE'
      '               (OP.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '         AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLAN' +
        'PREVCTBPATR > 0)) OR'
      
        '                ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLAN' +
        'PREVCTBPATR = :IDPLANPREVCTBPATR)))'
      '         AND   (OP.IDFUNDOINVEST > 0)'
      
        '         AND   (OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/' +
        'YYYY'#39')   AND'
      
        '                                        TO_DATE(:DATAFIM,'#39'DD/MM/' +
        'YYYY'#39'))'
      '         AND   (OP.IDTIPOOPERACAO IN (-174,-175,-176))'
      
        '         AND    ((:IDTIPOCOTA IS NULL) OR (OP.IDTIPOCOTA = :IDTI' +
        'POCOTA))) TX,'
      ''
      
        '        (SELECT OP.IDPEDIDOFUNDO, OP.IDOPERACAOFUNDO, OP.IDOPERA' +
        'CAOORIGEM FROM OPERACAOFUNDO OP'
      '         WHERE'
      '               (OP.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '         AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLAN' +
        'PREVCTBPATR > 0)) OR'
      
        '                ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLAN' +
        'PREVCTBPATR = :IDPLANPREVCTBPATR)))'
      '         AND   (OP.IDFUNDOINVEST > 0)'
      
        '         AND   (OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/' +
        'YYYY'#39')   AND'
      
        '                                        TO_DATE(:DATAFIM,'#39'DD/MM/' +
        'YYYY'#39'))'
      '         AND   (OP.IDTIPOOPERACAO = -177)'
      
        '         AND    ((:IDTIPOCOTA IS NULL) OR (OP.IDTIPOCOTA = :IDTI' +
        'POCOTA))'
      '         AND   (OP.IDPEDIDOFUNDO IS NOT NULL)'
      '         AND   (OP.IDOPERACAOORIGEM IS NOT NULL)) PD,'
      ''
      
        '        (SELECT OP.VLRTAXAS, OP.IDPEDIDOFUNDO FROM OPERACAOFUNDO' +
        ' OP'
      '         WHERE'
      '               (OP.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '         AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLAN' +
        'PREVCTBPATR > 0)) OR'
      
        '                ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLAN' +
        'PREVCTBPATR = :IDPLANPREVCTBPATR)))'
      '         AND   (OP.IDFUNDOINVEST > 0)'
      
        '         AND   (OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/' +
        'YYYY'#39')   AND'
      
        '                                        TO_DATE(:DATAFIM,'#39'DD/MM/' +
        'YYYY'#39'))'
      '         AND   (OP.IDTIPOOPERACAO = -177)'
      
        '         AND    ((:IDTIPOCOTA IS NULL) OR (OP.IDTIPOCOTA = :IDTI' +
        'POCOTA))) RGT,'
      ''
      
        '        (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTI' +
        'POFUNDOINVEST'
      '         FROM HISTFUNDOINVEST HF1'
      
        '         WHERE (HF1.IDTIPOFUNDOINVEST || HF1.IDFUNDOINVEST || TO' +
        '_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '               (SELECT HF.IDTIPOFUNDOINVEST || HF.IDFUNDOINVEST ' +
        '|| TO_CHAR(MAX(HF.DTAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '                FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '                WHERE'
      '                    (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '                AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPO' +
        'FUNDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '                AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAFIM,'#39'D' +
        'D/MM/YYYY'#39')+1)'
      
        '                AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST' +
        ')'
      
        '                AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST' +
        ')'
      
        '                GROUP BY HF.IDTIPOFUNDOINVEST, HF.IDFUNDOINVEST)' +
        ')) FI,'
      ''
      
        '        (SELECT TP.IDTIPOINVEST, TP.IDTIPOOPERACAO, TP.NATUREZAO' +
        'PERACAO'
      '         FROM   TIPOOPERACAO TP'
      
        '         WHERE (TP.IDTIPOINVEST =:IDTIPOINVEST) AND (TP.NATUREZA' +
        'OPERACAO <> '#39'R'#39')) TP'
      '      WHERE'
      '            (HI.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '      AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (HI.IDPLANPRE' +
        'VCTBPATR > 0)) OR'
      
        '             ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI.IDPLANPRE' +
        'VCTBPATR = :IDPLANPREVCTBPATR)))'
      '      AND   (HI.IDFUNDOINVEST > 0)'
      '      AND   (HI.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      
        '      AND   (HI.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYY' +
        'Y'#39')   AND'
      
        '                                     TO_DATE(:DATAFIM,'#39'DD/MM/YYY' +
        'Y'#39'))'
      
        '      AND    ((:IDTIPOCOTA IS NULL) OR (HI.IDTIPOCOTA = :IDTIPOC' +
        'OTA))'
      '      AND   (HI.TIPMOVFUNDO    = '#39'OPE'#39')'
      '      AND   (HI.IDCOMPOSICAOFUNDO IS NULL)'
      '      AND   (FI.IDFUNDOINVEST  = HI.IDFUNDOINVEST)'
      '      AND   (HI.IDTIPOINVEST   = TP.IDTIPOINVEST)'
      '      AND   (HI.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)'
      '      AND   (TX.IDOPERACAOORIGEM(+)= HI.IDOPERACAOFUNDO)'
      '      AND   (PD.IDOPERACAOORIGEM(+)= HI.IDOPERACAOFUNDO)'
      '      AND  (RGT.IDPEDIDOFUNDO(+)   = PD.IDPEDIDOFUNDO)'
      '      AND (HMIN.IDHISTFUNDO(+)     = HI.IDHISTFUNDO)'
      
        '      GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDO' +
        'INVEST,'
      
        '               FI.IDTIPOFUNDOINVEST, HI.VLRAPLICADO, HI.IDTIPOOP' +
        'ERACAO)'
      
        '   GROUP BY ID, IDTIPOINVEST, IDPLANPREVCTBPATR, IDFUNDOINVEST) ' +
        'OPE,'
      ''
      '  (SELECT'
      
        '     (HI.IDTIPOINVEST || HI.IDPLANPREVCTBPATR || HI.IDFUNDOINVES' +
        'T || FI.IDTIPOFUNDOINVEST) AS ID,'
      
        '      0 AS SALDOANTERIOR, 0 AS VLRAPLICADO, 0 AS VLRIRPROV, 0 AS' +
        ' VLRIOFPROV ,'
      
        '      SUM(DECODE(HI.NATURMOVFUNDO,'#39'A'#39',NVL(HI.VLRMOVFUNDO,0),0)) ' +
        'AS VLRENTRADA,'
      
        '      SUM(DECODE(HI.NATURMOVFUNDO,'#39'D'#39',NVL(HI.VLRMOVFUNDO,0),0))*' +
        '-1 AS VLRSAIDA,'
      '      0 AS VLRVARIACAO,'
      
        '      0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, 0 AS  SALDOLIQUIDO' +
        ','
      '      HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR'
      '   FROM HISTFUNDO HI,'
      ''
      
        '       (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIP' +
        'OFUNDOINVEST'
      '        FROM HISTFUNDOINVEST HF1'
      
        '        WHERE (HF1.IDTIPOFUNDOINVEST || HF1.IDFUNDOINVEST || TO_' +
        'CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '              (SELECT HF.IDTIPOFUNDOINVEST || HF.IDFUNDOINVEST |' +
        '| TO_CHAR(MAX(HF.DTAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '               FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '               WHERE'
      '                   (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '               AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPOF' +
        'UNDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '               AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAFIM,'#39'DD' +
        '/MM/YYYY'#39')+1)'
      '               AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)'
      
        '               GROUP BY HF.IDTIPOFUNDOINVEST, HF.IDFUNDOINVEST))' +
        ') FI,'
      ''
      '       (SELECT'
      '           MAX(HI1.IDHISTFUNDO) AS IDHISTFUNDO'
      '        FROM HISTFUNDO HI1,'
      ''
      
        '            (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.' +
        'IDTIPOFUNDOINVEST'
      '             FROM HISTFUNDOINVEST HF1'
      
        '             WHERE (HF1.IDTIPOFUNDOINVEST || HF1.IDFUNDOINVEST |' +
        '| TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '                   (SELECT HF2.IDTIPOFUNDOINVEST || HF2.IDFUNDOI' +
        'NVEST || TO_CHAR(MAX(HF2.DTAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      
        '                    FROM HISTFUNDOINVEST HF2, TIPOFUNDOINVEST TF' +
        '2'
      '                    WHERE'
      '                        (TF2.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '                    AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF2.I' +
        'DTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '                    AND (TRUNC(HF2.DTAVIGENCIA) < TO_DATE(:DATAF' +
        'IM,'#39'DD/MM/YYYY'#39')+1)'
      
        '                    AND (HF2.IDTIPOFUNDOINVEST = TF2.IDTIPOFUNDO' +
        'INVEST)'
      
        '                    GROUP BY HF2.IDTIPOFUNDOINVEST, HF2.IDFUNDOI' +
        'NVEST))) FI1'
      '        WHERE'
      '             (HI1.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '        AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (HI1.IDPLAN' +
        'PREVCTBPATR > 0)) OR'
      
        '               ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI1.IDPLAN' +
        'PREVCTBPATR = :IDPLANPREVCTBPATR)))'
      '        AND  (HI1.IDFUNDOINVEST > 0)'
      
        '        AND  (HI1.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39 +
        '))'
      
        '        AND  (HI1.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/Y' +
        'YYY'#39')   AND'
      
        '                                       TO_DATE(:DATAFIM,'#39'DD/MM/Y' +
        'YYY'#39'))'
      
        '        AND    ((:IDTIPOCOTA IS NULL) OR (HI1.IDTIPOCOTA = :IDTI' +
        'POCOTA))'
      
        '        AND ((HI1.TIPMOVFUNDO    = '#39'OPE'#39') OR (HI1.TIPMOVFUNDO = ' +
        #39'TRP'#39') OR (HI1.TIPMOVFUNDO = '#39'TRT'#39'))'
      '        AND  (HI1.IDTIPOOPERACAO IN (-107,-108,-160,-161))'
      '        AND  (HI1.IDCOMPOSICAOFUNDO IS NULL)'
      '        AND  (FI1.IDFUNDOINVEST  = HI1.IDFUNDOINVEST)'
      
        '        GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPATR, HI1.ID' +
        'FUNDOINVEST, HI1.DATAAPLICACAO,'
      
        '                 HI1.DATAMOVFUNDO, HI1.IDOPERACAOFUNDO, HI1.IDTI' +
        'POCOTA, FI1.IDTIPOFUNDOINVEST) HMAX'
      '   WHERE'
      '        (HI.IDHISTFUNDO    = HMAX.IDHISTFUNDO)'
      '   AND  (FI.IDFUNDOINVEST  = HI.IDFUNDOINVEST)'
      
        '   GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOINV' +
        'EST, FI.IDTIPOFUNDOINVEST) TRP,'
      ''
      '  (SELECT'
      
        '      (OP.IDTIPOINVEST || OP.IDPLANPREVCTBPATR || OP.IDFUNDOINVE' +
        'ST || FI.IDTIPOFUNDOINVEST) AS ID,'
      
        '      SUM(DECODE(TP.IDTIPOOPERACAO, -43, NVL(OP.VLROPERACAO,0),0' +
        ')) AS VLRAMORTIZ,'
      
        '      SUM(DECODE(TP.IDTIPOOPERACAO,-143, NVL(OP.VLROPERACAO,0),0' +
        ')) AS VLRAMORTIZREC,'
      
        '      SUM(DECODE(TP.NATUREZAOPERACAO,'#39'R'#39',NVL(OP.VLROPERACAO,0),0' +
        ')) AS VLRDIVIDENDO,'
      '      OP.IDTIPOINVEST , OP.IDFUNDOINVEST, OP.IDPLANPREVCTBPATR'
      '   FROM'
      '      OPERACAOFUNDO OP,'
      ''
      
        '     (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIPOF' +
        'UNDOINVEST'
      '      FROM HISTFUNDOINVEST HF1'
      
        '      WHERE (HF1.IDTIPOFUNDOINVEST || HF1.IDFUNDOINVEST || TO_CH' +
        'AR(HF1.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '            (SELECT HF.IDTIPOFUNDOINVEST || HF.IDFUNDOINVEST || ' +
        'TO_CHAR(MAX(HF.DTAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '             FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '             WHERE'
      '                 (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '             AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPOFUN' +
        'DOINVEST = :IDTIPOFUNDOINVEST))'
      
        '             AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAFIM,'#39'DD/M' +
        'M/YYYY'#39')+1)'
      '             AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)'
      
        '             GROUP BY HF.IDTIPOFUNDOINVEST, HF.IDFUNDOINVEST))) ' +
        'FI,'
      ''
      
        '     (SELECT TP.IDTIPOINVEST, TP.IDTIPOOPERACAO, TP.NATUREZAOPER' +
        'ACAO'
      '      FROM   TIPOOPERACAO TP'
      
        '      WHERE ((TP.IDTIPOINVEST =:IDTIPOINVEST) AND (TP.NATUREZAOP' +
        'ERACAO = '#39'R'#39') OR (TP.IDTIPOOPERACAO IN (-43,-143)))) TP'
      '   WHERE'
      '        (OP.IDTIPOINVEST    = :IDTIPOINVEST)'
      
        '   AND  (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLANPREVCTB' +
        'PATR > 0)) OR'
      
        '         ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREVCTB' +
        'PATR = :IDPLANPREVCTBPATR)))'
      '   AND  (OP.IDFUNDOINVEST > 0)'
      
        '   AND  (OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') ' +
        '  AND'
      '                                 TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      
        '   AND   ((:IDTIPOCOTA IS NULL) OR (OP.IDTIPOCOTA = :IDTIPOCOTA)' +
        ')'
      '   AND  (FI.IDFUNDOINVEST  = OP.IDFUNDOINVEST)'
      '   AND  (OP.IDTIPOINVEST   = TP.IDTIPOINVEST)'
      '   AND  (OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)'
      
        '   GROUP BY OP.IDTIPOINVEST, OP.IDPLANPREVCTBPATR, OP.IDFUNDOINV' +
        'EST, FI.IDTIPOFUNDOINVEST) AMODIV,'
      ''
      '  (SELECT'
      '     VATUTRP.ID,'
      '     SUM(NVL(VATUTRP.SALDOANTERIOR,0)) AS SALDOANTERIOR,'
      '     SUM(NVL(VATUTRP.VLRAPLICADO,0))   AS VLRAPLICADO,'
      '     SUM(NVL(VATUTRP.VLRIRPROV,0))     AS VLRIRPROV,'
      '     SUM(NVL(VATUTRP.VLRIOFPROV,0))    AS VLRIOFPROV,'
      '     SUM(NVL(VATUTRP.VLRAPLICACAO,0))  AS VLRAPLICACAO,'
      '     SUM(NVL(VATUTRP.VLRRESGATE,0))    AS VLRRESGATE,'
      '     SUM(NVL(VATUTRP.VLRVARIACAO,0))   AS VLRVARIACAO,'
      '     SUM(NVL(VATUTRP.SALDOQTDCOTAS,0)) AS SALDOQTDCOTAS,'
      '     SUM(NVL(VATUTRP.SALDOVLRFUNDO,0)) AS SALDOVLRFUNDO,'
      '     SUM(NVL(VATUTRP.SALDOLIQUIDO,0))  AS SALDOLIQUIDO,'
      
        '     VATUTRP.IDTIPOINVEST, VATUTRP.IDFUNDOINVEST, VATUTRP.IDPLAN' +
        'PREVCTBPATR, VATUTRP.IDTIPOFUNDOINVEST'
      '  FROM'
      '     (SELECT'
      
        '         (HI.IDTIPOINVEST || HI.IDPLANPREVCTBPATR || HI.IDFUNDOI' +
        'NVEST || FI.IDTIPOFUNDOINVEST) AS ID,'
      
        '          0 AS SALDOANTERIOR, 0 AS VLRAPLICADO, 0 AS VLRIRPROV, ' +
        '0 AS VLRIOFPROV ,'
      '          0 AS VLRAPLICACAO,'
      '          0 AS VLRRESGATE,'
      '          SUM(NVL(HI.VLRVARIACAO,0)) AS VLRVARIACAO,'
      
        '          0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, 0 AS  SALDOLIQ' +
        'UIDO,'
      
        '          HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPA' +
        'TR, FI.IDTIPOFUNDOINVEST'
      '      FROM'
      '         HISTFUNDO HI,'
      '        (SELECT MAX(H.IDHISTFUNDO) AS IDHISTFUNDO'
      '         FROM HISTFUNDO H'
      '         WHERE'
      '              (H.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '         AND (((:IDPLANPREVCTBPATR IS NULL)     AND (H.IDPLANPRE' +
        'VCTBPATR > 0)) OR'
      
        '              ((:IDPLANPREVCTBPATR IS NOT NULL) AND (H.IDPLANPRE' +
        'VCTBPATR = :IDPLANPREVCTBPATR)))'
      '         AND  (H.IDFUNDOINVEST > 0)'
      
        '         AND  (H.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')' +
        ')'
      
        '         AND  (H.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YY' +
        'YY'#39')   AND'
      
        '                                      TO_DATE(:DATAFIM,'#39'DD/MM/YY' +
        'YY'#39'))'
      ''
      
        '         AND  ((:IDTIPOCOTA IS NULL) OR (H.IDTIPOCOTA = :IDTIPOC' +
        'OTA))'
      ''
      
        '         AND ((H.TIPMOVFUNDO    = '#39'ATU'#39') OR (H.TIPMOVFUNDO  = '#39'A' +
        'JU'#39')     OR'
      
        '             ((H.TIPMOVFUNDO    = '#39'OPE'#39') AND ((H.IDTIPOOPERACAO ' +
        '= -106)  OR'
      
        '                                              (H.IDTIPOOPERACAO ' +
        '= -105)  OR'
      
        '                                              (H.IDTIPOOPERACAO ' +
        '= -1005) OR'
      
        '                                              (H.IDTIPOOPERACAO ' +
        '= -100))) )'
      '         AND  (H.IDCOMPOSICAOFUNDO IS NULL)'
      
        '         GROUP BY H.IDTIPOINVEST, H.IDPLANPREVCTBPATR, H.IDFUNDO' +
        'INVEST, H.DATAAPLICACAO,'
      '                  H.DATAMOVFUNDO, H.IDTIPOCOTA) HI1,'
      ''
      
        '        (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTI' +
        'POFUNDOINVEST'
      '         FROM HISTFUNDOINVEST HF1'
      
        '         WHERE (HF1.IDTIPOFUNDOINVEST || HF1.IDFUNDOINVEST || TO' +
        '_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '               (SELECT HF.IDTIPOFUNDOINVEST || HF.IDFUNDOINVEST ' +
        '|| TO_CHAR(MAX(HF.DTAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '                FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '                WHERE'
      '                    (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '                AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPO' +
        'FUNDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '                AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAFIM,'#39'D' +
        'D/MM/YYYY'#39')+1)'
      
        '                AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST' +
        ')'
      
        '                GROUP BY HF.IDTIPOFUNDOINVEST, HF.IDFUNDOINVEST)' +
        ')) FI'
      '      WHERE'
      '          (HI.IDHISTFUNDO = HI1.IDHISTFUNDO)'
      '      AND (FI.IDFUNDOINVEST  = HI.IDFUNDOINVEST)'
      
        '      GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDO' +
        'INVEST, FI.IDTIPOFUNDOINVEST'
      ''
      '      UNION'
      ''
      '      SELECT'
      
        '        (HI.IDTIPOINVEST || HI.IDPLANPREVCTBPATR || HI.IDFUNDOIN' +
        'VEST || FI.IDTIPOFUNDOINVEST) AS ID,'
      
        '         0 AS SALDOANTERIOR, 0 AS VLRAPLICADO, 0 AS VLRIRPROV, 0' +
        ' AS VLRIOFPROV ,'
      '         0 AS VLRAPLICACAO,'
      '         0 AS VLRRESGATE,'
      '         SUM(NVL(HI.VLRVARIACAO,0)) AS VLRVARIACAO,'
      
        '         0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, 0 AS  SALDOLIQU' +
        'IDO,'
      
        '         HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPAT' +
        'R, FI.IDTIPOFUNDOINVEST'
      '      FROM'
      '         HISTFUNDO HI,'
      ''
      
        '        (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTI' +
        'POFUNDOINVEST'
      '         FROM HISTFUNDOINVEST HF1'
      
        '         WHERE (HF1.IDTIPOFUNDOINVEST || HF1.IDFUNDOINVEST || TO' +
        '_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '               (SELECT HF.IDTIPOFUNDOINVEST || HF.IDFUNDOINVEST ' +
        '|| TO_CHAR(MAX(HF.DTAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '                FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '                WHERE'
      '                    (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '                AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPO' +
        'FUNDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '                AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAFIM,'#39'D' +
        'D/MM/YYYY'#39')+1)'
      
        '                AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST' +
        ')'
      
        '                GROUP BY HF.IDTIPOFUNDOINVEST, HF.IDFUNDOINVEST)' +
        ')) FI,'
      ''
      '        (SELECT'
      '            MAX(HI1.IDHISTFUNDO) AS IDHISTFUNDO'
      '         FROM'
      '            HISTFUNDO HI1,'
      ''
      
        '           (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.I' +
        'DTIPOFUNDOINVEST'
      '            FROM HISTFUNDOINVEST HF1'
      
        '            WHERE (HF1.IDTIPOFUNDOINVEST || HF1.IDFUNDOINVEST ||' +
        ' TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '                  (SELECT HF2.IDTIPOFUNDOINVEST || HF2.IDFUNDOIN' +
        'VEST || TO_CHAR(MAX(HF2.DTAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '                   FROM HISTFUNDOINVEST HF2, TIPOFUNDOINVEST TF2'
      '                   WHERE'
      '                       (TF2.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '                   AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF2.ID' +
        'TIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '                   AND (TRUNC(HF2.DTAVIGENCIA) < TO_DATE(:DATAFI' +
        'M,'#39'DD/MM/YYYY'#39')+1)'
      
        '                   AND (HF2.IDTIPOFUNDOINVEST = TF2.IDTIPOFUNDOI' +
        'NVEST)'
      
        '                   GROUP BY HF2.IDTIPOFUNDOINVEST, HF2.IDFUNDOIN' +
        'VEST))) FI1'
      ''
      '         WHERE'
      '              (HI1.IDTIPOINVEST    = :IDTIPOINVEST)'
      
        '         AND  (((:IDPLANPREVCTBPATR IS NULL)     AND (HI1.IDPLAN' +
        'PREVCTBPATR > 0)) OR'
      
        '               ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI1.IDPLAN' +
        'PREVCTBPATR = :IDPLANPREVCTBPATR)))'
      '         AND  (HI1.IDFUNDOINVEST > 0)'
      
        '         AND  (HI1.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY' +
        #39'))'
      
        '         AND  (HI1.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/' +
        'YYYY'#39')   AND'
      
        '                                        TO_DATE(:DATAFIM,'#39'DD/MM/' +
        'YYYY'#39'))'
      ''
      
        '         AND    ((:IDTIPOCOTA IS NULL) OR (HI1.IDTIPOCOTA = :IDT' +
        'IPOCOTA))'
      ''
      
        '         AND ((HI1.TIPMOVFUNDO    = '#39'OPE'#39') OR (HI1.TIPMOVFUNDO =' +
        ' '#39'TRP'#39') OR (HI1.TIPMOVFUNDO = '#39'TRT'#39'))'
      '         AND  (HI1.IDTIPOOPERACAO IN (-107,-108,-160,-161))'
      '         AND  (HI1.IDCOMPOSICAOFUNDO IS NULL)'
      '         AND  (FI1.IDFUNDOINVEST  = HI1.IDFUNDOINVEST)'
      
        '         GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPATR, HI1.I' +
        'DFUNDOINVEST, HI1.DATAAPLICACAO,'
      
        '                  HI1.DATAMOVFUNDO, HI1.IDOPERACAOFUNDO, HI1.IDT' +
        'IPOCOTA, FI1.IDTIPOFUNDOINVEST) HMAX'
      '      WHERE'
      '           NVL(HI.VLRVARIACAO,0) <> 0'
      '      AND     (HI.IDHISTFUNDO    = HMAX.IDHISTFUNDO)'
      '      AND     (FI.IDFUNDOINVEST  = HI.IDFUNDOINVEST)'
      
        '      GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDO' +
        'INVEST, FI.IDTIPOFUNDOINVEST) VATUTRP'
      ''
      
        '   GROUP BY VATUTRP.ID, VATUTRP.IDTIPOINVEST, VATUTRP.IDFUNDOINV' +
        'EST,'
      
        '            VATUTRP.IDPLANPREVCTBPATR, VATUTRP.IDTIPOFUNDOINVEST' +
        ') ATU,'
      ''
      
        '  (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIPOFUND' +
        'OINVEST'
      '   FROM HISTFUNDOINVEST HF1'
      
        '   WHERE (HF1.IDTIPOFUNDOINVEST || HF1.IDFUNDOINVEST || TO_CHAR(' +
        'HF1.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '         (SELECT HF.IDTIPOFUNDOINVEST || HF.IDFUNDOINVEST || TO_' +
        'CHAR(MAX(HF.DTAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '          FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '          WHERE'
      '              (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '          AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPOFUNDOI' +
        'NVEST = :IDTIPOFUNDOINVEST))'
      
        '          AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAFIM,'#39'DD/MM/Y' +
        'YYY'#39')+1)'
      '          AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)'
      '          GROUP BY HF.IDTIPOFUNDOINVEST, HF.IDFUNDOINVEST))) FI,'
      ''
      
        '  (SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'#39' - '#39'|| PE.NOME) AS P' +
        'LANPRVCONTABPATRO'
      '   FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      '   WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '   AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PLA,'
      ''
      
        '  (SELECT TI1.DESCTIPOINVEST ||'#39' - '#39'|| TF1.DESCTIPOFUNDOINV AS D' +
        'ESCTIPOFUNDOINV,'
      '          TF1.IDTIPOFUNDOINVEST'
      '   FROM   TIPOFUNDOINVEST TF1, TIPOINVEST TI1'
      '   WHERE'
      '       (TI1.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '   AND   ((:IDTIPOFUNDOINVEST IS NULL) OR (TF1.IDTIPOFUNDOINVEST' +
        ' = :IDTIPOFUNDOINVEST))'
      '   AND (TF1.IDTIPOINVEST = TI1.IDTIPOINVEST)) TF'
      ''
      'WHERE'
      '    (SLDATU.ID = SLDANT.ID(+))'
      'AND (SLDATU.ID = OPE.ID(+))'
      'AND (SLDATU.ID = TRP.ID(+))'
      'AND (SLDATU.ID = AMODIV.ID(+))'
      'AND (SLDATU.ID = ATU.ID(+))'
      'AND (SLDATU.IDFUNDOINVEST     = FI.IDFUNDOINVEST)'
      'AND (SLDATU.IDTIPOFUNDOINVEST = FI.IDTIPOFUNDOINVEST)'
      'AND (SLDATU.IDPLANPREVCTBPATR = PLA.IDPLANPREVCTBPATR)'
      'AND (SLDATU.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)'
      'AND (SLDATU.IDFUNDOINVEST = VIGENCIA.IDFUNDOINVEST) '
      'AND (SLDATU.DTAVIGENCIA = VIGENCIA.DTAVIGENCIA)'
      ''
      
        'ORDER BY TF.DESCTIPOFUNDOINV, PLA.PLANPRVCONTABPATRO, FI.DESCFUN' +
        'DOINVEST')
    ValidateWithMask = True
    Left = 382
    Top = 107
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end>
    object qryMapaInvestFdoOutrosPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patro'
      DisplayWidth = 26
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryMapaInvestFdoOutrosDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 40
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object qryMapaInvestFdoOutrosVLRAPLICADO: TFloatField
      DisplayLabel = 'Valor Aplicado'
      DisplayWidth = 16
      FieldName = 'VLRAPLICADO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvestFdoOutrosSALDOQTDCOTAS: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 24
      FieldName = 'SALDOQTDCOTAS'
      DisplayFormat = '###,###,###,###,##0.000000000'
    end
    object qryMapaInvestFdoOutrosSALDOANTERIOR: TFloatField
      DisplayLabel = 'Saldo Anterior'
      DisplayWidth = 18
      FieldName = 'SALDOANTERIOR'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvestFdoOutrosVLRTAXAS: TFloatField
      DisplayLabel = 'Taxas'
      DisplayWidth = 16
      FieldName = 'VLRTAXAS'
      DisplayFormat = '###,###,##0.00'
    end
    object qryMapaInvestFdoOutrosVLRAMORTIZ: TFloatField
      DisplayLabel = 'Amortização'
      DisplayWidth = 16
      FieldName = 'VLRAMORTIZ'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvestFdoOutrosVLRAMORTIZREC: TFloatField
      DisplayLabel = 'Amortização a Receber'
      DisplayWidth = 21
      FieldName = 'VLRAMORTIZREC'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvestFdoOutrosVLRDIVIDENDO: TFloatField
      DisplayLabel = 'Dividendos'
      DisplayWidth = 17
      FieldName = 'VLRDIVIDENDO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvestFdoOutrosVLRTRANSF: TFloatField
      DisplayLabel = 'Transferência'
      DisplayWidth = 17
      FieldName = 'VLRTRANSF'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvestFdoOutrosVLRAPLICACAO: TFloatField
      DisplayLabel = 'Aplicação'
      DisplayWidth = 16
      FieldName = 'VLRAPLICACAO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvestFdoOutrosVLRRESGATE: TFloatField
      DisplayLabel = 'Resgate'
      DisplayWidth = 16
      FieldName = 'VLRRESGATE'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvestFdoOutrosVLRVARIACAO: TFloatField
      DisplayLabel = 'Variação'
      DisplayWidth = 16
      FieldName = 'VLRVARIACAO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvestFdoOutrosVLRINTEGRALIZ: TFloatField
      DisplayLabel = 'Integralização'
      DisplayWidth = 18
      FieldName = 'VLRINTEGRALIZ'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvestFdoOutrosVLRIOFPROV: TFloatField
      DisplayLabel = 'IOF'
      DisplayWidth = 16
      FieldName = 'VLRIOFPROV'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvestFdoOutrosSALDOVLRFUNDO: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 18
      FieldName = 'SALDOVLRFUNDO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvestFdoOutrosDESCTIPOFUNDOINV: TStringField
      DisplayLabel = 'Tipo de Fundo'
      DisplayWidth = 60
      FieldName = 'DESCTIPOFUNDOINV'
      Size = 80
    end
    object qryMapaInvestFdoOutrosDESCSEGMENTACAO: TStringField
      DisplayLabel = 'Segmentação de Mercado'
      DisplayWidth = 30
      FieldName = 'DESCSEGMENTACAO'
      Size = 100
    end
    object qryMapaInvestFdoOutrosIDSEGMENTACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSEGMENTACAO'
      Visible = False
    end
    object qryMapaInvestFdoOutrosID: TStringField
      FieldName = 'ID'
      Visible = False
      Size = 120
    end
    object qryMapaInvestFdoOutrosVLRIRPROV: TFloatField
      FieldName = 'VLRIRPROV'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvestFdoOutrosSALDOLIQUIDO: TFloatField
      FieldName = 'SALDOLIQUIDO'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryMapaInvestFdoOutrosIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryMapaInvestFdoOutrosIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object qryMapaInvestFdoOutrosIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryMapaInvestFdoOutrosDIF: TFloatField
      FieldName = 'DIF'
      Visible = False
    end
    object qryMapaInvestFdoOutrosIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
  end
  object dsMapaInvestFdoOutros: TwwDataSource
    DataSet = qryMapaInvestFdoOutros
    Left = 382
    Top = 155
  end
  object qryMapaInvestFdoOutrosAn: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SLDATU.ID,'
      '   SLDATU.ID1,'
      '   SLDATU.DATAAPLICACAO,'
      '   SLDATU.DATAMOVFUNDO,'
      '   NVL(SLDANT.SALDOANTERIOR,0)    AS SALDOANTERIOR,'
      '   NVL(SLDATU.VLRAPLICADO,0)      AS VLRAPLICADO,'
      '  (NVL(TRP.VLRENTRADA,0) + NVL(TRP.VLRSAIDA,0)) AS VLRTRANSF,'
      '   NVL(SLDATU.VLRIRPROV,0)        AS VLRIRPROV,'
      '  (NVL(SLDATU.VLRIOFPROV,0) * -1) AS VLRIOFPROV,'
      '  (NVL(OPE.VLRRESGATE,0) * -1)    AS VLRRESGATE,'
      '   NVL(OPE.VLRAPLICACAO,0)        AS VLRAPLICACAO,'
      '   NVL(OPE.VLRINTEGRALIZ,0)       AS VLRINTEGRALIZ,'
      '   NVL(ATU.VLRVARIACAO,0)         AS VLRVARIACAO,'
      '   NVL(AMODIV.VLRAMORTIZ,0)       AS VLRAMORTIZ,'
      '   NVL(AMODIV.VLRAMORTIZREC,0)    AS VLRAMORTIZREC,'
      '   NVL(AMODIV.VLRDIVIDENDO,0)     AS VLRDIVIDENDO,'
      '   NVL(SLDATU.SALDOQTDCOTAS,0)    AS SALDOQTDCOTAS,'
      
        '  (NVL(SLDATU.SALDOVLRFUNDO,0) - NVL(SLDATU.VLRIRPROV,0)) AS SAL' +
        'DOVLRFUNDO,'
      '   NVL(SLDATU.SALDOLIQUIDO,0)     AS SALDOLIQUIDO,'
      '   NVL(OPE.VLRTAXAS,0)            AS VLRTAXAS,'
      '   SLDATU.IDTIPOINVEST,'
      '   SLDATU.IDFUNDOINVEST,'
      '   SLDATU.IDTIPOFUNDOINVEST,'
      '   SLDATU.IDPLANPREVCTBPATR,'
      '   SLDATU.IDTIPOCOTA,'
      '   TC.DESCTIPOCOTA'
      'FROM'
      '  (SELECT'
      
        '     (HI.IDTIPOINVEST || HI.IDFUNDOINVEST || HI.IDPLANPREVCTBPAT' +
        'R || HI.DATAAPLICACAO || FI.IDTIPOFUNDOINVEST || HI.IDTIPOCOTA) ' +
        'AS ID,'
      
        '     (HI.IDTIPOINVEST || HI.IDFUNDOINVEST || HI.IDPLANPREVCTBPAT' +
        'R /*|| FI.IDTIPOFUNDOINVEST*/ ) AS ID1,'
      '      HI.DATAAPLICACAO ,   HI.DATAMOVFUNDO ,'
      '      0 AS SALDOANTERIOR,  NVL(HI.VLRAPLICADO,0) AS VLRAPLICADO,'
      
        '      NVL(HI.VLRIRPROV,0) AS VLRIRPROV  , NVL(HI.VLRIOFPROV,0) A' +
        'S VLRIOFPROV ,'
      '      0 AS VLRRESGATE, 0 AS VLRAPLICACAO, 0 AS VLRVARIACAO,'
      '      NVL(HI.SALDOQTDCOTAS,0) AS SALDOQTDCOTAS ,'
      '      NVL(HI.SALDOVLRFUNDO,0) AS SALDOVLRFUNDO ,'
      
        '     (NVL(HI.SALDOVLRFUNDO,0) - (NVL(HI.VLRIOFPROV,0) + NVL(HI.V' +
        'LRIRPROV,0))) AS  SALDOLIQUIDO,'
      
        '      HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR, ' +
        'HI.IDTIPOCOTA, FI.IDTIPOFUNDOINVEST'
      '   FROM HISTFUNDO HI,'
      ''
      
        '     (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIPOF' +
        'UNDOINVEST'
      '      FROM HISTFUNDOINVEST HF1'
      
        '      WHERE (/*HF1.IDTIPOFUNDOINVEST ||*/ HF1.IDFUNDOINVEST || T' +
        'O_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '            (SELECT /*HF.IDTIPOFUNDOINVEST ||*/ HF.IDFUNDOINVEST' +
        ' || TO_CHAR(MAX(HF.DTAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '             FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '             WHERE'
      '                 (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '             AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPOFUN' +
        'DOINVEST = :IDTIPOFUNDOINVEST))'
      
        '             AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAFIM,'#39'DD/M' +
        'M/YYYY'#39')+1)'
      '             AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)'
      
        '             GROUP BY /*HF.IDTIPOFUNDOINVEST,*/ HF.IDFUNDOINVEST' +
        '))) FI,'
      ''
      '     (SELECT MAX(HI1.IDHISTFUNDO) AS IDHISTFUNDO'
      '      FROM HISTFUNDO HI1,'
      '          (SELECT'
      '                HI2.IDTIPOINVEST,'
      '                HI2.IDPLANPREVCTBPATR,'
      '                HI2.IDFUNDOINVEST,'
      '                HI2.DATAAPLICACAO,'
      '                HI2.DATAMOVFUNDO'
      '           FROM HISTFUNDO HI2'
      '           WHERE'
      '                (HI2.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '           AND   (((:IDPLANPREVCTBPATR IS NULL) AND (HI2.IDPLANP' +
        'REVCTBPATR > 0)) OR'
      
        '                  ((:IDPLANPREVCTBPATR IS NOT NULL) AND  (HI2.ID' +
        'PLANPREVCTBPATR = :IDPLANPREVCTBPATR)))'
      '           AND  (HI2.IDFUNDOINVEST > 0)'
      
        '           AND  (HI2.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '           AND  (HI2.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD/M' +
        'M/YYYY'#39')   AND'
      
        '                                          TO_DATE(:DATAFIM,'#39'DD/M' +
        'M/YYYY'#39'))'
      
        '           AND    ((:IDTIPOCOTA IS NULL) OR (HI2.IDTIPOCOTA = :I' +
        'DTIPOCOTA))'
      '           AND  (HI2.TIPMOVFUNDO    <> '#39'PIR'#39')'
      
        '           GROUP BY HI2.IDTIPOINVEST, HI2.IDPLANPREVCTBPATR, HI2' +
        '.IDFUNDOINVEST,'
      
        '                     HI2.DATAAPLICACAO, HI2.DATAMOVFUNDO, HI2.ID' +
        'TIPOCOTA) HI3,'
      ''
      '          (SELECT TP.IDTIPOINVEST, TP.IDTIPOOPERACAO'
      '           FROM   TIPOOPERACAO TP'
      
        '           WHERE  (TP.IDTIPOINVEST = :IDTIPOINVEST) AND (TP.NATU' +
        'REZAOPERACAO <> '#39'R'#39')) TP1'
      '      WHERE'
      '          (HI1.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '      AND  (((:IDPLANPREVCTBPATR IS NULL)     AND (HI1.IDPLANPRE' +
        'VCTBPATR = HI3.IDPLANPREVCTBPATR)) OR'
      
        '            ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI1.IDPLANPRE' +
        'VCTBPATR = :IDPLANPREVCTBPATR)))'
      '      AND (HI1.IDFUNDOINVEST     = HI3.IDFUNDOINVEST)'
      '      AND (HI1.DATAAPLICACAO     = HI3.DATAAPLICACAO)'
      '      AND (HI1.DATAMOVFUNDO      = HI3.DATAMOVFUNDO)'
      
        '      AND   ((:IDTIPOCOTA IS NULL) OR (HI1.IDTIPOCOTA = :IDTIPOC' +
        'OTA))'
      '      AND (HI1.TIPMOVFUNDO    <> '#39'PIR'#39')'
      '      AND (TP1.IDTIPOINVEST      = HI1.IDTIPOINVEST)'
      '      AND (TP1.IDTIPOOPERACAO    = HI1.IDTIPOOPERACAO)'
      
        '      GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPATR, HI1.IDFU' +
        'NDOINVEST, HI1.DATAAPLICACAO,'
      '               HI1.IDTIPOCOTA) HIMAX'
      '   WHERE'
      '       (HI.IDHISTFUNDO   = HIMAX.IDHISTFUNDO)'
      '   AND (HI.IDCOMPOSICAOFUNDO IS NULL)'
      '   AND (FI.IDFUNDOINVEST = HI.IDFUNDOINVEST) ) SLDATU,'
      ''
      '  (SELECT '
      
        '     (HI.IDTIPOINVEST || HI.IDFUNDOINVEST || HI.IDPLANPREVCTBPAT' +
        'R || HI.DATAAPLICACAO || FI.IDTIPOFUNDOINVEST || HI.IDTIPOCOTA) ' +
        'AS ID,'
      
        '     (HI.IDTIPOINVEST || HI.IDFUNDOINVEST || HI.IDPLANPREVCTBPAT' +
        'R /*|| FI.IDTIPOFUNDOINVEST */) AS ID1,'
      '      HI.DATAAPLICACAO , HI.DATAMOVFUNDO,'
      
        '      NVL(HI.SALDOVLRFUNDO,0) AS SALDOANTERIOR, 0 AS VLRAPLICADO' +
        ','
      
        '      0 AS VLRIRPROV  , 0 AS VLRIOFPROV , 0 AS VLRRESGATE, 0 AS ' +
        'VLRAPLICACAO,'
      
        '      0 AS VLRVARIACAO, 0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, ' +
        '0 AS  SALDOLIQUIDO,'
      '      HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR'
      '   FROM HISTFUNDO HI,'
      ''
      
        '       (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIP' +
        'OFUNDOINVEST'
      '        FROM HISTFUNDOINVEST HF1'
      
        '        WHERE (/*HF1.IDTIPOFUNDOINVEST ||*/ HF1.IDFUNDOINVEST ||' +
        ' TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '              (SELECT /*HF.IDTIPOFUNDOINVEST ||*/ HF.IDFUNDOINVE' +
        'ST || TO_CHAR(MAX(HF.DTAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '               FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '               WHERE'
      '                   (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '               AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPOF' +
        'UNDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '               AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAANT,'#39'DD' +
        '/MM/YYYY'#39')+1)'
      '               AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)'
      
        '               GROUP BY /*HF.IDTIPOFUNDOINVEST,*/ HF.IDFUNDOINVE' +
        'ST))) FI,'
      ''
      '       (SELECT MAX(HI1.IDHISTFUNDO) AS IDHISTFUNDO'
      '        FROM HISTFUNDO HI1,'
      '            (SELECT'
      '                  HI2.IDTIPOINVEST,'
      '                  HI2.IDPLANPREVCTBPATR,'
      '                  HI2.IDFUNDOINVEST,'
      '                  HI2.DATAAPLICACAO,'
      '                  HI2.DATAMOVFUNDO'
      '              FROM HISTFUNDO HI2'
      '              WHERE'
      '                   (HI2.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '              AND   (((:IDPLANPREVCTBPATR IS NULL) AND (HI2.IDPL' +
        'ANPREVCTBPATR > 0)) OR'
      
        '                     ((:IDPLANPREVCTBPATR IS NOT NULL) AND  (HI2' +
        '.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)))'
      '              AND  (HI2.IDFUNDOINVEST > 0)'
      
        '              AND  (HI2.DATAAPLICACAO <= TO_DATE(:DATAANT,'#39'DD/MM' +
        '/YYYY'#39'))'
      
        '              AND  (HI2.DATAMOVFUNDO   = TO_DATE(:DATAANT,'#39'DD/MM' +
        '/YYYY'#39'))'
      
        '              AND    ((:IDTIPOCOTA IS NULL) OR (HI2.IDTIPOCOTA =' +
        ' :IDTIPOCOTA))'
      '              AND  (HI2.TIPMOVFUNDO    <> '#39'PIR'#39')'
      
        '              GROUP BY HI2.IDTIPOINVEST, HI2.IDPLANPREVCTBPATR, ' +
        'HI2.IDFUNDOINVEST, HI2.DATAAPLICACAO,'
      '                       HI2.DATAMOVFUNDO, HI2.IDTIPOCOTA) HI3,'
      ''
      '            (SELECT TP.IDTIPOINVEST, TP.IDTIPOOPERACAO'
      '             FROM   TIPOOPERACAO TP'
      
        '             WHERE  (TP.IDTIPOINVEST = :IDTIPOINVEST) AND (TP.NA' +
        'TUREZAOPERACAO <> '#39'R'#39')) TP1'
      '        WHERE'
      '             (HI1.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '        AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (HI1.IDPLAN' +
        'PREVCTBPATR = HI3.IDPLANPREVCTBPATR)) OR'
      
        '               ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI1.IDPLAN' +
        'PREVCTBPATR = :IDPLANPREVCTBPATR)))'
      '        AND  (HI1.IDFUNDOINVEST     = HI3.IDFUNDOINVEST)'
      '        AND  (HI1.DATAAPLICACAO     = HI3.DATAAPLICACAO)'
      '        AND  (HI1.DATAMOVFUNDO      = HI3.DATAMOVFUNDO)'
      
        '        AND    ((:IDTIPOCOTA IS NULL) OR (HI1.IDTIPOCOTA = :IDTI' +
        'POCOTA))'
      '        AND  (HI1.TIPMOVFUNDO   <> '#39'PIR'#39')'
      '        AND  (TP1.IDTIPOINVEST      = HI1.IDTIPOINVEST)'
      '        AND  (TP1.IDTIPOOPERACAO    = HI1.IDTIPOOPERACAO)'
      
        '        GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPATR, HI1.ID' +
        'FUNDOINVEST, HI1.DATAAPLICACAO,'
      '                 HI1.DATAMOVFUNDO, HI1.IDTIPOCOTA) HIMAX1'
      '   WHERE'
      '       (HI.IDHISTFUNDO   = HIMAX1.IDHISTFUNDO)'
      '   AND (HI.SALDOQTDCOTAS > 0)'
      '   AND (HI.IDCOMPOSICAOFUNDO IS NULL)'
      '   AND (FI.IDFUNDOINVEST = HI.IDFUNDOINVEST) ) SLDANT,'
      ''
      '  (SELECT'
      '      ID, ID1,'
      
        '      SUM(SALDOANTERIOR) AS SALDOANTERIOR, SUM(VLRAPLICADO) AS V' +
        'LRAPLICADO, SUM(VLRIRPROV) AS VLRIRPROV,'
      '      SUM(VLRIOFPROV) AS VLRIOFPROV,'
      
        '      SUM(VLRAPLICACAO) AS VLRAPLICACAO, SUM(VLRINTEGRALIZ) AS V' +
        'LRINTEGRALIZ, SUM(VLRRESGATE) AS VLRRESGATE,'
      
        '      SUM(VLRVARIACAO) AS VLRVARIACAO, SUM(SALDOQTDCOTAS) AS SAL' +
        'DOQTDCOTAS, SUM(SALDOVLRFUNDO) AS SALDOVLRFUNDO,'
      
        '      SUM(SALDOLIQUIDO) AS SALDOLIQUIDO, SUM(VLRTAXAS) AS VLRTAX' +
        'AS,'
      '      IDTIPOINVEST, IDFUNDOINVEST, IDPLANPREVCTBPATR'
      '   FROM'
      '     (SELECT      '
      
        '        (HI.IDTIPOINVEST || HI.IDFUNDOINVEST || HI.IDPLANPREVCTB' +
        'PATR || HI.DATAAPLICACAO  || FI.IDTIPOFUNDOINVEST || HI.IDTIPOCO' +
        'TA) AS ID,'
      
        '        (HI.IDTIPOINVEST || HI.IDFUNDOINVEST || HI.IDPLANPREVCTB' +
        'PATR /*|| FI.IDTIPOFUNDOINVEST*/) AS ID1,'
      '         HI.DATAAPLICACAO , '#39#39' AS DATAMOVFUNDO,'
      
        '         0 AS SALDOANTERIOR, 0 AS VLRAPLICADO, 0 AS VLRIRPROV, 0' +
        ' AS VLRIOFPROV ,'
      '         SUM(DECODE(HI.NATURMOVFUNDO,'#39'A'#39','
      '                       DECODE(HI.IDTIPOOPERACAO,-100,0,'
      '                           DECODE(HI.IDTIPOOPERACAO,-1005,0,'
      
        '                                 DECODE(HI.IDTIPOOPERACAO,-105,0' +
        ',HI.VLRMOVFUNDO))),0)) AS VLRAPLICACAO,'
      '         SUM(DECODE(HI.NATURMOVFUNDO,'#39'A'#39','
      
        '                       DECODE(HI.IDTIPOOPERACAO,-100, HI.VLRMOVF' +
        'UNDO,'
      '                           DECODE(HI.IDTIPOOPERACAO,-1005,0,'
      
        '                                 DECODE(HI.IDTIPOOPERACAO,-105,H' +
        'I.VLRMOVFUNDO,0))),0)) AS VLRINTEGRALIZ,'
      
        '         SUM(DECODE(HI.NATURMOVFUNDO,'#39'D'#39',NVL(HI.VLRMOVFUNDO,0),0' +
        ')) AS VLRRESGATE,'
      
        '         0 AS VLRVARIACAO, 0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUND' +
        'O, 0 AS  SALDOLIQUIDO,'
      ''
      
        '         SUM(DECODE(HI.IDTIPOOPERACAO, -43, DECODE(HMIN.IDHISTFU' +
        'NDO, HI.IDHISTFUNDO,'
      
        '                                                    NVL(TX.VLRTA' +
        'XAS,0), 0), NVL(TX.VLRTAXAS,0)))+'
      
        '         SUM(DECODE((SELECT MIN(O.IDOPERACAOFUNDO) FROM OPERACAO' +
        'FUNDO O'
      
        '                     WHERE O.IDPEDIDOFUNDO = PD.IDPEDIDOFUNDO AN' +
        'D O.IDTIPOOPERACAO <> -177), PD.IDOPERACAOFUNDO,'
      '                     NVL(RGT.VLRTAXAS,0),0)) AS VLRTAXAS,'
      ''
      '         HI.IDTIPOINVEST, HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR'
      '      FROM'
      '         HISTFUNDO HI,'
      ''
      '        (SELECT MIN(H.IDHISTFUNDO) AS IDHISTFUNDO,'
      '                H.IDOPERACAOFUNDO'
      '         FROM HISTFUNDO H'
      '         WHERE'
      '              (H.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '         AND  (((:IDPLANPREVCTBPATR IS NULL)     AND (H.IDPLANPR' +
        'EVCTBPATR > 0)) OR'
      
        '               ((:IDPLANPREVCTBPATR IS NOT NULL) AND (H.IDPLANPR' +
        'EVCTBPATR = :IDPLANPREVCTBPATR)))'
      '         AND  (H.IDFUNDOINVEST > 0)'
      
        '         AND  (H.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')' +
        ')'
      
        '         AND  (H.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YY' +
        'YY'#39')   AND'
      
        '                                       TO_DATE(:DATAFIM,'#39'DD/MM/Y' +
        'YYY'#39'))'
      
        '         AND   ((:IDTIPOCOTA IS NULL) OR (H.IDTIPOCOTA = :IDTIPO' +
        'COTA))'
      '         AND   (H.TIPMOVFUNDO    = '#39'OPE'#39')'
      '         AND   (H.IDCOMPOSICAOFUNDO IS NULL)'
      '         GROUP BY H.IDOPERACAOFUNDO) HMIN,'
      ''
      
        '        (SELECT OP.VLRTAXAS, OP.IDOPERACAOORIGEM FROM OPERACAOFU' +
        'NDO OP'
      '         WHERE'
      '               (OP.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '         AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLAN' +
        'PREVCTBPATR > 0)) OR'
      
        '                ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLAN' +
        'PREVCTBPATR = :IDPLANPREVCTBPATR)))'
      '         AND   (OP.IDFUNDOINVEST > 0)'
      
        '         AND   (OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/' +
        'YYYY'#39')   AND'
      
        '                                        TO_DATE(:DATAFIM,'#39'DD/MM/' +
        'YYYY'#39'))'
      '         AND   (OP.IDTIPOOPERACAO IN (-174,-175,-176))'
      
        '         AND    ((:IDTIPOCOTA IS NULL) OR (OP.IDTIPOCOTA = :IDTI' +
        'POCOTA))) TX,'
      ''
      
        '        (SELECT OP.IDPEDIDOFUNDO, OP.IDOPERACAOFUNDO, OP.IDOPERA' +
        'CAOORIGEM FROM OPERACAOFUNDO OP'
      '         WHERE'
      '               (OP.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '         AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLAN' +
        'PREVCTBPATR > 0)) OR'
      
        '                ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLAN' +
        'PREVCTBPATR = :IDPLANPREVCTBPATR)))'
      '         AND   (OP.IDFUNDOINVEST > 0)'
      
        '         AND   (OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/' +
        'YYYY'#39')   AND'
      
        '                                        TO_DATE(:DATAFIM,'#39'DD/MM/' +
        'YYYY'#39'))'
      
        '         AND   (OP.IDTIPOOPERACAO = -177)                       ' +
        '              '
      
        '         AND    ((:IDTIPOCOTA IS NULL) OR (OP.IDTIPOCOTA = :IDTI' +
        'POCOTA))'
      '         AND   (OP.IDPEDIDOFUNDO IS NOT NULL)'
      '         AND   (OP.IDOPERACAOORIGEM IS NOT NULL)) PD,'
      ''
      
        '        (SELECT OP.VLRTAXAS, OP.IDPEDIDOFUNDO FROM OPERACAOFUNDO' +
        ' OP'
      '         WHERE'
      '               (OP.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '         AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLAN' +
        'PREVCTBPATR > 0)) OR'
      
        '                ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLAN' +
        'PREVCTBPATR = :IDPLANPREVCTBPATR)))'
      '         AND   (OP.IDFUNDOINVEST > 0)'
      
        '         AND   (OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/' +
        'YYYY'#39')   AND'
      
        '                                        TO_DATE(:DATAFIM,'#39'DD/MM/' +
        'YYYY'#39'))'
      '         AND   (OP.IDTIPOOPERACAO = -177)'
      
        '         AND    ((:IDTIPOCOTA IS NULL) OR (OP.IDTIPOCOTA = :IDTI' +
        'POCOTA))) RGT,'
      ''
      
        '        (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTI' +
        'POFUNDOINVEST'
      '         FROM HISTFUNDOINVEST HF1'
      
        '         WHERE (/*HF1.IDTIPOFUNDOINVEST ||*/ HF1.IDFUNDOINVEST |' +
        '| TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '               (SELECT /*HF.IDTIPOFUNDOINVEST ||*/ HF.IDFUNDOINV' +
        'EST || TO_CHAR(MAX(HF.DTAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '                FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '                WHERE'
      '                    (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '                AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPO' +
        'FUNDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '                AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAFIM,'#39'D' +
        'D/MM/YYYY'#39')+1)'
      
        '                AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST' +
        ')'
      
        '                AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST' +
        ')'
      
        '                GROUP BY /*HF.IDTIPOFUNDOINVEST,*/ HF.IDFUNDOINV' +
        'EST))) FI,'
      ''
      
        '        (SELECT TP.IDTIPOINVEST, TP.IDTIPOOPERACAO, TP.NATUREZAO' +
        'PERACAO'
      '         FROM   TIPOOPERACAO TP'
      
        '         WHERE  (TP.IDTIPOINVEST  = :IDTIPOINVEST) AND (TP.NATUR' +
        'EZAOPERACAO <> '#39'R'#39')) TP'
      '      WHERE'
      '            (HI.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '      AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (HI.IDPLANPRE' +
        'VCTBPATR > 0)) OR'
      
        '             ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI.IDPLANPRE' +
        'VCTBPATR = :IDPLANPREVCTBPATR)))'
      '      AND   (HI.IDFUNDOINVEST > 0)'
      '      AND   (HI.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      
        '      AND   (HI.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYY' +
        'Y'#39')   AND'
      
        '                                     TO_DATE(:DATAFIM,'#39'DD/MM/YYY' +
        'Y'#39'))'
      
        '      AND    ((:IDTIPOCOTA IS NULL) OR (HI.IDTIPOCOTA = :IDTIPOC' +
        'OTA))'
      '      AND   (HI.TIPMOVFUNDO    = '#39'OPE'#39')'
      '      AND   (HI.IDCOMPOSICAOFUNDO IS NULL)'
      '      AND   (FI.IDFUNDOINVEST  = HI.IDFUNDOINVEST)'
      '      AND   (HI.IDTIPOINVEST   = TP.IDTIPOINVEST)'
      '      AND   (HI.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)'
      '      AND   (TX.IDOPERACAOORIGEM(+)= HI.IDOPERACAOFUNDO)'
      '      AND   (PD.IDOPERACAOORIGEM(+)= HI.IDOPERACAOFUNDO)'
      '      AND  (RGT.IDPEDIDOFUNDO(+)   = PD.IDPEDIDOFUNDO)'
      '      AND (HMIN.IDHISTFUNDO(+)    = HI.IDHISTFUNDO)'
      
        '      GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDO' +
        'INVEST, HI.DATAAPLICACAO,'
      
        '               HI.IDTIPOCOTA, FI.IDTIPOFUNDOINVEST, HI.VLRAPLICA' +
        'DO, HI.IDTIPOOPERACAO)'
      
        '   GROUP BY ID, ID1, IDTIPOINVEST, IDPLANPREVCTBPATR, IDFUNDOINV' +
        'EST) OPE,'
      ''
      '  (SELECT     '
      
        '     (HI.IDTIPOINVEST || HI.IDFUNDOINVEST || HI.IDPLANPREVCTBPAT' +
        'R || HI.DATAAPLICACAO || FI.IDTIPOFUNDOINVEST || HI.IDTIPOCOTA) ' +
        'AS ID,'
      
        '     (HI.IDTIPOINVEST || HI.IDFUNDOINVEST || HI.IDPLANPREVCTBPAT' +
        'R /*|| FI.IDTIPOFUNDOINVEST*/) AS ID1,'
      '      HI.DATAAPLICACAO , '#39#39' AS DATAMOVFUNDO,'
      
        '      0 AS SALDOANTERIOR, 0 AS VLRAPLICADO, 0 AS VLRIRPROV, 0 AS' +
        ' VLRIOFPROV ,'
      
        '      SUM(DECODE(HI.NATURMOVFUNDO,'#39'A'#39',NVL(HI.VLRMOVFUNDO,0),0)) ' +
        'AS VLRENTRADA,'
      
        '      SUM(DECODE(HI.NATURMOVFUNDO,'#39'D'#39',NVL(HI.VLRMOVFUNDO,0)*-1,0' +
        ')) AS VLRSAIDA,'
      '      0 AS VLRVARIACAO,'
      
        '      0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, 0 AS  SALDOLIQUIDO' +
        ','
      '      HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR'
      '   FROM HISTFUNDO HI,'
      ''
      
        '       (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIP' +
        'OFUNDOINVEST'
      '        FROM HISTFUNDOINVEST HF1'
      
        '        WHERE (/*HF1.IDTIPOFUNDOINVEST ||*/ HF1.IDFUNDOINVEST ||' +
        ' TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '              (SELECT /*HF.IDTIPOFUNDOINVEST ||*/ HF.IDFUNDOINVE' +
        'ST || TO_CHAR(MAX(HF.DTAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '               FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '               WHERE'
      '                   (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '               AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPOF' +
        'UNDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '               AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAFIM,'#39'DD' +
        '/MM/YYYY'#39')+1)'
      '               AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)'
      
        '               GROUP BY /*HF.IDTIPOFUNDOINVEST,*/ HF.IDFUNDOINVE' +
        'ST))) FI,'
      ''
      '       (SELECT'
      '           MAX(HI1.IDHISTFUNDO) AS IDHISTFUNDO'
      '        FROM HISTFUNDO HI1,'
      
        '            (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.' +
        'IDTIPOFUNDOINVEST'
      '             FROM HISTFUNDOINVEST HF1'
      
        '             WHERE (/*HF1.IDTIPOFUNDOINVEST ||*/ HF1.IDFUNDOINVE' +
        'ST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '                   (SELECT /*HF2.IDTIPOFUNDOINVEST ||*/ HF2.IDFU' +
        'NDOINVEST || TO_CHAR(MAX(HF2.DTAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:S' +
        'S'#39')'
      
        '                    FROM HISTFUNDOINVEST HF2, TIPOFUNDOINVEST TF' +
        '2'
      '                    WHERE'
      '                        (TF2.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '                    AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF2.I' +
        'DTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '                    AND (TRUNC(HF2.DTAVIGENCIA) < TO_DATE(:DATAF' +
        'IM,'#39'DD/MM/YYYY'#39')+1)'
      
        '                    AND (HF2.IDTIPOFUNDOINVEST = TF2.IDTIPOFUNDO' +
        'INVEST)'
      
        '                    GROUP BY /*HF2.IDTIPOFUNDOINVEST,*/ HF2.IDFU' +
        'NDOINVEST))) FI1'
      '        WHERE'
      '             (HI1.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '        AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (HI1.IDPLAN' +
        'PREVCTBPATR > 0)) OR'
      
        '               ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI1.IDPLAN' +
        'PREVCTBPATR = :IDPLANPREVCTBPATR)))'
      '        AND  (HI1.IDFUNDOINVEST > 0)'
      
        '        AND  (HI1.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39 +
        '))'
      
        '        AND  (HI1.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/Y' +
        'YYY'#39')   AND'
      
        '                                      TO_DATE(:DATAFIM,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '        AND    ((:IDTIPOCOTA IS NULL) OR (HI1.IDTIPOCOTA = :IDTI' +
        'POCOTA))'
      
        '        AND ((HI1.TIPMOVFUNDO    = '#39'OPE'#39') OR (HI1.TIPMOVFUNDO = ' +
        #39'TRP'#39') OR (HI1.TIPMOVFUNDO = '#39'TRT'#39'))'
      '        AND  (HI1.IDTIPOOPERACAO IN (-107,-108,-160,-161))'
      '        AND  (HI1.IDCOMPOSICAOFUNDO IS NULL)'
      '        AND  (FI1.IDFUNDOINVEST  = HI1.IDFUNDOINVEST)'
      
        '        GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPATR, HI1.ID' +
        'FUNDOINVEST, HI1.DATAAPLICACAO,'
      
        '                 HI1.DATAMOVFUNDO, HI1.IDOPERACAOFUNDO, HI1.IDTI' +
        'POCOTA, FI1.IDTIPOFUNDOINVEST) HMAX'
      '   WHERE'
      '        (HI.IDHISTFUNDO    = HMAX.IDHISTFUNDO)'
      '   AND  (FI.IDFUNDOINVEST  = HI.IDFUNDOINVEST)'
      
        '   GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOINV' +
        'EST, HI.DATAAPLICACAO,'
      '            HI.IDTIPOCOTA, FI.IDTIPOFUNDOINVEST) TRP,'
      ''
      '  (SELECT'
      
        '      (OP.IDTIPOINVEST || OP.IDFUNDOINVEST || OP.IDPLANPREVCTBPA' +
        'TR || FI.IDTIPOFUNDOINVEST || OP.IDTIPOCOTA) AS ID,'
      
        '      (OP.IDTIPOINVEST || OP.IDFUNDOINVEST || OP.IDPLANPREVCTBPA' +
        'TR/* || FI.IDTIPOFUNDOINVEST*/) AS ID1,'
      
        '       SUM(DECODE(TP.IDTIPOOPERACAO, -43, NVL(OP.VLROPERACAO,0),' +
        '0)) AS VLRAMORTIZ,'
      
        '       SUM(DECODE(TP.IDTIPOOPERACAO,-143, NVL(OP.VLROPERACAO,0),' +
        '0)) AS VLRAMORTIZREC,'
      
        '       SUM(DECODE(TP.NATUREZAOPERACAO,'#39'R'#39',NVL(OP.VLROPERACAO,0),' +
        '0)) AS VLRDIVIDENDO,'
      '       OP.IDTIPOINVEST , OP.IDFUNDOINVEST, OP.IDPLANPREVCTBPATR'
      '   FROM OPERACAOFUNDO OP,'
      ''
      
        '       (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIP' +
        'OFUNDOINVEST'
      '        FROM HISTFUNDOINVEST HF1'
      
        '        WHERE (/*HF1.IDTIPOFUNDOINVEST ||*/ HF1.IDFUNDOINVEST ||' +
        ' TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '              (SELECT /*HF.IDTIPOFUNDOINVEST ||*/ HF.IDFUNDOINVE' +
        'ST || TO_CHAR(MAX(HF.DTAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '               FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '               WHERE'
      '                   (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '               AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPOF' +
        'UNDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '               AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAFIM,'#39'DD' +
        '/MM/YYYY'#39')+1)'
      '               AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)'
      
        '               GROUP BY /*HF.IDTIPOFUNDOINVEST,*/ HF.IDFUNDOINVE' +
        'ST))) FI,'
      ''
      
        '       (SELECT TP.IDTIPOINVEST, TP.IDTIPOOPERACAO, TP.NATUREZAOP' +
        'ERACAO'
      '        FROM   TIPOOPERACAO TP'
      
        '        WHERE  ((TP.IDTIPOINVEST  = :IDTIPOINVEST) AND (TP.NATUR' +
        'EZAOPERACAO = '#39'R'#39') OR'
      '                (TP.IDTIPOOPERACAO IN (-43,-143)))) TP'
      '   WHERE'
      '        (OP.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '   AND  (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLANPREVCTB' +
        'PATR > 0)) OR'
      
        '         ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREVCTB' +
        'PATR = :IDPLANPREVCTBPATR)))'
      '   AND  (OP.IDFUNDOINVEST > 0)         '
      
        '   AND  (OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') ' +
        '  AND'
      '                                 TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      
        '   AND   ((:IDTIPOCOTA IS NULL) OR (OP.IDTIPOCOTA = :IDTIPOCOTA)' +
        ')'
      '   AND  (FI.IDFUNDOINVEST  = OP.IDFUNDOINVEST)'
      '   AND  (OP.IDTIPOINVEST   = TP.IDTIPOINVEST)'
      '   AND  (OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)'
      
        '   GROUP BY OP.IDTIPOINVEST, OP.IDPLANPREVCTBPATR, OP.IDFUNDOINV' +
        'EST, OP.IDTIPOCOTA, FI.IDTIPOFUNDOINVEST) AMODIV,'
      ''
      '  (SELECT'
      '     VATUTRP.ID,   '
      '     VATUTRP.DATAAPLICACAO, VATUTRP.DATAMOVFUNDO,'
      '     SUM(NVL(VATUTRP.SALDOANTERIOR,0)) AS SALDOANTERIOR,'
      '     SUM(NVL(VATUTRP.VLRAPLICADO,0))   AS VLRAPLICADO,'
      '     SUM(NVL(VATUTRP.VLRIRPROV,0))     AS VLRIRPROV,'
      '     SUM(NVL(VATUTRP.VLRIOFPROV,0))    AS VLRIOFPROV,'
      '     SUM(NVL(VATUTRP.VLRAPLICACAO,0))  AS VLRAPLICACAO,'
      '     SUM(NVL(VATUTRP.VLRRESGATE,0))    AS VLRRESGATE,'
      '     SUM(NVL(VATUTRP.VLRVARIACAO,0))   AS VLRVARIACAO,'
      '     SUM(NVL(VATUTRP.SALDOQTDCOTAS,0)) AS VLRRESGATE,'
      '     SUM(NVL(VATUTRP.SALDOVLRFUNDO,0)) AS SALDOVLRFUNDO,'
      '     SUM(NVL(VATUTRP.SALDOLIQUIDO,0))  AS SALDOLIQUIDO,'
      
        '     VATUTRP.IDTIPOINVEST, VATUTRP.IDFUNDOINVEST, VATUTRP.IDPLAN' +
        'PREVCTBPATR,'
      '     VATUTRP.IDTIPOFUNDOINVEST, VATUTRP.IDTIPOCOTA'
      ''
      '  FROM'
      '    (SELECT'
      
        '        (HI.IDTIPOINVEST || HI.IDFUNDOINVEST || HI.IDPLANPREVCTB' +
        'PATR || HI.DATAAPLICACAO || FI.IDTIPOFUNDOINVEST || HI.IDTIPOCOT' +
        'A ) AS ID,'
      
        '        (HI.IDTIPOINVEST || HI.IDFUNDOINVEST || HI.IDPLANPREVCTB' +
        'PATR /*|| FI.IDTIPOFUNDOINVEST */) AS ID1,'
      '         HI.DATAAPLICACAO , '#39#39' AS DATAMOVFUNDO,'
      
        '         0 AS SALDOANTERIOR, 0 AS VLRAPLICADO, 0 AS VLRIRPROV, 0' +
        ' AS VLRIOFPROV ,'
      '         0 AS VLRAPLICACAO,'
      '         0 AS VLRRESGATE,'
      '         SUM(NVL(HI.VLRVARIACAO,0)) AS VLRVARIACAO,'
      
        '         0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, 0 AS  SALDOLIQU' +
        'IDO,'
      
        '         HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPAT' +
        'R,'
      '         HI.IDTIPOCOTA, FI.IDTIPOFUNDOINVEST'
      '     FROM HISTFUNDO HI,'
      ''
      '         (SELECT  MAX(H.IDHISTFUNDO) AS IDHISTFUNDO'
      '          FROM HISTFUNDO H'
      '          WHERE'
      '               (H.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '          AND (((:IDPLANPREVCTBPATR IS NULL)     AND (H.IDPLANPR' +
        'EVCTBPATR > 0)) OR'
      
        '               ((:IDPLANPREVCTBPATR IS NOT NULL) AND (H.IDPLANPR' +
        'EVCTBPATR = :IDPLANPREVCTBPATR)))'
      '          AND  (H.IDFUNDOINVEST > 0)'
      
        '          AND  (H.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39 +
        '))'
      
        '          AND  (H.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/Y' +
        'YYY'#39')   AND'
      
        '                                       TO_DATE(:DATAFIM,'#39'DD/MM/Y' +
        'YYY'#39'))'
      
        '          AND  ((:IDTIPOCOTA IS NULL) OR (H.IDTIPOCOTA = :IDTIPO' +
        'COTA))'
      ''
      
        '          AND ((H.TIPMOVFUNDO    = '#39'ATU'#39') OR (H.TIPMOVFUNDO  = '#39 +
        'AJU'#39') OR'
      
        '              ((H.TIPMOVFUNDO    = '#39'OPE'#39') AND ((H.IDTIPOOPERACAO' +
        ' = -106) OR'
      
        '                                               (H.IDTIPOOPERACAO' +
        ' = -105) OR '
      
        '                                               (H.IDTIPOOPERACAO' +
        ' = -1005) OR'
      
        '                                               (H.IDTIPOOPERACAO' +
        ' = -100))) )'
      '          AND  (H.IDCOMPOSICAOFUNDO IS NULL)'
      
        '          GROUP BY H.IDTIPOINVEST, H.IDPLANPREVCTBPATR, H.IDFUND' +
        'OINVEST, H.DATAAPLICACAO,'
      '                   H.DATAMOVFUNDO, H.IDTIPOCOTA) HI1,'
      ''
      
        '          (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.ID' +
        'TIPOFUNDOINVEST'
      '          FROM HISTFUNDOINVEST HF1'
      
        '          WHERE (/*HF1.IDTIPOFUNDOINVEST ||*/ HF1.IDFUNDOINVEST ' +
        '|| TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '                (SELECT /*HF.IDTIPOFUNDOINVEST ||*/ HF.IDFUNDOIN' +
        'VEST || TO_CHAR(MAX(HF.DTAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '                 FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '                 WHERE'
      '                     (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '                 AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIP' +
        'OFUNDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '                 AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAFIM,'#39 +
        'DD/MM/YYYY'#39')+1)'
      
        '                 AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVES' +
        'T)'
      
        '                 GROUP BY /*HF.IDTIPOFUNDOINVEST,*/ HF.IDFUNDOIN' +
        'VEST))) FI'
      '     WHERE'
      '          (HI.IDHISTFUNDO    = HI1.IDHISTFUNDO)'
      '     AND  (FI.IDFUNDOINVEST  = HI.IDFUNDOINVEST)'
      
        '     GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOI' +
        'NVEST, HI.DATAAPLICACAO,'
      
        '              HI.IDTIPOCOTA, FI.IDTIPOFUNDOINVEST,  HI.DATAMOVFU' +
        'NDO'
      ''
      '     UNION'
      ''
      '     SELECT'
      
        '         (HI.IDTIPOINVEST || HI.IDFUNDOINVEST || HI.IDPLANPREVCT' +
        'BPATR || HI.DATAAPLICACAO || FI.IDTIPOFUNDOINVEST || HI.IDTIPOCO' +
        'TA ) AS ID,'
      
        '         (HI.IDTIPOINVEST || HI.IDFUNDOINVEST || HI.IDPLANPREVCT' +
        'BPATR /*|| FI.IDTIPOFUNDOINVEST*/) AS ID1,'
      '          HI.DATAAPLICACAO , '#39#39' AS DATAMOVFUNDO,'
      
        '         0 AS SALDOANTERIOR, 0 AS VLRAPLICADO, 0 AS VLRIRPROV, 0' +
        ' AS VLRIOFPROV ,'
      '         0 AS VLRAPLICACAO,'
      '         0 AS VLRRESGATE,'
      '         SUM(NVL(HI.VLRVARIACAO,0)) AS VLRVARIACAO,'
      
        '         0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, 0 AS  SALDOLIQU' +
        'IDO,'
      
        '         HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPAT' +
        'R,'
      '         HI.IDTIPOCOTA, FI.IDTIPOFUNDOINVEST'
      '     FROM HISTFUNDO HI,'
      ''
      
        '         (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDT' +
        'IPOFUNDOINVEST'
      '          FROM HISTFUNDOINVEST HF1'
      
        '          WHERE (/*HF1.IDTIPOFUNDOINVEST ||*/ HF1.IDFUNDOINVEST ' +
        '|| TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '                (SELECT /*HF.IDTIPOFUNDOINVEST ||*/ HF.IDFUNDOIN' +
        'VEST || TO_CHAR(MAX(HF.DTAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '                 FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '                 WHERE'
      '                     (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '                 AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIP' +
        'OFUNDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '                 AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAFIM,'#39 +
        'DD/MM/YYYY'#39')+1)'
      
        '                 AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVES' +
        'T)'
      
        '                 GROUP BY /*HF.IDTIPOFUNDOINVEST,*/ HF.IDFUNDOIN' +
        'VEST))) FI,'
      ''
      '       (SELECT'
      '           MAX(HI1.IDHISTFUNDO) AS IDHISTFUNDO'
      '        FROM'
      '           HISTFUNDO HI1,'
      ''
      
        '          (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.ID' +
        'TIPOFUNDOINVEST'
      '           FROM HISTFUNDOINVEST HF1'
      
        '           WHERE (/*HF1.IDTIPOFUNDOINVEST ||*/ HF1.IDFUNDOINVEST' +
        ' || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '                 (SELECT /*HF2.IDTIPOFUNDOINVEST ||*/ HF2.IDFUND' +
        'OINVEST || TO_CHAR(MAX(HF2.DTAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39 +
        ')'
      '                  FROM HISTFUNDOINVEST HF2, TIPOFUNDOINVEST TF2'
      '                  WHERE'
      '                      (TF2.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '                  AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF2.IDT' +
        'IPOFUNDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '                  AND (TRUNC(HF2.DTAVIGENCIA) < TO_DATE(:DATAFIM' +
        ','#39'DD/MM/YYYY'#39')+1)'
      
        '                  AND (HF2.IDTIPOFUNDOINVEST = TF2.IDTIPOFUNDOIN' +
        'VEST)'
      
        '                  GROUP BY /*HF2.IDTIPOFUNDOINVEST,*/ HF2.IDFUND' +
        'OINVEST))) FI1'
      ''
      '        WHERE'
      '            (HI1.IDTIPOINVEST    = :IDTIPOINVEST)'
      
        '        AND  (((:IDPLANPREVCTBPATR IS NULL)     AND (HI1.IDPLANP' +
        'REVCTBPATR > 0)) OR'
      
        '              ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI1.IDPLANP' +
        'REVCTBPATR = :IDPLANPREVCTBPATR)))'
      '        AND (HI1.IDFUNDOINVEST > 0)'
      
        '        AND (HI1.DATAAPLICACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')' +
        ')'
      
        '        AND (HI1.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YY' +
        'YY'#39')   AND'
      
        '                                       TO_DATE(:DATAFIM,'#39'DD/MM/Y' +
        'YYY'#39'))'
      
        '        AND    ((:IDTIPOCOTA IS NULL) OR (HI1.IDTIPOCOTA = :IDTI' +
        'POCOTA))'
      
        '        AND ((HI1.TIPMOVFUNDO    = '#39'OPE'#39') OR (HI1.TIPMOVFUNDO = ' +
        #39'TRP'#39') OR (HI1.TIPMOVFUNDO = '#39'TRT'#39'))'
      '        AND  (HI1.IDTIPOOPERACAO IN (-107,-108,-160,-161))'
      '        AND  (HI1.IDCOMPOSICAOFUNDO IS NULL)'
      '        AND  (FI1.IDFUNDOINVEST  = HI1.IDFUNDOINVEST)'
      
        '        GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPATR, HI1.ID' +
        'FUNDOINVEST, HI1.DATAAPLICACAO,'
      
        '                 HI1.DATAMOVFUNDO, HI1.IDOPERACAOFUNDO, HI1.IDTI' +
        'POCOTA, FI1.IDTIPOFUNDOINVEST) HMAX'
      '     WHERE'
      '         NVL(HI.VLRVARIACAO,0) <> 0'
      '     AND    (HI.IDHISTFUNDO    = HMAX.IDHISTFUNDO)'
      '     AND    (FI.IDFUNDOINVEST  = HI.IDFUNDOINVEST)'
      
        '     GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOI' +
        'NVEST, HI.DATAAPLICACAO,'
      
        '              HI.IDTIPOCOTA, FI.IDTIPOFUNDOINVEST, HI.DATAMOVFUN' +
        'DO) VATUTRP'
      ''
      
        '   GROUP BY VATUTRP.ID, VATUTRP.DATAAPLICACAO, VATUTRP.DATAMOVFU' +
        'NDO,'
      
        '            VATUTRP.IDTIPOINVEST, VATUTRP.IDFUNDOINVEST, VATUTRP' +
        '.IDPLANPREVCTBPATR,'
      '            VATUTRP.IDTIPOFUNDOINVEST, VATUTRP.IDTIPOCOTA) ATU,'
      '              '
      '   TIPOCOTA TC'
      ''
      'WHERE'
      '    (SLDATU.ID = SLDANT.ID(+))'
      'AND (SLDATU.ID = OPE.ID(+))'
      'AND (SLDATU.ID = TRP.ID(+))'
      'AND (SLDATU.ID1 = AMODIV.ID1(+))'
      'AND (SLDATU.ID = ATU.ID(+))'
      'AND (SLDATU.IDTIPOCOTA = TC.IDTIPOCOTA(+))'
      'ORDER BY  SLDATU.DATAAPLICACAO, TC.DESCTIPOCOTA ')
    ValidateWithMask = True
    Left = 521
    Top = 107
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
    object qryMapaInvestFdoOutrosAnID: TStringField
      FieldName = 'ID'
      Size = 89
    end
    object qryMapaInvestFdoOutrosAnID1: TStringField
      FieldName = 'ID1'
      Size = 120
    end
    object qryMapaInvestFdoOutrosAnDATAAPLICACAO: TDateTimeField
      FieldName = 'DATAAPLICACAO'
    end
    object qryMapaInvestFdoOutrosAnDATAMOVFUNDO: TDateTimeField
      FieldName = 'DATAMOVFUNDO'
    end
    object qryMapaInvestFdoOutrosAnSALDOANTERIOR: TFloatField
      FieldName = 'SALDOANTERIOR'
    end
    object qryMapaInvestFdoOutrosAnVLRAPLICADO: TFloatField
      FieldName = 'VLRAPLICADO'
    end
    object qryMapaInvestFdoOutrosAnVLRIRPROV: TFloatField
      FieldName = 'VLRIRPROV'
    end
    object qryMapaInvestFdoOutrosAnVLRIOFPROV: TFloatField
      FieldName = 'VLRIOFPROV'
    end
    object qryMapaInvestFdoOutrosAnVLRRESGATE: TFloatField
      FieldName = 'VLRRESGATE'
    end
    object qryMapaInvestFdoOutrosAnVLRAPLICACAO: TFloatField
      FieldName = 'VLRAPLICACAO'
    end
    object qryMapaInvestFdoOutrosAnVLRINTEGRALIZ: TFloatField
      FieldName = 'VLRINTEGRALIZ'
    end
    object qryMapaInvestFdoOutrosAnVLRVARIACAO: TFloatField
      FieldName = 'VLRVARIACAO'
    end
    object qryMapaInvestFdoOutrosAnSALDOQTDCOTAS: TFloatField
      FieldName = 'SALDOQTDCOTAS'
    end
    object qryMapaInvestFdoOutrosAnSALDOVLRFUNDO: TFloatField
      FieldName = 'SALDOVLRFUNDO'
    end
    object qryMapaInvestFdoOutrosAnSALDOLIQUIDO: TFloatField
      FieldName = 'SALDOLIQUIDO'
    end
    object qryMapaInvestFdoOutrosAnIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryMapaInvestFdoOutrosAnIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
    end
    object qryMapaInvestFdoOutrosAnIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryMapaInvestFdoOutrosAnVLRAMORTIZ: TFloatField
      FieldName = 'VLRAMORTIZ'
    end
    object qryMapaInvestFdoOutrosAnVLRDIVIDENDO: TFloatField
      FieldName = 'VLRDIVIDENDO'
    end
    object qryMapaInvestFdoOutrosAnVLRAMORTIZREC: TFloatField
      FieldName = 'VLRAMORTIZREC'
    end
    object qryMapaInvestFdoOutrosAnVLRTRANSF: TFloatField
      FieldName = 'VLRTRANSF'
    end
    object qryMapaInvestFdoOutrosAnIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
    end
    object qryMapaInvestFdoOutrosAnDESCTIPOCOTA: TStringField
      FieldName = 'DESCTIPOCOTA'
      Size = 40
    end
    object qryMapaInvestFdoOutrosAnIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
    end
    object qryMapaInvestFdoOutrosAnVLRTAXAS: TFloatField
      FieldName = 'VLRTAXAS'
    end
  end
  object BDEMapaInvestFdoOutrosAn: TppBDEPipeline
    DataSource = dsMapaInvestFdoOutrosAn
    UserName = 'BDEMapaInvestFdoOutrosAn'
    Left = 520
    Top = 55
    object BDEMapaInvestFdoOutrosAnppField1: TppField
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object BDEMapaInvestFdoOutrosAnppField2: TppField
      FieldAlias = 'ID1'
      FieldName = 'ID1'
      FieldLength = 120
      DisplayWidth = 120
      Position = 1
    end
    object BDEMapaInvestFdoOutrosAnppField3: TppField
      FieldAlias = 'DATAAPLICACAO'
      FieldName = 'DATAAPLICACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object BDEMapaInvestFdoOutrosAnppField4: TppField
      FieldAlias = 'DATAMOVFUNDO'
      FieldName = 'DATAMOVFUNDO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object BDEMapaInvestFdoOutrosAnppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOANTERIOR'
      FieldName = 'SALDOANTERIOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object BDEMapaInvestFdoOutrosAnppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRAPLICADO'
      FieldName = 'VLRAPLICADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object BDEMapaInvestFdoOutrosAnppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIRPROV'
      FieldName = 'VLRIRPROV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object BDEMapaInvestFdoOutrosAnppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIOFPROV'
      FieldName = 'VLRIOFPROV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object BDEMapaInvestFdoOutrosAnppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRESGATE'
      FieldName = 'VLRRESGATE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object BDEMapaInvestFdoOutrosAnppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRAPLICACAO'
      FieldName = 'VLRAPLICACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object BDEMapaInvestFdoOutrosAnppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRINTEGRALIZ'
      FieldName = 'VLRINTEGRALIZ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object BDEMapaInvestFdoOutrosAnppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRVARIACAO'
      FieldName = 'VLRVARIACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object BDEMapaInvestFdoOutrosAnppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOQTDCOTAS'
      FieldName = 'SALDOQTDCOTAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object BDEMapaInvestFdoOutrosAnppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOVLRFUNDO'
      FieldName = 'SALDOVLRFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object BDEMapaInvestFdoOutrosAnppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOLIQUIDO'
      FieldName = 'SALDOLIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object BDEMapaInvestFdoOutrosAnppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOINVEST'
      FieldName = 'IDTIPOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object BDEMapaInvestFdoOutrosAnppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFUNDOINVEST'
      FieldName = 'IDFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object BDEMapaInvestFdoOutrosAnppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANPREVCTBPATR'
      FieldName = 'IDPLANPREVCTBPATR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object BDEMapaInvestFdoOutrosAnppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRAMORTIZ'
      FieldName = 'VLRAMORTIZ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object BDEMapaInvestFdoOutrosAnppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRDIVIDENDO'
      FieldName = 'VLRDIVIDENDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object BDEMapaInvestFdoOutrosAnppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRAMORTIZREC'
      FieldName = 'VLRAMORTIZREC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object BDEMapaInvestFdoOutrosAnppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRTRANSF'
      FieldName = 'VLRTRANSF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object BDEMapaInvestFdoOutrosAnppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOCOTA'
      FieldName = 'IDTIPOCOTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object BDEMapaInvestFdoOutrosAnppField24: TppField
      FieldAlias = 'DESCTIPOCOTA'
      FieldName = 'DESCTIPOCOTA'
      FieldLength = 40
      DisplayWidth = 40
      Position = 23
    end
    object BDEMapaInvestFdoOutrosAnppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOFUNDOINVEST'
      FieldName = 'IDTIPOFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object BDEMapaInvestFdoOutrosAnppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRTAXAS'
      FieldName = 'VLRTAXAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
  end
  object dsMapaInvestFdoOutrosAn: TwwDataSource
    DataSet = qryMapaInvestFdoOutrosAn
    Left = 520
    Top = 155
  end
  object QryTipoCota: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOCOTA, DESCTIPOCOTA'
      'FROM'
      '   TIPOCOTA'
      'ORDER BY DESCTIPOCOTA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 381
    Top = 218
  end
  object QryTipoFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IDTIPOINVEST, IDTIPOFUNDOINVEST, DESCTIPOFUNDOINV, DATAULTFEC' +
        'H'
      'FROM'
      '   TIPOFUNDOINVEST'
      'WHERE'
      '   IDTIPOINVEST =:IDTIPOINVEST'
      'ORDER BY DESCTIPOFUNDOINV   '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 381
    Top = 266
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
  end
  object qrySegmentacao: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT SM.IDSEGMENTACAO, SM.DESCSEGMENTACAO FROM SEGMENTACAOMERC' +
        'ADO SM, TIPOFUNDOINVEST TPF'
      'WHERE IDGRUPO = 3'
      'AND TPF.IDTIPOINVEST = :IDTIPOINVEST'
      'AND SM.IDSEGMENTACAO = TPF.IDSEGMENTACAO'
      'GROUP BY SM.IDSEGMENTACAO, SM.DESCSEGMENTACAO')
    ValidateWithMask = True
    Left = 465
    Top = 218
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
    object qrySegmentacaoDESCSEGMENTACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCSEGMENTACAO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.DESCSEGMENTACAO'
      Size = 100
    end
    object qrySegmentacaoIDSEGMENTACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSEGMENTACAO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.IDSEGMENTACAO'
      Visible = False
    end
  end
  object rptMapaInvestFdoOutros: TppReport
    AutoStop = False
    DataPipeline = BDEMapaInvestFdoOutros
    OnStartPage = rptMapaInvestFdoStartPage
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Mapa de Movimentação'
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 365
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'BDEMapaInvestFdoOutros'
    object ppHeaderBand2: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 34660
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'shpConsRentFndCab'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 10319
        mmLeft = 0
        mmTop = 24077
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'pplblVariacao'
        Caption = 'Variação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 248709
        mmTop = 30956
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'pplblVlrAplicado'
        Caption = 'Valor Aplicado'
        Color = 14935011
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 79375
        mmTop = 25135
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'pplblIOF'
        Caption = 'IOF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 279136
        mmTop = 25135
        mmWidth = 3969
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'pplblAplicacao'
        Caption = 'Amortização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 158750
        mmTop = 25135
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'lblConsRFADifMes'
        Caption = 'Resgate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 228071
        mmTop = 30956
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'pplblSldAnterior'
        Caption = 'Saldo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 134938
        mmTop = 25135
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label4'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 112448
        mmTop = 25135
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label37'
        Caption = 'Mapa de Movimentação em Fundos de Investimentos   -'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 92880
        BandType = 0
      end
      object ppLabel28: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa4'
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
      object lblPeriodoFdoAcoes: TppLabel
        UserName = 'LPeriodo4'
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
      object ppDBImage2: TppDBImage
        UserName = 'DbLogo4'
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
      object ppLabel30: TppLabel
        UserName = 'pplblDescFundo'
        Caption = 'Fundo de Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 794
        mmTop = 25135
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'lblConsRFADifMes1'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 276490
        mmTop = 30956
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'pplblAplicacao2'
        Caption = 'Integralização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 242888
        mmTop = 25135
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'pplblAplicacao3'
        Caption = 'Aplicação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 226219
        mmTop = 25135
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'pplblAplicacao4'
        Caption = 'Dividendo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 204523
        mmTop = 25135
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'pplblAplicacao6'
        Caption = 'Amortização a Receber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 180182
        mmTop = 25135
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label2'
        Caption = 'Transferência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 200290
        mmTop = 30956
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText29: TppDBText
        UserName = 'DBText27'
        DataField = 'DESCTIPOFUNDOINV'
        DataPipeline = BDEMapaInvestFdoOutros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdoOutros'
        mmHeight = 4233
        mmLeft = 118798
        mmTop = 8731
        mmWidth = 121444
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label15'
        Caption = 'Taxas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 144992
        mmTop = 30956
        mmWidth = 6879
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      BeforePrint = ppDetailBand2BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 14552
      mmPrintPosition = 0
      object ppShape5: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 9260
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'ppdbVlrVariacao'
        DataField = 'VLRVARIACAO'
        DataPipeline = BDEMapaInvestFdoOutros
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdoOutros'
        mmHeight = 2646
        mmLeft = 237861
        mmTop = 6085
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'ppdbVlrAplicacao'
        DataField = 'VLRAMORTIZ'
        DataPipeline = BDEMapaInvestFdoOutros
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdoOutros'
        mmHeight = 2646
        mmLeft = 152136
        mmTop = 794
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'ppdbSldAnterior'
        DataField = 'SALDOANTERIOR'
        DataPipeline = BDEMapaInvestFdoOutros
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdoOutros'
        mmHeight = 2646
        mmLeft = 126471
        mmTop = 794
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'ppdbVlrIOF'
        DataField = 'VLRIOFPROV'
        DataPipeline = BDEMapaInvestFdoOutros
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdoOutros'
        mmHeight = 2646
        mmLeft = 259558
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'ppdbVlrResgate'
        DataField = 'VLRRESGATE'
        DataPipeline = BDEMapaInvestFdoOutros
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdoOutros'
        mmHeight = 2646
        mmLeft = 216430
        mmTop = 6085
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'ppdbSldQuantidade'
        DataField = 'SALDOQTDCOTAS'
        DataPipeline = BDEMapaInvestFdoOutros
        DisplayFormat = '###,###,##0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdoOutros'
        mmHeight = 2647
        mmLeft = 96574
        mmTop = 794
        mmWidth = 29464
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'ppdbDescFundo'
        DataField = 'DESCFUNDOINVEST'
        DataPipeline = BDEMapaInvestFdoOutros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdoOutros'
        mmHeight = 2646
        mmLeft = 794
        mmTop = 794
        mmWidth = 74613
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'ppdbSldFundo'
        DataField = 'SALDOVLRFUNDO'
        DataPipeline = BDEMapaInvestFdoOutros
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdoOutros'
        mmHeight = 2646
        mmLeft = 259557
        mmTop = 6085
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'ppdbVlrAplicado'
        DataField = 'VLRAPLICADO'
        DataPipeline = BDEMapaInvestFdoOutros
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdoOutros'
        mmHeight = 2646
        mmLeft = 75936
        mmTop = 794
        mmWidth = 20320
        BandType = 4
      end
      object ppSubReport3: TppSubReport
        UserName = 'SubReport2'
        DrillDownComponent = ppDBText40
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'BDEMapaInvestFdoOutrosAn'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 9525
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = BDEMapaInvestFdoOutrosAn
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Mapa de Movimentação'
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
          Left = 232
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'BDEMapaInvestFdoOutrosAn'
          object ppTitleBand3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 12171
            mmPrintPosition = 0
            object ppShape6: TppShape
              UserName = 'shpConsRentFndCab1'
              Brush.Color = clSilver
              mmHeight = 10320
              mmLeft = 51858
              mmTop = 1585
              mmWidth = 232569
              BandType = 1
            end
            object ppLabel45: TppLabel
              UserName = 'pplblVariacao1'
              Caption = 'Variação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 248709
              mmTop = 8467
              mmWidth = 10319
              BandType = 1
            end
            object ppLabel46: TppLabel
              UserName = 'lblConsRFADifMes2'
              Caption = 'Resgate'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 228071
              mmTop = 8467
              mmWidth = 9525
              BandType = 1
            end
            object ppLabel47: TppLabel
              UserName = 'Label9'
              Caption = 'Saldo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 276490
              mmTop = 8467
              mmWidth = 6615
              BandType = 1
            end
            object ppLabel48: TppLabel
              UserName = 'Label1'
              Caption = 'Data da Aplicação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              WordWrap = True
              mmHeight = 5821
              mmLeft = 52917
              mmTop = 2646
              mmWidth = 11377
              BandType = 1
            end
            object ppLabel49: TppLabel
              UserName = 'Label2'
              Caption = 'Valor Aplicado'
              Color = 14935011
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 79111
              mmTop = 2646
              mmWidth = 16933
              BandType = 1
            end
            object ppLabel50: TppLabel
              UserName = 'Label3'
              Caption = 'Quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 110596
              mmTop = 2646
              mmWidth = 13494
              BandType = 1
            end
            object ppLabel51: TppLabel
              UserName = 'Label4'
              Caption = 'Saldo Anterior'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 134938
              mmTop = 2646
              mmWidth = 16933
              BandType = 1
            end
            object ppLabel52: TppLabel
              UserName = 'Label34'
              Caption = 'Amortização'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 158750
              mmTop = 2646
              mmWidth = 14552
              BandType = 1
            end
            object ppLabel53: TppLabel
              UserName = 'Label35'
              Caption = 'Dividendo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 204523
              mmTop = 2646
              mmWidth = 11642
              BandType = 1
            end
            object ppLabel54: TppLabel
              UserName = 'Label301'
              Caption = 'Aplicação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 226219
              mmTop = 2646
              mmWidth = 11377
              BandType = 1
            end
            object ppLabel55: TppLabel
              UserName = 'Label39'
              Caption = 'Integralização'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 242888
              mmTop = 2646
              mmWidth = 16140
              BandType = 1
            end
            object ppLabel56: TppLabel
              UserName = 'Label40'
              Caption = 'IOF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 279136
              mmTop = 2646
              mmWidth = 3969
              BandType = 1
            end
            object ppLabel57: TppLabel
              UserName = 'Label23'
              Caption = 'Amortização a Receber'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              WordWrap = True
              mmHeight = 5821
              mmLeft = 180182
              mmTop = 2646
              mmWidth = 14552
              BandType = 1
            end
            object ppLabel58: TppLabel
              UserName = 'Label13'
              Caption = 'Transferência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 200290
              mmTop = 8467
              mmWidth = 15875
              BandType = 1
            end
            object ppLabel59: TppLabel
              UserName = 'Label16'
              Caption = 'Taxas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 144992
              mmTop = 8467
              mmWidth = 6879
              BandType = 1
            end
          end
          object ppDetailBand5: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 8731
            mmPrintPosition = 0
            object ppShape7: TppShape
              OnPrint = shpDetalheFilhoPrint
              UserName = 'shpDetalhe1'
              Pen.Style = psClear
              mmHeight = 8731
              mmLeft = 51858
              mmTop = 0
              mmWidth = 232569
              BandType = 4
            end
            object ppDBText43: TppDBText
              UserName = 'ppdbVlrVariacao1'
              DataField = 'VLRVARIACAO'
              DataPipeline = BDEMapaInvestFdoOutrosAn
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoOutrosAn'
              mmHeight = 2910
              mmLeft = 237861
              mmTop = 5556
              mmWidth = 21166
              BandType = 4
            end
            object ppDBText44: TppDBText
              UserName = 'ppdbVlrIOF1'
              DataField = 'VLRIOFPROV'
              DataPipeline = BDEMapaInvestFdoOutrosAn
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoOutrosAn'
              mmHeight = 2910
              mmLeft = 259557
              mmTop = 794
              mmWidth = 23548
              BandType = 4
            end
            object ppDBText45: TppDBText
              UserName = 'ppdbVlrResgate1'
              DataField = 'VLRRESGATE'
              DataPipeline = BDEMapaInvestFdoOutrosAn
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoOutrosAn'
              mmHeight = 2910
              mmLeft = 216430
              mmTop = 5556
              mmWidth = 21167
              BandType = 4
            end
            object ppDBText46: TppDBText
              UserName = 'ppdbSldFundo1'
              DataField = 'SALDOVLRFUNDO'
              DataPipeline = BDEMapaInvestFdoOutrosAn
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoOutrosAn'
              mmHeight = 2910
              mmLeft = 259292
              mmTop = 5556
              mmWidth = 23813
              BandType = 4
            end
            object ppDBText47: TppDBText
              UserName = 'DBText1'
              DataField = 'DATAAPLICACAO'
              DataPipeline = BDEMapaInvestFdoOutrosAn
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoOutrosAn'
              mmHeight = 2910
              mmLeft = 52917
              mmTop = 794
              mmWidth = 19844
              BandType = 4
            end
            object ppDBText48: TppDBText
              UserName = 'DBText2'
              DataField = 'VLRAPLICADO'
              DataPipeline = BDEMapaInvestFdoOutrosAn
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoOutrosAn'
              mmHeight = 2910
              mmLeft = 73290
              mmTop = 794
              mmWidth = 22754
              BandType = 4
            end
            object ppDBText49: TppDBText
              UserName = 'DBText3'
              DataField = 'SALDOQTDCOTAS'
              DataPipeline = BDEMapaInvestFdoOutrosAn
              DisplayFormat = '###,###,##0.000000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoOutrosAn'
              mmHeight = 2910
              mmLeft = 96573
              mmTop = 794
              mmWidth = 27781
              BandType = 4
            end
            object ppDBText50: TppDBText
              UserName = 'DBText4'
              DataField = 'SALDOANTERIOR'
              DataPipeline = BDEMapaInvestFdoOutrosAn
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoOutrosAn'
              mmHeight = 2910
              mmLeft = 124884
              mmTop = 794
              mmWidth = 26988
              BandType = 4
            end
            object ppDBText51: TppDBText
              UserName = 'dbSrptVlrIntegraliz'
              DataField = 'VLRINTEGRALIZ'
              DataPipeline = BDEMapaInvestFdoOutrosAn
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoOutrosAn'
              mmHeight = 2910
              mmLeft = 237861
              mmTop = 794
              mmWidth = 21166
              BandType = 4
            end
            object ppDBText52: TppDBText
              UserName = 'DBText17'
              DataField = 'VLRAPLICACAO'
              DataPipeline = BDEMapaInvestFdoOutrosAn
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoOutrosAn'
              mmHeight = 2910
              mmLeft = 216430
              mmTop = 794
              mmWidth = 21166
              BandType = 4
            end
            object ppDBText53: TppDBText
              UserName = 'DBText19'
              DataField = 'VLRAMORTIZ'
              DataPipeline = BDEMapaInvestFdoOutrosAn
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoOutrosAn'
              mmHeight = 2910
              mmLeft = 152136
              mmTop = 794
              mmWidth = 21167
              BandType = 4
            end
            object ppDBText54: TppDBText
              UserName = 'DBText20'
              DataField = 'VLRDIVIDENDO'
              DataPipeline = BDEMapaInvestFdoOutrosAn
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoOutrosAn'
              mmHeight = 2910
              mmLeft = 194998
              mmTop = 794
              mmWidth = 21166
              BandType = 4
            end
            object ppDBText55: TppDBText
              UserName = 'DBText23'
              DataField = 'VLRAMORTIZREC'
              DataPipeline = BDEMapaInvestFdoOutrosAn
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoOutrosAn'
              mmHeight = 2910
              mmLeft = 173566
              mmTop = 794
              mmWidth = 21166
              BandType = 4
            end
            object ppDBText56: TppDBText
              UserName = 'DBText5'
              DataField = 'VLRTRANSF'
              DataPipeline = BDEMapaInvestFdoOutrosAn
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoOutrosAn'
              mmHeight = 2910
              mmLeft = 194998
              mmTop = 5556
              mmWidth = 21166
              BandType = 4
            end
            object ppTipoCota: TppDBText
              UserName = 'DBText6'
              DataField = 'DESCTIPOCOTA'
              DataPipeline = BDEMapaInvestFdoOutrosAn
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsItalic]
              Transparent = True
              Visible = False
              DataPipelineName = 'BDEMapaInvestFdoOutrosAn'
              mmHeight = 2910
              mmLeft = 52917
              mmTop = 5556
              mmWidth = 43392
              BandType = 4
            end
            object ppDBText58: TppDBText
              UserName = 'DBText33'
              DataField = 'VLRTAXAS'
              DataPipeline = BDEMapaInvestFdoOutrosAn
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaInvestFdoOutrosAn'
              mmHeight = 2910
              mmLeft = 130704
              mmTop = 5556
              mmWidth = 21167
              BandType = 4
            end
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 7938
            mmPrintPosition = 0
            object ppLine5: TppLine
              UserName = 'Line3'
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 51594
              mmTop = 264
              mmWidth = 232568
              BandType = 7
            end
          end
        end
      end
      object ppDBText59: TppDBText
        UserName = 'ppdbVlrAplicacao2'
        DataField = 'VLRDIVIDENDO'
        DataPipeline = BDEMapaInvestFdoOutros
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdoOutros'
        mmHeight = 2647
        mmLeft = 194999
        mmTop = 794
        mmWidth = 21166
        BandType = 4
      end
      object ppDBText60: TppDBText
        UserName = 'DBText31'
        DataField = 'VLRAPLICACAO'
        DataPipeline = BDEMapaInvestFdoOutros
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdoOutros'
        mmHeight = 2646
        mmLeft = 216429
        mmTop = 794
        mmWidth = 21166
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'DBText32'
        DataField = 'VLRINTEGRALIZ'
        DataPipeline = BDEMapaInvestFdoOutros
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdoOutros'
        mmHeight = 2646
        mmLeft = 237861
        mmTop = 794
        mmWidth = 21166
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'ppdbVlrAplicacao3'
        DataField = 'VLRAMORTIZREC'
        DataPipeline = BDEMapaInvestFdoOutros
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdoOutros'
        mmHeight = 2646
        mmLeft = 173567
        mmTop = 794
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'DBText21'
        DataField = 'VLRTRANSF'
        DataPipeline = BDEMapaInvestFdoOutros
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdoOutros'
        mmHeight = 2646
        mmLeft = 194998
        mmTop = 6085
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText64: TppDBText
        UserName = 'ppdbVlrAplicacao4'
        DataField = 'VLRTAXAS'
        DataPipeline = BDEMapaInvestFdoOutros
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaInvestFdoOutros'
        mmHeight = 2646
        mmLeft = 130704
        mmTop = 6085
        mmWidth = 21167
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 14288
      mmPrintPosition = 0
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
        mmLeft = 0
        mmTop = 794
        mmWidth = 283634
        BandType = 8
      end
      object ppLabel60: TppLabel
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
        mmTop = 794
        mmWidth = 283369
        BandType = 8
      end
      object ppLine7: TppLine
        UserName = 'LineConsRentFnd2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
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
        mmLeft = 237332
        mmTop = 794
        mmWidth = 45508
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DESCTIPOFUNDOINV'
      DataPipeline = BDEMapaInvestFdoOutros
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDEMapaInvestFdoOutros'
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
    object ppGroup7: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = BDEMapaInvestFdoOutros
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDEMapaInvestFdoOutros'
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8731
        mmPrintPosition = 0
        object ppDBText66: TppDBText
          UserName = 'ppdbDescPlano1'
          DataField = 'PLANPRVCONTABPATRO'
          DataPipeline = BDEMapaInvestFdoOutros
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdoOutros'
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1852
          mmWidth = 78846
          BandType = 3
          GroupNo = 1
        end
        object ppLine12: TppLine
          UserName = 'Line12'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1588
          mmLeft = 0
          mmTop = 794
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLine13: TppLine
          UserName = 'Line13'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 7142
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'DESCSEGMENTACAO'
      DataPipeline = BDEMapaInvestFdoOutros
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDEMapaInvestFdoOutros'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object ppDBText65: TppDBText
          UserName = 'ppdbDescPlano'
          DataField = 'DESCSEGMENTACAO'
          DataPipeline = BDEMapaInvestFdoOutros
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdoOutros'
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1588
          mmWidth = 78846
          BandType = 3
          GroupNo = 0
        end
        object ppLine8: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1588
          mmLeft = 0
          mmTop = 529
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLine9: TppLine
          UserName = 'Line2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 6879
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        AfterGenerate = ppGroupFooterBand2AfterGenerate
        BeforePrint = ppGroupFooterBand2BeforePrint
        mmBottomOffset = 0
        mmHeight = 11642
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'dbSumSldAnterior'
          DataField = 'SALDOANTERIOR'
          DataPipeline = BDEMapaInvestFdoOutros
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdoOutros'
          mmHeight = 2910
          mmLeft = 126471
          mmTop = 2117
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object ppLabel61: TppLabel
          UserName = 'Label1'
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 62177
          mmTop = 2117
          mmWidth = 8202
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'dbSumVlrAplicado'
          DataField = 'VLRAPLICADO'
          DataPipeline = BDEMapaInvestFdoOutros
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdoOutros'
          mmHeight = 2910
          mmLeft = 75936
          mmTop = 2117
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'dbSumVlrVariacao'
          DataField = 'VLRVARIACAO'
          DataPipeline = BDEMapaInvestFdoOutros
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdoOutros'
          mmHeight = 2910
          mmLeft = 237861
          mmTop = 7673
          mmWidth = 21167
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'dbSumVlrAplicacao'
          DataField = 'VLRAMORTIZ'
          DataPipeline = BDEMapaInvestFdoOutros
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdoOutros'
          mmHeight = 2910
          mmLeft = 152136
          mmTop = 2117
          mmWidth = 21167
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'dbSumVlrIOF'
          DataField = 'VLRIOFPROV'
          DataPipeline = BDEMapaInvestFdoOutros
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdoOutros'
          mmHeight = 2910
          mmLeft = 259557
          mmTop = 2117
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'dbSumVlrResgate'
          DataField = 'VLRRESGATE'
          DataPipeline = BDEMapaInvestFdoOutros
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdoOutros'
          mmHeight = 2910
          mmLeft = 216430
          mmTop = 7673
          mmWidth = 21167
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'dbSumSldFundo'
          DataField = 'SALDOVLRFUNDO'
          DataPipeline = BDEMapaInvestFdoOutros
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdoOutros'
          mmHeight = 2910
          mmLeft = 259557
          mmTop = 7673
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppLine10: TppLine
          UserName = 'Line4'
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 61913
          mmTop = 529
          mmWidth = 222515
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'dbSumVlrAplicacao1'
          DataField = 'VLRDIVIDENDO'
          DataPipeline = BDEMapaInvestFdoOutros
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdoOutros'
          mmHeight = 2910
          mmLeft = 195263
          mmTop = 2117
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'VLRAPLICACAO'
          DataPipeline = BDEMapaInvestFdoOutros
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdoOutros'
          mmHeight = 2910
          mmLeft = 216430
          mmTop = 2117
          mmWidth = 21167
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'VLRINTEGRALIZ'
          DataPipeline = BDEMapaInvestFdoOutros
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdoOutros'
          mmHeight = 2910
          mmLeft = 237861
          mmTop = 2117
          mmWidth = 21167
          BandType = 5
          GroupNo = 0
        end
        object ppLine11: TppLine
          UserName = 'Line5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 11113
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'dbSumVlrAplicacao3'
          DataField = 'VLRAMORTIZREC'
          DataPipeline = BDEMapaInvestFdoOutros
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdoOutros'
          mmHeight = 2910
          mmLeft = 173567
          mmTop = 2117
          mmWidth = 21167
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLRTRANSF'
          DataPipeline = BDEMapaInvestFdoOutros
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdoOutros'
          mmHeight = 2910
          mmLeft = 195263
          mmTop = 7673
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          DataField = 'SALDOQTDCOTAS'
          DataPipeline = BDEMapaInvestFdoOutros
          DisplayFormat = '###,###,##0.000000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdoOutros'
          mmHeight = 2646
          mmLeft = 96573
          mmTop = 2117
          mmWidth = 29369
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'dbSumVlrAplicacao4'
          DataField = 'VLRTAXAS'
          DataPipeline = BDEMapaInvestFdoOutros
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaInvestFdoOutros'
          mmHeight = 2910
          mmLeft = 130704
          mmTop = 7673
          mmWidth = 21167
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
end
