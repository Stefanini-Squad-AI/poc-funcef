inherited dtmRelatorios: TdtmRelatorios
  Left = 217
  Top = 222
  Width = 335
  Height = 174
  Caption = 'dtmRelatorios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 18
    Top = 42
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
    Left = 18
    Top = 29
  end
  inherited qryExemplo: TwwQuery
    Left = 18
  end
  inherited rpExemplo: TppReport
    Left = 18
    Top = 4
  end
  object rpCadRubSal: TppReport
    AutoStop = False
    DataPipeline = ppCadRubSal
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Cadastro de Rubricas Salariais'
    PrinterSetup.PaperName = 'Carta 215,9 x 279,4 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
    PrinterSetup.mmMarginLeft = 8350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 98
    Top = 37
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23813
      mmPrintPosition = 0
      object ppLabel24: TppLabel
        UserName = 'ppLabel24'
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 153723
        mmTop = 11906
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'ppLabel27'
        Caption = 'CADASTRO DE RUBRICAS SALARIAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 74877
        mmTop = 15610
        mmWidth = 62971
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'ppLabel28'
        Caption = 'Página:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 157163
        mmTop = 7673
        mmWidth = 11642
        BandType = 0
      end
      object rpCadRubSalDBText25: TppDBText
        UserName = 'rpCadRubSalDBText25'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppCadRubSal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 97896
        mmTop = 3704
        mmWidth = 17463
        BandType = 0
      end
      object ppCalc8: TppSystemVariable
        UserName = 'Calc8'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 169598
        mmTop = 7673
        mmWidth = 7938
        BandType = 0
      end
      object ppCalc9: TppSystemVariable
        UserName = 'Calc9'
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 169598
        mmTop = 11906
        mmWidth = 22225
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object CadRubSalSubReport1: TppSubReport
        UserName = 'CadRubSalSubReport1'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 3440
        mmLeft = 0
        mmTop = 529
        mmWidth = 201300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpCadRubSalChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppCadRubSal1
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Cadastro de Rubricas Salariais'
          PrinterSetup.PaperName = 'Carta 215,9 x 279,4 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 14000
          PrinterSetup.mmMarginLeft = 8350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279000
          PrinterSetup.mmPaperWidth = 216000
          PrinterSetup.PaperSize = 1
          Template.SaveTo = stDatabase
          Units = utMillimeters
          Version = '5.5'
          mmColumnWidth = 0
          object rpCadRubSalChildReport1TitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 11113
            mmPrintPosition = 0
            object ppLabel29: TppLabel
              UserName = 'ppLabel29'
              Caption = 'Código'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 7673
              mmTop = 6350
              mmWidth = 10319
              BandType = 1
            end
            object ppLabel30: TppLabel
              UserName = 'ppLabel30'
              Caption = 'Descrição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 27252
              mmTop = 6350
              mmWidth = 14288
              BandType = 1
            end
            object ppLine5: TppLine
              UserName = 'ppLine5'
              Pen.Width = 2
              Weight = 1.5
              mmHeight = 529
              mmLeft = 7673
              mmTop = 10583
              mmWidth = 182827
              BandType = 1
            end
            object rpCadRubSalLabel20: TppLabel
              UserName = 'rpCadRubSalLabel20'
              Caption = 'Valor Calculado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 102129
              mmTop = 6350
              mmWidth = 22490
              BandType = 1
            end
            object rpCadRubSalLabel21: TppLabel
              UserName = 'rpCadRubSalLabel21'
              Caption = 'Mesma Folha'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 127529
              mmTop = 6350
              mmWidth = 19315
              BandType = 1
            end
            object rpCadRubSalLabel22: TppLabel
              UserName = 'rpCadRubSalLabel22'
              Caption = 'Período Incid.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 149754
              mmTop = 6350
              mmWidth = 19844
              BandType = 1
            end
            object rpCadRubSalLabel23: TppLabel
              UserName = 'rpCadRubSalLabel23'
              Caption = 'Soma'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 172773
              mmTop = 6350
              mmWidth = 8202
              BandType = 1
            end
            object rpCadRubSalLabel24: TppLabel
              UserName = 'rpCadRubSalLabel24'
              Caption = 'Seq.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 183886
              mmTop = 6350
              mmWidth = 6350
              BandType = 1
            end
            object rpCadRubSalChildReport1Label1: TppLabel
              UserName = 'rpCadRubSalChildReport1Label1'
              Caption = 'INCIDÊNCIAS EM OUTRAS RUBRICAS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 7673
              mmTop = 1058
              mmWidth = 50271
              BandType = 1
            end
          end
          object rpCadRubSalChildReport1DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object ppDBText40: TppDBText
              UserName = 'ppDBText40'
              DataField = 'CODIGO'
              DataPipeline = ppCadRubSal1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 7673
              mmTop = 529
              mmWidth = 17992
              BandType = 4
            end
            object ppDBText41: TppDBText
              UserName = 'ppDBText41'
              DataField = 'NOME'
              DataPipeline = ppCadRubSal1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 27252
              mmTop = 529
              mmWidth = 72231
              BandType = 4
            end
            object rpCadRubSalDBText20: TppDBText
              UserName = 'rpCadRubSalDBText20'
              DataField = 'BASECALC'
              DataPipeline = ppCadRubSal1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 102129
              mmTop = 529
              mmWidth = 22490
              BandType = 4
            end
            object rpCadRubSalDBText21: TppDBText
              UserName = 'rpCadRubSalDBText21'
              DataField = 'TIPOFOLHA'
              DataPipeline = ppCadRubSal1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 127529
              mmTop = 529
              mmWidth = 19315
              BandType = 4
            end
            object rpCadRubSalDBText22: TppDBText
              UserName = 'rpCadRubSalDBText22'
              DataField = 'PER_INCID'
              DataPipeline = ppCadRubSal1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 149754
              mmTop = 529
              mmWidth = 19844
              BandType = 4
            end
            object rpCadRubSalDBText23: TppDBText
              UserName = 'rpCadRubSalDBText23'
              DataField = 'SOMA'
              DataPipeline = ppCadRubSal1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 172773
              mmTop = 529
              mmWidth = 8202
              BandType = 4
            end
            object rpCadRubSalDBText24: TppDBText
              UserName = 'rpCadRubSalDBText24'
              DataField = 'SEQ'
              DataPipeline = ppCadRubSal1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 183886
              mmTop = 529
              mmWidth = 6350
              BandType = 4
            end
          end
        end
      end
      object CadRubSalSubReport2: TppSubReport
        UserName = 'CadRubSalSubReport2'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = CadRubSalSubReport1
        TraverseAllData = False
        mmHeight = 3440
        mmLeft = 0
        mmTop = 4233
        mmWidth = 201300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpCadRubSalChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppCadRubSal2
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Cadastro de Rubricas Salariais'
          PrinterSetup.PaperName = 'Carta 215,9 x 279,4 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 14000
          PrinterSetup.mmMarginLeft = 8350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279000
          PrinterSetup.mmPaperWidth = 216000
          PrinterSetup.PaperSize = 1
          Template.SaveTo = stDatabase
          Units = utMillimeters
          Version = '5.5'
          mmColumnWidth = 0
          object rpCadRubSalChildReport2TitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 11113
            mmPrintPosition = 0
            object rpCadRubSalChildReport2Label1: TppLabel
              UserName = 'rpCadRubSalChildReport2Label1'
              Caption = 'Código'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 7673
              mmTop = 6350
              mmWidth = 10319
              BandType = 1
            end
            object rpCadRubSalChildReport2Label2: TppLabel
              UserName = 'rpCadRubSalChildReport2Label2'
              Caption = 'Descrição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 27252
              mmTop = 6350
              mmWidth = 14288
              BandType = 1
            end
            object rpCadRubSalChildReport2Line1: TppLine
              UserName = 'rpCadRubSalChildReport2Line1'
              Pen.Width = 2
              Weight = 1.5
              mmHeight = 529
              mmLeft = 7673
              mmTop = 10583
              mmWidth = 182827
              BandType = 1
            end
            object rpCadRubSalChildReport2Label3: TppLabel
              UserName = 'rpCadRubSalChildReport2Label3'
              Caption = 'Valor Calculado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 102129
              mmTop = 6350
              mmWidth = 22490
              BandType = 1
            end
            object rpCadRubSalChildReport2Label4: TppLabel
              UserName = 'rpCadRubSalChildReport2Label4'
              Caption = 'Mesma Folha'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 127529
              mmTop = 6350
              mmWidth = 19315
              BandType = 1
            end
            object rpCadRubSalChildReport2Label5: TppLabel
              UserName = 'rpCadRubSalChildReport2Label5'
              Caption = 'Período Incid.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 149754
              mmTop = 6350
              mmWidth = 19844
              BandType = 1
            end
            object rpCadRubSalChildReport2Label6: TppLabel
              UserName = 'rpCadRubSalChildReport2Label6'
              Caption = 'Soma'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 172773
              mmTop = 6350
              mmWidth = 8202
              BandType = 1
            end
            object rpCadRubSalChildReport2Label7: TppLabel
              UserName = 'rpCadRubSalChildReport2Label7'
              Caption = 'Seq.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 183886
              mmTop = 6350
              mmWidth = 6350
              BandType = 1
            end
            object rpCadRubSalChildReport2Label8: TppLabel
              UserName = 'rpCadRubSalChildReport2Label8'
              Caption = 'INCIDÊNCIAS DE OUTRAS RUBRICAS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 7673
              mmTop = 1058
              mmWidth = 49477
              BandType = 1
            end
          end
          object rpCadRubSalChildReport2DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object rpCadRubSalChildReport2DBText1: TppDBText
              UserName = 'rpCadRubSalChildReport2DBText1'
              DataField = 'CODIGO'
              DataPipeline = ppCadRubSal2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 7673
              mmTop = 529
              mmWidth = 17992
              BandType = 4
            end
            object rpCadRubSalChildReport2DBText2: TppDBText
              UserName = 'rpCadRubSalChildReport2DBText2'
              DataField = 'NOME'
              DataPipeline = ppCadRubSal2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 27252
              mmTop = 529
              mmWidth = 72231
              BandType = 4
            end
            object rpCadRubSalChildReport2DBText3: TppDBText
              UserName = 'rpCadRubSalChildReport2DBText3'
              DataField = 'BASECALC'
              DataPipeline = ppCadRubSal2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 102129
              mmTop = 529
              mmWidth = 22490
              BandType = 4
            end
            object rpCadRubSalChildReport2DBText4: TppDBText
              UserName = 'rpCadRubSalChildReport2DBText4'
              DataField = 'TIPOFOLHA'
              DataPipeline = ppCadRubSal2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 127529
              mmTop = 529
              mmWidth = 19315
              BandType = 4
            end
            object rpCadRubSalChildReport2DBText5: TppDBText
              UserName = 'rpCadRubSalChildReport2DBText5'
              DataField = 'PER_INCID'
              DataPipeline = ppCadRubSal2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 149754
              mmTop = 529
              mmWidth = 19844
              BandType = 4
            end
            object rpCadRubSalChildReport2DBText6: TppDBText
              UserName = 'rpCadRubSalChildReport2DBText6'
              DataField = 'SOMA'
              DataPipeline = ppCadRubSal2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 172773
              mmTop = 529
              mmWidth = 8202
              BandType = 4
            end
            object rpCadRubSalChildReport2DBText7: TppDBText
              UserName = 'rpCadRubSalChildReport2DBText7'
              DataField = 'SEQ'
              DataPipeline = ppCadRubSal2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 183886
              mmTop = 529
              mmWidth = 6350
              BandType = 4
            end
          end
        end
      end
    end
    object ppFooterBand8: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8000
      mmPrintPosition = 0
    end
    object ppSummaryBand4: TppSummaryBand
      AfterPrint = rpFolhaNormalSummaryBand1AfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
    end
    object rpCadRubSalGroup1: TppGroup
      BreakName = 'NOME_RUBRICA'
      DataPipeline = ppCadRubSal
      NewPage = True
      UserName = 'rpCadRubSalGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpCadRubSalGroupHeaderBand1: TppGroupHeaderBand
        AfterPrint = rpCadRubSalGroupHeaderBand1AfterPrint
        mmBottomOffset = 0
        mmHeight = 57415
        mmPrintPosition = 0
        object rpCadRubSalShape6: TppShape
          UserName = 'rpCadRubSalShape6'
          Brush.Color = 14803425
          mmHeight = 9525
          mmLeft = 7408
          mmTop = 529
          mmWidth = 140494
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalShape4: TppShape
          UserName = 'rpCadRubSalShape4'
          mmHeight = 46567
          mmLeft = 7408
          mmTop = 10054
          mmWidth = 140494
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalShape10: TppShape
          UserName = 'rpCadRubSalShape10'
          mmHeight = 5027
          mmLeft = 30163
          mmTop = 50006
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalShape9: TppShape
          UserName = 'rpCadRubSalShape9'
          mmHeight = 5027
          mmLeft = 30163
          mmTop = 43921
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalShape8: TppShape
          UserName = 'rpCadRubSalShape8'
          mmHeight = 5027
          mmLeft = 30163
          mmTop = 37571
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalShape7: TppShape
          UserName = 'rpCadRubSalShape7'
          mmHeight = 5027
          mmLeft = 30163
          mmTop = 31485
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalShape1: TppShape
          UserName = 'rpCadRubSalShape1'
          mmHeight = 24606
          mmLeft = 157427
          mmTop = 3175
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalShape2: TppShape
          UserName = 'rpCadRubSalShape2'
          mmHeight = 5027
          mmLeft = 183092
          mmTop = 6350
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalShape3: TppShape
          UserName = 'rpCadRubSalShape3'
          mmHeight = 5027
          mmLeft = 183092
          mmTop = 13229
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalShape5: TppShape
          UserName = 'rpCadRubSalShape5'
          mmHeight = 5027
          mmLeft = 183092
          mmTop = 20108
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object ppDBText37: TppDBText
          UserName = 'ppDBText37'
          DataField = 'COD_RUBRICA'
          DataPipeline = ppCadRubSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 8731
          mmTop = 5821
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText38: TppDBText
          UserName = 'ppDBText38'
          DataField = 'NOME_RUBRICA'
          DataPipeline = ppCadRubSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 27252
          mmTop = 5821
          mmWidth = 119592
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalDBText1: TppDBText
          UserName = 'rpCadRubSalDBText1'
          DataField = 'TIPO'
          DataPipeline = ppCadRubSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 15610
          mmTop = 11377
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalDBText2: TppDBText
          UserName = 'rpCadRubSalDBText2'
          DataField = 'RUBRICACLT'
          DataPipeline = ppCadRubSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 52388
          mmTop = 11377
          mmWidth = 94456
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalDBText3: TppDBText
          UserName = 'rpCadRubSalDBText3'
          DataField = 'REGRA'
          DataPipeline = ppCadRubSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 17992
          mmTop = 24871
          mmWidth = 89694
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalDBText4: TppDBText
          UserName = 'rpCadRubSalDBText4'
          DataField = 'INFORME'
          DataPipeline = ppCadRubSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 102923
          mmTop = 15875
          mmWidth = 43921
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalDBText5: TppDBText
          UserName = 'rpCadRubSalDBText5'
          DataField = 'NATUROPER'
          DataPipeline = ppCadRubSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 39423
          mmTop = 20373
          mmWidth = 35454
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalDBText6: TppDBText
          UserName = 'rpCadRubSalDBText6'
          DataField = 'NUMPRIORIDADE'
          DataPipeline = ppCadRubSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 37835
          mmTop = 15875
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalDBText7: TppDBText
          UserName = 'rpCadRubSalDBText7'
          DataField = 'CONSTAFOLHA'
          DataPipeline = ppCadRubSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 183092
          mmTop = 7144
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalDBText8: TppDBText
          UserName = 'rpCadRubSalDBText8'
          DataField = 'OBRIGAFAVOREC'
          DataPipeline = ppCadRubSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 183092
          mmTop = 14023
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalDBText10: TppDBText
          UserName = 'rpCadRubSalDBText10'
          DataField = 'ESPECIAL'
          DataPipeline = ppCadRubSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 183092
          mmTop = 20902
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalDBText12: TppDBText
          UserName = 'rpCadRubSalDBText12'
          DataField = 'FOLHANORMAL'
          DataPipeline = ppCadRubSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 30163
          mmTop = 32279
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalDBText13: TppDBText
          UserName = 'rpCadRubSalDBText13'
          DataField = 'FERIAS'
          DataPipeline = ppCadRubSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 30163
          mmTop = 38365
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalDBText14: TppDBText
          UserName = 'rpCadRubSalDBText14'
          DataField = 'DECIMOTERCEIRO'
          DataPipeline = ppCadRubSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 30163
          mmTop = 44715
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalDBText15: TppDBText
          UserName = 'rpCadRubSalDBText15'
          DataField = 'RESCISAO'
          DataPipeline = ppCadRubSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 30163
          mmTop = 50800
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalDBText16: TppDBText
          UserName = 'rpCadRubSalDBText16'
          DataField = 'REGRAFERIAS'
          DataPipeline = ppCadRubSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 37042
          mmTop = 38365
          mmWidth = 89694
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalDBText17: TppDBText
          UserName = 'rpCadRubSalDBText17'
          DataField = 'REGRADECIMOTERCEIRO'
          DataPipeline = ppCadRubSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 37042
          mmTop = 44715
          mmWidth = 89694
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalLabel1: TppLabel
          UserName = 'rpCadRubSalLabel1'
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 8731
          mmTop = 1852
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalLabel2: TppLabel
          UserName = 'rpCadRubSalLabel2'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 27252
          mmTop = 1852
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalLabel3: TppLabel
          UserName = 'rpCadRubSalLabel3'
          Caption = 'Tipo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 8731
          mmTop = 11377
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalLabel4: TppLabel
          UserName = 'rpCadRubSalLabel4'
          Caption = 'Rubrica CLT:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 35190
          mmTop = 11377
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalLabel5: TppLabel
          UserName = 'rpCadRubSalLabel5'
          Caption = 'Regra:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 8731
          mmTop = 24871
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalLabel6: TppLabel
          UserName = 'rpCadRubSalLabel6'
          Caption = 'Informe de Rendimentos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 70644
          mmTop = 15875
          mmWidth = 31485
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalLabel7: TppLabel
          UserName = 'rpCadRubSalLabel7'
          Caption = 'Natureza da Operação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 8731
          mmTop = 20373
          mmWidth = 29898
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalLabel8: TppLabel
          UserName = 'rpCadRubSalLabel8'
          Caption = 'Sequência de Cálculo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 8731
          mmTop = 15875
          mmWidth = 28310
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalLabel9: TppLabel
          UserName = 'rpCadRubSalLabel9'
          Caption = 'Consta na Folha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 161925
          mmTop = 7144
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalLabel10: TppLabel
          UserName = 'rpCadRubSalLabel10'
          Caption = 'Exige Favorecido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 160602
          mmTop = 14023
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalLabel11: TppLabel
          UserName = 'rpCadRubSalLabel11'
          Caption = 'Especial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 171980
          mmTop = 20902
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalLabel13: TppLabel
          UserName = 'rpCadRubSalLabel13'
          Caption = 'Folha Normal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 12965
          mmTop = 32279
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalLabel15: TppLabel
          UserName = 'rpCadRubSalLabel15'
          Caption = 'Férias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 21431
          mmTop = 38365
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalLabel16: TppLabel
          UserName = 'rpCadRubSalLabel16'
          Caption = 'Décimo Terceiro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 8731
          mmTop = 44715
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalLabel18: TppLabel
          UserName = 'rpCadRubSalLabel18'
          Caption = 'Opções'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          mmHeight = 3704
          mmLeft = 159015
          mmTop = 1852
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalLabel19: TppLabel
          UserName = 'rpCadRubSalLabel19'
          Caption = 'Rescisão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 17463
          mmTop = 51065
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalDBText19: TppDBText
          UserName = 'rpCadRubSalDBText19'
          DataField = 'REGRARESCISAO'
          DataPipeline = ppCadRubSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 37042
          mmTop = 51065
          mmWidth = 89694
          BandType = 3
          GroupNo = 0
        end
        object rpCadRubSalLine1: TppLine
          UserName = 'rpCadRubSalLine1'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 8996
          mmTop = 29898
          mmWidth = 137848
          BandType = 3
          GroupNo = 0
        end
      end
      object rpCadRubSalGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object updSQL: TUpdateSQL
    Left = 232
    Top = 92
  end
  object ppCadRubSal: TppBDEPipeline
    DataSource = dsCadRubSal
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'CadRubSal'
    Left = 98
    Top = 25
    object ppCadRubSalppField1: TppField
      FieldAlias = 'IDPROVENTO'
      FieldName = 'IDPROVENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppCadRubSalppField2: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppCadRubSalppField3: TppField
      FieldAlias = 'COD_RUBRICA'
      FieldName = 'COD_RUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppCadRubSalppField4: TppField
      FieldAlias = 'NOME_RUBRICA'
      FieldName = 'NOME_RUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppCadRubSalppField5: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppCadRubSalppField6: TppField
      FieldAlias = 'RUBRICACLT'
      FieldName = 'RUBRICACLT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppCadRubSalppField7: TppField
      FieldAlias = 'REGRA'
      FieldName = 'REGRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppCadRubSalppField8: TppField
      FieldAlias = 'INFORME'
      FieldName = 'INFORME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppCadRubSalppField9: TppField
      FieldAlias = 'NATUROPER'
      FieldName = 'NATUROPER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppCadRubSalppField10: TppField
      FieldAlias = 'NUMPRIORIDADE'
      FieldName = 'NUMPRIORIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppCadRubSalppField11: TppField
      FieldAlias = 'CONSTAFOLHA'
      FieldName = 'CONSTAFOLHA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppCadRubSalppField12: TppField
      FieldAlias = 'OBRIGAFAVOREC'
      FieldName = 'OBRIGAFAVOREC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppCadRubSalppField13: TppField
      FieldAlias = 'CONSOLIDA'
      FieldName = 'CONSOLIDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppCadRubSalppField14: TppField
      FieldAlias = 'ESPECIAL'
      FieldName = 'ESPECIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppCadRubSalppField15: TppField
      FieldAlias = 'PRORATA'
      FieldName = 'PRORATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppCadRubSalppField16: TppField
      FieldAlias = 'FOLHANORMAL'
      FieldName = 'FOLHANORMAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppCadRubSalppField17: TppField
      FieldAlias = 'FERIAS'
      FieldName = 'FERIAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppCadRubSalppField18: TppField
      FieldAlias = 'REGRAFERIAS'
      FieldName = 'REGRAFERIAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppCadRubSalppField19: TppField
      FieldAlias = 'DECIMOTERCEIRO'
      FieldName = 'DECIMOTERCEIRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppCadRubSalppField20: TppField
      FieldAlias = 'REGRADECIMOTERCEIRO'
      FieldName = 'REGRADECIMOTERCEIRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppCadRubSalppField21: TppField
      FieldAlias = 'RESCISAO'
      FieldName = 'RESCISAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppCadRubSalppField22: TppField
      FieldAlias = 'REGRARESCISAO'
      FieldName = 'REGRARESCISAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
  end
  object dsCadRubSal: TDataSource
    DataSet = qryCadRubSal
    Left = 98
    Top = 13
  end
  object qryCadRubSal: TQuery
    AfterOpen = qryFolhaNormalAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  0 AS IDPROVENTO,'
      '  '#39'CM'#39' AS EMPRESA,'
      '  '#39'1234567890'#39' AS COD_RUBRICA,'
      '  '#39'1234567890'#39' AS NOME_RUBRICA,'
      '  '#39'1234567890'#39' AS TIPO,'
      '  '#39'1234567890'#39' AS RUBRICACLT,'
      '  '#39'1234567890'#39' AS REGRA,'
      '  '#39'1234567890'#39' AS INFORME,'
      '  '#39'1234567890'#39' AS NATUROPER,'
      '  0 AS NUMPRIORIDADE,'
      '  '#39'1'#39' AS CONSTAFOLHA,'
      '  '#39'1'#39' AS OBRIGAFAVOREC,'
      '  '#39'1'#39' AS CONSOLIDA,'
      '  '#39'1'#39' AS ESPECIAL,'
      '  '#39'1'#39' AS PRORATA,'
      '  '#39'1'#39' AS FOLHANORMAL,'
      '  '#39'1'#39' AS FERIAS,'
      '  '#39'1'#39' AS REGRAFERIAS,'
      '  '#39'1'#39' AS DECIMOTERCEIRO,'
      '  '#39'1'#39' AS REGRADECIMOTERCEIRO,'
      '  '#39'1'#39' AS RESCISAO,'
      '  '#39'1'#39' AS REGRARESCISAO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    Left = 98
  end
  object ppCadRubSal1: TppBDEPipeline
    DataSource = dsCadRubSal1
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'CadRubSal1'
    Left = 183
    Top = 25
  end
  object dsCadRubSal1: TDataSource
    DataSet = qryCadRubSal1
    Left = 183
    Top = 13
  end
  object qryCadRubSal1: TQuery
    DatabaseName = 'BaseDados'
    DataSource = dsCadRubSal
    SQL.Strings = (
      'SELECT DISTINCT'
      '  PD.DESCRICAO                              AS NOME,'
      '  RP.CODPROVDESC                            AS CODIGO,'
      '  DECODE(RXB.FLGBASECALC,1,'#39'Não'#39',0,'#39'Sim'#39')   AS BASECALC,'
      '  DECODE(RXB.FLGTIPOFOLHA,1,'#39'Não'#39',0,'#39'Sim'#39')  AS TIPOFOLHA,'
      '  RXB.INDPERIODO                            AS PER_INCID,'
      '  DECODE(RXB.FLGACAOINCIDE,1,'#39'Não'#39',0,'#39'Sim'#39') AS SOMA,'
      '  PD.NUMPRIORIDADE                          AS SEQ'
      'FROM'
      '  RUBXRUB RXB, PROVDESC PD, RUBRICAXPESS RP'
      'WHERE'
      '  (RXB.IDRUBPRINC  = :IDPROVENTO)   AND'
      '  (RXB.IDRUBSECUND = PD.IDPROVENTO) AND'
      '  (PD.IDPROVENTO   = RP.IDRUBRICA)'
      'ORDER BY'
      '  CODIGO')
    Left = 183
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPROVENTO'
        ParamType = ptUnknown
      end>
  end
  object ppCadRubSal2: TppBDEPipeline
    DataSource = dsCadRubSal2
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'CadRubSal2'
    Left = 268
    Top = 25
  end
  object dsCadRubSal2: TDataSource
    DataSet = qryCadRubSal2
    Left = 268
    Top = 13
  end
  object qryCadRubSal2: TQuery
    DatabaseName = 'BaseDados'
    DataSource = dsCadRubSal
    SQL.Strings = (
      'SELECT DISTINCT'
      '  PD.DESCRICAO                              AS NOME,'
      '  RP.CODPROVDESC                            AS CODIGO,'
      '  DECODE(RXB.FLGBASECALC,1,'#39'Não'#39',0,'#39'Sim'#39')   AS BASECALC,'
      '  DECODE(RXB.FLGTIPOFOLHA,1,'#39'Não'#39',0,'#39'Sim'#39')  AS TIPOFOLHA,'
      '  RXB.INDPERIODO                            AS PER_INCID,'
      '  DECODE(RXB.FLGACAOINCIDE,1,'#39'Não'#39',0,'#39'Sim'#39') AS SOMA,'
      '  PD.NUMPRIORIDADE                          AS SEQ'
      'FROM'
      '  RUBXRUB RXB, PROVDESC PD, RUBRICAXPESS RP'
      'WHERE'
      '  (RXB.IDRUBSECUND = :IDPROVENTO)   AND'
      '  (RXB.IDRUBPRINC  = PD.IDPROVENTO) AND'
      '  (PD.IDPROVENTO   = RP.IDRUBRICA)'
      'ORDER BY'
      '  CODIGO')
    Left = 268
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPROVENTO'
        ParamType = ptUnknown
      end>
  end
end
