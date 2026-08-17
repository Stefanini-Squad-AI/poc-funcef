inherited dtmRelatoriosProcJud: TdtmRelatoriosProcJud
  Left = 286
  Top = 211
  Width = 452
  Height = 180
  Caption = 'dtmRelatoriosProcJud'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 34
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
    Left = 34
  end
  inherited rpExemplo: TppReport
    Left = 34
  end
  object rpProcJud: TppReport
    AutoStop = False
    DataPipeline = ppProcJud
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relação de Processos'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 106
    Top = 92
    Version = '5.5'
    mmColumnWidth = 197300
    object rpProcJudHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object rpProcJudLbl7: TppLabel
        UserName = 'rpProcJudLbl7'
        AutoSize = False
        Caption = 'Somos a Parte'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 121444
        mmTop = 20373
        mmWidth = 22754
        BandType = 0
      end
      object rpProcJudLbl1: TppLabel
        UserName = 'rpProcJudLbl1'
        AutoSize = False
        Caption = 'Relação de Processos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 5027
        mmTop = 8202
        mmWidth = 275167
        BandType = 0
      end
      object rpProcJudDBTxt1: TppDBText
        UserName = 'rpProcJudDBTxt1'
        DataField = 'EMPRESA'
        DataPipeline = ppProcJud
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 5027
        mmTop = 2646
        mmWidth = 275167
        BandType = 0
      end
      object rpProcJudLbl4: TppLabel
        UserName = 'rpProcJudLbl4'
        AutoSize = False
        Caption = 'Número'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 20373
        mmWidth = 33867
        BandType = 0
      end
      object rpProcJudLbl5: TppLabel
        UserName = 'rpProcJudLbl5'
        AutoSize = False
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 41804
        mmTop = 20373
        mmWidth = 6350
        BandType = 0
      end
      object rpProcJudLbl6: TppLabel
        UserName = 'rpProcJudLbl6'
        AutoSize = False
        Caption = 'Contra Parte'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 51065
        mmTop = 20373
        mmWidth = 67469
        BandType = 0
      end
      object rpProcJudLbl8: TppLabel
        UserName = 'rpProcJudLbl8'
        AutoSize = False
        Caption = 'Data Notif.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 147109
        mmTop = 20373
        mmWidth = 15875
        BandType = 0
      end
      object rpProcJudLbl9: TppLabel
        UserName = 'rpProcJudLbl9'
        AutoSize = False
        Caption = 'Sit.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 165894
        mmTop = 20373
        mmWidth = 6615
        BandType = 0
      end
      object rpProcJudLbl10: TppLabel
        UserName = 'rpProcJudLbl10'
        AutoSize = False
        Caption = 'Risco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 175419
        mmTop = 15875
        mmWidth = 16404
        BandType = 0
      end
      object rpProcJudLbl11: TppLabel
        UserName = 'rpProcJudLbl11'
        AutoSize = False
        Caption = 'Máximo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 175419
        mmTop = 20373
        mmWidth = 16404
        BandType = 0
      end
      object rpProcJudLbl13: TppLabel
        UserName = 'rpProcJudLbl13'
        AutoSize = False
        Caption = 'Provável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 197644
        mmTop = 20373
        mmWidth = 16404
        BandType = 0
      end
      object rpProcJudLbl12: TppLabel
        UserName = 'rpProcJudLbl12'
        AutoSize = False
        Caption = 'Risco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 197644
        mmTop = 15875
        mmWidth = 16404
        BandType = 0
      end
      object rpProcJudLbl3: TppLabel
        UserName = 'rpProcJudLbl3'
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
        mmLeft = 215636
        mmTop = 6615
        mmWidth = 27517
        BandType = 0
      end
      object rpProcJudLbl2: TppLabel
        UserName = 'rpProcJudLbl2'
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
        mmLeft = 215636
        mmTop = 2381
        mmWidth = 27517
        BandType = 0
      end
      object rpProcJudSysVar1: TppSystemVariable
        UserName = 'rpProcJudSysVar1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 243946
        mmTop = 2381
        mmWidth = 23283
        BandType = 0
      end
      object rpProcJudSysVar2: TppSystemVariable
        UserName = 'rpProcJudSysVar2'
        AutoSize = False
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 243946
        mmTop = 6615
        mmWidth = 23283
        BandType = 0
      end
      object rpProcJudLbl14: TppLabel
        UserName = 'rpProcJudLbl14'
        AutoSize = False
        Caption = 'Valor Real'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 219869
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object rpProcJudLbl16: TppLabel
        UserName = 'rpProcJudLbl16'
        AutoSize = False
        Caption = 's/Máximo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 242623
        mmTop = 20373
        mmWidth = 16404
        BandType = 0
      end
      object rpProcJudLbl15: TppLabel
        UserName = 'rpProcJudLbl15'
        AutoSize = False
        Caption = 'Economia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 242623
        mmTop = 15875
        mmWidth = 16404
        BandType = 0
      end
      object rpProcJudLbl17: TppLabel
        UserName = 'rpProcJudLbl17'
        AutoSize = False
        Caption = 'Economia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 263790
        mmTop = 15875
        mmWidth = 16404
        BandType = 0
      end
      object rpProcJudLbl18: TppLabel
        UserName = 'rpProcJudLbl18'
        AutoSize = False
        Caption = 's/Provável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 263790
        mmTop = 20373
        mmWidth = 16404
        BandType = 0
      end
    end
    object rpProcJudDtlBnd: TppDetailBand
      Visible = False
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpProcJudFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
    end
    object rpProcJudSmryBnd: TppSummaryBand
      AfterPrint = rpProcJudSmryBndAfterPrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object rpProcJudSubRep4: TppSubReport
        UserName = 'rpProcJudSubRep4'
        ExpandAll = False
        NewPrintJob = False
        ParentPrinterSetup = False
        PrintBehavior = pbSection
        TraverseAllData = False
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpProcJudChildRep4: TppChildReport
          AutoStop = False
          DataPipeline = ppProcJud4
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Resumo por UF'
          PrinterSetup.PaperName = 'A4 297 x 210 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utMillimeters
          Left = 232
          Top = 136
          Version = '5.5'
          mmColumnWidth = 0
          object rpProcJudSubRep4TitBnd: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 26458
            mmPrintPosition = 0
            object rpProcJudSubRep4Shape1: TppShape
              UserName = 'rpProcJudSubRep4Shape1'
              mmHeight = 10319
              mmLeft = 6350
              mmTop = 16140
              mmWidth = 185473
              BandType = 1
            end
            object rpProcJudSubRep4Lbl1: TppLabel
              UserName = 'rpProcJudSubRep4Lbl1'
              AutoSize = False
              Caption = 'Resumo por UF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 60061
              mmTop = 10319
              mmWidth = 77258
              BandType = 1
            end
            object rpProcJudSubRep4DBTxt1: TppDBText
              UserName = 'rpProcJudSubRep4DBTxt1'
              AutoSize = True
              DataField = 'EMPRESA'
              DataPipeline = ppProcJud4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 89959
              mmTop = 4763
              mmWidth = 17198
              BandType = 1
            end
            object rpProcJudSubRep4Lbl2: TppLabel
              UserName = 'rpProcJudSubRep4Lbl2'
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
              mmLeft = 146579
              mmTop = 5027
              mmWidth = 17992
              BandType = 1
            end
            object rpProcJudSubRep4Lbl3: TppLabel
              UserName = 'rpProcJudSubRep4Lbl3'
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
              mmLeft = 146579
              mmTop = 9260
              mmWidth = 17992
              BandType = 1
            end
            object rpProcJudSubRep4SysVar1: TppSystemVariable
              UserName = 'rpProcJudSubRep4SysVar1'
              AutoSize = False
              VarType = vtPageSet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 165365
              mmTop = 5027
              mmWidth = 23283
              BandType = 1
            end
            object rpProcJudSubRep4SysVar2: TppSystemVariable
              UserName = 'rpProcJudSubRep4SysVar2'
              AutoSize = False
              VarType = vtPrintDateTime
              DisplayFormat = 'DD/MM/YYYY HH:MM'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 165365
              mmTop = 9260
              mmWidth = 23283
              BandType = 1
            end
            object rpProcJudSubRep4Lbl6: TppLabel
              UserName = 'rpProcJudSubRep4Lbl6'
              AutoSize = False
              Caption = 'Risco Provável'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 42863
              mmTop = 22225
              mmWidth = 23548
              BandType = 1
            end
            object rpProcJudSubRep4Lbl4: TppLabel
              UserName = 'rpProcJudSubRep4Lbl4'
              AutoSize = False
              Caption = 'Unid. Federação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 7938
              mmTop = 17198
              mmWidth = 26194
              BandType = 1
            end
            object rpProcJudSubRep4Lbl5: TppLabel
              UserName = 'rpProcJudSubRep4Lbl5'
              AutoSize = False
              Caption = 'Qtde.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 25400
              mmTop = 22225
              mmWidth = 8467
              BandType = 1
            end
            object rpProcJudSubRep4Lbl7: TppLabel
              UserName = 'rpProcJudSubRep4Lbl7'
              AutoSize = False
              Caption = 'Risco Máximo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 75142
              mmTop = 22225
              mmWidth = 23548
              BandType = 1
            end
            object rpProcJudSubRep4Lbl8: TppLabel
              UserName = 'rpProcJudSubRep4Lbl8'
              AutoSize = False
              Caption = 'Valor Real'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 107950
              mmTop = 22225
              mmWidth = 23548
              BandType = 1
            end
            object rpProcJudSubRep4Lbl9: TppLabel
              UserName = 'rpProcJudSubRep4Lbl9'
              AutoSize = False
              Caption = 'Economia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 138907
              mmTop = 17198
              mmWidth = 50006
              BandType = 1
            end
            object rpProcJudSubRep4Lbl10: TppLabel
              UserName = 'rpProcJudSubRep4Lbl10'
              AutoSize = False
              Caption = 'Sobre Máximo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 138907
              mmTop = 22225
              mmWidth = 23813
              BandType = 1
            end
            object rpProcJudSubRep4Lbl11: TppLabel
              UserName = 'rpProcJudSubRep4Lbl11'
              AutoSize = False
              Caption = 'Sobre Provável'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 165100
              mmTop = 22225
              mmWidth = 23813
              BandType = 1
            end
            object rpProcJudSubRep4Line1: TppLine
              UserName = 'rpProcJudSubRep4Line1'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 10319
              mmLeft = 38100
              mmTop = 16140
              mmWidth = 1323
              BandType = 1
            end
            object rpProcJudSubRep4Line4: TppLine
              UserName = 'rpProcJudSubRep4Line4'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 10319
              mmLeft = 135732
              mmTop = 16140
              mmWidth = 1323
              BandType = 1
            end
            object rpProcJudSubRep4Line2: TppLine
              UserName = 'rpProcJudSubRep4Line2'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 10319
              mmLeft = 70644
              mmTop = 16140
              mmWidth = 1323
              BandType = 1
            end
            object rpProcJudSubRep4Line3: TppLine
              UserName = 'rpProcJudSubRep4Line3'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 10319
              mmLeft = 103188
              mmTop = 16140
              mmWidth = 1323
              BandType = 1
            end
          end
          object rpProcJudSubRep4DtlBnd: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 8996
            mmPrintPosition = 0
            object rpProcJudSubRep4ShapeShape2: TppShape
              UserName = 'rpProcJudSubRep4ShapeShape2'
              mmHeight = 8996
              mmLeft = 6350
              mmTop = 0
              mmWidth = 185473
              BandType = 4
            end
            object rpProcJudSubRep4DBTxt2: TppDBText
              UserName = 'rpProcJudSubRep2DBTxt2'
              DataField = 'ESTADO'
              DataPipeline = ppProcJud4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 7938
              mmTop = 794
              mmWidth = 123561
              BandType = 4
            end
            object rpProcJudSubRep4DBTxt4: TppDBText
              UserName = 'rpProcJudSubRep4DBTxt4'
              DataField = 'VALRECLAMADO'
              DataPipeline = ppProcJud4
              DisplayFormat = '#,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 42863
              mmTop = 5292
              mmWidth = 23548
              BandType = 4
            end
            object rpProcJudSubRep4DBTxt3: TppDBText
              UserName = 'rpProcJudSubRep4DBTxt3'
              DataField = 'QTDPROC'
              DataPipeline = ppProcJud4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 19579
              mmTop = 5292
              mmWidth = 14288
              BandType = 4
            end
            object rpProcJudSubRep4DBTxt5: TppDBText
              UserName = 'rpProcJudSubRep4DBTxt5'
              DataField = 'VALESTIMADO'
              DataPipeline = ppProcJud4
              DisplayFormat = '#,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 75142
              mmTop = 5292
              mmWidth = 23548
              BandType = 4
            end
            object rpProcJudSubRep4DBTxt6: TppDBText
              UserName = 'rpProcJudSubRep4DBTxt6'
              DataField = 'VALREAL'
              DataPipeline = ppProcJud4
              DisplayFormat = '#,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 107950
              mmTop = 5292
              mmWidth = 23548
              BandType = 4
            end
            object rpProcJudSubRep4Line5: TppLine
              UserName = 'rpProcJudSubRep4Line5'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 38100
              mmTop = 5292
              mmWidth = 1323
              BandType = 4
            end
            object rpProcJudSubRep4Line6: TppLine
              UserName = 'rpProcJudSubRep4Line6'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 70644
              mmTop = 5292
              mmWidth = 1323
              BandType = 4
            end
            object rpProcJudSubRep4Line7: TppLine
              UserName = 'rpProcJudSubRep4Line7'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 103188
              mmTop = 5292
              mmWidth = 1323
              BandType = 4
            end
            object rpProcJudSubRep4Line8: TppLine
              UserName = 'rpProcJudSubRep4Line8'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 135732
              mmTop = 5292
              mmWidth = 1323
              BandType = 4
            end
            object rpProcJudSubRep4DBTxt7: TppDBText
              UserName = 'rpProcJudSubRep4DBTxt7'
              DataField = 'ECONRECLAMADO'
              DataPipeline = ppProcJud4
              DisplayFormat = '#,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 138907
              mmTop = 5292
              mmWidth = 23813
              BandType = 4
            end
            object rpProcJudSubRep4DBTxt8: TppDBText
              UserName = 'rpProcJudSubRep4DBTxt8'
              DataField = 'ECONESTIMADO'
              DataPipeline = ppProcJud4
              DisplayFormat = '#,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 165100
              mmTop = 5292
              mmWidth = 23813
              BandType = 4
            end
          end
          object rpProcJudSubRep4Grp1: TppGroup
            BreakName = 'EMPRESA'
            DataPipeline = ppProcJud4
            KeepTogether = True
            UserName = 'rpProcJudSubRep4Grp1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            object rpProcJudSubRep4GrpHdrBnd: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object rpProcJudSubRep4GrpFootBnd: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 9525
              mmPrintPosition = 0
              object rpProcJudSubRep4Shape3: TppShape
                UserName = 'rpProcJudSubRep4Shape3'
                mmHeight = 9525
                mmLeft = 6350
                mmTop = 0
                mmWidth = 185473
                BandType = 5
                GroupNo = 0
              end
              object rpProcJudSubRep4Lbl12: TppLabel
                UserName = 'rpProcJudSubRep4Lbl12'
                AutoSize = False
                Caption = 'Totais'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 8202
                mmTop = 1058
                mmWidth = 12700
                BandType = 5
                GroupNo = 0
              end
              object rpProcJudSubRep4DBCalc1: TppDBCalc
                UserName = 'rpProcJudSubRep4DBCalc1'
                DataField = 'QTDPROC'
                DataPipeline = ppProcJud4
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcJudSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 19579
                mmTop = 5556
                mmWidth = 14288
                BandType = 5
                GroupNo = 0
              end
              object rpProcJudSubRep4DBCalc2: TppDBCalc
                UserName = 'rpProcJudSubRep4DBCalc2'
                DataField = 'VALRECLAMADO'
                DataPipeline = ppProcJud4
                DisplayFormat = '#,###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcJudSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 42863
                mmTop = 5556
                mmWidth = 23548
                BandType = 5
                GroupNo = 0
              end
              object rpProcJudSubRep4DBCalc3: TppDBCalc
                UserName = 'rpProcJudSubRep4DBCalc3'
                DataField = 'VALESTIMADO'
                DataPipeline = ppProcJud4
                DisplayFormat = '#,###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcJudSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 75142
                mmTop = 5556
                mmWidth = 23548
                BandType = 5
                GroupNo = 0
              end
              object rpProcJudSubRep4DBCalc4: TppDBCalc
                UserName = 'rpProcJudSubRep4DBCalc4'
                DataField = 'VALREAL'
                DataPipeline = ppProcJud4
                DisplayFormat = '#,###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcJudSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 107950
                mmTop = 5556
                mmWidth = 23548
                BandType = 5
                GroupNo = 0
              end
              object rpProcJudSubRep4DBCalc5: TppDBCalc
                UserName = 'rpProcJudSubRep4DBCalc5'
                DataField = 'ECONRECLAMADO'
                DataPipeline = ppProcJud4
                DisplayFormat = '#,###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcJudSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 138907
                mmTop = 5556
                mmWidth = 23813
                BandType = 5
                GroupNo = 0
              end
              object rpProcJudSubRep4DBCalc6: TppDBCalc
                UserName = 'rpProcJudSubRep4DBCalc6'
                DataField = 'ECONESTIMADO'
                DataPipeline = ppProcJud4
                DisplayFormat = '#,###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcJudSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 165100
                mmTop = 5556
                mmWidth = 23813
                BandType = 5
                GroupNo = 0
              end
              object rpProcJudSubRep4Line9: TppLine
                UserName = 'rpProcJudSubRep4Line9'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 9525
                mmLeft = 38100
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object rpProcJudSubRep4Line10: TppLine
                UserName = 'rpProcJudSubRep4Line10'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 9525
                mmLeft = 70644
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object rpProcJudSubRep4Line11: TppLine
                UserName = 'rpProcJudSubRep4Line11'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 9525
                mmLeft = 103188
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object rpProcJudSubRep4Line12: TppLine
                UserName = 'rpProcJudSubRep4Line12'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 9525
                mmLeft = 135732
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
    end
    object rpProcJudGrp0: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppProcJud
      NewPage = True
      ResetPageNo = True
      UserName = 'rpProcJudGrp0'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpProcJudGrpHdrBnd0: TppGroupHeaderBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpProcJudGrpFootBnd0: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object rpProcJudLbl19: TppLabel
          UserName = 'rpProcJudLbl19'
          AutoSize = False
          Caption = 'Total de Processos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 17198
          mmTop = 1852
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
        object rpProcJudDBCalc1: TppDBCalc
          UserName = 'rpProcJudDBCalc1'
          DataField = 'NUMPROC'
          DataPipeline = ppProcJud
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpProcJudGrp0
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3175
          mmLeft = 48154
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpProcJudLbl20: TppLabel
          UserName = 'rpProcJudLbl20'
          AutoSize = False
          Caption = 'Custo Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 154517
          mmTop = 1852
          mmWidth = 19579
          BandType = 5
          GroupNo = 0
        end
        object rpProcJudDBCalc2: TppDBCalc
          UserName = 'rpProcJudDBCalc2'
          BlankWhenZero = True
          DataField = 'RISCOMAXIMO'
          DataPipeline = ppProcJud
          DisplayFormat = '#,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rpProcJudGrp0
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 175419
          mmTop = 2381
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
        object rpProcJudDBCalc3: TppDBCalc
          UserName = 'rpProcJudDBCalc3'
          BlankWhenZero = True
          DataField = 'RISCOPROVAVEL'
          DataPipeline = ppProcJud
          DisplayFormat = '#,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rpProcJudGrp0
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 197644
          mmTop = 2381
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
        object rpProcJudDBCalc4: TppDBCalc
          UserName = 'rpProcJudDBCalc4'
          BlankWhenZero = True
          DataField = 'VALORREAL'
          DataPipeline = ppProcJud
          DisplayFormat = '#,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rpProcJudGrp0
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 219869
          mmTop = 2381
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpProcJudDBCalc5: TppDBCalc
          UserName = 'rpProcJudDBCalc5'
          BlankWhenZero = True
          DataField = 'ECONOMIA1'
          DataPipeline = ppProcJud
          DisplayFormat = '#,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rpProcJudGrp0
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 242623
          mmTop = 2381
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
        object rpProcJudDBCalc6: TppDBCalc
          UserName = 'rpProcJudDBCalc6'
          BlankWhenZero = True
          DataField = 'ECONOMIA2'
          DataPipeline = ppProcJud
          DisplayFormat = '#,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rpProcJudGrp0
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 263790
          mmTop = 2381
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpProcJudGrp1: TppGroup
      BreakName = 'NUMPROCTRAB'
      DataPipeline = ppProcJud
      KeepTogether = True
      UserName = 'rpProcJudGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpProcJudGrpHdrBnd1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object rpProcJudShape1: TppShape
          UserName = 'rpProcJudShape1'
          Brush.Color = clSilver
          Pen.Color = clSilver
          mmHeight = 4498
          mmLeft = 4498
          mmTop = 0
          mmWidth = 276226
          BandType = 3
          GroupNo = 1
        end
        object rpProcJudDBTxtNomeVara: TppDBText
          UserName = 'rpProcJudDBTxtNomeVara'
          DataField = 'NOMEVARA'
          DataPipeline = ppProcJud
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 175419
          mmTop = 794
          mmWidth = 61648
          BandType = 3
          GroupNo = 1
        end
        object rpProcJudDBTxtNumVara: TppDBText
          UserName = 'rpProcJudDBTxtNumVara'
          BlankWhenZero = True
          DataField = 'NUMVARAJUSTICA'
          DataPipeline = ppProcJud
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 241300
          mmTop = 794
          mmWidth = 20638
          BandType = 3
          GroupNo = 1
        end
        object rpProcJudDBTxt2: TppDBText
          UserName = 'rpProcJudDBTxt2'
          DataField = 'PROCJCJNUM'
          DataPipeline = ppProcJud
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 5027
          mmTop = 794
          mmWidth = 33867
          BandType = 3
          GroupNo = 1
        end
        object rpProcJudDBTxt3: TppDBText
          UserName = 'rpProcJudDBTxt3'
          DataField = 'UF'
          DataPipeline = ppProcJud
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 41804
          mmTop = 794
          mmWidth = 6350
          BandType = 3
          GroupNo = 1
        end
        object rpProcJudDBTxt4: TppDBText
          UserName = 'rpProcJudDBTxt4'
          DataField = 'CONTRAPARTE'
          DataPipeline = ppProcJud
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 51065
          mmTop = 794
          mmWidth = 67469
          BandType = 3
          GroupNo = 1
        end
        object rpProcJudDBTxt5: TppDBText
          UserName = 'rpProcJudDBTxt5'
          DataField = 'PARTE'
          DataPipeline = ppProcJud
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 121444
          mmTop = 794
          mmWidth = 22754
          BandType = 3
          GroupNo = 1
        end
        object rpProcJudDBTxt6: TppDBText
          UserName = 'rpProcJudDBTxt6'
          DataField = 'DATANOTIF'
          DataPipeline = ppProcJud
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 147109
          mmTop = 794
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object rpProcJudDBTxt7: TppDBText
          UserName = 'rpProcJudDBTxt7'
          DataField = 'SITUACAO'
          DataPipeline = ppProcJud
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 165894
          mmTop = 794
          mmWidth = 6615
          BandType = 3
          GroupNo = 1
        end
        object rpProcJudDBTxtRiscoMax: TppDBText
          UserName = 'rpProcJudDBTxtRiscoMax'
          BlankWhenZero = True
          DataField = 'RISCOMAXIMO'
          DataPipeline = ppProcJud
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 175419
          mmTop = 794
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object rpProcJudDBTxt9: TppDBText
          UserName = 'rpProcJudDBTxt9'
          BlankWhenZero = True
          DataField = 'RISCOPROVAVEL'
          DataPipeline = ppProcJud
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 197644
          mmTop = 794
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object rpProcJudDBTxt10: TppDBText
          UserName = 'rpProcJudDBTxt10'
          BlankWhenZero = True
          DataField = 'VALORREAL'
          DataPipeline = ppProcJud
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 219869
          mmTop = 794
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object rpProcJudDBTxtEconomia1: TppDBText
          UserName = 'rpProcJudDBTxtEconomia1'
          BlankWhenZero = True
          DataField = 'ECONOMIA1'
          DataPipeline = ppProcJud
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 242623
          mmTop = 794
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object rpProcJudDBTxt11: TppDBText
          UserName = 'rpProcJudDBTxt11'
          BlankWhenZero = True
          DataField = 'ECONOMIA2'
          DataPipeline = ppProcJud
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 263790
          mmTop = 794
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
      end
      object rpProcJudGrpFootBnd1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object rpProcJudSubRep1: TppSubReport
          UserName = 'rpProcJudSubRep1'
          ExpandAll = False
          NewPrintJob = False
          TraverseAllData = False
          mmHeight = 3704
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = ppProcJud1
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Relação de Processos'
            PrinterSetup.Orientation = poLandscape
            PrinterSetup.PaperName = 'A4 297 x 210 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 210000
            PrinterSetup.mmPaperWidth = 297000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utMillimeters
            Left = 216
            Top = 72
            Version = '5.5'
            mmColumnWidth = 0
            object rpProcJudSubRep1TitBnd: TppTitleBand
              BeforePrint = rpProcJudSubRep1TitBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object rpProcJudSubRep1Lbl1: TppLabel
                UserName = 'rpProcJudSubRep1Lbl1'
                AutoSize = False
                Caption = 'Nome do Litisconsorte'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 26458
                mmTop = 265
                mmWidth = 40746
                BandType = 1
              end
              object rpProcJudSubRep1Lbl2: TppLabel
                UserName = 'rpProcJudSubRep1Lbl2'
                AutoSize = False
                Caption = 'Situação do Litisconsorte'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 125942
                mmTop = 265
                mmWidth = 40746
                BandType = 1
              end
            end
            object rpProcJudSubRep1DtlBnd: TppDetailBand
              BeforePrint = rpProcJudSubRep1TitBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object rpProcJudSubRep1DBTxt1: TppDBText
                UserName = 'rpProcJudSubRep1DBTxt1'
                DataField = 'LITISCONSORTE'
                DataPipeline = ppProcJud1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                mmHeight = 2910
                mmLeft = 26458
                mmTop = 265
                mmWidth = 96309
                BandType = 4
              end
              object rpProcJudSubRep1DBTxt2: TppDBText
                UserName = 'rpProcJudSubRep1DBTxt2'
                DataField = 'SITUACAO'
                DataPipeline = ppProcJud1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                mmHeight = 2910
                mmLeft = 125942
                mmTop = 265
                mmWidth = 100000
                BandType = 4
              end
            end
            object rpProcJudSubRep1SmryBnd: TppSummaryBand
              BeforePrint = rpProcJudSubRep1TitBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 2646
              mmPrintPosition = 0
            end
          end
        end
        object rpProcJudSubRep2: TppSubReport
          UserName = 'rpProcJudSubRep2'
          ExpandAll = False
          NewPrintJob = False
          ShiftRelativeTo = rpProcJudSubRep1
          TraverseAllData = False
          mmHeight = 3704
          mmLeft = 0
          mmTop = 3440
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = ppProcJud2
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Relação de Processos'
            PrinterSetup.Orientation = poLandscape
            PrinterSetup.PaperName = 'A4 297 x 210 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 210000
            PrinterSetup.mmPaperWidth = 297000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utMillimeters
            Left = 256
            Top = 112
            Version = '5.5'
            mmColumnWidth = 0
            object rpProcJudSubRep2TitBnd: TppTitleBand
              BeforePrint = rpProcJudSubRep2TitBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object rpProcJudSubRep2Lbl1: TppLabel
                UserName = 'rpProcJudSubRep2Lbl1'
                AutoSize = False
                Caption = 'Tipo de Etapa ou Andamento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 26458
                mmTop = 265
                mmWidth = 72231
                BandType = 1
              end
              object rpProcJudSubRep2Lbl2: TppLabel
                UserName = 'rpProcJudSubRep2Lbl2'
                AutoSize = False
                Caption = 'Data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 103717
                mmTop = 265
                mmWidth = 19315
                BandType = 1
              end
              object rpProcJudSubRep2Lbl3: TppLabel
                UserName = 'rpProcJudSubRep2Lbl3'
                AutoSize = False
                Caption = 'Assunto Resumido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 128588
                mmTop = 265
                mmWidth = 29633
                BandType = 1
              end
            end
            object rpProcJudSubRep2DtlBnd: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 20108
              mmPrintPosition = 0
              object rpProcJudSubRep2DBTxt1: TppDBText
                UserName = 'rpProcJudSubRep2DBTxt1'
                DataField = 'ETAPA'
                DataPipeline = ppProcJud2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                mmHeight = 2910
                mmLeft = 26458
                mmTop = 265
                mmWidth = 72231
                BandType = 4
              end
              object rpProcJudSubRep2DBTxt2: TppDBText
                UserName = 'DBText1'
                DataField = 'DATAREALOCOR'
                DataPipeline = ppProcJud2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                mmHeight = 2910
                mmLeft = 103717
                mmTop = 265
                mmWidth = 19315
                BandType = 4
              end
              object rpProcJudSubRep2DBTxt3: TppDBText
                UserName = 'rpProcJudSubRep2DBTxt3'
                DataField = 'ASSUNTO'
                DataPipeline = ppProcJud2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                mmHeight = 2910
                mmLeft = 128588
                mmTop = 265
                mmWidth = 89165
                BandType = 4
              end
              object rpProcJudSubRep2DBMemo1: TppDBMemo
                UserName = 'rpProcJudSubRep2DBMemo1'
                CharWrap = False
                DataField = 'OBSERVETAPA'
                DataPipeline = ppProcJud2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Stretch = True
                Transparent = True
                mmHeight = 15081
                mmLeft = 37306
                mmTop = 3704
                mmWidth = 120650
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
            end
            object rpProcJudSubRep2SmryBnd: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 2646
              mmPrintPosition = 0
            end
          end
        end
        object rpProcJudSubRep3: TppSubReport
          UserName = 'rpProcJudSubRep3'
          ExpandAll = False
          NewPrintJob = False
          ShiftRelativeTo = rpProcJudSubRep2
          TraverseAllData = False
          mmHeight = 3704
          mmLeft = 0
          mmTop = 6879
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport3: TppChildReport
            AutoStop = False
            DataPipeline = ppProcJud3
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Relação de Processos'
            PrinterSetup.Orientation = poLandscape
            PrinterSetup.PaperName = 'A4 297 x 210 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 210000
            PrinterSetup.mmPaperWidth = 297000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utMillimeters
            Left = 224
            Top = 80
            Version = '5.5'
            mmColumnWidth = 0
            object rpProcJudSubRep3TitBnd: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object rpProcJudSubRep3Lbl1: TppLabel
                UserName = 'Label1'
                AutoSize = False
                Caption = 'Tipo de Objeto'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 26458
                mmTop = 265
                mmWidth = 72231
                BandType = 1
              end
              object rpProcJudSubRep3Lbl2: TppLabel
                UserName = 'Label2'
                AutoSize = False
                Caption = 'Período de Ocorrência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 128323
                mmTop = 265
                mmWidth = 34396
                BandType = 1
              end
            end
            object rpProcJudSubRep3DtlBnd: TppDetailBand
              BeforePrint = rpProcJudSubRep3DtlBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object rpProcJudSubRep3DBTxt1: TppDBText
                UserName = 'rpProcJudSubRep3DBTxt1'
                DataField = 'OBJETO'
                DataPipeline = ppProcJud3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                mmHeight = 2910
                mmLeft = 26458
                mmTop = 265
                mmWidth = 72231
                BandType = 4
              end
              object rpProcJudSubRep3DBTxt3: TppDBText
                UserName = 'rpProcJudSubRep3DBTxt3'
                DataField = 'DATAFINAL'
                DataPipeline = ppProcJud3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                mmHeight = 2910
                mmLeft = 148432
                mmTop = 265
                mmWidth = 14288
                BandType = 4
              end
              object rpProcJudSubRep3DBTxt2: TppDBText
                UserName = 'rpProcJudSubRep3DBTxt2'
                DataField = 'DATAINICIO'
                DataPipeline = ppProcJud3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                mmHeight = 2910
                mmLeft = 128323
                mmTop = 265
                mmWidth = 14288
                BandType = 4
              end
              object rpProcJudSubRep3LblRiscoMax: TppLabel
                UserName = 'rpProcJudSubRep3LblRiscoMax'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 175419
                mmTop = 265
                mmWidth = 16404
                BandType = 4
              end
              object rpProcJudSubRep3LblRiscoProv: TppLabel
                UserName = 'rpProcJudSubRep3LblRiscoProv'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 197644
                mmTop = 265
                mmWidth = 16404
                BandType = 4
              end
              object rpProcJudSubRep3LblValorReal: TppLabel
                UserName = 'rpProcJudSubRep3LblValorReal'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 219869
                mmTop = 265
                mmWidth = 17198
                BandType = 4
              end
              object rpProcJudSubRep3LblEconomia1: TppLabel
                UserName = 'rpProcJudSubRep3LblEconomia1'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 242623
                mmTop = 265
                mmWidth = 16404
                BandType = 4
              end
              object rpProcJudSubRep3LblEconomia2: TppLabel
                UserName = 'rpProcJudSubRep3LblEconomia2'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 263790
                mmTop = 265
                mmWidth = 16404
                BandType = 4
              end
            end
            object rpProcJudSubRep3SmryBnd: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 2626
              mmPrintPosition = 0
            end
          end
        end
      end
    end
  end
  object ppProcJud: TppBDEPipeline
    DataSource = dsProcJud
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ppProcJud'
    Left = 106
    Top = 79
    object ppProcJudppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppProcJudppField2: TppField
      FieldAlias = 'NUMPROCTRAB'
      FieldName = 'NUMPROCTRAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppProcJudppField3: TppField
      FieldAlias = 'NUMPROC'
      FieldName = 'NUMPROC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppProcJudppField4: TppField
      FieldAlias = 'PROCJCJNUM'
      FieldName = 'PROCJCJNUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppProcJudppField5: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppProcJudppField6: TppField
      FieldAlias = 'CONTRAPARTE'
      FieldName = 'CONTRAPARTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppProcJudppField7: TppField
      FieldAlias = 'PARTE'
      FieldName = 'PARTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppProcJudppField8: TppField
      FieldAlias = 'NOMEVARA'
      FieldName = 'NOMEVARA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppProcJudppField9: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppProcJudppField10: TppField
      FieldAlias = 'NUMVARAJUSTICA'
      FieldName = 'NUMVARAJUSTICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppProcJudppField11: TppField
      FieldAlias = 'DATANOTIF'
      FieldName = 'DATANOTIF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppProcJudppField12: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppProcJudppField13: TppField
      FieldAlias = 'RISCOMAXIMO'
      FieldName = 'RISCOMAXIMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppProcJudppField14: TppField
      FieldAlias = 'RISCOPROVAVEL'
      FieldName = 'RISCOPROVAVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppProcJudppField15: TppField
      FieldAlias = 'VALORREAL'
      FieldName = 'VALORREAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppProcJudppField16: TppField
      FieldAlias = 'ECONOMIA1'
      FieldName = 'ECONOMIA1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppProcJudppField17: TppField
      FieldAlias = 'ECONOMIA2'
      FieldName = 'ECONOMIA2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppProcJudppField18: TppField
      FieldAlias = 'MOEDAPROCTRAB'
      FieldName = 'MOEDAPROCTRAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppProcJudppField19: TppField
      FieldAlias = 'IDREGRA'
      FieldName = 'IDREGRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppProcJudppField20: TppField
      FieldAlias = 'DATAEFETENC'
      FieldName = 'DATAEFETENC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppProcJudppField21: TppField
      FieldAlias = 'INDTAXACONV'
      FieldName = 'INDTAXACONV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppProcJudppField22: TppField
      FieldAlias = 'FLGSITPROC'
      FieldName = 'FLGSITPROC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
  end
  object dsProcJud: TwwDataSource
    DataSet = qryProcJud
    Left = 106
    Top = 67
  end
  object qryProcJud: TwwQuery
    CachedUpdates = True
    AfterScroll = qryProcJudAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA,'
      '  0 AS NUMPROCTRAB,'
      '  0 AS NUMPROC,'
      '  '#39'1234567890123456789012345'#39' AS PROCJCJNUM,'
      '  '#39'12'#39' AS UF,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS CONTRAPARTE,'
      '  '#39'1234567'#39' AS PARTE,'
      '  '#39'123456789012345678901234567890'#39' AS NOMEVARA,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS PATROCINADORA,'
      '  0 AS NUMVARAJUSTICA,'
      '  '#39'1234567890'#39' AS DATANOTIF,'
      '  '#39'123'#39' AS SITUACAO,'
      '  0 AS RISCOMAXIMO,'
      '  0 AS RISCOPROVAVEL,'
      '  0 AS VALORREAL,'
      '  0 AS ECONOMIA1,'
      '  0 AS ECONOMIA2,'
      '  '#39'12345678901234567890'#39' AS MOEDAPROCTRAB,'
      '  0 AS IDREGRA,'
      '  '#39'1234567890'#39' AS DATAEFETENC,'
      '  0 AS INDTAXACONV,'
      '  0 AS FLGSITPROC'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      ' ')
    UpdateObject = updProcJud
    ValidateWithMask = True
    Left = 106
    Top = 53
  end
  object ppProcJud1: TppBDEPipeline
    DataSource = dsProcJud1
    CloseDataSource = True
    UserName = 'ppProcJud1'
    Left = 178
    Top = 68
    object ppProcJud1ppField1: TppField
      FieldAlias = 'LITISCONSORTE'
      FieldName = 'LITISCONSORTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppProcJud1ppField2: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  object dsProcJud1: TwwDataSource
    DataSet = qryProcJud1
    Left = 178
    Top = 54
  end
  object qryProcJud1: TwwQuery
    AfterOpen = qryProcJud1AfterOpen
    DatabaseName = 'BaseDados'
    DataSource = dsProcJud
    SQL.Strings = (
      'SELECT'
      '  DECODE(P.TIPO,'#39'F'#39', P.NOME, P.RAZAOSOCIAL) AS LITISCONSORTE,'
      '  DECODE(C.IDMOTIVO,NULL,'#39'Normal'#39', M.DESCRICAO) AS SITUACAO'
      'FROM'
      '  PESSOA P, COPARTPROCTRAB C, MOTIVO M'
      'WHERE'
      '  (C.NUMPROCTRAB = :NUMPROC) AND'
      ''
      '  (C.IDPESSOA    = P.IDPESSOA) AND'
      '  (C.IDMOTIVO    = M.IDMOTIVO(+))'
      'ORDER BY'
      '  LITISCONSORTE')
    ValidateWithMask = True
    Left = 178
    Top = 40
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NUMPROC'
        ParamType = ptUnknown
      end>
  end
  object updProcJud: TUpdateSQL
    Left = 106
    Top = 40
  end
  object ppProcJud2: TppBDEPipeline
    DataSource = dsProcJud2
    CloseDataSource = True
    UserName = 'ppProcJud2'
    Left = 248
    Top = 67
    object ppProcJud2ppField1: TppField
      FieldAlias = 'NUMSEQ'
      FieldName = 'NUMSEQ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppProcJud2ppField2: TppField
      FieldAlias = 'ETAPA'
      FieldName = 'ETAPA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppProcJud2ppField3: TppField
      FieldAlias = 'VALORHONOR'
      FieldName = 'VALORHONOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppProcJud2ppField4: TppField
      FieldAlias = 'DATAREALOCOR'
      FieldName = 'DATAREALOCOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppProcJud2ppField5: TppField
      FieldAlias = 'ASSUNTO'
      FieldName = 'ASSUNTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppProcJud2ppField6: TppField
      FieldAlias = 'NUMPROCTRAB'
      FieldName = 'NUMPROCTRAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppProcJud2ppField7: TppField
      FieldAlias = 'CODTIPORECURSO'
      FieldName = 'CODTIPORECURSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppProcJud2ppField8: TppField
      FieldAlias = 'VALORREC'
      FieldName = 'VALORREC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppProcJud2ppField9: TppField
      FieldAlias = 'OBSERVETAPA'
      FieldName = 'OBSERVETAPA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppProcJud2ppField10: TppField
      FieldAlias = 'IDIMAGEM'
      FieldName = 'IDIMAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object dsProcJud2: TwwDataSource
    DataSet = qryProcJud2
    Left = 248
    Top = 53
  end
  object qryProcJud2: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsProcJud
    SQL.Strings = (
      'SELECT'
      '  E.NUMSEQ, T.DESCRICAO AS ETAPA, T.VALORHONOR,'
      '  E.DATAREALOCOR, E.ASSUNTO, E.NUMPROCTRAB,'
      '  E.CODTIPORECURSO, E.VALORREC, E.OBSERVETAPA,'
      '  E.IDIMAGEM'
      'FROM'
      '  ETAPAPROCTRAB E, TIPORECTRAB T'
      'WHERE'
      '  (E.NUMPROCTRAB    = :NUMPROC) AND'
      ''
      '  (E.CODTIPORECURSO = T.CODTIPORECURSO)'
      'ORDER BY'
      '  E.DATAREALOCOR')
    ValidateWithMask = True
    Left = 248
    Top = 40
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NUMPROC'
        ParamType = ptUnknown
      end>
  end
  object ppProcJud3: TppBDEPipeline
    DataSource = dsProcJud3
    CloseDataSource = True
    UserName = 'ppProcJud3'
    Left = 318
    Top = 67
    object ppProcJud3ppField1: TppField
      FieldAlias = 'NUMPROCTRAB'
      FieldName = 'NUMPROCTRAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppProcJud3ppField2: TppField
      FieldAlias = 'CODTIPOOBJETO'
      FieldName = 'CODTIPOOBJETO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppProcJud3ppField3: TppField
      FieldAlias = 'VALORRECL'
      FieldName = 'VALORRECL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppProcJud3ppField4: TppField
      FieldAlias = 'PERCPROB'
      FieldName = 'PERCPROB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppProcJud3ppField5: TppField
      FieldAlias = 'VALORSENTENCA'
      FieldName = 'VALORSENTENCA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppProcJud3ppField6: TppField
      FieldAlias = 'INDVALOR'
      FieldName = 'INDVALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppProcJud3ppField7: TppField
      FieldAlias = 'DATAINICIO'
      FieldName = 'DATAINICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppProcJud3ppField8: TppField
      FieldAlias = 'DATAFINAL'
      FieldName = 'DATAFINAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppProcJud3ppField9: TppField
      FieldAlias = 'OBJETO'
      FieldName = 'OBJETO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object dsProcJud3: TwwDataSource
    DataSet = qryProcJud3
    Left = 318
    Top = 53
  end
  object qryProcJud3: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsProcJud
    SQL.Strings = (
      'SELECT'
      '  O.NUMPROCTRAB, O.CODTIPOOBJETO, O.VALORRECL,'
      '  O.PERCPROB, O.PERCORIG, O.VALORSENTENCA, O.INDVALOR,'
      '  O.DATAINICIO, O.DATAFINAL, T.DESCRICAO AS OBJETO'
      'FROM'
      '  OBJPROCTRAB O, TIPOOBJPROCTRAB T'
      'WHERE'
      '  (O.NUMPROCTRAB   = :NUMPROC) AND'
      ''
      '  (O.CODTIPOOBJETO = T.CODTIPOOBJETO)'
      'ORDER BY'
      '  O.NUMPROCTRAB, UPPER(T.DESCRICAO)')
    ValidateWithMask = True
    Left = 318
    Top = 40
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NUMPROC'
        ParamType = ptUnknown
      end>
  end
  object ppProcJud4: TppBDEPipeline
    DataSource = dsProcJud4
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'ppProcJud4'
    Left = 390
    Top = 67
    object ppProcJud4ppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppProcJud4ppField2: TppField
      FieldAlias = 'IDESTADO'
      FieldName = 'IDESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppProcJud4ppField3: TppField
      FieldAlias = 'ESTADO'
      FieldName = 'ESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppProcJud4ppField4: TppField
      FieldAlias = 'QTDPROC'
      FieldName = 'QTDPROC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppProcJud4ppField5: TppField
      FieldAlias = 'VALRECLAMADO'
      FieldName = 'VALRECLAMADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppProcJud4ppField6: TppField
      FieldAlias = 'VALESTIMADO'
      FieldName = 'VALESTIMADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppProcJud4ppField7: TppField
      FieldAlias = 'VALREAL'
      FieldName = 'VALREAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppProcJud4ppField8: TppField
      FieldAlias = 'ECONRECLAMADO'
      FieldName = 'ECONRECLAMADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppProcJud4ppField9: TppField
      FieldAlias = 'ECONESTIMADO'
      FieldName = 'ECONESTIMADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object dsProcJud4: TwwDataSource
    DataSet = qryProcJud4
    Left = 390
    Top = 53
  end
  object qryProcJud4: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA,'
      '  0 AS IDESTADO,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS ESTADO,'
      '  0 AS QTDPROC,'
      '  0 AS VALRECLAMADO,'
      '  0 AS VALESTIMADO,'
      '  0 AS VALREAL,'
      '  0 AS ECONRECLAMADO,'
      '  0 AS ECONESTIMADO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      ' ')
    UpdateObject = updProcJud4
    ValidateWithMask = True
    Left = 390
    Top = 40
  end
  object updProcJud4: TUpdateSQL
    Left = 390
    Top = 27
  end
  object qryProcJud1Aux: TwwQuery
    CachedUpdates = True
    AfterOpen = qryProcJud1AfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'Indefinido'#39' AS LITISCONSORTE,'
      '  '#39'Indefinida'#39' AS SITUACAO'
      'FROM'
      '  DUAL')
    ValidateWithMask = True
    Left = 178
    Top = 27
  end
end
