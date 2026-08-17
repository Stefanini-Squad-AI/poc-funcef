inherited RptReqPessoal: TRptReqPessoal
  Left = 245
  Top = 200
  Width = 278
  Height = 267
  Caption = 'RptReqPessoal'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpReqPessoal
    ConnectionType = cntBDE
  end
  object ppReqPessoal: TppBDEPipeline
    DataSource = dsReqPessoal
    CloseDataSource = True
    UserName = 'ReqPessoal'
    Left = 210
    Top = 48
  end
  object dsReqPessoal: TwwDataSource
    DataSet = CdsReqPessoal
    Left = 210
    Top = 96
  end
  object rpReqPessoal: TppReport
    AutoStop = False
    DataPipeline = ppReqPessoal
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Requisição de Pessoal'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    CachePages = True
    DeviceType = 'Screen'
    Left = 210
    Version = '5.5'
    mmColumnWidth = 197300
    object rpReqPessoalHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object rpReqPessoalLbl2: TppLabel
        UserName = 'rpReqPessoalLbl2'
        AutoSize = False
        Caption = 'Requisição de Pessoal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 47625
        mmTop = 9260
        mmWidth = 102129
        BandType = 0
      end
      object rpReqPessoalLbl1: TppLabel
        UserName = 'rpReqPessoalLbl1'
        AutoSize = False
        Caption = 'rpReqPessoalLbl1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6350
        mmLeft = 47625
        mmTop = 1588
        mmWidth = 102129
        BandType = 0
      end
    end
    object rpReqPessoalDtlBnd: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 72231
      mmPrintPosition = 0
      object rpReqPessoalShp1: TppShape
        UserName = 'rpReqPessoalShp1'
        mmHeight = 34660
        mmLeft = 529
        mmTop = 794
        mmWidth = 196321
        BandType = 4
      end
      object rpReqPessoalLbl3: TppLabel
        UserName = 'rpReqPessoalLbl3'
        AutoSize = False
        Caption = 'Número:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 1588
        mmTop = 2910
        mmWidth = 14817
        BandType = 4
      end
      object rpReqPessoalDBTxt1: TppDBText
        UserName = 'rpReqPessoalDBTxt1'
        DataField = 'NUMREQ'
        DataPipeline = ppReqPessoal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 17198
        mmTop = 2910
        mmWidth = 43921
        BandType = 4
      end
      object rpReqPessoalLbl4: TppLabel
        UserName = 'rpReqPessoalLbl4'
        AutoSize = False
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 63236
        mmTop = 2910
        mmWidth = 16404
        BandType = 4
      end
      object rpReqPessoalDBTxt2: TppDBText
        UserName = 'rpReqPessoalDBTxt2'
        DataField = 'DATAREQ'
        DataPipeline = ppReqPessoal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 80433
        mmTop = 2910
        mmWidth = 19315
        BandType = 4
      end
      object rpReqPessoalLbl5: TppLabel
        UserName = 'rpReqPessoalLbl5'
        AutoSize = False
        Caption = 'Admissão Prev.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 101600
        mmTop = 2910
        mmWidth = 29369
        BandType = 4
      end
      object rpReqPessoalDBTxt3: TppDBText
        UserName = 'rpReqPessoalDBTxt3'
        DataField = 'DATAPLAN'
        DataPipeline = ppReqPessoal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 131763
        mmTop = 2910
        mmWidth = 64029
        BandType = 4
      end
      object rpReqPessoalLbl6: TppLabel
        UserName = 'rpReqPessoalLbl6'
        AutoSize = False
        Caption = 'Tipo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 1588
        mmTop = 9525
        mmWidth = 14817
        BandType = 4
      end
      object rpReqPessoalDBTxt4: TppDBText
        UserName = 'rpReqPessoalDBTxt4'
        DataField = 'NOMETIPOREQ'
        DataPipeline = ppReqPessoal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 17198
        mmTop = 9525
        mmWidth = 43921
        BandType = 4
      end
      object rpReqPessoalLbl7: TppLabel
        UserName = 'rpReqPessoalLbl7'
        AutoSize = False
        Caption = 'Situação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 63236
        mmTop = 9525
        mmWidth = 16404
        BandType = 4
      end
      object rpReqPessoalDBTxt5: TppDBText
        UserName = 'rpReqPessoalDBTxt5'
        DataField = 'SITUACAO'
        DataPipeline = ppReqPessoal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 80433
        mmTop = 9525
        mmWidth = 19315
        BandType = 4
      end
      object rpReqPessoalLbl8: TppLabel
        UserName = 'rpReqPessoalLbl8'
        AutoSize = False
        Caption = 'Objetivo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 101600
        mmTop = 9525
        mmWidth = 29369
        BandType = 4
      end
      object rpReqPessoalDBTxt6: TppDBText
        UserName = 'rpReqPessoalDBTxt6'
        DataField = 'NOMETIPOCONTRATO'
        DataPipeline = ppReqPessoal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 131763
        mmTop = 9525
        mmWidth = 64029
        BandType = 4
      end
      object rpReqPessoalLbl12: TppLabel
        UserName = 'rpReqPessoalLbl12'
        AutoSize = False
        Caption = 'Cargo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 1588
        mmTop = 22754
        mmWidth = 14817
        BandType = 4
      end
      object rpReqPessoalDBTxt10: TppDBText
        UserName = 'rpReqPessoalDBTxt10'
        DataField = 'CARGO'
        DataPipeline = ppReqPessoal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 17198
        mmTop = 22754
        mmWidth = 82550
        BandType = 4
      end
      object rpReqPessoalLbl13: TppLabel
        UserName = 'rpReqPessoalLbl13'
        AutoSize = False
        Caption = 'Centro de Custo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 101600
        mmTop = 22754
        mmWidth = 29369
        BandType = 4
      end
      object rpReqPessoalDBTxt11: TppDBText
        UserName = 'rpReqPessoalDBTxt11'
        DataField = 'NOMECENTROCUSTO'
        DataPipeline = ppReqPessoal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 131763
        mmTop = 22754
        mmWidth = 64029
        BandType = 4
      end
      object rpReqPessoalLbl11: TppLabel
        UserName = 'rpReqPessoalLbl11'
        AutoSize = False
        Caption = 'Estabelecimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 101600
        mmTop = 16140
        mmWidth = 29369
        BandType = 4
      end
      object rpReqPessoalDBTxt9: TppDBText
        UserName = 'rpReqPessoalDBTxt9'
        DataField = 'ESTABABELECIMENTO'
        DataPipeline = ppReqPessoal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 131763
        mmTop = 16140
        mmWidth = 64029
        BandType = 4
      end
      object rpReqPessoalLbl9: TppLabel
        UserName = 'rpReqPessoalLbl9'
        AutoSize = False
        Caption = 'Gr.Instr:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 1588
        mmTop = 16140
        mmWidth = 14817
        BandType = 4
      end
      object rpReqPessoalDBTxt7: TppDBText
        UserName = 'rpReqPessoalDBTxt7'
        DataField = 'GRAUINSTRUCAO'
        DataPipeline = ppReqPessoal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 17198
        mmTop = 16140
        mmWidth = 43921
        BandType = 4
      end
      object rpReqPessoalLbl10: TppLabel
        UserName = 'rpReqPessoalLbl10'
        AutoSize = False
        Caption = 'Sexo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 63236
        mmTop = 16140
        mmWidth = 16404
        BandType = 4
      end
      object rpReqPessoalDBTxt8: TppDBText
        UserName = 'rpReqPessoalDBTxt8'
        DataField = 'SEXO'
        DataPipeline = ppReqPessoal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 80433
        mmTop = 16140
        mmWidth = 19315
        BandType = 4
      end
      object rpReqPessoalLine3: TppLine
        UserName = 'rpReqPessoalLine3'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 794
        mmTop = 7673
        mmWidth = 195792
        BandType = 4
      end
      object rpReqPessoalLine4: TppLine
        UserName = 'rpReqPessoalLine4'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 794
        mmTop = 14288
        mmWidth = 195792
        BandType = 4
      end
      object rpReqPessoalLine5: TppLine
        UserName = 'rpReqPessoalLine5'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 794
        mmTop = 20902
        mmWidth = 195792
        BandType = 4
      end
      object rpReqPessoalLine2: TppLine
        UserName = 'rpReqPessoalLine2'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 34396
        mmLeft = 100542
        mmTop = 794
        mmWidth = 1323
        BandType = 4
      end
      object rpReqPessoalLine1: TppLine
        UserName = 'rpReqPessoalLine1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 19844
        mmLeft = 61913
        mmTop = 1058
        mmWidth = 1323
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 529
        mmTop = 28046
        mmWidth = 195792
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Resp.RH'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 1588
        mmTop = 29104
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'rpReqPessoalDBTxt101'
        DataField = 'RESPONSAVEL'
        DataPipeline = ppReqPessoal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 17198
        mmTop = 29104
        mmWidth = 82550
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Supervisor Imed:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 101600
        mmTop = 29104
        mmWidth = 29369
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'SUPERVISOR'
        DataPipeline = ppReqPessoal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 131498
        mmTop = 29104
        mmWidth = 64029
        BandType = 4
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 38894
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppReqPessoal
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Requisição de Pessoal'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 128
          Top = 112
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 6085
            mmPrintPosition = 0
            object rpReqPessoalLbl14: TppLabel
              UserName = 'rpReqPessoalLbl14'
              AutoSize = False
              Caption = 'Características Pessoais'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 5292
              mmTop = 1588
              mmWidth = 41804
              BandType = 1
            end
          end
          object ppDetailBand1: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 7408
            mmPrintPosition = 0
            object rpReqPessoalDBMemo1: TppDBMemo
              UserName = 'rpReqPessoalDBMemo1'
              CharWrap = False
              DataField = 'OBSERV'
              DataPipeline = ppReqPessoal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Stretch = True
              Transparent = True
              mmHeight = 6615
              mmLeft = 5027
              mmTop = 529
              mmWidth = 191030
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 2117
            mmPrintPosition = 0
          end
        end
      end
      object ppSubReport2: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = ppSubReport1
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 46038
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppReqPessoal
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Requisição de Pessoal'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
          Top = 152
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 6615
            mmPrintPosition = 0
            object rpReqPessoalLbl15: TppLabel
              UserName = 'rpReqPessoalLbl15'
              Caption = 'Formação e Especializações'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 4763
              mmTop = 2381
              mmWidth = 47625
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 7144
            mmPrintPosition = 0
            object rpReqPessoalDBMemo2: TppDBMemo
              UserName = 'rpReqPessoalDBMemo2'
              CharWrap = False
              DataField = 'OBSERV4'
              DataPipeline = ppReqPessoal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Stretch = True
              Transparent = True
              mmHeight = 6350
              mmLeft = 4498
              mmTop = 265
              mmWidth = 191030
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 2117
            mmPrintPosition = 0
          end
        end
      end
      object ppSubReport3: TppSubReport
        UserName = 'SubReport3'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = ppSubReport2
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 52652
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = ppReqPessoal
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Requisição de Pessoal'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 208
          Top = 192
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object rpReqPessoalLbl16: TppLabel
              UserName = 'rpReqPessoalLbl16'
              Caption = 'Conhecimentos Necessários'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 4763
              mmTop = 1588
              mmWidth = 48154
              BandType = 1
            end
          end
          object ppDetailBand3: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 8202
            mmPrintPosition = 0
            object rpReqPessoalDBMemo3: TppDBMemo
              UserName = 'rpReqPessoalDBMemo3'
              CharWrap = False
              DataField = 'OBSERV2'
              DataPipeline = ppReqPessoal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Stretch = True
              Transparent = True
              mmHeight = 7144
              mmLeft = 4763
              mmTop = 529
              mmWidth = 191030
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 2381
            mmPrintPosition = 0
          end
        end
      end
      object ppSubReport4: TppSubReport
        UserName = 'SubReport4'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = ppSubReport3
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 59267
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport4: TppChildReport
          AutoStop = False
          DataPipeline = ppReqPessoal
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Requisição de Pessoal'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
          Top = 152
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand4: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 6615
            mmPrintPosition = 0
            object ppLabel4: TppLabel
              UserName = 'rpReqPessoalLbl15'
              Caption = 'Conhecimentos Desejáveis'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 4763
              mmTop = 2381
              mmWidth = 45508
              BandType = 1
            end
          end
          object ppDetailBand4: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 7144
            mmPrintPosition = 0
            object ppDBMemo1: TppDBMemo
              UserName = 'rpReqPessoalDBMemo2'
              CharWrap = False
              DataField = 'OBSERV3'
              DataPipeline = ppReqPessoal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Stretch = True
              Transparent = True
              mmHeight = 6350
              mmLeft = 4498
              mmTop = 265
              mmWidth = 191030
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
          end
          object ppSummaryBand4: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 2117
            mmPrintPosition = 0
          end
        end
      end
      object ppSubReport5: TppSubReport
        UserName = 'SubReport5'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = ppSubReport4
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 65881
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport5: TppChildReport
          AutoStop = False
          DataPipeline = ppReqPessoal
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Requisição de Pessoal'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 208
          Top = 192
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand5: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object ppLabel5: TppLabel
              UserName = 'rpReqPessoalLbl16'
              Caption = 'Principais Atividades'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 4763
              mmTop = 1588
              mmWidth = 35454
              BandType = 1
            end
          end
          object ppDetailBand5: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 8202
            mmPrintPosition = 0
            object ppDBMemo2: TppDBMemo
              UserName = 'rpReqPessoalDBMemo3'
              CharWrap = False
              DataField = 'OBSERV5'
              DataPipeline = ppReqPessoal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Stretch = True
              Transparent = True
              mmHeight = 7144
              mmLeft = 4763
              mmTop = 529
              mmWidth = 191030
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
          end
          object ppSummaryBand5: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 2381
            mmPrintPosition = 0
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object rpReqPessoalLine6: TppLine
        UserName = 'rpReqPessoalLine6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel3: TppLabel
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
  end
  object sqlReqPessoal: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPRESA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ENTIDADE,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPREGADO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS IDENT,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS INSTRUTOR,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS DESCRICAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CARGO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS LOCAL,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ENDSETOR,'
      '  '#39'1234567890'#39' AS DATAINI,'
      '  '#39'1234567890'#39' AS DATAFIM'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    ClientDataSet = CdsReqPessoal
    Left = 210
    Top = 192
  end
  object CdsReqPessoal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 210
    Top = 144
  end
end
