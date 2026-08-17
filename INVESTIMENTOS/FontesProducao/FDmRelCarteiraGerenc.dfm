inherited DmRelCarteiraGerenc: TDmRelCarteiraGerenc
  Left = 63
  Top = 105
  Width = 647
  Height = 249
  Caption = 'dmRelCarteiraGerenc'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 689
    Top = 64
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
    Left = 689
    Top = 168
  end
  inherited qryExemplo: TwwQuery
    Left = 689
    Top = 120
  end
  inherited rpExemplo: TppReport
    Left = 689
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object pprCompCarteiraGerenc: TppReport
    AutoStop = False
    DataPipeline = pplCartGerencial
    OnStartPage = pprCompCarteiraGerencStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Composição das Carteiras Gerenciais'
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
    Left = 156
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplCartGerencial'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23548
      mmPrintPosition = 0
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmOperComum.pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 1852
        mmTop = 1058
        mmWidth = 13229
        BandType = 0
      end
      object lblCarteira: TppLabel
        UserName = 'Label1'
        Caption = 'Carteira Gerencial: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 167217
        mmTop = 15346
        mmWidth = 30427
        BandType = 0
      end
      object lblData: TppLabel
        UserName = 'lblData'
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 15346
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel218: TppLabel
        UserName = 'Label218'
        Caption = 'Consulta da Composição da Carteira Gerencial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 78581
        BandType = 0
      end
      object ppLabel219: TppLabel
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
      object lblPlano: TppLabel
        UserName = 'lblPlano'
        Caption = 'Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 188119
        mmTop = 8731
        mmWidth = 9525
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object srptRendaVariavel: TppSubReport
        UserName = 'srptRendaVariavel'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = srptEventoCota
        TraverseAllData = False
        DataPipelineName = 'pplCartGerencialDet'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppcrRV: TppChildReport
          AutoStop = False
          DataPipeline = pplCartGerencialDet
          OnStartPage = ppcrRVStartPage
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Composição das Carteiras Gerenciais'
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
          Left = 168
          Top = 184
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplCartGerencialDet'
          object pphCabRV: TppHeaderBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 10583
            mmPrintPosition = 0
            object shpCabRV: TppShape
              UserName = 'shpCabRV'
              Brush.Color = clSilver
              ParentWidth = True
              mmHeight = 8467
              mmLeft = 0
              mmTop = 2116
              mmWidth = 197300
              BandType = 0
            end
            object ppLabel5: TppLabel
              UserName = 'Label5'
              Caption = 'Investimento '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 794
              mmTop = 6615
              mmWidth = 30692
              BandType = 0
            end
            object ppLabel6: TppLabel
              UserName = 'Label6'
              Caption = 'Código ISIN'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 56092
              mmTop = 6615
              mmWidth = 15610
              BandType = 0
            end
            object ppLabel7: TppLabel
              UserName = 'Label7'
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 190236
              mmTop = 6615
              mmWidth = 6879
              BandType = 0
            end
            object ppLabel8: TppLabel
              UserName = 'Label8'
              Caption = 'Quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 152400
              mmTop = 6615
              mmWidth = 15081
              BandType = 0
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              Caption = 'Data da Cotação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              WordWrap = True
              mmHeight = 7144
              mmLeft = 123561
              mmTop = 2646
              mmWidth = 12965
              BandType = 0
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'Lote'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 91017
              mmTop = 6615
              mmWidth = 5821
              BandType = 0
            end
            object ppLabel1: TppLabel
              UserName = 'Label1'
              Caption = 'Cotação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 111654
              mmTop = 6615
              mmWidth = 10848
              BandType = 0
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
            object shpDetRV: TppShape
              OnPrint = shpDetRVPrint
              UserName = 'shpDetRV'
              ParentWidth = True
              Pen.Style = psClear
              mmHeight = 3175
              mmLeft = 0
              mmTop = 265
              mmWidth = 197300
              BandType = 4
            end
            object ppDBText2: TppDBText
              UserName = 'DBText2'
              DataField = 'INVESTIMENTO'
              DataPipeline = pplCartGerencialDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCartGerencialDet'
              mmHeight = 3175
              mmLeft = 794
              mmTop = 0
              mmWidth = 55033
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              DataField = 'CODISIN'
              DataPipeline = pplCartGerencialDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCartGerencialDet'
              mmHeight = 3175
              mmLeft = 56092
              mmTop = 0
              mmWidth = 29369
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              DataField = 'VALOR'
              DataPipeline = pplCartGerencialDet
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCartGerencialDet'
              mmHeight = 3175
              mmLeft = 170392
              mmTop = 0
              mmWidth = 26723
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'QUANTIDADE'
              DataPipeline = pplCartGerencialDet
              DisplayFormat = '###,###,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCartGerencialDet'
              mmHeight = 3175
              mmLeft = 141552
              mmTop = 0
              mmWidth = 25929
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'COTACAO'
              DataPipeline = pplCartGerencialDet
              DisplayFormat = '###,###,###,##0.000000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCartGerencialDet'
              mmHeight = 3175
              mmLeft = 97896
              mmTop = 0
              mmWidth = 24871
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              DataField = 'LOTE'
              DataPipeline = pplCartGerencialDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCartGerencialDet'
              mmHeight = 3175
              mmLeft = 85725
              mmTop = 0
              mmWidth = 11113
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              DataField = 'DATAMOVCARTINV'
              DataPipeline = pplCartGerencialDet
              DisplayFormat = 'DD/MM/YYYY'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCartGerencialDet'
              mmHeight = 3175
              mmLeft = 123561
              mmTop = 0
              mmWidth = 15875
              BandType = 4
            end
          end
          object ppFooterBand2: TppFooterBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 8731
            mmPrintPosition = 0
            object ppDBCalc1: TppDBCalc
              UserName = 'DBCalc1'
              DataField = 'VALOR'
              DataPipeline = pplCartGerencialDet
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCartGerencialDet'
              mmHeight = 3175
              mmLeft = 166952
              mmTop = 1058
              mmWidth = 30692
              BandType = 7
            end
            object ppLine3: TppLine
              UserName = 'Line3'
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 265
              mmTop = 529
              mmWidth = 197380
              BandType = 7
            end
          end
        end
      end
      object srptEventoCota: TppSubReport
        UserName = 'srptEventoCota'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = srptEventoCaixa
        TraverseAllData = False
        DataPipelineName = 'pplCartGerencialDet'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppcrEventoCota: TppChildReport
          AutoStop = False
          DataPipeline = pplCartGerencialDet
          OnStartPage = ppcrEventoCotaStartPage
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Composição das Carteiras Gerenciais'
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
          Left = 480
          Top = 496
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplCartGerencialDet'
          object pphCabEventoCota: TppHeaderBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object shpCabEventoCota: TppShape
              UserName = 'shpCabEventoCota'
              Brush.Color = clSilver
              ParentWidth = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 0
            end
            object ppLabel17: TppLabel
              UserName = 'Label17'
              Caption = 'Evento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 794
              mmTop = 529
              mmWidth = 9260
              BandType = 0
            end
            object ppLabel18: TppLabel
              UserName = 'Label18'
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 189177
              mmTop = 529
              mmWidth = 6879
              BandType = 0
            end
          end
          object ppDetailBand4: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 7938
            mmPrintPosition = 0
            object shpDetEventoCota: TppShape
              OnPrint = shpDetEventoCotaPrint
              UserName = 'shpDetEventoCota'
              ParentWidth = True
              Pen.Style = psClear
              mmHeight = 4233
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              DataField = 'INVESTIMENTO'
              DataPipeline = pplCartGerencialDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCartGerencialDet'
              mmHeight = 3175
              mmLeft = 794
              mmTop = 265
              mmWidth = 119063
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              DataField = 'VALOR'
              DataPipeline = pplCartGerencialDet
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCartGerencialDet'
              mmHeight = 3175
              mmLeft = 149225
              mmTop = 265
              mmWidth = 47361
              BandType = 4
            end
            object srptAnalitico: TppSubReport
              OnPrint = srptAnaliticoPrint
              UserName = 'srptAnalitico'
              DrillDownComponent = ppDBText15
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              ParentWidth = False
              TraverseAllData = False
              DataPipelineName = 'pplAnaliticoCompra'
              mmHeight = 4233
              mmLeft = 17727
              mmTop = 3704
              mmWidth = 178859
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppChildReport3: TppChildReport
                AutoStop = False
                DataPipeline = pplAnaliticoCompra
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'Composição das Carteiras Gerenciais'
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
                Left = 264
                Top = 120
                Version = '7.04'
                mmColumnWidth = 0
                DataPipelineName = 'pplAnaliticoCompra'
                object ppTitleBand1: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 794
                  mmPrintPosition = 0
                end
                object ppDBAnalitico: TppDetailBand
                  BeforePrint = ppDBAnaliticoBeforePrint
                  mmBottomOffset = 0
                  mmHeight = 4233
                  mmPrintPosition = 0
                  object ppsAnalitico: TppShape
                    UserName = 'ppsAnalitico'
                    Pen.Style = psClear
                    mmHeight = 4233
                    mmLeft = 265
                    mmTop = 0
                    mmWidth = 178065
                    BandType = 4
                  end
                  object DbtBoleta: TppDBText
                    UserName = 'DbtBoleta'
                    DataField = 'NUMDOCUMENTO'
                    DataPipeline = pplAnaliticoCompra
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'pplAnaliticoCompra'
                    mmHeight = 4233
                    mmLeft = 2381
                    mmTop = 0
                    mmWidth = 18256
                    BandType = 4
                  end
                  object DbtInv: TppDBText
                    UserName = 'DbtInv'
                    DataField = 'DESCINVESTIMENTO'
                    DataPipeline = pplAnaliticoCompra
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'pplAnaliticoCompra'
                    mmHeight = 4233
                    mmLeft = 21431
                    mmTop = 0
                    mmWidth = 38365
                    BandType = 4
                  end
                  object DbtQtd: TppDBText
                    UserName = 'DbtQtd'
                    DataField = 'QTDE'
                    DataPipeline = pplAnaliticoCompra
                    DisplayFormat = '#,##0'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'pplAnaliticoCompra'
                    mmHeight = 4233
                    mmLeft = 80433
                    mmTop = 0
                    mmWidth = 23283
                    BandType = 4
                  end
                  object DbtPreco: TppDBText
                    UserName = 'DbtPreco'
                    DataField = 'PRECO'
                    DataPipeline = pplAnaliticoCompra
                    DisplayFormat = '#,##0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'pplAnaliticoCompra'
                    mmHeight = 4233
                    mmLeft = 104511
                    mmTop = 0
                    mmWidth = 23283
                    BandType = 4
                  end
                  object DbtValor: TppDBText
                    UserName = 'DbtValor'
                    DataField = 'VLROPERACAO'
                    DataPipeline = pplAnaliticoCompra
                    DisplayFormat = '#,##0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'pplAnaliticoCompra'
                    mmHeight = 4233
                    mmLeft = 154252
                    mmTop = 0
                    mmWidth = 23813
                    BandType = 4
                  end
                  object DbtRateio: TppDBText
                    UserName = 'DbtRateio'
                    DataField = 'RATEIO'
                    DataPipeline = pplAnaliticoCompra
                    DisplayFormat = '#,##0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'pplAnaliticoCompra'
                    mmHeight = 4233
                    mmLeft = 60590
                    mmTop = 0
                    mmWidth = 18785
                    BandType = 4
                  end
                  object DbtTotQtd: TppDBText
                    UserName = 'DbtTotQtd'
                    DataField = 'TOTQTD'
                    DataPipeline = pplAnaliticoCompra
                    DisplayFormat = '#,##0'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'pplAnaliticoCompra'
                    mmHeight = 4233
                    mmLeft = 128588
                    mmTop = 0
                    mmWidth = 25135
                    BandType = 4
                  end
                  object DbtTotDesp: TppDBText
                    UserName = 'DbtTotDesp'
                    DataField = 'TOTDESP'
                    DataPipeline = pplAnaliticoCompra
                    DisplayFormat = '#,##0'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'pplAnaliticoCompra'
                    mmHeight = 4233
                    mmLeft = 153988
                    mmTop = 0
                    mmWidth = 24077
                    BandType = 4
                  end
                end
                object ppSummaryBand5: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 2646
                  mmPrintPosition = 0
                  object ppLine6: TppLine
                    UserName = 'Line6'
                    Weight = 0.75
                    mmHeight = 1058
                    mmLeft = 794
                    mmTop = 0
                    mmWidth = 177271
                    BandType = 7
                  end
                end
                object ppGroup2: TppGroup
                  BreakName = 'DATAOPERACAO'
                  DataPipeline = pplAnaliticoCompra
                  KeepTogether = True
                  OutlineSettings.CreateNode = True
                  UserName = 'Group2'
                  mmNewColumnThreshold = 0
                  mmNewPageThreshold = 0
                  DataPipelineName = 'pplAnaliticoCompra'
                  object ppGroupHeaderBand1: TppGroupHeaderBand
                    mmBottomOffset = 0
                    mmHeight = 11377
                    mmPrintPosition = 0
                    object ppShape6: TppShape
                      UserName = 'shpCabRV1'
                      Brush.Color = clSilver
                      mmHeight = 5821
                      mmLeft = 0
                      mmTop = 5292
                      mmWidth = 179123
                      BandType = 3
                      GroupNo = 0
                    end
                    object LbBoleta: TppLabel
                      UserName = 'LbBoleta'
                      AutoSize = False
                      Caption = 'Boleta'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 8
                      Font.Style = [fsBold]
                      Transparent = True
                      mmHeight = 3175
                      mmLeft = 2381
                      mmTop = 6615
                      mmWidth = 18256
                      BandType = 3
                      GroupNo = 0
                    end
                    object LbInv: TppLabel
                      UserName = 'LbInv'
                      AutoSize = False
                      Caption = 'Investimento'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 8
                      Font.Style = [fsBold]
                      Transparent = True
                      mmHeight = 3175
                      mmLeft = 21431
                      mmTop = 6615
                      mmWidth = 38100
                      BandType = 3
                      GroupNo = 0
                    end
                    object LbQtd: TppLabel
                      UserName = 'LbQtd'
                      AutoSize = False
                      Caption = 'Quantidade'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 8
                      Font.Style = [fsBold]
                      TextAlignment = taRightJustified
                      Transparent = True
                      mmHeight = 3175
                      mmLeft = 80433
                      mmTop = 6615
                      mmWidth = 23283
                      BandType = 3
                      GroupNo = 0
                    end
                    object LbPreco: TppLabel
                      UserName = 'LbPreco'
                      AutoSize = False
                      Caption = 'Preço'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 8
                      Font.Style = [fsBold]
                      TextAlignment = taRightJustified
                      Transparent = True
                      mmHeight = 3175
                      mmLeft = 104775
                      mmTop = 6615
                      mmWidth = 23019
                      BandType = 3
                      GroupNo = 0
                    end
                    object LbValor: TppLabel
                      UserName = 'LbValor'
                      AutoSize = False
                      Caption = 'Valor'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 8
                      Font.Style = [fsBold]
                      TextAlignment = taRightJustified
                      Transparent = True
                      mmHeight = 3175
                      mmLeft = 155046
                      mmTop = 6615
                      mmWidth = 22490
                      BandType = 3
                      GroupNo = 0
                    end
                    object LbRateio: TppLabel
                      UserName = 'LbRateio'
                      AutoSize = False
                      Caption = 'Rateio'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 8
                      Font.Style = [fsBold]
                      TextAlignment = taRightJustified
                      Transparent = True
                      mmHeight = 3175
                      mmLeft = 60325
                      mmTop = 6615
                      mmWidth = 19050
                      BandType = 3
                      GroupNo = 0
                    end
                    object LbTotQtd: TppLabel
                      UserName = 'LbTotQtd'
                      AutoSize = False
                      Caption = 'Total Qtde.'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 8
                      Font.Style = [fsBold]
                      TextAlignment = taRightJustified
                      Transparent = True
                      mmHeight = 3175
                      mmLeft = 132027
                      mmTop = 6615
                      mmWidth = 21696
                      BandType = 3
                      GroupNo = 0
                    end
                    object LbTotDesp: TppLabel
                      UserName = 'LbTotDesp'
                      AutoSize = False
                      Caption = 'Total Desp.'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 8
                      Font.Style = [fsBold]
                      TextAlignment = taRightJustified
                      Transparent = True
                      mmHeight = 3175
                      mmLeft = 155046
                      mmTop = 6615
                      mmWidth = 22490
                      BandType = 3
                      GroupNo = 0
                    end
                    object ppDBText9: TppDBText
                      UserName = 'DBText9'
                      DataField = 'DATAOPERACAO'
                      DataPipeline = pplAnaliticoCompra
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 8
                      Font.Style = [fsBold, fsItalic]
                      Transparent = True
                      DataPipelineName = 'pplAnaliticoCompra'
                      mmHeight = 3440
                      mmLeft = 2381
                      mmTop = 794
                      mmWidth = 29369
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
            end
          end
          object ppFooterBand4: TppFooterBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
          end
          object ppSummaryBand4: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object ppDBCalc2: TppDBCalc
              UserName = 'DBCalc2'
              DataField = 'VALOR'
              DataPipeline = pplCartGerencialDet
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCartGerencialDet'
              mmHeight = 3175
              mmLeft = 165894
              mmTop = 1058
              mmWidth = 30692
              BandType = 7
            end
            object ppLine4: TppLine
              UserName = 'Line4'
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 265
              mmTop = 529
              mmWidth = 197380
              BandType = 7
            end
          end
        end
      end
      object srptEventoCaixa: TppSubReport
        UserName = 'srptEventoCaixa'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplCartGerencialDet'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = pplCartGerencialDet
          OnStartPage = ppcrEventoCotaStartPage
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Composição das Carteiras Gerenciais'
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
          Left = 480
          Top = 496
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplCartGerencialDet'
          object pphCabEventoCaixa: TppHeaderBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object shpCabEventoCaixa: TppShape
              UserName = 'shpCabEventoCaixa'
              Brush.Color = clSilver
              ParentWidth = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 0
            end
            object ppLabel23: TppLabel
              UserName = 'Label17'
              Caption = 'Evento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 794
              mmTop = 529
              mmWidth = 9260
              BandType = 0
            end
            object ppLabel24: TppLabel
              UserName = 'Label18'
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 130704
              mmTop = 529
              mmWidth = 6879
              BandType = 0
            end
            object ppLabel25: TppLabel
              UserName = 'Label25'
              Caption = 'Saldo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 189177
              mmTop = 529
              mmWidth = 7408
              BandType = 0
            end
          end
          object ppDetailBand6: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object shpDetEventoCaixa: TppShape
              OnPrint = shpDetEventoCotaPrint
              UserName = 'shpDetEventoCaixa'
              ParentWidth = True
              Pen.Style = psClear
              mmHeight = 3175
              mmLeft = 0
              mmTop = 529
              mmWidth = 197300
              BandType = 4
            end
            object ppShape2: TppShape
              OnPrint = ppShape2Print
              UserName = 'shpDetRV1'
              Brush.Color = clSilver
              ParentWidth = True
              Pen.Style = psClear
              mmHeight = 4233
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText1'
              DataField = 'INVESTIMENTO'
              DataPipeline = pplCartGerencialDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCartGerencialDet'
              mmHeight = 3175
              mmLeft = 794
              mmTop = 529
              mmWidth = 87842
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText2'
              DataField = 'VALOR'
              DataPipeline = pplCartGerencialDet
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCartGerencialDet'
              mmHeight = 3175
              mmLeft = 90223
              mmTop = 529
              mmWidth = 47361
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              DataField = 'SALDO'
              DataPipeline = pplCartGerencialDet
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCartGerencialDet'
              mmHeight = 3175
              mmLeft = 149225
              mmTop = 529
              mmWidth = 47361
              BandType = 4
            end
            object ppLine5: TppLine
              UserName = 'Line5'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 0
              mmTop = 4233
              mmWidth = 197115
              BandType = 4
            end
          end
          object ppFooterBand5: TppFooterBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 6615
            mmPrintPosition = 0
          end
        end
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
    object ppSummaryBand2: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object srptResumo: TppSubReport
        OnPrint = srptResumoPrint
        UserName = 'srptResumo'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplResumoCota'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplResumoCota
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Composição das Carteiras Gerenciais'
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
          Left = 104
          Top = 120
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplResumoCota'
          object pptResumo: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 21167
            mmPrintPosition = 0
            object ppShape3: TppShape
              UserName = 'Shape1'
              mmHeight = 20902
              mmLeft = 0
              mmTop = 265
              mmWidth = 197380
              BandType = 1
            end
            object shpSaldo: TppShape
              UserName = 'shpSaldo'
              Brush.Color = 14935011
              Pen.Style = psClear
              mmHeight = 5292
              mmLeft = 529
              mmTop = 7938
              mmWidth = 196586
              BandType = 1
            end
            object ppLabel19: TppLabel
              UserName = 'Label19'
              Caption = 'Patrimônio Final'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 25400
              mmTop = 2117
              mmWidth = 28046
              BandType = 1
            end
            object ppLabel26: TppLabel
              UserName = 'Label26'
              Caption = 'Quantidade de Cotas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 25400
              mmTop = 8467
              mmWidth = 35719
              BandType = 1
            end
            object ppLabel27: TppLabel
              UserName = 'Label27'
              Caption = 'Valor da Cota'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 25400
              mmTop = 14817
              mmWidth = 23019
              BandType = 1
            end
            object ppLValorPl: TppLabel
              UserName = 'LValorPl'
              Caption = 'LValorPl'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 180711
              mmTop = 2381
              mmWidth = 14552
              BandType = 1
            end
            object ppLQtdCotas: TppLabel
              UserName = 'LQtdCotas'
              Caption = 'LQtdCotas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 177007
              mmTop = 8467
              mmWidth = 18256
              BandType = 1
            end
            object ppLValorCota: TppLabel
              UserName = 'LValorCota'
              Caption = 'LValorCota'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 176213
              mmTop = 14817
              mmWidth = 19050
              BandType = 1
            end
          end
          object ppDetailBand5: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 11113
            mmPrintPosition = 0
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 49742
            mmPrintPosition = 0
            object ppShape4: TppShape
              UserName = 'Shape2'
              mmHeight = 24871
              mmLeft = 265
              mmTop = 4763
              mmWidth = 197115
              BandType = 7
            end
            object ppLabel21: TppLabel
              UserName = 'Label21'
              Caption = 'Cota'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 25400
              mmTop = 11906
              mmWidth = 7938
              BandType = 7
            end
            object ppDBText19: TppDBText
              UserName = 'DBText19'
              DataField = 'VLRZMES'
              DataPipeline = pplRentabilidade
              DisplayFormat = '###,###,###,##0.0000%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplRentabilidade'
              mmHeight = 4233
              mmLeft = 111919
              mmTop = 11906
              mmWidth = 37835
              BandType = 7
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              DataField = 'VLRZANO'
              DataPipeline = pplRentabilidade
              DisplayFormat = '###,###,###,##0.0000%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplRentabilidade'
              mmHeight = 4233
              mmLeft = 160602
              mmTop = 11906
              mmWidth = 34660
              BandType = 7
            end
            object shpRentPriIndicador: TppShape
              UserName = 'shpRentPriIndicador'
              Brush.Color = 14935011
              Pen.Style = psClear
              mmHeight = 5292
              mmLeft = 529
              mmTop = 16933
              mmWidth = 196586
              BandType = 7
            end
            object lblNomePriIndicador: TppLabel
              UserName = 'lblNomePriIndicador'
              Caption = 'Primeiro Indicador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 25400
              mmTop = 17463
              mmWidth = 31485
              BandType = 7
            end
            object lblVarPriIndMensal: TppLabel
              UserName = 'lblVarPriIndMensal'
              Caption = 'Mensal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 137848
              mmTop = 17463
              mmWidth = 11906
              BandType = 7
            end
            object lblVarPriIndAnual: TppLabel
              UserName = 'lblVarPriIndAnual'
              Caption = 'Anual'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 185473
              mmTop = 17463
              mmWidth = 9790
              BandType = 7
            end
            object lblNomeSegIndicador: TppLabel
              UserName = 'lnlNomePriIndicador1'
              Caption = 'Segundo Indicador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 25400
              mmTop = 22490
              mmWidth = 32544
              BandType = 7
            end
            object lblVarSegIndMensal: TppLabel
              UserName = 'lblVarPriIndMensal1'
              Caption = 'Mensal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 137848
              mmTop = 22490
              mmWidth = 11906
              BandType = 7
            end
            object lblVarSegIndAnual: TppLabel
              UserName = 'lblVarPriIndAnual1'
              Caption = 'Anual'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 185473
              mmTop = 22490
              mmWidth = 9790
              BandType = 7
            end
            object ppShape5: TppShape
              UserName = 'shpRentPriIndicador1'
              Brush.Color = clSilver
              Pen.Style = psClear
              mmHeight = 5556
              mmLeft = 529
              mmTop = 5027
              mmWidth = 196586
              BandType = 7
            end
            object ppLabel4: TppLabel
              UserName = 'Label1'
              Caption = 'Mensal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 137848
              mmTop = 5556
              mmWidth = 11906
              BandType = 7
            end
            object ppLabel22: TppLabel
              UserName = 'Label22'
              Caption = 'Anual'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 185473
              mmTop = 5556
              mmWidth = 9790
              BandType = 7
            end
            object ppLine1: TppLine
              UserName = 'Line1'
              Weight = 0.75
              mmHeight = 1852
              mmLeft = 265
              mmTop = 10319
              mmWidth = 196850
              BandType = 7
            end
            object ppLabel11: TppLabel
              UserName = 'Label2'
              Caption = 'Diária'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 94456
              mmTop = 5556
              mmWidth = 9790
              BandType = 7
            end
            object ppDBText1: TppDBText
              UserName = 'DBText1'
              DataField = 'VLRZDIA'
              DataPipeline = pplRentabilidade
              DisplayFormat = '###,###,###,##0.0000%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplRentabilidade'
              mmHeight = 4233
              mmLeft = 66411
              mmTop = 11906
              mmWidth = 37835
              BandType = 7
            end
            object ppShape1: TppShape
              UserName = 'Shape3'
              mmHeight = 4498
              mmLeft = 265
              mmTop = 0
              mmWidth = 197115
              BandType = 7
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              Caption = 'RENTABILIDADE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 795
              mmTop = 529
              mmWidth = 22490
              BandType = 7
            end
          end
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'TIPOREL'
      DataPipeline = pplCartGerencial
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCartGerencial'
      object ppbCabTipoRel: TppGroupHeaderBand
        BeforePrint = ppbCabTipoRelBeforePrint
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object shpCabecalho: TppShape
          UserName = 'shpCabecalho'
          ParentWidth = True
          mmHeight = 4498
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppdbNomeRel: TppDBText
          UserName = 'dbNomeRel'
          DataField = 'NOMEREL'
          DataPipeline = pplCartGerencial
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplCartGerencial'
          mmHeight = 3175
          mmLeft = 794
          mmTop = 529
          mmWidth = 67469
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
  object pplCartGerencial: TppBDEPipeline
    DataSource = dsCartGerencial
    UserName = 'lCartGerencial'
    Left = 61
    Top = 72
  end
  object qryCartGerencial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  1                  AS TIPOREL,'
      '  '#39'RENDA VARIÁVEL '#39'  AS NOMEREL,'
      '  H1.IDCARTEIRAINVEST'
      'FROM'
      '   HISTCARTINV H1,'
      '   INVESTIMENTO IV, ACOESXBOLSA AB, CARTEIRAINVEST CA'
      'WHERE'
      '    (H1.IDHISTCARTINV  IN'
      '       (SELECT MAX(H2.IDHISTCARTINV)'
      '        FROM  HISTCARTINV H2'
      '        WHERE'
      
        '        ((H2.IDTIPOINVEST||H2.IDPLANPREVCTBPATR||H2.IDCARTEIRAIN' +
        'VEST||H2.IDCARTEIRAGERENC||H2.IDINVESTIMENTO||H2.DATAMOVCARTINV)' +
        ' IN'
      
        '            (SELECT (H3.IDTIPOINVEST||H3.IDPLANPREVCTBPATR||H3.I' +
        'DCARTEIRAINVEST||H3.IDCARTEIRAGERENC||H3.IDINVESTIMENTO||MAX(H3.' +
        'DATAMOVCARTINV))'
      '             FROM HISTCARTINV H3'
      '             WHERE'
      '                 (H3.IDTIPOINVEST      = 2)'
      
        '             AND  ((:IDPLANPREVCTBPATR IS NULL) OR (H3.IDPLANPRE' +
        'VCTBPATR = :IDPLANPREVCTBPATR))'
      '             AND (H3.IDCARTEIRAINVEST > 0)'
      
        '             AND  ((:IDCARTEIRAGERENC  IS NULL) OR (H3.IDCARTEIR' +
        'AGERENC  = :IDCARTEIRAGERENC))'
      '             AND (H3.IDINVESTIMENTO   > 0)'
      
        '             AND (H3.DATAMOVCARTINV   <= TO_DATE(:DATA,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '             GROUP BY H3.IDTIPOINVEST, H3.IDPLANPREVCTBPATR, H3.' +
        'IDCARTEIRAINVEST, H3.IDCARTEIRAGERENC, H3.IDINVESTIMENTO) )'
      '        GROUP BY H2.IDINVESTIMENTO))'
      'AND (NVL(H1.SALDOQTDEINVCART,0) > 0)'
      'AND     (H1.IDINVESTIMENTO    = IV.IDINVESTIMENTO(+))'
      'AND     (H1.IDCARTEIRAINVEST  = CA.IDCARTEIRAINVEST(+))'
      'AND     (AB.IDACAO(+)         = H1.IDINVESTIMENTO)'
      ''
      'UNION'
      ''
      'SELECT DISTINCT'
      
        '  3                                                             ' +
        ' AS TIPOREL,'
      
        '  '#39'VALORES A PAGAR/RECEBER'#39'                                     ' +
        ' AS NOMEREL,'
      '  IDCARTEIRAINVEST'
      'FROM'
      '('
      'SELECT'
      '     HC.IDCARTEIRAINVEST'
      'FROM HISTCARTINV HC, OPERACAOINVEST OI'
      'WHERE'
      '    (OI.IDTIPOINVEST      = 2)'
      
        'AND  ((:IDPLANPREVCTBPATR IS NULL) OR (OI.IDPLANPREVCTBPATR = :I' +
        'DPLANPREVCTBPATR))'
      'AND (OI.IDCARTEIRAINVEST >  0)'
      
        'AND  ((:IDCARTEIRAGERENC  IS NULL) OR (OI.IDCARTEIRAGERENC  = :I' +
        'DCARTEIRAGERENC))'
      'AND (OI.IDINVESTIMENTO   >  0)'
      'AND (OI.DATAVENCOPER     >  TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))'
      'AND (OI.IDOPERACAODIREITO IS NULL)'
      'AND (HC.IDOPERACAOINVEST  = OI.IDOPERACAOINVEST)'
      'AND (HC.TIPMOVCARTINV     = '#39'OPE'#39')'
      ''
      'UNION'
      ''
      'SELECT'
      '      HC.IDCARTEIRAINVEST'
      'FROM   HISTCARTINV HC,  OPERACAOINVEST OI'
      'WHERE'
      '    (OI.IDTIPOINVEST      = 2)'
      
        'AND  ((:IDPLANPREVCTBPATR IS NULL) OR (OI.IDPLANPREVCTBPATR = :I' +
        'DPLANPREVCTBPATR))'
      'AND (OI.IDCARTEIRAINVEST >  0)'
      
        'AND  ((:IDCARTEIRAGERENC  IS NULL) OR (OI.IDCARTEIRAGERENC  = :I' +
        'DCARTEIRAGERENC))'
      'AND (OI.IDINVESTIMENTO   >  0)'
      'AND (OI.DATAVENCOPER     >  TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))'
      'AND (OI.IDOPERACAODIREITO IS NULL)'
      'AND (HC.IDOPERACAOINVEST  = OI.IDOPERACAOINVEST)'
      'AND (HC.TIPMOVCARTINV     = '#39'DOP'#39')'
      ''
      'UNION'
      ''
      'SELECT'
      '       HP.IDCARTEIRAINVEST'
      
        'FROM   HISTPROVISAO HP, OPERDIREITOXINV OXV, OPERACAODIREITO OD,' +
        ' INVESTIMENTO IV,'
      '       CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC,'
      '        (SELECT OP.IDOPERACAODIREITO, OP.DATAOPERACAO'
      '         FROM   OPERACAOINVEST OP'
      '         WHERE'
      '              (OP.IDTIPOINVEST      = 2)'
      
        '         AND   ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCT' +
        'BPATR = :IDPLANPREVCTBPATR))'
      '         AND  (OP.IDCARTEIRAINVEST >  0)'
      
        '         AND   ((:IDCARTEIRAGERENC  IS NULL) OR (OP.IDCARTEIRAGE' +
        'RENC  = :IDCARTEIRAGERENC))'
      
        '         AND ((OP.DATAOPERACAO     > TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')' +
        ') OR (OP.DATAOPERACAO IS NULL))  ) OI'
      'WHERE'
      
        '     ((:IDPLANPREVCTBPATR IS NULL) OR (HP.IDPLANPREVCTBPATR = :I' +
        'DPLANPREVCTBPATR))'
      'AND (HP.IDCARTEIRAINVEST  >  0)'
      
        'AND  ((:IDCARTEIRAGERENC  IS NULL) OR (HP.IDCARTEIRAGERENC  = :I' +
        'DCARTEIRAGERENC))'
      'AND (HP.DATAHISTPROVISAO  >  TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))'
      'AND  CX.IDCARTEIRAXEVENTO  = HP.IDCARTEIRAXEVENTO'
      'AND  EC.IDEVENTOCAIXACOTA  = CX.IDEVENTOCAIXACOTA'
      'AND OXV.IDOPERACAODIREITO  = HP.IDOPERACAODIREITO'
      'AND  IV.IDINVESTIMENTO     = OXV.IDINVESTIMENTO'
      'AND  OD.IDOPERACAODIREITO  = OXV.IDOPERACAODIREITO'
      'AND  OXV.IDOPERACAODIREITO = OI.IDOPERACAODIREITO(+)'
      ')'
      ''
      'UNION'
      ''
      'SELECT DISTINCT'
      
        '  4                                                             ' +
        ' AS TIPOREL,'
      
        '  '#39'SALDO DE CAIXA'#39'                                              ' +
        ' AS NOMEREL,'
      '  HC.IDCARTEIRAINVEST'
      ''
      'FROM HISTCAIXA HC, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC'
      'WHERE'
      
        '     ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPREVCTBPATR = :I' +
        'DPLANPREVCTBPATR))'
      'AND (HC.IDCARTEIRAINVEST >  0)'
      
        'AND  ((:IDCARTEIRAGERENC  IS NULL) OR (HC.IDCARTEIRAGERENC  = :I' +
        'DCARTEIRAGERENC))'
      'AND  HC.DATAHISTCAIXA     = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')'
      'AND  HC.VLRHISTCAIXA     > 0'
      'AND  HC.IDCARTEIRAXEVENTO = CX.IDCARTEIRAXEVENTO'
      'AND  CX.IDEVENTOCAIXACOTA = EC.IDEVENTOCAIXACOTA'
      ''
      'UNION'
      ''
      'SELECT'
      '  5 AS TIPOREL,'
      '  '#39'RESUMO         '#39' AS NOMEREL,'
      '  0 AS IDCARTEIRAINVEST'
      'FROM DUAL'
      ''
      'ORDER BY TIPOREL'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 61
    Top = 120
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end>
    object qryCartGerencialTIPOREL: TFloatField
      FieldName = 'TIPOREL'
    end
    object qryCartGerencialNOMEREL: TStringField
      FieldName = 'NOMEREL'
      FixedChar = True
      Size = 14
    end
  end
  object dsCartGerencial: TwwDataSource
    AutoEdit = False
    DataSet = qryCartGerencial
    Left = 61
    Top = 168
  end
  object pplCartGerencialDet: TppBDEPipeline
    DataSource = dsCartGerencialDet
    UserName = 'pplCartGerencialDet'
    Left = 157
    Top = 64
  end
  object qryCartGerencialDet: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      '--- RENDA VARIAVEL ---'
      'SELECT DISTINCT'
      
        '   DECODE(:VARGROUP,'#39'S'#39','#39'1'#39', H1.ROWID)                          ' +
        ' AS IDGROUP,'
      '   1                          AS TIPOREL,'
      '   CA.DESCCARTINVEST          AS CARTEIRA,'
      '   IV.CODISIN                 AS CODISIN,'
      '   IV.DESCINVESTIMENTO        AS INVESTIMENTO,'
      
        '   TO_DATE('#39#39','#39'DD/MM/YYYY'#39')                                     ' +
        '  AS DATAOPER,'
      '   H1.SALDOVLRINVCART         AS VALOR,'
      '   0 AS SALDO,'
      '   NVL(H1.SALDOQTDEINVCART,0) AS QUANTIDADE,'
      '   COTACAOINVEST.COTACAO,'
      '   H1.DATAMOVCARTINV,'
      '   AB.QTDELOTE                AS LOTE,'
      '   H1.IDCARTEIRAINVEST,'
      '   H1.IDINVESTIMENTO,'
      '   H1.IDLOTE,'
      
        '   '#39'                                                            ' +
        #39' AS OPERACAO,'
      
        '   TO_DATE('#39#39','#39'DD/MM/YYYY'#39')                                     ' +
        '  AS VENCIMENTO,'
      
        '   '#39'          '#39'                                                 ' +
        '  AS CORRETORA,'
      '   0 AS IDCOR,'
      '   0 AS IDEVENTOCAIXACOTA,'
      '   0 AS IDHISTCAIXA,'
      '   0 AS REG,'
      '   SALDOCART.SALDOTOTAL'
      'FROM'
      
        '   HISTCARTINV H1, INVESTIMENTO IV, ACOESXBOLSA AB, CARTEIRAINVE' +
        'ST CA,'
      '  ('
      '   SELECT'
      '      SUM(H1.SALDOVLRINVCART) AS SALDOTOTAL'
      '   FROM'
      '      HISTCARTINV H1'
      '   WHERE'
      '    (H1.IDHISTCARTINV  IN'
      '       (SELECT MAX(H2.IDHISTCARTINV)'
      '        FROM  HISTCARTINV H2'
      '        WHERE'
      
        '        ((H2.IDTIPOINVEST||H2.IDPLANPREVCTBPATR||H2.IDCARTEIRAIN' +
        'VEST||H2.IDCARTEIRAGERENC||H2.IDINVESTIMENTO||H2.DATAMOVCARTINV)' +
        ' IN'
      
        '               (SELECT (H3.IDTIPOINVEST||H3.IDPLANPREVCTBPATR||H' +
        '3.IDCARTEIRAINVEST||H3.IDCARTEIRAGERENC||H3.IDINVESTIMENTO||MAX(' +
        'H3.DATAMOVCARTINV))'
      '                FROM HISTCARTINV H3'
      '                WHERE'
      '                    (H3.IDTIPOINVEST      = 2)'
      
        '                AND  ((:IDPLANPREVCTBPATR IS NULL) OR (H3.IDPLAN' +
        'PREVCTBPATR = :IDPLANPREVCTBPATR))'
      '                AND (H3.IDCARTEIRAINVEST > 0)'
      
        '                AND  ((:IDCARTEIRAGERENC  IS NULL) OR (H3.IDCART' +
        'EIRAGERENC  = :IDCARTEIRAGERENC))'
      '                AND (H3.IDINVESTIMENTO   > 0)'
      
        '                AND (H3.DATAMOVCARTINV   <= TO_DATE(:DATAINI,'#39'DD' +
        '/MM/YYYY'#39'))'
      
        '                GROUP BY H3.IDTIPOINVEST, H3.IDPLANPREVCTBPATR, ' +
        'H3.IDCARTEIRAINVEST, H3.IDCARTEIRAGERENC, H3.IDINVESTIMENTO) )'
      '        GROUP BY H2.IDINVESTIMENTO))'
      '   AND (NVL(H1.SALDOQTDEINVCART,0) > 0)   ) SALDOCART,'
      ''
      '  (SELECT DATACOTACAO,'
      
        '          DECODE(NVL(QTDTITLOTE,0),0,VLRCONTABIL,(VLRCONTABIL/QT' +
        'DTITLOTE)) AS COTACAO,'
      '          IDINVESTIMENTO'
      '   FROM   COTACAOINVEST'
      '   WHERE (IDINVESTIMENTO||DATACOTACAO) IN'
      '         (SELECT (IDINVESTIMENTO||MAX(DATACOTACAO))'
      '          FROM    COTACAOINVEST'
      
        '          WHERE  (DATACOTACAO   <=TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')' +
        ')'
      '          GROUP BY IDINVESTIMENTO)) COTACAOINVEST'
      'WHERE'
      ''
      ' (H1.IDHISTCARTINV  IN'
      '    (SELECT MAX(H2.IDHISTCARTINV)'
      '     FROM  HISTCARTINV H2'
      '     WHERE'
      
        '     ((H2.IDTIPOINVEST||H2.IDPLANPREVCTBPATR||H2.IDCARTEIRAINVES' +
        'T||H2.IDCARTEIRAGERENC||H2.IDINVESTIMENTO||H2.DATAMOVCARTINV) IN'
      
        '            (SELECT (H3.IDTIPOINVEST||H3.IDPLANPREVCTBPATR||H3.I' +
        'DCARTEIRAINVEST||H3.IDCARTEIRAGERENC||H3.IDINVESTIMENTO||MAX(H3.' +
        'DATAMOVCARTINV))'
      '             FROM HISTCARTINV H3'
      '             WHERE'
      '                 (H3.IDTIPOINVEST      = 2)'
      
        '             AND  ((:IDPLANPREVCTBPATR IS NULL) OR (H3.IDPLANPRE' +
        'VCTBPATR = :IDPLANPREVCTBPATR))'
      '             AND (H3.IDCARTEIRAINVEST > 0)'
      
        '             AND  ((:IDCARTEIRAGERENC  IS NULL) OR (H3.IDCARTEIR' +
        'AGERENC  = :IDCARTEIRAGERENC))'
      '             AND (H3.IDINVESTIMENTO   > 0)'
      
        '             AND (H3.DATAMOVCARTINV   <= TO_DATE(:DATAINI,'#39'DD/MM' +
        '/YYYY'#39'))'
      
        '             GROUP BY H3.IDTIPOINVEST, H3.IDPLANPREVCTBPATR, H3.' +
        'IDCARTEIRAINVEST, H3.IDCARTEIRAGERENC, H3.IDINVESTIMENTO) )'
      '     GROUP BY H2.IDINVESTIMENTO))'
      'AND (NVL(H1.SALDOQTDEINVCART,0) > 0)'
      'AND (H1.IDINVESTIMENTO               = IV.IDINVESTIMENTO(+))'
      'AND (H1.IDCARTEIRAINVEST             = CA.IDCARTEIRAINVEST(+))'
      'AND (AB.IDACAO(+)                    = H1.IDINVESTIMENTO)'
      'AND (COTACAOINVEST.IDINVESTIMENTO(+) = H1.IDINVESTIMENTO)'
      ''
      '--- FIM RENDA VARIAVEL ---'
      ''
      'UNION ALL'
      ''
      '--- VALORES A PAGAR/RECEBER ---'
      'SELECT'
      
        '   DECODE(:VARGROUP,'#39'S'#39','#39'3'#39', '#39'AAAAECAABAAAAgiAAA'#39')  '#9#9#9'         ' +
        'AS IDGROUP,'
      
        '   3                                                            ' +
        '  AS TIPOREL,'
      
        '   '#39'                                                            ' +
        #39' AS CARTEIRA,'
      
        '   '#39'              '#39'                                             ' +
        '  AS CODISIN,'
      
        '   DESCRICAO                                                    ' +
        '  AS INVESTIMENTO,'
      
        '   TO_DATE('#39#39','#39'DD/MM/YYYY'#39')                                     ' +
        '  AS DATAOPER,'
      '   VALOR,'
      
        '   0                                                            ' +
        '  AS SALDO,'
      
        '   0                                                            ' +
        '  AS QUANTIDADE,'
      
        '   0                                                            ' +
        '  AS COTACAO,'
      
        '   TO_DATE('#39#39','#39'DD/MM/YYYY'#39')                                     ' +
        '  AS DATAMOVCARTINV,'
      
        '   0                                                            ' +
        '  AS LOTE,'
      '   IDCARTEIRAINVEST,'
      
        '   0                                                            ' +
        '  AS IDINVESTIMENTO,'
      
        '   '#39'          '#39'                                                 ' +
        '  AS IDLOTE,'
      
        '   '#39'                                                            ' +
        #39' AS OPERACAO,'
      
        '   TO_DATE('#39#39','#39'DD/MM/YYYY'#39')                                     ' +
        '  AS VENCIMENTO,'
      
        '   '#39'          '#39'                                                 ' +
        '  AS CORRETORA,'
      
        '   0                                                            ' +
        '  AS IDCOR,'
      
        '   0                                                            ' +
        '  AS IDEVENTOCAIXACOTA,'
      
        '   0                                                            ' +
        '  AS IDHISTCAIXA,'
      '   REG,'
      
        '   LIQUIDO.TOTAL                                                ' +
        '  AS SALDOTOTAL'
      ''
      'FROM'
      '   DUAL D,'
      '  (SELECT SUM(TOTAL) AS TOTAL'
      '   FROM'
      '     ('
      '   --//COMPRA E VENDA DE AÇÕES'
      '   SELECT VLRMOVCARTINV*-1 AS TOTAL'
      '   FROM   HISTCARTINV HC,  OPERACAOINVEST OI, TIPOOPERACAO TP'
      '   WHERE'
      '       (HC.IDTIPOINVEST      = 2)'
      
        '   AND  ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPREVCTBPATR =' +
        ' :IDPLANPREVCTBPATR))'
      '   AND (HC.IDCARTEIRAINVEST > 0)'
      
        '   AND  ((:IDCARTEIRAGERENC  IS NULL) OR (HC.IDCARTEIRAGERENC  =' +
        ' :IDCARTEIRAGERENC))'
      '   AND  (HC.IDINVESTIMENTO  > 0)'
      '   AND  (HC.DATAMOVCARTINV  <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '   AND  (HC.TIPMOVCARTINV    = '#39'OPE'#39')'
      
        '   AND ((HC.NATURMOVCARTINV  = '#39'A'#39') OR (HC.NATURMOVCARTINV  = '#39'D' +
        #39'))'
      '   AND  (OI.IDTIPOINVEST     = HC.IDTIPOINVEST)'
      '   AND  (OI.DATAOPERACAO    <= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      
        '   AND ((OI.DATAVENCOPER    >  TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))  ' +
        '    AND'
      '        (OI.DATAVENCOPER    <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')))'
      '   AND  (OI.IDOPERACAODIREITO IS NULL)'
      '   AND  (HC.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)'
      '   AND  (TP.IDTIPOINVEST     = HC.IDTIPOINVEST)'
      '   AND  (TP.IDTIPOOPERACAO   = OI.IDTIPOOPERACAO)'
      '   AND  (TP.FLGCORRET        = '#39'S'#39')'
      '   --//FINAL - COMPRA E VENDA DE AÇÕES'
      ''
      '   UNION ALL'
      ''
      '   --//DESPESAS'
      '   SELECT SUM(VLRMOVCARTINV)*-1 AS TOTAL'
      '   FROM   HISTCARTINV HC,  OPERACAOINVEST OI'
      '   WHERE'
      '        (HC.IDTIPOINVEST      = 2)'
      
        '   AND   ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPREVCTBPATR ' +
        '= :IDPLANPREVCTBPATR))'
      '   AND  (HC.IDCARTEIRAINVEST > 0)'
      
        '   AND   ((:IDCARTEIRAGERENC  IS NULL) OR (HC.IDCARTEIRAGERENC  ' +
        '= :IDCARTEIRAGERENC))'
      '   AND  (HC.IDINVESTIMENTO   > 0)'
      '   AND  (HC.DATAMOVCARTINV   <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '   AND  (HC.TIPMOVCARTINV     = '#39'DOP'#39')'
      ''
      '   AND  (OI.DATAOPERACAO     <= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '   AND ((OI.DATAVENCOPER     >  TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '   AND  (OI.DATAVENCOPER     <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')))'
      ''
      '   AND  (OI.IDOPERACAOINVEST  = HC.IDOPERACAOINVEST)'
      ''
      '   AND  (OI.IDOPERACAODIREITO IS NULL)'
      '   --//FINAL - DESPESAS'
      ''
      '   UNION ALL'
      ''
      '   --//ANUNCIO QUE AINDA NÃO FORAM RECEBIDOS'
      '   SELECT VLRHISTPROVISAO AS TOTAL'
      
        '   FROM   HISTPROVISAO HP, OPERDIREITOXINV OXV, OPERACAODIREITO ' +
        'OP, INVESTIMENTO IV,'
      
        '          CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC, OPERACAOINVEST' +
        ' OI'
      '   WHERE'
      
        '          ((:IDPLANPREVCTBPATR IS NULL) OR (HP.IDPLANPREVCTBPATR' +
        ' = :IDPLANPREVCTBPATR))'
      '   AND   (HP.IDCARTEIRAINVEST   > 0)'
      
        '   AND    ((:IDCARTEIRAGERENC  IS NULL) OR (HP.IDCARTEIRAGERENC ' +
        ' = :IDCARTEIRAGERENC))'
      
        '   AND   (OI.DATAOPERACAO       <= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39 +
        '))'
      
        '   AND  ((OI.IDTIPOOPERACAO NOT IN (-170,-10170)) OR (OI.IDTIPOO' +
        'PERACAO IS NULL))'
      '   AND   (OI.IDOPERACAOINVEST(+) = HP.IDOPERACAOINVEST)'
      '   AND  (OXV.IDOPERACAODIREITO   = HP.IDOPERACAODIREITO)'
      '   AND   (OP.IDOPERACAODIREITO   = HP.IDOPERACAODIREITO)'
      '   AND   (IV.IDINVESTIMENTO      = OXV.IDINVESTIMENTO)'
      '   AND   (CX.IDCARTEIRAXEVENTO   = HP.IDCARTEIRAXEVENTO)'
      '   AND   (EC.IDEVENTOCAIXACOTA   = CX.IDEVENTOCAIXACOTA)'
      '   AND   (HP.IDOPERACAODIREITO NOT IN'
      '         (SELECT OP.IDOPERACAODIREITO'
      '          FROM OPERACAOINVEST OP'
      '          WHERE'
      '                (OP.IDTIPOINVEST      = 2)'
      
        '          AND    ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREV' +
        'CTBPATR = :IDPLANPREVCTBPATR))'
      '          AND   (OP.IDCARTEIRAINVEST > 0)'
      
        '          AND    ((:IDCARTEIRAGERENC  IS NULL) OR (OP.IDCARTEIRA' +
        'GERENC  = :IDCARTEIRAGERENC))'
      
        '          AND   (OP.DATAOPERACAO     <= TO_DATE(:DATAINI,'#39'DD/MM/' +
        'YYYY'#39'))'
      '          AND   (OP.IDTIPOOPERACAO   NOT IN (-70,-10070))'
      
        '          AND (((OP.IDTIPOOPERACAO   IN (-170,-10170)) AND (OP.D' +
        'ATAOPERACAO < TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))) OR (OP.IDTIPOOPER' +
        'ACAO NOT IN (-170,-10170)) OR (OP.IDTIPOOPERACAO IS NULL))'
      '          AND   (OP.IDOPERACAODIREITO = HP.IDOPERACAODIREITO)))'
      '   --//FINAL - ANUNCIO QUE AINDA NÃO FORAM RECEBIDOS'
      ''
      '   UNION ALL'
      ''
      '   --//ANUNCIO QUE AINDA NÃO FORAM RECEBIDOS - PARCIAL'
      '   SELECT VALOR AS TOTAL'
      '   FROM'
      
        '  (SELECT DESCCAIXACOTA||'#39' - '#39'||DESCINVESTIMENTO||'#39' - '#39'||OP.DATA' +
        'COM   AS DESCRICAO,'
      '          VLRHISTPROVISAO-NVL(REC.VLRRECPARC,0) AS VALOR,'
      '          HP.IDCARTEIRAINVEST,'
      '          3 AS REG'
      
        '   FROM  HISTPROVISAO HP, OPERDIREITOXINV OXV, OPERACAODIREITO O' +
        'P, INVESTIMENTO IV,'
      
        '         CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC, TIPOOPERACAO TP' +
        ','
      ''
      '        (SELECT OI1.IDOPERACAODIREITO, OI1.IDCARTEIRAGERENC,'
      
        '                DECODE(OI1.IDTIPOOPERACAO, ABS((OI1.IDTIPOOPERAC' +
        'AO-10000))+10000,-10070,-70) AS IDTIPOOPERACAOID,'
      '                OI1.IDTIPOOPERACAO'
      '         FROM  OPERACAOINVEST OI1'
      '         WHERE'
      '             (OI1.IDTIPOINVEST      = 2)'
      
        '         AND   ((:IDPLANPREVCTBPATR IS NULL) OR (OI1.IDPLANPREVC' +
        'TBPATR = :IDPLANPREVCTBPATR))'
      '         AND (OI1.IDCARTEIRAINVEST  > 0)'
      
        '         AND   ((:IDCARTEIRAGERENC  IS NULL) OR (OI1.IDCARTEIRAG' +
        'ERENC  = :IDCARTEIRAGERENC))'
      '         AND (OI1.IDINVESTIMENTO   > 0)'
      
        '         AND (OI1.DATAOPERACAO     <= TO_DATE(:DATAINI,'#39'DD/MM/YY' +
        'YY'#39'))'
      '         AND (OI1.IDTIPOOPERACAO    NOT IN (-170,-10170))'
      '         AND (OI1.IDOPERACAOORIGEM  IS NOT NULL)'
      
        '         GROUP BY OI1.IDTIPOINVEST, OI1.IDPLANPREVCTBPATR, OI1.I' +
        'DCARTEIRAINVEST, OI1.IDCARTEIRAGERENC,'
      
        '                  OI1.IDINVESTIMENTO, OI1.IDOPERACAODIREITO, OI1' +
        '.IDTIPOOPERACAO) OI,'
      ''
      
        '        (SELECT OI2.IDOPERACAODIREITO, OI2.IDCARTEIRAGERENC, SUM' +
        '(OI2.VLROPERACAO) AS VLRRECPARC'
      '         FROM   OPERACAOINVEST OI2, PARAMINVEST PI'
      '         WHERE'
      '             (OI2.IDTIPOINVEST      = 2)'
      
        '         AND   ((:IDPLANPREVCTBPATR IS NULL) OR (OI2.IDPLANPREVC' +
        'TBPATR = :IDPLANPREVCTBPATR))'
      '         AND (OI2.IDCARTEIRAINVEST > 0)'
      
        '         AND   ((:IDCARTEIRAGERENC  IS NULL) OR (OI2.IDCARTEIRAG' +
        'ERENC  = :IDCARTEIRAGERENC))'
      '         AND (OI2.IDINVESTIMENTO   > 0)'
      
        '         AND (OI2.DATAOPERACAO     <= TO_DATE(:DATAINI,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '         AND (OI2.IDTIPOOPERACAO    NOT IN (-70,-10070,-170,-101' +
        '70))'
      '         AND (OI2.IDOPERACAODIREITO IS NOT NULL)'
      '         AND (OI2.IDOPERACAOORIGEM  IS NOT NULL)'
      '         AND (OI2.IDTIPOOPERACAO   <> PI.IDTIPOOPERDIRSUB)'
      
        '         GROUP BY OI2.IDTIPOINVEST, OI2.IDPLANPREVCTBPATR, OI2.I' +
        'DCARTEIRAINVEST, OI2.IDCARTEIRAGERENC,'
      '                  OI2.IDINVESTIMENTO, OI2.IDOPERACAODIREITO) REC'
      '   WHERE'
      
        '         ((:IDPLANPREVCTBPATR IS NULL) OR (HP.IDPLANPREVCTBPATR ' +
        '= :IDPLANPREVCTBPATR))'
      '   AND  (HP.IDCARTEIRAINVEST  > 0)'
      
        '   AND   ((:IDCARTEIRAGERENC  IS NULL) OR (HP.IDCARTEIRAGERENC  ' +
        '= :IDCARTEIRAGERENC))'
      ''
      '   AND  (OP.IDTIPOINVEST      = 2)'
      '   AND  (OP.DATAOPER         <= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '   AND  (OP.IDOPERACAODIREITO = HP.IDOPERACAODIREITO)'
      '   AND  (OI.IDTIPOOPERACAOID  = TP.IDTIPOOPERACAO)'
      '   AND  (OI.IDOPERACAODIREITO = HP.IDOPERACAODIREITO)'
      '   AND  (OI.IDCARTEIRAGERENC  = HP.IDCARTEIRAGERENC)'
      '   AND (OXV.IDOPERACAODIREITO = HP.IDOPERACAODIREITO)'
      '   AND  (IV.IDINVESTIMENTO    = OXV.IDINVESTIMENTO)'
      '   AND  (CX.IDCARTEIRAXEVENTO = HP.IDCARTEIRAXEVENTO)'
      '   AND  (EC.IDEVENTOCAIXACOTA = CX.IDEVENTOCAIXACOTA)'
      '   AND  (TP.IDTIPOINVEST      = 2)'
      '   AND  (TP.IDTIPOOPERACAO NOT IN (-170,-10170))'
      '   AND  (TP.IDTIPOOPERACAO    = EC.IDTIPOOPERACAO)'
      '   AND  (REC.IDOPERACAODIREITO= OI.IDOPERACAODIREITO)'
      '   AND  (REC.IDCARTEIRAGERENC = OI.IDCARTEIRAGERENC)'
      
        '   AND  (TP.IDTIPOOPERACAO||HP.IDOPERACAODIREITO||HP.IDCARTEIRAG' +
        'ERENC NOT IN'
      
        '        (SELECT DECODE(OI3.IDTIPOOPERACAO, -170, -70, -10070)||O' +
        'I3.IDOPERACAODIREITO||OI3.IDCARTEIRAGERENC'
      '         FROM   OPERACAOINVEST OI3'
      '         WHERE'
      '             (OI3.IDTIPOINVEST      = 2)'
      
        '         AND   ((:IDPLANPREVCTBPATR IS NULL) OR (OI3.IDPLANPREVC' +
        'TBPATR = :IDPLANPREVCTBPATR))'
      '         AND (OI3.IDCARTEIRAINVEST > 0)'
      '         AND (OI3.IDCARTEIRAGERENC > 0)'
      '         AND (OI3.IDINVESTIMENTO   > 0)'
      
        '         AND (OI3.DATAOPERACAO     < TO_DATE(:DATAINI,'#39'DD/MM/YYY' +
        'Y'#39'))'
      '         AND (OI3.IDTIPOOPERACAO IN (-170,-10170))'
      '         AND (OI3.IDCARTEIRAGERENC  = HP.IDCARTEIRAGERENC)'
      
        '         GROUP BY OI3.IDTIPOINVEST, OI3.IDPLANPREVCTBPATR, OI3.I' +
        'DCARTEIRAINVEST, OI3.IDCARTEIRAGERENC,'
      
        '                   OI3.IDINVESTIMENTO, OI3.IDTIPOOPERACAO, OI3.I' +
        'DOPERACAODIREITO)) )'
      '   WHERE'
      '       VALOR > 1'
      '   --//FINAL - ANUNCIO QUE NÃO FORAM RECEBIDOS - PARCIAL'
      ''
      '   UNION ALL'
      ''
      '   --//CANCELAMENTO DE ANUNCIO QUE AINDA NÃO FORAM RECEBIDOS'
      '   SELECT HC.VLRHISTCAIXA*-1 AS TOTAL'
      
        '   FROM  HISTCAIXA HC , OPERACAOINVEST OI, OPERACAODIREITO OP, O' +
        'PERDIREITOXINV OXV,'
      '         INVESTIMENTO IV, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC'
      '   WHERE'
      
        '         ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPREVCTBPATR ' +
        '= :IDPLANPREVCTBPATR))'
      '   AND  (HC.IDCARTEIRAINVEST > 0)'
      
        '   AND   ((:IDCARTEIRAGERENC  IS NULL) OR (HC.IDCARTEIRAGERENC  ' +
        '= :IDCARTEIRAGERENC))'
      ''
      '   AND  (OI.IDTIPOINVEST      = 2)'
      '   AND  (OI.DATAOPERACAO      = TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '   AND  (OI.IDTIPOOPERACAO   IN (-170,-10170))'
      '   AND  (OI.IDCARTEIRAGERENC  = HC.IDCARTEIRAGERENC)'
      '   AND  (OI.IDOPERACAODIREITO = HC.IDOPERACAODIREITO)'
      '   AND  (OP.DATAOPER         <= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '   AND  (OP.IDOPERACAODIREITO = HC.IDOPERACAODIREITO)'
      '   AND (OXV.IDOPERACAODIREITO = HC.IDOPERACAODIREITO)'
      '   AND  (IV.IDTIPOINVEST      = 2)'
      '   AND  (IV.IDINVESTIMENTO    = OXV.IDINVESTIMENTO)'
      '   AND  (CX.IDCARTEIRAXEVENTO = HC.IDCARTEIRAXEVENTO)'
      '   AND  (EC.IDEVENTOCAIXACOTA = CX.IDEVENTOCAIXACOTA)'
      '   AND  (EC.IDTIPOOPERACAO    = OI.IDTIPOOPERACAO)'
      
        '   --//FINAL - CANCELAMENTO DE ANUNCIO QUE AINDA NÃO FORAM RECEB' +
        'IDOS'
      ''
      '   UNION ALL'
      ''
      
        '   --//INICIO DA PROVISAO A RECEBR, LANÇADAS PELA TELA DE OPER. ' +
        'VIRTUAL'
      '   SELECT VLRHISTPROVISAO AS TOTAL'
      
        '   FROM  HISTPROVISAO HP, OPERACAOINVEST OI, INVESTIMENTO IV, CA' +
        'RTEIRAXEVENTO CX, EVENTOCAIXACOTA EC'
      '   WHERE'
      
        '        ((:IDPLANPREVCTBPATR IS NULL) OR (HP.IDPLANPREVCTBPATR =' +
        ' :IDPLANPREVCTBPATR))'
      '   AND (HP.IDCARTEIRAINVEST  > 0)'
      
        '   AND  ((:IDCARTEIRAGERENC  IS NULL) OR (HP.IDCARTEIRAGERENC  =' +
        ' :IDCARTEIRAGERENC))'
      '   AND (HP.DATAHISTPROVISAO  >  TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '--//AL_1 - Ricardo - 21/06/2006'
      '--//   AND (HP.VLRHISTPROVISAO    > 0)'
      ''
      '   AND (OI.IDTIPOINVEST       = 2)'
      '   AND (OI.DATAOPERACAO      <= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '   AND (OI.IDOPERACAOINVEST   = HP.IDOPERACAOINVEST)'
      '   AND (OI.IDOPERACAODIREITO IS NULL)'
      ''
      '   AND (CX.IDCARTEIRAXEVENTO  = HP.IDCARTEIRAXEVENTO)'
      '   AND (EC.IDEVENTOCAIXACOTA <> -13)'
      '   AND (EC.IDEVENTOCAIXACOTA  = CX.IDEVENTOCAIXACOTA)'
      '   AND (IV.IDTIPOINVEST       = 2)'
      '   AND (IV.IDINVESTIMENTO     = OI.IDINVESTIMENTO)'
      
        '   --//FINAL - PROVISAO A RECEBR, LANÇADAS PELA TELA DE OPER. VI' +
        'RTUAL'
      ''
      '   UNION ALL'
      ''
      '   --//PROVISAO DE CPMF'
      '   SELECT VALOR*-1 AS TOTAL'
      '   FROM (SELECT SUM(VLRHISTPROVISAO) AS VALOR'
      
        '         FROM   HISTPROVISAO HP, CARTEIRAXEVENTO CX, EVENTOCAIXA' +
        'COTA EC'
      '         WHERE'
      
        '              ((:IDPLANPREVCTBPATR IS NULL) OR (HP.IDPLANPREVCTB' +
        'PATR = :IDPLANPREVCTBPATR))'
      '         AND (HP.IDCARTEIRAINVEST  > 0)'
      
        '         AND  ((:IDCARTEIRAGERENC  IS NULL) OR (HP.IDCARTEIRAGER' +
        'ENC  = :IDCARTEIRAGERENC))'
      
        '         AND (HP.DATAHISTPROVISAO >  TO_DATE(:DATAINI,'#39'DD/MM/YYY' +
        'Y'#39'))'
      
        '         AND (HP.DATAORIGEM       <= TO_DATE(:DATAINI,'#39'DD/MM/YYY' +
        'Y'#39'))'
      '         AND (EC.IDEVENTOCAIXACOTA = -13)'
      '         AND (CX.IDCARTEIRAXEVENTO = HP.IDCARTEIRAXEVENTO)'
      '         AND (EC.IDEVENTOCAIXACOTA = CX.IDEVENTOCAIXACOTA)'
      '         GROUP BY DESCCAIXACOTA, DATAHISTPROVISAO)'
      '   WHERE VALOR > 0'
      '   --//FINAL - PROVISAO DE CPMF'
      '     )'
      '     ) LIQUIDO,'
      '  ('
      '   --//COMPRA DE AÇÕES'
      '   SELECT'
      
        '       DECODE(NVL(SUM(VLRMOVCARTINV),0),0,'#39#39','#39'COMPRA'#39') AS DESCRI' +
        'CAO,'
      '       SUM(VLRMOVCARTINV)*-1 AS VALOR,'
      '       HC.IDCARTEIRAINVEST,'
      '       1 AS REG'
      '   FROM  HISTCARTINV HC, OPERACAOINVEST OI, TIPOOPERACAO TP'
      '   WHERE'
      '       (HC.IDTIPOINVEST       = 2)'
      
        '   AND  ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPREVCTBPATR =' +
        ' :IDPLANPREVCTBPATR))'
      '   AND (HC.IDCARTEIRAINVEST  > 0)'
      
        '   AND  ((:IDCARTEIRAGERENC  IS NULL) OR (HC.IDCARTEIRAGERENC  =' +
        ' :IDCARTEIRAGERENC))'
      '   AND  (HC.IDINVESTIMENTO   > 0)'
      '   AND  (HC.DATAMOVCARTINV   <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '   AND  (HC.TIPMOVCARTINV     = '#39'OPE'#39')'
      '   AND  (HC.VLRMOVCARTINV    > 0)'
      '   AND  (HC.NATURMOVCARTINV   = '#39'A'#39')'
      ''
      
        '   AND ((OI.DATAVENCOPER     >  TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')) ' +
        '    AND'
      '        (OI.DATAVENCOPER     <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')))'
      '   AND  (OI.IDOPERACAODIREITO IS NULL)'
      ''
      '   AND  (HC.IDOPERACAOINVEST  = OI.IDOPERACAOINVEST)'
      '   AND  (TP.IDTIPOINVEST      = HC.IDTIPOINVEST)'
      '   AND  (TP.IDTIPOOPERACAO    = OI.IDTIPOOPERACAO)'
      '   AND  (TP.FLGCORRET         = '#39'S'#39')'
      ''
      
        '   GROUP BY HC.IDTIPOINVEST, HC.IDPLANPREVCTBPATR, HC.IDCARTEIRA' +
        'INVEST, HC.IDCARTEIRAGERENC, HC.IDINVESTIMENTO'
      '   --//FINAL DE COMPRA DE AÇÕES'
      ''
      '   UNION ALL'
      ''
      '   --//VENDA DE AÇÕES'
      '   SELECT'
      
        '       DECODE(NVL(SUM(VLRMOVCARTINV),0),0,'#39#39','#39'VENDA'#39') AS DESCRIC' +
        'AO,'
      '       SUM(VLRMOVCARTINV)*-1 AS VALOR,'
      '       HC.IDCARTEIRAINVEST,'
      '       1.2 AS REG'
      '   FROM  HISTCARTINV HC, OPERACAOINVEST OI, TIPOOPERACAO TP'
      '   WHERE'
      '        (HC.IDTIPOINVEST      = 2)'
      
        '   AND   ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPREVCTBPATR ' +
        '= :IDPLANPREVCTBPATR))'
      '   AND  (HC.IDCARTEIRAINVEST  > 0)'
      
        '   AND   ((:IDCARTEIRAGERENC  IS NULL) OR (HC.IDCARTEIRAGERENC  ' +
        '= :IDCARTEIRAGERENC))'
      '   AND  (HC.IDINVESTIMENTO   > 0)'
      '   AND  (HC.DATAMOVCARTINV   <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '   AND  (HC.TIPMOVCARTINV     = '#39'OPE'#39')'
      '   AND  (HC.VLRMOVCARTINV    <  0)'
      '   AND  (HC.NATURMOVCARTINV   = '#39'D'#39')'
      ''
      '   AND  (OI.DATAOPERACAO     <= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '   AND ((OI.DATAVENCOPER     >  TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '   AND  (OI.DATAVENCOPER     <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')))'
      '   AND  (OI.IDOPERACAODIREITO IS NULL)'
      ''
      '   AND  (HC.IDOPERACAOINVEST  = OI.IDOPERACAOINVEST)'
      '   AND  (TP.IDTIPOINVEST      = HC.IDTIPOINVEST)'
      '   AND  (TP.IDTIPOOPERACAO    = OI.IDTIPOOPERACAO)'
      '   AND  (TP.FLGCORRET         = '#39'S'#39')'
      
        '   GROUP BY HC.IDTIPOINVEST, HC.IDPLANPREVCTBPATR, HC.IDCARTEIRA' +
        'INVEST, HC.IDCARTEIRAGERENC, HC.IDINVESTIMENTO'
      '   --//FINAL DE VENDA DE AÇÕES'
      ''
      '   UNION ALL'
      ''
      '   --//DESPESAS DAS AÇÕES'
      '   SELECT'
      
        '       DECODE(NVL(SUM(VLRMOVCARTINV),0),0,'#39#39','#39'DESPESAS A PAGAR'#39')' +
        ' AS DESCRICAO,'
      '       SUM(VLRMOVCARTINV)*-1 AS VALOR,'
      '       HC.IDCARTEIRAINVEST,'
      '       DECODE(SUM(VLRMOVCARTINV),NULL,0,2) AS REG'
      '   FROM  HISTCARTINV HC,  OPERACAOINVEST OI'
      '   WHERE'
      '        (HC.IDTIPOINVEST      = 2)'
      
        '   AND   ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPREVCTBPATR ' +
        '= :IDPLANPREVCTBPATR))'
      '   AND  (HC.IDCARTEIRAINVEST  > 0)'
      
        '   AND   ((:IDCARTEIRAGERENC  IS NULL) OR (HC.IDCARTEIRAGERENC  ' +
        '= :IDCARTEIRAGERENC))'
      '   AND  (HC.IDINVESTIMENTO   > 0)'
      '   AND  (HC.DATAMOVCARTINV   <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '   AND  (HC.TIPMOVCARTINV     = '#39'DOP'#39')'
      ''
      '   AND  (OI.DATAOPERACAO     <= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      
        '   AND ((OI.DATAVENCOPER     >  TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')) ' +
        '    AND'
      '        (OI.DATAVENCOPER     <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')))'
      '   AND  (OI.IDOPERACAODIREITO IS NULL)'
      ''
      '   AND  (HC.IDOPERACAOINVEST  = OI.IDOPERACAOINVEST)'
      
        '   GROUP BY HC.IDTIPOINVEST, HC.IDPLANPREVCTBPATR, HC.IDCARTEIRA' +
        'INVEST, HC.IDCARTEIRAGERENC, HC.IDINVESTIMENTO'
      '   --//FINAL DESPESAS DAS AÇÕES'
      ''
      '   UNION ALL'
      ''
      '   --//ANUNCIO QUE NÃO FORAM RECEBIDOS'
      '   SELECT'
      
        '       DESCCAIXACOTA||'#39' - '#39'||DESCINVESTIMENTO||'#39' - '#39'||OP.DATACOM' +
        '   AS DESCRICAO,'
      '       VLRHISTPROVISAO AS VALOR,'
      '       HP.IDCARTEIRAINVEST,'
      '       3 AS REG'
      
        '   FROM  HISTPROVISAO HP, OPERDIREITOXINV OXV, OPERACAODIREITO O' +
        'P, INVESTIMENTO IV,'
      
        '         CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC, OPERACAOINVEST ' +
        'OI'
      '   WHERE'
      
        '        ((:IDPLANPREVCTBPATR IS NULL) OR (HP.IDPLANPREVCTBPATR =' +
        ' :IDPLANPREVCTBPATR))'
      '   AND (HP.IDCARTEIRAINVEST  > 0)'
      
        '   AND  ((:IDCARTEIRAGERENC  IS NULL) OR (HP.IDCARTEIRAGERENC  =' +
        ' :IDCARTEIRAGERENC))'
      
        '   AND  (OI.DATAOPERACAO       <= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')' +
        ')'
      
        '   AND ((OI.IDTIPOOPERACAO NOT IN (-170,-10170)) OR (OI.IDTIPOOP' +
        'ERACAO IS NULL))'
      '   AND  (OI.IDOPERACAOINVEST(+) = HP.IDOPERACAOINVEST)'
      '   AND (OXV.IDOPERACAODIREITO   = HP.IDOPERACAODIREITO)'
      '   AND  (OP.IDOPERACAODIREITO   = HP.IDOPERACAODIREITO)'
      '   AND  (IV.IDINVESTIMENTO      = OXV.IDINVESTIMENTO)'
      '   AND  (CX.IDCARTEIRAXEVENTO   = HP.IDCARTEIRAXEVENTO)'
      '   AND  (EC.IDEVENTOCAIXACOTA   = CX.IDEVENTOCAIXACOTA)'
      '   AND  (HP.IDOPERACAODIREITO NOT IN'
      '        (SELECT OP.IDOPERACAODIREITO'
      '         FROM   OPERACAOINVEST OP'
      '         WHERE'
      '               (OP.IDTIPOINVEST = 2)'
      
        '         AND    ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVC' +
        'TBPATR = :IDPLANPREVCTBPATR))'
      '         AND   (OP.IDCARTEIRAINVEST  > 0)'
      
        '         AND    ((:IDCARTEIRAGERENC  IS NULL) OR (OP.IDCARTEIRAG' +
        'ERENC  = :IDCARTEIRAGERENC))'
      '         AND   (OP.IDINVESTIMENTO   > 0)'
      
        '         AND   (OP.DATAOPERACAO     <= TO_DATE(:DATAINI,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '         AND   (OP.IDTIPOOPERACAO   NOT IN (-70,-10070))'
      
        '         AND (((OP.IDTIPOOPERACAO   IN (-170,-10170)) AND (OP.DA' +
        'TAOPERACAO < TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))) OR (OP.IDTIPOOPERA' +
        'CAO NOT IN (-170,-10170)) OR (OP.IDTIPOOPERACAO IS NULL))'
      '         AND   (OP.IDOPERACAODIREITO = HP.IDOPERACAODIREITO)))'
      '   --//FINAL - ANUNCIO QUE NÃO FORAM RECEBIDOS'
      ''
      '   UNION ALL'
      ''
      '   --//ANUNCIO QUE AINDA NÃO FORAM RECEBIDOS - PARCIAL'
      '   SELECT  DESCRICAO,'
      '           VALOR,'
      '           IDCARTEIRAINVEST,'
      '           3 AS REG'
      '   FROM'
      
        '  (SELECT DESCCAIXACOTA||'#39' - '#39'||DESCINVESTIMENTO||'#39' - '#39'||OP.DATA' +
        'COM   AS DESCRICAO,'
      '          VLRHISTPROVISAO-NVL(REC.VLRRECPARC,0) AS VALOR,'
      '          HP.IDCARTEIRAINVEST,'
      '          3 AS REG'
      
        '   FROM  HISTPROVISAO HP, OPERDIREITOXINV OXV, OPERACAODIREITO O' +
        'P, INVESTIMENTO IV,'
      
        '         CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC, TIPOOPERACAO TP' +
        ','
      ''
      '        (SELECT OI1.IDOPERACAODIREITO, OI1.IDCARTEIRAGERENC,'
      
        '                DECODE(OI1.IDTIPOOPERACAO, ABS((OI1.IDTIPOOPERAC' +
        'AO-10000))+10000,-10070,-70) AS IDTIPOOPERACAOID,'
      '                OI1.IDTIPOOPERACAO'
      '         FROM  OPERACAOINVEST OI1'
      '         WHERE'
      '             (OI1.IDTIPOINVEST     = 2)'
      
        '         AND   ((:IDPLANPREVCTBPATR IS NULL) OR (OI1.IDPLANPREVC' +
        'TBPATR = :IDPLANPREVCTBPATR))'
      '         AND (OI1.IDCARTEIRAINVEST  > 0)'
      
        '         AND   ((:IDCARTEIRAGERENC  IS NULL) OR (OI1.IDCARTEIRAG' +
        'ERENC  = :IDCARTEIRAGERENC))'
      '         AND (OI1.IDINVESTIMENTO   > 0)'
      
        '         AND (OI1.DATAOPERACAO     <= TO_DATE(:DATAINI,'#39'DD/MM/YY' +
        'YY'#39'))'
      '         AND (OI1.IDTIPOOPERACAO    NOT IN (-170,-10170))'
      '         AND (OI1.IDOPERACAOORIGEM  IS NOT NULL)'
      
        '         GROUP BY OI1.IDTIPOINVEST, OI1.IDPLANPREVCTBPATR, OI1.I' +
        'DCARTEIRAINVEST, OI1.IDCARTEIRAGERENC,'
      
        '                  OI1.IDINVESTIMENTO, OI1.IDOPERACAODIREITO, OI1' +
        '.IDTIPOOPERACAO) OI,'
      ''
      
        '        (SELECT OI2.IDOPERACAODIREITO, OI2.IDCARTEIRAGERENC, SUM' +
        '(OI2.VLROPERACAO) AS VLRRECPARC'
      '         FROM   OPERACAOINVEST OI2, PARAMINVEST PI'
      '         WHERE'
      '             (OI2.IDTIPOINVEST     = 2)'
      
        '         AND   ((:IDPLANPREVCTBPATR IS NULL) OR (OI2.IDPLANPREVC' +
        'TBPATR = :IDPLANPREVCTBPATR))'
      '         AND (OI2.IDCARTEIRAINVEST  > 0)'
      
        '         AND   ((:IDCARTEIRAGERENC  IS NULL) OR (OI2.IDCARTEIRAG' +
        'ERENC  = :IDCARTEIRAGERENC))'
      '         AND (OI2.IDINVESTIMENTO   > 0)'
      
        '         AND (OI2.DATAOPERACAO     <= TO_DATE(:DATAINI,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '         AND (OI2.IDTIPOOPERACAO    NOT IN (-70,-10070,-170,-101' +
        '70))'
      '         AND (OI2.IDOPERACAODIREITO IS NOT NULL)'
      '         AND (OI2.IDOPERACAOORIGEM  IS NOT NULL)'
      '         AND (OI2.IDTIPOOPERACAO <> PI.IDTIPOOPERDIRSUB)'
      
        '         GROUP BY OI2.IDTIPOINVEST, OI2.IDPLANPREVCTBPATR, OI2.I' +
        'DCARTEIRAINVEST, OI2.IDCARTEIRAGERENC,'
      '                  OI2.IDINVESTIMENTO, OI2.IDOPERACAODIREITO) REC'
      '   WHERE'
      
        '         ((:IDPLANPREVCTBPATR IS NULL) OR (HP.IDPLANPREVCTBPATR ' +
        '= :IDPLANPREVCTBPATR))'
      '   AND  (HP.IDCARTEIRAINVEST  > 0)'
      
        '   AND   ((:IDCARTEIRAGERENC  IS NULL) OR (HP.IDCARTEIRAGERENC  ' +
        '= :IDCARTEIRAGERENC))'
      '   AND  (OP.IDTIPOINVEST      = 2)'
      '   AND  (OP.DATAOPER         <= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '   AND  (OP.IDOPERACAODIREITO = HP.IDOPERACAODIREITO)'
      '   AND  (OI.IDTIPOOPERACAOID  = TP.IDTIPOOPERACAO)'
      '   AND  (OI.IDOPERACAODIREITO = HP.IDOPERACAODIREITO)'
      '   AND  (OI.IDCARTEIRAGERENC  = HP.IDCARTEIRAGERENC)'
      '   AND (OXV.IDOPERACAODIREITO = HP.IDOPERACAODIREITO)'
      '   AND  (IV.IDINVESTIMENTO    = OXV.IDINVESTIMENTO)'
      '   AND  (CX.IDCARTEIRAXEVENTO = HP.IDCARTEIRAXEVENTO)'
      '   AND  (EC.IDEVENTOCAIXACOTA = CX.IDEVENTOCAIXACOTA)'
      '   AND  (TP.IDTIPOINVEST      = 2)'
      '   AND  (TP.IDTIPOOPERACAO NOT IN (-170,-10170))   '
      '   AND  (TP.IDTIPOOPERACAO    = EC.IDTIPOOPERACAO)'
      '   AND (REC.IDOPERACAODIREITO= OI.IDOPERACAODIREITO)'
      '   AND (REC.IDCARTEIRAGERENC = OI.IDCARTEIRAGERENC)'
      
        '   AND  (TP.IDTIPOOPERACAO||HP.IDOPERACAODIREITO||HP.IDCARTEIRAG' +
        'ERENC NOT IN'
      
        '        (SELECT DECODE(OI3.IDTIPOOPERACAO, -170, -70, -10070)||O' +
        'I3.IDOPERACAODIREITO||OI3.IDCARTEIRAGERENC'
      '         FROM   OPERACAOINVEST OI3'
      '         WHERE'
      '             (OI3.IDTIPOINVEST      = 2)'
      
        '         AND   ((:IDPLANPREVCTBPATR IS NULL) OR (OI3.IDPLANPREVC' +
        'TBPATR = :IDPLANPREVCTBPATR))'
      '         AND (OI3.IDCARTEIRAINVEST > 0)'
      
        '         AND   ((:IDCARTEIRAGERENC  IS NULL) OR (OI3.IDCARTEIRAG' +
        'ERENC  = :IDCARTEIRAGERENC))'
      '         AND (OI3.IDINVESTIMENTO   > 0)'
      
        '         AND (OI3.DATAOPERACAO     <  TO_DATE(:DATAINI,'#39'DD/MM/YY' +
        'YY'#39'))'
      '         AND (OI3.IDTIPOOPERACAO IN (-170,-10170))'
      '         AND (OI3.IDCARTEIRAGERENC  = HP.IDCARTEIRAGERENC)'
      
        '         GROUP BY OI3.IDTIPOINVEST, OI3.IDPLANPREVCTBPATR, OI3.I' +
        'DCARTEIRAINVEST, OI3.IDCARTEIRAGERENC, '
      
        '                  OI3.IDINVESTIMENTO, OI3.IDTIPOOPERACAO, OI3.ID' +
        'OPERACAODIREITO)) )'
      '   WHERE'
      '       VALOR > 1'
      '   --//FINAL - ANUNCIO QUE NÃO FORAM RECEBIDOS - PARCIAL'
      ''
      '   UNION ALL'
      ''
      '   --//CANCELAMENTO DE ANUNCIO QUE AINDA NÃO FORAM RECEBIDOS '
      
        '   SELECT EC.DESCCAIXACOTA||'#39' - '#39'||IV.DESCINVESTIMENTO||'#39' - '#39'||O' +
        'P.DATACOM   AS DESCRICAO,'
      '          HC.VLRHISTCAIXA*-1 AS VALOR,'
      '          HC.IDCARTEIRAINVEST,'
      '          3 AS REG'
      
        '   FROM  HISTCAIXA HC , OPERACAOINVEST OI, OPERACAODIREITO OP, O' +
        'PERDIREITOXINV OXV,'
      '         INVESTIMENTO IV, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC'
      '   WHERE'
      
        '         ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPREVCTBPATR ' +
        '= :IDPLANPREVCTBPATR))'
      '   AND  (HC.IDCARTEIRAINVEST > 0)'
      
        '   AND   ((:IDCARTEIRAGERENC  IS NULL) OR (HC.IDCARTEIRAGERENC  ' +
        '= :IDCARTEIRAGERENC))'
      ''
      '   AND  (OI.IDTIPOINVEST      = 2)'
      '   AND  (OI.DATAOPERACAO      = TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '   AND  (OI.IDTIPOOPERACAO   IN (-170,-10170))'
      '   AND  (OI.IDCARTEIRAGERENC  = HC.IDCARTEIRAGERENC)'
      '   AND  (OI.IDOPERACAODIREITO = HC.IDOPERACAODIREITO)'
      '   AND  (OP.DATAOPER         <= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '   AND  (OP.IDOPERACAODIREITO = HC.IDOPERACAODIREITO)'
      '   AND (OXV.IDOPERACAODIREITO = HC.IDOPERACAODIREITO)'
      '   AND  (IV.IDTIPOINVEST      = 2)'
      '   AND  (IV.IDINVESTIMENTO    = OXV.IDINVESTIMENTO)'
      '   AND  (CX.IDCARTEIRAXEVENTO = HC.IDCARTEIRAXEVENTO)'
      '   AND  (EC.IDEVENTOCAIXACOTA = CX.IDEVENTOCAIXACOTA)'
      '   AND  (EC.IDTIPOOPERACAO    = OI.IDTIPOOPERACAO)'
      
        '   --//FINAL - CANCELAMENTO DE ANUNCIO QUE AINDA NÃO FORAM RECEB' +
        'IDOS'
      ''
      '   UNION ALL'
      ''
      
        '   --//INICIO DA PROVISAO A RECEBR, LANÇADAS PELA TELA DE OPER. ' +
        'VIRTUAL'
      '   SELECT'
      
        '       DESCCAIXACOTA||'#39' - '#39'||DESCINVESTIMENTO||'#39' - '#39'||DATAHISTPR' +
        'OVISAO  AS DESCRICAO,'
      '       VLRHISTPROVISAO AS VALOR,'
      '       HP.IDCARTEIRAINVEST,'
      '       3 AS REG'
      
        '   FROM  HISTPROVISAO HP, OPERACAOINVEST OI, INVESTIMENTO IV, CA' +
        'RTEIRAXEVENTO CX, EVENTOCAIXACOTA EC'
      '   WHERE'
      
        '        ((:IDPLANPREVCTBPATR IS NULL) OR (HP.IDPLANPREVCTBPATR =' +
        ' :IDPLANPREVCTBPATR))'
      '   AND (HP.IDCARTEIRAINVEST  > 0)'
      
        '   AND  ((:IDCARTEIRAGERENC  IS NULL) OR (HP.IDCARTEIRAGERENC  =' +
        ' :IDCARTEIRAGERENC))'
      '   AND (HP.DATAHISTPROVISAO  >  TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '--//AL_1 - Ricardo - 21/06/2006'
      '--//   AND (HP.VLRHISTPROVISAO    > 0)'
      ''
      '   AND (OI.IDTIPOINVEST       = 2)'
      '   AND (OI.DATAOPERACAO      <= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '   AND (OI.IDOPERACAOINVEST   = HP.IDOPERACAOINVEST)'
      '   AND (OI.IDOPERACAODIREITO IS NULL)'
      ''
      '   AND (CX.IDCARTEIRAXEVENTO  = HP.IDCARTEIRAXEVENTO)'
      '   AND (EC.IDEVENTOCAIXACOTA <> -13)'
      '   AND (EC.IDEVENTOCAIXACOTA  = CX.IDEVENTOCAIXACOTA)'
      '   AND (IV.IDTIPOINVEST       = 2)'
      '   AND (IV.IDINVESTIMENTO     = OI.IDINVESTIMENTO)'
      
        '   --//FINAL - PROVISOES A RECEBR, LANÇADAS PELA TELA DE OPER. V' +
        'IRTUAL'
      ''
      '   UNION ALL'
      ''
      '   --//PROVISAO DE CPMF'
      '   SELECT'
      '       DESCRICAO,'
      '       VALOR*-1,'
      '       IDCARTEIRAINVEST,'
      '       REG'
      '   FROM'
      '     ('
      
        '      SELECT (DESCCAIXACOTA||'#39' - '#39'||DATAHISTPROVISAO) AS DESCRIC' +
        'AO,'
      '             SUM(VLRHISTPROVISAO) AS VALOR,'
      '             HP.IDCARTEIRAINVEST,'
      '             3 AS REG'
      
        '      FROM   HISTPROVISAO HP, CARTEIRAXEVENTO CX, EVENTOCAIXACOT' +
        'A EC'
      '      WHERE'
      
        '           ((:IDPLANPREVCTBPATR IS NULL) OR (HP.IDPLANPREVCTBPAT' +
        'R = :IDPLANPREVCTBPATR))'
      '      AND (HP.IDCARTEIRAINVEST > 0)'
      
        '      AND  ((:IDCARTEIRAGERENC  IS NULL) OR (HP.IDCARTEIRAGERENC' +
        '  = :IDCARTEIRAGERENC))'
      
        '      AND (HP.DATAHISTPROVISAO >  TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')' +
        ')'
      
        '      AND (HP.DATAORIGEM       <= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')' +
        ')'
      ''
      '      AND (EC.IDEVENTOCAIXACOTA = -13)'
      '      AND (CX.IDCARTEIRAXEVENTO = HP.IDCARTEIRAXEVENTO)'
      '      AND (EC.IDEVENTOCAIXACOTA = CX.IDEVENTOCAIXACOTA)'
      
        '      GROUP BY HP.IDPLANPREVCTBPATR, HP.IDCARTEIRAINVEST, HP.IDC' +
        'ARTEIRAGERENC, DESCCAIXACOTA, DATAHISTPROVISAO)'
      '   --//FINAL - PROVISAO DE CPMF'
      'WHERE VALOR > 0'
      ')'
      '--- FIM VALORES A PAGAR/RECEBER ---'
      ''
      'UNION ALL'
      ''
      '--- SALDO DE CAIXA ---'
      'SELECT'
      
        '   DECODE(:VARGROUP,'#39'S'#39','#39'4'#39', '#39'AAAAECAABAAAAgiAAA'#39')  '#9#9#9#9' AS IDGR' +
        'OUP,'
      
        '   4                                                            ' +
        '  AS TIPOREL,'
      
        '   '#39'                                                            ' +
        #39' AS CARTEIRA,'
      
        '   '#39'              '#39'                                             ' +
        '  AS CODISIN,'
      
        '   DESCCAIXACOTA                                                ' +
        '  AS INVESTIMENTO,'
      '   DATAHISTCAIXA AS DATAOPER,'
      
        '   DECODE(:VARGROUP,'#39'S'#39',SLDHISTCAIXA, VLRHISTCAIXA)             ' +
        '  AS VALOR,'
      '   SLDHISTCAIXA AS SALDO,'
      
        '   0                                                            ' +
        '  AS QUANTIDADE,'
      
        '   0                                                            ' +
        '  AS COTACAO,'
      
        '   TO_DATE('#39#39','#39'DD/MM/YYYY'#39')                                     ' +
        '  AS DATAMOVCARTINV,'
      
        '   0                                                            ' +
        '  AS LOTE,'
      
        '   IDCARTEIRAINVEST                                             ' +
        '  AS IDCARTEIRAINVEST,'
      
        '   0                                                            ' +
        '  AS IDINVESTIMENTO,'
      
        '   '#39'          '#39'                                                 ' +
        '  AS IDLOTE,'
      
        '   '#39'                                                            ' +
        #39' AS OPERACAO,'
      
        '   TO_DATE('#39#39','#39'DD/MM/YYYY'#39')                                     ' +
        '  AS VENCIMENTO,'
      
        '   '#39'          '#39'                                                 ' +
        '  AS CORRETORA,'
      '   IDCOR,'
      '   IDEVENTOCAIXACOTA,'
      '   IDHISTCAIXA,'
      
        '   0                                                            ' +
        '  AS REG,'
      
        '   0.01                                                         ' +
        '  AS SALDOTOTAL'
      'FROM'
      '   DUAL D,'
      '  ('
      '   --//BUSCA DO SALDO ANTERIOR'
      '   SELECT HC.DATAHISTCAIXA,'
      
        '         '#39'SALDO ANTERIOR'#39' AS DESCCAIXACOTA , 0 AS VLRHISTCAIXA, ' +
        'HC.SLDHISTCAIXA,'
      
        '         HC.IDHISTCAIXA, CX.IDCARTEIRAINVEST, CX.IDCARTEIRAGEREN' +
        'C,'
      '         EC.IDEVENTOCAIXACOTA,'
      '         16777215 AS IDCOR,'
      '         4 AS REG'
      
        '   FROM  HISTCAIXA HC, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC, C' +
        'ARTEIRAINVEST CI, CARTEIRAGERENC CG'
      '   WHERE'
      '       (HC.IDHISTCAIXA IN'
      '          (SELECT MAX(HC1.IDHISTCAIXA)'
      '           FROM   HISTCAIXA HC1'
      '           WHERE'
      
        '                 ((:IDPLANPREVCTBPATR IS NULL) OR (HC1.IDPLANPRE' +
        'VCTBPATR = :IDPLANPREVCTBPATR))'
      '           AND (HC1.IDCARTEIRAINVEST > 0)'
      
        '           AND   ((:IDCARTEIRAGERENC  IS NULL) OR (HC1.IDCARTEIR' +
        'AGERENC  = :IDCARTEIRAGERENC))'
      
        '           AND (HC1.DATAHISTCAIXA = TO_DATE(:DATAANTERIOR,'#39'DD/MM' +
        '/YYYY'#39'))'
      
        '           GROUP BY HC1.IDPLANPREVCTBPATR, HC1.IDCARTEIRAINVEST,' +
        ' HC1.IDCARTEIRAGERENC))'
      '   AND (HC.IDCARTEIRAXEVENTO = CX.IDCARTEIRAXEVENTO)'
      '   AND (CX.IDEVENTOCAIXACOTA = EC.IDEVENTOCAIXACOTA)'
      '   AND (CX.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST)'
      '   AND (CX.IDCARTEIRAGERENC = CG.IDCARTEIRAGERENC(+))'
      '   --//FIM DA BUSCA DO SALDO ANTERIOR'
      ''
      '   UNION ALL'
      ''
      
        '   --//BUSCA DAS OPERAÇÕES GERADAS A PARTIR DE REGISTRO DIRETO N' +
        'O CAIXA'
      '   SELECT HC.DATAHISTCAIXA,'
      '          EC.DESCCAIXACOTA AS DESCCAIXACOTA,'
      
        '          DECODE(EC.STASOMADIMINUI,'#39'D'#39',HC.VLRHISTCAIXA*-1,ABS(HC' +
        '.VLRHISTCAIXA)) AS LRHISTCAIXA,'
      '          HC.SLDHISTCAIXA,'
      
        '          HC.IDHISTCAIXA, CX.IDCARTEIRAINVEST, CX.IDCARTEIRAGERE' +
        'NC,'
      '          EC.IDEVENTOCAIXACOTA,'
      
        '          DECODE(EC.STASOMADIMINUI,'#39'D'#39', 8421631, 16777088) AS ID' +
        'COR,'
      '          4 AS REG'
      
        '   FROM  HISTCAIXA HC, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC, C' +
        'ARTEIRAINVEST CI, CARTEIRAGERENC CG'
      '   WHERE'
      '       (HC.IDHISTCAIXA IN'
      '          (SELECT MAX(HC1.IDHISTCAIXA)'
      '           FROM   HISTCAIXA HC1'
      '           WHERE'
      
        '                 ((:IDPLANPREVCTBPATR IS NULL) OR (HC1.IDPLANPRE' +
        'VCTBPATR = :IDPLANPREVCTBPATR))'
      '           AND (HC1.IDCARTEIRAINVEST > 0)'
      
        '           AND   ((:IDCARTEIRAGERENC  IS NULL) OR (HC1.IDCARTEIR' +
        'AGERENC  = :IDCARTEIRAGERENC))'
      
        '           AND (HC1.DATAHISTCAIXA    = TO_DATE(:DATAINI,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '           AND (HC1.TIPMOVCAIXA      = '#39'OPE'#39')'
      '           AND (HC1.IDOPERACAOINVEST  IS NULL)'
      
        '           GROUP BY HC1.IDPLANPREVCTBPATR, HC1.IDCARTEIRAINVEST,' +
        ' HC1.IDCARTEIRAGERENC, HC1.IDCARTEIRAXEVENTO))'
      '   AND (HC.IDCARTEIRAXEVENTO    = CX.IDCARTEIRAXEVENTO)'
      '   AND (CX.IDEVENTOCAIXACOTA    = EC.IDEVENTOCAIXACOTA)'
      '   AND (CX.IDCARTEIRAINVEST     = CI.IDCARTEIRAINVEST)'
      '   AND (CG.IDCARTEIRAGERENC(+)  = CX.IDCARTEIRAGERENC)'
      
        '   --//FIM DA BUSCA DA OPERAÇÕES GERADAS A PARTIR DE REGISTRO DI' +
        'RETO NO CAIXA'
      ''
      '   UNION ALL'
      ''
      '   --//BUSCA REMUNERACAO DO CAIXA'
      '   SELECT HC.DATAHISTCAIXA,'
      '          DESCCAIXACOTA , HC.VLRHISTCAIXA, HC.SLDHISTCAIXA,'
      
        '          HC.IDHISTCAIXA, CX.IDCARTEIRAINVEST, CX.IDCARTEIRAGERE' +
        'NC,'
      '          EC.IDEVENTOCAIXACOTA, 65280 AS IDCOR,'
      '          4 AS REG'
      
        '   FROM HISTCAIXA HC, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC, CA' +
        'RTEIRAINVEST CI, CARTEIRAGERENC CG'
      '   WHERE'
      '       (HC.IDHISTCAIXA IN'
      '          (SELECT MAX(HC1.IDHISTCAIXA)'
      '           FROM   HISTCAIXA  HC1'
      '           WHERE'
      
        '                 ((:IDPLANPREVCTBPATR IS NULL) OR (HC1.IDPLANPRE' +
        'VCTBPATR = :IDPLANPREVCTBPATR))'
      '           AND (HC1.IDCARTEIRAINVEST > 0)'
      
        '           AND   ((:IDCARTEIRAGERENC  IS NULL) OR (HC1.IDCARTEIR' +
        'AGERENC  = :IDCARTEIRAGERENC))'
      
        '           AND (HC1.DATAHISTCAIXA = TO_DATE(:DATAINI,'#39'DD/MM/YYYY' +
        #39'))'
      
        '           GROUP BY HC1.IDCARTEIRAINVEST, HC1.IDCARTEIRAINVEST, ' +
        'HC1.IDCARTEIRAGERENC, HC1.IDCARTEIRAXEVENTO))'
      '   AND (HC.IDCARTEIRAXEVENTO = CX.IDCARTEIRAXEVENTO)'
      '   AND (CX.IDEVENTOCAIXACOTA = EC.IDEVENTOCAIXACOTA)'
      '   AND (CX.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST)'
      '   AND (CX.IDCARTEIRAGERENC  = CG.IDCARTEIRAGERENC(+))'
      '   AND (EC.STASOMADIMINUI IS NULL)'
      '   --//FIM DA BUSCA REMUNERACAO DO CAIXA'
      ''
      '   UNION ALL'
      ''
      '   --//BUSCA DOS DIREITOS RECEBIDOS COM FINANCEIRO'
      '   SELECT HC.DATAHISTCAIXA,'
      
        '          DECODE(HC.IDOPERACAOINVEST, NULL,EC.DESCCAIXACOTA,(EC.' +
        'DESCCAIXACOTA ||'#39'  - '#39'|| IV.DESCINVESTIMENTO)) AS DESCCAIXACOTA,'
      
        '          DECODE(EC.STASOMADIMINUI,'#39'D'#39',HC.VLRHISTCAIXA*-1,ABS(HC' +
        '.VLRHISTCAIXA)) AS VLRHISTCAIXA,'
      '          HC.SLDHISTCAIXA,'
      '          HC.IDHISTCAIXA,'
      
        '          CX.IDCARTEIRAINVEST, CX.IDCARTEIRAGERENC, EC.IDEVENTOC' +
        'AIXACOTA,'
      
        '          DECODE(EC.STASOMADIMINUI,'#39'D'#39', 8421631, 16777088) AS ID' +
        'COR,'
      '          4 AS REG'
      
        '   FROM HISTCAIXA HC, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC, CA' +
        'RTEIRAINVEST CI, CARTEIRAGERENC CG,'
      '        OPERACAOINVEST OP, INVESTIMENTO IV, TIPOOPERACAO TP'
      '   WHERE'
      '       (HC.IDHISTCAIXA IN'
      '          (SELECT MAX(IDHISTCAIXA)'
      '           FROM   HISTCAIXA HC1'
      '           WHERE'
      
        '                 ((:IDPLANPREVCTBPATR IS NULL) OR (HC1.IDPLANPRE' +
        'VCTBPATR = :IDPLANPREVCTBPATR))'
      '           AND (HC1.IDCARTEIRAINVEST > 0)'
      
        '           AND   ((:IDCARTEIRAGERENC  IS NULL) OR (HC1.IDCARTEIR' +
        'AGERENC  = :IDCARTEIRAGERENC))'
      
        '           AND (HC1.DATAHISTCAIXA = TO_DATE(:DATAINI,'#39'DD/MM/YYYY' +
        #39'))'
      '           AND (HC1.IDOPERACAOINVEST  IS NOT NULL)'
      
        '           GROUP BY HC1.IDCARTEIRAINVEST, HC1.IDCARTEIRAINVEST, ' +
        'HC1.IDCARTEIRAGERENC, HC1.IDCARTEIRAXEVENTO, HC1.IDOPERACAOINVES' +
        'T))'
      '   AND (EC.IDTIPOOPERACAO IS NOT NULL)'
      '   AND (EC.STACAIXA             = '#39'S'#39')'
      '   AND (TP.FLGOPDIREITO         = '#39'S'#39')'
      '   AND (HC.IDCARTEIRAXEVENTO    = CX.IDCARTEIRAXEVENTO)'
      '   AND (CX.IDEVENTOCAIXACOTA    = EC.IDEVENTOCAIXACOTA)'
      '   AND (CX.IDCARTEIRAINVEST     = CI.IDCARTEIRAINVEST)'
      '   AND (CG.IDCARTEIRAGERENC(+)  = CX.IDCARTEIRAGERENC)'
      '   AND (OP.IDOPERACAOINVEST(+)  = HC.IDOPERACAOINVEST)'
      '   AND (IV.IDINVESTIMENTO(+)    = OP.IDINVESTIMENTO)'
      '   AND (TP.IDTIPOOPERACAO       = EC.IDTIPOOPERACAO)'
      '   --//FIM DA BUSCA DOS DIREITOS RECEBIDOS COM FINANCEIRO'
      ''
      '   UNION ALL'
      ''
      '   --//NAO IDENTIFICADO'
      '   SELECT HC.DATAHISTCAIXA,'
      
        '          DECODE(HC.IDOPERACAOINVEST, NULL,EC.DESCCAIXACOTA,(EC.' +
        'DESCCAIXACOTA ||'#39'  - '#39'|| IV.DESCINVESTIMENTO)) AS DESCCAIXACOTA,'
      
        '          DECODE(EC.STASOMADIMINUI,'#39'D'#39',HC.VLRHISTCAIXA*-1,ABS(HC' +
        '.VLRHISTCAIXA)) AS VLRHISTCAIXA,'
      '          HC.SLDHISTCAIXA,'
      '          HC.IDHISTCAIXA,'
      
        '          CX.IDCARTEIRAINVEST, CX.IDCARTEIRAGERENC, EC.IDEVENTOC' +
        'AIXACOTA,'
      
        '          DECODE(EC.STASOMADIMINUI,'#39'D'#39', 8421631, 16777088) AS ID' +
        'COR,'
      '          4 AS REG'
      
        '   FROM HISTCAIXA HC, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC, CA' +
        'RTEIRAINVEST CI, CARTEIRAGERENC CG,'
      '        OPERACAOINVEST OP, INVESTIMENTO IV, TIPOOPERACAO TP'
      '   WHERE'
      '       (HC.IDHISTCAIXA IN'
      '          (SELECT MAX(HC1.IDHISTCAIXA)'
      '           FROM   HISTCAIXA HC1'
      '           WHERE'
      
        '                 ((:IDPLANPREVCTBPATR IS NULL) OR (HC1.IDPLANPRE' +
        'VCTBPATR = :IDPLANPREVCTBPATR))'
      '           AND (HC1.IDCARTEIRAINVEST > 0)'
      
        '           AND   ((:IDCARTEIRAGERENC  IS NULL) OR (HC1.IDCARTEIR' +
        'AGERENC  = :IDCARTEIRAGERENC))'
      
        '           AND (HC1.DATAHISTCAIXA = TO_DATE(:DATAINI,'#39'DD/MM/YYYY' +
        #39'))'
      
        '           GROUP BY HC1.IDPLANPREVCTBPATR, HC1.IDCARTEIRAINVEST,' +
        ' HC1.IDCARTEIRAGERENC, HC1.IDCARTEIRAXEVENTO, HC1.IDOPERACAOINVE' +
        'ST))'
      '   AND (EC.IDTIPOOPERACAO IS NOT NULL)'
      '   AND (EC.STACAIXA      = '#39'S'#39')'
      '   AND (TP.IDTIPOINVEST  =  2)'
      '--//   AND (TP.TIPOCUSTODIA <> '#39'N'#39')'
      '   AND (TP.FLGOPDIREITO <> '#39'S'#39')'
      '   AND (TP.TIPOMOVTO    <> '#39'OPE'#39')'
      '   AND (TP.NATUREZAOPERACAO IN ('#39'A'#39','#39'D'#39'))'
      '   AND (HC.IDCARTEIRAXEVENTO  = CX.IDCARTEIRAXEVENTO)'
      '   AND (CX.IDEVENTOCAIXACOTA  = EC.IDEVENTOCAIXACOTA)'
      '   AND (CX.IDCARTEIRAINVEST   = CI.IDCARTEIRAINVEST)'
      '   AND (CG.IDCARTEIRAGERENC(+)= CX.IDCARTEIRAGERENC)'
      '   AND (OP.IDOPERACAOINVEST(+)= HC.IDOPERACAOINVEST)'
      '   AND (IV.IDINVESTIMENTO(+)  = OP.IDINVESTIMENTO)'
      '   AND (TP.IDTIPOOPERACAO     = EC.IDTIPOOPERACAO)'
      '   --//FIM NAO IDENTIFICADO'
      ''
      '   UNION ALL'
      ''
      '   --//NAO IDENTIFICADO'
      
        '   --//RETIRADO DEVIDO NO UNION DA "BUSCA DAS OPERAÇÕES GERADAS ' +
        'A PARTIR DE REGISTRO DIRETO NO CAIXA" JA ESTAR BUSCANDO APLICAÇÃ' +
        'O E RESGATE'
      '   --//FIM NAO IDENTIFICADO'
      ''
      '   --//BUSCA VENDA DE ACOES - CCI'
      '   SELECT DATAHISTCAIXA,'
      '          DESCCAIXACOTA, SUM(VLRHISTCAIXA) AS VALOR,'
      
        '          SLDHISTCAIXA, IDHISTCAIXA, IDCARTEIRAINVEST, IDCARTEIR' +
        'AGERENC,'
      '          IDEVENTOCAIXACOTA, IDCOR, REG'
      '   FROM'
      '     ('
      '      SELECT HC.DATAHISTCAIXA,'
      '             CX.IDCARTEIRAINVEST,'
      '             CX.IDCARTEIRAGERENC,'
      '             EC.IDEVENTOCAIXACOTA,'
      
        '             DECODE(NVL(CX.IDCARTEIRAGERENC,0),0,CI.DESCCARTINVE' +
        'ST,CG.DESCCARTGERENC) AS CARTEIRA,'
      
        '             DECODE(HC.IDOPERACAOINVEST, NULL,EC.DESCCAIXACOTA,(' +
        'EC.DESCCAIXACOTA)) AS DESCCAIXACOTA,'
      '             ABS(HC.VLRHISTCAIXA)    AS VLRHISTCAIXA,'
      '             SALDOFINAL.SLDHISTCAIXA AS SLDHISTCAIXA,'
      '             SALDOFINAL.IDHISTCAIXA  AS IDHISTCAIXA,'
      
        '             DECODE(EC.STASOMADIMINUI,'#39'D'#39', 8421631, 16777088) AS' +
        ' IDCOR, 4 AS REG'
      
        '      FROM HISTCAIXA HC, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC,' +
        ' CARTEIRAINVEST CI,'
      
        '           CARTEIRAGERENC CG, OPERACAOINVEST OP, INVESTIMENTO IV' +
        ', TIPOOPERACAO TP,'
      '          (SELECT HC3.SLDHISTCAIXA, HC3.IDHISTCAIXA'
      '           FROM   HISTCAIXA HC3'
      '           WHERE'
      '                (HC3.IDHISTCAIXA IN'
      '                    (SELECT MAX(HC2.IDHISTCAIXA)'
      
        '                     FROM  HISTCAIXA HC2, CARTEIRAXEVENTO CX, EV' +
        'ENTOCAIXACOTA EC, TIPOOPERACAO TP'
      '                     WHERE'
      '                          (HC2.IDHISTCAIXA IN'
      '                             (SELECT MAX(IDHISTCAIXA)'
      '                              FROM   HISTCAIXA HC1'
      '                              WHERE'
      
        '                                    ((:IDPLANPREVCTBPATR IS NULL' +
        ') OR (HC1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      '                              AND (HC1.IDCARTEIRAINVEST > 0)'
      
        '                              AND   ((:IDCARTEIRAGERENC  IS NULL' +
        ') OR (HC1.IDCARTEIRAGERENC  = :IDCARTEIRAGERENC))'
      
        '                              AND (HC1.DATAHISTCAIXA = TO_DATE(:' +
        'DATAINI,'#39'DD/MM/YYYY'#39'))'
      
        '                             GROUP BY HC1.IDPLANPREVCTBPATR, HC1' +
        '.IDCARTEIRAINVEST, HC1.IDCARTEIRAGERENC, HC1.IDCARTEIRAXEVENTO, ' +
        'HC1.IDOPERACAOINVEST))'
      '                     AND  (EC.IDTIPOOPERACAO    IS NOT NULL)'
      '                     AND  (TP.FLGOPDIREITO     <> '#39'S'#39')'
      '                     AND  (TP.FLGCONTAINVEST    =  1)'
      '                     AND  (EC.STACAIXA          = '#39'S'#39')'
      '                     AND  (EC.STASOMADIMINUI    = '#39'S'#39')'
      '                     AND (HC2.VLRHISTCAIXA     < 0)'
      
        '                     AND  (CX.IDCARTEIRAXEVENTO = HC2.IDCARTEIRA' +
        'XEVENTO)'
      
        '                     AND  (EC.IDEVENTOCAIXACOTA = CX.IDEVENTOCAI' +
        'XACOTA)'
      
        '                     AND  (TP.IDTIPOOPERACAO    = EC.IDTIPOOPERA' +
        'CAO))))  SALDOFINAL'
      '      WHERE'
      '         (HC.IDHISTCAIXA IN'
      '            (SELECT MAX(HC4.IDHISTCAIXA)'
      '             FROM   HISTCAIXA HC4'
      '             WHERE'
      
        '                   ((:IDPLANPREVCTBPATR IS NULL) OR (HC4.IDPLANP' +
        'REVCTBPATR = :IDPLANPREVCTBPATR))'
      '             AND (HC4.IDCARTEIRAINVEST > 0)'
      
        '             AND   ((:IDCARTEIRAGERENC  IS NULL) OR (HC4.IDCARTE' +
        'IRAGERENC  = :IDCARTEIRAGERENC))'
      
        '             AND (HC4.DATAHISTCAIXA = TO_DATE(:DATAINI,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '             GROUP BY HC4.IDPLANPREVCTBPATR, HC4.IDCARTEIRAINVES' +
        'T, HC4.IDCARTEIRAGERENC, HC4.IDCARTEIRAXEVENTO, HC4.IDOPERACAOIN' +
        'VEST))'
      '      AND (EC.IDTIPOOPERACAO IS NOT NULL)'
      '      AND (TP.FLGOPDIREITO        <> '#39'S'#39')'
      '      AND (TP.FLGCONTAINVEST       = 1)'
      '      AND (EC.STACAIXA             = '#39'S'#39')'
      '      AND (EC.STASOMADIMINUI       = '#39'S'#39')'
      '      AND (HC.VLRHISTCAIXA         < 0)'
      '      AND (HC.IDCARTEIRAXEVENTO    = CX.IDCARTEIRAXEVENTO)'
      '      AND (CX.IDEVENTOCAIXACOTA    = EC.IDEVENTOCAIXACOTA)'
      '      AND (CX.IDCARTEIRAINVEST     = CI.IDCARTEIRAINVEST)'
      '      AND (CG.IDCARTEIRAGERENC(+)  = CX.IDCARTEIRAGERENC)'
      '      AND (OP.IDOPERACAOINVEST(+)  = HC.IDOPERACAOINVEST)'
      '      AND (IV.IDINVESTIMENTO(+)    = OP.IDINVESTIMENTO)'
      '      AND (TP.IDTIPOOPERACAO       = EC.IDTIPOOPERACAO)'
      '      )'
      
        '   GROUP BY DATAHISTCAIXA, DESCCAIXACOTA, SLDHISTCAIXA, IDHISTCA' +
        'IXA, IDCARTEIRAINVEST, IDCARTEIRAGERENC,'
      '            IDEVENTOCAIXACOTA, IDCOR, REG'
      '   --//FIM BUSCA VENDA DE ACOES - CCI'
      ''
      '   UNION'
      ''
      '   --//BUSCA VENDA DE ACOES - NORMAL'
      '   SELECT DATAHISTCAIXA,'
      '          DESCCAIXACOTA, SUM(VLRHISTCAIXA) AS VALOR,'
      
        '          SLDHISTCAIXA, IDHISTCAIXA, IDCARTEIRAINVEST, IDCARTEIR' +
        'AGERENC,'
      '          IDEVENTOCAIXACOTA, IDCOR, REG'
      '   FROM'
      '     ('
      '      SELECT HC.DATAHISTCAIXA,'
      '             CX.IDCARTEIRAINVEST,'
      '             CX.IDCARTEIRAGERENC,'
      '             EC.IDEVENTOCAIXACOTA,'
      
        '             DECODE(NVL(CX.IDCARTEIRAGERENC,0),0,CI.DESCCARTINVE' +
        'ST,CG.DESCCARTGERENC) AS CARTEIRA,'
      
        '             DECODE(HC.IDOPERACAOINVEST, NULL,EC.DESCCAIXACOTA,(' +
        'EC.DESCCAIXACOTA)) AS DESCCAIXACOTA,'
      '             ABS(HC.VLRHISTCAIXA)    AS VLRHISTCAIXA,'
      '             SALDOFINAL.SLDHISTCAIXA AS SLDHISTCAIXA,'
      '             SALDOFINAL.IDHISTCAIXA  AS IDHISTCAIXA,'
      
        '             DECODE(EC.STASOMADIMINUI,'#39'D'#39', 8421631, 16777088) AS' +
        ' IDCOR, 4 AS REG'
      
        '      FROM HISTCAIXA HC, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC,' +
        ' CARTEIRAINVEST CI,'
      
        '           CARTEIRAGERENC CG, OPERACAOINVEST OP, INVESTIMENTO IV' +
        ', TIPOOPERACAO TP,'
      '          (SELECT HC3.SLDHISTCAIXA, HC3.IDHISTCAIXA'
      '           FROM   HISTCAIXA HC3'
      '           WHERE'
      '                (HC3.IDHISTCAIXA IN'
      '                    (SELECT MAX(HC2.IDHISTCAIXA)'
      
        '                     FROM  HISTCAIXA HC2, CARTEIRAXEVENTO CX, EV' +
        'ENTOCAIXACOTA EC, TIPOOPERACAO TP'
      '                     WHERE'
      '                         (HC2.IDHISTCAIXA IN'
      '                             (SELECT MAX(HC1.IDHISTCAIXA)'
      '                              FROM   HISTCAIXA HC1'
      '                              WHERE'
      
        '                                    ((:IDPLANPREVCTBPATR IS NULL' +
        ') OR (HC1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      '                              AND (HC1.IDCARTEIRAINVEST > 0)'
      
        '                              AND   ((:IDCARTEIRAGERENC  IS NULL' +
        ') OR (HC1.IDCARTEIRAGERENC  = :IDCARTEIRAGERENC))'
      
        '                              AND (HC1.DATAHISTCAIXA = TO_DATE(:' +
        'DATAINI,'#39'DD/MM/YYYY'#39'))'
      
        '                              GROUP BY HC1.IDPLANPREVCTBPATR, HC' +
        '1.IDCARTEIRAINVEST, HC1.IDCARTEIRAGERENC, HC1.IDCARTEIRAXEVENTO,' +
        ' HC1.IDOPERACAOINVEST))'
      '                     AND  (EC.IDTIPOOPERACAO    IS NOT NULL)'
      '                     AND  (TP.FLGOPDIREITO     <> '#39'S'#39')'
      
        '                     AND ((TP.FLGCONTAINVEST IS NULL) OR (TP.FLG' +
        'CONTAINVEST = 0))'
      '                     AND  (EC.STACAIXA          = '#39'S'#39')'
      '                     AND  (EC.STASOMADIMINUI    = '#39'S'#39')'
      '                     AND (HC2.VLRHISTCAIXA     < 0)'
      
        '                     AND  (CX.IDCARTEIRAXEVENTO = HC2.IDCARTEIRA' +
        'XEVENTO)'
      
        '                     AND  (EC.IDEVENTOCAIXACOTA = CX.IDEVENTOCAI' +
        'XACOTA)'
      
        '                     AND  (TP.IDTIPOOPERACAO    = EC.IDTIPOOPERA' +
        'CAO))))   SALDOFINAL'
      '      WHERE'
      '          (HC.IDHISTCAIXA IN'
      '            (SELECT MAX(HC4.IDHISTCAIXA)'
      '             FROM   HISTCAIXA HC4'
      '             WHERE'
      
        '                   ((:IDPLANPREVCTBPATR IS NULL) OR (HC4.IDPLANP' +
        'REVCTBPATR = :IDPLANPREVCTBPATR))'
      '             AND (HC4.IDCARTEIRAINVEST > 0)'
      
        '             AND   ((:IDCARTEIRAGERENC  IS NULL) OR (HC4.IDCARTE' +
        'IRAGERENC  = :IDCARTEIRAGERENC))'
      
        '             AND (HC4.DATAHISTCAIXA = TO_DATE(:DATAINI,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '             GROUP BY HC4.IDPLANPREVCTBPATR, HC4.IDCARTEIRAINVES' +
        'T, HC4.IDCARTEIRAGERENC, HC4.IDCARTEIRAXEVENTO, HC4.IDOPERACAOIN' +
        'VEST))'
      '      AND  (EC.IDTIPOOPERACAO IS NOT NULL)'
      '      AND  (TP.FLGOPDIREITO        <> '#39'S'#39')'
      
        '      AND ((TP.FLGCONTAINVEST IS NULL) OR (TP.FLGCONTAINVEST = 0' +
        '))'
      '      AND  (EC.STACAIXA             = '#39'S'#39')'
      '      AND  (EC.STASOMADIMINUI       = '#39'S'#39')'
      '      AND  (HC.VLRHISTCAIXA         < 0)'
      '      AND  (HC.IDCARTEIRAXEVENTO    = CX.IDCARTEIRAXEVENTO)'
      '      AND  (CX.IDEVENTOCAIXACOTA    = EC.IDEVENTOCAIXACOTA)'
      '      AND  (CX.IDCARTEIRAINVEST     = CI.IDCARTEIRAINVEST)'
      '      AND  (CG.IDCARTEIRAGERENC(+)  = CX.IDCARTEIRAGERENC)'
      '      AND  (OP.IDOPERACAOINVEST(+)  = HC.IDOPERACAOINVEST)'
      '      AND  (IV.IDINVESTIMENTO(+)    = OP.IDINVESTIMENTO)'
      '      AND  (TP.IDTIPOOPERACAO       = EC.IDTIPOOPERACAO)'
      '      )'
      
        '   GROUP BY DATAHISTCAIXA, DESCCAIXACOTA, SLDHISTCAIXA, IDHISTCA' +
        'IXA, IDCARTEIRAINVEST, IDCARTEIRAGERENC,'
      '            IDEVENTOCAIXACOTA, IDCOR, REG'
      '   --//FIM BUSCA VENDA DE ACOES - NORMAL'
      ''
      '   UNION'
      ''
      '   --//BUSCA DE COMPRA DE ACOES'
      '   SELECT DATAHISTCAIXA,'
      '          DESCCAIXACOTA, SUM(VLRHISTCAIXA) AS VALOR,'
      
        '          SLDHISTCAIXA, IDHISTCAIXA, IDCARTEIRAINVEST, IDCARTEIR' +
        'AGERENC,'
      '          IDEVENTOCAIXACOTA, IDCOR, REG'
      '   FROM'
      '     (SELECT HC.DATAHISTCAIXA,'
      '             CX.IDCARTEIRAINVEST,'
      '             CX.IDCARTEIRAGERENC,'
      '             EC.IDEVENTOCAIXACOTA,'
      
        '             DECODE(NVL(CX.IDCARTEIRAGERENC,0),0,CI.DESCCARTINVE' +
        'ST,CG.DESCCARTGERENC) AS CARTEIRA,'
      
        '             DECODE(HC.IDOPERACAOINVEST, NULL,EC.DESCCAIXACOTA,(' +
        'EC.DESCCAIXACOTA)) AS DESCCAIXACOTA,'
      '             ABS(HC.VLRHISTCAIXA)*-1 AS VLRHISTCAIXA,'
      '             SALDOFINAL.SLDHISTCAIXA AS SLDHISTCAIXA,'
      '             SALDOFINAL.IDHISTCAIXA  AS IDHISTCAIXA,'
      
        '             DECODE(EC.STASOMADIMINUI,'#39'D'#39', 8421631, 16777088) AS' +
        ' IDCOR, 4 AS REG'
      
        '      FROM HISTCAIXA HC, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC,' +
        ' CARTEIRAINVEST CI, CARTEIRAGERENC CG,'
      '           OPERACAOINVEST OP,  INVESTIMENTO IV, TIPOOPERACAO TP,'
      '          (SELECT HC3.SLDHISTCAIXA, HC3.IDHISTCAIXA'
      '           FROM  HISTCAIXA HC3'
      '           WHERE'
      '                (HC3.IDHISTCAIXA IN'
      '                    (SELECT MAX(IDHISTCAIXA)'
      
        '                     FROM  HISTCAIXA HC2, CARTEIRAXEVENTO CX, EV' +
        'ENTOCAIXACOTA EC, TIPOOPERACAO TP'
      '                     WHERE'
      '                          (HC2.IDHISTCAIXA IN'
      '                             (SELECT MAX(HC1.IDHISTCAIXA)'
      '                              FROM   HISTCAIXA HC1'
      '                              WHERE'
      
        '                                    ((:IDPLANPREVCTBPATR IS NULL' +
        ') OR (HC1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      '                              AND (HC1.IDCARTEIRAINVEST > 0)'
      
        '                              AND   ((:IDCARTEIRAGERENC  IS NULL' +
        ') OR (HC1.IDCARTEIRAGERENC  = :IDCARTEIRAGERENC))'
      
        '                              AND (HC1.DATAHISTCAIXA = TO_DATE(:' +
        'DATAINI,'#39'DD/MM/YYYY'#39'))'
      
        '                              GROUP BY HC1.IDPLANPREVCTBPATR, HC' +
        '1.IDCARTEIRAINVEST, HC1.IDCARTEIRAGERENC, HC1.IDCARTEIRAXEVENTO,' +
        ' HC1.IDOPERACAOINVEST))'
      '                     AND  (EC.IDTIPOOPERACAO   IS NOT NULL)'
      '                     AND  (TP.FLGOPDIREITO     <> '#39'S'#39')'
      '                     AND  (EC.STACAIXA          = '#39'S'#39')'
      '                     AND  (EC.STASOMADIMINUI    = '#39'D'#39')'
      '                     AND (HC2.VLRHISTCAIXA      > 0)'
      
        '                     AND  (CX.IDCARTEIRAXEVENTO = HC2.IDCARTEIRA' +
        'XEVENTO)'
      
        '                     AND  (EC.IDEVENTOCAIXACOTA = CX.IDEVENTOCAI' +
        'XACOTA)'
      
        '                     AND  (TP.IDTIPOOPERACAO    = EC.IDTIPOOPERA' +
        'CAO))) )   SALDOFINAL'
      '      WHERE'
      '         (HC.IDHISTCAIXA IN'
      '            (SELECT MAX(HC4.IDHISTCAIXA)'
      '             FROM   HISTCAIXA HC4'
      '             WHERE'
      
        '                   ((:IDPLANPREVCTBPATR IS NULL) OR (HC4.IDPLANP' +
        'REVCTBPATR = :IDPLANPREVCTBPATR))'
      '             AND (HC4.IDCARTEIRAINVEST > 0)'
      
        '             AND   ((:IDCARTEIRAGERENC  IS NULL) OR (HC4.IDCARTE' +
        'IRAGERENC  = :IDCARTEIRAGERENC))'
      
        '             AND (HC4.DATAHISTCAIXA = TO_DATE(:DATAINI,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '             GROUP BY HC4.IDPLANPREVCTBPATR, HC4.IDCARTEIRAINVES' +
        'T, HC4.IDCARTEIRAGERENC, HC4.IDCARTEIRAXEVENTO, HC4.IDOPERACAOIN' +
        'VEST))'
      '      AND (EC.IDTIPOOPERACAO IS NOT NULL)'
      '      AND (EC.STACAIXA             = '#39'S'#39')'
      '      AND (EC.STASOMADIMINUI       = '#39'D'#39')'
      '      AND (TP.FLGOPDIREITO        <> '#39'S'#39')'
      '      AND (HC.VLRHISTCAIXA        >  0)'
      '      AND (HC.IDCARTEIRAXEVENTO    = CX.IDCARTEIRAXEVENTO)'
      '      AND (CX.IDEVENTOCAIXACOTA    = EC.IDEVENTOCAIXACOTA)'
      '      AND (CX.IDCARTEIRAINVEST     = CI.IDCARTEIRAINVEST)'
      '      AND (CG.IDCARTEIRAGERENC(+)  = CX.IDCARTEIRAGERENC)'
      '      AND (OP.IDOPERACAOINVEST(+)  = HC.IDOPERACAOINVEST)'
      '      AND (IV.IDINVESTIMENTO(+)    = OP.IDINVESTIMENTO)'
      '      AND (TP.IDTIPOOPERACAO       = EC.IDTIPOOPERACAO) )'
      
        '   GROUP BY DATAHISTCAIXA, DESCCAIXACOTA, SLDHISTCAIXA, IDHISTCA' +
        'IXA, IDCARTEIRAINVEST, IDCARTEIRAGERENC,'
      '            IDEVENTOCAIXACOTA, IDCOR, REG'
      '   --//FIM BUSCA DE COMPRA DE ACOES'
      ''
      '   UNION ALL'
      ''
      '   --//NAO IDENTIFICADO'
      '   SELECT DATAHISTCAIXA,'
      '          DESCCAIXACOTA, SUM(VLRHISTCAIXA) AS VALOR,'
      
        '          SLDHISTCAIXA, IDHISTCAIXA, IDCARTEIRAINVEST, IDCARTEIR' +
        'AGERENC,'
      '          IDEVENTOCAIXACOTA, IDCOR, REG'
      '   FROM'
      '     (SELECT HC.DATAHISTCAIXA,'
      '             CX.IDCARTEIRAINVEST,'
      '             CX.IDCARTEIRAGERENC,'
      '             EC.IDEVENTOCAIXACOTA,'
      
        '             DECODE(NVL(CX.IDCARTEIRAGERENC,0),0,CI.DESCCARTINVE' +
        'ST,CG.DESCCARTGERENC) AS CARTEIRA,'
      
        '             DECODE(HC.IDOPERACAOINVEST, NULL,EC.DESCCAIXACOTA,(' +
        'EC.DESCCAIXACOTA)) AS DESCCAIXACOTA,'
      '             ABS(HC.VLRHISTCAIXA)*-1 AS VLRHISTCAIXA,'
      '             SALDOFINAL.SLDHISTCAIXA AS SLDHISTCAIXA,'
      '             SALDOFINAL.IDHISTCAIXA  AS IDHISTCAIXA,'
      
        '             DECODE(EC.STASOMADIMINUI,'#39'D'#39', 8421631, 16777088) AS' +
        ' IDCOR, 4 AS REG'
      
        '      FROM HISTCAIXA HC, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC,' +
        ' CARTEIRAINVEST CI,'
      
        '           CARTEIRAGERENC CG, OPERACAOINVEST OP, INVESTIMENTO IV' +
        ','
      '          (SELECT HC1.SLDHISTCAIXA, HC1.IDHISTCAIXA'
      
        '           FROM  HISTCAIXA HC1, CARTEIRAXEVENTO CX, EVENTOCAIXAC' +
        'OTA EC'
      '           WHERE'
      '               (HC1.IDHISTCAIXA IN'
      '                  (SELECT MAX(HC2.IDHISTCAIXA)'
      '                   FROM   HISTCAIXA HC2'
      '                   WHERE'
      
        '                         ((:IDPLANPREVCTBPATR IS NULL) OR (HC2.I' +
        'DPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      '                   AND (HC2.IDCARTEIRAINVEST > 0)'
      
        '                   AND   ((:IDCARTEIRAGERENC  IS NULL) OR (HC2.I' +
        'DCARTEIRAGERENC  = :IDCARTEIRAGERENC))'
      
        '                   AND (HC2.DATAHISTCAIXA = TO_DATE(:DATAINI,'#39'DD' +
        '/MM/YYYY'#39')) ))'
      '           AND (EC.IDTIPOOPERACAO    IS NOT NULL)'
      '           AND (EC.STACAIXA          = '#39'S'#39')'
      '           AND (EC.STASOMADIMINUI    = '#39'D'#39')'
      '           AND (HC1.VLRHISTCAIXA    <  0)'
      '           AND (CX.IDCARTEIRAXEVENTO = HC1.IDCARTEIRAXEVENTO)'
      '           AND (EC.IDEVENTOCAIXACOTA = CX.IDEVENTOCAIXACOTA)'
      '           AND (CX.IDCARTEIRAXEVENTO = HC1.IDCARTEIRAXEVENTO)'
      
        '           AND (EC.IDEVENTOCAIXACOTA = CX.IDEVENTOCAIXACOTA))   ' +
        'SALDOFINAL'
      '      WHERE'
      '          (HC.IDHISTCAIXA IN'
      '             (SELECT MAX(HC3.IDHISTCAIXA)'
      '              FROM  HISTCAIXA HC3'
      '              WHERE'
      
        '                    ((:IDPLANPREVCTBPATR IS NULL) OR (HC3.IDPLAN' +
        'PREVCTBPATR = :IDPLANPREVCTBPATR))'
      '              AND (HC3.IDCARTEIRAINVEST > 0)'
      
        '              AND   ((:IDCARTEIRAGERENC  IS NULL) OR (HC3.IDCART' +
        'EIRAGERENC  = :IDCARTEIRAGERENC))'
      
        '              AND (HC3.DATAHISTCAIXA    = TO_DATE(:DATAINI,'#39'DD/M' +
        'M/YYYY'#39'))'
      
        '              GROUP BY HC3.IDPLANPREVCTBPATR, HC3.IDCARTEIRAINVE' +
        'ST, HC3.IDCARTEIRAGERENC, HC3.IDCARTEIRAXEVENTO, HC3.IDOPERACAOI' +
        'NVEST))'
      '      AND (EC.IDTIPOOPERACAO IS NOT NULL)'
      '      AND (EC.STACAIXA             = '#39'S'#39')'
      '      AND (EC.STASOMADIMINUI       = '#39'D'#39')'
      '      AND (HC.VLRHISTCAIXA         < 0)'
      '      AND (HC.IDCARTEIRAXEVENTO    = CX.IDCARTEIRAXEVENTO)'
      '      AND (CX.IDEVENTOCAIXACOTA    = EC.IDEVENTOCAIXACOTA)'
      '      AND (CX.IDCARTEIRAINVEST     = CI.IDCARTEIRAINVEST)'
      '      AND (CG.IDCARTEIRAGERENC(+)  = CX.IDCARTEIRAGERENC)'
      '      AND (OP.IDOPERACAOINVEST(+)  = HC.IDOPERACAOINVEST)'
      '      AND (IV.IDINVESTIMENTO(+)    = OP.IDINVESTIMENTO) )'
      
        '   GROUP BY DATAHISTCAIXA, DESCCAIXACOTA, SLDHISTCAIXA, IDHISTCA' +
        'IXA, IDCARTEIRAINVEST, IDCARTEIRAGERENC,'
      '            IDEVENTOCAIXACOTA, IDCOR, REG'
      '   --//FIM DO NAO IDENTIFICADO'
      ''
      '   UNION ALL'
      ''
      '   SELECT HC.DATAHISTCAIXA,'
      '          '#39'DESPESAS'#39' AS DESCCAIXACOTA,'
      '          SUM(HC.VLRHISTCAIXA)*-1 AS VALOR,'
      '          SALDOFINAL.SLDHISTCAIXA AS SLDHISTCAIXA,'
      '          SALDOFINAL.IDHISTCAIXA  AS IDHISTCAIXA,'
      '          HC.IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC,'
      '          EC.IDEVENTOCAIXACOTA,'
      '          8421631 AS IDCOR,'
      '          4 AS REG'
      
        '   FROM HISTCAIXA HC, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC, CA' +
        'RTEIRAINVEST CI, CARTEIRAGERENC CG, OPERACAOINVEST OP,'
      '        INVESTIMENTO IV,'
      '       (SELECT HC2.SLDHISTCAIXA, HC2.IDHISTCAIXA'
      '        FROM  HISTCAIXA HC2'
      '        WHERE'
      '            (HC2.IDHISTCAIXA IN'
      '                (SELECT MAX(HC1.IDHISTCAIXA)'
      
        '                 FROM HISTCAIXA HC1, CARTEIRAXEVENTO CX, EVENTOC' +
        'AIXACOTA EC'
      '                 WHERE'
      
        '                       ((:IDPLANPREVCTBPATR IS NULL) OR (HC1.IDP' +
        'LANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      '                 AND (HC1.IDCARTEIRAINVEST > 0)'
      
        '                 AND   ((:IDCARTEIRAGERENC  IS NULL) OR (HC1.IDC' +
        'ARTEIRAGERENC  = :IDCARTEIRAGERENC))'
      
        '                 AND (HC1.DATAHISTCAIXA     = TO_DATE(:DATAINI,'#39 +
        'DD/MM/YYYY'#39'))'
      '                 AND  (EC.IDTIPODESPINVEST IS NOT NULL)'
      
        '                 AND  (CX.IDCARTEIRAXEVENTO = HC1.IDCARTEIRAXEVE' +
        'NTO)'
      
        '                 AND  (EC.IDEVENTOCAIXACOTA = CX.IDEVENTOCAIXACO' +
        'TA))) )   SALDOFINAL'
      '   WHERE'
      
        '        ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPREVCTBPATR =' +
        ' :IDPLANPREVCTBPATR))'
      '   AND (HC.IDCARTEIRAINVEST > 0)'
      
        '   AND  ((:IDCARTEIRAGERENC  IS NULL) OR (HC.IDCARTEIRAGERENC  =' +
        ' :IDCARTEIRAGERENC))'
      
        '   AND (HC.DATAHISTCAIXA        = TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')' +
        ')'
      '   AND (EC.IDTIPODESPINVEST  IS NOT NULL)'
      '   AND (HC.IDCARTEIRAXEVENTO    = CX.IDCARTEIRAXEVENTO)'
      '   AND (CX.IDEVENTOCAIXACOTA    = EC.IDEVENTOCAIXACOTA)'
      '   AND (CX.IDCARTEIRAINVEST     = CI.IDCARTEIRAINVEST)'
      '   AND (CG.IDCARTEIRAGERENC(+)  = CX.IDCARTEIRAGERENC)'
      '   AND (OP.IDOPERACAOINVEST(+)  = HC.IDOPERACAOINVEST)'
      '   AND (IV.IDINVESTIMENTO(+)    = OP.IDINVESTIMENTO)'
      
        '   GROUP BY HC.DATAHISTCAIXA,SALDOFINAL.SLDHISTCAIXA, SALDOFINAL' +
        '.IDHISTCAIXA, HC.IDCARTEIRAINVEST,'
      '           HC.IDCARTEIRAGERENC, EC.IDEVENTOCAIXACOTA'
      ')'
      'WHERE'
      '   (((:VARGROUP = '#39'S'#39') AND'
      '       IDHISTCAIXA = (SELECT MAX(IDHISTCAIXA)'
      '                      FROM   HISTCAIXA'
      '                      WHERE '
      
        '                          ((:IDPLANPREVCTBPATR IS NULL) OR (IDPL' +
        'ANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      '                      AND   (IDCARTEIRAINVEST > 0)'
      
        '                      AND ((:IDCARTEIRAGERENC IS NULL) OR (IDCAR' +
        'TEIRAGERENC = :IDCARTEIRAGERENC))'
      
        '                      AND   (DATAHISTCAIXA = TO_DATE(:DATAINI,'#39'D' +
        'D/MM/YYYY'#39'))'
      '                      ))  OR'
      '    ((:VARGROUP = '#39'A'#39')))'
      ''
      '--- FIM SALDO DE CAIXA ---'
      ''
      
        'ORDER BY TIPOREL, DATAOPER, IDHISTCAIXA, REG, IDEVENTOCAIXACOTA ' +
        'DESC, INVESTIMENTO, OPERACAO ')
    ValidateWithMask = True
    Left = 157
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'VARGROUP'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VARGROUP'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VARGROUP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VARGROUP'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAANTERIOR'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VARGROUP'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VARGROUP'
        ParamType = ptInput
      end>
    object qryCartGerencialDetTIPOREL: TFloatField
      FieldName = 'TIPOREL'
    end
    object qryCartGerencialDetCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Size = 60
    end
    object qryCartGerencialDetCODISIN: TStringField
      FieldName = 'CODISIN'
      Size = 14
    end
    object qryCartGerencialDetINVESTIMENTO: TStringField
      FieldName = 'INVESTIMENTO'
      Size = 60
    end
    object qryCartGerencialDetDATAOPER: TDateTimeField
      FieldName = 'DATAOPER'
    end
    object qryCartGerencialDetVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryCartGerencialDetQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object qryCartGerencialDetCOTACAO: TFloatField
      FieldName = 'COTACAO'
      DisplayFormat = '###,###,###,##0.000000000'
    end
    object qryCartGerencialDetLOTE: TFloatField
      FieldName = 'LOTE'
    end
    object qryCartGerencialDetIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryCartGerencialDetIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryCartGerencialDetIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryCartGerencialDetOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 60
    end
    object qryCartGerencialDetVENCIMENTO: TDateTimeField
      FieldName = 'VENCIMENTO'
    end
    object qryCartGerencialDetCORRETORA: TStringField
      FieldName = 'CORRETORA'
      Size = 10
    end
    object qryCartGerencialDetSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object qryCartGerencialDetIDEVENTOCAIXACOTA: TFloatField
      FieldName = 'IDEVENTOCAIXACOTA'
    end
    object qryCartGerencialDetIDCOR: TFloatField
      FieldName = 'IDCOR'
    end
    object qryCartGerencialDetIDHISTCAIXA: TFloatField
      FieldName = 'IDHISTCAIXA'
    end
    object qryCartGerencialDetDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qryCartGerencialDetREG: TFloatField
      FieldName = 'REG'
    end
  end
  object dsCartGerencialDet: TwwDataSource
    AutoEdit = False
    DataSet = qryCartGerencialDet
    Left = 157
    Top = 168
  end
  object pplResumoCota: TppBDEPipeline
    DataSource = dsResumoCota
    UserName = 'pplResumoCota'
    Left = 259
    Top = 8
  end
  object pplRentabilidade: TppBDEPipeline
    DataSource = dsRentabilidadeCota
    UserName = 'pplRentabilidade'
    Left = 538
    Top = 8
    object pplRentabilidadeppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRZMES'
      FieldName = 'VLRZMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplRentabilidadeppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRZANO'
      FieldName = 'VLRZANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplRentabilidadeppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRZDIA'
      FieldName = 'VLRZDIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
  end
  object qryAnaliticoCompra: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT DATAOPERACAO,'
      '       NUMDOCUMENTO,'
      '       DESCINVESTIMENTO,'
      '       QTDE,'
      '       PRECO,'
      '       VLROPERACAO,'
      '       0.000 AS RATEIO,'
      '       0.000 AS TOTDESP,'
      '       0.000 AS TOTQTD'
      'FROM ('
      '        SELECT DATAOPERACAO,'
      '               NUMDOCUMENTO,'
      '               QTDEOPERACAO        AS QTDE,'
      '               PRECOUNITOPERACAO   AS PRECO,'
      '               IV.DESCINVESTIMENTO,'
      '               OI.VLROPERACAO'
      '          FROM HISTCARTINV    HC,'
      '               OPERACAOINVEST OI,'
      '               TIPOOPERACAO   TP,'
      '               INVESTIMENTO   IV'
      '         WHERE'
      '                (HC.IDTIPOINVEST      = 2)'
      
        '           AND   ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPREV' +
        'CTBPATR = :IDPLANPREVCTBPATR))'
      '           AND  (HC.IDCARTEIRAINVEST > 0)'
      
        '           AND   ((:IDCARTEIRAGERENC  IS NULL) OR (HC.IDCARTEIRA' +
        'GERENC  = :IDCARTEIRAGERENC))'
      '           AND  (HC.IDINVESTIMENTO   > 0)'
      
        '           AND  (HC.DATAMOVCARTINV   <= TO_DATE(:DT_FIM,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '           AND  (HC.TIPMOVCARTINV     = '#39'OPE'#39')'
      '           AND  (HC.NATURMOVCARTINV   = '#39'A'#39')'
      ''
      '           AND  (OI.IDTIPOINVEST      = 2)'
      
        '           AND  (OI.DATAOPERACAO     <= TO_DATE(:DT_INI,'#39'DD/MM/Y' +
        'YYY'#39'))'
      
        '           AND ((OI.DATAVENCOPER     >  TO_DATE(:DT_INI,'#39'DD/MM/Y' +
        'YYY'#39'))'
      
        '           AND  (OI.DATAVENCOPER     <= TO_DATE(:DT_FIM,'#39'DD/MM/Y' +
        'YYY'#39')))'
      '           AND  (OI.IDOPERACAODIREITO IS NULL)'
      '           AND  (OI.IDOPERACAOINVEST   = HC.IDOPERACAOINVEST)'
      ''
      '           AND  (TP.IDTIPOINVEST       = 2)'
      '           AND  (TP.IDTIPOOPERACAO     = OI.IDTIPOOPERACAO)'
      '           AND  (TP.FLGCORRET          = '#39'S'#39')'
      '           AND  (IV.IDTIPOINVEST       = 2)'
      '           AND  (IV.IDINVESTIMENTO     = OI.IDINVESTIMENTO)'
      '       )'
      'ORDER BY DATAOPERACAO, NUMDOCUMENTO, DESCINVESTIMENTO, PRECO'
      ' ')
    ValidateWithMask = True
    Left = 256
    Top = 120
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_FIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_INI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_INI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_FIM'
        ParamType = ptInput
      end>
    object qryAnaliticoCompraNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryAnaliticoCompraDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryAnaliticoCompraQTDE: TFloatField
      FieldName = 'QTDE'
      DisplayFormat = '#,##0'
      EditFormat = '#,##0'
    end
    object qryAnaliticoCompraPRECO: TFloatField
      FieldName = 'PRECO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryAnaliticoCompraVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryAnaliticoCompraRATEIO: TFloatField
      FieldName = 'RATEIO'
    end
    object qryAnaliticoCompraTOTDESP: TFloatField
      FieldName = 'TOTDESP'
    end
    object qryAnaliticoCompraTOTQTD: TFloatField
      FieldName = 'TOTQTD'
    end
    object qryAnaliticoCompraDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
  end
  object pplAnaliticoCompra: TppBDEPipeline
    DataSource = dsAnaliticoCompra
    UserName = 'lAnaliticoCompra'
    Left = 256
    Top = 64
  end
  object dsAnaliticoCompra: TwwDataSource
    AutoEdit = False
    DataSet = qryAnaliticoCompra
    Left = 256
    Top = 168
  end
  object qryAnaliticoVenda: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT DATAOPERACAO,'
      '       NUMDOCUMENTO,'
      '       DESCINVESTIMENTO,'
      '       QTDE,'
      '       PRECO,'
      '       VLROPERACAO,'
      '       0.000 AS RATEIO,'
      '       0.000 AS TOTDESP,'
      '       0.000 AS TOTQTD'
      'FROM ('
      '        SELECT DATAOPERACAO,'
      '               NUMDOCUMENTO,'
      '               QTDEOPERACAO        AS QTDE,'
      '               PRECOUNITOPERACAO   AS PRECO,'
      '               IV.DESCINVESTIMENTO,'
      '               OI.VLROPERACAO'
      '          FROM HISTCARTINV    HC,'
      '               OPERACAOINVEST OI,'
      '               TIPOOPERACAO   TP,'
      '               INVESTIMENTO   IV'
      '         WHERE'
      '                (HC.IDTIPOINVEST      = 2)'
      
        '           AND   ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPREV' +
        'CTBPATR = :IDPLANPREVCTBPATR))'
      '           AND  (HC.IDCARTEIRAINVEST > 0)'
      
        '           AND   ((:IDCARTEIRAGERENC  IS NULL) OR (HC.IDCARTEIRA' +
        'GERENC  = :IDCARTEIRAGERENC))'
      '           AND  (HC.IDINVESTIMENTO   > 0)'
      
        '           AND  (HC.DATAMOVCARTINV   <= TO_DATE(:DT_FIM,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '           AND  (HC.TIPMOVCARTINV     = '#39'OPE'#39')'
      '           AND  (HC.NATURMOVCARTINV   = '#39'D'#39')'
      ''
      '           AND  (OI.IDTIPOINVEST      = 2)'
      
        '           AND  (OI.DATAOPERACAO     <= TO_DATE(:DT_INI,'#39'DD/MM/Y' +
        'YYY'#39'))'
      
        '           AND ((OI.DATAVENCOPER     >  TO_DATE(:DT_INI,'#39'DD/MM/Y' +
        'YYY'#39'))'
      
        '           AND  (OI.DATAVENCOPER     <= TO_DATE(:DT_FIM,'#39'DD/MM/Y' +
        'YYY'#39')))'
      '           AND  (OI.IDOPERACAODIREITO IS NULL)'
      '           AND  (OI.IDOPERACAOINVEST  = HC.IDOPERACAOINVEST)'
      ''
      '           AND  (TP.IDTIPOINVEST      = 2)'
      '           AND  (TP.IDTIPOOPERACAO    = OI.IDTIPOOPERACAO)'
      '           AND  (TP.FLGCORRET         = '#39'S'#39')'
      '           AND  (IV.IDTIPOINVEST      = 2)'
      '           AND  (IV.IDINVESTIMENTO    = OI.IDINVESTIMENTO)'
      '       )'
      'ORDER BY DATAOPERACAO, NUMDOCUMENTO, DESCINVESTIMENTO, PRECO')
    ValidateWithMask = True
    Left = 352
    Top = 120
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_FIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_INI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_INI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_FIM'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object StringField2: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object FloatField1: TFloatField
      FieldName = 'QTDE'
      DisplayFormat = '#,##0'
      EditFormat = '#,##0'
    end
    object FloatField2: TFloatField
      FieldName = 'PRECO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object FloatField3: TFloatField
      FieldName = 'VLROPERACAO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryAnaliticoVendaRATEIO: TFloatField
      FieldName = 'RATEIO'
    end
    object qryAnaliticoVendaTOTDESP: TFloatField
      FieldName = 'TOTDESP'
    end
    object qryAnaliticoVendaTOTQTD: TFloatField
      FieldName = 'TOTQTD'
    end
    object qryAnaliticoVendaDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
  end
  object pplAnaliticoVenda: TppBDEPipeline
    DataSource = dsAnaliticoVenda
    UserName = 'pplAnaliticoVenda'
    Left = 352
    Top = 64
  end
  object dsAnaliticoVenda: TwwDataSource
    AutoEdit = False
    DataSet = qryAnaliticoVenda
    Left = 352
    Top = 168
  end
  object qryAnaliticoDesp: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT DATAOPERACAO,'
      '       NUMDOCUMENTO,'
      '       DESCINVESTIMENTO,'
      
        '       ROUND(((TOTDESP/DECODE(TOTDESP,0,0,TOTQTD))*QTDE),2) AS R' +
        'ATEIO,'
      '       QTDE,'
      '       PRECOUNITOPERACAO AS PRECO,'
      '       TOTDESP,'
      '       TOTQTD,'
      '       0.000 AS VLROPERACAO'
      ''
      '  FROM ('
      '        SELECT '#39'DESPESAS A PAGAR'#39' AS DESCRICAO,'
      '               OI.NUMDOCUMENTO,'
      '               OI.QTDEOPERACAO AS QTDE,'
      
        '               OI.DATAOPERACAO, OI.DATAVENCOPER, OI.IDOPERACAOIN' +
        'VEST,'
      
        '               OI.IDCARTEIRAINVEST, OI.IDCARTEIRAGERENC, OI.PREC' +
        'OUNITOPERACAO, IV.DESCINVESTIMENTO,'
      '               (SELECT SUM(DP.VLRDESPOPER)'
      '                FROM DESPOPERINVEST DP, OPERACAOINVEST OII'
      '                WHERE'
      '                      (OII.IDTIPOINVEST    = 2)'
      '                  AND (OII.NUMDOCUMENTO    = OI.NUMDOCUMENTO)'
      '                  AND (OII.IDCARTEIRAGERENC IS NOT NULL)'
      
        '                  AND (DP.IDOPERACAOINVEST = OII.IDOPERACAOINVES' +
        'T))*-1 AS TOTDESP,'
      '               (SELECT SUM(OII.QTDEOPERACAO)'
      '                FROM   OPERACAOINVEST OII'
      '                WHERE'
      '                      (OII.IDTIPOINVEST    = 2)'
      '                  AND (OII.NUMDOCUMENTO    = OI.NUMDOCUMENTO)'
      
        '                  AND (OII.IDCARTEIRAGERENC IS NOT NULL)) AS TOT' +
        'QTD'
      '          FROM OPERACAOINVEST OI, INVESTIMENTO IV'
      '         WHERE'
      '                (OI.IDTIPOINVEST     = 2)'
      
        '           AND   ((:IDPLANPREVCTBPATR IS NULL) OR (OI.IDPLANPREV' +
        'CTBPATR = :IDPLANPREVCTBPATR))'
      '           AND  (OI.IDCARTEIRAINVEST > 0)'
      
        '           AND   ((:IDCARTEIRAGERENC  IS NULL) OR (OI.IDCARTEIRA' +
        'GERENC  = :IDCARTEIRAGERENC))'
      '           AND  (OI.IDINVESTIMENTO   > 0)'
      
        '           AND  (OI.DATAOPERACAO     <= TO_DATE(:DT_INI,'#39'DD/MM/Y' +
        'YYY'#39'))'
      
        '           AND ((OI.DATAVENCOPER     >  TO_DATE(:DT_INI,'#39'DD/MM/Y' +
        'YYY'#39')) AND'
      
        '                (OI.DATAVENCOPER     <= TO_DATE(:DT_FIM,'#39'DD/MM/Y' +
        'YYY'#39')))'
      '           AND  (IV.IDTIPOINVEST      = 2)'
      '           AND  (IV.IDINVESTIMENTO    = OI.IDINVESTIMENTO)'
      '       )'
      
        'ORDER BY DATAOPERACAO, NUMDOCUMENTO, DESCINVESTIMENTO, PRECOUNIT' +
        'OPERACAO')
    ValidateWithMask = True
    Left = 444
    Top = 120
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_INI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_INI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_FIM'
        ParamType = ptInput
      end>
    object qryAnaliticoDespNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryAnaliticoDespDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryAnaliticoDespRATEIO: TFloatField
      FieldName = 'RATEIO'
    end
    object qryAnaliticoDespQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object qryAnaliticoDespPRECO: TFloatField
      FieldName = 'PRECO'
    end
    object qryAnaliticoDespTOTDESP: TFloatField
      FieldName = 'TOTDESP'
    end
    object qryAnaliticoDespTOTQTD: TFloatField
      FieldName = 'TOTQTD'
    end
    object qryAnaliticoDespVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryAnaliticoDespDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
  end
  object pplAnaliticoDesp: TppBDEPipeline
    DataSource = dsAnaliticoDesp
    UserName = 'pplAnaliticoDesp'
    Left = 444
    Top = 64
  end
  object dsAnaliticoDesp: TwwDataSource
    AutoEdit = False
    DataSet = qryAnaliticoDesp
    Left = 444
    Top = 168
  end
  object qryResumoCota: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT EC.DESCCAIXACOTA, NVL(SD.VLRHISTCOTA,0) AS VLRHISTCOTA, E' +
        'C.IDEVENTOCAIXACOTA,'
      
        '       DECODE(EC.IDEVENTOCAIXACOTA, -1,-4,EC.IDEVENTOCAIXACOTA) ' +
        'AS IDORDEM'
      'FROM EVENTOCAIXACOTA EC,'
      '     (SELECT EC.IDEVENTOCAIXACOTA, HC.VLRHISTCOTA'
      '      FROM HISTCOTA HC, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC'
      '      WHERE'
      '          HC.IDHISTCOTA IN'
      '            (SELECT MAX(IDHISTCOTA)'
      '             FROM HISTCOTA'
      '             WHERE'
      
        '                 ((:IDPLANPREVCTBPATR IS NULL) OR (IDPLANPREVCTB' +
        'PATR = :IDPLANPREVCTBPATR))'
      '             AND   (IDCARTEIRAINVEST > 0)'
      
        '             AND ((:IDCARTEIRAGERENC  IS NULL) OR (IDCARTEIRAGER' +
        'ENC  = :IDCARTEIRAGERENC))'
      
        '             AND   (DATAHISTCOTA      = TO_DATE(:DATA,'#39'DD/MM/YYY' +
        'Y'#39'))'
      '             GROUP BY IDCARTEIRAXEVENTO'
      '             )'
      '      AND HC.VLRHISTCOTA > 0'
      '      AND EC.IDEVENTOCAIXACOTA IN (-1,-2,-3)      '
      '      AND CX.IDCARTEIRAXEVENTO = HC.IDCARTEIRAXEVENTO'
      '      AND CX.IDEVENTOCAIXACOTA = EC.IDEVENTOCAIXACOTA(+)'
      '      ) SD'
      'WHERE EC.IDEVENTOCAIXACOTA < 0'
      '  AND EC.IDEVENTOCAIXACOTA = SD.IDEVENTOCAIXACOTA(+)'
      'ORDER BY IDORDEM'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 356
    Top = 8
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end>
    object qryResumoCotaDESCCAIXACOTA: TStringField
      FieldName = 'DESCCAIXACOTA'
      Size = 40
    end
    object qryResumoCotaVLRHISTCOTA: TFloatField
      FieldName = 'VLRHISTCOTA'
    end
    object qryResumoCotaIDEVENTOCAIXACOTA: TFloatField
      FieldName = 'IDEVENTOCAIXACOTA'
    end
  end
  object dsResumoCota: TwwDataSource
    AutoEdit = False
    DataSet = qryResumoCota
    Left = 443
    Top = 8
  end
  object qryRentabilidadeCota: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '        ROUND(DECODE(VLRCOTADIA,0,0,(((VLRCOTAATU / VLRCOTADIA)-' +
        '1)*100)),2) AS VLRZDIA,'
      
        '        ROUND(DECODE(VLRCOTAMES,0,0,(((VLRCOTAATU / VLRCOTAMES)-' +
        '1)*100)),2) AS VLRZMES,'
      
        '        ROUND(DECODE(VLRCOTAANO,0,0,(((VLRCOTAATU / VLRCOTAANO)-' +
        '1)*100)),2) AS VLRZANO'
      'FROM'
      ''
      
        '(SELECT NVL(HC.VLRHISTCOTA,0) AS VLRCOTAATU, EC.IDEVENTOCAIXACOT' +
        'A'
      ' FROM HISTCOTA HC, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC'
      ' WHERE'
      
        '      ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      ' AND (HC.IDCARTEIRAINVEST     >  0)'
      
        ' AND  ((:IDCARTEIRAGERENC  IS NULL) OR (HC.IDCARTEIRAGERENC  = :' +
        'IDCARTEIRAGERENC))'
      ' AND (HC.DATAHISTCOTA         = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))'
      ' AND (HC.VLRHISTCOTA         >  0)'
      ' AND (EC.IDEVENTOCAIXACOTA    = -2)'
      ' AND (EC.IDEVENTOCAIXACOTA(+) = CX.IDEVENTOCAIXACOTA)'
      ' AND (CX.IDCARTEIRAXEVENTO    = HC.IDCARTEIRAXEVENTO)) DTATU,'
      ''
      
        '(SELECT NVL(HC.VLRHISTCOTA,0) AS VLRCOTADIA, EC.IDEVENTOCAIXACOT' +
        'A'
      ' FROM HISTCOTA HC, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC'
      ' WHERE'
      
        '      ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      ' AND (HC.IDCARTEIRAINVEST     >  0)'
      
        ' AND  ((:IDCARTEIRAGERENC  IS NULL) OR (HC.IDCARTEIRAGERENC  = :' +
        'IDCARTEIRAGERENC))'
      ' AND (HC.DATAHISTCOTA = (SELECT MAX(DATAHISTCOTA)'
      '                         FROM HISTCOTA'
      '                         WHERE'
      
        '                             ((:IDPLANPREVCTBPATR IS NULL) OR (I' +
        'DPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      '                         AND   (IDCARTEIRAINVEST     >  0)'
      
        '                         AND ((:IDCARTEIRAGERENC  IS NULL) OR (I' +
        'DCARTEIRAGERENC  = :IDCARTEIRAGERENC))'
      
        '                         AND   (DATAHISTCOTA <= (TO_DATE(:DATA,'#39 +
        'DD/MM/YYYY'#39') - 1) ) ) )'
      ' AND (HC.VLRHISTCOTA  > 0)'
      ' AND (CX.IDCARTEIRAXEVENTO = HC.IDCARTEIRAXEVENTO)'
      ' AND (EC.IDEVENTOCAIXACOTA = -2)'
      ' AND (EC.IDEVENTOCAIXACOTA(+) = CX.IDEVENTOCAIXACOTA)) DTDIAANT,'
      ''
      
        '(SELECT NVL(HC.VLRHISTCOTA,0) AS VLRCOTAMES, EC.IDEVENTOCAIXACOT' +
        'A'
      ' FROM HISTCOTA HC, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC'
      ' WHERE'
      
        '      ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      ' AND (HC.IDCARTEIRAINVEST     >  0)'
      
        ' AND  ((:IDCARTEIRAGERENC  IS NULL) OR (HC.IDCARTEIRAGERENC  = :' +
        'IDCARTEIRAGERENC))'
      ' AND (HC.DATAHISTCOTA = (SELECT MAX(DATAHISTCOTA)'
      '                         FROM HISTCOTA'
      '                         WHERE'
      
        '                             ((:IDPLANPREVCTBPATR IS NULL) OR (I' +
        'DPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      '                         AND   (IDCARTEIRAINVEST     >  0)'
      
        '                         AND ((:IDCARTEIRAGERENC  IS NULL) OR (I' +
        'DCARTEIRAGERENC  = :IDCARTEIRAGERENC))'
      
        '                         AND   (DATAHISTCOTA <= LAST_DAY((TO_DAT' +
        'E(:DATA,'#39'DD/MM/YYYY'#39') -'
      
        '                                                   TO_NUMBER(DEC' +
        'ODE(TO_CHAR(TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'),'#39'DD'#39'),31,31,30))))) ) )'
      ' AND (HC.VLRHISTCOTA > 0)'
      ' AND (CX.IDCARTEIRAXEVENTO = HC.IDCARTEIRAXEVENTO)'
      ' AND (EC.IDEVENTOCAIXACOTA = -2)'
      ' AND (EC.IDEVENTOCAIXACOTA(+) = CX.IDEVENTOCAIXACOTA)) DTMESANT,'
      ''
      
        '(SELECT NVL(HC.VLRHISTCOTA,0) AS VLRCOTAANO, EC.IDEVENTOCAIXACOT' +
        'A'
      ' FROM HISTCOTA HC, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC'
      ' WHERE'
      
        '      ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      ' AND (HC.IDCARTEIRAINVEST     >  0)'
      
        ' AND  ((:IDCARTEIRAGERENC  IS NULL) OR (HC.IDCARTEIRAGERENC  = :' +
        'IDCARTEIRAGERENC))'
      ' AND (HC.DATAHISTCOTA = (SELECT MAX(DATAHISTCOTA)'
      '                         FROM HISTCOTA'
      '                         WHERE'
      
        '                             ((:IDPLANPREVCTBPATR IS NULL) OR (I' +
        'DPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      '                         AND   (IDCARTEIRAINVEST     >  0)'
      
        '                         AND ((:IDCARTEIRAGERENC  IS NULL) OR (I' +
        'DCARTEIRAGERENC  = :IDCARTEIRAGERENC))'
      '                         AND (((:DATA IS NOT NULL) AND'
      
        '                                (DATAHISTCOTA <= TO_DATE('#39'31/12/' +
        #39' || TO_CHAR(TO_NUMBER(TO_CHAR(TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'),'#39'YYYY' +
        #39')) -1,'#39'9999'#39'),'#39'DD/MM/YYYY'#39'))) OR'
      '                              ((:DATA IS NULL) AND'
      
        '                                (DATAHISTCOTA <= TO_DATE(:DATA,'#39 +
        'DD/MM/YYYY'#39')))) ) )'
      ' AND (HC.VLRHISTCOTA > 0)'
      ' AND (CX.IDCARTEIRAXEVENTO = HC.IDCARTEIRAXEVENTO)'
      ' AND (EC.IDEVENTOCAIXACOTA = -2)'
      ' AND (EC.IDEVENTOCAIXACOTA(+) = CX.IDEVENTOCAIXACOTA) ) DTANOANT')
    ValidateWithMask = True
    Left = 538
    Top = 64
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end>
    object qryRentabilidadeCotaVLRZMES: TFloatField
      FieldName = 'VLRZMES'
      DisplayFormat = '###,###,##0.0000'
    end
    object qryRentabilidadeCotaVLRZANO: TFloatField
      FieldName = 'VLRZANO'
      DisplayFormat = '###,###,##0.0000'
    end
    object qryRentabilidadeCotaVLRZDIA: TFloatField
      FieldName = 'VLRZDIA'
      DisplayFormat = '###,###,##0.0000'
    end
  end
  object dsRentabilidadeCota: TwwDataSource
    AutoEdit = False
    DataSet = qryRentabilidadeCota
    Left = 538
    Top = 119
  end
end
