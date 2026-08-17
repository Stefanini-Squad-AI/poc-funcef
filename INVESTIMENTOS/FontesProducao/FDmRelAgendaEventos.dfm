inherited dmRelAgendaEventos: TdmRelAgendaEventos
  Left = 365
  Top = 196
  Width = 278
  Height = 267
  Caption = 'dmRelAgendaEventos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 41
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
    Left = 41
    Top = 8
  end
  inherited qryExemplo: TwwQuery
    Left = 41
    Top = 8
  end
  inherited rpExemplo: TppReport
    Left = 41
    Top = 8
    DataPipelineName = 'pplExemplo'
    inherited HeaderBand1: TppHeaderBand
      mmHeight = 23019
      inherited ppLCarteiraEx: TppLabel [0]
        mmTop = 14023
      end
      inherited ppDbLogo: TppDBImage [1]
      end
      inherited ppLPeriodo: TppLabel [2]
      end
      inherited Label11: TppLabel [3]
        mmLeft = 25400
      end
      inherited Line1: TppLine [4]
        mmTop = 22225
      end
      inherited LblEmpresa: TppLabel [5]
        mmLeft = 25400
      end
    end
  end
  object pprAgendaEventos: TppReport
    AutoStop = False
    DataPipeline = pplAgendaEventos
    OnStartPage = pprAgendaEventosStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Agenda de Eventos'
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
    Left = 170
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplAgendaEventos'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17992
      mmPrintPosition = 0
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Agenda de Eventos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8731
        mmWidth = 32808
        BandType = 0
      end
      object ppLabel13: TppLabel
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
        mmLeft = 24871
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'LCarteira1'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 182827
        mmTop = 13758
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'LPeriodo1'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 13758
        mmWidth = 10848
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
    end
    object ppbDetalhePrincipal: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object srptBMF: TppSubReport
        UserName = 'srptBMF'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplAgendaEventosDet'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppcrBMF: TppChildReport
          AutoStop = False
          DataPipeline = pplAgendaEventosDet
          OnStartPage = ppcrBMFStartPage
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Agenda de Eventos'
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
          Left = 336
          Top = 352
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplAgendaEventosDet'
          object pphCabBMF: TppHeaderBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object shpCabBMF: TppShape
              UserName = 'shpCabBMF'
              Brush.Color = clSilver
              ParentWidth = True
              mmHeight = 4234
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 0
            end
            object ppLabel11: TppLabel
              UserName = 'Label1'
              Caption = 'Investimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 106627
              mmTop = 529
              mmWidth = 17198
              BandType = 0
            end
            object ppLabel12: TppLabel
              UserName = 'Label2'
              Caption = 'Tipo de Título'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 48154
              mmTop = 529
              mmWidth = 18256
              BandType = 0
            end
            object ppLabel14: TppLabel
              UserName = 'Label4'
              Caption = 'Vencimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 794
              mmTop = 529
              mmWidth = 15610
              BandType = 0
            end
            object ppLabel16: TppLabel
              UserName = 'Label16'
              Caption = 'Preço Exercício'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 175948
              mmTop = 529
              mmWidth = 20638
              BandType = 0
            end
          end
          object ppDetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object shpDetBMF: TppShape
              OnPrint = shpDetBMFPrint
              UserName = 'shpDetBMF'
              ParentWidth = True
              Pen.Style = psClear
              mmHeight = 3703
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'DBText9'
              DataField = 'VENCIMENTO'
              DataPipeline = pplAgendaEventosDet
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 529
              mmTop = 265
              mmWidth = 18256
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              DataField = 'PU'
              DataPipeline = pplAgendaEventosDet
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 169069
              mmTop = 265
              mmWidth = 27781
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              DataField = 'TIPOTITULO'
              DataPipeline = pplAgendaEventosDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 48419
              mmTop = 265
              mmWidth = 24342
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'DBText13'
              DataField = 'INVESTIMENTO'
              DataPipeline = pplAgendaEventosDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 106892
              mmTop = 265
              mmWidth = 45508
              BandType = 4
            end
          end
          object ppRPBMF: TppFooterBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
          end
        end
      end
      object srptRendaFixa: TppSubReport
        UserName = 'srptRendaFixa'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplAgendaEventosDet'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object crpRendaFixa: TppChildReport
          AutoStop = False
          DataPipeline = pplAgendaEventosDet
          OnStartPage = crpRendaFixaStartPage
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Agenda de Eventos'
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
          DataPipelineName = 'pplAgendaEventosDet'
          object pphCabRF: TppHeaderBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object shpCabRendaFixa: TppShape
              UserName = 'shpCabRendaFixa'
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
              Caption = 'Vencimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 1588
              mmTop = 529
              mmWidth = 15610
              BandType = 0
            end
            object ppLabel18: TppLabel
              UserName = 'Label18'
              Caption = 'Operação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3175
              mmLeft = 183357
              mmTop = 529
              mmWidth = 12700
              BandType = 0
            end
            object ppLabel28: TppLabel
              UserName = 'Label28'
              Caption = 'Tipo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 21431
              mmTop = 529
              mmWidth = 5821
              BandType = 0
            end
            object ppLabel29: TppLabel
              UserName = 'Label29'
              Caption = 'Perfil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 43921
              mmTop = 529
              mmWidth = 6879
              BandType = 0
            end
            object ppLabel30: TppLabel
              UserName = 'Label30'
              Caption = 'Investimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 91017
              mmTop = 529
              mmWidth = 17198
              BandType = 0
            end
            object ppLabel31: TppLabel
              UserName = 'Label31'
              Caption = 'Item'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 127794
              mmTop = 529
              mmWidth = 5556
              BandType = 0
            end
            object ppLabel33: TppLabel
              UserName = 'Label33'
              Caption = 'Emissão'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3175
              mmLeft = 164307
              mmTop = 529
              mmWidth = 11377
              BandType = 0
            end
          end
          object ppDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object shpDetRF: TppShape
              OnPrint = shpDetRFPrint
              UserName = 'shpDetRF'
              ParentWidth = True
              Pen.Style = psClear
              mmHeight = 3704
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              DataField = 'INVESTIMENTO'
              DataPipeline = pplAgendaEventosDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 90752
              mmTop = 265
              mmWidth = 35719
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              DataField = 'DATAEMISSAO'
              DataPipeline = pplAgendaEventosDet
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 162719
              mmTop = 265
              mmWidth = 15346
              BandType = 4
            end
            object ppDBText26: TppDBText
              UserName = 'DBText26'
              DataField = 'VENCIMENTO'
              DataPipeline = pplAgendaEventosDet
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 2646
              mmTop = 265
              mmWidth = 14817
              BandType = 4
            end
            object ppDBText27: TppDBText
              UserName = 'DBText27'
              DataField = 'TITULO'
              DataPipeline = pplAgendaEventosDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 21167
              mmTop = 265
              mmWidth = 19844
              BandType = 4
            end
            object ppDBText28: TppDBText
              UserName = 'DBText28'
              DataField = 'PERFIL'
              DataPipeline = pplAgendaEventosDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 43656
              mmTop = 265
              mmWidth = 46038
              BandType = 4
            end
            object ppDBText29: TppDBText
              UserName = 'DBText29'
              DataField = 'ITEM'
              DataPipeline = pplAgendaEventosDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 127529
              mmTop = 265
              mmWidth = 33602
              BandType = 4
            end
            object ppDBText30: TppDBText
              UserName = 'DBText30'
              DataField = 'DATAOPERACAO'
              DataPipeline = pplAgendaEventosDet
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 182298
              mmTop = 265
              mmWidth = 14817
              BandType = 4
            end
          end
          object ppRPRF: TppFooterBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
          end
        end
      end
      object srptEmprestimo: TppSubReport
        UserName = 'srptEmprestimo'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplAgendaEventosDet'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object crpEmprestimo: TppChildReport
          AutoStop = False
          DataPipeline = pplAgendaEventosDet
          OnStartPage = crpRendaFixaStartPage
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Agenda de Eventos'
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
          DataPipelineName = 'pplAgendaEventosDet'
          object pphCabEMP: TppHeaderBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object shpCabEmprestimo: TppShape
              UserName = 'shpCabEmprestimo'
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
              Caption = 'Vencimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 1058
              mmTop = 529
              mmWidth = 15610
              BandType = 0
            end
            object ppLabel4: TppLabel
              UserName = 'Label1'
              Caption = 'Tipo de Inv.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 23548
              mmTop = 529
              mmWidth = 15610
              BandType = 0
            end
            object ppLabel19: TppLabel
              UserName = 'Label19'
              Caption = 'Investimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 54240
              mmTop = 529
              mmWidth = 17198
              BandType = 0
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              Caption = 'Quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 101600
              mmTop = 529
              mmWidth = 15081
              BandType = 0
            end
            object ppLabel21: TppLabel
              UserName = 'Label21'
              Caption = 'Preço'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 131763
              mmTop = 529
              mmWidth = 7673
              BandType = 0
            end
            object ppLabel22: TppLabel
              UserName = 'Label22'
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 158221
              mmTop = 529
              mmWidth = 6879
              BandType = 0
            end
            object ppLabel25: TppLabel
              UserName = 'Label25'
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 175948
              mmTop = 529
              mmWidth = 2117
              BandType = 0
            end
            object ppLabel26: TppLabel
              UserName = 'Label26'
              Caption = 'Operação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 184150
              mmTop = 529
              mmWidth = 12700
              BandType = 0
            end
          end
          object ppDetailBand6: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object shpDetEMP: TppShape
              OnPrint = shpDetRFPrint
              UserName = 'shpDetEMP'
              ParentWidth = True
              Pen.Style = psClear
              mmHeight = 3703
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 4
            end
            object ppDBText1: TppDBText
              UserName = 'DBText1'
              DataField = 'VENCIMENTO'
              DataPipeline = pplAgendaEventosDet
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 1323
              mmTop = 265
              mmWidth = 14817
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              DataField = 'PERFIL'
              DataPipeline = pplAgendaEventosDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 23283
              mmTop = 265
              mmWidth = 26723
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              DataField = 'INVESTIMENTO'
              DataPipeline = pplAgendaEventosDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 53975
              mmTop = 265
              mmWidth = 38100
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText19'
              DataField = 'QTDOPERACAO'
              DataPipeline = pplAgendaEventosDet
              DisplayFormat = '###,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 96573
              mmTop = 265
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              DataField = 'PU'
              DataPipeline = pplAgendaEventosDet
              DisplayFormat = '###,###,##0.00000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 119327
              mmTop = 265
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              DataField = 'VLROPERACAO'
              DataPipeline = pplAgendaEventosDet
              DisplayFormat = '###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 140759
              mmTop = 265
              mmWidth = 24606
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              DataField = 'PERCENTUAL'
              DataPipeline = pplAgendaEventosDet
              DisplayFormat = '##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 169863
              mmTop = 265
              mmWidth = 8467
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              DataField = 'DATAOPERACAO'
              DataPipeline = pplAgendaEventosDet
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 182298
              mmTop = 265
              mmWidth = 14817
              BandType = 4
            end
          end
          object ppRPEMP: TppFooterBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
          end
        end
      end
      object srptRendaVariavel: TppSubReport
        UserName = 'srptRendaVariavel'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplAgendaEventosDet'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppcrRV: TppChildReport
          AutoStop = False
          DataPipeline = pplAgendaEventosDet
          OnStartPage = ppcrRVStartPage
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Agenda de Eventos'
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
          DataPipelineName = 'pplAgendaEventosDet'
          object pphCabRV: TppHeaderBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object shpCabRV: TppShape
              UserName = 'shpCabRV'
              Brush.Color = clSilver
              ParentWidth = True
              mmHeight = 4234
              mmLeft = 0
              mmTop = 0
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
              mmLeft = 20373
              mmTop = 529
              mmWidth = 17992
              BandType = 0
            end
            object ppLabel6: TppLabel
              UserName = 'Label6'
              Caption = 'Operação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 72231
              mmTop = 529
              mmWidth = 12700
              BandType = 0
            end
            object ppLabel7: TppLabel
              UserName = 'Label7'
              Caption = 'Percentual'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 182827
              mmTop = 529
              mmWidth = 14023
              BandType = 0
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              Caption = 'Preço Unitário'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 160073
              mmTop = 529
              mmWidth = 18785
              BandType = 0
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'Assembleia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3175
              mmLeft = 123296
              mmTop = 529
              mmWidth = 15346
              BandType = 0
            end
            object ppLabel32: TppLabel
              UserName = 'Label32'
              Caption = 'Vencimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 794
              mmTop = 529
              mmWidth = 15610
              BandType = 0
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object shpDetRV: TppShape
              OnPrint = shpDetRVPrint
              UserName = 'shpDetRV'
              ParentWidth = True
              Pen.Style = psClear
              mmHeight = 3703
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 4
            end
            object ppDBText2: TppDBText
              UserName = 'DBText2'
              DataField = 'INVESTIMENTO'
              DataPipeline = pplAgendaEventosDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 20373
              mmTop = 265
              mmWidth = 49742
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              DataField = 'VENCIMENTO'
              DataPipeline = pplAgendaEventosDet
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 1058
              mmTop = 265
              mmWidth = 15610
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              DataField = 'DESCTIPOOPERACAO'
              DataPipeline = pplAgendaEventosDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 71967
              mmTop = 265
              mmWidth = 45244
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              DataField = 'PERCENTUAL'
              DataPipeline = pplAgendaEventosDet
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 180182
              mmTop = 265
              mmWidth = 16933
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'PU'
              DataPipeline = pplAgendaEventosDet
              DisplayFormat = '#,###,##0.000000000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 144198
              mmTop = 265
              mmWidth = 34660
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              DataField = 'ASSEMBLEIA'
              DataPipeline = pplAgendaEventosDet
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplAgendaEventosDet'
              mmHeight = 3175
              mmLeft = 121179
              mmTop = 265
              mmWidth = 19844
              BandType = 4
            end
          end
          object ppRPRV: TppFooterBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 3440
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
    object ppGroup1: TppGroup
      BreakName = 'TIPOREL'
      DataPipeline = pplAgendaEventos
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAgendaEventos'
      object ppbCabTipoRel: TppGroupHeaderBand
        BeforePrint = ppbCabTipoRelBeforePrint
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object shpCabecalho: TppShape
          UserName = 'shpCabecalho'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppdbNomeRel: TppDBText
          UserName = 'dbNomeRel'
          DataField = 'DESCREL'
          DataPipeline = pplAgendaEventos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAgendaEventos'
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
  object pplAgendaEventos: TppBDEPipeline
    DataSource = dsAgendaEventos
    UserName = 'lAgendaEventos'
    Left = 41
    Top = 72
  end
  object qryAgendaEventos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       1 AS TIPOREL,'
      '       '#39'DIREITOS               '#39' AS DESCREL'
      'FROM OPERACAODIREITO OD, TIPOOPERACAO TP, EMISSOR EM'
      
        'WHERE OD.DATACOM BETWEEN (TO_DATE(:DATARVI,'#39'DD/MM/YYYY'#39') + 1) AN' +
        'D'
      '                          TO_DATE(:DATARVF,'#39'DD/MM/YYYY'#39')'
      '  AND OD.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
      '  AND OD.IDEMISSOR = EM.IDEMISSOR'
      '  AND ((:TIPOREL = 0) OR (:TIPOREL = 1))'
      ''
      'UNION'
      ''
      'SELECT DISTINCT'
      '       2 AS TIPOREL,'
      '       '#39'RENDA FIXA             '#39' AS DESCREL'
      'FROM OPERRENFIX OP, INVESTIMENTO IV,'
      '     (SELECT OC.IDOPERRENFIX, CR.DESCCURVARENFIX'
      '      FROM OPERRENFIXXCURVAS OC, CURVASRENFIX CR'
      '      WHERE OC.IDCURVARENFIX = CR.IDCURVARENFIX'
      '      GROUP BY OC.IDOPERRENFIX, CR.DESCCURVARENFIX) DC'
      'WHERE OP.VENCOPERACAO BETWEEN TO_DATE(:DATARFI,'#39'DD/MM/YYYY'#39') AND'
      '                              TO_DATE(:DATARFF,'#39'DD/MM/YYYY'#39')'
      '  AND OP.IDOPERRENFIX = DC.IDOPERRENFIX'
      '  AND OP.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND ((:TIPOREL = 0) OR (:TIPOREL = 2))'
      ''
      'UNION'
      ''
      'SELECT DISTINCT'
      '       2 AS TIPOREL,'
      '       '#39'RENDA FIXA             '#39' AS DESCREL'
      
        'FROM FLUXOINVESTRENFIX FI, INVESTIMENTO IV, CURVASRENFIX CR, ITE' +
        'MRENFIX IR'
      'WHERE FI.DATAFLUXO BETWEEN TO_DATE(:DATARFI,'#39'DD/MM/YYYY'#39') AND'
      '                           TO_DATE(:DATARFF,'#39'DD/MM/YYYY'#39')'
      '  AND FI.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND FI.IDCURVARENFIX = CR.IDCURVARENFIX'
      '  AND FI.IDITEMRENFIX = IR.IDITEMRENFIX'
      '  AND ((:TIPOREL = 0) OR (:TIPOREL = 2))'
      ''
      'UNION'
      ''
      'SELECT 3 AS TIPOREL,'
      '       '#39'BM&F                   '#39' AS DESCREL'
      'FROM SERIESBMF SB, TIPOCONTRINVEST TC, INVESTIMENTO IV'
      
        'WHERE SB.DATAVENCIMENTO BETWEEN (TO_DATE(:DATABMFI,'#39'DD/MM/YYYY'#39')' +
        ' + 1) AND'
      '                                 TO_DATE(:DATABMFF,'#39'DD/MM/YYYY'#39')'
      '  AND SB.IDTIPOCONTRINVEST = TC.IDTIPOCONTRINVEST'
      '  AND SB.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND ((:TIPOREL = 0) OR (:TIPOREL = 3))'
      ''
      'UNION'
      ''
      'SELECT 4 AS TIPOREL,'
      '       '#39'EMPRESTIMOS DE AÇÕES   '#39' AS DESCREL'
      
        'FROM OPEREMPACOES OE, CARTEIRAINVEST CI, INVESTIMENTO IV, TIPOIN' +
        'VEST TI, TIPOOPERACAO TP'
      
        'WHERE OE.DATAVENCOPER BETWEEN (TO_DATE(:DATAEMPI,'#39'DD/MM/YYYY'#39') +' +
        ' 1) AND'
      '                               TO_DATE(:DATAEMPF,'#39'DD/MM/YYYY'#39')'
      '  AND OE.IDTIPOINVEST = TI.IDTIPOINVEST'
      '  AND OE.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '  AND OE.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND OE.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
      '  AND ((:TIPOREL = 0) OR (:TIPOREL = 4))'
      ''
      'ORDER BY TIPOREL'
      ''
      '')
    ValidateWithMask = True
    Left = 41
    Top = 122
    ParamData = <
      item
        DataType = ftString
        Name = 'DATARVI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATARVF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOREL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOREL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATARFI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATARFF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOREL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOREL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATARFI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATARFF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOREL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOREL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATABMFI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATABMFF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOREL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOREL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAEMPI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAEMPF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOREL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOREL'
        ParamType = ptInput
      end>
    object qryAgendaEventosTIPOREL: TFloatField
      FieldName = 'TIPOREL'
    end
    object qryAgendaEventosDESCREL: TStringField
      FieldName = 'DESCREL'
      FixedChar = True
      Size = 23
    end
  end
  object dsAgendaEventos: TwwDataSource
    AutoEdit = False
    DataSet = qryAgendaEventos
    Left = 41
    Top = 170
  end
  object pplAgendaEventosDet: TppBDEPipeline
    DataSource = dsAgendaEventosDet
    UserName = 'lAgendaEventosDet'
    Left = 170
    Top = 72
  end
  object qryAgendaEventosDet: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT 1 AS TIPOREL,'
      '       OD.DATACOM AS VENCIMENTO,'
      '       '#39#39' AS TITULO,'
      '       '#39#39' AS PERFIL,'
      '       '#39#39' AS TIPOTITULO,'
      '       EM.SIGLAEMISSOR AS INVESTIMENTO,'
      '       '#39#39' AS ITEM,'
      '       TP.DESCTIPOOPERACAO,'
      '       OD.DATAAGE AS ASSEMBLEIA,'
      '       0.00 AS QTDOPERACAO,'
      '       OD.DIVPORACAO AS PU,'
      '       0.00 AS VLROPERACAO,'
      '       OD.PERCENTUAL,'
      '       TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS DATAEMISSAO,'
      '       TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS DATAOPERACAO,'
      '       0.00 AS VLRRESGATE,'
      '       0.00 AS VLRJUROS'
      'FROM OPERACAODIREITO OD, TIPOOPERACAO TP, EMISSOR EM'
      
        'WHERE OD.DATACOM BETWEEN (TO_DATE(:DATARVI,'#39'DD/MM/YYYY'#39') + 1) AN' +
        'D'
      '                          TO_DATE(:DATARVF,'#39'DD/MM/YYYY'#39')'
      '  AND OD.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
      '  AND OD.IDEMISSOR = EM.IDEMISSOR'
      '  AND ((:TIPOREL = 0) OR (:TIPOREL = 1))'
      ''
      'UNION'
      ''
      'SELECT 2 AS TIPOREL,'
      '       OP.VENCOPERACAO AS VENCIMENTO,'
      '       '#39'VENCIMENTOS'#39' AS TITULO,'
      '       DC.DESCCURVARENFIX AS PERFIL,'
      '       '#39#39' AS TIPOTITULO,'
      '       IV.DESCINVESTIMENTO AS INVESTIMENTO,'
      '       '#39#39' AS ITEM,'
      '       '#39#39' AS DESCTIPOOPERACAO,'
      '       TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS ASSEMBLEIA,'
      '       0.00 AS QTDOPERACAO,'
      '       0.00 AS PU,'
      '       0.00 AS VLROPERACAO,'
      '       0.00 AS PERCENTUAL,'
      '       OP.DATAEMISSAO,'
      '       OP.DATAOPERACAO,'
      '       0.00 AS VLRRESGATE,'
      '       0.00 AS VLRJUROS'
      'FROM OPERRENFIX OP, INVESTIMENTO IV,'
      '     (SELECT OC.IDOPERRENFIX, CR.DESCCURVARENFIX'
      '      FROM OPERRENFIXXCURVAS OC, CURVASRENFIX CR'
      '      WHERE OC.IDCURVARENFIX = CR.IDCURVARENFIX'
      '      GROUP BY OC.IDOPERRENFIX, CR.DESCCURVARENFIX) DC'
      'WHERE OP.VENCOPERACAO BETWEEN TO_DATE(:DATARFI,'#39'DD/MM/YYYY'#39') AND'
      '                              TO_DATE(:DATARFF,'#39'DD/MM/YYYY'#39')'
      '  AND OP.IDOPERRENFIX = DC.IDOPERRENFIX'
      '  AND OP.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND ((:TIPOREL = 0) OR (:TIPOREL = 2))'
      ''
      'UNION'
      ''
      'SELECT 2 AS TIPOREL,'
      '       FI.DATAFLUXO AS VENCIMENTO,'
      '       '#39'FLUXOS     '#39' AS TITULO,'
      '       CR.DESCCURVARENFIX AS PERFIL,'
      '       '#39#39' AS TIPOTITULO,'
      '       IV.DESCINVESTIMENTO AS INVESTIMENTO,'
      '       IR.DESCITEMRENFIX AS ITEM,'
      '       '#39#39' AS DESCTIPOOPERACAO,'
      '       TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS ASSEMBLEIA,'
      '       0.00 AS QTDOPERACAO,'
      '       0.00 AS PU,'
      '       0.00 AS VLROPERACAO,'
      '       FI.PERCFLUXO AS PERCENTUAL,'
      '       TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS DATAEMISSAO,'
      '       TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS DATAOPERACAO,'
      '       0.00 AS VLRRESGATE,'
      '       0.00 AS VLRJUROS'
      
        'FROM FLUXOINVESTRENFIX FI, INVESTIMENTO IV, CURVASRENFIX CR, ITE' +
        'MRENFIX IR'
      'WHERE FI.DATAFLUXO BETWEEN TO_DATE(:DATARFI,'#39'DD/MM/YYYY'#39') AND'
      '                           TO_DATE(:DATARFF,'#39'DD/MM/YYYY'#39')'
      '  AND FI.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND FI.IDCURVARENFIX = CR.IDCURVARENFIX'
      '  AND FI.IDITEMRENFIX = IR.IDITEMRENFIX'
      '  AND ((:TIPOREL = 0) OR (:TIPOREL = 2))'
      ''
      'UNION'
      ''
      'SELECT 3 AS TIPOREL,'
      '       SB.DATAVENCIMENTO AS VENCIMENTO,'
      '       '#39#39' AS TITULO,'
      '       '#39#39' AS PERFIL,'
      '       TC.DESCTIPOCTINVEST AS TIPOTITULO,'
      '       IV.DESCINVESTIMENTO  AS INVESTIMENTO,'
      '       '#39#39' AS ITEM,'
      '       '#39#39' AS DESCTIPOOPERACAO,'
      '       TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS ASSEMBLEIA,'
      '       0.00 AS QTDOPERACAO,'
      '       SB.PRECOEXERC AS PU,'
      '       0.00 AS VLROPERACAO,'
      '       0.00 AS PERCENTUAL,'
      '       TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS DATAEMISSAO,'
      '       TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS DATAOPERACAO,'
      '       0.00 AS VLRRESGATE,'
      '       0.00 AS VLRJUROS'
      'FROM SERIESBMF SB, TIPOCONTRINVEST TC, INVESTIMENTO IV'
      
        'WHERE SB.DATAVENCIMENTO BETWEEN (TO_DATE(:DATABMFI,'#39'DD/MM/YYYY'#39')' +
        ' + 1) AND'
      '                                 TO_DATE(:DATABMFF,'#39'DD/MM/YYYY'#39')'
      '  AND SB.IDTIPOCONTRINVEST = TC.IDTIPOCONTRINVEST'
      '  AND SB.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND ((:TIPOREL = 0) OR (:TIPOREL = 3))'
      ''
      'UNION'
      ''
      'SELECT 4 AS TIPOREL,'
      '       OE.DATAVENCOPER AS VENCIMENTO,'
      '       '#39#39' AS TITULO,'
      '       TI.DESCTIPOINVEST AS PERFIL,'
      '       '#39#39' AS TIPOTITULO,'
      '       IV.DESCINVESTIMENTO AS INVESTIMENTO,'
      '       '#39#39' AS ITEM,'
      '       '#39#39' AS DESCTIPOOPERACAO,'
      '       TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS ASSEMBLEIA,'
      '       OE.QTDOPERACAO,'
      '       OE.PUOPERACAO AS PU,'
      '       OE.VLROPERACAO,'
      '       OE.TAXAOPERACAO AS PERCENTUAL,'
      '       TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS DATAEMISSAO,'
      '       OE.DATAOPERACAO,'
      '       OE.VLRRESGATE,'
      '       OE.VLRJUROS'
      'FROM OPEREMPACOES OE, INVESTIMENTO IV, TIPOINVEST TI'
      
        'WHERE OE.DATAVENCOPER BETWEEN (TO_DATE(:DATAEMPI,'#39'DD/MM/YYYY'#39') +' +
        ' 1) AND'
      '                               TO_DATE(:DATAEMPF,'#39'DD/MM/YYYY'#39')'
      '  AND OE.IDTIPOINVEST = TI.IDTIPOINVEST'
      '  AND OE.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND ((:TIPOREL = 0) OR (:TIPOREL = 4))'
      ''
      
        'ORDER BY TIPOREL, VENCIMENTO DESC, TITULO, INVESTIMENTO, PERFIL,' +
        ' TIPOTITULO,'
      '           INVESTIMENTO, ITEM, DESCTIPOOPERACAO, ASSEMBLEIA'
      ''
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 170
    Top = 122
    ParamData = <
      item
        DataType = ftString
        Name = 'DATARVI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATARVF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOREL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOREL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATARFI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATARFF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOREL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOREL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATARFI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATARFF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOREL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOREL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATABMFI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATABMFF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOREL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOREL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAEMPI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAEMPF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOREL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOREL'
        ParamType = ptInput
      end>
    object qryAgendaEventosDetTIPOREL: TFloatField
      FieldName = 'TIPOREL'
    end
    object qryAgendaEventosDetVENCIMENTO: TDateTimeField
      FieldName = 'VENCIMENTO'
    end
    object qryAgendaEventosDetTITULO: TStringField
      FieldName = 'TITULO'
      Size = 11
    end
    object qryAgendaEventosDetPERFIL: TStringField
      FieldName = 'PERFIL'
      Size = 60
    end
    object qryAgendaEventosDetTIPOTITULO: TStringField
      FieldName = 'TIPOTITULO'
      Size = 60
    end
    object qryAgendaEventosDetINVESTIMENTO: TStringField
      FieldName = 'INVESTIMENTO'
      Size = 60
    end
    object qryAgendaEventosDetITEM: TStringField
      FieldName = 'ITEM'
      Size = 60
    end
    object qryAgendaEventosDetDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryAgendaEventosDetASSEMBLEIA: TDateTimeField
      FieldName = 'ASSEMBLEIA'
    end
    object qryAgendaEventosDetQTDOPERACAO: TFloatField
      FieldName = 'QTDOPERACAO'
    end
    object qryAgendaEventosDetPU: TFloatField
      FieldName = 'PU'
    end
    object qryAgendaEventosDetVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryAgendaEventosDetPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object qryAgendaEventosDetDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object qryAgendaEventosDetDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryAgendaEventosDetVLRRESGATE: TFloatField
      FieldName = 'VLRRESGATE'
    end
    object qryAgendaEventosDetVLRJUROS: TFloatField
      FieldName = 'VLRJUROS'
    end
  end
  object dsAgendaEventosDet: TwwDataSource
    AutoEdit = False
    DataSet = qryAgendaEventosDet
    Left = 170
    Top = 170
  end
end
