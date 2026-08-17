inherited dtmRelatoriosModCon: TdtmRelatoriosModCon
  Left = 134
  Top = 197
  Width = 554
  Height = 297
  Caption = 'dtmRelatoriosModCon'
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
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
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
    BeforePrint = rpProcTrabBeforePrint
    CachePages = True
    DeviceType = 'Screen'
    Left = 98
    Top = 81
    Version = '5.5'
    mmColumnWidth = 197300
    object rpProcTrabHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object rpProcTrabLbl9: TppLabel
        UserName = 'rpProcTrabLbl9'
        AutoSize = False
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 131234
        mmTop = 20373
        mmWidth = 44450
        BandType = 0
      end
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
        mmLeft = 98954
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
        mmLeft = 2646
        mmTop = 8202
        mmWidth = 279665
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
        mmLeft = 2646
        mmTop = 2646
        mmWidth = 279665
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
        mmLeft = 3704
        mmTop = 20373
        mmWidth = 34131
        BandType = 0
      end
      object rpProcTrabLbl5: TppLabel
        UserName = 'rpProcTrabLbl5'
        AutoSize = False
        Caption = 'Vara'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 39158
        mmTop = 20373
        mmWidth = 13758
        BandType = 0
      end
      object rpProcTrabLbl6: TppLabel
        UserName = 'rpProcTrabLbl6'
        AutoSize = False
        Caption = 'Reclamante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 53711
        mmTop = 20373
        mmWidth = 44715
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
        mmLeft = 115094
        mmTop = 20373
        mmWidth = 15610
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
        mmLeft = 176213
        mmTop = 20373
        mmWidth = 16404
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
        mmLeft = 193146
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
        mmLeft = 200025
        mmTop = 15875
        mmWidth = 15875
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
        mmLeft = 200025
        mmTop = 20373
        mmWidth = 15875
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
        mmLeft = 216430
        mmTop = 20373
        mmWidth = 15875
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
        mmLeft = 216430
        mmTop = 15875
        mmWidth = 15875
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
        mmLeft = 232834
        mmTop = 20373
        mmWidth = 15875
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
        mmLeft = 249238
        mmTop = 20373
        mmWidth = 15875
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
        mmLeft = 249238
        mmTop = 15875
        mmWidth = 15875
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
        mmLeft = 265642
        mmTop = 15875
        mmWidth = 15875
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
        mmLeft = 265642
        mmTop = 20373
        mmWidth = 15875
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
      mmHeight = 5821
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
          PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
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
              Caption = 'Resumo por Unidade'
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
              Caption = 'Risco Máximo'
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
              Caption = 'Unidade'
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
              Caption = 'Risco Provável'
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
              DataField = 'UNIDADE'
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
        BeforePrint = rpProcTrabGrpFootBnd0BeforePrint
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 10583
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
          mmLeft = 179917
          mmTop = 1852
          mmWidth = 19579
          BandType = 5
          GroupNo = 0
        end
        object rpProcTrabDBCalc2: TppDBCalc
          UserName = 'rpProcTrabDBCalc2'
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
          mmLeft = 200025
          mmTop = 2381
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object rpProcTrabDBCalc3: TppDBCalc
          UserName = 'rpProcTrabDBCalc3'
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
          mmLeft = 216430
          mmTop = 2381
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object rpProcTrabDBCalc4: TppDBCalc
          UserName = 'rpProcTrabDBCalc4'
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
          mmLeft = 232834
          mmTop = 2381
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object rpProcTrabDBCalc5: TppDBCalc
          UserName = 'rpProcTrabDBCalc5'
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
          mmLeft = 249238
          mmTop = 2381
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object rpProcTrabDBCalc6: TppDBCalc
          UserName = 'rpProcTrabDBCalc6'
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
          mmLeft = 265642
          mmTop = 2381
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object rpProcTrabSubRepRateio: TppSubReport
          UserName = 'rpProcTrabSubRepRateio'
          ExpandAll = False
          KeepTogether = True
          NewPrintJob = False
          TraverseAllData = False
          mmHeight = 3704
          mmLeft = 0
          mmTop = 6879
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpProcTrabChildRepRateio: TppChildReport
            AutoStop = False
            DataPipeline = ppProcTrab5
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Relação de Processos'
            PrinterSetup.Orientation = poLandscape
            PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
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
            object rpProcTrabSubRepRateioTitBnd1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object rpProcTrabSubRepRateioLbl1: TppLabel
                UserName = 'Label1'
                AutoSize = False
                Caption = 'Rateio de Custos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 26458
                mmTop = 529
                mmWidth = 27781
                BandType = 1
              end
            end
            object rpProcTrabSubRepRateioDtlBnd1: TppDetailBand
              BeforePrint = rpProcTrabSubRepRateioDtlBnd1BeforePrint
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object rpProcTrabSubRepRateioDBTxt1: TppDBText
                UserName = 'rpProcTrabSubRepRateioDBTxt1'
                DataField = 'EMPRESA'
                DataPipeline = ppProcTrab5
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 26988
                mmTop = 265
                mmWidth = 73819
                BandType = 4
              end
              object rpProcTrabSubRepRateioDBTxt2: TppDBText
                UserName = 'rpProcTrabSubRepRateioDBTxt2'
                DataField = 'RISCOMAXIMO'
                DataPipeline = ppProcTrab5
                DisplayFormat = '###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 200025
                mmTop = 265
                mmWidth = 15875
                BandType = 4
              end
              object rpProcTrabSubRepRateioDBTxt3: TppDBText
                UserName = 'rpProcTrabSubRepRateioDBTxt3'
                DataField = 'RISCOPROVAVEL'
                DataPipeline = ppProcTrab5
                DisplayFormat = '###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 216430
                mmTop = 265
                mmWidth = 15875
                BandType = 4
              end
              object rpProcTrabSubRepRateioDBTxt4: TppDBText
                UserName = 'rpProcTrabSubRepRateioDBTxt4'
                DataField = 'VALORREAL'
                DataPipeline = ppProcTrab5
                DisplayFormat = '###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 232834
                mmTop = 265
                mmWidth = 15875
                BandType = 4
              end
            end
          end
        end
      end
    end
    object rpProcTrabGrp1: TppGroup
      BreakName = 'NUMPROCTRAB'
      DataPipeline = ppProcTrab
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
          mmLeft = 2646
          mmTop = 0
          mmWidth = 279665
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt2: TppDBText
          UserName = 'rpProcTrabDBTxt2'
          DataField = 'PROCJCJNUM'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 3440
          mmTop = 529
          mmWidth = 34131
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt3: TppDBText
          UserName = 'rpProcTrabDBTxt3'
          DataField = 'JCJ'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 38894
          mmTop = 529
          mmWidth = 13758
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt4: TppDBText
          UserName = 'rpProcTrabDBTxt4'
          DataField = 'RECLAMANTE'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 53446
          mmTop = 529
          mmWidth = 44715
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt5: TppDBText
          UserName = 'rpProcTrabDBTxt5'
          DataField = 'DATAADMISSAO'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 98690
          mmTop = 529
          mmWidth = 15610
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt6: TppDBText
          UserName = 'rpProcTrabDBTxt6'
          DataField = 'DATADESLIGAMENTO'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 114829
          mmTop = 529
          mmWidth = 15610
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt7: TppDBText
          UserName = 'rpProcTrabDBTxt7'
          DataField = 'UNIDADE'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 131234
          mmTop = 529
          mmWidth = 44450
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
          mmLeft = 176213
          mmTop = 529
          mmWidth = 16404
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
          mmLeft = 193146
          mmTop = 529
          mmWidth = 6350
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt11: TppDBText
          UserName = 'rpProcTrabDBTxt11'
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
          mmLeft = 200025
          mmTop = 529
          mmWidth = 15875
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
          mmLeft = 26723
          mmTop = 5292
          mmWidth = 58473
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt12: TppDBText
          UserName = 'rpProcTrabDBTxt12'
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
          mmLeft = 216430
          mmTop = 529
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt13: TppDBText
          UserName = 'rpProcTrabDBTxt13'
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
          mmLeft = 232834
          mmTop = 529
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt14: TppDBText
          UserName = 'rpProcTrabDBTxt14'
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
          mmLeft = 249238
          mmTop = 529
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt15: TppDBText
          UserName = 'rpProcTrabDBTxt15'
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
          mmLeft = 265642
          mmTop = 529
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
      end
      object rpProcTrabGrpFootBnd2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpProcTrabGrp2: TppGroup
      BreakName = 'NUMPROCTRAB'
      DataPipeline = ppProcTrab
      KeepTogether = True
      UserName = 'rpProcTrabGrp2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpProcTrabGrpHdrBnd2: TppGroupHeaderBand
        BeforePrint = rpProcTrabGrpHdrBnd2BeforePrint
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object rpProcTrabLbl24: TppLabel
          UserName = 'rpProcTrabLbl24'
          AutoSize = False
          Caption = 'Rateio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsItalic]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 81227
          mmTop = 1323
          mmWidth = 19315
          BandType = 3
          GroupNo = 2
        end
        object rpProcTrabDBTxt16: TppDBText
          UserName = 'rpProcTrabDBTxt16'
          DataField = 'EMPRESA_RATEIO'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 106098
          mmTop = 1323
          mmWidth = 78581
          BandType = 3
          GroupNo = 2
        end
        object rpProcTrabDBTxt17: TppDBText
          UserName = 'rpProcTrabDBTxt17'
          DataField = 'RISCOMAXIMO_RATEIO'
          DataPipeline = ppProcTrab
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 200025
          mmTop = 1323
          mmWidth = 15875
          BandType = 3
          GroupNo = 2
        end
        object rpProcTrabDBTxt18: TppDBText
          UserName = 'rpProcTrabDBTxt18'
          DataField = 'RISCOPROVAVEL_RATEIO'
          DataPipeline = ppProcTrab
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 216430
          mmTop = 1323
          mmWidth = 15875
          BandType = 3
          GroupNo = 2
        end
        object rpProcTrabDBTxt19: TppDBText
          UserName = 'rpProcTrabDBTxt19'
          DataField = 'VALORREAL_RATEIO'
          DataPipeline = ppProcTrab
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 232834
          mmTop = 1323
          mmWidth = 15875
          BandType = 3
          GroupNo = 2
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
          GroupNo = 2
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpProcTrabChildRep1: TppChildReport
            AutoStop = False
            DataPipeline = ppProcTrab1
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Relação de Processos'
            PrinterSetup.Orientation = poLandscape
            PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
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
                Caption = 'Nome do Litisconsorte ou Testemunha'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 26458
                mmTop = 265
                mmWidth = 52123
                BandType = 1
              end
              object rpProcTrabSubRep1Lbl2: TppLabel
                UserName = 'rpProcTrabSubRep1Lbl2'
                AutoSize = False
                Caption = 'Situação'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 177800
                mmTop = 265
                mmWidth = 40746
                BandType = 1
              end
              object ppLabel1: TppLabel
                UserName = 'Label1'
                AutoSize = False
                Caption = 'Categoria'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 129382
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
                mmLeft = 177800
                mmTop = 265
                mmWidth = 100013
                BandType = 4
              end
              object ppDBText1: TppDBText
                UserName = 'DBText1'
                DataField = 'CATEGORIA'
                DataPipeline = ppProcTrab1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                mmHeight = 2910
                mmLeft = 129382
                mmTop = 265
                mmWidth = 41804
                BandType = 4
              end
            end
            object rpProcTrabSubRep1SmryBnd1: TppSummaryBand
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
          GroupNo = 2
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpProcTrabChildRep2: TppChildReport
            AutoStop = False
            DataPipeline = ppProcTrab2
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Relação de Processos'
            PrinterSetup.Orientation = poLandscape
            PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
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
          GroupNo = 2
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpProcTrabChildRep3: TppChildReport
            AutoStop = False
            DataPipeline = ppProcTrab3
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Relação de Processos'
            PrinterSetup.Orientation = poLandscape
            PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
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
                mmLeft = 200025
                mmTop = 529
                mmWidth = 15875
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
                mmLeft = 216430
                mmTop = 529
                mmWidth = 15875
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
                mmLeft = 232834
                mmTop = 529
                mmWidth = 15875
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
                mmLeft = 249238
                mmTop = 529
                mmWidth = 15875
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
                mmLeft = 265642
                mmTop = 529
                mmWidth = 15875
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
    Left = 98
    Top = 67
    object ppProcTrabppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppProcTrabppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMPROCTRAB'
      FieldName = 'NUMPROCTRAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppProcTrabppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMPROC'
      FieldName = 'NUMPROC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppProcTrabppField4: TppField
      FieldAlias = 'PROCJCJNUM'
      FieldName = 'PROCJCJNUM'
      FieldLength = 25
      DisplayWidth = 25
      Position = 3
    end
    object ppProcTrabppField5: TppField
      FieldAlias = 'JCJ'
      FieldName = 'JCJ'
      FieldLength = 25
      DisplayWidth = 25
      Position = 4
    end
    object ppProcTrabppField6: TppField
      FieldAlias = 'RECLAMANTE'
      FieldName = 'RECLAMANTE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 5
    end
    object ppProcTrabppField7: TppField
      FieldAlias = 'DATAADMISSAO'
      FieldName = 'DATAADMISSAO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppProcTrabppField8: TppField
      FieldAlias = 'DATADESLIGAMENTO'
      FieldName = 'DATADESLIGAMENTO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
    object ppProcTrabppField9: TppField
      FieldAlias = 'UNIDADE'
      FieldName = 'UNIDADE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object ppProcTrabppField10: TppField
      FieldAlias = 'DATANOTIF'
      FieldName = 'DATANOTIF'
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
    object ppProcTrabppField11: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 10
    end
    object ppProcTrabppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'RISCOMAXIMO'
      FieldName = 'RISCOMAXIMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppProcTrabppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'RISCOPROVAVEL'
      FieldName = 'RISCOPROVAVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppProcTrabppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORREAL'
      FieldName = 'VALORREAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppProcTrabppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'ECONOMIA1'
      FieldName = 'ECONOMIA1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppProcTrabppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'ECONOMIA2'
      FieldName = 'ECONOMIA2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppProcTrabppField17: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 16
    end
    object ppProcTrabppField18: TppField
      FieldAlias = 'TIPOENCER'
      FieldName = 'TIPOENCER'
      FieldLength = 16
      DisplayWidth = 16
      Position = 17
    end
    object ppProcTrabppField19: TppField
      FieldAlias = 'MOEDAPROCTRAB'
      FieldName = 'MOEDAPROCTRAB'
      FieldLength = 20
      DisplayWidth = 20
      Position = 18
    end
    object ppProcTrabppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDREGRA'
      FieldName = 'IDREGRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppProcTrabppField21: TppField
      FieldAlias = 'DATAEFETENC'
      FieldName = 'DATAEFETENC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 20
    end
    object ppProcTrabppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'INDTAXACONV'
      FieldName = 'INDTAXACONV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppProcTrabppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGSITPROC'
      FieldName = 'FLGSITPROC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppProcTrabppField24: TppField
      FieldAlias = 'EMPRESA_RATEIO'
      FieldName = 'EMPRESA_RATEIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 23
    end
    object ppProcTrabppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'RISCOMAXIMO_RATEIO'
      FieldName = 'RISCOMAXIMO_RATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppProcTrabppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'RISCOPROVAVEL_RATEIO'
      FieldName = 'RISCOPROVAVEL_RATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppProcTrabppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORREAL_RATEIO'
      FieldName = 'VALORREAL_RATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
  end
  object dsProcTrab: TwwDataSource
    DataSet = qryProcTrab
    Left = 98
    Top = 54
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
      '  '#39'1234567890123456789012345'#39' AS JCJ,'
      '  '#39'123456789012345678901234567890'#39' AS RECLAMANTE,'
      '  '#39'1234567890'#39' AS DATAADMISSAO,'
      '  '#39'1234567890'#39' AS DATADESLIGAMENTO,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS UNIDADE,'
      '  '#39'1234567890'#39' AS DATANOTIF,'
      '  '#39'123'#39' AS SITUACAO,'
      '  0 AS RISCOMAXIMO,'
      '  0 AS RISCOPROVAVEL,'
      '  0 AS VALORREAL,'
      '  0 AS ECONOMIA1,'
      '  0 AS ECONOMIA2,'
      '  '#39'1234567890123456789012345678901234567890'#39' AS CARGO,'
      '  '#39'1234567890123456'#39' AS TIPOENCER,'
      '  '#39'12345678901234567890'#39' AS MOEDAPROCTRAB,'
      '  0 AS IDREGRA,'
      '  '#39'1234567890'#39' AS DATAEFETENC,'
      '  0 AS INDTAXACONV,'
      '  0 AS FLGSITPROC,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA_RATEIO,'
      '  0 AS RISCOMAXIMO_RATEIO,'
      '  0 AS RISCOPROVAVEL_RATEIO,'
      '  0 AS VALORREAL_RATEIO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updProcTrab
    ValidateWithMask = True
    Left = 98
    Top = 40
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
      FieldAlias = 'CATEGORIA'
      FieldName = 'CATEGORIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppProcTrab1ppField3: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
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
      '  DECODE(NVL(C.INDTESTEMUNHA,0),0,'#39'Listisconsorte'#39',1,'
      '       '#39'Testemunha C.Parte'#39','#39'Nossa Testemunha'#39') AS CATEGORIA,'
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
    SkipWhenNoRecords = False
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
      FieldAlias = 'IDESTAB'
      FieldName = 'IDESTAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppProcTrab4ppField3: TppField
      FieldAlias = 'UNIDADE'
      FieldName = 'UNIDADE'
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
      '  0 AS IDESTAB,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS UNIDADE,'
      '  0 AS QTDPROC,'
      '  0 AS VALRECLAMADO,'
      '  0 AS VALESTIMADO,'
      '  0 AS VALREAL,'
      '  0 AS ECONRECLAMADO,'
      '  0 AS ECONESTIMADO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
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
      '  '#39'Indefinida'#39' AS CATEGORIA,'
      '  '#39'Indefinida'#39' AS SITUACAO'
      'FROM'
      '  DUAL')
    ValidateWithMask = True
    Left = 178
    Top = 27
  end
  object ppProcTrab5: TppBDEPipeline
    DataSource = dsProcTrab5
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ProcTrab5'
    Left = 470
    Top = 67
    object ppProcTrab5ppField1: TppField
      FieldAlias = 'IDFILIALPESSOA'
      FieldName = 'IDFILIALPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppProcTrab5ppField2: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppProcTrab5ppField3: TppField
      FieldAlias = 'RISCOMAXIMO'
      FieldName = 'RISCOMAXIMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppProcTrab5ppField4: TppField
      FieldAlias = 'RISCOPROVAVEL'
      FieldName = 'RISCOPROVAVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppProcTrab5ppField5: TppField
      FieldAlias = 'VALORREAL'
      FieldName = 'VALORREAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppProcTrab5ppField6: TppField
      FieldAlias = 'ECONOMIA1'
      FieldName = 'ECONOMIA1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppProcTrab5ppField7: TppField
      FieldAlias = 'ECONOMIA2'
      FieldName = 'ECONOMIA2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
  end
  object dsProcTrab5: TwwDataSource
    DataSet = qryProcTrab5
    Left = 470
    Top = 53
  end
  object qryProcTrab5: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  0 AS IDFILIALPESSOA,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA,'
      '  0 AS RISCOMAXIMO,'
      '  0 AS RISCOPROVAVEL,'
      '  0 AS VALORREAL'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    UpdateObject = updProcTrab5
    ValidateWithMask = True
    Left = 470
    Top = 40
  end
  object updProcTrab5: TUpdateSQL
    Left = 470
    Top = 27
  end
  object rpAnalSintProc: TppReport
    AutoStop = False
    DataPipeline = ppAnalSintProc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Análise Sintética de Processos'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
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
    Left = 98
    Top = 209
    Version = '5.5'
    mmColumnWidth = 197300
    object rpAnalSintProcHdrBnd1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object rpAnalSintProcLbl9: TppLabel
        UserName = 'rpProcTrabLbl9'
        AutoSize = False
        Caption = 'Jun'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 144463
        mmTop = 20373
        mmWidth = 14552
        BandType = 0
      end
      object rpAnalSintProcLbl7: TppLabel
        UserName = 'rpProcTrabLbl7'
        AutoSize = False
        Caption = 'Abr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 111654
        mmTop = 20373
        mmWidth = 14552
        BandType = 0
      end
      object rpAnalSintProcLbl1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Análise Sintética de Processos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 7938
        mmWidth = 279665
        BandType = 0
      end
      object rpAnalSintProcDBTxt1: TppDBText
        UserName = 'rpProcTrabDBTxt1'
        DataField = 'EMPRESA'
        DataPipeline = ppAnalSintProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 2646
        mmWidth = 279665
        BandType = 0
      end
      object rpAnalSintProcLbl4: TppLabel
        UserName = 'rpProcTrabLbl4'
        AutoSize = False
        Caption = 'Jan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 62177
        mmTop = 20373
        mmWidth = 14552
        BandType = 0
      end
      object rpAnalSintProcLbl5: TppLabel
        UserName = 'rpProcTrabLbl5'
        AutoSize = False
        Caption = 'Fev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 78581
        mmTop = 20373
        mmWidth = 14552
        BandType = 0
      end
      object rpAnalSintProcLbl6: TppLabel
        UserName = 'rpProcTrabLbl6'
        AutoSize = False
        Caption = 'Mar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 95250
        mmTop = 20373
        mmWidth = 14552
        BandType = 0
      end
      object rpAnalSintProcLbl8: TppLabel
        UserName = 'rpProcTrabLbl8'
        AutoSize = False
        Caption = 'Mai'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 128059
        mmTop = 20373
        mmWidth = 14552
        BandType = 0
      end
      object rpAnalSintProcLbl10: TppLabel
        UserName = 'rpProcTrabLbl11'
        AutoSize = False
        Caption = 'Jul'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 160867
        mmTop = 20373
        mmWidth = 14552
        BandType = 0
      end
      object rpAnalSintProcLbl11: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Ago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 177271
        mmTop = 20373
        mmWidth = 14552
        BandType = 0
      end
      object rpAnalSintProcLbl12: TppLabel
        UserName = 'rpProcTrabLbl14'
        AutoSize = False
        Caption = 'Set'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 193675
        mmTop = 20373
        mmWidth = 14552
        BandType = 0
      end
      object rpAnalSintProcLbl13: TppLabel
        UserName = 'rpProcTrabLbl16'
        AutoSize = False
        Caption = 'Out'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 210080
        mmTop = 20373
        mmWidth = 14552
        BandType = 0
      end
      object rpAnalSintProcLbl3: TppLabel
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
      object rpAnalSintProcLbl2: TppLabel
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
      object rpAnalSintProcSysVar1: TppSystemVariable
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
      object rpAnalSintProcSysVar2: TppSystemVariable
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
      object rpAnalSintProcLbl14: TppLabel
        UserName = 'rpProcTrabLbl17'
        AutoSize = False
        Caption = 'Nov'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 226484
        mmTop = 20373
        mmWidth = 14552
        BandType = 0
      end
      object rpAnalSintProcLbl15: TppLabel
        UserName = 'rpProcTrabLbl19'
        AutoSize = False
        Caption = 'Dez'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 242888
        mmTop = 20373
        mmWidth = 14552
        BandType = 0
      end
    end
    object rpAnalSintProcDtlBnd1: TppDetailBand
      Visible = False
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpAnalSintProcFootBnd1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
    end
    object rpAnalSintProcSmryBnd1: TppSummaryBand
      AfterPrint = rpProcTrabSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 2381
      mmPrintPosition = 0
    end
    object rpAnalSintProcGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppAnalSintProc
      NewPage = True
      ResetPageNo = True
      UserName = 'rpAnalSintProcGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpAnalSintProcGrpHdrBnd1: TppGroupHeaderBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpAnalSintProcGrpFootBnd1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 102129
        mmPrintPosition = 0
        object rpAnalSintProcLbl16: TppLabel
          UserName = 'rpAnalSintProcLbl16'
          AutoSize = False
          Caption = 'Total Geral de Processos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 1588
          mmWidth = 44979
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcLbl17: TppLabel
          UserName = 'Label103'
          AutoSize = False
          Caption = 'Valores Reclamados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 5821
          mmWidth = 44979
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcLbl18: TppLabel
          UserName = 'Label104'
          AutoSize = False
          Caption = 'Valores Estimados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 10054
          mmWidth = 44979
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcLbl19: TppLabel
          UserName = 'Label105'
          AutoSize = False
          Caption = 'Entrada de Processos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 16933
          mmWidth = 44979
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcLbl20: TppLabel
          UserName = 'Label106'
          AutoSize = False
          Caption = 'Valores Reclamados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 21167
          mmWidth = 44979
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcLbl21: TppLabel
          UserName = 'Label107'
          AutoSize = False
          Caption = 'Valores Estimados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 25400
          mmWidth = 44979
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcLbl22: TppLabel
          UserName = 'Label108'
          AutoSize = False
          Caption = 'Saída de Processos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 32279
          mmWidth = 44979
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcLbl23: TppLabel
          UserName = 'Label109'
          AutoSize = False
          Caption = 'Valores Reclamados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 36513
          mmWidth = 44979
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcLbl24: TppLabel
          UserName = 'Label1010'
          AutoSize = False
          Caption = 'Valores Estimados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 40746
          mmWidth = 44979
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcLbl25: TppLabel
          UserName = 'rpAnalSintProcLbl25'
          AutoSize = False
          Caption = 'Acordos (Qtde.)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 47625
          mmWidth = 44979
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcLbl26: TppLabel
          UserName = 'rpAnalSintProcLbl26'
          AutoSize = False
          Caption = 'Valores Dispendidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 51858
          mmWidth = 44979
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcLbl27: TppLabel
          UserName = 'rpAnalSintProcLbl27'
          AutoSize = False
          Caption = 'Decisões Judiciais (Qtde.)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 58738
          mmWidth = 44979
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcLbl28: TppLabel
          UserName = 'rpAnalSintProcLbl28'
          AutoSize = False
          Caption = 'Valores Dispendidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 62971
          mmWidth = 44979
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcLbl29: TppLabel
          UserName = 'rpAnalSintProcLbl29'
          AutoSize = False
          Caption = 'Outros - Arquiv/Desist (Qtde.)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 69850
          mmWidth = 44979
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcLbl30: TppLabel
          UserName = 'rpAnalSintProcLbl30'
          AutoSize = False
          Caption = 'Valores Dispendidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 74083
          mmWidth = 44979
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcLbl31: TppLabel
          UserName = 'rpAnalSintProcLbl31'
          AutoSize = False
          Caption = 'Total Valores Dispendidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 80698
          mmWidth = 44979
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcLbl32: TppLabel
          UserName = 'Label301'
          AutoSize = False
          Caption = '% Sobre Valores Reclamados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 84931
          mmWidth = 44979
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcLbl33: TppLabel
          UserName = 'rpAnalSintProcLbl33'
          AutoSize = False
          Caption = '% Sobre Valores Estimados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 89165
          mmWidth = 44979
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt2: TppDBText
          UserName = 'rpProcTrabDBTxt16'
          DataField = 'TOTPROC_01'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 1588
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt14: TppDBText
          UserName = 'rpAnalSintProcDBTxt14'
          DataField = 'TOTMAX_01'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 5821
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt26: TppDBText
          UserName = 'rpAnalSintProcDBTxt26'
          DataField = 'TOTEST_01'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 10054
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt38: TppDBText
          UserName = 'rpAnalSintProcDBTxt38'
          DataField = 'TOTENT_01'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 16933
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt51: TppDBText
          UserName = 'rpAnalSintProcDBTxt51'
          DataField = 'ENTMAX_01'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 21167
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt64: TppDBText
          UserName = 'rpAnalSintProcDBTxt64'
          DataField = 'ENTEST_01'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 25400
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt77: TppDBText
          UserName = 'rpAnalSintProcDBTxt77'
          DataField = 'TOTSAI_01'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 32279
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt90: TppDBText
          UserName = 'rpAnalSintProcDBTxt90'
          DataField = 'SAIMAX_01'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 36513
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt103: TppDBText
          UserName = 'rpAnalSintProcDBTxt103'
          DataField = 'SAIEST_01'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 40746
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt116: TppDBText
          UserName = 'rpAnalSintProcDBTxt116'
          DataField = 'TOTACO_01'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 47625
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt129: TppDBText
          UserName = 'rpAnalSintProcDBTxt129'
          DataField = 'REAACO_01'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 51858
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt142: TppDBText
          UserName = 'DBText101'
          DataField = 'TOTDEC_01'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 58738
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt155: TppDBText
          UserName = 'rpAnalSintProcDBTxt155'
          DataField = 'READEC_01'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 62971
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt168: TppDBText
          UserName = 'DBText102'
          DataField = 'TOTOUT_01'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 69850
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt181: TppDBText
          UserName = 'rpAnalSintProcDBTxt181'
          DataField = 'REAOUT_01'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 74083
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt194: TppDBText
          UserName = 'rpAnalSintProcDBTxt194'
          DataField = 'TOTREA_01'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 80698
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt207: TppDBText
          UserName = 'rpAnalSintProcDBTxt207'
          DataField = 'PERMAX_01'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 84931
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt220: TppDBText
          UserName = 'rpAnalSintProcDBTxt220'
          DataField = 'PEREST_01'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 89165
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt3: TppDBText
          UserName = 'rpAnalSintProcDBTxt3'
          DataField = 'TOTPROC_02'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 78581
          mmTop = 1588
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt15: TppDBText
          UserName = 'rpAnalSintProcDBTxt15'
          DataField = 'TOTMAX_02'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 78581
          mmTop = 5821
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt27: TppDBText
          UserName = 'rpAnalSintProcDBTxt27'
          DataField = 'TOTEST_02'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 78581
          mmTop = 10054
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt39: TppDBText
          UserName = 'rpAnalSintProcDBTxt39'
          DataField = 'TOTENT_02'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 78581
          mmTop = 16933
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt52: TppDBText
          UserName = 'rpAnalSintProcDBTxt52'
          DataField = 'ENTMAX_02'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 78581
          mmTop = 21167
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt65: TppDBText
          UserName = 'rpAnalSintProcDBTxt65'
          DataField = 'ENTEST_02'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 78581
          mmTop = 25400
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt78: TppDBText
          UserName = 'rpAnalSintProcDBTxt78'
          DataField = 'TOTSAI_02'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 78581
          mmTop = 32279
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt91: TppDBText
          UserName = 'rpAnalSintProcDBTxt91'
          DataField = 'SAIMAX_02'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 78581
          mmTop = 36513
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt104: TppDBText
          UserName = 'rpAnalSintProcDBTxt104'
          DataField = 'SAIEST_02'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 78581
          mmTop = 40746
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt117: TppDBText
          UserName = 'DBText103'
          DataField = 'TOTACO_02'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 78581
          mmTop = 47625
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt130: TppDBText
          UserName = 'rpAnalSintProcDBTxt130'
          DataField = 'REAACO_02'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 78581
          mmTop = 51858
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt143: TppDBText
          UserName = 'rpAnalSintProcDBTxt143'
          DataField = 'TOTDEC_02'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 78581
          mmTop = 58738
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt156: TppDBText
          UserName = 'rpAnalSintProcDBTxt156'
          DataField = 'READEC_02'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 78581
          mmTop = 62971
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt169: TppDBText
          UserName = 'rpAnalSintProcDBTxt169'
          DataField = 'TOTOUT_02'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 78581
          mmTop = 69850
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt182: TppDBText
          UserName = 'rpAnalSintProcDBTxt182'
          DataField = 'REAOUT_02'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 78581
          mmTop = 74083
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt195: TppDBText
          UserName = 'rpAnalSintProcDBTxt195'
          DataField = 'TOTREA_02'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 78581
          mmTop = 80698
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt208: TppDBText
          UserName = 'rpAnalSintProcDBTxt208'
          DataField = 'PERMAX_02'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 78581
          mmTop = 84931
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt221: TppDBText
          UserName = 'rpAnalSintProcDBTxt221'
          DataField = 'PEREST_02'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 78581
          mmTop = 89165
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt4: TppDBText
          UserName = 'rpAnalSintProcDBTxt4'
          DataField = 'TOTPROC_03'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 95250
          mmTop = 1588
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt16: TppDBText
          UserName = 'rpAnalSintProcDBTxt16'
          DataField = 'TOTMAX_03'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 95250
          mmTop = 5821
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt28: TppDBText
          UserName = 'rpAnalSintProcDBTxt28'
          DataField = 'TOTEST_03'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 95250
          mmTop = 10054
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt40: TppDBText
          UserName = 'rpAnalSintProcDBTxt40'
          DataField = 'TOTENT_03'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 95250
          mmTop = 16933
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt53: TppDBText
          UserName = 'rpAnalSintProcDBTxt53'
          DataField = 'ENTMAX_03'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 95250
          mmTop = 21167
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt66: TppDBText
          UserName = 'rpAnalSintProcDBTxt66'
          DataField = 'ENTEST_03'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 95250
          mmTop = 25400
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt79: TppDBText
          UserName = 'rpAnalSintProcDBTxt79'
          DataField = 'TOTSAI_03'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 95250
          mmTop = 32279
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt92: TppDBText
          UserName = 'rpAnalSintProcDBTxt92'
          DataField = 'SAIMAX_03'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 95250
          mmTop = 36513
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt105: TppDBText
          UserName = 'rpAnalSintProcDBTxt105'
          DataField = 'SAIEST_03'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 95250
          mmTop = 40746
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt118: TppDBText
          UserName = 'DBText104'
          DataField = 'TOTACO_03'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 95250
          mmTop = 47625
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt131: TppDBText
          UserName = 'rpAnalSintProcDBTxt131'
          DataField = 'REAACO_03'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 95250
          mmTop = 51858
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt144: TppDBText
          UserName = 'rpAnalSintProcDBTxt144'
          DataField = 'TOTDEC_03'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 95250
          mmTop = 58738
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt157: TppDBText
          UserName = 'rpAnalSintProcDBTxt157'
          DataField = 'READEC_03'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 95250
          mmTop = 62971
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt170: TppDBText
          UserName = 'rpAnalSintProcDBTxt170'
          DataField = 'TOTOUT_03'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 95250
          mmTop = 69850
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt183: TppDBText
          UserName = 'rpAnalSintProcDBTxt183'
          DataField = 'REAOUT_03'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 95250
          mmTop = 74083
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt196: TppDBText
          UserName = 'rpAnalSintProcDBTxt196'
          DataField = 'TOTREA_03'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 95250
          mmTop = 80698
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt209: TppDBText
          UserName = 'rpAnalSintProcDBTxt209'
          DataField = 'PERMAX_03'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 95250
          mmTop = 84931
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt222: TppDBText
          UserName = 'rpAnalSintProcDBTxt222'
          DataField = 'PEREST_03'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 95250
          mmTop = 89165
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt5: TppDBText
          UserName = 'rpAnalSintProcDBTxt5'
          DataField = 'TOTPROC_04'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 111654
          mmTop = 1588
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt17: TppDBText
          UserName = 'DBText202'
          DataField = 'TOTMAX_04'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 111654
          mmTop = 5821
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt29: TppDBText
          UserName = 'rpAnalSintProcDBTxt29'
          DataField = 'TOTEST_04'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 111654
          mmTop = 10054
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt41: TppDBText
          UserName = 'rpAnalSintProcDBTxt41'
          DataField = 'TOTENT_04'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 111654
          mmTop = 16933
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt54: TppDBText
          UserName = 'rpAnalSintProcDBTxt54'
          DataField = 'ENTMAX_04'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 111654
          mmTop = 21167
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt67: TppDBText
          UserName = 'rpAnalSintProcDBTxt67'
          DataField = 'ENTEST_04'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 111654
          mmTop = 25400
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt80: TppDBText
          UserName = 'rpAnalSintProcDBTxt80'
          DataField = 'TOTSAI_04'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 111654
          mmTop = 32279
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt93: TppDBText
          UserName = 'rpAnalSintProcDBTxt93'
          DataField = 'SAIMAX_04'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 111654
          mmTop = 36513
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt106: TppDBText
          UserName = 'rpAnalSintProcDBTxt106'
          DataField = 'SAIEST_04'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 111654
          mmTop = 40746
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt119: TppDBText
          UserName = 'rpAnalSintProcDBTxt119'
          DataField = 'TOTACO_04'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 111654
          mmTop = 47625
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt132: TppDBText
          UserName = 'DBText301'
          DataField = 'REAACO_04'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 111654
          mmTop = 51858
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt145: TppDBText
          UserName = 'rpAnalSintProcDBTxt145'
          DataField = 'TOTDEC_04'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 111654
          mmTop = 58738
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt158: TppDBText
          UserName = 'rpAnalSintProcDBTxt158'
          DataField = 'READEC_04'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 111654
          mmTop = 62971
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt171: TppDBText
          UserName = 'rpAnalSintProcDBTxt171'
          DataField = 'TOTOUT_04'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 111654
          mmTop = 69850
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt184: TppDBText
          UserName = 'rpAnalSintProcDBTxt184'
          DataField = 'REAOUT_04'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 111654
          mmTop = 74083
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt197: TppDBText
          UserName = 'rpAnalSintProcDBTxt197'
          DataField = 'TOTREA_04'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 111654
          mmTop = 80698
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt210: TppDBText
          UserName = 'rpAnalSintProcDBTxt210'
          DataField = 'PERMAX_04'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 111654
          mmTop = 84931
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt223: TppDBText
          UserName = 'rpAnalSintProcDBTxt223'
          DataField = 'PEREST_04'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 111654
          mmTop = 89165
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt6: TppDBText
          UserName = 'rpAnalSintProcDBTxt6'
          DataField = 'TOTPROC_05'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128059
          mmTop = 1588
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt18: TppDBText
          UserName = 'rpAnalSintProcDBTxt18'
          DataField = 'TOTMAX_05'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128059
          mmTop = 5821
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt30: TppDBText
          UserName = 'rpAnalSintProcDBTxt30'
          DataField = 'TOTEST_05'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128059
          mmTop = 10054
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt42: TppDBText
          UserName = 'rpAnalSintProcDBTxt42'
          DataField = 'TOTENT_05'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128059
          mmTop = 16933
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt55: TppDBText
          UserName = 'rpAnalSintProcDBTxt55'
          DataField = 'ENTMAX_05'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128059
          mmTop = 21167
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt68: TppDBText
          UserName = 'rpAnalSintProcDBTxt68'
          DataField = 'ENTEST_05'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128059
          mmTop = 25400
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt81: TppDBText
          UserName = 'rpAnalSintProcDBTxt81'
          DataField = 'TOTSAI_05'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128059
          mmTop = 32279
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt94: TppDBText
          UserName = 'rpAnalSintProcDBTxt94'
          DataField = 'SAIMAX_05'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128059
          mmTop = 36513
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt107: TppDBText
          UserName = 'rpAnalSintProcDBTxt107'
          DataField = 'SAIEST_05'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128059
          mmTop = 40746
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt120: TppDBText
          UserName = 'DBText105'
          DataField = 'TOTACO_05'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128059
          mmTop = 47625
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt133: TppDBText
          UserName = 'rpAnalSintProcDBTxt133'
          DataField = 'REAACO_05'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128059
          mmTop = 51858
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt146: TppDBText
          UserName = 'rpAnalSintProcDBTxt146'
          DataField = 'TOTDEC_05'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128059
          mmTop = 58738
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt159: TppDBText
          UserName = 'rpAnalSintProcDBTxt159'
          DataField = 'READEC_05'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128059
          mmTop = 62971
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt172: TppDBText
          UserName = 'rpAnalSintProcDBTxt172'
          DataField = 'TOTOUT_05'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128059
          mmTop = 69850
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt185: TppDBText
          UserName = 'rpAnalSintProcDBTxt185'
          DataField = 'REAOUT_05'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128059
          mmTop = 74083
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt198: TppDBText
          UserName = 'rpAnalSintProcDBTxt198'
          DataField = 'TOTREA_05'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128059
          mmTop = 80698
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt211: TppDBText
          UserName = 'rpAnalSintProcDBTxt211'
          DataField = 'PERMAX_05'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128059
          mmTop = 84931
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt224: TppDBText
          UserName = 'rpAnalSintProcDBTxt224'
          DataField = 'PEREST_05'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128059
          mmTop = 89165
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt7: TppDBText
          UserName = 'rpAnalSintProcDBTxt7'
          DataField = 'TOTPROC_06'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 1588
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt19: TppDBText
          UserName = 'DBText203'
          DataField = 'TOTMAX_06'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 5821
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt31: TppDBText
          UserName = 'rpAnalSintProcDBTxt31'
          DataField = 'TOTEST_06'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 10054
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt43: TppDBText
          UserName = 'rpAnalSintProcDBTxt43'
          DataField = 'TOTENT_06'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 16933
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt56: TppDBText
          UserName = 'rpAnalSintProcDBTxt56'
          DataField = 'ENTMAX_06'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 21167
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt69: TppDBText
          UserName = 'rpAnalSintProcDBTxt69'
          DataField = 'ENTEST_06'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 25400
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt82: TppDBText
          UserName = 'rpAnalSintProcDBTxt82'
          DataField = 'TOTSAI_06'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 32279
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt95: TppDBText
          UserName = 'rpAnalSintProcDBTxt95'
          DataField = 'SAIMAX_06'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 36513
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt108: TppDBText
          UserName = 'rpAnalSintProcDBTxt108'
          DataField = 'SAIEST_06'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 40746
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt121: TppDBText
          UserName = 'DBText1'
          DataField = 'TOTACO_06'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 47625
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt134: TppDBText
          UserName = 'DBText302'
          DataField = 'REAACO_06'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 51858
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt147: TppDBText
          UserName = 'DBText12'
          DataField = 'TOTDEC_06'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 58738
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt160: TppDBText
          UserName = 'DBText14'
          DataField = 'READEC_06'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 62971
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt173: TppDBText
          UserName = 'DBText28'
          DataField = 'TOTOUT_06'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 69850
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt186: TppDBText
          UserName = 'rpAnalSintProcDBTxt186'
          DataField = 'REAOUT_06'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 74083
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt199: TppDBText
          UserName = 'rpAnalSintProcDBTxt199'
          DataField = 'TOTREA_06'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 80698
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt212: TppDBText
          UserName = 'rpAnalSintProcDBTxt212'
          DataField = 'PERMAX_06'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 84931
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt225: TppDBText
          UserName = 'rpAnalSintProcDBTxt225'
          DataField = 'PEREST_06'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 89165
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt8: TppDBText
          UserName = 'rpAnalSintProcDBTxt8'
          DataField = 'TOTPROC_07'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 160867
          mmTop = 1588
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt20: TppDBText
          UserName = 'rpAnalSintProcDBTxt20'
          DataField = 'TOTMAX_07'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 160867
          mmTop = 5821
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt32: TppDBText
          UserName = 'DBText401'
          DataField = 'TOTEST_07'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 160867
          mmTop = 10054
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt44: TppDBText
          UserName = 'rpAnalSintProcDBTxt44'
          DataField = 'TOTENT_07'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 160867
          mmTop = 16933
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt57: TppDBText
          UserName = 'rpAnalSintProcDBTxt57'
          DataField = 'ENTMAX_07'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 160867
          mmTop = 21167
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt70: TppDBText
          UserName = 'rpAnalSintProcDBTxt70'
          DataField = 'ENTEST_07'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 160867
          mmTop = 25400
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt83: TppDBText
          UserName = 'rpAnalSintProcDBTxt83'
          DataField = 'TOTSAI_07'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 160867
          mmTop = 32279
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt96: TppDBText
          UserName = 'rpAnalSintProcDBTxt96'
          DataField = 'SAIMAX_07'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 160867
          mmTop = 36513
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt109: TppDBText
          UserName = 'rpAnalSintProcDBTxt109'
          DataField = 'SAIEST_07'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 160867
          mmTop = 40746
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt122: TppDBText
          UserName = 'rpAnalSintProcDBTxt122'
          DataField = 'TOTACO_07'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 160867
          mmTop = 47625
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt135: TppDBText
          UserName = 'rpAnalSintProcDBTxt135'
          DataField = 'REAACO_07'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 160867
          mmTop = 51858
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt148: TppDBText
          UserName = 'rpAnalSintProcDBTxt148'
          DataField = 'TOTDEC_07'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 160867
          mmTop = 58738
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt161: TppDBText
          UserName = 'DBText501'
          DataField = 'READEC_07'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 160867
          mmTop = 62971
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt174: TppDBText
          UserName = 'rpAnalSintProcDBTxt174'
          DataField = 'TOTOUT_07'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 160867
          mmTop = 69850
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt187: TppDBText
          UserName = 'rpAnalSintProcDBTxt187'
          DataField = 'REAOUT_07'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 160867
          mmTop = 74083
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt200: TppDBText
          UserName = 'rpAnalSintProcDBTxt200'
          DataField = 'TOTREA_07'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 160867
          mmTop = 80698
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt213: TppDBText
          UserName = 'rpAnalSintProcDBTxt213'
          DataField = 'PERMAX_07'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 160867
          mmTop = 84931
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt226: TppDBText
          UserName = 'rpAnalSintProcDBTxt226'
          DataField = 'PEREST_07'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 160867
          mmTop = 89165
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt9: TppDBText
          UserName = 'rpAnalSintProcDBTxt9'
          DataField = 'TOTPROC_08'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 1588
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt21: TppDBText
          UserName = 'rpAnalSintProcDBTxt21'
          DataField = 'TOTMAX_08'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 5821
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt33: TppDBText
          UserName = 'rpAnalSintProcDBTxt33'
          DataField = 'TOTEST_08'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 10054
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt45: TppDBText
          UserName = 'rpAnalSintProcDBTxt45'
          DataField = 'TOTENT_08'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 16933
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt58: TppDBText
          UserName = 'DBText601'
          DataField = 'ENTMAX_08'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 21167
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt71: TppDBText
          UserName = 'rpAnalSintProcDBTxt71'
          DataField = 'ENTEST_08'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 25400
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt84: TppDBText
          UserName = 'rpAnalSintProcDBTxt84'
          DataField = 'TOTSAI_08'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 32279
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt97: TppDBText
          UserName = 'rpAnalSintProcDBTxt97'
          DataField = 'SAIMAX_08'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 36513
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt110: TppDBText
          UserName = 'rpAnalSintProcDBTxt110'
          DataField = 'SAIEST_08'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 40746
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt123: TppDBText
          UserName = 'rpAnalSintProcDBTxt123'
          DataField = 'TOTACO_08'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 47625
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt136: TppDBText
          UserName = 'rpAnalSintProcDBTxt136'
          DataField = 'REAACO_08'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 51858
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt149: TppDBText
          UserName = 'rpAnalSintProcDBTxt149'
          DataField = 'TOTDEC_08'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 58738
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt162: TppDBText
          UserName = 'rpAnalSintProcDBTxt162'
          DataField = 'READEC_08'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 62971
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt175: TppDBText
          UserName = 'rpAnalSintProcDBTxt175'
          DataField = 'TOTOUT_08'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 69850
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt188: TppDBText
          UserName = 'DBText701'
          DataField = 'REAOUT_08'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 74083
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt201: TppDBText
          UserName = 'rpAnalSintProcDBTxt201'
          DataField = 'TOTREA_08'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 80698
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt214: TppDBText
          UserName = 'rpAnalSintProcDBTxt214'
          DataField = 'PERMAX_08'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 84931
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt227: TppDBText
          UserName = 'rpAnalSintProcDBTxt227'
          DataField = 'PEREST_08'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 89165
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt10: TppDBText
          UserName = 'rpAnalSintProcDBTxt10'
          DataField = 'TOTPROC_09'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 193675
          mmTop = 1588
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt22: TppDBText
          UserName = 'rpAnalSintProcDBTxt22'
          DataField = 'TOTMAX_09'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 193675
          mmTop = 5821
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt34: TppDBText
          UserName = 'rpAnalSintProcDBTxt34'
          DataField = 'TOTEST_09'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 193675
          mmTop = 10054
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt46: TppDBText
          UserName = 'rpAnalSintProcDBTxt46'
          DataField = 'TOTENT_09'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 193675
          mmTop = 16933
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt59: TppDBText
          UserName = 'rpAnalSintProcDBTxt59'
          DataField = 'ENTMAX_09'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 193675
          mmTop = 21167
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt72: TppDBText
          UserName = 'rpAnalSintProcDBTxt72'
          DataField = 'ENTEST_09'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 193675
          mmTop = 25400
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt85: TppDBText
          UserName = 'DBText801'
          DataField = 'TOTSAI_09'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 193675
          mmTop = 32279
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt98: TppDBText
          UserName = 'rpAnalSintProcDBTxt98'
          DataField = 'SAIMAX_09'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 193675
          mmTop = 36513
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt111: TppDBText
          UserName = 'rpAnalSintProcDBTxt111'
          DataField = 'SAIEST_09'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 193675
          mmTop = 40746
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt124: TppDBText
          UserName = 'rpAnalSintProcDBTxt124'
          DataField = 'TOTACO_09'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 193675
          mmTop = 47625
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt137: TppDBText
          UserName = 'rpAnalSintProcDBTxt137'
          DataField = 'REAACO_09'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 193675
          mmTop = 51858
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt150: TppDBText
          UserName = 'rpAnalSintProcDBTxt150'
          DataField = 'TOTDEC_09'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 193675
          mmTop = 58738
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt163: TppDBText
          UserName = 'rpAnalSintProcDBTxt163'
          DataField = 'READEC_09'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 193675
          mmTop = 62971
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt176: TppDBText
          UserName = 'rpAnalSintProcDBTxt176'
          DataField = 'TOTOUT_09'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 193675
          mmTop = 69850
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt189: TppDBText
          UserName = 'rpAnalSintProcDBTxt189'
          DataField = 'REAOUT_09'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 193675
          mmTop = 74083
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt202: TppDBText
          UserName = 'rpAnalSintProcDBTxt202'
          DataField = 'TOTREA_09'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 193675
          mmTop = 80698
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt215: TppDBText
          UserName = 'DBText901'
          DataField = 'PERMAX_09'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 193675
          mmTop = 84931
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt228: TppDBText
          UserName = 'rpAnalSintProcDBTxt228'
          DataField = 'PEREST_09'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 193675
          mmTop = 89165
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt11: TppDBText
          UserName = 'rpAnalSintProcDBTxt11'
          DataField = 'TOTPROC_10'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 210080
          mmTop = 1588
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt23: TppDBText
          UserName = 'rpAnalSintProcDBTxt23'
          DataField = 'TOTMAX_10'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 210080
          mmTop = 5821
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt35: TppDBText
          UserName = 'rpAnalSintProcDBTxt35'
          DataField = 'TOTEST_10'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 210080
          mmTop = 10054
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt47: TppDBText
          UserName = 'rpAnalSintProcDBTxt47'
          DataField = 'TOTENT_10'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 210080
          mmTop = 16933
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt60: TppDBText
          UserName = 'rpAnalSintProcDBTxt60'
          DataField = 'ENTMAX_10'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 210080
          mmTop = 21167
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt73: TppDBText
          UserName = 'rpAnalSintProcDBTxt73'
          DataField = 'ENTEST_10'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 210080
          mmTop = 25400
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt86: TppDBText
          UserName = 'rpAnalSintProcDBTxt86'
          DataField = 'TOTSAI_10'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 210080
          mmTop = 32279
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt99: TppDBText
          UserName = 'rpAnalSintProcDBTxt99'
          DataField = 'SAIMAX_10'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 210080
          mmTop = 36513
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt112: TppDBText
          UserName = 'DBText1001'
          DataField = 'SAIEST_10'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 210080
          mmTop = 40746
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt125: TppDBText
          UserName = 'rpAnalSintProcDBTxt125'
          DataField = 'TOTACO_10'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 210080
          mmTop = 47625
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt138: TppDBText
          UserName = 'rpAnalSintProcDBTxt138'
          DataField = 'REAACO_10'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 210080
          mmTop = 51858
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt151: TppDBText
          UserName = 'rpAnalSintProcDBTxt151'
          DataField = 'TOTDEC_10'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 210080
          mmTop = 58738
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt164: TppDBText
          UserName = 'rpAnalSintProcDBTxt164'
          DataField = 'READEC_10'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 210080
          mmTop = 62971
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt177: TppDBText
          UserName = 'rpAnalSintProcDBTxt177'
          DataField = 'TOTOUT_10'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 210080
          mmTop = 69850
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt190: TppDBText
          UserName = 'rpAnalSintProcDBTxt190'
          DataField = 'REAOUT_10'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 210080
          mmTop = 74083
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt203: TppDBText
          UserName = 'rpAnalSintProcDBTxt203'
          DataField = 'TOTREA_10'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 210080
          mmTop = 80698
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt216: TppDBText
          UserName = 'rpAnalSintProcDBTxt216'
          DataField = 'PERMAX_10'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 210080
          mmTop = 84931
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt229: TppDBText
          UserName = 'rpAnalSintProcDBTxt229'
          DataField = 'PEREST_10'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 210080
          mmTop = 89165
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt12: TppDBText
          UserName = 'DBText1101'
          DataField = 'TOTPROC_11'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 226484
          mmTop = 1588
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt24: TppDBText
          UserName = 'rpAnalSintProcDBTxt24'
          DataField = 'TOTMAX_11'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 226484
          mmTop = 5821
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt36: TppDBText
          UserName = 'rpAnalSintProcDBTxt36'
          DataField = 'TOTEST_11'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 226484
          mmTop = 10054
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt48: TppDBText
          UserName = 'rpAnalSintProcDBTxt48'
          DataField = 'TOTENT_11'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 226484
          mmTop = 16933
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt61: TppDBText
          UserName = 'rpAnalSintProcDBTxt61'
          DataField = 'ENTMAX_11'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 226484
          mmTop = 21167
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt74: TppDBText
          UserName = 'rpAnalSintProcDBTxt74'
          DataField = 'ENTEST_11'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 226484
          mmTop = 25400
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt87: TppDBText
          UserName = 'rpAnalSintProcDBTxt87'
          DataField = 'TOTSAI_11'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 226484
          mmTop = 32279
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt100: TppDBText
          UserName = 'rpAnalSintProcDBTxt100'
          DataField = 'SAIMAX_11'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 226484
          mmTop = 36513
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt113: TppDBText
          UserName = 'rpAnalSintProcDBTxt113'
          DataField = 'SAIEST_11'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 226484
          mmTop = 40746
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt126: TppDBText
          UserName = 'rpAnalSintProcDBTxt126'
          DataField = 'TOTACO_11'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 226484
          mmTop = 47625
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt139: TppDBText
          UserName = 'DBText1201'
          DataField = 'REAACO_11'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 226484
          mmTop = 51858
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt152: TppDBText
          UserName = 'rpAnalSintProcDBTxt152'
          DataField = 'TOTDEC_11'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 226484
          mmTop = 58738
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt165: TppDBText
          UserName = 'rpAnalSintProcDBTxt165'
          DataField = 'READEC_11'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 226484
          mmTop = 62971
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt178: TppDBText
          UserName = 'rpAnalSintProcDBTxt178'
          DataField = 'TOTOUT_11'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 226484
          mmTop = 69850
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt191: TppDBText
          UserName = 'rpAnalSintProcDBTxt191'
          DataField = 'REAOUT_11'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 226484
          mmTop = 74083
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt204: TppDBText
          UserName = 'rpAnalSintProcDBTxt204'
          DataField = 'TOTREA_11'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 226484
          mmTop = 80698
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt217: TppDBText
          UserName = 'rpAnalSintProcDBTxt217'
          DataField = 'PERMAX_11'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 226484
          mmTop = 84931
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt230: TppDBText
          UserName = 'rpAnalSintProcDBTxt230'
          DataField = 'PEREST_11'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 226484
          mmTop = 89165
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt13: TppDBText
          UserName = 'rpAnalSintProcDBTxt13'
          DataField = 'TOTPROC_12'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 242888
          mmTop = 1588
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt25: TppDBText
          UserName = 'DBText29'
          DataField = 'TOTMAX_12'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 242888
          mmTop = 5821
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt37: TppDBText
          UserName = 'DBText1301'
          DataField = 'TOTEST_12'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 242888
          mmTop = 10054
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt49: TppDBText
          UserName = 'DBText47'
          DataField = 'TOTENT_12'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 242888
          mmTop = 16933
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt62: TppDBText
          UserName = 'rpAnalSintProcDBTxt62'
          DataField = 'ENTMAX_12'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 242888
          mmTop = 21167
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt75: TppDBText
          UserName = 'rpAnalSintProcDBTxt75'
          DataField = 'ENTEST_12'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 242888
          mmTop = 25400
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt88: TppDBText
          UserName = 'rpAnalSintProcDBTxt88'
          DataField = 'TOTSAI_12'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 242888
          mmTop = 32279
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt101: TppDBText
          UserName = 'rpAnalSintProcDBTxt101'
          DataField = 'SAIMAX_12'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 242888
          mmTop = 36513
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt114: TppDBText
          UserName = 'rpAnalSintProcDBTxt114'
          DataField = 'SAIEST_12'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 242888
          mmTop = 40746
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt127: TppDBText
          UserName = 'rpAnalSintProcDBTxt127'
          DataField = 'TOTACO_12'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 242888
          mmTop = 47625
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt140: TppDBText
          UserName = 'rpAnalSintProcDBTxt140'
          DataField = 'REAACO_12'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 242888
          mmTop = 51858
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt153: TppDBText
          UserName = 'rpAnalSintProcDBTxt153'
          DataField = 'TOTDEC_12'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 242888
          mmTop = 58738
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt166: TppDBText
          UserName = 'DBText1401'
          DataField = 'READEC_12'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 242888
          mmTop = 62971
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt179: TppDBText
          UserName = 'rpAnalSintProcDBTxt179'
          DataField = 'TOTOUT_12'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 242888
          mmTop = 69850
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt192: TppDBText
          UserName = 'rpAnalSintProcDBTxt192'
          DataField = 'REAOUT_12'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 242888
          mmTop = 74083
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt205: TppDBText
          UserName = 'rpAnalSintProcDBTxt205'
          DataField = 'TOTREA_12'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 242888
          mmTop = 80698
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt218: TppDBText
          UserName = 'rpAnalSintProcDBTxt218'
          DataField = 'PERMAX_12'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 242888
          mmTop = 84931
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt231: TppDBText
          UserName = 'rpAnalSintProcDBTxt231'
          DataField = 'PEREST_12'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 242888
          mmTop = 89165
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcLbl34: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 
            'Obs.: Valores Expressos em Milhares de Unidades da Moeda Corrent' +
            'e'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 102923
          mmTop = 96838
          mmWidth = 78317
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt50: TppDBText
          UserName = 'rpAnalSintProcDBTxt50'
          DataField = 'TotEntT'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 259292
          mmTop = 16933
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt63: TppDBText
          UserName = 'rpAnalSintProcDBTxt63'
          DataField = 'EntMaxT'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 259292
          mmTop = 21167
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt76: TppDBText
          UserName = 'rpAnalSintProcDBTxt76'
          DataField = 'EntEstT'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 259292
          mmTop = 25400
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt89: TppDBText
          UserName = 'rpAnalSintProcDBTxt89'
          DataField = 'TotSaiT'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 259292
          mmTop = 32279
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt102: TppDBText
          UserName = 'rpAnalSintProcDBTxt102'
          DataField = 'SaiMaxT'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 259292
          mmTop = 36513
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt115: TppDBText
          UserName = 'rpAnalSintProcDBTxt115'
          DataField = 'SaiEstT'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 259292
          mmTop = 40746
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt128: TppDBText
          UserName = 'rpAnalSintProcDBTxt128'
          DataField = 'TotAcoT'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 259292
          mmTop = 47625
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt141: TppDBText
          UserName = 'DBText2101'
          DataField = 'ReaAcoT'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 259292
          mmTop = 51858
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt154: TppDBText
          UserName = 'rpAnalSintProcDBTxt154'
          DataField = 'TotDecT'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 259292
          mmTop = 58738
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt167: TppDBText
          UserName = 'rpAnalSintProcDBTxt167'
          DataField = 'ReaDecT'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 259292
          mmTop = 62971
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt180: TppDBText
          UserName = 'rpAnalSintProcDBTxt180'
          DataField = 'TotOutT'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 259292
          mmTop = 69850
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt193: TppDBText
          UserName = 'rpAnalSintProcDBTxt193'
          DataField = 'ReaOutT'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 259292
          mmTop = 74083
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt206: TppDBText
          UserName = 'rpAnalSintProcDBTxt206'
          DataField = 'TotReaT'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 259292
          mmTop = 80698
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt219: TppDBText
          UserName = 'rpAnalSintProcDBTxt219'
          DataField = 'PerMaxT'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 259292
          mmTop = 84931
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpAnalSintProcDBTxt232: TppDBText
          UserName = 'rpAnalSintProcDBTxt232'
          DataField = 'PerEstT'
          DataPipeline = ppAnalSintProc
          DisplayFormat = '###0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 259292
          mmTop = 89165
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppAnalSintProc: TppBDEPipeline
    DataSource = dsAnalSintProc
    UserName = 'ppProcTrab5'
    Left = 98
    Top = 195
    object ppAnalSintProcppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppAnalSintProcppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTPROC_01'
      FieldName = 'TOTPROC_01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppAnalSintProcppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTPROC_02'
      FieldName = 'TOTPROC_02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppAnalSintProcppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTPROC_03'
      FieldName = 'TOTPROC_03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppAnalSintProcppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTPROC_04'
      FieldName = 'TOTPROC_04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppAnalSintProcppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTPROC_05'
      FieldName = 'TOTPROC_05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppAnalSintProcppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTPROC_06'
      FieldName = 'TOTPROC_06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppAnalSintProcppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTPROC_07'
      FieldName = 'TOTPROC_07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppAnalSintProcppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTPROC_08'
      FieldName = 'TOTPROC_08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppAnalSintProcppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTPROC_09'
      FieldName = 'TOTPROC_09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppAnalSintProcppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTPROC_10'
      FieldName = 'TOTPROC_10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppAnalSintProcppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTPROC_11'
      FieldName = 'TOTPROC_11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppAnalSintProcppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTPROC_12'
      FieldName = 'TOTPROC_12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppAnalSintProcppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTMAX_01'
      FieldName = 'TOTMAX_01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppAnalSintProcppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTMAX_02'
      FieldName = 'TOTMAX_02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppAnalSintProcppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTMAX_03'
      FieldName = 'TOTMAX_03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppAnalSintProcppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTMAX_04'
      FieldName = 'TOTMAX_04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppAnalSintProcppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTMAX_05'
      FieldName = 'TOTMAX_05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppAnalSintProcppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTMAX_06'
      FieldName = 'TOTMAX_06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppAnalSintProcppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTMAX_07'
      FieldName = 'TOTMAX_07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppAnalSintProcppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTMAX_08'
      FieldName = 'TOTMAX_08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppAnalSintProcppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTMAX_09'
      FieldName = 'TOTMAX_09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppAnalSintProcppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTMAX_10'
      FieldName = 'TOTMAX_10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppAnalSintProcppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTMAX_11'
      FieldName = 'TOTMAX_11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppAnalSintProcppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTMAX_12'
      FieldName = 'TOTMAX_12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppAnalSintProcppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTEST_01'
      FieldName = 'TOTEST_01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppAnalSintProcppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTEST_02'
      FieldName = 'TOTEST_02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppAnalSintProcppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTEST_03'
      FieldName = 'TOTEST_03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object ppAnalSintProcppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTEST_04'
      FieldName = 'TOTEST_04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object ppAnalSintProcppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTEST_05'
      FieldName = 'TOTEST_05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object ppAnalSintProcppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTEST_06'
      FieldName = 'TOTEST_06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object ppAnalSintProcppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTEST_07'
      FieldName = 'TOTEST_07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object ppAnalSintProcppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTEST_08'
      FieldName = 'TOTEST_08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object ppAnalSintProcppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTEST_09'
      FieldName = 'TOTEST_09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object ppAnalSintProcppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTEST_10'
      FieldName = 'TOTEST_10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object ppAnalSintProcppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTEST_11'
      FieldName = 'TOTEST_11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object ppAnalSintProcppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTEST_12'
      FieldName = 'TOTEST_12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object ppAnalSintProcppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTENT_01'
      FieldName = 'TOTENT_01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 37
    end
    object ppAnalSintProcppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTENT_02'
      FieldName = 'TOTENT_02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object ppAnalSintProcppField40: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTENT_03'
      FieldName = 'TOTENT_03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 39
    end
    object ppAnalSintProcppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTENT_04'
      FieldName = 'TOTENT_04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 40
    end
    object ppAnalSintProcppField42: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTENT_05'
      FieldName = 'TOTENT_05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 41
    end
    object ppAnalSintProcppField43: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTENT_06'
      FieldName = 'TOTENT_06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 42
    end
    object ppAnalSintProcppField44: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTENT_07'
      FieldName = 'TOTENT_07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 43
    end
    object ppAnalSintProcppField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTENT_08'
      FieldName = 'TOTENT_08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 44
    end
    object ppAnalSintProcppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTENT_09'
      FieldName = 'TOTENT_09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object ppAnalSintProcppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTENT_10'
      FieldName = 'TOTENT_10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 46
    end
    object ppAnalSintProcppField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTENT_11'
      FieldName = 'TOTENT_11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 47
    end
    object ppAnalSintProcppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTENT_12'
      FieldName = 'TOTENT_12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 48
    end
    object ppAnalSintProcppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTMAX_01'
      FieldName = 'ENTMAX_01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 49
    end
    object ppAnalSintProcppField51: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTMAX_02'
      FieldName = 'ENTMAX_02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 50
    end
    object ppAnalSintProcppField52: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTMAX_03'
      FieldName = 'ENTMAX_03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 51
    end
    object ppAnalSintProcppField53: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTMAX_04'
      FieldName = 'ENTMAX_04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 52
    end
    object ppAnalSintProcppField54: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTMAX_05'
      FieldName = 'ENTMAX_05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 53
    end
    object ppAnalSintProcppField55: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTMAX_06'
      FieldName = 'ENTMAX_06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 54
    end
    object ppAnalSintProcppField56: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTMAX_07'
      FieldName = 'ENTMAX_07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 55
    end
    object ppAnalSintProcppField57: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTMAX_08'
      FieldName = 'ENTMAX_08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 56
    end
    object ppAnalSintProcppField58: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTMAX_09'
      FieldName = 'ENTMAX_09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 57
    end
    object ppAnalSintProcppField59: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTMAX_10'
      FieldName = 'ENTMAX_10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 58
    end
    object ppAnalSintProcppField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTMAX_11'
      FieldName = 'ENTMAX_11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 59
    end
    object ppAnalSintProcppField61: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTMAX_12'
      FieldName = 'ENTMAX_12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 60
    end
    object ppAnalSintProcppField62: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTEST_01'
      FieldName = 'ENTEST_01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 61
    end
    object ppAnalSintProcppField63: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTEST_02'
      FieldName = 'ENTEST_02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 62
    end
    object ppAnalSintProcppField64: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTEST_03'
      FieldName = 'ENTEST_03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 63
    end
    object ppAnalSintProcppField65: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTEST_04'
      FieldName = 'ENTEST_04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 64
    end
    object ppAnalSintProcppField66: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTEST_05'
      FieldName = 'ENTEST_05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 65
    end
    object ppAnalSintProcppField67: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTEST_06'
      FieldName = 'ENTEST_06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 66
    end
    object ppAnalSintProcppField68: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTEST_07'
      FieldName = 'ENTEST_07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 67
    end
    object ppAnalSintProcppField69: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTEST_08'
      FieldName = 'ENTEST_08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 68
    end
    object ppAnalSintProcppField70: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTEST_09'
      FieldName = 'ENTEST_09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 69
    end
    object ppAnalSintProcppField71: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTEST_10'
      FieldName = 'ENTEST_10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 70
    end
    object ppAnalSintProcppField72: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTEST_11'
      FieldName = 'ENTEST_11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 71
    end
    object ppAnalSintProcppField73: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTEST_12'
      FieldName = 'ENTEST_12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 72
    end
    object ppAnalSintProcppField74: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTSAI_01'
      FieldName = 'TOTSAI_01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 73
    end
    object ppAnalSintProcppField75: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTSAI_02'
      FieldName = 'TOTSAI_02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 74
    end
    object ppAnalSintProcppField76: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTSAI_03'
      FieldName = 'TOTSAI_03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 75
    end
    object ppAnalSintProcppField77: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTSAI_04'
      FieldName = 'TOTSAI_04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 76
    end
    object ppAnalSintProcppField78: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTSAI_05'
      FieldName = 'TOTSAI_05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 77
    end
    object ppAnalSintProcppField79: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTSAI_06'
      FieldName = 'TOTSAI_06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 78
    end
    object ppAnalSintProcppField80: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTSAI_07'
      FieldName = 'TOTSAI_07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 79
    end
    object ppAnalSintProcppField81: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTSAI_08'
      FieldName = 'TOTSAI_08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 80
    end
    object ppAnalSintProcppField82: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTSAI_09'
      FieldName = 'TOTSAI_09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 81
    end
    object ppAnalSintProcppField83: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTSAI_10'
      FieldName = 'TOTSAI_10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 82
    end
    object ppAnalSintProcppField84: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTSAI_11'
      FieldName = 'TOTSAI_11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 83
    end
    object ppAnalSintProcppField85: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTSAI_12'
      FieldName = 'TOTSAI_12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 84
    end
    object ppAnalSintProcppField86: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIMAX_01'
      FieldName = 'SAIMAX_01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 85
    end
    object ppAnalSintProcppField87: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIMAX_02'
      FieldName = 'SAIMAX_02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 86
    end
    object ppAnalSintProcppField88: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIMAX_03'
      FieldName = 'SAIMAX_03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 87
    end
    object ppAnalSintProcppField89: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIMAX_04'
      FieldName = 'SAIMAX_04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 88
    end
    object ppAnalSintProcppField90: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIMAX_05'
      FieldName = 'SAIMAX_05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 89
    end
    object ppAnalSintProcppField91: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIMAX_06'
      FieldName = 'SAIMAX_06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 90
    end
    object ppAnalSintProcppField92: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIMAX_07'
      FieldName = 'SAIMAX_07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 91
    end
    object ppAnalSintProcppField93: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIMAX_08'
      FieldName = 'SAIMAX_08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 92
    end
    object ppAnalSintProcppField94: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIMAX_09'
      FieldName = 'SAIMAX_09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 93
    end
    object ppAnalSintProcppField95: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIMAX_10'
      FieldName = 'SAIMAX_10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 94
    end
    object ppAnalSintProcppField96: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIMAX_11'
      FieldName = 'SAIMAX_11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 95
    end
    object ppAnalSintProcppField97: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIMAX_12'
      FieldName = 'SAIMAX_12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 96
    end
    object ppAnalSintProcppField98: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIEST_01'
      FieldName = 'SAIEST_01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 97
    end
    object ppAnalSintProcppField99: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIEST_02'
      FieldName = 'SAIEST_02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 98
    end
    object ppAnalSintProcppField100: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIEST_03'
      FieldName = 'SAIEST_03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 99
    end
    object ppAnalSintProcppField101: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIEST_04'
      FieldName = 'SAIEST_04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 100
    end
    object ppAnalSintProcppField102: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIEST_05'
      FieldName = 'SAIEST_05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 101
    end
    object ppAnalSintProcppField103: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIEST_06'
      FieldName = 'SAIEST_06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 102
    end
    object ppAnalSintProcppField104: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIEST_07'
      FieldName = 'SAIEST_07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 103
    end
    object ppAnalSintProcppField105: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIEST_08'
      FieldName = 'SAIEST_08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 104
    end
    object ppAnalSintProcppField106: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIEST_09'
      FieldName = 'SAIEST_09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 105
    end
    object ppAnalSintProcppField107: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIEST_10'
      FieldName = 'SAIEST_10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 106
    end
    object ppAnalSintProcppField108: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIEST_11'
      FieldName = 'SAIEST_11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 107
    end
    object ppAnalSintProcppField109: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIEST_12'
      FieldName = 'SAIEST_12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 108
    end
    object ppAnalSintProcppField110: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTACO_01'
      FieldName = 'TOTACO_01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 109
    end
    object ppAnalSintProcppField111: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTACO_02'
      FieldName = 'TOTACO_02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 110
    end
    object ppAnalSintProcppField112: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTACO_03'
      FieldName = 'TOTACO_03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 111
    end
    object ppAnalSintProcppField113: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTACO_04'
      FieldName = 'TOTACO_04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 112
    end
    object ppAnalSintProcppField114: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTACO_05'
      FieldName = 'TOTACO_05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 113
    end
    object ppAnalSintProcppField115: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTACO_06'
      FieldName = 'TOTACO_06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 114
    end
    object ppAnalSintProcppField116: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTACO_07'
      FieldName = 'TOTACO_07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 115
    end
    object ppAnalSintProcppField117: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTACO_08'
      FieldName = 'TOTACO_08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 116
    end
    object ppAnalSintProcppField118: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTACO_09'
      FieldName = 'TOTACO_09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 117
    end
    object ppAnalSintProcppField119: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTACO_10'
      FieldName = 'TOTACO_10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 118
    end
    object ppAnalSintProcppField120: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTACO_11'
      FieldName = 'TOTACO_11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 119
    end
    object ppAnalSintProcppField121: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTACO_12'
      FieldName = 'TOTACO_12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 120
    end
    object ppAnalSintProcppField122: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAACO_01'
      FieldName = 'REAACO_01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 121
    end
    object ppAnalSintProcppField123: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAACO_02'
      FieldName = 'REAACO_02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 122
    end
    object ppAnalSintProcppField124: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAACO_03'
      FieldName = 'REAACO_03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 123
    end
    object ppAnalSintProcppField125: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAACO_04'
      FieldName = 'REAACO_04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 124
    end
    object ppAnalSintProcppField126: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAACO_05'
      FieldName = 'REAACO_05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 125
    end
    object ppAnalSintProcppField127: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAACO_06'
      FieldName = 'REAACO_06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 126
    end
    object ppAnalSintProcppField128: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAACO_07'
      FieldName = 'REAACO_07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 127
    end
    object ppAnalSintProcppField129: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAACO_08'
      FieldName = 'REAACO_08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 128
    end
    object ppAnalSintProcppField130: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAACO_09'
      FieldName = 'REAACO_09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 129
    end
    object ppAnalSintProcppField131: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAACO_10'
      FieldName = 'REAACO_10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 130
    end
    object ppAnalSintProcppField132: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAACO_11'
      FieldName = 'REAACO_11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 131
    end
    object ppAnalSintProcppField133: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAACO_12'
      FieldName = 'REAACO_12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 132
    end
    object ppAnalSintProcppField134: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTDEC_01'
      FieldName = 'TOTDEC_01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 133
    end
    object ppAnalSintProcppField135: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTDEC_02'
      FieldName = 'TOTDEC_02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 134
    end
    object ppAnalSintProcppField136: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTDEC_03'
      FieldName = 'TOTDEC_03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 135
    end
    object ppAnalSintProcppField137: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTDEC_04'
      FieldName = 'TOTDEC_04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 136
    end
    object ppAnalSintProcppField138: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTDEC_05'
      FieldName = 'TOTDEC_05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 137
    end
    object ppAnalSintProcppField139: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTDEC_06'
      FieldName = 'TOTDEC_06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 138
    end
    object ppAnalSintProcppField140: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTDEC_07'
      FieldName = 'TOTDEC_07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 139
    end
    object ppAnalSintProcppField141: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTDEC_08'
      FieldName = 'TOTDEC_08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 140
    end
    object ppAnalSintProcppField142: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTDEC_09'
      FieldName = 'TOTDEC_09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 141
    end
    object ppAnalSintProcppField143: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTDEC_10'
      FieldName = 'TOTDEC_10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 142
    end
    object ppAnalSintProcppField144: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTDEC_11'
      FieldName = 'TOTDEC_11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 143
    end
    object ppAnalSintProcppField145: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTDEC_12'
      FieldName = 'TOTDEC_12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 144
    end
    object ppAnalSintProcppField146: TppField
      Alignment = taRightJustify
      FieldAlias = 'READEC_01'
      FieldName = 'READEC_01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 145
    end
    object ppAnalSintProcppField147: TppField
      Alignment = taRightJustify
      FieldAlias = 'READEC_02'
      FieldName = 'READEC_02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 146
    end
    object ppAnalSintProcppField148: TppField
      Alignment = taRightJustify
      FieldAlias = 'READEC_03'
      FieldName = 'READEC_03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 147
    end
    object ppAnalSintProcppField149: TppField
      Alignment = taRightJustify
      FieldAlias = 'READEC_04'
      FieldName = 'READEC_04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 148
    end
    object ppAnalSintProcppField150: TppField
      Alignment = taRightJustify
      FieldAlias = 'READEC_05'
      FieldName = 'READEC_05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 149
    end
    object ppAnalSintProcppField151: TppField
      Alignment = taRightJustify
      FieldAlias = 'READEC_06'
      FieldName = 'READEC_06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 150
    end
    object ppAnalSintProcppField152: TppField
      Alignment = taRightJustify
      FieldAlias = 'READEC_07'
      FieldName = 'READEC_07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 151
    end
    object ppAnalSintProcppField153: TppField
      Alignment = taRightJustify
      FieldAlias = 'READEC_08'
      FieldName = 'READEC_08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 152
    end
    object ppAnalSintProcppField154: TppField
      Alignment = taRightJustify
      FieldAlias = 'READEC_09'
      FieldName = 'READEC_09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 153
    end
    object ppAnalSintProcppField155: TppField
      Alignment = taRightJustify
      FieldAlias = 'READEC_10'
      FieldName = 'READEC_10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 154
    end
    object ppAnalSintProcppField156: TppField
      Alignment = taRightJustify
      FieldAlias = 'READEC_11'
      FieldName = 'READEC_11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 155
    end
    object ppAnalSintProcppField157: TppField
      Alignment = taRightJustify
      FieldAlias = 'READEC_12'
      FieldName = 'READEC_12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 156
    end
    object ppAnalSintProcppField158: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTOUT_01'
      FieldName = 'TOTOUT_01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 157
    end
    object ppAnalSintProcppField159: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTOUT_02'
      FieldName = 'TOTOUT_02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 158
    end
    object ppAnalSintProcppField160: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTOUT_03'
      FieldName = 'TOTOUT_03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 159
    end
    object ppAnalSintProcppField161: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTOUT_04'
      FieldName = 'TOTOUT_04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 160
    end
    object ppAnalSintProcppField162: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTOUT_05'
      FieldName = 'TOTOUT_05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 161
    end
    object ppAnalSintProcppField163: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTOUT_06'
      FieldName = 'TOTOUT_06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 162
    end
    object ppAnalSintProcppField164: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTOUT_07'
      FieldName = 'TOTOUT_07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 163
    end
    object ppAnalSintProcppField165: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTOUT_08'
      FieldName = 'TOTOUT_08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 164
    end
    object ppAnalSintProcppField166: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTOUT_09'
      FieldName = 'TOTOUT_09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 165
    end
    object ppAnalSintProcppField167: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTOUT_10'
      FieldName = 'TOTOUT_10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 166
    end
    object ppAnalSintProcppField168: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTOUT_11'
      FieldName = 'TOTOUT_11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 167
    end
    object ppAnalSintProcppField169: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTOUT_12'
      FieldName = 'TOTOUT_12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 168
    end
    object ppAnalSintProcppField170: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAOUT_01'
      FieldName = 'REAOUT_01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 169
    end
    object ppAnalSintProcppField171: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAOUT_02'
      FieldName = 'REAOUT_02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 170
    end
    object ppAnalSintProcppField172: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAOUT_03'
      FieldName = 'REAOUT_03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 171
    end
    object ppAnalSintProcppField173: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAOUT_04'
      FieldName = 'REAOUT_04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 172
    end
    object ppAnalSintProcppField174: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAOUT_05'
      FieldName = 'REAOUT_05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 173
    end
    object ppAnalSintProcppField175: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAOUT_06'
      FieldName = 'REAOUT_06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 174
    end
    object ppAnalSintProcppField176: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAOUT_07'
      FieldName = 'REAOUT_07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 175
    end
    object ppAnalSintProcppField177: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAOUT_08'
      FieldName = 'REAOUT_08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 176
    end
    object ppAnalSintProcppField178: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAOUT_09'
      FieldName = 'REAOUT_09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 177
    end
    object ppAnalSintProcppField179: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAOUT_10'
      FieldName = 'REAOUT_10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 178
    end
    object ppAnalSintProcppField180: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAOUT_11'
      FieldName = 'REAOUT_11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 179
    end
    object ppAnalSintProcppField181: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAOUT_12'
      FieldName = 'REAOUT_12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 180
    end
    object ppAnalSintProcppField182: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTREA_01'
      FieldName = 'TOTREA_01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 181
    end
    object ppAnalSintProcppField183: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTREA_02'
      FieldName = 'TOTREA_02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 182
    end
    object ppAnalSintProcppField184: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTREA_03'
      FieldName = 'TOTREA_03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 183
    end
    object ppAnalSintProcppField185: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTREA_04'
      FieldName = 'TOTREA_04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 184
    end
    object ppAnalSintProcppField186: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTREA_05'
      FieldName = 'TOTREA_05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 185
    end
    object ppAnalSintProcppField187: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTREA_06'
      FieldName = 'TOTREA_06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 186
    end
    object ppAnalSintProcppField188: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTREA_07'
      FieldName = 'TOTREA_07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 187
    end
    object ppAnalSintProcppField189: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTREA_08'
      FieldName = 'TOTREA_08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 188
    end
    object ppAnalSintProcppField190: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTREA_09'
      FieldName = 'TOTREA_09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 189
    end
    object ppAnalSintProcppField191: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTREA_10'
      FieldName = 'TOTREA_10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 190
    end
    object ppAnalSintProcppField192: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTREA_11'
      FieldName = 'TOTREA_11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 191
    end
    object ppAnalSintProcppField193: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTREA_12'
      FieldName = 'TOTREA_12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 192
    end
    object ppAnalSintProcppField194: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERMAX_01'
      FieldName = 'PERMAX_01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 193
    end
    object ppAnalSintProcppField195: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERMAX_02'
      FieldName = 'PERMAX_02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 194
    end
    object ppAnalSintProcppField196: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERMAX_03'
      FieldName = 'PERMAX_03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 195
    end
    object ppAnalSintProcppField197: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERMAX_04'
      FieldName = 'PERMAX_04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 196
    end
    object ppAnalSintProcppField198: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERMAX_05'
      FieldName = 'PERMAX_05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 197
    end
    object ppAnalSintProcppField199: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERMAX_06'
      FieldName = 'PERMAX_06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 198
    end
    object ppAnalSintProcppField200: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERMAX_07'
      FieldName = 'PERMAX_07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 199
    end
    object ppAnalSintProcppField201: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERMAX_08'
      FieldName = 'PERMAX_08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 200
    end
    object ppAnalSintProcppField202: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERMAX_09'
      FieldName = 'PERMAX_09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 201
    end
    object ppAnalSintProcppField203: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERMAX_10'
      FieldName = 'PERMAX_10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 202
    end
    object ppAnalSintProcppField204: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERMAX_11'
      FieldName = 'PERMAX_11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 203
    end
    object ppAnalSintProcppField205: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERMAX_12'
      FieldName = 'PERMAX_12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 204
    end
    object ppAnalSintProcppField206: TppField
      Alignment = taRightJustify
      FieldAlias = 'PEREST_01'
      FieldName = 'PEREST_01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 205
    end
    object ppAnalSintProcppField207: TppField
      Alignment = taRightJustify
      FieldAlias = 'PEREST_02'
      FieldName = 'PEREST_02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 206
    end
    object ppAnalSintProcppField208: TppField
      Alignment = taRightJustify
      FieldAlias = 'PEREST_03'
      FieldName = 'PEREST_03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 207
    end
    object ppAnalSintProcppField209: TppField
      Alignment = taRightJustify
      FieldAlias = 'PEREST_04'
      FieldName = 'PEREST_04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 208
    end
    object ppAnalSintProcppField210: TppField
      Alignment = taRightJustify
      FieldAlias = 'PEREST_05'
      FieldName = 'PEREST_05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 209
    end
    object ppAnalSintProcppField211: TppField
      Alignment = taRightJustify
      FieldAlias = 'PEREST_06'
      FieldName = 'PEREST_06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 210
    end
    object ppAnalSintProcppField212: TppField
      Alignment = taRightJustify
      FieldAlias = 'PEREST_07'
      FieldName = 'PEREST_07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 211
    end
    object ppAnalSintProcppField213: TppField
      Alignment = taRightJustify
      FieldAlias = 'PEREST_08'
      FieldName = 'PEREST_08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 212
    end
    object ppAnalSintProcppField214: TppField
      Alignment = taRightJustify
      FieldAlias = 'PEREST_09'
      FieldName = 'PEREST_09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 213
    end
    object ppAnalSintProcppField215: TppField
      Alignment = taRightJustify
      FieldAlias = 'PEREST_10'
      FieldName = 'PEREST_10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 214
    end
    object ppAnalSintProcppField216: TppField
      Alignment = taRightJustify
      FieldAlias = 'PEREST_11'
      FieldName = 'PEREST_11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 215
    end
    object ppAnalSintProcppField217: TppField
      Alignment = taRightJustify
      FieldAlias = 'PEREST_12'
      FieldName = 'PEREST_12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 216
    end
    object ppAnalSintProcppField218: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTENTT'
      FieldName = 'TOTENTT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 217
    end
    object ppAnalSintProcppField219: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTMAXT'
      FieldName = 'ENTMAXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 218
    end
    object ppAnalSintProcppField220: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTESTT'
      FieldName = 'ENTESTT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 219
    end
    object ppAnalSintProcppField221: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTSAIT'
      FieldName = 'TOTSAIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 220
    end
    object ppAnalSintProcppField222: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIMAXT'
      FieldName = 'SAIMAXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 221
    end
    object ppAnalSintProcppField223: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIESTT'
      FieldName = 'SAIESTT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 222
    end
    object ppAnalSintProcppField224: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTACOT'
      FieldName = 'TOTACOT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 223
    end
    object ppAnalSintProcppField225: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAACOT'
      FieldName = 'REAACOT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 224
    end
    object ppAnalSintProcppField226: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTDECT'
      FieldName = 'TOTDECT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 225
    end
    object ppAnalSintProcppField227: TppField
      Alignment = taRightJustify
      FieldAlias = 'READECT'
      FieldName = 'READECT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 226
    end
    object ppAnalSintProcppField228: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTOUTT'
      FieldName = 'TOTOUTT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 227
    end
    object ppAnalSintProcppField229: TppField
      Alignment = taRightJustify
      FieldAlias = 'REAOUTT'
      FieldName = 'REAOUTT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 228
    end
    object ppAnalSintProcppField230: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTREAT'
      FieldName = 'TOTREAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 229
    end
    object ppAnalSintProcppField231: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERMAXT'
      FieldName = 'PERMAXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 230
    end
    object ppAnalSintProcppField232: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERESTT'
      FieldName = 'PERESTT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 231
    end
  end
  object dsAnalSintProc: TwwDataSource
    DataSet = qryAnalSintProc
    Left = 98
    Top = 182
  end
  object qryAnalSintProc: TwwQuery
    CachedUpdates = True
    AfterScroll = qryProcTrabAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA,'
      '  '
      
        '  0 AS TotProc_01, 0 AS TotProc_02, 0 AS TotProc_03, 0 AS TotPro' +
        'c_04, 0 AS TotProc_05,'
      
        '  0 AS TotProc_06, 0 AS TotProc_07, 0 AS TotProc_08, 0 AS TotPro' +
        'c_09, 0 AS TotProc_10,'
      '  0 AS TotProc_11, 0 AS TotProc_12,'
      
        '  0 AS TotMax_01, 0 AS TotMax_02, 0 AS TotMax_03, 0 AS TotMax_04' +
        ', 0 AS TotMax_05,'
      
        '  0 AS TotMax_06, 0 AS TotMax_07, 0 AS TotMax_08, 0 AS TotMax_09' +
        ', 0 AS TotMax_10,'
      '  0 AS TotMax_11, 0 AS TotMax_12,'
      
        '  0 AS TotEst_01, 0 AS TotEst_02, 0 AS TotEst_03, 0 AS TotEst_04' +
        ', 0 AS TotEst_05,'
      
        '  0 AS TotEst_06, 0 AS TotEst_07, 0 AS TotEst_08, 0 AS TotEst_09' +
        ', 0 AS TotEst_10,'
      '  0 AS TotEst_11, 0 AS TotEst_12,'
      ''
      
        '  0 AS TotEnt_01, 0 AS TotEnt_02, 0 AS TotEnt_03, 0 AS TotEnt_04' +
        ', 0 AS TotEnt_05,'
      
        '  0 AS TotEnt_06, 0 AS TotEnt_07, 0 AS TotEnt_08, 0 AS TotEnt_09' +
        ', 0 AS TotEnt_10,'
      '  0 AS TotEnt_11, 0 AS TotEnt_12,'
      
        '  0 AS EntMax_01, 0 AS EntMax_02, 0 AS EntMax_03, 0 AS EntMax_04' +
        ', 0 AS EntMax_05,'
      
        '  0 AS EntMax_06, 0 AS EntMax_07, 0 AS EntMax_08, 0 AS EntMax_09' +
        ', 0 AS EntMax_10,'
      '  0 AS EntMax_11, 0 AS EntMax_12,'
      
        '  0 AS EntEst_01, 0 AS EntEst_02, 0 AS EntEst_03, 0 AS EntEst_04' +
        ', 0 AS EntEst_05,'
      
        '  0 AS EntEst_06, 0 AS EntEst_07, 0 AS EntEst_08, 0 AS EntEst_09' +
        ', 0 AS EntEst_10,'
      '  0 AS EntEst_11, 0 AS EntEst_12,'
      ''
      
        '  0 AS TotSai_01, 0 AS TotSai_02, 0 AS TotSai_03, 0 AS TotSai_04' +
        ', 0 AS TotSai_05,'
      
        '  0 AS TotSai_06, 0 AS TotSai_07, 0 AS TotSai_08, 0 AS TotSai_09' +
        ', 0 AS TotSai_10,'
      '  0 AS TotSai_11, 0 AS TotSai_12,'
      
        '  0 AS SaiMax_01, 0 AS SaiMax_02, 0 AS SaiMax_03, 0 AS SaiMax_04' +
        ', 0 AS SaiMax_05,'
      
        '  0 AS SaiMax_06, 0 AS SaiMax_07, 0 AS SaiMax_08, 0 AS SaiMax_09' +
        ', 0 AS SaiMax_10,'
      '  0 AS SaiMax_11, 0 AS SaiMax_12,'
      
        '  0 AS SaiEst_01, 0 AS SaiEst_02, 0 AS SaiEst_03, 0 AS SaiEst_04' +
        ', 0 AS SaiEst_05,'
      
        '  0 AS SaiEst_06, 0 AS SaiEst_07, 0 AS SaiEst_08, 0 AS SaiEst_09' +
        ', 0 AS SaiEst_10,'
      '  0 AS SaiEst_11, 0 AS SaiEst_12,'
      ''
      
        '  0 AS TotAco_01, 0 AS TotAco_02, 0 AS TotAco_03, 0 AS TotAco_04' +
        ', 0 AS TotAco_05,'
      
        '  0 AS TotAco_06, 0 AS TotAco_07, 0 AS TotAco_08, 0 AS TotAco_09' +
        ', 0 AS TotAco_10,'
      '  0 AS TotAco_11, 0 AS TotAco_12,'
      
        '  0 AS ReaAco_01, 0 AS ReaAco_02, 0 AS ReaAco_03, 0 AS ReaAco_04' +
        ', 0 AS ReaAco_05,'
      
        '  0 AS ReaAco_06, 0 AS ReaAco_07, 0 AS ReaAco_08, 0 AS ReaAco_09' +
        ', 0 AS ReaAco_10,'
      '  0 AS ReaAco_11, 0 AS ReaAco_12,'
      ''
      
        '  0 AS TotDec_01, 0 AS TotDec_02, 0 AS TotDec_03, 0 AS TotDec_04' +
        ', 0 AS TotDec_05,'
      
        '  0 AS TotDec_06, 0 AS TotDec_07, 0 AS TotDec_08, 0 AS TotDec_09' +
        ', 0 AS TotDec_10,'
      '  0 AS TotDec_11, 0 AS TotDec_12,'
      
        '  0 AS ReaDec_01, 0 AS ReaDec_02, 0 AS ReaDec_03, 0 AS ReaDec_04' +
        ', 0 AS ReaDec_05,'
      
        '  0 AS ReaDec_06, 0 AS ReaDec_07, 0 AS ReaDec_08, 0 AS ReaDec_09' +
        ', 0 AS ReaDec_10,'
      '  0 AS ReaDec_11, 0 AS ReaDec_12,'
      ''
      
        '  0 AS TotOut_01, 0 AS TotOut_02, 0 AS TotOut_03, 0 AS TotOut_04' +
        ', 0 AS TotOut_05,'
      
        '  0 AS TotOut_06, 0 AS TotOut_07, 0 AS TotOut_08, 0 AS TotOut_09' +
        ', 0 AS TotOut_10,'
      '  0 AS TotOut_11, 0 AS TotOut_12,'
      
        '  0 AS ReaOut_01, 0 AS ReaOut_02, 0 AS ReaOut_03, 0 AS ReaOut_04' +
        ', 0 AS ReaOut_05,'
      
        '  0 AS ReaOut_06, 0 AS ReaOut_07, 0 AS ReaOut_08, 0 AS ReaOut_09' +
        ', 0 AS ReaOut_10,'
      '  0 AS ReaOut_11, 0 AS ReaOut_12,'
      ''
      
        '  0 AS TotRea_01, 0 AS TotRea_02, 0 AS TotRea_03, 0 AS TotRea_04' +
        ', 0 AS TotRea_05,'
      
        '  0 AS TotRea_06, 0 AS TotRea_07, 0 AS TotRea_08, 0 AS TotRea_09' +
        ', 0 AS TotRea_10,'
      '  0 AS TotRea_11, 0 AS TotRea_12,'
      ''
      
        '  0 AS PerMax_01, 0 AS PerMax_02, 0 AS PerMax_03, 0 AS PerMax_04' +
        ', 0 AS PerMax_05,'
      
        '  0 AS PerMax_06, 0 AS PerMax_07, 0 AS PerMax_08, 0 AS PerMax_09' +
        ', 0 AS PerMax_10,'
      '  0 AS PerMax_11, 0 AS PerMax_12,'
      ''
      
        '  0 AS PerEst_01, 0 AS PerEst_02, 0 AS PerEst_03, 0 AS PerEst_04' +
        ', 0 AS PerEst_05,'
      
        '  0 AS PerEst_06, 0 AS PerEst_07, 0 AS PerEst_08, 0 AS PerEst_09' +
        ', 0 AS PerEst_10,'
      '  0 AS PerEst_11, 0 AS PerEst_12,'
      ''
      '  0 AS TotEntT, 0 AS EntMaxT, 0 AS EntEstT,'
      '  0 AS TotSaiT, 0 AS SaiMaxT, 0 AS SaiEstT,'
      '  0 AS TotAcoT, 0 AS ReaAcoT,'
      '  0 AS TotDecT, 0 AS ReaDecT,'
      '  0 AS TotOutT, 0 AS ReaOutT,'
      '  0 AS TotReaT, 0 AS PerMaxT, 0 AS PerEstT'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      ' ')
    ValidateWithMask = True
    Left = 98
    Top = 168
  end
  object updSQL: TUpdateSQL
    Left = 242
    Top = 163
  end
  object updProcTrab: TUpdateSQL
    Left = 98
    Top = 27
  end
end
