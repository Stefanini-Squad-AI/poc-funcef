inherited dtmRelatoriosProcPrev: TdtmRelatoriosProcPrev
  Left = 286
  Top = 211
  Width = 452
  Height = 180
  Caption = 'dtmRelatoriosProcPrev'
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
  object rpProcTrab: TppReport
    AutoStop = False
    DataPipeline = ppProcTrab
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
    Left = 101
    Top = 82
    Version = '5.5'
    mmColumnWidth = 197300
    object rpProcTrabHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object rpProcTrabLbl7: TppLabel
        UserName = 'rpProcTrabLbl7'
        AutoSize = False
        Caption = 'Admissão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 90488
        mmTop = 20373
        mmWidth = 15610
        BandType = 0
      end
      object rpProcTrabLbl1: TppLabel
        UserName = 'Label1'
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
      object rpProcTrabDBTxt1: TppDBText
        UserName = 'rpProcTrabDBTxt1'
        DataField = 'EMPRESA'
        DataPipeline = ppProcTrab
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
      object rpProcTrabLbl4: TppLabel
        UserName = 'rpProcTrabLbl4'
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
        mmWidth = 32808
        BandType = 0
      end
      object rpProcTrabLbl5: TppLabel
        UserName = 'rpProcTrabLbl5'
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
        mmLeft = 38365
        mmTop = 20373
        mmWidth = 5292
        BandType = 0
      end
      object rpProcTrabLbl6: TppLabel
        UserName = 'rpProcTrabLbl6'
        AutoSize = False
        Caption = 'Contra Parte'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 44186
        mmTop = 20373
        mmWidth = 45773
        BandType = 0
      end
      object rpProcTrabLbl8: TppLabel
        UserName = 'rpProcTrabLbl8'
        AutoSize = False
        Caption = 'Demissão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 106627
        mmTop = 20373
        mmWidth = 15610
        BandType = 0
      end
      object rpProcTrabLbl9: TppLabel
        UserName = 'rpProcTrabLbl9'
        AutoSize = False
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 122767
        mmTop = 20373
        mmWidth = 39158
        BandType = 0
      end
      object rpProcTrabLbl10: TppLabel
        UserName = 'rpProcTrabLbl10'
        AutoSize = False
        Caption = 'Nº Vara'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 138642
        mmTop = 20373
        mmWidth = 32808
        BandType = 0
      end
      object rpProcTrabLbl11: TppLabel
        UserName = 'rpProcTrabLbl11'
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
        mmLeft = 171980
        mmTop = 20373
        mmWidth = 15875
        BandType = 0
      end
      object rpProcTrabLbl12: TppLabel
        UserName = 'Label2'
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
        mmLeft = 188384
        mmTop = 20373
        mmWidth = 6350
        BandType = 0
      end
      object rpProcTrabLbl13: TppLabel
        UserName = 'rpProcTrabLbl13'
        AutoSize = False
        Caption = 'Risco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 195263
        mmTop = 15875
        mmWidth = 16404
        BandType = 0
      end
      object rpProcTrabLbl14: TppLabel
        UserName = 'rpProcTrabLbl14'
        AutoSize = False
        Caption = 'Máximo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 195263
        mmTop = 20373
        mmWidth = 16404
        BandType = 0
      end
      object rpProcTrabLbl16: TppLabel
        UserName = 'rpProcTrabLbl16'
        AutoSize = False
        Caption = 'Provável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 212196
        mmTop = 20373
        mmWidth = 16404
        BandType = 0
      end
      object rpProcTrabLbl15: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Risco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 212196
        mmTop = 15875
        mmWidth = 16404
        BandType = 0
      end
      object rpProcTrabLbl3: TppLabel
        UserName = 'rpProcTrabLbl3'
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
      object rpProcTrabLbl2: TppLabel
        UserName = 'rpProcTrabLbl2'
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
      object rpProcTrabSysVar1: TppSystemVariable
        UserName = 'rpProcTrabSysVar1'
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
      object rpProcTrabSysVar2: TppSystemVariable
        UserName = 'rpProcTrabSysVar2'
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
      object rpProcTrabLbl17: TppLabel
        UserName = 'rpProcTrabLbl17'
        AutoSize = False
        Caption = 'Valor Real'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 229130
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object rpProcTrabLbl19: TppLabel
        UserName = 'rpProcTrabLbl19'
        AutoSize = False
        Caption = 's/Máximo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 246857
        mmTop = 20373
        mmWidth = 16404
        BandType = 0
      end
      object rpProcTrabLbl18: TppLabel
        UserName = 'rpProcTrabLbl18'
        AutoSize = False
        Caption = 'Economia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 246857
        mmTop = 15875
        mmWidth = 16404
        BandType = 0
      end
      object rpProcTrabLbl20: TppLabel
        UserName = 'Label102'
        AutoSize = False
        Caption = 'Economia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 263790
        mmTop = 15875
        mmWidth = 16404
        BandType = 0
      end
      object rpProcTrabLbl21: TppLabel
        UserName = 'rpProcTrabLbl21'
        AutoSize = False
        Caption = 's/Provável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 263790
        mmTop = 20373
        mmWidth = 16404
        BandType = 0
      end
    end
    object rpProcTrabDtlBnd: TppDetailBand
      Visible = False
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpProcTrabFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
    end
    object rpProcTrabSmryBnd: TppSummaryBand
      AfterPrint = rpProcTrabSmryBndAfterPrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object rpProcTrabSubRep4: TppSubReport
        UserName = 'rpProcTrabSubRep4'
        ExpandAll = False
        KeepTogether = True
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
        object rpProcTrabChildRep4: TppChildReport
          AutoStop = False
          DataPipeline = ppProcTrab4
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
          object rpProcTrabSubRep4TitBnd: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 26458
            mmPrintPosition = 0
            object rpProcTrabSubRep4Shape1: TppShape
              UserName = 'rpProcTrabSubRep4Shape1'
              mmHeight = 10319
              mmLeft = 6350
              mmTop = 16140
              mmWidth = 185473
              BandType = 1
            end
            object rpProcTrabSubRep4Lbl1: TppLabel
              UserName = 'rpProcTrabSubRep4Lbl1'
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
            object rpProcTrabSubRep4DBTxt1: TppDBText
              UserName = 'rpProcTrabSubRep4DBTxt1'
              AutoSize = True
              DataField = 'EMPRESA'
              DataPipeline = ppProcTrab4
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
              mmWidth = 17463
              BandType = 1
            end
            object rpProcTrabSubRep4Lbl2: TppLabel
              UserName = 'rpProcTrabSubRep4Lbl2'
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
            object rpProcTrabSubRep4Lbl3: TppLabel
              UserName = 'rpProcTrabSubRep4Lbl3'
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
            object rpProcTrabSubRep4SysVar1: TppSystemVariable
              UserName = 'rpProcTrabSubRep4SysVar1'
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
            object rpProcTrabSubRep4SysVar2: TppSystemVariable
              UserName = 'rpProcTrabSubRep4SysVar2'
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
            object rpProcTrabSubRep4Lbl6: TppLabel
              UserName = 'rpProcTrabSubRep4Lbl6'
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
            object rpProcTrabSubRep4Lbl4: TppLabel
              UserName = 'rpProcTrabSubRep4Lbl4'
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
            object rpProcTrabSubRep4Lbl5: TppLabel
              UserName = 'rpProcTrabSubRep4Lbl5'
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
            object rpProcTrabSubRep4Lbl7: TppLabel
              UserName = 'rpProcTrabSubRep4Lbl7'
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
            object rpProcTrabSubRep4Lbl8: TppLabel
              UserName = 'Label3'
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
            object rpProcTrabSubRep4Lbl9: TppLabel
              UserName = 'rpProcTrabSubRep4Lbl9'
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
            object rpProcTrabSubRep4Lbl10: TppLabel
              UserName = 'rpProcTrabLbl101'
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
            object rpProcTrabSubRep4Lbl11: TppLabel
              UserName = 'Label4'
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
            object rpProcTrabSubRep4Line1: TppLine
              UserName = 'rpProcTrabSubRep4Line1'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 10319
              mmLeft = 38100
              mmTop = 16140
              mmWidth = 1323
              BandType = 1
            end
            object rpProcTrabSubRep4Line4: TppLine
              UserName = 'rpProcTrabSubRep4Line4'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 10319
              mmLeft = 135732
              mmTop = 16140
              mmWidth = 1323
              BandType = 1
            end
            object rpProcTrabSubRep4Line2: TppLine
              UserName = 'rpProcTrabSubRep4Line2'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 10319
              mmLeft = 70644
              mmTop = 16140
              mmWidth = 1323
              BandType = 1
            end
            object rpProcTrabSubRep4Line3: TppLine
              UserName = 'rpProcTrabSubRep4Line3'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 10319
              mmLeft = 103188
              mmTop = 16140
              mmWidth = 1323
              BandType = 1
            end
          end
          object rpProcTrabSubRep4DtlBnd: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 8996
            mmPrintPosition = 0
            object rpProcTrabSubRep4ShapeShape2: TppShape
              UserName = 'rpProcTrabSubRep4ShapeShape2'
              mmHeight = 8996
              mmLeft = 6350
              mmTop = 0
              mmWidth = 185473
              BandType = 4
            end
            object rpProcTrabSubRep4DBTxt2: TppDBText
              UserName = 'rpProcTrabSubRep2DBTxt2'
              DataField = 'ESTADO'
              DataPipeline = ppProcTrab4
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
            object rpProcTrabSubRep4DBTxt4: TppDBText
              UserName = 'DBText201'
              DataField = 'VALRECLAMADO'
              DataPipeline = ppProcTrab4
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
            object rpProcTrabSubRep4DBTxt3: TppDBText
              UserName = 'rpProcTrabSubRep3DBTxt2'
              DataField = 'QTDPROC'
              DataPipeline = ppProcTrab4
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
            object rpProcTrabSubRep4DBTxt5: TppDBText
              UserName = 'rpProcTrabSubRep4DBTxt5'
              DataField = 'VALESTIMADO'
              DataPipeline = ppProcTrab4
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
            object rpProcTrabSubRep4DBTxt6: TppDBText
              UserName = 'rpProcTrabSubRep4DBTxt6'
              DataField = 'VALREAL'
              DataPipeline = ppProcTrab4
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
            object rpProcTrabSubRep4Line5: TppLine
              UserName = 'rpProcTrabSubRep4Line5'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 38100
              mmTop = 5292
              mmWidth = 1323
              BandType = 4
            end
            object rpProcTrabSubRep4Line6: TppLine
              UserName = 'rpProcTrabSubRep4Line6'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 70644
              mmTop = 5292
              mmWidth = 1323
              BandType = 4
            end
            object rpProcTrabSubRep4Line7: TppLine
              UserName = 'rpProcTrabSubRep4Line7'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 103188
              mmTop = 5292
              mmWidth = 1323
              BandType = 4
            end
            object rpProcTrabSubRep4Line8: TppLine
              UserName = 'rpProcTrabSubRep4Line8'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 135732
              mmTop = 5292
              mmWidth = 1323
              BandType = 4
            end
            object rpProcTrabSubRep4DBTxt7: TppDBText
              UserName = 'rpProcTrabSubRep4DBTxt7'
              DataField = 'ECONRECLAMADO'
              DataPipeline = ppProcTrab4
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
            object rpProcTrabSubRep4DBTxt8: TppDBText
              UserName = 'rpProcTrabSubRep4DBTxt8'
              DataField = 'ECONESTIMADO'
              DataPipeline = ppProcTrab4
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
          object rpProcTrabSubRep4Grp1: TppGroup
            BreakName = 'EMPRESA'
            DataPipeline = ppProcTrab4
            KeepTogether = True
            UserName = 'rpProcTrabSubRep4Grp1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            object rpProcTrabSubRep4GrpHdrBnd: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object rpProcTrabSubRep4GrpFootBnd: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 9525
              mmPrintPosition = 0
              object rpProcTrabSubRep4Shape3: TppShape
                UserName = 'rpProcTrabSubRep4Shape3'
                mmHeight = 9525
                mmLeft = 6350
                mmTop = 0
                mmWidth = 185473
                BandType = 5
                GroupNo = 0
              end
              object rpProcTrabSubRep4Lbl12: TppLabel
                UserName = 'Label5'
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
              object rpProcTrabSubRep4DBCalc1: TppDBCalc
                UserName = 'rpProcTrabSubRep4DBCalc1'
                DataField = 'QTDPROC'
                DataPipeline = ppProcTrab4
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcTrabSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 19579
                mmTop = 5556
                mmWidth = 14288
                BandType = 5
                GroupNo = 0
              end
              object rpProcTrabSubRep4DBCalc2: TppDBCalc
                UserName = 'rpProcTrabSubRep4DBCalc2'
                DataField = 'VALRECLAMADO'
                DataPipeline = ppProcTrab4
                DisplayFormat = '#,###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcTrabSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 42863
                mmTop = 5556
                mmWidth = 23548
                BandType = 5
                GroupNo = 0
              end
              object rpProcTrabSubRep4DBCalc3: TppDBCalc
                UserName = 'rpProcTrabSubRep4DBCalc3'
                DataField = 'VALESTIMADO'
                DataPipeline = ppProcTrab4
                DisplayFormat = '#,###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcTrabSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 75142
                mmTop = 5556
                mmWidth = 23548
                BandType = 5
                GroupNo = 0
              end
              object rpProcTrabSubRep4DBCalc4: TppDBCalc
                UserName = 'rpProcTrabSubRep4DBCalc4'
                DataField = 'VALREAL'
                DataPipeline = ppProcTrab4
                DisplayFormat = '#,###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcTrabSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 107950
                mmTop = 5556
                mmWidth = 23548
                BandType = 5
                GroupNo = 0
              end
              object rpProcTrabSubRep4DBCalc5: TppDBCalc
                UserName = 'rpProcTrabSubRep4DBCalc5'
                DataField = 'ECONRECLAMADO'
                DataPipeline = ppProcTrab4
                DisplayFormat = '#,###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcTrabSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 138907
                mmTop = 5556
                mmWidth = 23813
                BandType = 5
                GroupNo = 0
              end
              object rpProcTrabSubRep4DBCalc6: TppDBCalc
                UserName = 'rpProcTrabSubRep4DBCalc6'
                DataField = 'ECONESTIMADO'
                DataPipeline = ppProcTrab4
                DisplayFormat = '#,###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcTrabSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 165100
                mmTop = 5556
                mmWidth = 23813
                BandType = 5
                GroupNo = 0
              end
              object rpProcTrabSubRep4Line9: TppLine
                UserName = 'rpProcTrabSubRep4Line9'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 9525
                mmLeft = 38100
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object rpProcTrabSubRep4Line10: TppLine
                UserName = 'rpProcTrabSubRep4Line10'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 9525
                mmLeft = 70644
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object rpProcTrabSubRep4Line11: TppLine
                UserName = 'rpProcTrabSubRep4Line11'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 9525
                mmLeft = 103188
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object rpProcTrabSubRep4Line12: TppLine
                UserName = 'rpProcTrabSubRep4Line12'
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
    object rpProcTrabGrp0: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppProcTrab
      NewPage = True
      ResetPageNo = True
      UserName = 'rpProcTrabGrp0'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpProcTrabGrpHdrBnd0: TppGroupHeaderBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpProcTrabGrpFootBnd0: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object rpProcTrabLbl22: TppLabel
          UserName = 'Label3'
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
        object rpProcTrabDBCalc1: TppDBCalc
          UserName = 'rpProcTrabDBCalc1'
          DataField = 'NUMPROC'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpProcTrabGrp0
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3175
          mmLeft = 48154
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpProcTrabLbl23: TppLabel
          UserName = 'Label4'
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
          mmLeft = 175155
          mmTop = 1852
          mmWidth = 19579
          BandType = 5
          GroupNo = 0
        end
        object rpProcTrabDBCalc2: TppDBCalc
          UserName = 'rpProcTrabDBCalc2'
          BlankWhenZero = True
          DataField = 'RISCOMAXIMO'
          DataPipeline = ppProcTrab
          DisplayFormat = '#,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rpProcTrabGrp0
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 195263
          mmTop = 2381
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
        object rpProcTrabDBCalc3: TppDBCalc
          UserName = 'rpProcTrabDBCalc3'
          BlankWhenZero = True
          DataField = 'RISCOPROVAVEL'
          DataPipeline = ppProcTrab
          DisplayFormat = '#,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rpProcTrabGrp0
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 212196
          mmTop = 2381
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
        object rpProcTrabDBCalc4: TppDBCalc
          UserName = 'rpProcTrabDBCalc4'
          BlankWhenZero = True
          DataField = 'VALORREAL'
          DataPipeline = ppProcTrab
          DisplayFormat = '#,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rpProcTrabGrp0
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 229130
          mmTop = 2381
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpProcTrabDBCalc5: TppDBCalc
          UserName = 'rpProcTrabDBCalc5'
          BlankWhenZero = True
          DataField = 'ECONOMIA1'
          DataPipeline = ppProcTrab
          DisplayFormat = '#,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rpProcTrabGrp0
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 246857
          mmTop = 2381
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
        object rpProcTrabDBCalc6: TppDBCalc
          UserName = 'rpProcTrabDBCalc6'
          BlankWhenZero = True
          DataField = 'ECONOMIA2'
          DataPipeline = ppProcTrab
          DisplayFormat = '#,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rpProcTrabGrp0
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
    object rpProcTrabGrp1: TppGroup
      BreakName = 'NUMPROCTRAB'
      DataPipeline = ppProcTrab
      KeepTogether = True
      UserName = 'rpProcTrabGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpProcTrabGrpHdrBnd1: TppGroupHeaderBand
        BeforePrint = rpProcTrabGrpHdrBnd1BeforePrint
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object rpProcTrabShape1: TppShape
          UserName = 'rpProcTrabShape1'
          Brush.Color = clSilver
          Pen.Color = clSilver
          mmHeight = 4498
          mmLeft = 3969
          mmTop = 0
          mmWidth = 277548
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt2: TppDBText
          UserName = 'rpProcTrabDBTxt2'
          DataField = 'NUMPROCTRAB'
          DataPipeline = ppProcTrab
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
          mmWidth = 32808
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt3: TppDBText
          UserName = 'rpProcTrabDBTxt3'
          DataField = 'UF'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 38365
          mmTop = 794
          mmWidth = 5292
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt4: TppDBText
          UserName = 'rpProcTrabDBTxt4'
          DataField = 'CONTRAPARTE'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 44186
          mmTop = 794
          mmWidth = 45773
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt5: TppDBText
          UserName = 'rpProcTrabDBTxt5'
          DataField = 'NOMEVARA'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 90488
          mmTop = 794
          mmWidth = 15610
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt6: TppDBText
          UserName = 'rpProcTrabDBTxt6'
          DataField = 'DATADEMISSAO'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 106627
          mmTop = 794
          mmWidth = 15610
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt7: TppDBText
          UserName = 'rpProcTrabDBTxt7'
          DataField = 'PATROCINADORA'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 122767
          mmTop = 794
          mmWidth = 39158
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt8: TppDBText
          UserName = 'rpProcTrabDBTxt8'
          DataField = 'NUMVARAJUSTICA'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 138642
          mmTop = 794
          mmWidth = 32808
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt9: TppDBText
          UserName = 'rpProcTrabDBTxt9'
          DataField = 'DATANOTIF'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 171980
          mmTop = 794
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt10: TppDBText
          UserName = 'rpProcTrabDBTxt10'
          DataField = 'SITUACAO'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 188384
          mmTop = 794
          mmWidth = 6350
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt11: TppDBText
          UserName = 'rpProcTrabDBTxt11'
          BlankWhenZero = True
          DataField = 'RISCOMAXIMO'
          DataPipeline = ppProcTrab
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 195263
          mmTop = 794
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxtCARGO: TppDBText
          UserName = 'rpProcTrabDBTxtCARGO'
          DataField = 'CARGO'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 26988
          mmTop = 5556
          mmWidth = 58473
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt12: TppDBText
          UserName = 'rpProcTrabDBTxt12'
          BlankWhenZero = True
          DataField = 'RISCOPROVAVEL'
          DataPipeline = ppProcTrab
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 212196
          mmTop = 794
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt13: TppDBText
          UserName = 'rpProcTrabDBTxt13'
          BlankWhenZero = True
          DataField = 'VALORREAL'
          DataPipeline = ppProcTrab
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 229130
          mmTop = 794
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt14: TppDBText
          UserName = 'rpProcTrabDBTxt14'
          BlankWhenZero = True
          DataField = 'ECONOMIA1'
          DataPipeline = ppProcTrab
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 246857
          mmTop = 794
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt15: TppDBText
          UserName = 'rpProcTrabDBTxt15'
          BlankWhenZero = True
          DataField = 'ECONOMIA2'
          DataPipeline = ppProcTrab
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
      object rpProcTrabGrpFootBnd1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object rpProcTrabSubRep1: TppSubReport
          UserName = 'rpProcTrabSubRep1'
          ExpandAll = False
          KeepTogether = True
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
          object rpProcTrabChildRep1: TppChildReport
            AutoStop = False
            DataPipeline = ppProcTrab1
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
            Left = 232
            Top = 136
            Version = '5.5'
            mmColumnWidth = 0
            object rpProcTrabSubRep1TitBnd: TppTitleBand
              BeforePrint = rpProcTrabSubRep1TitBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object rpProcTrabSubRep1Lbl1: TppLabel
                UserName = 'rpProcTrabSubRep1Lbl1'
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
              object rpProcTrabSubRep1Lbl2: TppLabel
                UserName = 'rpProcTrabSubRep1Lbl2'
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
            object rpProcTrabSubRep1DtlBnd: TppDetailBand
              BeforePrint = rpProcTrabSubRep1TitBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object rpProcTrabSubRep1DBTxt1: TppDBText
                UserName = 'rpProcTrabSubRep1DBTxt1'
                DataField = 'LITISCONSORTE'
                DataPipeline = ppProcTrab1
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
              object rpProcTrabSubRep1DBTxt2: TppDBText
                UserName = 'rpProcTrabSubRep1DBTxt2'
                DataField = 'SITUACAO'
                DataPipeline = ppProcTrab1
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
            object ppSummaryBand1: TppSummaryBand
              BeforePrint = rpProcTrabSubRep1TitBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 2646
              mmPrintPosition = 0
            end
          end
        end
        object rpProcTrabSubRep2: TppSubReport
          UserName = 'rpProcTrabSubRep2'
          ExpandAll = False
          KeepTogether = True
          NewPrintJob = False
          ShiftRelativeTo = rpProcTrabSubRep1
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
          object rpProcTrabChildRep2: TppChildReport
            AutoStop = False
            DataPipeline = ppProcTrab2
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
            Left = 232
            Top = 136
            Version = '5.5'
            mmColumnWidth = 0
            object rpProcTrabSubRep2TitBnd: TppTitleBand
              BeforePrint = rpProcTrabSubRep2TitBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object rpProcTrabSubRep2Lbl1: TppLabel
                UserName = 'rpProcTrabSubRep2Lbl1'
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
              object rpProcTrabSubRep2Lbl2: TppLabel
                UserName = 'rpProcTrabSubRep2Lbl2'
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
              object rpProcTrabSubRep2Lbl3: TppLabel
                UserName = 'rpProcTrabSubRep2Lbl3'
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
            object rpProcTrabSubRep2DtlBnd: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 20108
              mmPrintPosition = 0
              object rpProcTrabSubRep2DBTxt1: TppDBText
                UserName = 'rpProcTrabSubRep2DBTxt1'
                DataField = 'ETAPA'
                DataPipeline = ppProcTrab2
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
              object rpProcTrabSubRep2DBTxt2: TppDBText
                UserName = 'rpProcTrabSubRep2DBTxt2'
                DataField = 'DATAREALOCOR'
                DataPipeline = ppProcTrab2
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
              object rpProcTrabSubRep2DBTxt3: TppDBText
                UserName = 'DBText201'
                DataField = 'ASSUNTO'
                DataPipeline = ppProcTrab2
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
              object rpProcTrabSubRep2DBMemo1: TppDBMemo
                UserName = 'rpProcTrabSubRep2DBMemo1'
                CharWrap = False
                DataField = 'OBSERVETAPA'
                DataPipeline = ppProcTrab2
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
            object rpProcTrabSubRep2SmryBnd: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 2646
              mmPrintPosition = 0
            end
          end
        end
        object rpProcTrabSubRep3: TppSubReport
          UserName = 'rpProcTrabSubRep3'
          ExpandAll = False
          KeepTogether = True
          NewPrintJob = False
          ShiftRelativeTo = rpProcTrabSubRep2
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
          object rpProcTrabChildRep3: TppChildReport
            AutoStop = False
            DataPipeline = ppProcTrab3
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
            Left = 232
            Top = 136
            Version = '5.5'
            mmColumnWidth = 0
            object rpProcTrabSubRep3TitBnd: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object rpProcTrabSubRep3Lbl1: TppLabel
                UserName = 'rpProcTrabSubRep2Lbl1'
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
              object rpProcTrabSubRep3Lbl2: TppLabel
                UserName = 'rpProcTrabSubRep2Lbl2'
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
            object rpProcTrabSubRep3DtlBnd: TppDetailBand
              BeforePrint = rpProcTrabSubRep3DtlBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object rpProcTrabSubRep3DBTxt1: TppDBText
                UserName = 'rpProcTrabSubRep2DBTxt2'
                DataField = 'OBJETO'
                DataPipeline = ppProcTrab3
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
              object rpProcTrabSubRep3DBTxt3: TppDBText
                UserName = 'DBText201'
                DataField = 'DATAFINAL'
                DataPipeline = ppProcTrab3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                mmHeight = 2910
                mmLeft = 148432
                mmTop = 529
                mmWidth = 14288
                BandType = 4
              end
              object rpProcTrabSubRep3DBTxt2: TppDBText
                UserName = 'rpProcTrabSubRep3DBTxt2'
                DataField = 'DATAINICIO'
                DataPipeline = ppProcTrab3
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
              object rpProcTrabSubRep3LblRiscoMax: TppLabel
                UserName = 'rpProcTrabSubRep3LblRiscoMax'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 195263
                mmTop = 529
                mmWidth = 16404
                BandType = 4
              end
              object rpProcTrabSubRep3LblRiscoProv: TppLabel
                UserName = 'rpProcTrabSubRep3LblRiscoProv'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 212196
                mmTop = 529
                mmWidth = 16404
                BandType = 4
              end
              object rpProcTrabSubRep3LblValorReal: TppLabel
                UserName = 'rpProcTrabSubRep3LblValorReal'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 229130
                mmTop = 529
                mmWidth = 17198
                BandType = 4
              end
              object rpProcTrabSubRep3LblEconomia1: TppLabel
                UserName = 'rpProcTrabSubRep3LblEconomia1'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 246857
                mmTop = 529
                mmWidth = 16404
                BandType = 4
              end
              object rpProcTrabSubRep3LblEconomia2: TppLabel
                UserName = 'rpProcTrabSubRep3LblEconomia2'
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
                mmTop = 529
                mmWidth = 16404
                BandType = 4
              end
            end
            object rpProcTrabSubRep3SmryBnd: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 2626
              mmPrintPosition = 0
            end
          end
        end
      end
    end
  end
  object ppProcTrab: TppBDEPipeline
    DataSource = dsProcTrab
    UserName = 'ppProcTrab'
    Left = 101
    Top = 68
  end
  object dsProcTrab: TwwDataSource
    DataSet = qryProcTrab
    Left = 101
    Top = 55
  end
  object qryProcTrab: TwwQuery
    CachedUpdates = True
    AfterScroll = qryProcTrabAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA,'
      '  0 AS NUMPROCTRAB,'
      '  0 AS NUMPROC,'
      '  '#39'1234567890123456789012345'#39' AS PROCJCJNUM,'
      '  '#39'123456789012345678901234567890'#39' AS UF,'
      '  '#39'123456789012345678901234567890'#39' AS CONTRAPARTE,'
      '  '#39'123456789012345678901234567890'#39' AS NOMEVARA,'
      '  '#39'1234567890'#39' AS DATAADMISSAO,'
      '  '#39'1234567890'#39' AS DATADEMISSAO,'
      
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
      '  '#39'1234567890123456789012345678901234567890'#39' AS CARGO,'
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
    UpdateObject = updProcTrab
    ValidateWithMask = True
    Left = 101
    Top = 41
  end
  object ppProcTrab1: TppBDEPipeline
    DataSource = dsProcTrab1
    CloseDataSource = True
    UserName = 'ppProcTrab1'
    Left = 178
    Top = 68
    object ppProcTrab1ppField1: TppField
      FieldAlias = 'LITISCONSORTE'
      FieldName = 'LITISCONSORTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppProcTrab1ppField2: TppField
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
  object dsProcTrab1: TwwDataSource
    DataSet = qryProcTrab1
    Left = 178
    Top = 54
  end
  object qryProcTrab1: TwwQuery
    AfterOpen = qryProcTrab1AfterOpen
    DatabaseName = 'BaseDados'
    DataSource = dsProcTrab
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
  object updProcTrab: TUpdateSQL
    Left = 101
    Top = 28
  end
  object ppProcTrab2: TppBDEPipeline
    DataSource = dsProcTrab2
    CloseDataSource = True
    UserName = 'ppProcTrab2'
    Left = 248
    Top = 67
  end
  object dsProcTrab2: TwwDataSource
    DataSet = qryProcTrab2
    Left = 248
    Top = 53
  end
  object qryProcTrab2: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsProcTrab
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
  object ppProcTrab3: TppBDEPipeline
    DataSource = dsProcTrab3
    CloseDataSource = True
    UserName = 'ppProcTrab3'
    Left = 318
    Top = 67
  end
  object dsProcTrab3: TwwDataSource
    DataSet = qryProcTrab3
    Left = 318
    Top = 53
  end
  object qryProcTrab3: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsProcTrab
    SQL.Strings = (
      'SELECT'
      '  O.NUMPROCTRAB, O.CODTIPOOBJETO, O.VALORRECL,'
      '  O.PERCPROB, O.PERCORIG, O.VALORSENTENCA, O.INDVALOR,'
      '  O.DATAINICIO, O.DATAFINAL, T.DESCRICAO AS OBJETO'
      'FROM'
      '  OBJPROCTRAB O, TIPOOBJPROCTRAB T'
      'WHERE'
      '  (O.NUMPROCTRAB   = :NUMPROCTRAB) AND'
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
        Name = 'NUMPROCTRAB'
        ParamType = ptUnknown
      end>
  end
  object ppProcTrab4: TppBDEPipeline
    DataSource = dsProcTrab4
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'ppProcTrab4'
    Left = 390
    Top = 67
    object ppProcTrab4ppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppProcTrab4ppField2: TppField
      FieldAlias = 'IDESTADO'
      FieldName = 'IDESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppProcTrab4ppField3: TppField
      FieldAlias = 'ESTADO'
      FieldName = 'ESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppProcTrab4ppField4: TppField
      FieldAlias = 'QTDPROC'
      FieldName = 'QTDPROC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppProcTrab4ppField5: TppField
      FieldAlias = 'VALRECLAMADO'
      FieldName = 'VALRECLAMADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppProcTrab4ppField6: TppField
      FieldAlias = 'VALESTIMADO'
      FieldName = 'VALESTIMADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppProcTrab4ppField7: TppField
      FieldAlias = 'VALREAL'
      FieldName = 'VALREAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppProcTrab4ppField8: TppField
      FieldAlias = 'ECONRECLAMADO'
      FieldName = 'ECONRECLAMADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppProcTrab4ppField9: TppField
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
  object dsProcTrab4: TwwDataSource
    DataSet = qryProcTrab4
    Left = 390
    Top = 53
  end
  object qryProcTrab4: TwwQuery
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
    UpdateObject = updProcTrab4
    ValidateWithMask = True
    Left = 390
    Top = 40
  end
  object updProcTrab4: TUpdateSQL
    Left = 390
    Top = 27
  end
  object qryProcTrab1Aux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'Indefinido'#39' AS LITISCONSORTE,'
      '  '#39'Indefinida'#39' AS SITUACAO'
      'FROM'
      '  DUAL')
    ValidateWithMask = True
    Left = 178
    Top = 28
  end
end
