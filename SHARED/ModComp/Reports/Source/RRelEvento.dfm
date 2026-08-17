inherited RptRelEvento: TRptRelEvento
  Left = 245
  Top = 228
  Width = 288
  Height = 276
  Caption = 'RptRelEvento'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpRelEvento
  end
  object rpRelEvento: TppReport
    AutoStop = False
    DataPipeline = ppRelEvento
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Lista de Presença'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 216
    Top = 8
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppRelEvento'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 45773
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppRelEvento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelEvento'
        mmHeight = 5842
        mmLeft = 86365
        mmTop = 529
        mmWidth = 24384
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = ppRelEvento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelEvento'
        mmHeight = 4022
        mmLeft = 26194
        mmTop = 15346
        mmWidth = 20870
        BandType = 0
      end
      object rpTabCursosLbl1: TppLabel
        UserName = 'rpBenefPorPessoaLbl1'
        AutoSize = False
        Caption = 'Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 161132
        mmTop = 3175
        mmWidth = 9790
        BandType = 0
      end
      object rpTabCursosLbl2: TppLabel
        UserName = 'rpBenefPorPessoaLbl2'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 156104
        mmTop = 7408
        mmWidth = 14817
        BandType = 0
      end
      object rpTabCursosCalc1: TppSystemVariable
        UserName = 'rpBenefPorPessoaCalc1'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 171715
        mmTop = 3175
        mmWidth = 7938
        BandType = 0
      end
      object rpTabCursosCalc2: TppSystemVariable
        UserName = 'rpBenefPorPessoaCalc2'
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 171715
        mmTop = 7408
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Entidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 21696
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText20'
        DataField = 'ENTIDADE'
        DataPipeline = ppRelEvento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelEvento'
        mmHeight = 4233
        mmLeft = 26194
        mmTop = 21696
        mmWidth = 137319
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Local:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 28575
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText36: TppDBText
        UserName = 'DBText202'
        DataField = 'LOCAL'
        DataPipeline = ppRelEvento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelEvento'
        mmHeight = 4233
        mmLeft = 26194
        mmTop = 28575
        mmWidth = 137319
        BandType = 0
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        AutoSize = True
        DataField = 'CARGAHORARIA'
        DataPipeline = ppRelEvento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelEvento'
        mmHeight = 4022
        mmLeft = 26194
        mmTop = 35190
        mmWidth = 28490
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Carga Hor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 35190
        mmWidth = 18256
        BandType = 0
      end
      object ppDBText38: TppDBText
        UserName = 'DBText24'
        AutoSize = True
        DataField = 'DATAINI'
        DataPipeline = ppRelEvento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelEvento'
        mmHeight = 4022
        mmLeft = 26194
        mmTop = 40746
        mmWidth = 13377
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Relatório Completo de Evento de Treinamento '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 51329
        mmTop = 6879
        mmWidth = 94456
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DATAFIM'
        DataPipeline = ppRelEvento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelEvento'
        mmHeight = 4233
        mmLeft = 48154
        mmTop = 40746
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 40746
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 44715
        mmTop = 40746
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Treinamento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 15346
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Status:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 116417
        mmTop = 35190
        mmWidth = 11906
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'STATUS'
        DataPipeline = ppRelEvento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelEvento'
        mmHeight = 4022
        mmLeft = 130704
        mmTop = 35190
        mmWidth = 13420
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'EMPREGADO'
        DataPipeline = ppRelEvento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelEvento'
        mmHeight = 3969
        mmLeft = 20902
        mmTop = 1588
        mmWidth = 93134
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'MATRICULA'
        DataPipeline = ppRelEvento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelEvento'
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 1588
        mmWidth = 17463
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 2646
        mmTop = 6879
        mmWidth = 190500
        BandType = 4
      end
      object ppDBTextTeor: TppDBText
        UserName = 'DBTextTeor'
        DataField = 'AVALTEOR'
        DataPipeline = ppRelEvento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'ppRelEvento'
        mmHeight = 4233
        mmLeft = 115094
        mmTop = 1588
        mmWidth = 16404
        BandType = 4
      end
      object ppDBTextPrat: TppDBText
        UserName = 'DBTextPrat'
        DataField = 'AVALPRAT'
        DataPipeline = ppRelEvento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'ppRelEvento'
        mmHeight = 4233
        mmLeft = 134938
        mmTop = 1588
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'PRESENCAS'
        DataPipeline = ppRelEvento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelEvento'
        mmHeight = 4233
        mmLeft = 168805
        mmTop = 1588
        mmWidth = 15346
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 30956
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'VALOR'
        DataPipeline = ppRelEvento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelEvento'
        mmHeight = 4233
        mmLeft = 158221
        mmTop = 4763
        mmWidth = 21696
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'DESPESAS'
        DataPipeline = ppRelEvento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelEvento'
        mmHeight = 4233
        mmLeft = 158221
        mmTop = 10583
        mmWidth = 21696
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'TOTAL'
        DataPipeline = ppRelEvento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelEvento'
        mmHeight = 4233
        mmLeft = 158221
        mmTop = 15875
        mmWidth = 21696
        BandType = 7
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Total Gasto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 125413
        mmTop = 4763
        mmWidth = 20902
        BandType = 7
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Total Despesas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 125677
        mmTop = 10583
        mmWidth = 27252
        BandType = 7
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 125677
        mmTop = 15875
        mmWidth = 19844
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'EMPREGADO'
        DataPipeline = ppRelEvento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppRelEvento'
        mmHeight = 4233
        mmLeft = 52123
        mmTop = 4763
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Nº Inscrições:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 26194
        mmTop = 4763
        mmWidth = 23548
        BandType = 7
      end
      object ppSubAvalCurso: TppSubReport
        UserName = 'SubAvalCurso'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppAval'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 25400
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppAval
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Lista de Presença'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utScreenPixels
          Left = 144
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppAval'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object ppLabel20: TppLabel
              UserName = 'Label20'
              Caption = 'Resumo das Avaliações do Curso'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 5027
              mmLeft = 71967
              mmTop = 1323
              mmWidth = 67998
              BandType = 1
            end
            object ppLabel21: TppLabel
              UserName = 'Label21'
              Caption = 'Item Avaliado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 10319
              mmTop = 8467
              mmWidth = 22754
              BandType = 1
            end
            object ppLabel22: TppLabel
              UserName = 'Label22'
              Caption = 'Nº Avaliações'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 105834
              mmTop = 8467
              mmWidth = 23283
              BandType = 1
            end
            object ppLabel23: TppLabel
              UserName = 'Label23'
              Caption = 'Avaliação Média (%)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 149754
              mmTop = 8467
              mmWidth = 33867
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 6879
            mmPrintPosition = 0
            object ppDBText9: TppDBText
              UserName = 'DBText9'
              DataField = 'DESCRICAO'
              DataPipeline = ppAval
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppAval'
              mmHeight = 4233
              mmLeft = 10319
              mmTop = 1058
              mmWidth = 91546
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              DataField = 'CONTA'
              DataPipeline = ppAval
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppAval'
              mmHeight = 4233
              mmLeft = 111390
              mmTop = 1058
              mmWidth = 10319
              BandType = 4
            end
            object ppDBText11: TppDBText
              UserName = 'DBText11'
              DataField = 'MEDIA'
              DataPipeline = ppAval
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppAval'
              mmHeight = 4233
              mmLeft = 157163
              mmTop = 1058
              mmWidth = 17198
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 2646
        mmTop = 23548
        mmWidth = 190500
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'STATUS'
      DataPipeline = ppRelEvento
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppRelEvento'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 25135
        mmPrintPosition = 0
        object SubInstrutores: TppSubReport
          UserName = 'SubInstrutores'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppRelEvento'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 1058
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport3: TppChildReport
            AutoStop = False
            DataPipeline = ppRelEvento
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Lista de Presença'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utScreenPixels
            Left = 152
            Top = 136
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppRelEvento'
            object ppTitleBand3: TppTitleBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 13229
              mmPrintPosition = 0
              object ppLabel3: TppLabel
                UserName = 'Label3'
                Caption = 'Instrutores:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 2117
                mmTop = 1852
                mmWidth = 19579
                BandType = 1
              end
              object ppDBText25: TppDBText
                UserName = 'DBText201'
                DataField = 'INSTRUTOR'
                DataPipeline = ppRelEvento
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppRelEvento'
                mmHeight = 4233
                mmLeft = 26194
                mmTop = 1852
                mmWidth = 97102
                BandType = 1
              end
              object ppDBMemo1: TppDBMemo
                UserName = 'DBMemo1'
                CharWrap = False
                DataField = 'INSTRUTORES'
                DataPipeline = ppRelEvento
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Stretch = True
                Transparent = True
                DataPipelineName = 'ppRelEvento'
                mmHeight = 6085
                mmLeft = 26194
                mmTop = 6615
                mmWidth = 97102
                BandType = 1
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
            end
            object ppDetailBand4: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppSummaryBand4: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 2117
              mmPrintPosition = 0
            end
          end
        end
        object SubHorario: TppSubReport
          UserName = 'SubHorario'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ShiftRelativeTo = SubInstrutores
          TraverseAllData = False
          DataPipelineName = 'ppRelEvento'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 7408
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport4: TppChildReport
            AutoStop = False
            DataPipeline = ppRelEvento
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Lista de Presença'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utScreenPixels
            Left = 200
            Top = 184
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppRelEvento'
            object ppTitleBand4: TppTitleBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 8467
              mmPrintPosition = 0
              object ppLabel25: TppLabel
                UserName = 'Label25'
                Caption = 'Horário:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 2117
                mmTop = 794
                mmWidth = 13758
                BandType = 1
              end
              object ppDBMemo4: TppDBMemo
                UserName = 'DBMemo4'
                CharWrap = False
                DataField = 'DATAHORA'
                DataPipeline = ppRelEvento
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Stretch = True
                Transparent = True
                DataPipelineName = 'ppRelEvento'
                mmHeight = 6350
                mmLeft = 26194
                mmTop = 794
                mmWidth = 97102
                BandType = 1
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
            end
            object ppDetailBand5: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppSummaryBand5: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 1588
              mmPrintPosition = 0
            end
          end
        end
        object SubObserv: TppSubReport
          UserName = 'SubObserv'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ShiftRelativeTo = SubHorario
          TraverseAllData = False
          DataPipelineName = 'ppObserv'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 13758
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = ppObserv
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Lista de Presença'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utScreenPixels
            Left = 136
            Top = 120
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppObserv'
            object ppTitleBand2: TppTitleBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 19050
              mmPrintPosition = 0
              object Region2: TppRegion
                UserName = 'Region2'
                Stretch = True
                mmHeight = 11642
                mmLeft = 4498
                mmTop = 5292
                mmWidth = 190500
                BandType = 1
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppDBMemo2: TppDBMemo
                  UserName = 'DBMemo2'
                  CharWrap = False
                  DataField = 'OBSERVACAO'
                  DataPipeline = ppObserv
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  ParentDataPipeline = False
                  Stretch = True
                  Transparent = True
                  DataPipelineName = 'ppObserv'
                  mmHeight = 8731
                  mmLeft = 6086
                  mmTop = 6879
                  mmWidth = 187061
                  BandType = 1
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  mmLeading = 0
                end
              end
              object ppLabel14: TppLabel
                UserName = 'Label14'
                Caption = 'Conteúdo Programático:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 2117
                mmTop = 529
                mmWidth = 41540
                BandType = 1
              end
            end
            object ppDetailBand3: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppSummaryBand3: TppSummaryBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 18521
              mmPrintPosition = 0
              object ppLabel24: TppLabel
                UserName = 'Label24'
                Caption = 'Observações:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 2117
                mmTop = 265
                mmWidth = 23548
                BandType = 7
              end
              object ppRegion1: TppRegion
                UserName = 'Region1'
                Stretch = True
                mmHeight = 11642
                mmLeft = 4498
                mmTop = 5027
                mmWidth = 190500
                BandType = 7
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppDBMemo3: TppDBMemo
                  UserName = 'DBMemo3'
                  CharWrap = False
                  DataField = 'OBSERVACAO2'
                  DataPipeline = ppObserv
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  ParentDataPipeline = False
                  Stretch = True
                  Transparent = True
                  DataPipelineName = 'ppObserv'
                  mmHeight = 8731
                  mmLeft = 6085
                  mmTop = 6614
                  mmWidth = 187061
                  BandType = 7
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  mmLeading = 0
                end
              end
            end
          end
        end
        object SubCompetencias: TppSubReport
          UserName = 'SubCompetencias'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ShiftRelativeTo = SubObserv
          TraverseAllData = False
          DataPipelineName = 'ppFator'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 19315
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport5: TppChildReport
            AutoStop = False
            DataPipeline = ppFator
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Lista de Presença'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utScreenPixels
            Left = 160
            Top = 144
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppFator'
            object ppTitleBand5: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 5556
              mmPrintPosition = 0
              object ppLabel26: TppLabel
                UserName = 'Label26'
                Caption = 'Competências Trabalhadas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 2117
                mmTop = 1323
                mmWidth = 46038
                BandType = 1
              end
            end
            object ppDetailBand6: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object ppDBText13: TppDBText
                UserName = 'DBText13'
                AutoSize = True
                DataField = 'DESCRFATORAVAL'
                DataPipeline = ppFator
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFator'
                mmHeight = 4233
                mmLeft = 4498
                mmTop = 529
                mmWidth = 33338
                BandType = 4
              end
            end
            object ppSummaryBand6: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 13229
              mmPrintPosition = 0
            end
          end
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DESCRICAO'
      DataPipeline = ppRelEvento
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppRelEvento'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLine2: TppLine
          UserName = 'Line2'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 2646
          mmTop = 5821
          mmWidth = 190500
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Nome do Aluno'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 21960
          mmTop = 1323
          mmWidth = 25929
          BandType = 3
          GroupNo = 1
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Matícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2910
          mmTop = 1323
          mmWidth = 14023
          BandType = 3
          GroupNo = 1
        end
        object ppLabelTeor: TppLabel
          UserName = 'LabelTeor'
          Caption = 'Teoria'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          Visible = False
          mmHeight = 4233
          mmLeft = 120915
          mmTop = 1323
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppLabelPrat: TppLabel
          UserName = 'LabelPrat'
          Caption = 'Prática'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          Visible = False
          mmHeight = 4233
          mmLeft = 146050
          mmTop = 1323
          mmWidth = 11906
          BandType = 3
          GroupNo = 1
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Presenças'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 171980
          mmTop = 1323
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppRelEvento: TppBDEPipeline
    DataSource = dsRelEvento
    SkipWhenNoRecords = False
    UserName = 'RelEvento'
    Left = 215
    Top = 57
    object ppRelEventoppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 70
      DisplayWidth = 70
      Position = 0
    end
    object ppRelEventoppField2: TppField
      FieldAlias = 'ENTIDADE'
      FieldName = 'ENTIDADE'
      FieldLength = 70
      DisplayWidth = 70
      Position = 1
    end
    object ppRelEventoppField3: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 2
    end
    object ppRelEventoppField4: TppField
      FieldAlias = 'INSTRUTOR'
      FieldName = 'INSTRUTOR'
      FieldLength = 70
      DisplayWidth = 70
      Position = 3
    end
    object ppRelEventoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSTRUTORES'
      FieldName = 'INSTRUTORES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppRelEventoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'DATAHORA'
      FieldName = 'DATAHORA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppRelEventoppField7: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 6
    end
    object ppRelEventoppField8: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 7
    end
    object ppRelEventoppField9: TppField
      FieldAlias = 'CENTROCUSTO'
      FieldName = 'CENTROCUSTO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 8
    end
    object ppRelEventoppField10: TppField
      FieldAlias = 'LOCAL'
      FieldName = 'LOCAL'
      FieldLength = 70
      DisplayWidth = 70
      Position = 9
    end
    object ppRelEventoppField11: TppField
      FieldAlias = 'CARGAHORARIA'
      FieldName = 'CARGAHORARIA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object ppRelEventoppField12: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 11
    end
    object ppRelEventoppField13: TppField
      FieldAlias = 'DATAINI'
      FieldName = 'DATAINI'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object ppRelEventoppField14: TppField
      FieldAlias = 'DATAFIM'
      FieldName = 'DATAFIM'
      FieldLength = 10
      DisplayWidth = 10
      Position = 13
    end
    object ppRelEventoppField15: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 10
      DisplayWidth = 10
      Position = 14
    end
    object ppRelEventoppField16: TppField
      FieldAlias = 'AVALTEOR'
      FieldName = 'AVALTEOR'
      FieldLength = 10
      DisplayWidth = 10
      Position = 15
    end
    object ppRelEventoppField17: TppField
      FieldAlias = 'AVALPRAT'
      FieldName = 'AVALPRAT'
      FieldLength = 10
      DisplayWidth = 10
      Position = 16
    end
    object ppRelEventoppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppRelEventoppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESPESAS'
      FieldName = 'DESPESAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppRelEventoppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppRelEventoppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRESENCAS'
      FieldName = 'PRESENCAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
  end
  object dsRelEvento: TwwDataSource
    AutoEdit = False
    DataSet = CdsRelEvento
    Left = 215
    Top = 103
  end
  object CdsRelEvento: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 215
    Top = 148
    Data = {
      A60300009619E0BD010000001800000015000000000003000000A60307454D50
      5245534101004900000002000753554254595045020049000A00466978656443
      6861720005574944544802000200460008454E54494441444501004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      000200460009454D5052454741444F0100490000000200075355425459504502
      0049000A004669786564436861720005574944544802000200460009494E5354
      5255544F5201004900000002000753554254595045020049000A004669786564
      43686172000557494454480200020046000B494E53545255544F524553080004
      00000000000844415441484F524108000400000000000944455343524943414F
      01004900000002000753554254595045020049000A0046697865644368617200
      05574944544802000200460005434152474F0100490000000200075355425459
      5045020049000A00466978656443686172000557494454480200020046000B43
      454E54524F435553544F01004900000002000753554254595045020049000A00
      46697865644368617200055749445448020002004600054C4F43414C01004900
      000002000753554254595045020049000A004669786564436861720005574944
      54480200020046000C4341524741484F52415249410100490000000200075355
      4254595045020049000A0046697865644368617200055749445448020002000A
      00094D4154524943554C4101004900000002000753554254595045020049000A
      0046697865644368617200055749445448020002000A000744415441494E4901
      004900000002000753554254595045020049000A004669786564436861720005
      5749445448020002000A00074441544146494D01004900000002000753554254
      595045020049000A0046697865644368617200055749445448020002000A0006
      53544154555301004900000002000753554254595045020049000A0046697865
      644368617200055749445448020002000A00084156414C54454F520100490000
      0002000753554254595045020049000A00466978656443686172000557494454
      48020002000A00084156414C5052415401004900000002000753554254595045
      020049000A0046697865644368617200055749445448020002000A000556414C
      4F520800040000000000084445535045534153080004000000000005544F5441
      4C08000400000000000950524553454E43415308000400000000000100044C43
      49440400010009080000}
  end
  object sqlRelEvento: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPRESA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ENTIDADE,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPREGADO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS INSTRUTOR,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS INSTRUTORES,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS DATAHORA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS DESCRICAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CARGO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CENTROCUSTO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS LOCAL,'
      '  '#39'1234567890'#39' AS CARGAHORARIA,'
      '  '#39'1234567890'#39' AS MATRICULA,'
      '  '#39'1234567890'#39' AS DATAINI,'
      '  '#39'1234567890'#39' AS DATAFIM,'
      '  '#39'1234567890'#39' AS STATUS,'
      '  '#39'1234567890'#39' AS AVALTEOR,'
      '  '#39'1234567890'#39' AS AVALPRAT,'
      '  0 AS VALOR, 0 AS DESPESAS, 0 AS TOTAL,'
      '  0 AS PRESENCAS'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      ''
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsRelEvento
    Left = 215
    Top = 200
  end
  object ppObserv: TppBDEPipeline
    DataSource = dsObserv
    SkipWhenNoRecords = False
    UserName = 'ppObserv'
    Left = 95
    Top = 57
    object ppObservppField1: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 0
    end
    object ppObservppField2: TppField
      FieldAlias = 'OBSERVACAO2'
      FieldName = 'OBSERVACAO2'
      FieldLength = 70
      DisplayWidth = 70
      Position = 1
    end
  end
  object dsObserv: TwwDataSource
    AutoEdit = False
    DataSet = CdsObserv
    Left = 95
    Top = 103
  end
  object CdsObserv: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 95
    Top = 148
    Data = {
      960000009619E0BD01000000180000000200000000000300000096000A4F4253
      4552564143414F01004900000002000753554254595045020049000A00466978
      656443686172000557494454480200020046000B4F42534552564143414F3201
      004900000002000753554254595045020049000A004669786564436861720005
      57494454480200020046000100044C4349440400010009080000}
  end
  object sqlObserv: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS OBSERVACAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS OBSERVACAO2  '
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      ' '
      ' ')
    ClientDataSet = CdsObserv
    Left = 95
    Top = 200
  end
  object ppAval: TppBDEPipeline
    DataSource = dsAval
    SkipWhenNoRecords = False
    UserName = 'ppAval'
    Left = 30
    Top = 57
    object ppAvalppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFATORAVAL'
      FieldName = 'IDFATORAVAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppAvalppField2: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 11
      DisplayWidth = 11
      Position = 1
    end
    object ppAvalppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONTA'
      FieldName = 'CONTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppAvalppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'MEDIA'
      FieldName = 'MEDIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
  end
  object dsAval: TwwDataSource
    AutoEdit = False
    DataSet = CdsAval
    Left = 30
    Top = 103
  end
  object CdsAval: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 30
    Top = 148
    Data = {
      8D0000009619E0BD0100000018000000040000000000030000008D000B494446
      41544F524156414C08000400000000000944455343524943414F010049000000
      02000753554254595045020049000A0046697865644368617200055749445448
      020002000B0005434F4E54410800040000000000054D45444941080004000000
      00000100044C4349440400010009080000}
  end
  object sqlAval: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  0 AS IDFATORAVAL,'
      '  '#39'12345676890'#39' AS DESCRICAO,'
      '  0 AS CONTA,'
      '  0 AS MEDIA'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      ' ')
    ClientDataSet = CdsAval
    Left = 30
    Top = 200
  end
  object ppFator: TppBDEPipeline
    DataSource = dsFator
    SkipWhenNoRecords = False
    UserName = 'ppFator'
    Left = 158
    Top = 57
    object ppFatorppField1: TppField
      FieldAlias = 'DESCRFATORAVAL'
      FieldName = 'DESCRFATORAVAL'
      FieldLength = 66
      DisplayWidth = 66
      Position = 0
    end
  end
  object dsFator: TwwDataSource
    AutoEdit = False
    DataSet = CdsFator
    Left = 158
    Top = 103
  end
  object CdsFator: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 158
    Top = 148
    Data = {
      620000009619E0BD01000000180000000100000000000300000062000E444553
      43524641544F524156414C01004900000002000753554254595045020049000A
      00466978656443686172000557494454480200020042000100044C4349440400
      010009080000}
  end
  object sqlFator: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      
        '  '#39'1234567689012345676890123456768901234567689012345676890123456' +
        '76890'#39' AS DESCRFATORAVAL'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    ClientDataSet = CdsFator
    Left = 158
    Top = 200
  end
end
