inherited dtmRelFinanc: TdtmRelFinanc
  Left = 504
  Top = 68
  Width = 800
  Height = 656
  Caption = 'dtmRelFinanc'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 25
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
    Left = 25
    Top = 21
  end
  inherited qryExemplo: TwwQuery
    Left = 25
    Top = 34
  end
  inherited rpExemplo: TppReport
    Left = 26
    Top = 48
    DataPipelineName = 'pplExemplo'
  end
  object rpContrato: TppReport
    AutoStop = False
    DataPipeline = pplContato
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 306
    Top = 104
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplContato'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17463
      mmPrintPosition = 0
      object ppLabel14: TppLabel
        UserName = 'Label11'
        Caption = 'Espelho de Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 114829
        mmTop = 8731
        mmWidth = 41540
        BandType = 0
      end
      object ppLabel16: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 121709
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'NUMPARCELA'
        DataPipeline = pplContato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 0
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'DATAVENCIMENTO'
        DataPipeline = pplContato
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 13758
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        BlankWhenZero = True
        DataField = 'VLRPRESTACAO'
        DataPipeline = pplContato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 165100
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        BlankWhenZero = True
        DataField = 'VLRJUROS'
        DataPipeline = pplContato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 77258
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        BlankWhenZero = True
        DataField = 'VLRAMORTIZACAO'
        DataPipeline = pplContato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 121179
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        BlankWhenZero = True
        DataField = 'VLRSALDOATUAL'
        DataPipeline = pplContato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 33338
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        BlankWhenZero = True
        DataField = 'VLRPRESTATUALIZADA'
        DataPipeline = pplContato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 187061
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        BlankWhenZero = True
        DataField = 'VLRRESIDUO'
        DataPipeline = pplContato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 143140
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        BlankWhenZero = True
        DataField = 'VLRRESIDUOATUALI'
        DataPipeline = pplContato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 210080
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        DataField = 'DSCINDPARC'
        DataPipeline = pplContato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 233628
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'COTVALOR'
        DataPipeline = pplContato
        DisplayFormat = '##0.0000 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 246328
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText301'
        DataField = 'FATORCORRECAO'
        DataPipeline = pplContato
        DisplayFormat = '0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 264584
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        BlankWhenZero = True
        DataField = 'VLRNOMINAL'
        DataPipeline = pplContato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 55298
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        BlankWhenZero = True
        DataField = 'VLRJUROSPARC'
        DataPipeline = pplContato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 99219
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel17: TppLabel
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
        mmWidth = 282311
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
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
        mmWidth = 282311
        BandType = 8
      end
      object ppSystemVariable6: TppSystemVariable
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
        mmLeft = 256117
        mmTop = 3440
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplContato
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContato'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 21960
        mmPrintPosition = 0
        object ppRegion1: TppRegion
          UserName = 'Region1'
          Brush.Style = bsClear
          Transparent = True
          mmHeight = 20108
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel31: TppLabel
            UserName = 'Label31'
            Caption = 'Contrato:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 1588
            mmTop = 1323
            mmWidth = 15875
            BandType = 3
            GroupNo = 0
          end
          object ppDBText18: TppDBText
            UserName = 'DBText18'
            AutoSize = True
            DataField = 'CONNUMERO'
            DataPipeline = pplContato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplContato'
            mmHeight = 3969
            mmLeft = 29898
            mmTop = 1588
            mmWidth = 23548
            BandType = 3
            GroupNo = 0
          end
          object ppDBText19: TppDBText
            UserName = 'DBText19'
            DataField = 'CONNOME'
            DataPipeline = pplContato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplContato'
            mmHeight = 3969
            mmLeft = 54769
            mmTop = 1588
            mmWidth = 144198
            BandType = 3
            GroupNo = 0
          end
          object ppLabel32: TppLabel
            UserName = 'Label32'
            Caption = 'Valor da  Venda:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3175
            mmLeft = 54504
            mmTop = 7938
            mmWidth = 21696
            BandType = 3
            GroupNo = 0
          end
          object ppDBText20: TppDBText
            UserName = 'DBText20'
            DataField = 'VLRPROPOSTA'
            DataPipeline = pplContato
            DisplayFormat = '#,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplContato'
            mmHeight = 3175
            mmLeft = 82286
            mmTop = 7938
            mmWidth = 17198
            BandType = 3
            GroupNo = 0
          end
          object ppLabel37: TppLabel
            UserName = 'Label37'
            Caption = 'Data de Assinatura'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3175
            mmLeft = 1588
            mmTop = 7938
            mmWidth = 24871
            BandType = 3
            GroupNo = 0
          end
          object ppDBText25: TppDBText
            UserName = 'DBText25'
            DataField = 'CONDATAASSINATURA'
            DataPipeline = pplContato
            DisplayFormat = 'dd/mm/yyyy'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplContato'
            mmHeight = 3175
            mmLeft = 29898
            mmTop = 7938
            mmWidth = 15081
            BandType = 3
            GroupNo = 0
          end
          object ppLabel38: TppLabel
            UserName = 'Label38'
            Caption = 'Comprador:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3175
            mmLeft = 1588
            mmTop = 14552
            mmWidth = 15875
            BandType = 3
            GroupNo = 0
          end
          object ppDBText26: TppDBText
            UserName = 'DBText26'
            AutoSize = True
            DataField = 'RAZAOSOCIAL'
            DataPipeline = pplContato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplContato'
            mmHeight = 3175
            mmLeft = 30163
            mmTop = 14552
            mmWidth = 20108
            BandType = 3
            GroupNo = 0
          end
          object ppLabel39: TppLabel
            UserName = 'Label39'
            Caption = 'Imóvel Mestre:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3175
            mmLeft = 114300
            mmTop = 7938
            mmWidth = 19579
            BandType = 3
            GroupNo = 0
          end
          object ppDBText28: TppDBText
            UserName = 'DBText28'
            AutoSize = True
            DataField = 'NOMEMESTRE'
            DataPipeline = pplContato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplContato'
            mmHeight = 3175
            mmLeft = 138642
            mmTop = 7938
            mmWidth = 20373
            BandType = 3
            GroupNo = 0
          end
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 12435
        mmPrintPosition = 0
        object ppRegion8: TppRegion
          UserName = 'Region8'
          Stretch = True
          mmHeight = 7144
          mmLeft = 1323
          mmTop = 1588
          mmWidth = 120915
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppSubReport6: TppSubReport
            OnPrint = ppSubReport6Print
            UserName = 'SubReport6'
            ExpandAll = False
            NewPrintJob = False
            OutlineSettings.CreateNode = True
            ParentWidth = False
            TraverseAllData = False
            DataPipelineName = 'pplSegImoveisTot'
            mmHeight = 5027
            mmLeft = 2381
            mmTop = 2646
            mmWidth = 118269
            BandType = 5
            GroupNo = 0
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            object ppChildReport7: TppChildReport
              AutoStop = False
              DataPipeline = pplSegImoveisTot
              PrinterSetup.BinName = 'Default'
              PrinterSetup.DocumentName = 'PpModeloReport1'
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
              Left = 224
              Top = 280
              Version = '7.04'
              mmColumnWidth = 0
              DataPipelineName = 'pplSegImoveisTot'
              object ppTitleBand7: TppTitleBand
                mmBottomOffset = 0
                mmHeight = 12700
                mmPrintPosition = 0
                object ppLabel131: TppLabel
                  UserName = 'Label136'
                  Caption = 'Resumo de Segregação - Por Valor de Venda'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsItalic]
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 0
                  mmTop = 1323
                  mmWidth = 80698
                  BandType = 1
                end
                object ppLabel146: TppLabel
                  UserName = 'Label128'
                  Caption = 'Patrocinadora'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 0
                  mmTop = 8467
                  mmWidth = 30163
                  BandType = 1
                end
                object ppLabel147: TppLabel
                  UserName = 'Label147'
                  Caption = 'Plano Previdenciário'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 33867
                  mmTop = 8467
                  mmWidth = 39158
                  BandType = 1
                end
                object ppLabel148: TppLabel
                  UserName = 'Label1303'
                  Caption = '%'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 78317
                  mmTop = 8467
                  mmWidth = 8996
                  BandType = 1
                end
                object ppLabel149: TppLabel
                  UserName = 'Label131'
                  Caption = 'Valor'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 93134
                  mmTop = 8467
                  mmWidth = 25400
                  BandType = 1
                end
                object ppLine22: TppLine
                  UserName = 'Line22'
                  Weight = 0.75
                  mmHeight = 265
                  mmLeft = 0
                  mmTop = 5821
                  mmWidth = 118798
                  BandType = 1
                end
              end
              object ppDetailBand12: TppDetailBand
                mmBottomOffset = 0
                mmHeight = 4233
                mmPrintPosition = 0
                object ppDBText111: TppDBText
                  UserName = 'DBText111'
                  DataField = 'PATROCINADORA'
                  DataPipeline = pplSegImoveisTot
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  DataPipelineName = 'pplSegImoveisTot'
                  mmHeight = 3175
                  mmLeft = 265
                  mmTop = 0
                  mmWidth = 30163
                  BandType = 4
                end
                object ppDBText112: TppDBText
                  UserName = 'DBText112'
                  DataField = 'PLANOPREV'
                  DataPipeline = pplSegImoveisTot
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  DataPipelineName = 'pplSegImoveisTot'
                  mmHeight = 3175
                  mmLeft = 34131
                  mmTop = 0
                  mmWidth = 39158
                  BandType = 4
                end
                object ppDBText113: TppDBText
                  UserName = 'DBText113'
                  DataField = 'PERCENT'
                  DataPipeline = pplSegImoveisTot
                  DisplayFormat = '#,##0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  TextAlignment = taRightJustified
                  Transparent = True
                  DataPipelineName = 'pplSegImoveisTot'
                  mmHeight = 3175
                  mmLeft = 78581
                  mmTop = 0
                  mmWidth = 8996
                  BandType = 4
                end
                object ppDBText114: TppDBText
                  UserName = 'DBText98'
                  OnGetText = ppDBText114GetText
                  DataField = 'VALOR'
                  DataPipeline = pplSegImoveisTot
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  TextAlignment = taRightJustified
                  Transparent = True
                  DataPipelineName = 'pplSegImoveisTot'
                  mmHeight = 3175
                  mmLeft = 93398
                  mmTop = 0
                  mmWidth = 25400
                  BandType = 4
                end
              end
              object ppSummaryBand10: TppSummaryBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
          end
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDCONDINICIAL'
      DataPipeline = pplContato
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContato'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppSubReport1: TppSubReport
          UserName = 'SubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplCondPag'
          mmHeight = 5292
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = pplCondPag
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
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
            Left = 136
            Top = 192
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplCondPag'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object ppLabel86: TppLabel
                UserName = 'Label86'
                AutoSize = False
                Caption = 'Condição de Pagamento:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsItalic]
                Transparent = True
                mmHeight = 3704
                mmLeft = 0
                mmTop = 794
                mmWidth = 37835
                BandType = 1
              end
            end
            object ppDetailBand7: TppDetailBand
              BeforePrint = ppDetailBand7BeforePrint
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 22754
              mmPrintPosition = 0
              object ppLabel97: TppLabel
                UserName = 'Label302'
                AutoSize = False
                Caption = 'Saldo Devedor:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 4233
                mmLeft = 29633
                mmTop = 0
                mmWidth = 20373
                BandType = 4
              end
              object ppDBText66: TppDBText
                UserName = 'DBText66'
                BlankWhenZero = True
                DataField = 'VLRFINANC'
                DataPipeline = pplCondPag
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplCondPag'
                mmHeight = 4233
                mmLeft = 51329
                mmTop = 0
                mmWidth = 21696
                BandType = 4
              end
              object ppLabel98: TppLabel
                UserName = 'Label98'
                AutoSize = False
                Caption = 'Nr. Parcelas:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 4233
                mmLeft = 76465
                mmTop = 0
                mmWidth = 17992
                BandType = 4
              end
              object ppDBText67: TppDBText
                UserName = 'DBText67'
                DataField = 'NUMPARCELAS'
                DataPipeline = pplCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplCondPag'
                mmHeight = 4233
                mmLeft = 94721
                mmTop = 0
                mmWidth = 9790
                BandType = 4
              end
              object ppLabel103: TppLabel
                UserName = 'Label103'
                AutoSize = False
                Caption = 'Juros:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 4233
                mmLeft = 140494
                mmTop = 0
                mmWidth = 8996
                BandType = 4
              end
              object ppLabel105: TppLabel
                UserName = 'Label105'
                AutoSize = False
                Caption = 'Correção:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 4233
                mmLeft = 218017
                mmTop = 0
                mmWidth = 13758
                BandType = 4
              end
              object ppDBText68: TppDBText
                UserName = 'DBText68'
                DataField = 'DSCINDCORR'
                DataPipeline = pplCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplCondPag'
                mmHeight = 4233
                mmLeft = 232040
                mmTop = 0
                mmWidth = 18785
                BandType = 4
              end
              object ppLabel106: TppLabel
                UserName = 'Label106'
                AutoSize = False
                Caption = 'Projeção:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 4233
                mmLeft = 251619
                mmTop = 0
                mmWidth = 13758
                BandType = 4
              end
              object ppDBText69: TppDBText
                UserName = 'DBText69'
                DataField = 'DSCINDPROJ'
                DataPipeline = pplCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplCondPag'
                mmHeight = 4233
                mmLeft = 265642
                mmTop = 0
                mmWidth = 18785
                BandType = 4
              end
              object ppDBText21: TppDBText
                UserName = 'DBText1'
                DataField = 'DSCTIPO'
                DataPipeline = pplCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplCondPag'
                mmHeight = 4233
                mmLeft = 2910
                mmTop = 0
                mmWidth = 25665
                BandType = 4
              end
              object ppLabel18: TppLabel
                UserName = 'Label1'
                AutoSize = False
                Caption = 'Data de Início:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 4233
                mmLeft = 175419
                mmTop = 4233
                mmWidth = 20638
                BandType = 4
              end
              object ppDBText22: TppDBText
                UserName = 'DBText2'
                DataField = 'DATAINI'
                DataPipeline = pplCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplCondPag'
                mmHeight = 4233
                mmLeft = 196321
                mmTop = 4233
                mmWidth = 21167
                BandType = 4
              end
              object ppLabel19: TppLabel
                UserName = 'Label2'
                AutoSize = False
                Caption = '1o.Vencto:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 4233
                mmLeft = 106098
                mmTop = 0
                mmWidth = 15081
                BandType = 4
              end
              object ppDBText23: TppDBText
                UserName = 'DBText3'
                DataField = 'DATAVENCIMENTO'
                DataPipeline = pplCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplCondPag'
                mmHeight = 4233
                mmLeft = 121444
                mmTop = 0
                mmWidth = 18256
                BandType = 4
              end
              object ppDBText24: TppDBText
                UserName = 'DBText24'
                DataField = 'DSCJUROS'
                DataPipeline = pplCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplCondPag'
                mmHeight = 4233
                mmLeft = 150019
                mmTop = 0
                mmWidth = 24606
                BandType = 4
              end
              object lblFormaCalculo: TppLabel
                UserName = 'lblFormaCalculo'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 4233
                mmLeft = 55827
                mmTop = 4233
                mmWidth = 118798
                BandType = 4
              end
              object ppLabel6: TppLabel
                UserName = 'Label3'
                AutoSize = False
                Caption = 'Forma de Calculo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 4233
                mmLeft = 29633
                mmTop = 4233
                mmWidth = 25400
                BandType = 4
              end
              object ppLabel11: TppLabel
                UserName = 'Label4'
                AutoSize = False
                Caption = 'Correção Proj.:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 4233
                mmLeft = 175419
                mmTop = 0
                mmWidth = 20373
                BandType = 4
              end
              object ppDBText5: TppDBText
                UserName = 'DBText302'
                DataField = 'PERINDPROJ'
                DataPipeline = pplCondPag
                DisplayFormat = '#0.000000 % am'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplCondPag'
                mmHeight = 4233
                mmLeft = 196321
                mmTop = 0
                mmWidth = 21167
                BandType = 4
              end
              object ppRegion9: TppRegion
                UserName = 'Region9'
                Stretch = True
                mmHeight = 7673
                mmLeft = 1852
                mmTop = 11642
                mmWidth = 122502
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppSubReport5: TppSubReport
                  OnPrint = ppSubReport5Print
                  UserName = 'SubReport2'
                  ExpandAll = False
                  NewPrintJob = False
                  OutlineSettings.CreateNode = True
                  ParentWidth = False
                  TraverseAllData = False
                  DataPipelineName = 'pplSegImoveisCond'
                  mmHeight = 5027
                  mmLeft = 3440
                  mmTop = 12965
                  mmWidth = 119327
                  BandType = 4
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  object ppChildReport6: TppChildReport
                    AutoStop = False
                    DataPipeline = pplSegImoveisCond
                    PrinterSetup.BinName = 'Default'
                    PrinterSetup.DocumentName = 'PpModeloReport1'
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
                    Left = 208
                    Top = 264
                    Version = '7.04'
                    mmColumnWidth = 0
                    DataPipelineName = 'pplSegImoveisCond'
                    object ppTitleBand6: TppTitleBand
                      mmBottomOffset = 0
                      mmHeight = 11113
                      mmPrintPosition = 0
                      object ppLabel128: TppLabel
                        UserName = 'TituloCond2'
                        Caption = 'Segregação'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = [fsBold, fsItalic]
                        Transparent = True
                        mmHeight = 3175
                        mmLeft = 0
                        mmTop = 1058
                        mmWidth = 59796
                        BandType = 1
                      end
                      object ppLabel129: TppLabel
                        UserName = 'Label129'
                        Caption = 'Patrocinadora'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = [fsBold]
                        Transparent = True
                        mmHeight = 3440
                        mmLeft = 0
                        mmTop = 7144
                        mmWidth = 30163
                        BandType = 1
                      end
                      object ppLabel130: TppLabel
                        UserName = 'Label130'
                        Caption = 'Plano Previdenciário'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = [fsBold]
                        Transparent = True
                        mmHeight = 3440
                        mmLeft = 33867
                        mmTop = 7144
                        mmWidth = 39158
                        BandType = 1
                      end
                      object ppLabel144: TppLabel
                        UserName = 'Label144'
                        Caption = '%'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = [fsBold]
                        TextAlignment = taRightJustified
                        Transparent = True
                        mmHeight = 3440
                        mmLeft = 78317
                        mmTop = 7144
                        mmWidth = 8996
                        BandType = 1
                      end
                      object ppLabel145: TppLabel
                        UserName = 'Label1'
                        Caption = 'Valor'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = [fsBold]
                        TextAlignment = taRightJustified
                        Transparent = True
                        mmHeight = 3440
                        mmLeft = 93134
                        mmTop = 7144
                        mmWidth = 25400
                        BandType = 1
                      end
                      object ppLine23: TppLine
                        UserName = 'Line23'
                        Weight = 0.75
                        mmHeight = 529
                        mmLeft = 0
                        mmTop = 5292
                        mmWidth = 118534
                        BandType = 1
                      end
                    end
                    object ppDetailBand11: TppDetailBand
                      mmBottomOffset = 0
                      mmHeight = 5556
                      mmPrintPosition = 0
                      object ppDBText95: TppDBText
                        UserName = 'DBText95'
                        DataField = 'PATROCINADORA'
                        DataPipeline = pplSegImoveisCond
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = []
                        Transparent = True
                        DataPipelineName = 'pplSegImoveisCond'
                        mmHeight = 3969
                        mmLeft = 265
                        mmTop = 265
                        mmWidth = 30163
                        BandType = 4
                      end
                      object ppDBText96: TppDBText
                        UserName = 'DBText96'
                        DataField = 'PLANOPREV'
                        DataPipeline = pplSegImoveisCond
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = []
                        Transparent = True
                        DataPipelineName = 'pplSegImoveisCond'
                        mmHeight = 3969
                        mmLeft = 34131
                        mmTop = 265
                        mmWidth = 39158
                        BandType = 4
                      end
                      object ppDBText97: TppDBText
                        UserName = 'DBText97'
                        DataField = 'PERCENT'
                        DataPipeline = pplSegImoveisCond
                        DisplayFormat = '#,##0.00'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = []
                        TextAlignment = taRightJustified
                        Transparent = True
                        DataPipelineName = 'pplSegImoveisCond'
                        mmHeight = 3969
                        mmLeft = 78581
                        mmTop = 265
                        mmWidth = 8996
                        BandType = 4
                      end
                      object ppDBText98: TppDBText
                        UserName = 'DBText104'
                        OnGetText = ppDBText98GetText
                        DataField = 'VALOR'
                        DataPipeline = pplSegImoveisCond
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = []
                        TextAlignment = taRightJustified
                        Transparent = True
                        DataPipelineName = 'pplSegImoveisCond'
                        mmHeight = 3970
                        mmLeft = 93398
                        mmTop = 264
                        mmWidth = 25400
                        BandType = 4
                      end
                    end
                    object ppSummaryBand9: TppSummaryBand
                      mmBottomOffset = 0
                      mmHeight = 0
                      mmPrintPosition = 0
                    end
                  end
                end
              end
            end
            object ppSummaryBand3: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
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
    object ppGroup7: TppGroup
      BreakName = 'IDCONDINICIAL'
      DataPipeline = pplContato
      OutlineSettings.CreateNode = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContato'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object ppLine19: TppLine
          UserName = 'Line19'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 1588
          mmWidth = 284300
          BandType = 3
          GroupNo = 2
        end
        object ppLabel20: TppLabel
          UserName = 'Label203'
          AutoSize = False
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1058
          mmTop = 2381
          mmWidth = 11113
          BandType = 3
          GroupNo = 2
        end
        object ppLabel21: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 13494
          mmTop = 2381
          mmWidth = 17992
          BandType = 3
          GroupNo = 2
        end
        object ppLabel22: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Prestação Efetiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 169598
          mmTop = 2381
          mmWidth = 16933
          BandType = 3
          GroupNo = 2
        end
        object ppLabel23: TppLabel
          UserName = 'Label1101'
          AutoSize = False
          Caption = 'Juros Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 88371
          mmTop = 2381
          mmWidth = 10319
          BandType = 3
          GroupNo = 2
        end
        object ppLabel24: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Amortização'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 123296
          mmTop = 2381
          mmWidth = 19315
          BandType = 3
          GroupNo = 2
        end
        object ppLabel25: TppLabel
          UserName = 'Label25'
          AutoSize = False
          Caption = 'Saldo Devedor Atualizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 32808
          mmTop = 2381
          mmWidth = 21960
          BandType = 3
          GroupNo = 2
        end
        object ppLabel27: TppLabel
          UserName = 'Label27'
          AutoSize = False
          Caption = 'Prestação Atualizada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 190236
          mmTop = 2381
          mmWidth = 18256
          BandType = 3
          GroupNo = 2
        end
        object ppLabel28: TppLabel
          UserName = 'Label28'
          AutoSize = False
          Caption = 'Correção / Resíduo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 148961
          mmTop = 2381
          mmWidth = 15610
          BandType = 3
          GroupNo = 2
        end
        object ppLabel29: TppLabel
          UserName = 'Label29'
          AutoSize = False
          Caption = 'Resíduo Atualizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 213784
          mmTop = 2381
          mmWidth = 17727
          BandType = 3
          GroupNo = 2
        end
        object ppLine20: TppLine
          UserName = 'Line20'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 10319
          mmWidth = 284300
          BandType = 3
          GroupNo = 2
        end
        object ppLabel30: TppLabel
          UserName = 'Label30'
          AutoSize = False
          Caption = 'Fator Corr.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 265378
          mmTop = 2381
          mmWidth = 16404
          BandType = 3
          GroupNo = 2
        end
        object ppLabel33: TppLabel
          UserName = 'Label33'
          AutoSize = False
          Caption = 'Indice de Correção'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 232834
          mmTop = 2381
          mmWidth = 28310
          BandType = 3
          GroupNo = 2
        end
        object ppLabel5: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Prestação Nominal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 61119
          mmTop = 2381
          mmWidth = 15610
          BandType = 3
          GroupNo = 2
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Juros Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 108744
          mmTop = 2381
          mmWidth = 11906
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryExtrato: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryExtratoCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PF.IDPARCFINANCIMOV,'
      '       PF.IDCONDPAGIMOVEL,'
      '       CI.IDCONTRATOIMOVEL,'
      '       CI.CONNUMERO,'
      '       CI.CONNOME,'
      '       CI.VLRPROPOSTA,'
      '       CI.CONDATAINICIO,'
      '       CI.IDCIDADES,'
      '       CI.IDPAIS,'
      '       CI.CODESTADO,'
      '       P.RAZAOSOCIAL,'
      '       IM.NOMEMESTRE,'
      '       PF.CODDOCUMENTO,'
      '       PF.PLNCODIGO,'
      '       ALT.TOT_ALTERADOR,'
      '       CPMF.TOT_CPMF,'
      '       DECODE(NVL(PF.FLGTIPOLANC,1), 1, 0,'
      
        '          DECODE(PF.CODDOCUMENTO, NULL, PF.IDPARCFINANCIMOV, PF.' +
        'CODDOCUMENTO) ) AS NUMDOC,'
      '       PF.NUMPARCELA AS NUMPARC,'
      
        '       DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || '#39'/'#39 +
        ' || TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA,'
      
        '       DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENT' +
        'O) AS DATAVENCIMENTO,'
      '       TO_CHAR(PF.DATAVENCIMENTO,'#39'MMYYYY'#39') AS MESANO_VENCIMENTO,'
      #39'082006'#39' AS MESANO_CALCULO, '
      '       CPFINAL.INDCORRECAO    AS IDCORR_CONDPAG, '
      '       CPFINAL.MESREFREAJUSTE AS MESREF_CONDPAG, '
      '       CPFINAL.TIPOCONDPAG, '
      '       CPFINAL.NUMPARCELAS, '
      '       ROUND(PF.VLRPRESTACAO,2) AS VLRPRESTACAO,'
      '       PF.VLRNOMINAL,       '
      
        '       PF.VLRPRESTACAO + NVL(ALT.TOT_ALTERADOR,0) AS TOT_DEVIDO,' +
        ' '
      '       PF.VLRJUROS,         '
      '       ROUND(PF.VLRAMORTIZACAO,2) AS VLRAMORTIZACAO, '
      '       PF.VLRSALDODEVEDOR,    '
      '       PF.VLRSALDOATUAL,      '
      '       PF.VLRPRESTATUALIZADA,'
      '       PF.VLRRESIDUO,         '
      '       PF.VLRRESIDUOATUALI,   '
      
        '       (NVL(PF.VLRRESIDUO,0) + NVL(AR.VLRRESIDUOCORRIG,0)) as VL' +
        'RRESIDUOCORRIG,   '
      '       CR.DATACOBRES,         '
      '       PF.IDINDCORRECAO,      '
      '       PF.VLRCORRIGIDOATRASO, '
      '       PF.VLRMULTAATRASO,     '
      '       PF.VLRMORAATRASO,'
      '       NVL(PF.FLGRESIDUOINCORP,'#39'N'#39') AS FLGRESIDUOINCORP,   '
      '       PF.FLGTIPOLANC,        '
      '       DECODE(PF.IDREPACTUA, NULL, PF.FLGLANCINTEGRA, '
      '              DECODE(CD2.FLGTIPO, NULL,               '
      '                     DECODE(PF.CODDOCUMENTO, NULL,    '
      
        '                            DECODE(NVL(PF.VLRPAGO,0), 0, 0, 3), ' +
        '2), 5) ) AS FLGLANCINTEGRA, '
      '       PF.DATALIMITE,         '
      '       PP.DATAPAGAMENTO,'
      '       ROUND(NVL(PP.VLRPAGO,0),2) AS VLRPAGO, '
      '       NVL(CD2.CONCILIADOC, '#39'N'#39') AS FLGCONCILIADO, '
      '       PF.IDREPACTUA,         '
      '       CD.IDDOCDIVERGE,       '
      '       TO_DATE('#39'11/08/2006'#39','#39'DD/MM/YYYY'#39') AS DATA_BASE, '
      '       CO2.DTAPUR AS DATA_CORRECAO, '
      '       DECODE(NVL(CD2.CONCILIADOC, '#39'N'#39'), '#39'S'#39', 0, '#39'C'#39', 0,    '
      '          DECODE(NVL(PP.VLRPAGO,0), 0, 0,'
      
        '                     NVL(PF.VLRPRESTACAO,0) + NVL(CO1.TOT_CORREC' +
        'AO,0) + NVL(ALT.TOT_ALTERADOR,0) - NVL(PP.VLRPAGO,0) )) AS VLRDI' +
        'F, '
      '       DECODE(CD.IDDOCDIVERGE, NULL,                   '
      '          DECODE(NVL(CD2.CONCILIADOC, '#39'N'#39'), '#39'S'#39', 0, '#39'C'#39', 0, '
      
        '                 NVL(PF.VLRPRESTACAO,0)  + NVL(CO2.TOT_CORRECAO,' +
        '0) + NVL(ALT.TOT_ALTERADOR,0) - NVL(PP.VLRPAGO,0) - NVL(ABONO.TO' +
        'T_ABONO,0) ), NULL) AS VLRCORRIG '
      '  FROM  '
      '       PARCFINANCIMOV PF, '
      '       CONDPAGIMOVEL  CP, '
      '       CONTRATOIMOVEL CI,'
      '       PESSOA P,          '
      '       ( '
      '         SELECT /*+ INDEX(LD) INDEX(RP)*/   '
      '                IDPARCFINANCIMOV, '
      
        '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.DATAPAGAMENTO' +
        '), MAX(RP.DATABAIXA) ) AS DATAPAGAMENTO, '
      
        '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), SUM' +
        '(LD.VALOR) ) AS VLRPAGO '
      
        '           FROM PARCFINANCIMOV P, LANCTODOCUM LD, RECBTOPAGTO RP' +
        ' '
      '          WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+)'
      '            AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) '
      '            AND LD.NUMLANCTO    = RP.NUMLANCTO(+)    '
      '            AND ( (P.CODDOCUMENTO IS NULL) OR        '
      
        '                  (P.CODDOCUMENTO IS NOT NULL AND (RP.DATABAIXA ' +
        'IS NOT NULL OR LD.CODALTERADOR = 215) ) )        '
      
        '            AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO <' +
        '=  TO_DATE('#39'11/08/2006'#39','#39'DD/MM/YYYY'#39')  ) OR '
      
        '                 (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPER' +
        'ACAO) = '#39'5'#39' OR LD.CODALTERADOR = 215 ) '
      
        '                                             AND LD.ESTORNO IS N' +
        'ULL                  '
      
        '                                             AND LD.DATALANCTO <' +
        '=  TO_DATE('#39'11/08/2006'#39','#39'DD/MM/YYYY'#39')  ) )'
      
        '          GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO             ' +
        '                     '
      '       ) PP, '
      '       ( SELECT DISTINCT  '
      '                IDPARCFINANCIMOV, '
      
        '                DECODE(IDDOCDIVERGE, NULL, NULL, 1) AS IDDOCDIVE' +
        'RGE '
      '           FROM CONCILIADOC '
      '          WHERE IDPARCFINANCIMOV IS NOT NULL '
      '            AND DATA <=  TO_DATE('#39'11/08/2006'#39','#39'DD/MM/YYYY'#39')'
      '            AND (IDDOCDIVERGE IS NOT NULL OR '
      
        '                 IDPARCFINANCIMOV NOT IN ( SELECT DISTINCT IDPAR' +
        'CFINANCIMOV    '
      
        '                                             FROM CONCILIADOC   ' +
        '               '
      
        '                                            WHERE IDPARCFINANCIM' +
        'OV IS NOT NULL '
      
        '                                              AND DATA <=  TO_DA' +
        'TE('#39'11/08/2006'#39','#39'DD/MM/YYYY'#39') '
      
        '                                              AND IDDOCDIVERGE I' +
        'S NOT NULL ) ) '
      '       ) CD,  '
      '       (  SELECT IDPARCFINANCIMOV, DATA, FLGTIPO,'
      '                 DECODE(FLGTIPO,'#39'M'#39', DECODE(QTDE,3,'#39'S'#39','#39'P'#39'), '
      '                                '#39'J'#39', DECODE(QTDE,3,'#39'S'#39','#39'P'#39'), '
      '                                '#39'C'#39', DECODE(QTDE,3,'#39'S'#39','#39'P'#39'), '
      
        '                                CONCILIADOC ) AS CONCILIADOC    ' +
        '   '
      '            FROM '
      
        '                 ( SELECT C.IDPARCFINANCIMOV,                   ' +
        '                '
      
        '                          DECODE(C.FLGTIPO, NULL, NULL,         ' +
        '                '
      
        '                                 '#39'R'#39', '#39'S'#39', '#39'T'#39', '#39'S'#39', '#39'M'#39','#39'P'#39','#39'J'#39 +
        ','#39'P'#39','#39'C'#39','#39'P'#39','
      
        '                                 '#39'A'#39', '#39'C'#39', P.FLGCONCILIADO ) AS ' +
        'CONCILIADOC,'
      
        '                          MAX(C.DATA) AS DATA, MAX(C.FLGTIPO) AS' +
        ' FLGTIPO, COUNT(*) AS QTDE '
      
        '                     FROM CONCILIADOC C, PARCFINANCIMOV P       ' +
        '                '
      
        '                    WHERE C.IDPARCFINANCIMOV = P.IDPARCFINANCIMO' +
        'V               '
      
        '                      AND C.FLGTIPO IN('#39'R'#39','#39'T'#39', '#39'A'#39','#39'M'#39','#39'J'#39','#39'C'#39')' +
        '    '
      
        '                      AND C.DATA <=  TO_DATE('#39'11/08/2006'#39','#39'DD/MM' +
        '/YYYY'#39') '
      
        '                      AND ( C.FLGTIPO = '#39'T'#39' OR                  ' +
        '              '
      
        '                            NOT EXISTS ( SELECT 1 FROM CONCILIAD' +
        'OC'
      
        '                                          WHERE FLGTIPO = '#39'T'#39'   ' +
        '              '
      
        '                                            AND IDPARCFINANCIMOV' +
        ' = C.IDPARCFINANCIMOV ) ) '
      
        '                    GROUP BY C.IDPARCFINANCIMOV,                ' +
        '                '
      
        '                             DECODE(C.FLGTIPO, NULL, NULL,      ' +
        '                '
      
        '                                 '#39'R'#39', '#39'S'#39', '#39'T'#39', '#39'S'#39', '#39'M'#39','#39'P'#39','#39'J'#39 +
        ','#39'P'#39','#39'C'#39','#39'P'#39', '
      
        '                                 '#39'A'#39', '#39'C'#39', P.FLGCONCILIADO ) ) )' +
        ' CD2,       '
      '       ( SELECT A.IDCONDINICIAL  AS IDCONDINICIAL, '
      '                A.NUMPARCELAS    AS NUMPARCELAS,'
      '                A.DATAINI,         '
      '                A.IDCONDPAGIMOVEL, '
      '                A.INDCORRECAO,     '
      '                A.MESREFREAJUSTE,  '
      '                DECODE(A.TIPOCONDPAG, '#39'V'#39', '#39'A Vista'#39', '
      '                                      '#39'S'#39', '#39'Sinal'#39',   '
      '                                      '#39'C'#39', '#39'Caução'#39',  '
      
        '                                      '#39'P'#39', '#39'Parcelamento'#39' ) AS T' +
        'IPOCONDPAG'
      '         FROM   CONDPAGIMOVEL A,                  '
      '                (SELECT   IDCONDINICIAL,          '
      '                          MAX(DATAINI) AS DATAINI '
      '                 FROM     CONDPAGIMOVEL           '
      '                 GROUP BY IDCONDINICIAL) B        '
      '         WHERE B.IDCONDINICIAL = A.IDCONDINICIAL  '
      '           AND B.DATAINI = A.DATAINI ) CPFINAL,   '
      '       ( SELECT DISTINCT'
      '                CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL, '
      '                M.IMONOME            AS NOMEMESTRE,'
      '                M.IDIMOVEL           AS IDIMOVEL'
      '           FROM CONTRATOXIMOVEL CXI,'
      '                IMOVEL I,'
      '                IMOVEL M'
      '          WHERE CXI.IDIMOVEL = I.IDIMOVEL'
      '            AND I.IDIMOVELMESTRE = M.IDIMOVEL ) IM,'
      '       ( SELECT /*+ INDEX(D) INDEX(LD)*/'
      '                LD.CODDOCUMENTO, T.CODTIPIMOVEL,'
      
        '                SUM( DECODE(LD.DEBCRE,'#39'D'#39', LD.VALOR, (LD.VALOR *' +
        ' -1)) ) AS TOT_ALTERADOR'
      '           FROM LANCTODOCUM LD, DOCUMENTO D, PARAMALIENACAO PA,'
      
        '                PARCFINANCIMOV P, CONDPAGIMOVEL C,  TIPOIMOVEL T' +
        ','
      
        '                ( SELECT DISTINCT C.IDCONTRATOIMOVEL, I.CODTIPIM' +
        'OVEL'
      
        '                    FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI, ' +
        'IMOVEL I'
      '                   WHERE CXI.IDIMOVEL = I.IDIMOVEL'
      
        '                     AND CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOV' +
        'EL'
      '                     AND C.FLGTIPOCONTRATO IN ('#39'C'#39','#39'A'#39') ) TC'
      '          WHERE RTRIM(LD.OPERACAO) = '#39'4'#39
      '            AND LD.CODALTERADOR <> 215'
      '         AND LD.CODALTERADOR <> 216'
      '            AND PA.IDPESSOA = 1'
      '            AND LD.CODDOCUMENTO = D.CODDOCUMENTO'
      '            AND D.CODDOCUMENTO = P.CODDOCUMENTO'
      '            AND P.IDCONDPAGIMOVEL = C.IDCONDPAGIMOVEL'
      '            AND C.IDCONTRATOIMOVEL = TC.IDCONTRATOIMOVEL'
      '            AND TC.CODTIPIMOVEL = T.CODTIPIMOVEL'
      
        '            AND LD.DATALANCTO <=  TO_DATE('#39'11/08/2006'#39','#39'DD/MM/YY' +
        'YY'#39')'
      '            AND ( PA.IDOPERATUALCM IS NULL OR               '
      '                  ( LD.CODALTERADOR <> T.CODALTCMAL AND     '
      '                    LD.CODALTERADOR <> T.CODALTJRAL AND     '
      '                    LD.CODALTERADOR <> T.CODALTMTAL ) )'
      '            AND D.IDMODULO = 135                            '
      '          GROUP BY LD.CODDOCUMENTO, T.CODTIPIMOVEL  )  ALT, '
      '       ( SELECT /*+ INDEX (D) INDEX(LD) */                  '
      '                LD.CODDOCUMENTO,                            '
      
        '                SUM( DECODE(LD.DEBCRE,'#39'D'#39', LD.VALOR, (LD.VALOR *' +
        ' -1)) ) AS TOT_CPMF '
      '           FROM LANCTODOCUM LD,                  '
      '                DOCUMENTO D                      '
      '          WHERE RTRIM(LD.OPERACAO) = '#39'4'#39
      '            AND CODALTERADOR = 215               '
      '            AND LD.CODDOCUMENTO = D.CODDOCUMENTO '
      '            AND D.IDMODULO = 135                 '
      '          GROUP BY LD.CODDOCUMENTO  )  CPMF,     '
      
        '       ( SELECT D1.IDPARCFINANCIMOV, D1.DATAOPER, D1.VLRRESIDUOC' +
        'ORRIG                       '
      '           FROM ( SELECT /*+ INDEX (L) */'
      
        '                         L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.V' +
        'LRACUM) AS VLRRESIDUOCORRIG '
      '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P'
      '                   WHERE /*(FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39')'
      '                     AND */P.IDPESSOA = 1'
      '                     AND L.IDMODULO = 135'
      '   AND L.IDCONTRATOIMOVEL = 0'
      '                     AND ( L.IDOPERACAO = P.IDOPERATUALRES )'
      
        '                   GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,' +
        '    '
      
        '                ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV, ' +
        'MAX(L2.DATAOPER) AS DTAPUR '
      '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2'
      '                   WHERE/*(FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39')'
      '                     AND */ P2.IDPESSOA = 1'
      '                     AND L2.IDMODULO = 135'
      '   AND L2.IDCONTRATOIMOVEL = 0'
      
        '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALRES )  ' +
        '  '
      
        '                     AND ( DATAOPER <=  TO_DATE('#39'11/08/2006'#39','#39'DD' +
        '/MM/YYYY'#39') )             '
      
        '                   GROUP BY L2.IDPARCFINANCIMOV ) D2            ' +
        '  '
      '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV'
      
        '            AND D1.DATAOPER = D2.DTAPUR                         ' +
        '  '
      
        '        ) AR,                                                   ' +
        '  '
      '        ( SELECT IDPARCCOBRADA, DATACOBRANCA AS DATACOBRES '
      '            FROM PARCEXTRAIMOV                             '
      '           WHERE FLGTIPOCOBRANCA = '#39'R'#39'                   '
      '         ) CR,                                             '
      
        '       ( SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.TOT_CORRECAO ' +
        '            '
      '           FROM ( SELECT /*+ INDEX (L) */'
      
        '                         L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.V' +
        'LRACUM) AS TOT_CORRECAO '
      
        '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P    ' +
        '            '
      
        '                   WHERE L.DATABAIXA IS NOT NULL                ' +
        '            '
      '                     AND /*(FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39')'
      '                     AND */L.IDMODULO = 135'
      '                     AND P.IDPESSOA = 1'
      '   AND L.IDCONTRATOIMOVEL = 0'
      '                     AND ( L.IDOPERACAO = P.IDOPERATUALMULTA OR'
      
        '                           L.IDOPERACAO = P.IDOPERATUALJUROS OR ' +
        '            '
      
        '                           L.IDOPERACAO = P.IDOPERATUALCM )     ' +
        '            '
      
        '                   GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,' +
        '            '
      
        '                ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,M' +
        'AX(L2.DATAOPER) AS DTAPUR '
      '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2'
      '                   WHERE /*(FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39')'
      '                     AND*/ P2.IDPESSOA = 1'
      '                     AND L2.IDMODULO = 135'
      '   AND L2.IDCONTRATOIMOVEL = 0'
      
        '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA O' +
        'R    '
      
        '                           L2.IDOPERACAO = P2.IDOPERATUALJUROS O' +
        'R    '
      
        '                           L2.IDOPERACAO = P2.IDOPERATUALCM )   ' +
        '     '
      
        '                     AND ( DATAOPER <=  TO_DATE('#39'11/08/2006'#39','#39'DD' +
        '/MM/YYYY'#39') )                '
      '                   GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '            AND D1.DATAOPER = D2.DTAPUR'
      '       ) CO1,'
      
        '       ( SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.TOT_CORRECAO ' +
        '            '
      
        '           FROM ( SELECT /*+ INDEX (L) */                       ' +
        '            '
      
        '                         L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.V' +
        'LRACUM) AS TOT_CORRECAO '
      '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P'
      '                   WHERE /*(FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39')'
      '                     AND*/ L.IDMODULO = 135'
      '                     AND P.IDPESSOA = 1'
      '   AND L.IDCONTRATOIMOVEL = 0'
      
        '                     AND ( L.IDOPERACAO = P.IDOPERATUALMULTA OR ' +
        '            '
      
        '                           L.IDOPERACAO = P.IDOPERATUALJUROS OR ' +
        '            '
      
        '                           L.IDOPERACAO = P.IDOPERATUALCM )     ' +
        '            '
      
        '                   GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,' +
        '            '
      
        '                ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,M' +
        'AX(L2.DATAOPER) AS DTAPUR '
      
        '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2  ' +
        '      '
      '                   WHERE /*(FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39')'
      '                     AND */P2.IDPESSOA = 1'
      '                     AND L2.IDMODULO = 135'
      '   AND L2.IDCONTRATOIMOVEL = 0'
      
        '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA O' +
        'R    '
      
        '                           L2.IDOPERACAO = P2.IDOPERATUALJUROS O' +
        'R    '
      
        '                           L2.IDOPERACAO = P2.IDOPERATUALCM )   ' +
        '     '
      
        '                     AND ( DATAOPER <=  TO_DATE('#39'11/08/2006'#39','#39'DD' +
        '/MM/YYYY'#39') )                '
      '                   GROUP BY L2.IDPARCFINANCIMOV ) D2'
      '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '            AND D1.DATAOPER = D2.DTAPUR                   '
      '        ) CO2,                                            '
      
        '       ( SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.TOT_ABONO    ' +
        '         '
      '           FROM ( SELECT /*+ INDEX (L) */'
      
        '                         L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.V' +
        'LRACUM) AS TOT_ABONO '
      
        '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P    ' +
        '            '
      '                   WHERE /*(FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39')'
      '                     AND */L.IDMODULO = 135'
      '                     AND P.IDPESSOA = 1'
      '   AND L.IDCONTRATOIMOVEL = 0'
      
        '                     AND ( L.IDOPERACAO = P.IDOPERABONOMULTA OR ' +
        '            '
      
        '                           L.IDOPERACAO = P.IDOPERABONOJUROS OR ' +
        '            '
      
        '                           L.IDOPERACAO = P.IDOPERABONOCM )     ' +
        '            '
      
        '                   GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,' +
        '            '
      
        '                ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,M' +
        'AX(L2.DATAOPER) AS DTAPUR'
      
        '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2  ' +
        '      '
      '                   WHERE /*(FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39')'
      '                     AND */P2.IDPESSOA = 1'
      '                     AND L2.IDMODULO = 135'
      '   AND L2.IDCONTRATOIMOVEL = 0'
      
        '                     AND ( L2.IDOPERACAO = P2.IDOPERABONOMULTA O' +
        'R    '
      
        '                           L2.IDOPERACAO = P2.IDOPERABONOJUROS O' +
        'R    '
      '                           L2.IDOPERACAO = P2.IDOPERABONOCM )'
      
        '                     AND ( DATAOPER <=  TO_DATE('#39'11/08/2006'#39','#39'DD' +
        '/MM/YYYY'#39') )                '
      '                   GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '            AND D1.DATAOPER = D2.DTAPUR                   '
      '        ) ABONO                                          '
      '  WHERE (PF.FLGTIPOLANC IN (1,2,3,4,5,6,7,8,9,10,12))  '
      '    AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)      '
      '    AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      '    AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL)  '
      '    AND (P.IDPESSOA(+) = CI.IDLOCATARIO)               '
      '    AND (PP.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '
      '    AND (CO1.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)'
      '    AND (CO2.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)'
      '    AND (ABONO.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)'
      '    AND (AR.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '
      '    AND (CR.IDPARCCOBRADA(+)    = PF.IDPARCFINANCIMOV)'
      '    AND (CD.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)  '
      '    AND (CD2.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '
      '    AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL)  '
      '    AND (ALT.CODDOCUMENTO(+) = PF.CODDOCUMENTO)         '
      '    AND (CPMF.CODDOCUMENTO(+) = PF.CODDOCUMENTO)        '
      '    AND CI.IDCONTRATOIMOVEL = 0'
      
        '    AND ( (PF.DATAVENCIMENTO IS NULL) OR (PF.DATAVENCIMENTO <=  ' +
        'TO_DATE('#39'11/08/2006'#39','#39'DD/MM/YYYY'#39') ) OR '
      
        '          (PP.DATAPAGAMENTO <=  TO_DATE('#39'11/08/2006'#39','#39'DD/MM/YYYY' +
        #39') ) )'
      '    AND EXISTS (SELECT 1'
      '                  FROM CONTRATOXIMOVEL CXI,'
      '                       PLANOPATROXIMOVEL PPI'
      
        '                 WHERE CXI.IDCONTRATOIMOVEL(+) = IM.IDCONTRATOIM' +
        'OVEL'
      '                   AND CXI.IDIMOVEL = PPI.IDIMOVEL)'
      
        '  ORDER BY CI.CONNUMERO, PF.IDCONDPAGIMOVEL, DATAVENCIMENTO, PF.' +
        'FLGTIPOLANC, NUMPARCELA ')
    UpdateObject = updExtrato
    ValidateWithMask = True
    Left = 34
    Top = 171
    object qryExtratoIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
    end
    object qryExtratoIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryExtratoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryExtratoCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryExtratoCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object qryExtratoCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
    end
    object qryExtratoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryExtratoNOMEMESTRE: TStringField
      FieldName = 'NOMEMESTRE'
      Size = 60
    end
    object qryExtratoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryExtratoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryExtratoNUMPARCELA: TStringField
      FieldName = 'NUMPARCELA'
      Size = 81
    end
    object qryExtratoDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryExtratoVLRJUROS: TFloatField
      FieldName = 'VLRJUROS'
    end
    object qryExtratoVLRAMORTIZACAO: TFloatField
      FieldName = 'VLRAMORTIZACAO'
    end
    object qryExtratoVLRSALDODEVEDOR: TFloatField
      FieldName = 'VLRSALDODEVEDOR'
    end
    object qryExtratoVLRPRESTATUALIZADA: TFloatField
      FieldName = 'VLRPRESTATUALIZADA'
    end
    object qryExtratoVLRRESIDUO: TFloatField
      FieldName = 'VLRRESIDUO'
    end
    object qryExtratoVLRRESIDUOATUALI: TFloatField
      FieldName = 'VLRRESIDUOATUALI'
    end
    object qryExtratoVLRCORRIGIDOATRASO: TFloatField
      FieldName = 'VLRCORRIGIDOATRASO'
    end
    object qryExtratoVLRMULTAATRASO: TFloatField
      FieldName = 'VLRMULTAATRASO'
    end
    object qryExtratoVLRMORAATRASO: TFloatField
      FieldName = 'VLRMORAATRASO'
    end
    object qryExtratoFLGTIPOLANC: TFloatField
      FieldName = 'FLGTIPOLANC'
    end
    object qryExtratoDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
    end
    object qryExtratoVLRPAGO: TFloatField
      FieldName = 'VLRPAGO'
    end
    object qryExtratoCAL_TIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CAL_TIPO'
      Calculated = True
    end
    object qryExtratoVLRDIF: TFloatField
      FieldName = 'VLRDIF'
    end
    object qryExtratoVLRPROPOSTA: TFloatField
      FieldName = 'VLRPROPOSTA'
    end
    object qryExtratoIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
    end
    object qryExtratoIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object qryExtratoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryExtratoVLRPRESTACAO: TFloatField
      FieldName = 'VLRPRESTACAO'
    end
    object qryExtratoFLGRESIDUOINCORP: TStringField
      FieldName = 'FLGRESIDUOINCORP'
      FixedChar = True
      Size = 1
    end
    object qryExtratoVLRCORRIG: TFloatField
      FieldName = 'VLRCORRIG'
    end
    object qryExtratoFLGLANCINTEGRA: TFloatField
      FieldName = 'FLGLANCINTEGRA'
    end
    object qryExtratoCAL_ABONO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CAL_ABONO'
      Calculated = True
    end
    object qryExtratoFLGCONCILIADO: TStringField
      FieldName = 'FLGCONCILIADO'
      FixedChar = True
      Size = 1
    end
    object qryExtratoIDREPACTUA: TFloatField
      FieldName = 'IDREPACTUA'
    end
    object qryExtratoTOT_ALTERADOR: TFloatField
      FieldName = 'TOT_ALTERADOR'
    end
    object qryExtratoTOT_DEVIDO: TFloatField
      FieldName = 'TOT_DEVIDO'
    end
    object qryExtratoVLRNOMINAL: TFloatField
      FieldName = 'VLRNOMINAL'
    end
    object qryExtratoVLRSALDOATUAL: TFloatField
      FieldName = 'VLRSALDOATUAL'
    end
    object qryExtratoIDDOCDIVERGE: TStringField
      FieldName = 'IDDOCDIVERGE'
      Size = 1
    end
    object qryExtratoDATALIMITE: TDateTimeField
      FieldName = 'DATALIMITE'
    end
    object qryExtratoVLRRESIDUOCORRIG: TFloatField
      FieldName = 'VLRRESIDUOCORRIG'
    end
    object qryExtratoIDCORR_CONDPAG: TFloatField
      FieldName = 'IDCORR_CONDPAG'
    end
    object qryExtratoMESREF_CONDPAG: TFloatField
      FieldName = 'MESREF_CONDPAG'
    end
    object qryExtratoTOT_CPMF: TFloatField
      FieldName = 'TOT_CPMF'
    end
    object qryExtratoTIPOCONDPAG: TStringField
      FieldName = 'TIPOCONDPAG'
      Size = 12
    end
    object qryExtratoNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryExtratoDATA_CORRECAO: TDateTimeField
      FieldName = 'DATA_CORRECAO'
    end
    object qryExtratoMESANO_VENCIMENTO: TStringField
      FieldName = 'MESANO_VENCIMENTO'
      Size = 6
    end
    object qryExtratoMESANO_CALCULO: TStringField
      FieldName = 'MESANO_CALCULO'
      FixedChar = True
      Size = 6
    end
    object qryExtratoNUMPARC: TFloatField
      FieldName = 'NUMPARC'
    end
    object qryExtratoNUMDOC: TFloatField
      FieldName = 'NUMDOC'
    end
    object qryExtratoDATA_BASE: TDateTimeField
      FieldName = 'DATA_BASE'
    end
    object qryExtratoDATACOBRES: TDateTimeField
      FieldName = 'DATACOBRES'
    end
  end
  object dsExtrato: TwwDataSource
    DataSet = qryExtrato
    Left = 124
    Top = 170
  end
  object pplExtrato: TppBDEPipeline
    DataSource = dsExtrato
    UserName = 'lExtrato'
    Left = 394
    Top = 98
    object pplExtratoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPARCFINANCIMOV'
      FieldName = 'IDPARCFINANCIMOV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplExtratoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONDPAGIMOVEL'
      FieldName = 'IDCONDPAGIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplExtratoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplExtratoppField4: TppField
      FieldAlias = 'CONNUMERO'
      FieldName = 'CONNUMERO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 3
    end
    object pplExtratoppField5: TppField
      FieldAlias = 'CONNOME'
      FieldName = 'CONNOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pplExtratoppField6: TppField
      FieldAlias = 'CONDATAINICIO'
      FieldName = 'CONDATAINICIO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object pplExtratoppField7: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object pplExtratoppField8: TppField
      FieldAlias = 'NOMEMESTRE'
      FieldName = 'NOMEMESTRE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object pplExtratoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplExtratoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplExtratoppField11: TppField
      FieldAlias = 'NUMPARCELA'
      FieldName = 'NUMPARCELA'
      FieldLength = 81
      DisplayWidth = 81
      Position = 10
    end
    object pplExtratoppField12: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object pplExtratoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRJUROS'
      FieldName = 'VLRJUROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplExtratoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRAMORTIZACAO'
      FieldName = 'VLRAMORTIZACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplExtratoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRSALDODEVEDOR'
      FieldName = 'VLRSALDODEVEDOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplExtratoppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPRESTATUALIZADA'
      FieldName = 'VLRPRESTATUALIZADA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplExtratoppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRESIDUO'
      FieldName = 'VLRRESIDUO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplExtratoppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRESIDUOATUALI'
      FieldName = 'VLRRESIDUOATUALI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplExtratoppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCORRIGIDOATRASO'
      FieldName = 'VLRCORRIGIDOATRASO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplExtratoppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMULTAATRASO'
      FieldName = 'VLRMULTAATRASO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplExtratoppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMORAATRASO'
      FieldName = 'VLRMORAATRASO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplExtratoppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGTIPOLANC'
      FieldName = 'FLGTIPOLANC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplExtratoppField23: TppField
      FieldAlias = 'DATAPAGAMENTO'
      FieldName = 'DATAPAGAMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 22
    end
    object pplExtratoppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPAGO'
      FieldName = 'VLRPAGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplExtratoppField25: TppField
      FieldAlias = 'CAL_TIPO'
      FieldName = 'CAL_TIPO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 24
    end
    object pplExtratoppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRDIF'
      FieldName = 'VLRDIF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplExtratoppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPROPOSTA'
      FieldName = 'VLRPROPOSTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplExtratoppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCIDADES'
      FieldName = 'IDCIDADES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object pplExtratoppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPAIS'
      FieldName = 'IDPAIS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object pplExtratoppField30: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 29
    end
    object pplExtratoppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPRESTACAO'
      FieldName = 'VLRPRESTACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object pplExtratoppField32: TppField
      FieldAlias = 'FLGRESIDUOINCORP'
      FieldName = 'FLGRESIDUOINCORP'
      FieldLength = 1
      DisplayWidth = 1
      Position = 31
    end
    object pplExtratoppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCORRIG'
      FieldName = 'VLRCORRIG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object pplExtratoppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGLANCINTEGRA'
      FieldName = 'FLGLANCINTEGRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object pplExtratoppField35: TppField
      FieldAlias = 'CAL_ABONO'
      FieldName = 'CAL_ABONO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 34
    end
    object pplExtratoppField36: TppField
      FieldAlias = 'FLGCONCILIADO'
      FieldName = 'FLGCONCILIADO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 35
    end
    object pplExtratoppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDREPACTUA'
      FieldName = 'IDREPACTUA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object pplExtratoppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_ALTERADOR'
      FieldName = 'TOT_ALTERADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 37
    end
    object pplExtratoppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_DEVIDO'
      FieldName = 'TOT_DEVIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object pplExtratoppField40: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRNOMINAL'
      FieldName = 'VLRNOMINAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 39
    end
    object pplExtratoppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRSALDOATUAL'
      FieldName = 'VLRSALDOATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 40
    end
    object pplExtratoppField42: TppField
      FieldAlias = 'IDDOCDIVERGE'
      FieldName = 'IDDOCDIVERGE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 41
    end
    object pplExtratoppField43: TppField
      FieldAlias = 'DATALIMITE'
      FieldName = 'DATALIMITE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 42
    end
    object pplExtratoppField44: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRESIDUOCORRIG'
      FieldName = 'VLRRESIDUOCORRIG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 43
    end
    object pplExtratoppField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCORR_CONDPAG'
      FieldName = 'IDCORR_CONDPAG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 44
    end
    object pplExtratoppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'MESREF_CONDPAG'
      FieldName = 'MESREF_CONDPAG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object pplExtratoppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_CPMF'
      FieldName = 'TOT_CPMF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 46
    end
    object pplExtratoppField48: TppField
      FieldAlias = 'TIPOCONDPAG'
      FieldName = 'TIPOCONDPAG'
      FieldLength = 12
      DisplayWidth = 12
      Position = 47
    end
    object pplExtratoppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMPARCELAS'
      FieldName = 'NUMPARCELAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 48
    end
    object pplExtratoppField50: TppField
      FieldAlias = 'DATA_CORRECAO'
      FieldName = 'DATA_CORRECAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 49
    end
    object pplExtratoppField51: TppField
      FieldAlias = 'MESANO_VENCIMENTO'
      FieldName = 'MESANO_VENCIMENTO'
      FieldLength = 6
      DisplayWidth = 6
      Position = 50
    end
    object pplExtratoppField52: TppField
      FieldAlias = 'MESANO_CALCULO'
      FieldName = 'MESANO_CALCULO'
      FieldLength = 6
      DisplayWidth = 6
      Position = 51
    end
    object pplExtratoppField53: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMPARC'
      FieldName = 'NUMPARC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 52
    end
    object pplExtratoppField54: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMDOC'
      FieldName = 'NUMDOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 53
    end
    object pplExtratoppField55: TppField
      FieldAlias = 'DATA_BASE'
      FieldName = 'DATA_BASE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 54
    end
    object pplExtratoppField56: TppField
      FieldAlias = 'DATACOBRES'
      FieldName = 'DATACOBRES'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 55
    end
  end
  object rpExtrato: TppReport
    AutoStop = False
    DataPipeline = pplExtrato
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    BeforePrint = gfbExtratoAfterPrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 322
    Top = 170
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplExtrato'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17463
      mmPrintPosition = 0
      object ppTituloExtrato: TppLabel
        UserName = 'ppTituloExtrato'
        AutoSize = False
        Caption = 'Extrato de Alienação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8467
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel43: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284428
        BandType = 0
      end
    end
    object ppdbDetalhe: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object pplSeparador3: TppLine
        OnPrint = pplnSeparadorPrint
        UserName = 'lSeparador3'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppsCor3: TppShape
        OnPrint = ppsCorPrint
        UserName = 'sCor3'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'NUMPARCELA'
        DataPipeline = pplExtrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 10848
        BandType = 4
      end
      object ppdbtVencto: TppDBText
        UserName = 'DBText10'
        DataField = 'DATAVENCIMENTO'
        DataPipeline = pplExtrato
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 11642
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText11'
        BlankWhenZero = True
        DataField = 'VLRPRESTACAO'
        DataPipeline = pplExtrato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 102129
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText13'
        BlankWhenZero = True
        DataField = 'VLRAMORTIZACAO'
        DataPipeline = pplExtrato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 84931
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppdbtSaldo: TppDBText
        UserName = 'DBText14'
        BlankWhenZero = True
        DataField = 'VLRSALDOATUAL'
        DataPipeline = pplExtrato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 64029
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'DBText27'
        DataField = 'DATAPAGAMENTO'
        DataPipeline = pplExtrato
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 184944
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText38'
        BlankWhenZero = True
        DataField = 'VLRPAGO'
        DataPipeline = pplExtrato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 201877
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppdbtTipo: TppDBText
        UserName = 'dbtTipo'
        DataField = 'CAL_TIPO'
        DataPipeline = pplExtrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 41010
        mmTop = 0
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        BlankWhenZero = True
        DataField = 'VLRDIF'
        DataPipeline = pplExtrato
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 220928
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        BlankWhenZero = True
        DataField = 'VLRCORRIG'
        DataPipeline = pplExtrato
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 242094
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'dbtTipo1'
        DataField = 'CAL_ABONO'
        DataPipeline = pplExtrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 261938
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText1'
        BlankWhenZero = True
        DataField = 'TOT_ALTERADOR'
        DataPipeline = pplExtrato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 120121
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText2'
        BlankWhenZero = True
        DataField = 'TOT_DEVIDO'
        DataPipeline = pplExtrato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 147638
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DATALIMITE'
        DataPipeline = pplExtrato
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 167746
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText3'
        BlankWhenZero = True
        DataField = 'TOT_CPMF'
        DataPipeline = pplExtrato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 135732
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText94: TppDBText
        UserName = 'DBText94'
        BlankWhenZero = True
        DataField = 'NUMDOC'
        DataPipeline = pplExtrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 27517
        mmTop = 0
        mmWidth = 12435
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppSystemVariable7: TppSystemVariable
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
        mmWidth = 284163
        BandType = 8
      end
      object ppLine5: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel44: TppLabel
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
        mmWidth = 283898
        BandType = 8
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 256382
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplExtrato
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplExtrato'
      object ghbExtrato: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 22490
        mmPrintPosition = 0
        object ppRegion3: TppRegion
          UserName = 'Region1'
          Brush.Style = bsClear
          Stretch = True
          Transparent = True
          mmHeight = 20108
          mmLeft = 0
          mmTop = 2381
          mmWidth = 284163
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel45: TppLabel
            UserName = 'Label31'
            Caption = 'Contrato:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 1588
            mmTop = 3704
            mmWidth = 15875
            BandType = 3
            GroupNo = 0
          end
          object ppDBText45: TppDBText
            UserName = 'DBText18'
            AutoSize = True
            DataField = 'CONNUMERO'
            DataPipeline = pplExtrato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 4022
            mmLeft = 29898
            mmTop = 3969
            mmWidth = 23453
            BandType = 3
            GroupNo = 0
          end
          object ppDBText46: TppDBText
            UserName = 'DBText19'
            DataField = 'CONNOME'
            DataPipeline = pplExtrato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3969
            mmLeft = 54240
            mmTop = 3969
            mmWidth = 141023
            BandType = 3
            GroupNo = 0
          end
          object ppLabel46: TppLabel
            UserName = 'Label32'
            Caption = 'Valor da  Venda:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3175
            mmLeft = 54504
            mmTop = 10319
            mmWidth = 22225
            BandType = 3
            GroupNo = 0
          end
          object ppDBText47: TppDBText
            UserName = 'DBText20'
            DataField = 'VLRPROPOSTA'
            DataPipeline = pplExtrato
            DisplayFormat = '#,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3175
            mmLeft = 82286
            mmTop = 10319
            mmWidth = 17198
            BandType = 3
            GroupNo = 0
          end
          object ppLabel47: TppLabel
            UserName = 'Label37'
            AutoSize = False
            Caption = 'Data da Proposta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3704
            mmLeft = 1588
            mmTop = 10319
            mmWidth = 25400
            BandType = 3
            GroupNo = 0
          end
          object ppDBText48: TppDBText
            UserName = 'DBText25'
            DataField = 'CONDATAINICIO'
            DataPipeline = pplExtrato
            DisplayFormat = 'dd/mm/yyyy'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3175
            mmLeft = 29898
            mmTop = 10319
            mmWidth = 15081
            BandType = 3
            GroupNo = 0
          end
          object ppLabel48: TppLabel
            UserName = 'Label38'
            Caption = 'Comprador:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 1588
            mmTop = 16669
            mmWidth = 16140
            BandType = 3
            GroupNo = 0
          end
          object ppDBText49: TppDBText
            UserName = 'DBText26'
            AutoSize = True
            DataField = 'RAZAOSOCIAL'
            DataPipeline = pplExtrato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3260
            mmLeft = 29898
            mmTop = 16669
            mmWidth = 20193
            BandType = 3
            GroupNo = 0
          end
          object ppLabel49: TppLabel
            UserName = 'Label49'
            Caption = 'Imóvel Mestre:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3175
            mmLeft = 104511
            mmTop = 10319
            mmWidth = 19579
            BandType = 3
            GroupNo = 0
          end
          object ppDBText37: TppDBText
            UserName = 'DBText37'
            AutoSize = True
            DataField = 'NOMEMESTRE'
            DataPipeline = pplExtrato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3260
            mmLeft = 128323
            mmTop = 10319
            mmWidth = 20278
            BandType = 3
            GroupNo = 0
          end
        end
      end
      object gfbExtrato: TppGroupFooterBand
        AfterPrint = gfbExtratoAfterPrint
        BeforePrint = gfbExtratoBeforePrint
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 66940
        mmPrintPosition = 0
        object ppRegion2: TppRegion
          UserName = 'Region2'
          mmHeight = 50800
          mmLeft = 0
          mmTop = 8467
          mmWidth = 91017
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object pplSaldoDev: TppLabel
            UserName = 'lSaldoDev'
            AutoSize = False
            Caption = 'Saldo Devedor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 2910
            mmTop = 13758
            mmWidth = 57679
            BandType = 5
            GroupNo = 0
          end
          object ppLabel35: TppLabel
            UserName = 'Label35'
            Caption = 'Prestações em Atraso'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 2910
            mmTop = 24342
            mmWidth = 26723
            BandType = 5
            GroupNo = 0
          end
          object ppLabel36: TppLabel
            UserName = 'Label36'
            Caption = 'Divergências de Pagamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 2910
            mmTop = 29898
            mmWidth = 33867
            BandType = 5
            GroupNo = 0
          end
          object iAtraso: TppVariable
            UserName = 'iAtraso'
            AutoSize = False
            CalcOrder = 0
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetComponent = ghbExtrato
            ResetType = veGroupStart
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 61648
            mmTop = 24342
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object ppLabel104: TppLabel
            UserName = 'Label104'
            Caption = 'Saldo Devedor Total'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 2646
            mmTop = 51858
            mmWidth = 34131
            BandType = 5
            GroupNo = 0
          end
          object iSaldoTot: TppVariable
            UserName = 'iSaldoTot'
            AutoSize = False
            CalcOrder = 1
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            ResetComponent = ghbExtrato
            ResetType = veGroupStart
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 4233
            mmLeft = 61383
            mmTop = 51858
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object iDiverg: TppVariable
            UserName = 'iDiverg'
            AutoSize = False
            CalcOrder = 2
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetComponent = ghbExtrato
            ResetType = veGroupStart
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 61648
            mmTop = 29898
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object iResiduo: TppVariable
            UserName = 'iResiduo'
            AutoSize = False
            CalcOrder = 3
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetComponent = ghbExtrato
            ResetType = veGroupStart
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 37306
            mmTop = 40746
            mmWidth = 21960
            BandType = 5
            GroupNo = 0
          end
          object ppLabel107: TppLabel
            UserName = 'Label107'
            Caption = 'Resíduo Final de Parcelas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 2910
            mmTop = 40746
            mmWidth = 33338
            BandType = 5
            GroupNo = 0
          end
          object ppLabel34: TppLabel
            UserName = 'Label34'
            Caption = 'Acerto de Divergências'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 2910
            mmTop = 35190
            mmWidth = 28046
            BandType = 5
            GroupNo = 0
          end
          object iAcerto: TppVariable
            UserName = 'iAcerto'
            AutoSize = False
            CalcOrder = 4
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetComponent = ghbExtrato
            ResetType = veGroupStart
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 61648
            mmTop = 35190
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object iSD: TppVariable
            UserName = 'iSD'
            AutoSize = False
            CalcOrder = 5
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 61648
            mmTop = 13758
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object iResiduoAtual: TppVariable
            UserName = 'iResiduoAtual'
            AutoSize = False
            CalcOrder = 6
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetComponent = ghbExtrato
            ResetType = veGroupStart
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 61648
            mmTop = 40746
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object ppLabel42: TppLabel
            UserName = 'Label42'
            Caption = 'Prestação do Mês a vencer'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 2910
            mmTop = 19050
            mmWidth = 34396
            BandType = 5
            GroupNo = 0
          end
          object iPrestMes: TppVariable
            UserName = 'iPrestMes'
            AutoSize = False
            CalcOrder = 7
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 61648
            mmTop = 19050
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object ppLabelCorrecaoIncorp: TppLabel
            UserName = 'LabelCorrecaoIncorp'
            Caption = 'Correções Incorporadas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            Visible = False
            mmHeight = 3175
            mmLeft = 2910
            mmTop = 46038
            mmWidth = 30427
            BandType = 5
            GroupNo = 0
          end
          object CorrecaoIncorporada: TppVariable
            UserName = 'CorrecaoIncorporada'
            AutoSize = False
            CalcOrder = 8
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            Visible = False
            mmHeight = 3175
            mmLeft = 61648
            mmTop = 46038
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
        end
        object lblDtLimite: TppLabel
          UserName = 'lblDtLimite'
          Caption = 'lblDtLimite'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          Visible = False
          mmHeight = 3175
          mmLeft = 105569
          mmTop = 8996
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
        end
        object relExtratolblDataCorrecao: TppLabel
          UserName = 'relExtratolblDataCorrecao'
          AutoSize = False
          Caption = 'Valores Corrigidos até: 01/01/01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsItalic]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 2910
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object ppRegion7: TppRegion
          UserName = 'Region4'
          Stretch = True
          mmHeight = 7673
          mmLeft = 124619
          mmTop = 14288
          mmWidth = 121709
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppsrSegregacao: TppSubReport
            OnPrint = ppsrSegregacaoPrint
            UserName = 'srSegregacao'
            ExpandAll = False
            NewPrintJob = False
            OutlineSettings.CreateNode = True
            ParentPrinterSetup = False
            ParentWidth = False
            TraverseAllData = False
            DataPipelineName = 'pplSegregExtrato'
            mmHeight = 4763
            mmLeft = 126207
            mmTop = 15610
            mmWidth = 116681
            BandType = 5
            GroupNo = 0
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            object ppChildReport3: TppChildReport
              AutoStop = False
              DataPipeline = pplSegregExtrato
              PrinterSetup.BinName = 'Default'
              PrinterSetup.DocumentName = 'PpModeloReport1'
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
              Left = 176
              Top = 224
              Version = '7.04'
              mmColumnWidth = 0
              DataPipelineName = 'pplSegregExtrato'
              object ppTitleBand3: TppTitleBand
                mmBottomOffset = 0
                mmHeight = 7408
                mmPrintPosition = 0
                object ppLblPlanoExtrato: TppLabel
                  UserName = 'LblPlanoExtrato'
                  Caption = 'Plano'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 2117
                  mmTop = 1323
                  mmWidth = 7673
                  BandType = 1
                end
                object ppLblPatroExtrato: TppLabel
                  UserName = 'LblPatroExtrato'
                  Caption = 'Patrocinadora'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 45244
                  mmTop = 1323
                  mmWidth = 22754
                  BandType = 1
                end
                object ppLblPecentExtrato: TppLabel
                  UserName = 'LblPecentExtrato'
                  Caption = '%'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 80433
                  mmTop = 1323
                  mmWidth = 2910
                  BandType = 1
                end
                object ppLblValorExtrato: TppLabel
                  UserName = 'LblValorExtrato'
                  Caption = 'Valor (R$)'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 101071
                  mmTop = 1323
                  mmWidth = 14023
                  BandType = 1
                end
                object ppLine4: TppLine
                  UserName = 'Line2'
                  Weight = 0.75
                  mmHeight = 794
                  mmLeft = 1588
                  mmTop = 5821
                  mmWidth = 118004
                  BandType = 1
                end
              end
              object ppDetailBand1: TppDetailBand
                mmBottomOffset = 0
                mmHeight = 5027
                mmPrintPosition = 0
                object ppDBPlanoExtrato: TppDBText
                  UserName = 'DBPlanoExtrato'
                  AutoSize = True
                  DataField = 'PLANOPREV'
                  DataPipeline = pplSegregExtrato
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ParentDataPipeline = False
                  Transparent = True
                  DataPipelineName = 'pplSegregExtrato'
                  mmHeight = 3260
                  mmLeft = 2646
                  mmTop = 529
                  mmWidth = 17357
                  BandType = 4
                end
                object ppDBPatroExtrato: TppDBText
                  UserName = 'DBPatroExtrato'
                  AutoSize = True
                  DataField = 'PATRO'
                  DataPipeline = pplSegregExtrato
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ParentDataPipeline = False
                  Transparent = True
                  DataPipelineName = 'pplSegregExtrato'
                  mmHeight = 3260
                  mmLeft = 45773
                  mmTop = 529
                  mmWidth = 9779
                  BandType = 4
                end
                object ppDBPercentExtrato: TppDBText
                  UserName = 'DBPercentExtrato'
                  DataField = 'PERCENTRATEIO'
                  DataPipeline = pplSegregExtrato
                  DisplayFormat = '#,##0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ParentDataPipeline = False
                  TextAlignment = taCentered
                  Transparent = True
                  DataPipelineName = 'pplSegregExtrato'
                  mmHeight = 3175
                  mmLeft = 76200
                  mmTop = 529
                  mmWidth = 12700
                  BandType = 4
                end
                object ppDBValorExtrato: TppDBText
                  UserName = 'DBValorExtrato'
                  AutoSize = True
                  DataField = 'VALOR'
                  DataPipeline = pplSegregExtrato
                  DisplayFormat = '###,##0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ParentDataPipeline = False
                  TextAlignment = taRightJustified
                  Transparent = True
                  DataPipelineName = 'pplSegregExtrato'
                  mmHeight = 3260
                  mmLeft = 106013
                  mmTop = 529
                  mmWidth = 9610
                  BandType = 4
                end
              end
              object ppSummaryBand6: TppSummaryBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object raCodeModule6: TraCodeModule
                ProgramStream = {00}
              end
            end
          end
        end
        object ppLabel127: TppLabel
          UserName = 'Label127'
          Caption = 'Resumo de Segregação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 124619
          mmTop = 8466
          mmWidth = 39836
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplExtrato
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplExtrato'
      object ppghCab: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLine8: TppLine
          UserName = 'Line7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 3969
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel57: TppLabel
          UserName = 'Label18'
          AutoSize = False
          Caption = 'Parc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 3969
          mmTop = 0
          mmWidth = 6879
          BandType = 3
          GroupNo = 1
        end
        object ppLabel58: TppLabel
          UserName = 'Label19'
          AutoSize = False
          Caption = 'Vencto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 11642
          mmTop = 0
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object ppLabel59: TppLabel
          UserName = 'Label20'
          AutoSize = False
          Caption = 'Prestação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 104246
          mmTop = 0
          mmWidth = 14817
          BandType = 3
          GroupNo = 1
        end
        object ppLabel61: TppLabel
          UserName = 'Label22'
          AutoSize = False
          Caption = 'Amortiz.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 87577
          mmTop = 0
          mmWidth = 13758
          BandType = 3
          GroupNo = 1
        end
        object ppLabel62: TppLabel
          UserName = 'Label23'
          AutoSize = False
          Caption = 'Saldo Devedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 62971
          mmTop = 0
          mmWidth = 21167
          BandType = 3
          GroupNo = 1
        end
        object ppLabel67: TppLabel
          UserName = 'Label24'
          AutoSize = False
          Caption = 'Data Pagto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 185209
          mmTop = 0
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object ppLabel63: TppLabel
          UserName = 'Label63'
          AutoSize = False
          Caption = 'Valor Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 203200
          mmTop = 0
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object ppLabel50: TppLabel
          UserName = 'Label50'
          AutoSize = False
          Caption = 'Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 41010
          mmTop = 0
          mmWidth = 18521
          BandType = 3
          GroupNo = 1
        end
        object ppLabel51: TppLabel
          UserName = 'Label51'
          AutoSize = False
          Caption = 'Divergências'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 220398
          mmTop = 0
          mmWidth = 18785
          BandType = 3
          GroupNo = 1
        end
        object ppLabel41: TppLabel
          UserName = 'Label41'
          AutoSize = False
          Caption = 'Vlr Atualizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 240242
          mmTop = 0
          mmWidth = 20108
          BandType = 3
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label201'
          AutoSize = False
          Caption = 'Alterador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 120121
          mmTop = 0
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppLabel3: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Observações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 261938
          mmTop = 0
          mmWidth = 20108
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Vlr. Devido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 148167
          mmTop = 0
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'Data Limite'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 166688
          mmTop = 0
          mmWidth = 16669
          BandType = 3
          GroupNo = 1
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          AutoSize = False
          Caption = 'Cpmf'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 136790
          mmTop = 265
          mmWidth = 8996
          BandType = 3
          GroupNo = 1
        end
        object ppLabel124: TppLabel
          UserName = 'Label124'
          AutoSize = False
          Caption = 'Docum'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 27252
          mmTop = 0
          mmWidth = 12700
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'IDCONDPAGIMOVEL'
      DataPipeline = pplExtrato
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplExtrato'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object gfbCondPag: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 13229
        mmPrintPosition = 0
        object ppRegion4: TppRegion
          UserName = 'Region3'
          mmHeight = 10848
          mmLeft = 5292
          mmTop = 1058
          mmWidth = 272521
          BandType = 5
          GroupNo = 2
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel26: TppLabel
            UserName = 'Label26'
            Caption = 'Condição:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 7673
            mmTop = 2910
            mmWidth = 13758
            BandType = 5
            GroupNo = 2
          end
          object ppDBText79: TppDBText
            UserName = 'DBText79'
            AutoSize = True
            DataField = 'TIPOCONDPAG'
            DataPipeline = pplExtrato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3260
            mmLeft = 7408
            mmTop = 6879
            mmWidth = 20955
            BandType = 5
            GroupNo = 2
          end
          object ppLabel52: TppLabel
            UserName = 'Label52'
            Caption = 'Nr. Parcelas:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 35719
            mmTop = 2910
            mmWidth = 17463
            BandType = 5
            GroupNo = 2
          end
          object ppLabel110: TppLabel
            UserName = 'Label110'
            Caption = 'Nr. Parcelas Pagas:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 35454
            mmTop = 6879
            mmWidth = 26458
            BandType = 5
            GroupNo = 2
          end
          object ppDBCalc5: TppDBCalc
            UserName = 'DBCalc5'
            DataField = 'VLRAMORTIZACAO'
            DataPipeline = pplExtrato
            DisplayFormat = '#,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup8
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3175
            mmLeft = 79111
            mmTop = 3175
            mmWidth = 22225
            BandType = 5
            GroupNo = 2
          end
          object ppDBCalc6: TppDBCalc
            UserName = 'DBCalc6'
            DataField = 'VLRPRESTACAO'
            DataPipeline = pplExtrato
            DisplayFormat = '#,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup8
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3175
            mmLeft = 101865
            mmTop = 3175
            mmWidth = 17198
            BandType = 5
            GroupNo = 2
          end
          object ppDBCalc7: TppDBCalc
            UserName = 'DBCalc7'
            DataField = 'VLRDIF'
            DataPipeline = pplExtrato
            DisplayFormat = '#,##0.00;-#,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup8
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3175
            mmLeft = 219869
            mmTop = 3175
            mmWidth = 19315
            BandType = 5
            GroupNo = 2
          end
          object ppDBCalc8: TppDBCalc
            UserName = 'DBCalc8'
            DataField = 'VLRPAGO'
            DataPipeline = pplExtrato
            DisplayFormat = '#,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup8
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3175
            mmLeft = 194469
            mmTop = 3175
            mmWidth = 24606
            BandType = 5
            GroupNo = 2
          end
          object ppDBCalc9: TppDBCalc
            UserName = 'DBCalc9'
            DataField = 'VLRCORRIG'
            DataPipeline = pplExtrato
            DisplayFormat = '#,##0.00;-#,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup8
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3175
            mmLeft = 239978
            mmTop = 3175
            mmWidth = 20373
            BandType = 5
            GroupNo = 2
          end
          object ppDBText85: TppDBText
            UserName = 'DBText85'
            DataField = 'NUMPARCELAS'
            DataPipeline = pplExtrato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3175
            mmLeft = 63765
            mmTop = 3175
            mmWidth = 11113
            BandType = 5
            GroupNo = 2
          end
          object vQtdeParcPaga: TppVariable
            UserName = 'vQtdeParcPaga'
            AutoSize = False
            CalcOrder = 0
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 63765
            mmTop = 7144
            mmWidth = 11113
            BandType = 5
            GroupNo = 2
          end
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060D
        6941747261736F4F6E43616C630B50726F6772616D54797065070B747450726F
        63656475726506536F757263650CC301000070726F6365647572652069417472
        61736F4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A
        626567696E0D0A20696620286C4578747261746F5B27444154414C494D495445
        275D203C20537472546F44617465286C626C44744C696D6974652E4361707469
        6F6E29202920616E64200D0A20202020286C4578747261746F5B27564C525041
        474F275D203D20302920616E64200D0A20202020286C4578747261746F5B2746
        4C475449504F4C414E43275D203C3E203629207468656E20626567696E0D0A20
        2020206966206C4578747261746F5B274944434F4E5241544F494D4F56454C27
        5D203C3E2032383233207468656E0D0A20202020206941747261736F2E417344
        6F75626C6520203A3D206941747261736F2E4173446F75626C65202B206C4578
        747261746F5B27564C52434F52524947275D0D0A20202020656C73652020200D
        0A20202020206941747261736F2E4173446F75626C65203A3D20206941747261
        736F2E4173446F75626C65202B20286C4578747261746F5B27564C5250524553
        544143414F275D2D6C4578747261746F5B27564C525041474F275D293B0D0A20
        656E643B0D0A0D0A656E643B0D0A0D0A0D0A200D0A0D436F6D706F6E656E744E
        616D6506076941747261736F094576656E744E616D6506064F6E43616C630745
        76656E74494402210001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D65060D694469766572674F6E43616C630B50726F6772616D5479
        7065070B747450726F63656475726506536F757263650C1C01000070726F6365
        6475726520694469766572674F6E43616C63287661722056616C75653A205661
        7269616E74293B0D0A626567696E0D0A20696620286C4578747261746F5B2744
        41544156454E43494D454E544F275D203C20537472546F44617465286C626C44
        744C696D6974652E43617074696F6E29202920616E64200D0A20202020286C45
        78747261746F5B27564C525041474F275D203E20302920616E6420286C457874
        7261746F5B27464C475449504F4C414E43275D203C3E203629207468656E2062
        6567696E0D0A20202020694469766572672E4173446F75626C65203A3D206944
        69766572672E4173446F75626C65202B206C4578747261746F5B27564C52434F
        52524947275D3B0D0A20656E643B200D0A656E643B0D0A0D436F6D706F6E656E
        744E616D65060769446976657267094576656E744E616D6506064F6E43616C63
        074576656E74494402210001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D65060E695265736964756F4F6E43616C630B50726F677261
        6D54797065070B747450726F63656475726506536F757263650C9E0100007072
        6F63656475726520695265736964756F4F6E43616C63287661722056616C7565
        3A2056617269616E74293B0D0A626567696E0D0A206966202820286C45787472
        61746F5B27464C475245534944554F494E434F5250275D203D20274E27292061
        6E64200D0A202020202020286C4578747261746F5B27464C474C414E43494E54
        45475241275D203C3E20352020202920616E64200D0A202020202020286C4578
        747261746F5B27464C474C414E43494E5445475241275D203C3E203620202029
        2029206F720D0A202020202820286C4578747261746F5B27464C475245534944
        554F494E434F5250275D203D202743272920616E64200D0A202020202020286C
        4578747261746F5B2744415441434F42524553275D203E20537472546F446174
        65286C626C44744C696D6974652E43617074696F6E29292029207468656E2062
        6567696E0D0A20202020695265736964756F2E4173446F75626C65203A3D2069
        5265736964756F2E4173446F75626C65202B206C4578747261746F5B27564C52
        5245534944554F275D3B0D0A20656E643B200D0A0D0A656E643B0D0A0D436F6D
        706F6E656E744E616D650608695265736964756F094576656E744E616D650606
        4F6E43616C63074576656E74494402210001060F5472614576656E7448616E64
        6C65720B50726F6772616D4E616D65060D6941636572746F4F6E43616C630B50
        726F6772616D54797065070B747450726F63656475726506536F757263650C76
        01000070726F636564757265206941636572746F4F6E43616C63287661722056
        616C75653A2056617269616E74293B0D0A626567696E0D0A20696620286C4578
        747261746F5B27464C475449504F4C414E43275D203D2036207468656E206265
        67696E0D0A20202020696620286C4578747261746F5B274441544156454E4349
        4D454E544F275D203E3D20537472546F44617465286C626C44744C696D697465
        2E43617074696F6E292029207468656E20626567696E200D0A20202020202020
        6941636572746F2E4173446F75626C65203A3D206941636572746F2E4173446F
        75626C65202B206C4578747261746F5B27544F545F44455649444F275D3B0D0A
        20202020656E6420656C736520626567696E0D0A202020202020206941636572
        746F2E4173446F75626C65203A3D206941636572746F2E4173446F75626C6520
        2B206C4578747261746F5B27564C52434F52524947275D3B0D0A20202020656E
        643B2020200D0A20656E643B0D0A200D0A0D0A656E643B0D0A0D436F6D706F6E
        656E744E616D6506076941636572746F094576656E744E616D6506064F6E4361
        6C63074576656E74494402210001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D6506156768624578747261746F4265666F7265507269
        6E740B50726F6772616D54797065070B747450726F63656475726506536F7572
        63650C3701000070726F636564757265206768624578747261746F4265666F72
        655072696E743B0D0A626567696E0D0A2020206941747261736F2E4173446F75
        626C65202020202020203A3D20303B0D0A202020694469766572672E4173446F
        75626C65202020202020203A3D20303B0D0A202020695265736964756F2E4173
        446F75626C652020202020203A3D20303B0D0A202020695265736964756F4174
        75616C2E4173446F75626C65203A3D20303B0D0A2020206941636572746F2E41
        73446F75626C65202020202020203A3D20303B0D0A2020206953616C646F546F
        742E4173446F75626C6520202020203A3D20303B0D0A2020206953442E417344
        6F75626C6520202020202020202020203A3D20303B0D0A202020695072657374
        4D65732E4173446F75626C6520202020203A3D20303B0D0A656E643B0D0A0D43
        6F6D706F6E656E744E616D65060A6768624578747261746F094576656E744E61
        6D65060B4265666F72655072696E74074576656E74494402180001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D650615676662457874
        7261746F4265666F72655072696E740B50726F6772616D54797065070B747450
        726F63656475726506536F7572636506C170726F636564757265206766624578
        747261746F4265666F72655072696E743B0D0A626567696E0D0A202020695361
        6C646F546F742E56616C7565203A3D206953442E56616C7565202B2069507265
        73744D65732E56616C7565202B206941747261736F2E56616C7565202B200D0A
        20202020202020202020202020202020202020202020694469766572672E5661
        6C7565202B20695265736964756F417475616C2E56616C7565202B2069416365
        72746F2E56616C75653B0D0A656E643B0D0A0D436F6D706F6E656E744E616D65
        060A6766624578747261746F094576656E744E616D65060B4265666F72655072
        696E74074576656E74494402180001060F5472614576656E7448616E646C6572
        0B50726F6772616D4E616D650613695265736964756F417475616C4F6E43616C
        630B50726F6772616D54797065070B747450726F63656475726506536F757263
        650CB201000070726F63656475726520695265736964756F417475616C4F6E43
        616C63287661722056616C75653A2056617269616E74293B0D0A626567696E0D
        0A206966202820286C4578747261746F5B27464C475245534944554F494E434F
        5250275D203D20274E272920616E64200D0A202020202020286C457874726174
        6F5B27464C474C414E43494E5445475241275D203C3E20352020202920616E64
        200D0A202020202020286C4578747261746F5B27464C474C414E43494E544547
        5241275D203C3E2036202020292029206F720D0A202020202820286C45787472
        61746F5B27464C475245534944554F494E434F5250275D203D20274327292061
        6E64200D0A202020202020286C4578747261746F5B2744415441434F42524553
        275D203E20537472546F44617465286C626C44744C696D6974652E4361707469
        6F6E29292029207468656E20626567696E0D0A20202020695265736964756F41
        7475616C2E4173446F75626C65203A3D20695265736964756F417475616C2E41
        73446F75626C65202B206C4578747261746F5B27564C525245534944554F434F
        52524947275D3B0D0A20656E643B20200D0A656E643B0D0A0D436F6D706F6E65
        6E744E616D65060D695265736964756F417475616C094576656E744E616D6506
        064F6E43616C63074576656E74494402210001060F5472614576656E7448616E
        646C65720B50726F6772616D4E616D65061B47726F757048656164657242616E
        64364265666F72655072696E740B50726F6772616D54797065070B747450726F
        63656475726506536F75726365065770726F6365647572652047726F75704865
        6164657242616E64364265666F72655072696E743B0D0A626567696E0D0A2020
        20765174646550617263506167612E4173496E7465676572203A3D20303B0D0A
        656E643B0D0A0D436F6D706F6E656E744E616D65061047726F75704865616465
        7242616E6436094576656E744E616D65060B4265666F72655072696E74074576
        656E74494402180001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D65061044657461696C41667465725072696E740B50726F6772616D
        54797065070B747450726F63656475726506536F75726365069970726F636564
        7572652044657461696C41667465725072696E743B0D0A626567696E0D0A2020
        6966206C4578747261746F5B27564C525041474F275D203E2030207468656E20
        626567696E0D0A2020202020765174646550617263506167612E4173496E7465
        676572203A3D20765174646550617263506167612E4173496E7465676572202B
        20313B0D0A2020656E643B0D0A656E643B0D0A0D436F6D706F6E656E744E616D
        65060644657461696C094576656E744E616D65060A41667465725072696E7407
        4576656E74494402170001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D65060F6950726573744D65734F6E43616C630B50726F677261
        6D54797065070B747450726F63656475726506536F757263650C670100007072
        6F636564757265206950726573744D65734F6E43616C63287661722056616C75
        653A2056617269616E74293B0D0A626567696E0D0A2020696620286C45787472
        61746F5B274E554D50415243275D203E20302920616E640D0A2020202020286C
        4578747261746F5B27444154414C494D495445275D203E3D206C457874726174
        6F5B27444154415F42415345275D2920616E640D0A20202020202820286C4578
        747261746F5B2744415441504147414D454E544F275D203E206C457874726174
        6F5B27444154414C494D495445275D29206F720D0A20202020202020286C4578
        747261746F5B2744415441504147414D454E544F275D203C3D20302920292074
        68656E20626567696E0D0A20202020206950726573744D65732E4173446F7562
        6C65203A3D206950726573744D65732E4173446F75626C65202B206C45787472
        61746F5B27564C5250524553544143414F275D3B0D0A2020656E643B200D0A65
        6E643B0D0A0D436F6D706F6E656E744E616D6506096950726573744D65730945
        76656E744E616D6506064F6E43616C63074576656E74494402210001060F5472
        614576656E7448616E646C65720B50726F6772616D4E616D65060F6953616C64
        6F546F744F6E43616C630B50726F6772616D54797065070B747450726F636564
        75726506536F757263650C3C01000070726F636564757265206953616C646F54
        6F744F6E43616C63287661722056616C75653A2056617269616E74293B0D0A62
        6567696E0D0A0D0A202056616C7565203A3D206941747261736F2E56616C7565
        202B200D0A2020202020202020202020694469766572672E56616C7565202B20
        0D0A2020202020202020202020695265736964756F2E56616C7565202B200D0A
        20202020202020202020206941636572746F2E56616C7565202B200D0A202020
        20202020202020206953442E56616C7565202B200D0A20202020202020202020
        20695265736964756F417475616C2E56616C7565202B200D0A20202020202020
        202020206950726573744D65732E56616C7565202B200D0A2020202020202020
        202020436F72726563616F496E636F72706F726164612E56616C75653B0D0A20
        200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506096953616C64
        6F546F74094576656E744E616D6506064F6E43616C63074576656E7449440221
        0000}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object qryInadSin: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '     CI.IDCONTRATOIMOVEL,'
      '     CI.CONNUMERO,'
      '     CI.CONNOME,'
      '     (CI.CONNUMERO || '#39' - '#39' || CI.CONNOME) AS NOMECONTRATO,'
      '     P.RAZAOSOCIAL,'
      '     IM.NOMEMESTRE,'
      '     TD.TOTDEVIDO'
      ''
      'FROM'
      '     CONTRATOIMOVEL CI,'
      '     CONDPAGIMOVEL  CP,'
      '     PARCFINANCIMOV PF,'
      '     PESSOA P,'
      ''
      '     ( SELECT DISTINCT'
      '              CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL,'
      '              M.IMONOME            AS NOMEMESTRE,'
      '              M.IDIMOVEL           AS IDIMOVELMESTRE,'
      '              C.UF                 AS UF'
      '       FROM'
      '              CONTRATOXIMOVEL CXI,'
      '              IMOVEL I,'
      '              IMOVEL M,'
      '              CIDADES C'
      '       WHERE'
      '              CXI.IDIMOVEL = I.IDIMOVEL'
      '         AND  M.IDCIDADES = C.IDCIDADES(+)'
      '         AND  I.IDIMOVELMESTRE = M.IDIMOVEL ) IM,'
      ''
      '     ( SELECT'
      '              CI.IDCONTRATOIMOVEL,'
      '              MIN(CI.CONNUMERO)    AS CONNUMERO,'
      
        '              SUM(NVL(PF.VLRPRESTCORRIG,0) + NVL(PF.VLRMULTACORR' +
        'IG,0) + NVL(PF.VLRJUROSCORRIG,0)) AS TOTDEVIDO'
      '       FROM'
      '              CONTRATOIMOVEL CI,'
      '              CONDPAGIMOVEL  CP,'
      '              PARCFINANCIMOV PF'
      '       WHERE'
      '             (PF.FLGTIPOLANC IN (2,3,4,5,6,7,8,9))'
      
        '         AND (PF.FLGCONCILIADO IS NULL OR PF.FLGCONCILIADO = '#39'N'#39 +
        ')'
      '         AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)'
      '         AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      
        '         AND ( (:pDTFIM IS NULL) OR (PF.DATAVENCIMENTO < TO_DATE' +
        '(:pDTFIM,'#39'DD/MM/YYYY'#39')) )'
      
        '         AND ( (:pIDCONTRATOIMOVEL IS NULL) OR (CI.IDCONTRATOIMO' +
        'VEL = :pIDCONTRATOIMOVEL) )'
      
        '         AND ( (:pIDCOMPRADOR IS NULL) OR (CI.IDLOCATARIO = :pID' +
        'COMPRADOR) )'
      
        '         AND ( (:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSAVEL = ' +
        ':pIDRESPONSAVEL) )'
      
        '         AND ( (:pIDADMINIMOVEL IS NULL) OR (CI.IDADMINIMOVEL = ' +
        ':pIDADMINIMOVEL) )'
      ''
      '       GROUP BY CI.IDCONTRATOIMOVEL ) TD'
      ''
      'WHERE'
      '  1=2 AND  (PF.FLGTIPOLANC IN (2,3,4,5,6,7,8,9))'
      '     AND (PF.FLGCONCILIADO IS NULL OR PF.FLGCONCILIADO = '#39'N'#39')'
      '     AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)'
      '     AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      '     AND (TD.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      '     AND (P.IDPESSOA(+) = CI.IDLOCATARIO)'
      '     AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL)'
      
        '     AND ( (:pDTFIM IS NULL) OR (PF.DATAVENCIMENTO < TO_DATE(:pD' +
        'TFIM,'#39'DD/MM/YYYY'#39')) )'
      
        '     AND ( (:pIDCONTRATOIMOVEL IS NULL) OR (CI.IDCONTRATOIMOVEL ' +
        '= :pIDCONTRATOIMOVEL) )'
      
        '     AND ( (:pIDCOMPRADOR IS NULL) OR (CI.IDLOCATARIO = :pIDCOMP' +
        'RADOR) )'
      
        '     AND ( (:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSAVEL = :pID' +
        'RESPONSAVEL) )'
      
        '     AND ( (:pIDADMINIMOVEL IS NULL) OR (CI.IDADMINIMOVEL = :pID' +
        'ADMINIMOVEL) )'
      '     AND ( (:pUF IS NULL) OR (TRIM(IM.UF) = :pUF) )'
      '     AND ( CI.FLGTIPOCONTRATO = :PFLGTIPOCONTRATO )'
      ''
      'ORDER BY DECODE(:pORDEM, 0, RAZAOSOCIAL  || NOMECONTRATO,'
      '                         1, NOMECONTRATO || RAZAOSOCIAL)'
      ''
      ''
      ''
      ''
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
      ''
      ' ')
    ValidateWithMask = True
    Left = 34
    Top = 226
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCOMPRADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCOMPRADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCOMPRADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCOMPRADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pUF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pUF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGTIPOCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pORDEM'
        ParamType = ptUnknown
      end>
  end
  object dsInadSin: TwwDataSource
    DataSet = qryInadSin
    Left = 124
    Top = 226
  end
  object pplInadSin: TppBDEPipeline
    DataSource = dsInadSin
    UserName = 'lInadSin'
    Left = 218
    Top = 226
    object pplInadSinppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplInadSinppField2: TppField
      FieldAlias = 'CONNUMERO'
      FieldName = 'CONNUMERO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object pplInadSinppField3: TppField
      FieldAlias = 'CONNOME'
      FieldName = 'CONNOME'
      FieldLength = 100
      DisplayWidth = 100
      Position = 2
    end
    object pplInadSinppField4: TppField
      FieldAlias = 'NOMECONTRATO'
      FieldName = 'NOMECONTRATO'
      FieldLength = 123
      DisplayWidth = 123
      Position = 3
    end
    object pplInadSinppField5: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pplInadSinppField6: TppField
      FieldAlias = 'NOMEMESTRE'
      FieldName = 'NOMEMESTRE'
      FieldLength = 100
      DisplayWidth = 100
      Position = 5
    end
    object pplInadSinppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTDEVIDO'
      FieldName = 'TOTDEVIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object rpInadSin: TppReport
    AutoStop = False
    DataPipeline = pplInadSin
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 306
    Top = 226
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplInadSin'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20373
      mmPrintPosition = 0
      object pplTitInadSin: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Inadimplências de Alienação - Sintético'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8467
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel68: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197380
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 15081
        mmWidth = 197300
        BandType = 0
      end
      object pplDet0: TppLabel
        UserName = 'Label23'
        Caption = 'Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 83079
        mmTop = 16140
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel88: TppLabel
        UserName = 'Label22'
        Caption = 'Valor Devido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 176213
        mmTop = 16140
        mmWidth = 17463
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 19844
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'Comprador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 16140
        mmWidth = 15346
        BandType = 0
      end
      object ppImgLogotipo: TppImage
        UserName = 'ImgLogotipo'
        MaintainAspectRatio = False
        mmHeight = 14817
        mmLeft = 529
        mmTop = 265
        mmWidth = 20638
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object pplnSeparador: TppLine
        OnPrint = pplnSeparadorPrint
        UserName = 'lnSeparador'
        ParentHeight = True
        ParentWidth = True
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppsCor: TppShape
        OnPrint = ppsCorPrint
        UserName = 'sCor'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        ShiftWithParent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'DBText101'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = pplInadSin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplInadSin'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 80433
        BandType = 4
      end
      object ppdbDet0: TppDBText
        UserName = 'DBText10'
        DataField = 'NOMECONTRATO'
        DataPipeline = pplInadSin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplInadSin'
        mmHeight = 3704
        mmLeft = 83079
        mmTop = 0
        mmWidth = 80433
        BandType = 4
      end
      object ppDBText54: TppDBText
        UserName = 'DBText33'
        BlankWhenZero = True
        DataField = 'TOTDEVIDO'
        DataPipeline = pplInadSin
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadSin'
        mmHeight = 3704
        mmLeft = 171186
        mmTop = 0
        mmWidth = 21960
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine9: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel70: TppLabel
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
        mmWidth = 197115
        BandType = 8
      end
      object ppSystemVariable9: TppSystemVariable
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
        mmWidth = 196850
        BandType = 8
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLabel72: TppLabel
        UserName = 'Label72'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 151871
        mmTop = 1588
        mmWidth = 14552
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'TOTDEVIDO'
        DataPipeline = pplInadSin
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadSin'
        mmHeight = 3175
        mmLeft = 168540
        mmTop = 1588
        mmWidth = 24606
        BandType = 7
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'RAZAOSOCIAL'
      DataPipeline = pplInadSin
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplInadSin'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        AfterPrint = gfbExtratoAfterPrint
        BeforePrint = gfbExtratoBeforePrint
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'TOTDEVIDO'
          DataPipeline = pplInadSin
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadSin'
          mmHeight = 3175
          mmLeft = 171715
          mmTop = 0
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryInadAna: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryInadAnaCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PF.IDPARCFINANCIMOV,'
      '       PF.IDCONDPAGIMOVEL,  '
      '       CP.IDCONTRATOIMOVEL, '
      '       CI.CONNUMERO,        '
      '       CI.CONNOME,          '
      '       (CI.CONNUMERO || '#39' - '#39' || CI.CONNOME) AS NOMECONTRATO, '
      '       P.RAZAOSOCIAL,       '
      
        '       DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || '#39'/'#39 +
        ' || TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA, '
      
        '       DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENT' +
        'O) AS DATAVENCIMENTO,  '
      
        '       DECODE(PF.FLGTIPOLANC,9,PF.VLRAMORTIZACAO,PF.VLRPRESTACAO' +
        ')  AS VLRPRESTACAO,    '
      '       PF.FLGTIPOLANC,        '
      '       PF.FLGLANCINTEGRA,     '
      '       PP.DATAPAGAMENTO,'
      '       ROUND(NVL(PP.VLRPAGO,0),2) AS VLRPAGO,'
      '       PF.DATAPAGAMENTO - PF.DATALIMITE AS DIASDIF, '
      
        '       ROUND( ( ( NVL(PF.VLRPRESTACAO,0) + NVL( CMA.VLRCORRIGIDO' +
        'ATRASO, 0 ) + NVL( MA.VLRMULTAATRASO, 0 ) + NVL( JA.VLRMORAATRAS' +
        'O, 0 ) ) - NVL( PP.VLRPAGO, 0 ) ), 2 )  AS VLRDIF, '
      '       CMA.VLRCORRIGIDOATRASO AS VLRCMATRASO,  '
      '       MA.VLRMULTAATRASO AS VLRMULTAATRASO,  '
      '       JA.VLRMORAATRASO AS VLRMORAATRASO,  '
      '       CMS.VLRCORRIGIDOSALDO AS VLRCMCORRIG,  '
      '       MS.VLRMULTASALDO   AS VLRMULTACORRIG,  '
      '       JS.VLRMORASALDO AS VLRJUROSCORRIG,  '
      
        '       ROUND(NVL(PF.VLRPRESTACAO,0) + NVL( CMA.VLRCORRIGIDOATRAS' +
        'O, 0 ) + NVL( MA.VLRMULTAATRASO, 0 ) + NVL( JA.VLRMORAATRASO, 0 ' +
        ')  - NVL( PP.VLRPAGO, 0 ) +  '
      
        '       NVL(CMS.VLRCORRIGIDOSALDO,0) + NVL(MS.VLRMULTASALDO,0) + ' +
        'NVL(JS.VLRMORASALDO,0) - NVL(ABONO.TOT_ABONO,0),2)  AS VLRDEVIDO' +
        '  '
      '  FROM PARCFINANCIMOV PF, '
      '       CONDPAGIMOVEL  CP, '
      '       CONTRATOIMOVEL CI, '
      '       PESSOA P,          '
      '       ( '
      '         SELECT /*+ INDEX(LD) INDEX(RP)*/   '
      '                IDPARCFINANCIMOV, '
      
        '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.DATAPAGAMENTO' +
        '), MAX(RP.DATABAIXA) ) AS DATAPAGAMENTO, '
      
        '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), SUM' +
        '(LD.VALOR) ) AS VLRPAGO '
      
        '           FROM PARCFINANCIMOV P, LANCTODOCUM LD, RECBTOPAGTO RP' +
        ' '
      '          WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+) '
      '            AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) '
      '            AND LD.NUMLANCTO    = RP.NUMLANCTO(+)    '
      
        '            AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO <' +
        '= 11/08/2006 ) OR'
      
        '                 (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPER' +
        'ACAO) = '#39'5'#39' OR LD.CODALTERADOR = 215 ) '
      
        '                                             AND LD.ESTORNO IS N' +
        'ULL            '
      
        '                                             AND LD.DATALANCTO <' +
        '= 11/08/2006 ) )  '
      
        '          GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO             ' +
        '               '
      '       ) PP, '
      '       ( SELECT A.IDCONDINICIAL  AS IDCONDINICIAL, '
      '                A.NUMPARCELAS    AS NUMPARCELAS,   '
      '                A.DATAINI,                         '
      '                A.IDCONDPAGIMOVEL                  '
      '           FROM CONDPAGIMOVEL A,                   '
      '                (SELECT IDCONDINICIAL,             '
      '                        MAX(DATAINI) AS DATAINI    '
      '                   FROM CONDPAGIMOVEL              '
      '                  GROUP BY IDCONDINICIAL) B        '
      '          WHERE B.IDCONDINICIAL = A.IDCONDINICIAL  '
      '            AND B.DATAINI       = A.DATAINI ) CPFINAL,    '
      '       ( '
      
        '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRCORRIGIDOA' +
        'TRASO '
      '         FROM ( SELECT /*+ INDEX (L) */ '
      
        '                     L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRAC' +
        'UM) AS VLRCORRIGIDOATRASO '
      '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P.IDPESSOA = 1'
      '                AND L.IDCONTRATOIMOVEL = 1848'
      '                AND ( L.IDOPERACAO = P.IDOPERATUALCM ) '
      '                AND L.DATABAIXA IS NOT NULL '
      '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX' +
        '(L2.DATAOPER) AS DTAPUR '
      '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P2.IDPESSOA = 1'
      '                AND L2.IDCONTRATOIMOVEL = 1848'
      '                AND ( L2.IDOPERACAO = P2.IDOPERATUALCM ) '
      '                AND ( DATAOPER <= 11/08/2006) '
      '                AND L2.DATABAIXA IS NOT NULL '
      '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '                AND D1.DATAOPER = D2.DTAPUR '
      '       ) CMA, '
      '       ( '
      
        '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMULTAATRAS' +
        'O '
      '         FROM ( SELECT /*+ INDEX (L) */ '
      
        '                    L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACU' +
        'M) AS VLRMULTAATRASO '
      '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P.IDPESSOA =  1'
      '                AND L.IDCONTRATOIMOVEL = 1848'
      '                AND ( L.IDOPERACAO = P.IDOPERATUALMULTA ) '
      '                AND L.DATABAIXA IS NOT NULL '
      '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX' +
        '(L2.DATAOPER) AS DTAPUR '
      '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P2.IDPESSOA =  1'
      '                AND L2.IDCONTRATOIMOVEL = 1848'
      '                AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA ) '
      '                AND ( DATAOPER <= 11/08/2006) '
      '                AND L2.DATABAIXA IS NOT NULL '
      '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '         AND D1.DATAOPER = D2.DTAPUR '
      '       ) MA, '
      '       ( '
      '        SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMORAATRASO '
      '        FROM ( SELECT /*+ INDEX (L) */ '
      
        '                   L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM' +
        ') AS VLRMORAATRASO '
      '               FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '               AND P.IDPESSOA =  1'
      '                AND L.IDCONTRATOIMOVEL = 1848'
      '               AND ( L.IDOPERACAO = P.IDOPERATUALJUROS ) '
      '               AND L.DATABAIXA IS NOT NULL '
      '               GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '             ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(' +
        'L2.DATAOPER) AS DTAPUR '
      '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '               AND P2.IDPESSOA =  1'
      '                AND L2.IDCONTRATOIMOVEL = 1848'
      '               AND ( L2.IDOPERACAO = P2.IDOPERATUALJUROS ) '
      '               AND ( DATAOPER <= 11/08/2006) '
      '               AND L2.DATABAIXA IS NOT NULL '
      '               GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '        WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '        AND D1.DATAOPER = D2.DTAPUR '
      '       ) JA, '
      '       ( '
      
        '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRCORRIGIDOS' +
        'ALDO '
      '         FROM ( SELECT /*+ INDEX (L) */ '
      
        '                     L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRAC' +
        'UM) AS VLRCORRIGIDOSALDO '
      '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P.IDPESSOA = 1'
      '                AND L.IDCONTRATOIMOVEL = 1848'
      '                AND ( L.IDOPERACAO = P.IDOPERATUALCM ) '
      '                AND L.DATABAIXA IS NULL '
      '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX' +
        '(L2.DATAOPER) AS DTAPUR '
      '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P2.IDPESSOA = 1'
      '                AND L2.IDCONTRATOIMOVEL = 1848'
      '                AND ( L2.IDOPERACAO = P2.IDOPERATUALCM ) '
      '                AND ( DATAOPER <= 11/08/2006) '
      '                AND L2.DATABAIXA IS NULL '
      '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '                AND D1.DATAOPER = D2.DTAPUR '
      '       ) CMS, '
      '       ( '
      
        '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMULTASALDO' +
        ' '
      '         FROM ( SELECT /*+ INDEX (L) */ '
      
        '                    L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACU' +
        'M) AS VLRMULTASALDO '
      '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P.IDPESSOA =  1'
      '                AND L.IDCONTRATOIMOVEL = 1848'
      '                AND ( L.IDOPERACAO = P.IDOPERATUALMULTA ) '
      '                AND L.DATABAIXA IS NULL '
      '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX' +
        '(L2.DATAOPER) AS DTAPUR '
      '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P2.IDPESSOA =  1'
      '                AND L2.IDCONTRATOIMOVEL = 1848'
      '                AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA ) '
      '                AND ( DATAOPER <= 11/08/2006) '
      '                AND L2.DATABAIXA IS NULL '
      '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '         AND D1.DATAOPER = D2.DTAPUR '
      '       ) MS, '
      '       ( '
      '        SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMORASALDO '
      '        FROM ( SELECT /*+ INDEX (L) */ '
      
        '                   L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM' +
        ') AS VLRMORASALDO '
      '               FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '               AND P.IDPESSOA =  1'
      '                AND L.IDCONTRATOIMOVEL = 1848'
      '               AND ( L.IDOPERACAO = P.IDOPERATUALJUROS ) '
      '               AND L.DATABAIXA IS NULL '
      '               GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '             ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(' +
        'L2.DATAOPER) AS DTAPUR '
      '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '               AND P2.IDPESSOA =  1'
      '                AND L2.IDCONTRATOIMOVEL = 1848'
      '               AND ( L2.IDOPERACAO = P2.IDOPERATUALJUROS ) '
      '               AND ( DATAOPER <= 11/08/2006) '
      '               AND L2.DATABAIXA IS NULL '
      '               GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '        WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '        AND D1.DATAOPER = D2.DTAPUR '
      '       ) JS, '
      '       ( SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.TOT_ABONO '
      '       FROM ( SELECT /*+ INDEX (L) */ '
      
        '                  L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM)' +
        ' AS TOT_ABONO '
      '              FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '              WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND L.IDMODULO = 135 '
      '                AND P.IDPESSOA =  1'
      '                AND L.IDCONTRATOIMOVEL = 1848'
      '                AND ( L.IDOPERACAO = P.IDOPERABONOMULTA OR '
      '                      L.IDOPERACAO = P.IDOPERABONOJUROS OR '
      '                      L.IDOPERACAO = P.IDOPERABONOCM ) '
      '              GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '           ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2' +
        '.DATAOPER) AS DTAPUR '
      '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '              WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND L2.IDMODULO = 135 '
      '                AND P2.IDPESSOA = 1'
      '                AND L2.IDCONTRATOIMOVEL = 1848'
      '         AND ( L2.IDOPERACAO = P2.IDOPERABONOMULTA OR '
      '               L2.IDOPERACAO = P2.IDOPERABONOJUROS OR '
      '               L2.IDOPERACAO = P2.IDOPERABONOCM ) '
      '         AND ( DATAOPER <= 11/08/2006 ) '
      '       GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      'WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      'AND D1.DATAOPER = D2.DTAPUR '
      ') ABONO, '
      '       ( SELECT DISTINCT                                  '
      '                CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL, '
      '                M.IMONOME   AS NOMEMESTRE,                '
      '                M.IDIMOVEL  AS IDIMOVELMESTRE,            '
      '                C.UF        AS UF    '
      '           FROM CONTRATOXIMOVEL CXI, '
      '                IMOVEL I, '
      '                IMOVEL M, '
      '                CIDADES C '
      '          WHERE CXI.IDIMOVEL = I.IDIMOVEL'
      '           AND  M.IDCIDADES = C.IDCIDADES(+)'
      '           AND  I.IDIMOVELMESTRE = M.IDIMOVEL ) IM'
      '  WHERE (PF.FLGTIPOLANC IN (2,3,4,5,6,7,8,9))'
      '    AND (NVL(PF.FLGCONCILIADO,'#39'N'#39') IN ('#39'N'#39','#39'P'#39'))'
      '    AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)'
      '    AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      '    AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL)'
      '    AND (PP.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)'
      '    AND (PF.IDPARCFINANCIMOV = MA.IDPARCFINANCIMOV(+))'
      '    AND (PF.IDPARCFINANCIMOV = JA.IDPARCFINANCIMOV(+))'
      '    AND (PF.IDPARCFINANCIMOV = CMA.IDPARCFINANCIMOV(+))'
      '    AND (PF.IDPARCFINANCIMOV = MS.IDPARCFINANCIMOV(+))'
      '    AND (PF.IDPARCFINANCIMOV = JS.IDPARCFINANCIMOV(+))'
      '    AND (PF.IDPARCFINANCIMOV = CMS.IDPARCFINANCIMOV(+))'
      '    AND (PF.IDPARCFINANCIMOV = ABONO.IDPARCFINANCIMOV(+))'
      '    AND (P.IDPESSOA(+) = CI.IDLOCATARIO)'
      '    AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL)'
      ''
      '    AND ( (:pDTINI IS NULL) OR (PF.DATAVENCIMENTO >= :pDTINI) )'
      '    AND ( (:pDTFIM IS NULL) OR (PF.DATAVENCIMENTO <=  :pDTFIM) )'
      '    AND ( CI.FLGTIPOCONTRATO = :pFLGTIPOCONTRATO )'
      
        '  ORDER BY CONNUMERO, PF.IDCONDPAGIMOVEL, DATAVENCIMENTO, PF.FLG' +
        'TIPOLANC, NUMPARCELA'
      ''
      ' '
      ' '
      ''
      ' ')
    ValidateWithMask = True
    Left = 98
    Top = 285
    ParamData = <
      item
        DataType = ftDate
        Name = 'pDTINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDTINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFLGTIPOCONTRATO'
        ParamType = ptUnknown
      end>
    object qryInadAnaIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
    end
    object qryInadAnaIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryInadAnaIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryInadAnaCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryInadAnaCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object qryInadAnaNOMECONTRATO: TStringField
      FieldName = 'NOMECONTRATO'
      Size = 83
    end
    object qryInadAnaRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryInadAnaNUMPARCELA: TStringField
      FieldName = 'NUMPARCELA'
      Size = 81
    end
    object qryInadAnaDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryInadAnaVLRPRESTACAO: TFloatField
      FieldName = 'VLRPRESTACAO'
    end
    object qryInadAnaFLGTIPOLANC: TFloatField
      FieldName = 'FLGTIPOLANC'
    end
    object qryInadAnaFLGLANCINTEGRA: TFloatField
      FieldName = 'FLGLANCINTEGRA'
    end
    object qryInadAnaDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
    end
    object qryInadAnaVLRPAGO: TFloatField
      FieldName = 'VLRPAGO'
    end
    object qryInadAnaDIASDIF: TFloatField
      FieldName = 'DIASDIF'
    end
    object qryInadAnaVLRCMATRASO: TFloatField
      FieldName = 'VLRCMATRASO'
    end
    object qryInadAnaVLRMULTAATRASO: TFloatField
      FieldName = 'VLRMULTAATRASO'
    end
    object qryInadAnaVLRMORAATRASO: TFloatField
      FieldName = 'VLRMORAATRASO'
    end
    object qryInadAnaVLRDIF: TFloatField
      FieldName = 'VLRDIF'
    end
    object qryInadAnaVLRCMCORRIG: TFloatField
      FieldName = 'VLRCMCORRIG'
    end
    object qryInadAnaVLRMULTACORRIG: TFloatField
      FieldName = 'VLRMULTACORRIG'
    end
    object qryInadAnaVLRJUROSCORRIG: TFloatField
      FieldName = 'VLRJUROSCORRIG'
    end
    object qryInadAnaVLRDEVIDO: TFloatField
      FieldName = 'VLRDEVIDO'
    end
    object qryInadAnaCAL_TIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CAL_TIPO'
      Calculated = True
    end
  end
  object dsInadAna: TwwDataSource
    DataSet = qryInadAna
    Left = 156
    Top = 290
  end
  object pplInadAna: TppBDEPipeline
    DataSource = dsInadAna
    UserName = 'lInadAna'
    Left = 218
    Top = 282
    object pplInadAnappField1: TppField
      FieldAlias = 'IDPARCFINANCIMOV'
      FieldName = 'IDPARCFINANCIMOV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField2: TppField
      FieldAlias = 'IDCONDPAGIMOVEL'
      FieldName = 'IDCONDPAGIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField3: TppField
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField4: TppField
      FieldAlias = 'CONNUMERO'
      FieldName = 'CONNUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField5: TppField
      FieldAlias = 'CONNOME'
      FieldName = 'CONNOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField6: TppField
      FieldAlias = 'NOMECONTRATO'
      FieldName = 'NOMECONTRATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField7: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField8: TppField
      FieldAlias = 'NUMPARCELA'
      FieldName = 'NUMPARCELA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField9: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField10: TppField
      FieldAlias = 'VLRPRESTACAO'
      FieldName = 'VLRPRESTACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField11: TppField
      FieldAlias = 'FLGTIPOLANC'
      FieldName = 'FLGTIPOLANC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField12: TppField
      FieldAlias = 'FLGLANCINTEGRA'
      FieldName = 'FLGLANCINTEGRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField13: TppField
      FieldAlias = 'DATAPAGAMENTO'
      FieldName = 'DATAPAGAMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField14: TppField
      FieldAlias = 'VLRPAGO'
      FieldName = 'VLRPAGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField15: TppField
      FieldAlias = 'DIASDIF'
      FieldName = 'DIASDIF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField16: TppField
      FieldAlias = 'VLRCMATRASO'
      FieldName = 'VLRCMATRASO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField17: TppField
      FieldAlias = 'VLRMULTAATRASO'
      FieldName = 'VLRMULTAATRASO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField18: TppField
      FieldAlias = 'VLRMORAATRASO'
      FieldName = 'VLRMORAATRASO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField19: TppField
      FieldAlias = 'VLRDIF'
      FieldName = 'VLRDIF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField20: TppField
      FieldAlias = 'VLRCMCORRIG'
      FieldName = 'VLRCMCORRIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField21: TppField
      FieldAlias = 'VLRMULTACORRIG'
      FieldName = 'VLRMULTACORRIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField22: TppField
      FieldAlias = 'VLRJUROSCORRIG'
      FieldName = 'VLRJUROSCORRIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField23: TppField
      FieldAlias = 'VLRDEVIDO'
      FieldName = 'VLRDEVIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField24: TppField
      FieldAlias = 'CAL_TIPO'
      FieldName = 'CAL_TIPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
  end
  object rpInadAna: TppReport
    AutoStop = False
    DataPipeline = pplInadAna
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 306
    Top = 282
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplInadAna'
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 14817
      mmPrintPosition = 0
      object ppTituloInadAna: TppLabel
        UserName = 'TituloInadAna'
        AutoSize = False
        Caption = 'Inadimplência de Alienação - Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8467
        mmWidth = 283898
        BandType = 0
      end
      object ppLabel74: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1852
        mmWidth = 283898
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppsCor2: TppShape
        OnPrint = ppsCorPrint
        UserName = 'sCor2'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'NUMPARCELA'
        DataPipeline = pplInadAna
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText10'
        DataField = 'DATAVENCIMENTO'
        DataPipeline = pplInadAna
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 14288
        mmTop = 0
        mmWidth = 16002
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'DBText11'
        BlankWhenZero = True
        DataField = 'VLRPRESTACAO'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 52652
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText55: TppDBText
        UserName = 'DBText27'
        BlankWhenZero = True
        DataField = 'DATAPAGAMENTO'
        DataPipeline = pplInadAna
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 73025
        mmTop = 0
        mmWidth = 16002
        BandType = 4
      end
      object ppDBText56: TppDBText
        UserName = 'DBText38'
        BlankWhenZero = True
        DataField = 'VLRPAGO'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 89959
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText57: TppDBText
        UserName = 'dbtTipo'
        DataField = 'CAL_TIPO'
        DataPipeline = pplInadAna
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 30956
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText58: TppDBText
        UserName = 'DBText33'
        BlankWhenZero = True
        DataField = 'VLRDEVIDO'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 264055
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText86: TppDBText
        UserName = 'DBText86'
        BlankWhenZero = True
        DataField = 'DIASDIF'
        DataPipeline = pplInadAna
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 110861
        mmTop = 0
        mmWidth = 6614
        BandType = 4
      end
      object ppDBText87: TppDBText
        UserName = 'DBText87'
        BlankWhenZero = True
        DataField = 'VLRCMATRASO'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 118269
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText88: TppDBText
        UserName = 'DBText88'
        BlankWhenZero = True
        DataField = 'VLRMULTAATRASO'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 139171
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText89: TppDBText
        UserName = 'DBText89'
        BlankWhenZero = True
        DataField = 'VLRMORAATRASO'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 159809
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText90: TppDBText
        UserName = 'DBText90'
        BlankWhenZero = True
        DataField = 'VLRCMCORRIG'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 201348
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText92: TppDBText
        UserName = 'DBText92'
        BlankWhenZero = True
        DataField = 'VLRJUROSCORRIG'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 243153
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText93: TppDBText
        UserName = 'DBText93'
        BlankWhenZero = True
        DataField = 'VLRDIF'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 179917
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText91: TppDBText
        UserName = 'DBText91'
        BlankWhenZero = True
        DataField = 'VLRMULTACORRIG'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 222250
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine12: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel75: TppLabel
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
        mmWidth = 283369
        BandType = 8
      end
      object ppSystemVariable11: TppSystemVariable
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
        mmWidth = 283105
        BandType = 8
      end
      object ppSystemVariable12: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257176
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel82: TppLabel
        UserName = 'Label82'
        AutoSize = False
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 153723
        mmTop = 2910
        mmWidth = 25135
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'VLRDEVIDO'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3175
        mmLeft = 245798
        mmTop = 2910
        mmWidth = 38365
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc101'
        DataField = 'VLRDIF'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3175
        mmLeft = 180182
        mmTop = 2911
        mmWidth = 20320
        BandType = 7
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplInadAna
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplInadAna'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 30427
        mmPrintPosition = 0
        object ppLine14: TppLine
          UserName = 'Line14'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 12700
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel99: TppLabel
          UserName = 'Label24'
          AutoSize = False
          Caption = 'Data de Pagto.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7144
          mmLeft = 73025
          mmTop = 20902
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppLabel100: TppLabel
          UserName = 'Label63'
          AutoSize = False
          Caption = 'Valor Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 89959
          mmTop = 24606
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel102: TppLabel
          UserName = 'Label51'
          AutoSize = False
          Caption = '    Valor Devido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7144
          mmLeft = 264055
          mmTop = 20902
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLine13: TppLine
          UserName = 'Line7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 28839
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppdbGrupo2: TppDBText
          UserName = 'DBText18'
          DataField = 'NOMECONTRATO'
          DataPipeline = pplInadAna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplInadAna'
          mmHeight = 3704
          mmLeft = 22754
          mmTop = 6879
          mmWidth = 71967
          BandType = 3
          GroupNo = 0
        end
        object ppLabel113: TppLabel
          UserName = 'Label113'
          AutoSize = False
          Caption = 'Dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 110861
          mmTop = 24606
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object ppLabel114: TppLabel
          UserName = 'Label114'
          AutoSize = False
          Caption = 'Correção Monetária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7144
          mmLeft = 118269
          mmTop = 20902
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel115: TppLabel
          UserName = 'Label202'
          AutoSize = False
          Caption = 'Multa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 139171
          mmTop = 24606
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel116: TppLabel
          UserName = 'Label116'
          AutoSize = False
          Caption = 'Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 159809
          mmTop = 24606
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object ppLabel120: TppLabel
          UserName = 'Label120'
          AutoSize = False
          Caption = 'Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 243153
          mmTop = 24606
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel117: TppLabel
          UserName = 'Label117'
          AutoSize = False
          Caption = 'Correção Monetária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7144
          mmLeft = 201348
          mmTop = 20902
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel121: TppLabel
          UserName = 'Label121'
          AutoSize = False
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 179917
          mmTop = 24606
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppShape1: TppShape
          UserName = 'Shape1'
          mmHeight = 2117
          mmLeft = 118269
          mmTop = 18256
          mmWidth = 82286
          BandType = 3
          GroupNo = 0
        end
        object ppShape2: TppShape
          UserName = 'Shape2'
          Pen.Color = clWhite
          mmHeight = 794
          mmLeft = 118269
          mmTop = 19844
          mmWidth = 82286
          BandType = 3
          GroupNo = 0
        end
        object ppShape3: TppShape
          UserName = 'Shape3'
          mmHeight = 2117
          mmLeft = 201348
          mmTop = 18256
          mmWidth = 62177
          BandType = 3
          GroupNo = 0
        end
        object ppShape4: TppShape
          UserName = 'Shape4'
          Pen.Color = clWhite
          mmHeight = 794
          mmLeft = 201348
          mmTop = 19844
          mmWidth = 62177
          BandType = 3
          GroupNo = 0
        end
        object ppLabel119: TppLabel
          UserName = 'Label119'
          AutoSize = False
          Caption = 'Correção de Valores Pagos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 118269
          mmTop = 14817
          mmWidth = 82286
          BandType = 3
          GroupNo = 0
        end
        object ppLabel122: TppLabel
          UserName = 'Label122'
          AutoSize = False
          Caption = 'Correção de Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 201348
          mmTop = 14817
          mmWidth = 62177
          BandType = 3
          GroupNo = 0
        end
        object ppLabel123: TppLabel
          UserName = 'Label123'
          AutoSize = False
          Caption = 'Multa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 222250
          mmTop = 24606
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel93: TppLabel
          UserName = 'Label18'
          AutoSize = False
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 2117
          mmTop = 24606
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppLabel94: TppLabel
          UserName = 'Label19'
          AutoSize = False
          Caption = 'Data de Vencto.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7144
          mmLeft = 14288
          mmTop = 20902
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppLabel101: TppLabel
          UserName = 'Label50'
          AutoSize = False
          Caption = 'Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 31485
          mmTop = 24606
          mmWidth = 19844
          BandType = 3
          GroupNo = 0
        end
        object ppLabel95: TppLabel
          UserName = 'Label20'
          AutoSize = False
          Caption = 'Prestação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 52123
          mmTop = 24606
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object pplGrupo2: TppLabel
          UserName = 'Label31'
          AutoSize = False
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 6879
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel112: TppLabel
          UserName = 'Label112'
          AutoSize = False
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 17463
          mmTop = 6879
          mmWidth = 2646
          BandType = 3
          GroupNo = 0
        end
        object pplComprador2: TppLabel
          UserName = 'Label38'
          AutoSize = False
          Caption = 'Comprador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 529
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel111: TppLabel
          UserName = 'Label111'
          AutoSize = False
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 17463
          mmTop = 529
          mmWidth = 2646
          BandType = 3
          GroupNo = 0
        end
        object ppdbComprador2: TppDBText
          UserName = 'DBText26'
          DataField = 'RAZAOSOCIAL'
          DataPipeline = pplInadAna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplInadAna'
          mmHeight = 3704
          mmLeft = 23019
          mmTop = 529
          mmWidth = 69056
          BandType = 3
          GroupNo = 0
        end
        object ppDtInadAna: TppLabel
          UserName = 'DtInadAna'
          AutoSize = False
          Caption = 'Data Limite: 99/99/9999 '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 240771
          mmTop = 6879
          mmWidth = 43392
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        AfterPrint = gfbExtratoAfterPrint
        BeforePrint = gfbExtratoBeforePrint
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel77: TppLabel
          UserName = 'Label77'
          AutoSize = False
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 159015
          mmTop = 0
          mmWidth = 16002
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VLRDEVIDO'
          DataPipeline = pplInadAna
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadAna'
          mmHeight = 3175
          mmLeft = 241300
          mmTop = 0
          mmWidth = 43127
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'VLRDIF'
          DataPipeline = pplInadAna
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadAna'
          mmHeight = 3175
          mmLeft = 179652
          mmTop = 0
          mmWidth = 20320
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object raCodeModule4: TraCodeModule
      ProgramStream = {00}
    end
  end
  object qryImovAli: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '      CI.IDCONTRATOIMOVEL,'
      '      CI.CONNUMERO,'
      '      CI.CONNOME,'
      '     (CI.CONNUMERO || '#39' - '#39' || CI.CONNOME) AS NOMECONTRATO,'
      '      CI.CONDATAASSINATURA,'
      '      P.RAZAOSOCIAL,'
      '      IM.IDIMOVEL,'
      '      IM.IDIMOVELMESTRE,'
      '      IM.NOMEMESTRE,'
      '      IM.NOMEIMOVEL,'
      '      IM.VLRVENDA,      IM.VLRCONTABIL,'
      '     (IM.VLRVENDA - IM.VLRCONTABIL) AS VLRRESULTADO,'
      '      DECODE(NVL(IM.VLRCONTABIL,0), 0, 0,'
      
        '           ((IM.VLRVENDA - IM.VLRCONTABIL) * 100 / IM.VLRCONTABI' +
        'L) ) AS PERCLUCRO'
      ''
      'FROM'
      '     CONTRATOIMOVEL CI,'
      '     PLANOPATROXIMOVEL PPI,          '
      '     CONTRATOXIMOVEL CXI,       '
      '     PESSOA P,'
      ''
      '     ( SELECT DISTINCT'
      '              CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL,'
      '              M.IMONOME            AS NOMEMESTRE,'
      '              I.IMONOME            AS NOMEIMOVEL,'
      '              M.IDIMOVEL           AS IDIMOVELMESTRE,'
      '              I.IDIMOVEL           AS IDIMOVEL,'
      '              CXI.VLRVENDA         AS VLRVENDA,'
      '              CXI.VLRCONTABIL      AS VLRCONTABIL,'
      '              C.UF                 AS UF'
      '       FROM'
      '              CONTRATOXIMOVEL CXI,'
      '              IMOVEL I,'
      '              IMOVEL M,'
      '              CIDADES C'
      '       WHERE'
      '              CXI.IDIMOVEL = I.IDIMOVEL'
      '          AND M.IDCIDADES = C.IDCIDADES(+)'
      '          AND I.IDIMOVELMESTRE = M.IDIMOVEL ) IM'
      ''
      'WHERE'
      '         (P.IDPESSOA(+) = CI.IDLOCATARIO)'
      '     AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL)'
      ''
      '      AND CXI.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL'
      '      AND PPI.IDIMOVEL = CXI.IDIMOVEL'
      ''
      
        '     AND ( (:pDTINI IS NULL) OR (CI.CONDATAASSINATURA >= TO_DATE' +
        '(:pDTINI,'#39'DD/MM/YYYY'#39')) )'
      
        '     AND ( (:pDTFIM IS NULL) OR (CI.CONDATAASSINATURA <= TO_DATE' +
        '(:pDTFIM,'#39'DD/MM/YYYY'#39')) )'
      
        '     AND ( (:pIDCONTRATOIMOVEL IS NULL) OR (CI.IDCONTRATOIMOVEL ' +
        '= :pIDCONTRATOIMOVEL) )'
      
        '     AND ( (:pIDCOMPRADOR IS NULL) OR (CI.IDLOCATARIO = :pIDCOMP' +
        'RADOR) )'
      
        '     AND ( (:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSAVEL = :pID' +
        'RESPONSAVEL) )'
      
        '     AND ( (:pIDIMOVELMESTRE IS NULL) OR (IM.IDIMOVELMESTRE = :p' +
        'IDIMOVELMESTRE) )'
      '     AND ( (:pIDIMOVEL IS NULL) OR (IM.IDIMOVEL = :pIDIMOVEL) )'
      '     AND ( (:pUF IS NULL) OR (TRIM(IM.UF) = :pUF) )'
      '     AND ( CI.FLGTIPOCONTRATO = :PFLGTIPOCONTRATO )'
      ''
      
        '     AND ( (:IDPLANOPREV IS NULL) OR (PPI.IDPLANOPREV = :IDPLANO' +
        'PREV) )'
      ''
      '     AND ( (:IDPATRO IS NULL) OR (PPI.IDPATRO = :IDPATRO) )'
      ''
      
        'ORDER BY DECODE(:pORDEM, 0, NOMEMESTRE || RAZAOSOCIAL || CONNUME' +
        'RO,'
      
        '                         1, RAZAOSOCIAL || NOMEMESTRE || CONNUME' +
        'RO,'
      '                         2, NOMECONTRATO || NOMEIMOVEL,'
      
        '                         3, TO_CHAR(CONDATAASSINATURA,'#39'YYYY/MM/D' +
        'D'#39') )')
    ValidateWithMask = True
    Left = 34
    Top = 338
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'pDTINI'
        ParamType = ptUnknown
        Value = '01/01/2001'
      end
      item
        DataType = ftDateTime
        Name = 'pDTINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTFIM'
        ParamType = ptUnknown
        Value = '01/11/2001'
      end
      item
        DataType = ftDateTime
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCOMPRADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCOMPRADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pUF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pUF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGTIPOCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pORDEM'
        ParamType = ptUnknown
      end>
  end
  object dsImovAli: TwwDataSource
    DataSet = qryImovAli
    Left = 124
    Top = 338
  end
  object pplImovAli: TppBDEPipeline
    DataSource = dsImovAli
    UserName = 'lImovAli'
    Left = 218
    Top = 338
    object pplImovAlippField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplImovAlippField2: TppField
      FieldAlias = 'CONNUMERO'
      FieldName = 'CONNUMERO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object pplImovAlippField3: TppField
      FieldAlias = 'CONNOME'
      FieldName = 'CONNOME'
      FieldLength = 100
      DisplayWidth = 100
      Position = 2
    end
    object pplImovAlippField4: TppField
      FieldAlias = 'NOMECONTRATO'
      FieldName = 'NOMECONTRATO'
      FieldLength = 123
      DisplayWidth = 123
      Position = 3
    end
    object pplImovAlippField5: TppField
      FieldAlias = 'CONDATAASSINATURA'
      FieldName = 'CONDATAASSINATURA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object pplImovAlippField6: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object pplImovAlippField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplImovAlippField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVELMESTRE'
      FieldName = 'IDIMOVELMESTRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplImovAlippField9: TppField
      FieldAlias = 'NOMEMESTRE'
      FieldName = 'NOMEMESTRE'
      FieldLength = 100
      DisplayWidth = 100
      Position = 8
    end
    object pplImovAlippField10: TppField
      FieldAlias = 'NOMEIMOVEL'
      FieldName = 'NOMEIMOVEL'
      FieldLength = 100
      DisplayWidth = 100
      Position = 9
    end
    object pplImovAlippField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRVENDA'
      FieldName = 'VLRVENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplImovAlippField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCONTABIL'
      FieldName = 'VLRCONTABIL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplImovAlippField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRESULTADO'
      FieldName = 'VLRRESULTADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplImovAlippField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCLUCRO'
      FieldName = 'PERCLUCRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
  end
  object rpImovAli: TppReport
    AutoStop = False
    DataPipeline = pplImovAli
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 306
    Top = 338
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplImovAli'
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25665
      mmPrintPosition = 0
      object ppLabel64: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Imóveis Alienados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8467
        mmWidth = 284163
        BandType = 0
      end
      object ppLabel73: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284428
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line11'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 20638
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'Label23'
        Caption = 'Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 61913
        mmTop = 21167
        mmWidth = 11642
        BandType = 0
      end
      object pplComprador3: TppLabel
        UserName = 'Label19'
        Caption = 'Comprador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 81492
        mmTop = 21167
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'Label50'
        Caption = 'Imóvel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 21431
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Vlr Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 188384
        mmTop = 21167
        mmWidth = 15875
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 25135
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel90: TppLabel
        UserName = 'Label90'
        AutoSize = False
        Caption = 'Vlr Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 242888
        mmTop = 21167
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel91: TppLabel
        UserName = 'Label901'
        AutoSize = False
        Caption = 'Vlr Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 214578
        mmTop = 21167
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel96: TppLabel
        UserName = 'Label902'
        AutoSize = False
        Caption = 'Diferença'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 268288
        mmTop = 21167
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel79: TppLabel
        UserName = 'Label79'
        AutoSize = False
        Caption = 'Data Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 152136
        mmTop = 21167
        mmWidth = 21696
        BandType = 0
      end
      object lblPatro: TppLabel
        UserName = 'lblPatro'
        Caption = 'lblPatro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 81492
        mmTop = 15875
        mmWidth = 10583
        BandType = 0
      end
      object lblPlanoContabil: TppLabel
        UserName = 'lblPlanoContabil'
        Caption = 'lblPlanoContabil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2910
        mmTop = 16140
        mmWidth = 22490
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object pplSeparador4: TppLine
        OnPrint = pplnSeparadorPrint
        UserName = 'lSeparador4'
        ParentHeight = True
        ParentWidth = True
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppsCor4: TppShape
        OnPrint = ppsCorPrint
        UserName = 'sCor4'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppdbComprador3: TppDBText
        UserName = 'DBText10'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = pplImovAli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplImovAli'
        mmHeight = 3704
        mmLeft = 81492
        mmTop = 0
        mmWidth = 71702
        BandType = 4
      end
      object ppDBText59: TppDBText
        UserName = 'DBText12'
        BlankWhenZero = True
        DataField = 'CONNUMERO'
        DataPipeline = pplImovAli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplImovAli'
        mmHeight = 3704
        mmLeft = 61913
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText60: TppDBText
        UserName = 'DBText13'
        BlankWhenZero = True
        DataField = 'NOMEIMOVEL'
        DataPipeline = pplImovAli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplImovAli'
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 0
        mmWidth = 56356
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'DBText33'
        BlankWhenZero = True
        DataField = 'VLRVENDA'
        DataPipeline = pplImovAli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplImovAli'
        mmHeight = 3704
        mmLeft = 177007
        mmTop = 0
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'DBText63'
        BlankWhenZero = True
        DataField = 'VLRRESULTADO'
        DataPipeline = pplImovAli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplImovAli'
        mmHeight = 3704
        mmLeft = 235744
        mmTop = 0
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText64: TppDBText
        UserName = 'DBText64'
        BlankWhenZero = True
        DataField = 'PERCLUCRO'
        DataPipeline = pplImovAli
        DisplayFormat = '##0.00%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplImovAli'
        mmHeight = 3704
        mmLeft = 266701
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText65: TppDBText
        UserName = 'DBText65'
        BlankWhenZero = True
        DataField = 'VLRCONTABIL'
        DataPipeline = pplImovAli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplImovAli'
        mmHeight = 3704
        mmLeft = 206375
        mmTop = 0
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'DBText52'
        BlankWhenZero = True
        DataField = 'CONDATAASSINATURA'
        DataPipeline = pplImovAli
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplImovAli'
        mmHeight = 3704
        mmLeft = 156634
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppLine17: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel85: TppLabel
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
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable13: TppSystemVariable
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
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable14: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257969
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand5: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 37835
      mmPrintPosition = 0
      object ppRegion5: TppRegion
        UserName = 'Region5'
        mmHeight = 9260
        mmLeft = 139965
        mmTop = 6615
        mmWidth = 144727
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel125: TppLabel
          UserName = 'Label125'
          Caption = 'Total Geral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 142876
          mmTop = 9525
          mmWidth = 29633
          BandType = 7
        end
        object ppDBCalcVlrVenda: TppDBCalc
          UserName = 'DBCalcVlrVenda'
          DataField = 'VLRVENDA'
          DataPipeline = pplImovAli
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplImovAli'
          mmHeight = 3175
          mmLeft = 177007
          mmTop = 9790
          mmWidth = 27252
          BandType = 7
        end
        object ppDBCalcVlrContabil: TppDBCalc
          UserName = 'DBCalcVlrContabil'
          DataField = 'VLRCONTABIL'
          DataPipeline = pplImovAli
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplImovAli'
          mmHeight = 3175
          mmLeft = 206375
          mmTop = 9790
          mmWidth = 27252
          BandType = 7
        end
        object ppDBCalcVlrResult: TppDBCalc
          UserName = 'DBCalcVlrResult'
          DataField = 'VLRRESULTADO'
          DataPipeline = pplImovAli
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplImovAli'
          mmHeight = 3175
          mmLeft = 235744
          mmTop = 9790
          mmWidth = 27252
          BandType = 7
        end
        object ppvarDiferenca: TppVariable
          UserName = 'varDiferenca'
          AutoSize = False
          CalcOrder = 0
          DisplayFormat = '##0.00%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 264319
          mmTop = 9790
          mmWidth = 18785
          BandType = 7
        end
      end
      object ppRegion6: TppRegion
        UserName = 'Region6'
        mmHeight = 9260
        mmLeft = 2646
        mmTop = 6615
        mmWidth = 33073
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'IDCONTRATOIMOVEL'
          DataPipeline = pplImovAli
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplImovAli'
          mmHeight = 3440
          mmLeft = 5292
          mmTop = 9790
          mmWidth = 9790
          BandType = 7
        end
        object ppLabel126: TppLabel
          UserName = 'Label126'
          Caption = 'Contratos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3387
          mmLeft = 17198
          mmTop = 9790
          mmWidth = 13335
          BandType = 7
        end
      end
      object ppLine3: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 1323
        mmWidth = 284300
        BandType = 7
      end
      object ppSubReport4: TppSubReport
        UserName = 'SubReport4'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplImovAliTOT'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 21166
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport5: TppChildReport
          AutoStop = False
          DataPipeline = pplImovAliTOT
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
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
          Left = 216
          Top = 304
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplImovAliTOT'
          object ppTitleBand5: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 11377
            mmPrintPosition = 0
            object ppLabel138: TppLabel
              UserName = 'Label138'
              Caption = 'Plano'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3703
              mmLeft = 2910
              mmTop = 6350
              mmWidth = 7673
              BandType = 1
            end
            object ppLabel139: TppLabel
              UserName = 'Label1302'
              Caption = 'Patrocinadora'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3703
              mmLeft = 81756
              mmTop = 6350
              mmWidth = 25400
              BandType = 1
            end
            object ppLabel140: TppLabel
              UserName = 'Label140'
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3703
              mmLeft = 157427
              mmTop = 6350
              mmWidth = 2381
              BandType = 1
            end
            object ppLabel141: TppLabel
              UserName = 'Label141'
              Caption = 'Vlr Venda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3703
              mmLeft = 191294
              mmTop = 6350
              mmWidth = 13229
              BandType = 1
            end
            object ppLabel142: TppLabel
              UserName = 'Label142'
              Caption = 'Vlr Contábil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3703
              mmLeft = 218017
              mmTop = 6350
              mmWidth = 15875
              BandType = 1
            end
            object ppLabel143: TppLabel
              UserName = 'Label143'
              Caption = 'Vlr Resultado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3703
              mmLeft = 246063
              mmTop = 6350
              mmWidth = 18256
              BandType = 1
            end
            object ppLabel151: TppLabel
              UserName = 'Label1501'
              Caption = 'Resumo de Segregação  - Por Total Geral'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4191
              mmLeft = 2646
              mmTop = 529
              mmWidth = 69173
              BandType = 1
            end
          end
          object ppDetailBand10: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object ppDBText105: TppDBText
              UserName = 'DBText105'
              DataField = 'NOMPLANPREV'
              DataPipeline = pplImovAliTOT
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplImovAliTOT'
              mmHeight = 3175
              mmLeft = 2910
              mmTop = 1058
              mmWidth = 74083
              BandType = 4
            end
            object ppDBText106: TppDBText
              UserName = 'DBText106'
              DataField = 'NOMEPATR'
              DataPipeline = pplImovAliTOT
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplImovAliTOT'
              mmHeight = 3175
              mmLeft = 81756
              mmTop = 1058
              mmWidth = 57415
              BandType = 4
            end
            object ppDBText107: TppDBText
              UserName = 'DBText107'
              DataField = 'PERCENTRATEIO'
              DataPipeline = pplImovAliTOT
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplImovAliTOT'
              mmHeight = 3175
              mmLeft = 146844
              mmTop = 1058
              mmWidth = 12965
              BandType = 4
            end
            object ppDBText108: TppDBText
              UserName = 'DBText108'
              DataField = 'TOTVLRVENDA'
              DataPipeline = pplImovAliTOT
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplImovAliTOT'
              mmHeight = 3175
              mmLeft = 168275
              mmTop = 1058
              mmWidth = 36248
              BandType = 4
            end
            object ppDBText109: TppDBText
              UserName = 'DBText109'
              DataField = 'TOTVLRCONTABIL'
              DataPipeline = pplImovAliTOT
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplImovAliTOT'
              mmHeight = 3175
              mmLeft = 205582
              mmTop = 1058
              mmWidth = 28310
              BandType = 4
            end
            object ppDBText110: TppDBText
              UserName = 'DBText1002'
              DataField = 'TOTVLRRESULTADO'
              DataPipeline = pplImovAliTOT
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplImovAliTOT'
              mmHeight = 3175
              mmLeft = 234686
              mmTop = 1058
              mmWidth = 29633
              BandType = 4
            end
          end
          object ppSummaryBand8: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 2117
            mmPrintPosition = 0
          end
        end
      end
    end
    object ppGroup12: TppGroup
      BreakName = 'NOMEMESTRE'
      DataPipeline = pplImovAli
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group12'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplImovAli'
      object ppGroupHeaderBand10: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object ppLabel89: TppLabel
          UserName = 'Label18'
          AutoSize = False
          Caption = 'Imóvel Mestre:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 2381
          mmWidth = 30163
          BandType = 3
          GroupNo = 0
        end
        object ppDBText62: TppDBText
          UserName = 'dbGrupo'
          DataField = 'NOMEMESTRE'
          DataPipeline = pplImovAli
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplImovAli'
          mmHeight = 4233
          mmLeft = 31750
          mmTop = 2381
          mmWidth = 132821
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 7408
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 529
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand10: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup13: TppGroup
      BreakName = 'NOMEMESTRE'
      DataPipeline = pplImovAli
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group13'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplImovAli'
      object ppGroupHeaderBand11: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand11: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppSubReport3: TppSubReport
          OnPrint = ppSubReport3Print
          UserName = 'SubReport3'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplImovAliDET'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 529
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport4: TppChildReport
            AutoStop = False
            DataPipeline = pplImovAliDET
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
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
            Left = 200
            Top = 288
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplImovAliDET'
            object ppTitleBand4: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 11377
              mmPrintPosition = 0
              object ppLabel132: TppLabel
                UserName = 'Label132'
                Caption = 'Plano'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 2646
                mmTop = 6615
                mmWidth = 7673
                BandType = 1
              end
              object ppLabel133: TppLabel
                UserName = 'Label1301'
                Caption = 'Patrocinadora'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 81492
                mmTop = 6615
                mmWidth = 25400
                BandType = 1
              end
              object ppLabel134: TppLabel
                UserName = 'Label134'
                Caption = '%'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 157163
                mmTop = 6615
                mmWidth = 2381
                BandType = 1
              end
              object ppLabel135: TppLabel
                UserName = 'Label135'
                Caption = 'Vlr Venda'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 191030
                mmTop = 6615
                mmWidth = 13229
                BandType = 1
              end
              object ppLabel136: TppLabel
                UserName = 'Label133'
                Caption = 'Vlr Contábil'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 217753
                mmTop = 6615
                mmWidth = 15875
                BandType = 1
              end
              object ppLabel137: TppLabel
                UserName = 'Label137'
                Caption = 'Vlr Resultado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 245798
                mmTop = 6615
                mmWidth = 18256
                BandType = 1
              end
              object ppLabel150: TppLabel
                UserName = 'Label150'
                Caption = 'Resumo de Segregação - Por Imóvel Mestre'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4191
                mmLeft = 529
                mmTop = 1058
                mmWidth = 73321
                BandType = 1
              end
            end
            object ppDetailBand2: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
              object ppDBText99: TppDBText
                UserName = 'DBText99'
                DataField = 'NOMPLANPREV'
                DataPipeline = pplImovAliDET
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplImovAliDET'
                mmHeight = 3175
                mmLeft = 2910
                mmTop = 1058
                mmWidth = 74083
                BandType = 4
              end
              object ppDBText100: TppDBText
                UserName = 'DBText100'
                DataField = 'NOMEPATR'
                DataPipeline = pplImovAliDET
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplImovAliDET'
                mmHeight = 3175
                mmLeft = 81756
                mmTop = 1058
                mmWidth = 57415
                BandType = 4
              end
              object ppDBText101: TppDBText
                UserName = 'DBText1'
                DataField = 'PERCENTRATEIO'
                DataPipeline = pplImovAliDET
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplImovAliDET'
                mmHeight = 3175
                mmLeft = 146844
                mmTop = 1058
                mmWidth = 12965
                BandType = 4
              end
              object ppDBText102: TppDBText
                UserName = 'DBText102'
                DataField = 'TOTVLRVENDA'
                DataPipeline = pplImovAliDET
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplImovAliDET'
                mmHeight = 3175
                mmLeft = 168275
                mmTop = 1058
                mmWidth = 36248
                BandType = 4
              end
              object ppDBText103: TppDBText
                UserName = 'DBText103'
                DataField = 'TOTVLRCONTABIL'
                DataPipeline = pplImovAliDET
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplImovAliDET'
                mmHeight = 3175
                mmLeft = 205582
                mmTop = 1058
                mmWidth = 28310
                BandType = 4
              end
              object ppDBText104: TppDBText
                UserName = 'DBText1001'
                DataField = 'TOTVLRRESULTADO'
                DataPipeline = pplImovAliDET
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplImovAliDET'
                mmHeight = 3175
                mmLeft = 234686
                mmTop = 1058
                mmWidth = 29633
                BandType = 4
              end
            end
            object ppSummaryBand7: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 1588
              mmPrintPosition = 0
            end
          end
        end
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650612
        53756D6D6172794265666F72655072696E740B50726F6772616D54797065070B
        747450726F63656475726506536F7572636506FA70726F636564757265205375
        6D6D6172794265666F72655072696E743B0D0A626567696E0D0A202020766172
        4469666572656E63612E4173457874656E646564203A3D20303B0D0A20202069
        6620444243616C63566C72436F6E746162696C2E56616C7565203E2030207468
        656E20626567696E0D0A2020202020207661724469666572656E63612E417345
        7874656E646564203A3D2028444243616C63566C7256656E64612E56616C7565
        202D20444243616C63566C72436F6E746162696C2E56616C756529202A203130
        30202F20444243616C63566C72436F6E746162696C2E56616C75653B200D0A20
        2020656E643B0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506075375
        6D6D617279094576656E744E616D65060B4265666F72655072696E7407457665
        6E74494402180000}
    end
    object ppParameterList2: TppParameterList
    end
  end
  object qryListaContratos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CI.IDCONTRATOIMOVEL,'
      '     CI.CONNUMERO,'
      '     CI.CONNOME,'
      '     CI.VLRPROPOSTA,'
      '     CI.CONDATAINICIO,'
      '     P.RAZAOSOCIAL,'
      '     IM.IMONOME AS NOMEMESTRE,'
      '     (IM.IMONOME || '#39' - '#39' || I.IMONOME) AS NOMEIMOVEL,'
      '     CXI.VLRVENDA,'
      '     CXI.VLRCONTABIL,'
      '     DECODE(CI.FLGTIPOCONTRATO,'#39'P'#39','#39'Proposta'#39','
      '                               '#39'C'#39','#39'Contrato'#39','
      '                               '#39'A'#39','#39'Acordo'#39') AS DSCSITUACAO,'
      
        '     DECODE(CI.FLGSTATUS,'#39'V'#39','#39'Vigente'#39','#39'E'#39','#39'Encerrado'#39','#39'R'#39','#39'Resc' +
        'indido'#39','#39'S'#39','#39'Suspenso'#39') AS DSCSTATUS,'
      
        '     DECODE(CXI.FLGRATEIO, 1, CXI.CIMPERCENTRATEIO, 100)  AS PER' +
        'CENT_BAIXA'
      'FROM'
      '     CONTRATOIMOVEL CI,'
      '     CONTRATOXIMOVEL CXI,'
      '     PESSOA P,'
      '     IMOVEL I,'
      '     IMOVEL IM'
      'WHERE'
      '  1=2 AND   (CI.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL)'
      '     AND (CI.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL)'
      '     AND (CXI.IDIMOVEL = I.IDIMOVEL)'
      '     AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)'
      '     AND (CI.IDLOCATARIO = P.IDPESSOA(+))'
      
        '     AND ( (:pIDCONTRATOIMOVEL IS NULL) OR (CI.IDCONTRATOIMOVEL ' +
        '= :pIDCONTRATOIMOVEL) )'
      
        '     AND ( (:pIDCOMPRADOR IS NULL) OR (CI.IDLOCATARIO = :pIDCOMP' +
        'RADOR) )'
      
        '     AND ( (:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSAVEL = :pID' +
        'RESPONSAVEL) )'
      '     AND ( (:pIDIMOVEL IS NULL) OR (I.IDIMOVEL = :pIDIMOVEL) )'
      
        '     AND ( (:pIDIMOVELMESTRE IS NULL) OR (I.IDIMOVELMESTRE = :pI' +
        'DIMOVELMESTRE) )'
      
        '     AND ( (:pIDADMINIMOVEL IS NULL) OR (CI.IDADMINIMOVEL = :pID' +
        'ADMINIMOVEL) )'
      
        '     AND ( (:pDTINI IS NULL) OR (CI.CONDATAINICIO >= TO_DATE(:pD' +
        'TINI,'#39'DD/MM/YYYY'#39')) )'
      
        '     AND ( (:pDTFIM IS NULL) OR (CI.CONDATAINICIO <= TO_DATE(:pD' +
        'TFIM,'#39'DD/MM/YYYY'#39')) )'
      
        '     AND ( (:pFLGSTATUS IS NULL) OR (CI.FLGSTATUS = :pFLGSTATUS)' +
        ' )'
      
        '     AND (   ((:pFLGPROPOSTA = '#39'S'#39') AND (CI.FLGTIPOCONTRATO = '#39'P' +
        #39'))'
      
        '          OR ((:pFLGCONTRATO = '#39'S'#39') AND (CI.FLGTIPOCONTRATO = '#39'C' +
        #39'))'
      
        '          OR ((:pFLGACORDO   = '#39'S'#39') AND (CI.FLGTIPOCONTRATO = '#39'A' +
        #39'))  )'
      ''
      'ORDER BY DECODE(:pORDEM, 0, CONNUMERO || NOMEIMOVEL,'
      '                         1, CONNOME || NOMEIMOVEL,'
      
        '                         2, NOMEMESTRE || CONNUMERO || NOMEIMOVE' +
        'L,'
      '                         3, NOMEMESTRE || CONNOME || NOMEIMOVEL,'
      
        '                         4, RAZAOSOCIAL || NOMEMESTRE || CONNUME' +
        'RO || NOMEIMOVEL)'
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 34
    Top = 465
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDCOMPRADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDCOMPRADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFLGSTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFLGSTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFLGPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFLGCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pFLGACORDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pORDEM'
        ParamType = ptUnknown
      end>
  end
  object qryListaCondPag: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsListaContratos
    SQL.Strings = (
      'SELECT'
      '      CP.IDCONTRATOIMOVEL,'
      '      CP.VLRFINANC,'
      '      CP.TAXAJUROS,'
      '      CP.PERIODOTAXA,'
      '      CP.NUMPARCELAS,'
      '      CP.DATAVENCIMENTO,'
      '      CP.DATAINI,'
      '      CP.FLGREAJMENSAL,'
      '      CP.FLGCMMENSAL,'
      '      MC.MOESIGLA   AS DSCINDCORR,'
      '      MP.MOESIGLA   AS DSCINDPROJ,'
      
        '      DECODE(CP.PERIODOTAXA,'#39'M'#39',TO_CHAR(CP.TAXAJUROS,'#39'999.9999'#39')' +
        ' || '#39'% ao Mês'#39','
      
        '                                TO_CHAR(CP.TAXAJUROS,'#39'999.9999'#39')' +
        ' || '#39'% ao Ano'#39') AS DSCJUROS,'
      '      DECODE(CP.TIPOCONDPAG,'#39'S'#39','#39'Sinal'#39','
      '                            '#39'P'#39','#39'Parcelamento'#39','
      '                            '#39'V'#39','#39'Venda a Vista'#39','
      '                            '#39'C'#39','#39'Caução'#39','
      
        '                            '#39'R'#39','#39'Repactuação'#39','#39'Cond.Inicial'#39') AS' +
        ' DSCTIPO'
      ''
      'FROM  CONDPAGIMOVEL CP,'
      '      MOEDA MC,'
      '      MOEDA MP'
      ''
      'WHERE'
      '  1=2 AND (MC.MOECODIGO(+) = CP.INDCORRECAO)'
      '  AND (MP.MOECODIGO(+) = CP.IDINDCORRPROJ)'
      '  AND (IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      ''
      ''
      'ORDER BY  DATAINI'
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 34
    Top = 477
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
  end
  object dsListaContratos: TwwDataSource
    DataSet = qryListaContratos
    Left = 124
    Top = 464
  end
  object dsListaCondPag: TwwDataSource
    DataSet = qryListaCondPag
    Left = 124
    Top = 477
  end
  object pplListaContratos: TppBDEPipeline
    DataSource = dsListaContratos
    UserName = 'lListaContratos'
    Left = 218
    Top = 464
  end
  object pplListaCondPag: TppBDEPipeline
    DataSource = dsListaCondPag
    UserName = 'lListaCondPag'
    Left = 218
    Top = 477
    MasterDataPipelineName = 'pplListaContratos'
    object TppMasterFieldLink
      MasterFieldName = 'IDCONTRATOIMOVEL'
      DetailFieldName = 'IDCONTRATOIMOVEL'
      DetailSortOrder = soAscending
    end
  end
  object rpListaContratos: TppReport
    AutoStop = False
    DataPipeline = pplListaContratos
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    BeforePrint = rpListaContratosBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 306
    Top = 469
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplListaContratos'
    object ppHeaderBand8: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17463
      mmPrintPosition = 0
      object pplTitulo: TppLabel
        UserName = 'Label11'
        Caption = 'Relação de Contratos e Propostas de Alienação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 91017
        mmTop = 8731
        mmWidth = 96573
        BandType = 0
      end
      object ppLabel53: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 121709
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 15610
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText75: TppDBText
        UserName = 'DBText17'
        BlankWhenZero = True
        DataField = 'VLRVENDA'
        DataPipeline = pplListaContratos
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListaContratos'
        mmHeight = 3175
        mmLeft = 132292
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        DataField = 'NOMEIMOVEL'
        DataPipeline = pplListaContratos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListaContratos'
        mmHeight = 3175
        mmLeft = 17727
        mmTop = 0
        mmWidth = 106892
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText3'
        BlankWhenZero = True
        DataField = 'VLRCONTABIL'
        DataPipeline = pplListaContratos
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListaContratos'
        mmHeight = 3175
        mmLeft = 171715
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        BlankWhenZero = True
        DataField = 'PERCENT_BAIXA'
        DataPipeline = pplListaContratos
        DisplayFormat = '##0.00%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListaContratos'
        mmHeight = 3175
        mmLeft = 207698
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
    end
    object ppFooterBand8: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel54: TppLabel
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
        mmWidth = 282311
        BandType = 8
      end
      object ppSystemVariable15: TppSystemVariable
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
        mmWidth = 282311
        BandType = 8
      end
      object ppSystemVariable16: TppSystemVariable
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
        mmLeft = 256117
        mmTop = 3440
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup9: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplListaContratos
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplListaContratos'
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppLabel55: TppLabel
          UserName = 'Label31'
          Caption = 'Contrato:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppDBText80: TppDBText
          UserName = 'DBText18'
          AutoSize = True
          DataField = 'CONNUMERO'
          DataPipeline = pplListaContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplListaContratos'
          mmHeight = 3969
          mmLeft = 18256
          mmTop = 0
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
        object ppDBText81: TppDBText
          UserName = 'DBText19'
          DataField = 'CONNOME'
          DataPipeline = pplListaContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplListaContratos'
          mmHeight = 3969
          mmLeft = 42863
          mmTop = 0
          mmWidth = 144198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel56: TppLabel
          UserName = 'Label4'
          Caption = 'Valor da  Venda:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 65088
          mmTop = 9260
          mmWidth = 21696
          BandType = 3
          GroupNo = 0
        end
        object ppDBText82: TppDBText
          UserName = 'DBText201'
          DataField = 'VLRPROPOSTA'
          DataPipeline = pplListaContratos
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplListaContratos'
          mmHeight = 3175
          mmLeft = 89165
          mmTop = 9260
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel60: TppLabel
          UserName = 'Label5'
          Caption = 'Data da Proposta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 17992
          mmTop = 8996
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object ppDBText83: TppDBText
          UserName = 'DBText1'
          DataField = 'CONDATAINICIO'
          DataPipeline = pplListaContratos
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplListaContratos'
          mmHeight = 3175
          mmLeft = 42863
          mmTop = 9260
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel65: TppLabel
          UserName = 'Label6'
          Caption = 'Comprador:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 17992
          mmTop = 4763
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppDBText84: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'RAZAOSOCIAL'
          DataPipeline = pplListaContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplListaContratos'
          mmHeight = 3175
          mmLeft = 42863
          mmTop = 4763
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel109: TppLabel
          UserName = 'Label109'
          Caption = 'Situação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 125413
          mmTop = 8996
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppDBText77: TppDBText
          UserName = 'DBText77'
          DataField = 'DSCSITUACAO'
          DataPipeline = pplListaContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplListaContratos'
          mmHeight = 3175
          mmLeft = 139700
          mmTop = 8996
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Status:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 171715
          mmTop = 8731
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppDBText78: TppDBText
          UserName = 'DBText78'
          DataField = 'DSCSTATUS'
          DataPipeline = pplListaContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplListaContratos'
          mmHeight = 3175
          mmLeft = 182298
          mmTop = 8996
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup10: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplListaContratos
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplListaContratos'
      object ppGroupHeaderBand8: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3175
        mmPrintPosition = 0
        object ppLine18: TppLine
          UserName = 'Line19'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 1323
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup11: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplListaContratos
      OutlineSettings.CreateNode = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplListaContratos'
      object ppGroupHeaderBand9: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppLabel118: TppLabel
          UserName = 'Label29'
          AutoSize = False
          Caption = 'Valor de Alienação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 125413
          mmTop = 794
          mmWidth = 28046
          BandType = 3
          GroupNo = 2
        end
        object ppLabel66: TppLabel
          UserName = 'Label66'
          Caption = 'Imóveis:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3175
          mmLeft = 17992
          mmTop = 794
          mmWidth = 11113
          BandType = 3
          GroupNo = 2
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Valor Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 163777
          mmTop = 794
          mmWidth = 28046
          BandType = 3
          GroupNo = 2
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Perc. de Baixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 199761
          mmTop = 794
          mmWidth = 28046
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppSubReport2: TppSubReport
          UserName = 'SubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplListaCondPag'
          mmHeight = 5292
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 2
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = pplListaCondPag
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
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
            Left = 136
            Top = 192
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplListaCondPag'
            object ppTitleBand2: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 5027
              mmPrintPosition = 0
              object ppLabel69: TppLabel
                UserName = 'Label86'
                Caption = 'Condição de Pagamento:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsItalic]
                Transparent = True
                mmHeight = 3175
                mmLeft = 10583
                mmTop = 794
                mmWidth = 34131
                BandType = 1
              end
            end
            object ppDetailBand9: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
              object ppDBText51: TppDBText
                UserName = 'DBText51'
                DataField = 'DSCTIPO'
                DataPipeline = pplListaCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplListaCondPag'
                mmHeight = 3175
                mmLeft = 10319
                mmTop = 0
                mmWidth = 23283
                BandType = 4
              end
              object ppLabel71: TppLabel
                UserName = 'Label71'
                AutoSize = False
                Caption = 'Valor:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 3175
                mmLeft = 35719
                mmTop = 0
                mmWidth = 8996
                BandType = 4
              end
              object ppDBText53: TppDBText
                UserName = 'DBText53'
                BlankWhenZero = True
                DataField = 'VLRFINANC'
                DataPipeline = pplListaCondPag
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplListaCondPag'
                mmHeight = 3175
                mmLeft = 44979
                mmTop = 0
                mmWidth = 17198
                BandType = 4
              end
              object ppLabel78: TppLabel
                UserName = 'Label78'
                AutoSize = False
                Caption = 'Nr. Parcelas:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 3175
                mmLeft = 64558
                mmTop = 0
                mmWidth = 17992
                BandType = 4
              end
              object ppDBText70: TppDBText
                UserName = 'DBText70'
                DataField = 'NUMPARCELAS'
                DataPipeline = pplListaCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplListaCondPag'
                mmHeight = 3175
                mmLeft = 82550
                mmTop = 0
                mmWidth = 6879
                BandType = 4
              end
              object ppLabel81: TppLabel
                UserName = 'Label81'
                AutoSize = False
                Caption = 'Vencto:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 3175
                mmLeft = 91281
                mmTop = 0
                mmWidth = 10319
                BandType = 4
              end
              object ppDBText71: TppDBText
                UserName = 'DBText71'
                DataField = 'DATAVENCIMENTO'
                DataPipeline = pplListaCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplListaCondPag'
                mmHeight = 3175
                mmLeft = 101865
                mmTop = 0
                mmWidth = 15610
                BandType = 4
              end
              object ppLabel83: TppLabel
                UserName = 'Label83'
                AutoSize = False
                Caption = 'Juros:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 3175
                mmLeft = 118534
                mmTop = 0
                mmWidth = 9260
                BandType = 4
              end
              object ppDBText72: TppDBText
                UserName = 'DBText72'
                DataField = 'DSCJUROS'
                DataPipeline = pplListaCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplListaCondPag'
                mmHeight = 3175
                mmLeft = 127794
                mmTop = 0
                mmWidth = 24606
                BandType = 4
              end
              object ppLabel87: TppLabel
                UserName = 'Label87'
                AutoSize = False
                Caption = 'Correção:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 3175
                mmLeft = 178859
                mmTop = 0
                mmWidth = 13494
                BandType = 4
              end
              object ppDBText73: TppDBText
                UserName = 'DBText73'
                DataField = 'DSCINDCORR'
                DataPipeline = pplListaCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplListaCondPag'
                mmHeight = 3175
                mmLeft = 192352
                mmTop = 0
                mmWidth = 16933
                BandType = 4
              end
              object ppLabel92: TppLabel
                UserName = 'Label92'
                AutoSize = False
                Caption = 'Projeção:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 3175
                mmLeft = 209286
                mmTop = 0
                mmWidth = 12965
                BandType = 4
              end
              object ppDBText74: TppDBText
                UserName = 'DBText74'
                DataField = 'DSCINDPROJ'
                DataPipeline = pplListaCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplListaCondPag'
                mmHeight = 3175
                mmLeft = 222250
                mmTop = 0
                mmWidth = 15081
                BandType = 4
              end
              object ppLabel108: TppLabel
                UserName = 'Label108'
                AutoSize = False
                Caption = 'Início:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 3175
                mmLeft = 259821
                mmTop = 0
                mmWidth = 8467
                BandType = 4
              end
              object ppDBText76: TppDBText
                UserName = 'DBText76'
                DataField = 'DATAINI'
                DataPipeline = pplListaCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplListaCondPag'
                mmHeight = 3175
                mmLeft = 268553
                mmTop = 0
                mmWidth = 15875
                BandType = 4
              end
              object myDBCheckBox3: TmyDBCheckBox
                UserName = 'DBCheckBox3'
                BooleanFalse = 'N'
                BooleanTrue = 'S'
                DataPipeline = pplListaCondPag
                DataField = 'FLGREAJMENSAL'
                Transparent = True
                DataPipelineName = 'pplListaCondPag'
                mmHeight = 3704
                mmLeft = 153459
                mmTop = 0
                mmWidth = 3969
                BandType = 4
              end
              object ppLabel9: TppLabel
                UserName = 'Label9'
                Caption = 'Juros Mensal'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 156634
                mmTop = 0
                mmWidth = 16933
                BandType = 4
              end
              object myDBCheckBox4: TmyDBCheckBox
                UserName = 'DBCheckBox4'
                BooleanFalse = 'N'
                BooleanTrue = 'S'
                DataPipeline = pplListaCondPag
                DataField = 'FLGCMMENSAL'
                Transparent = True
                DataPipelineName = 'pplListaCondPag'
                mmHeight = 3704
                mmLeft = 238919
                mmTop = 0
                mmWidth = 3969
                BandType = 4
              end
              object ppLabel10: TppLabel
                UserName = 'Label10'
                Caption = 'CM Mensal'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 242094
                mmTop = 0
                mmWidth = 14288
                BandType = 4
              end
            end
            object ppSummaryBand4: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
    end
  end
  object updExtrato: TUpdateSQL
    Left = 67
    Top = 173
  end
  object updInadAna: TUpdateSQL
    Left = 27
    Top = 282
  end
  object qryResiduo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    P.IDCONDPAGIMOVEL,'
      '    P.FLGTIPOLANC,'
      '    NVL(P.VLRRESIDUO,0) AS VLRRESIDUO,'
      '    P.DATAVENCIMENTO,'
      '    P.PLNCODIGO'
      'FROM'
      '    PARCFINANCIMOV P,'
      '    CONDPAGIMOVEL C'
      'WHERE'
      '    C.IDCONDPAGIMOVEL  = P.IDCONDPAGIMOVEL'
      'AND C.FORMACALCULO     = 12'
      'AND C.IDCONTRATOIMOVEL = :PIDCONTRATO'
      'ORDER BY'
      '    P.IDCONDPAGIMOVEL,'
      '    P.DATAVENCIMENTO,'
      '    P.FLGTIPOLANC'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 122
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATO'
        ParamType = ptInput
      end>
    object qryResiduoIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryResiduoFLGTIPOLANC: TFloatField
      FieldName = 'FLGTIPOLANC'
    end
    object qryResiduoVLRRESIDUO: TFloatField
      FieldName = 'VLRRESIDUO'
    end
    object qryResiduoDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryResiduoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
  end
  object pplSegregExtrato: TppDBPipeline
    DataSource = dsSegregExtrato
    SkipWhenNoRecords = False
    UserName = 'lSegregExtrato'
    Left = 265
    Top = 163
    MasterDataPipelineName = 'pplExtrato'
    object pplSegregExtratoppField1: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplSegregExtratoppField2: TppField
      FieldAlias = 'PLANOPREV'
      FieldName = 'PLANOPREV'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object pplSegregExtratoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTRATEIO'
      FieldName = 'PERCENTRATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplSegregExtratoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
  end
  object dsSegregExtrato: TwwDataSource
    DataSet = qrySegreg
    Left = 160
    Top = 176
  end
  object qrySegreg: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CTI.IDCONTRATOIMOVEL,'
      '       PES.NOME AS PATRO,'
      '       PPC.NOME AS PLANOPREV,'
      
        '       SUM((PPI.PERCENTRATEIO * 100) / PT.PERCENTRATEIO) AS PERC' +
        'ENTRATEIO,'
      '       0 AS VALOR'
      '  FROM PLANOPATROXVIGENCIAIMOB PPI,'
      '       CONTRATOXIMOVEL CXI,'
      '       PESSOA PES,'
      '       PLANPREVCONTABIL PPC,'
      '       CONTRATOIMOVEL CTI,'
      '       (SELECT SUM(PPI.PERCENTRATEIO) AS PERCENTRATEIO'
      '          FROM PLANOPATROXVIGENCIAIMOB PPI,'
      '               CONTRATOXIMOVEL   CXI,'
      '               CONTRATOIMOVEL    CTI'
      '         WHERE 1=2'
      '           AND CXI.IDCONTRATOIMOVEL = CTI.IDCONTRATOIMOVEL'
      '           AND PPI.IDIMOVEL = CXI.IDIMOVEL) PT'
      ' WHERE 1=2'
      
        '   AND PPI.DATAVIGENCIA = (SELECT MAX(PPV.DATAVIGENCIA) FROM PLA' +
        'NOPATROXVIGENCIAIMOB PPV'
      '                            WHERE 1=2  )'
      '   AND CXI.IDCONTRATOIMOVEL = CTI.IDCONTRATOIMOVEL'
      '   AND PPI.IDIMOVEL = CXI.IDIMOVEL'
      '   AND PPI.IDPATRO = PES.IDPESSOA'
      '   AND PPI.IDPLANOPREV = PPC.IDPLANOPREV'
      
        ' GROUP BY  CTI.IDCONTRATOIMOVEL, PES.NOME, PPC.NOME,PT.PERCENTRA' +
        'TEIO'
      ' ORDER BY PERCENTRATEIO DESC'
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updSegreg
    ValidateWithMask = True
    Left = 144
    Top = 184
    object qrySegregPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qrySegregPLANOPREV: TStringField
      FieldName = 'PLANOPREV'
      Size = 50
    end
    object qrySegregPERCENTRATEIO: TFloatField
      FieldName = 'PERCENTRATEIO'
    end
    object qrySegregVALOR: TFloatField
      FieldName = 'VALOR'
      currency = True
    end
  end
  object updSegreg: TUpdateSQL
    ModifySQL.Strings = (
      'update PLANOPATROXIMOVEL'
      'set'
      '  VALOR = :VALOR'
      'where'
      '  PATRO = :OLD_PATRO')
    InsertSQL.Strings = (
      'insert into PLANOPATROXIMOVEL'
      '  (VALOR)'
      'values'
      '  (:VALOR)')
    DeleteSQL.Strings = (
      'delete from PLANOPATROXIMOVEL'
      'where'
      '  PATRO = :OLD_PATRO')
    Left = 104
    Top = 168
  end
  object qryImovAliDET: TwwQuery
    CachedUpdates = True
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT '#39#39' AS NOMPLANPREV,'
      '       '#39#39' AS NOMEPATR, '
      '       0 AS IDPLANOPREV,'
      '       0 AS IDPATRO,'
      '       0 AS IDIMOVELMESTRE,'
      '       0 AS IDIMOVEL,  '
      '       0.00 AS PERCENTRATEIO,'
      '       0.00 AS TOTVLRVENDA,'
      '       0.00 AS TOTVLRCONTABIL,'
      '       0.00 AS TOTVLRRESULTADO'
      '  FROM DUAL '
      'WHERE 1 = 2 ')
    UniDirectional = True
    ValidateWithMask = True
    Left = 34
    Top = 386
  end
  object dsImovAliDET: TwwDataSource
    DataSet = cdsImovAliDET
    Left = 124
    Top = 386
  end
  object pplImovAliDET: TppBDEPipeline
    DataSource = dsImovAliDET
    UserName = 'lImovAliDET'
    Left = 218
    Top = 386
    object pplImovAliDETppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplImovAliDETppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplImovAliDETppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTRATEIO'
      FieldName = 'PERCENTRATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplImovAliDETppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplImovAliDETppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVELMESTRE'
      FieldName = 'IDIMOVELMESTRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplImovAliDETppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTVLRVENDA'
      FieldName = 'TOTVLRVENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplImovAliDETppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTVLRCONTABIL'
      FieldName = 'TOTVLRCONTABIL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplImovAliDETppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTVLRRESULTADO'
      FieldName = 'TOTVLRRESULTADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplImovAliDETppField9: TppField
      FieldAlias = 'NOMPLANPREV'
      FieldName = 'NOMPLANPREV'
      FieldLength = 40
      DisplayWidth = 40
      Position = 8
    end
    object pplImovAliDETppField10: TppField
      FieldAlias = 'NOMEPATR'
      FieldName = 'NOMEPATR'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
  end
  object pplImovAliTOT: TppBDEPipeline
    DataSource = dsImovAliTOT
    UserName = 'lImovAliTOT'
    Left = 218
    Top = 426
    object pplImovAliTOTppField1: TppField
      FieldAlias = 'NOMPLANPREV'
      FieldName = 'NOMPLANPREV'
      FieldLength = 40
      DisplayWidth = 40
      Position = 0
    end
    object pplImovAliTOTppField2: TppField
      FieldAlias = 'NOMEPATR'
      FieldName = 'NOMEPATR'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object pplImovAliTOTppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplImovAliTOTppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplImovAliTOTppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTRATEIO'
      FieldName = 'PERCENTRATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplImovAliTOTppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTVLRVENDA'
      FieldName = 'TOTVLRVENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplImovAliTOTppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTVLRCONTABIL'
      FieldName = 'TOTVLRCONTABIL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplImovAliTOTppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTVLRRESULTADO'
      FieldName = 'TOTVLRRESULTADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
  end
  object dsImovAliTOT: TwwDataSource
    DataSet = cdsImovAliTOT
    Left = 124
    Top = 426
  end
  object qryImovAliTOT: TwwQuery
    CachedUpdates = True
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT '#39#39' AS NOMPLANPREV,'
      '       '#39#39' AS NOMEPATR, '
      '       0 AS IDPLANOPREV,'
      '       0 AS IDPATRO,'
      '       0.00 AS PERCENTRATEIO,'
      '       0.00 AS TOTVLRVENDA,'
      '       0.00 AS TOTVLRCONTABIL,'
      '       0.00 AS TOTVLRRESULTADO'
      '  FROM DUAL '
      'WHERE 1 = 2')
    UniDirectional = True
    ValidateWithMask = True
    Left = 34
    Top = 426
  end
  object sqlSegImoveis: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '               PATRO.NOME AS PATROCINADORA, '
      '               PLANO.NOME AS PLANOPREV,'
      '               PPI.PPIPERCENTRATEIO, '
      '               0.00000 AS PERCENT,'
      '               0.00000 AS VALOR'
      '       FROM'
      
        '               PLANOPATROXIMOVEL PPI, PESSOA PATRO, PLANPREVCONT' +
        'ABIL PLANO, IMOVEL I'
      '       WHERE '
      '               PLANO.IDPLANOPREV          = PPI.IDPLANOPREV'
      '               AND PATRO.IDPESSOA         = PPI.IDPATRO'
      '               AND PPI.IDIMOVEL           = I.IDIMOVEL'
      '               AND I.IDIMOVEL             = -1'
      '       ORDER BY PATROCINADORA, PLANOPREV'
      ' '
      ' ')
    ClientDataSet = cdsSegImoveisTot
    Left = 320
    Top = 8
  end
  object cdsSegImoveisTot: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 24
    Data = {
      B80000009619E0BD010000001800000005000000000003000000B8000D504154
      524F43494E41444F52410100490000000100055749445448020002003C000950
      4C414E4F50524556010049000000010005574944544802000200320010505049
      50455243454E5452415445494F08000400000000000750455243454E54080004
      00000000000556414C4F52080004000000000002000D44454641554C545F4F52
      444552020082000200000001000200044C4349440400010009080000}
    object cdsSegImoveisTotPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      Size = 60
    end
    object cdsSegImoveisTotPLANOPREV: TStringField
      FieldName = 'PLANOPREV'
      Size = 50
    end
    object cdsSegImoveisTotPPIPERCENTRATEIO: TFloatField
      FieldName = 'PPIPERCENTRATEIO'
    end
    object cdsSegImoveisTotVALOR: TFloatField
      FieldName = 'VALOR'
      currency = True
    end
    object cdsSegImoveisTotPERCENT: TFloatField
      FieldName = 'PERCENT'
    end
  end
  object dsSegImoveisTot: TDataSource
    DataSet = cdsSegImoveisTot
    Left = 320
    Top = 40
  end
  object pplSegImoveisTot: TppBDEPipeline
    DataSource = dsSegImoveisTot
    UserName = 'lListagemImovel2'
    Left = 320
    Top = 56
    object pplSegImoveisTotppField1: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplSegImoveisTotppField2: TppField
      FieldAlias = 'PLANOPREV'
      FieldName = 'PLANOPREV'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object pplSegImoveisTotppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PPIPERCENTRATEIO'
      FieldName = 'PPIPERCENTRATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplSegImoveisTotppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplSegImoveisTotppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENT'
      FieldName = 'PERCENT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
  end
  object sqlSegImoveisCond: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '               PATRO.NOME AS PATROCINADORA, '
      '               PLANO.NOME AS PLANOPREV,'
      '               PPI.PPIPERCENTRATEIO,'
      '               0.00  AS PERCENT, '
      '               0.00000 AS VALOR'
      '       FROM'
      
        '               PLANOPATROXIMOVEL PPI, PESSOA PATRO, PLANPREVCONT' +
        'ABIL PLANO, IMOVEL I'
      '       WHERE '
      '               PLANO.IDPLANOPREV          = PPI.IDPLANOPREV'
      '               AND PATRO.IDPESSOA         = PPI.IDPATRO'
      '               AND PPI.IDIMOVEL           = I.IDIMOVEL'
      '               AND I.IDIMOVEL             = -1'
      '       ORDER BY PATROCINADORA, PLANOPREV'
      ' '
      ' ')
    ClientDataSet = cdsSegImoveisCond
    Left = 208
    Top = 8
  end
  object cdsSegImoveisCond: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 24
    Data = {
      B80000009619E0BD010000001800000005000000000003000000B8000D504154
      524F43494E41444F52410100490000000100055749445448020002003C000950
      4C414E4F50524556010049000000010005574944544802000200320010505049
      50455243454E5452415445494F08000400000000000750455243454E54080004
      00000000000556414C4F52080004000000000002000D44454641554C545F4F52
      444552020082000200000001000200044C4349440400010009080000}
    object cdsSegImoveisCondPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      Size = 60
    end
    object cdsSegImoveisCondPLANOPREV: TStringField
      FieldName = 'PLANOPREV'
      Size = 50
    end
    object cdsSegImoveisCondPPIPERCENTRATEIO: TFloatField
      FieldName = 'PPIPERCENTRATEIO'
    end
    object cdsSegImoveisCondVALOR: TFloatField
      FieldName = 'VALOR'
      currency = True
    end
    object cdsSegImoveisCondPERCENT: TFloatField
      FieldName = 'PERCENT'
    end
  end
  object dsSegImoveisCond: TDataSource
    DataSet = cdsSegImoveisCond
    Left = 208
    Top = 40
  end
  object pplSegImoveisCond: TppBDEPipeline
    DataSource = dsSegImoveisCond
    UserName = 'lSegImoveisCond'
    Left = 208
    Top = 56
    object pplSegImoveisCondppField1: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplSegImoveisCondppField2: TppField
      FieldAlias = 'PLANOPREV'
      FieldName = 'PLANOPREV'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object pplSegImoveisCondppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PPIPERCENTRATEIO'
      FieldName = 'PPIPERCENTRATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplSegImoveisCondppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplSegImoveisCondppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENT'
      FieldName = 'PERCENT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
  end
  object qryContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     PF.IDPARCFINANCIMOV,'
      '     PF.IDCONDPAGIMOVEL,'
      '     PF.IDCONTRATOIMOVEL,'
      '     PF.IDCONDINICIAL,'
      ''
      '     CI.CONNUMERO,'
      '     CI.CONNOME,'
      '     CI.VLRPROPOSTA,'
      '     CI.CONDATAASSINATURA,'
      ''
      '     P.RAZAOSOCIAL,'
      '     IM.NOMEMESTRE,'
      ''
      '     PF.CODDOCUMENTO,'
      '     PF.PLNCODIGO,'
      '     PF.NUMPARCELA,'
      '     PF.DATAVENCIMENTO,'
      '     PF.VLRPRESTACAO,'
      '     PF.VLRNOMINAL,'
      '     PF.VLRJUROS,'
      '     PF.VLRJUROSPARC,'
      '     PF.VLRAMORTIZACAO,'
      '     PF.VLRSALDODEVEDOR,'
      '     PF.VLRSALDOATUAL,'
      '     PF.VLRPRESTATUALIZADA,'
      
        '     NVL(PF.VLRRESIDUO,0) + NVL(PF.VLRCORRSALDO,0) AS VLRRESIDUO' +
        ','
      '     PF.VLRRESIDUOATUALI,'
      '     PF.VLRCORRIGIDOATRASO,'
      '     PF.VLRMULTAATRASO,'
      '     PF.VLRMORAATRASO,'
      '     PF.FLGTIPOLANC,'
      '     MPF.MOESIGLA  AS DSCINDPARC,'
      '     CM.COTVALOR,'
      '     PF.FATORCORRECAO'
      ''
      'FROM'
      '     ('
      
        '      SELECT CP.IDCONTRATOIMOVEL, CP.IDCONDPAGIMOVEL,  CP.TIPOCO' +
        'NDPAG,'
      
        '             CP.IDCONDINICIAL,    CP.MESREFREAJUSTE,   PF.IDINDC' +
        'ORRECAO,      PF.VLRCORRSALDO,'
      
        '             PF.IDPARCFINANCIMOV, PF.CODDOCUMENTO,     PF.PLNCOD' +
        'IGO,          PF.VLRJUROSPARC,'
      
        '             PF.NUMPARCELA,       PF.DATAVENCIMENTO,   PF.VLRPRE' +
        'STACAO,       PF.VLRJUROS,'
      
        '             PF.VLRAMORTIZACAO,   PF.VLRSALDODEVEDOR,  PF.VLRPRE' +
        'STATUALIZADA, PF.VLRSALDOATUAL,'
      
        '             PF.VLRRESIDUO,       PF.VLRRESIDUOATUALI, PF.VLRCOR' +
        'RIGIDOATRASO, PF.FATORCORRECAO,'
      
        '             PF.VLRMULTAATRASO,   PF.VLRMORAATRASO,    PF.FLGTIP' +
        'OLANC,        PF.VLRNOMINAL'
      '        FROM CONDPAGIMOVEL CP, PARCFINANCIMOV PF'
      '       WHERE'
      
        '         1=2 AND PF.DATAVENCIMENTO BETWEEN CP.DATAINI AND CP.DAT' +
        'AFIM'
      '         AND CP.IDCONDINICIAL = PF.IDCONDPAGIMOVEL'
      
        '         AND ( (:pIDCONTRATOIMOVEL IS NULL) OR (CP.IDCONTRATOIMO' +
        'VEL = :pIDCONTRATOIMOVEL) )'
      ''
      '      ) PF,'
      ''
      '     CONTRATOIMOVEL CI,'
      '     MOEDA MPF,'
      '     COTACAOMOEDA CM,'
      '     PESSOA P,'
      ''
      '     ( SELECT DISTINCT'
      '              CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL,'
      '              M.IMONOME  AS NOMEMESTRE,'
      '              M.IDIMOVEL AS IDIMOVEL'
      '       FROM'
      '              CONTRATOXIMOVEL CXI,'
      '              IMOVEL I,'
      '              IMOVEL M'
      '       WHERE'
      '              CXI.IDIMOVEL = I.IDIMOVEL AND'
      '              I.IDIMOVELMESTRE = M.IDIMOVEL ) IM'
      ''
      'WHERE'
      '     1=2 AND (PF.FLGTIPOLANC IN (1,2,3,4,7,8,9,10,11,12))'
      '     AND (PF.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      '     AND (MPF.MOECODIGO(+) = PF.IDINDCORRECAO)'
      '     AND (CM.MOECODIGO(+) = PF.IDINDCORRECAO)'
      
        '     AND (CM.COTMESREF(+) = TO_CHAR(ADD_MONTHS(PF.DATAVENCIMENTO' +
        ',PF.MESREFREAJUSTE*(-1)),'#39'MMYYYY'#39') )'
      '     AND (P.IDPESSOA(+) = CI.IDLOCATARIO)'
      '     AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL)'
      
        '     AND ( (:pIDCONTRATOIMOVEL IS NULL) OR (CI.IDCONTRATOIMOVEL ' +
        '= :pIDCONTRATOIMOVEL) )'
      
        '     AND ( (:pIDCOMPRADOR IS NULL) OR (CI.IDLOCATARIO = :pIDCOMP' +
        'RADOR) )'
      
        '     AND ( (:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSAVEL = :pID' +
        'RESPONSAVEL) )'
      '     AND ( (:pIDIMOVEL IS NULL) OR (IM.IDIMOVEL = :pIDIMOVEL) )'
      ''
      'ORDER BY CONNUMERO, IDCONDPAGIMOVEL, DATAVENCIMENTO, FLGTIPOLANC'
      ''
      ''
      ''
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
      ' ')
    ValidateWithMask = True
    Left = 26
    Top = 100
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCOMPRADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCOMPRADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDIMOVEL'
        ParamType = ptUnknown
      end>
    object qryContratoIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
    end
    object qryContratoIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryContratoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryContratoIDCONDINICIAL: TFloatField
      FieldName = 'IDCONDINICIAL'
    end
    object qryContratoCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryContratoCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 100
    end
    object qryContratoVLRPROPOSTA: TFloatField
      FieldName = 'VLRPROPOSTA'
    end
    object qryContratoCONDATAASSINATURA: TDateTimeField
      FieldName = 'CONDATAASSINATURA'
    end
    object qryContratoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryContratoNOMEMESTRE: TStringField
      FieldName = 'NOMEMESTRE'
      Size = 100
    end
    object qryContratoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryContratoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryContratoNUMPARCELA: TFloatField
      FieldName = 'NUMPARCELA'
    end
    object qryContratoDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryContratoVLRPRESTACAO: TFloatField
      FieldName = 'VLRPRESTACAO'
    end
    object qryContratoVLRNOMINAL: TFloatField
      FieldName = 'VLRNOMINAL'
    end
    object qryContratoVLRJUROS: TFloatField
      FieldName = 'VLRJUROS'
    end
    object qryContratoVLRJUROSPARC: TFloatField
      FieldName = 'VLRJUROSPARC'
    end
    object qryContratoVLRAMORTIZACAO: TFloatField
      FieldName = 'VLRAMORTIZACAO'
    end
    object qryContratoVLRSALDODEVEDOR: TFloatField
      FieldName = 'VLRSALDODEVEDOR'
    end
    object qryContratoVLRSALDOATUAL: TFloatField
      FieldName = 'VLRSALDOATUAL'
    end
    object qryContratoVLRPRESTATUALIZADA: TFloatField
      FieldName = 'VLRPRESTATUALIZADA'
    end
    object qryContratoVLRRESIDUO: TFloatField
      FieldName = 'VLRRESIDUO'
    end
    object qryContratoVLRRESIDUOATUALI: TFloatField
      FieldName = 'VLRRESIDUOATUALI'
    end
    object qryContratoVLRCORRIGIDOATRASO: TFloatField
      FieldName = 'VLRCORRIGIDOATRASO'
    end
    object qryContratoVLRMULTAATRASO: TFloatField
      FieldName = 'VLRMULTAATRASO'
    end
    object qryContratoVLRMORAATRASO: TFloatField
      FieldName = 'VLRMORAATRASO'
    end
    object qryContratoFLGTIPOLANC: TFloatField
      FieldName = 'FLGTIPOLANC'
    end
    object qryContratoDSCINDPARC: TStringField
      FieldName = 'DSCINDPARC'
      Size = 10
    end
    object qryContratoCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
    end
    object qryContratoFATORCORRECAO: TFloatField
      FieldName = 'FATORCORRECAO'
    end
  end
  object dsContrato: TwwDataSource
    DataSet = qryContrato
    Left = 84
    Top = 99
  end
  object pplContato: TppBDEPipeline
    DataSource = dsContrato
    UserName = 'lContrato'
    Left = 146
    Top = 99
    object pplContatoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPARCFINANCIMOV'
      FieldName = 'IDPARCFINANCIMOV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplContatoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONDPAGIMOVEL'
      FieldName = 'IDCONDPAGIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplContatoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplContatoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONDINICIAL'
      FieldName = 'IDCONDINICIAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplContatoppField5: TppField
      FieldAlias = 'CONNUMERO'
      FieldName = 'CONNUMERO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object pplContatoppField6: TppField
      FieldAlias = 'CONNOME'
      FieldName = 'CONNOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object pplContatoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPROPOSTA'
      FieldName = 'VLRPROPOSTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplContatoppField8: TppField
      FieldAlias = 'CONDATAASSINATURA'
      FieldName = 'CONDATAASSINATURA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object pplContatoppField9: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object pplContatoppField10: TppField
      FieldAlias = 'NOMEMESTRE'
      FieldName = 'NOMEMESTRE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 9
    end
    object pplContatoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplContatoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplContatoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMPARCELA'
      FieldName = 'NUMPARCELA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplContatoppField14: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 13
    end
    object pplContatoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPRESTACAO'
      FieldName = 'VLRPRESTACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplContatoppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRNOMINAL'
      FieldName = 'VLRNOMINAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplContatoppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRJUROS'
      FieldName = 'VLRJUROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplContatoppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRJUROSPARC'
      FieldName = 'VLRJUROSPARC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplContatoppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRAMORTIZACAO'
      FieldName = 'VLRAMORTIZACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplContatoppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRSALDODEVEDOR'
      FieldName = 'VLRSALDODEVEDOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplContatoppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRSALDOATUAL'
      FieldName = 'VLRSALDOATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplContatoppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPRESTATUALIZADA'
      FieldName = 'VLRPRESTATUALIZADA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplContatoppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRESIDUO'
      FieldName = 'VLRRESIDUO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplContatoppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRESIDUOATUALI'
      FieldName = 'VLRRESIDUOATUALI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplContatoppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCORRIGIDOATRASO'
      FieldName = 'VLRCORRIGIDOATRASO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplContatoppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMULTAATRASO'
      FieldName = 'VLRMULTAATRASO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplContatoppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMORAATRASO'
      FieldName = 'VLRMORAATRASO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplContatoppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGTIPOLANC'
      FieldName = 'FLGTIPOLANC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object pplContatoppField29: TppField
      FieldAlias = 'DSCINDPARC'
      FieldName = 'DSCINDPARC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 28
    end
    object pplContatoppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'COTVALOR'
      FieldName = 'COTVALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object pplContatoppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'FATORCORRECAO'
      FieldName = 'FATORCORRECAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
  end
  object qryCondPag: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsContrato
    SQL.Strings = (
      'SELECT'
      '      CP.IDCONDINICIAL,'
      '      CP.VLRFINANC,'
      '      CP.TAXAJUROS,'
      '      CP.PERIODOTAXA,'
      '      CP.FORMACALCULO,'
      '      CP.NUMPARCELAS,'
      '      CP.DATAVENCIMENTO,'
      '      CP.DATAINI,'
      '      CP.PERINDPROJ,'
      '      MC.MOESIGLA   AS DSCINDCORR,'
      '      MP.MOESIGLA   AS DSCINDPROJ,'
      
        '      DECODE(CP.PERIODOTAXA,'#39'M'#39',TO_CHAR(CP.TAXAJUROS,'#39'999.9999'#39')' +
        ' || '#39'% ao Mês'#39','
      
        '                                TO_CHAR(CP.TAXAJUROS,'#39'999.9999'#39')' +
        ' || '#39'% ao Ano'#39') AS DSCJUROS,'
      '      DECODE(CP.TIPOCONDPAG,'#39'S'#39','#39'Sinal'#39','
      '                            '#39'P'#39','#39'Parcelamento'#39','
      '                            '#39'V'#39','#39'Venda a Vista'#39','
      '                            '#39'C'#39','#39'Caução'#39','
      
        '                            '#39'R'#39','#39'Repactuação'#39','#39'Cond.Inicial'#39') AS' +
        ' DSCTIPO'
      ''
      'FROM  CONDPAGIMOVEL CP,'
      '      MOEDA MC,'
      '      MOEDA MP'
      ''
      'WHERE'
      ' (MC.MOECODIGO(+) = CP.INDCORRECAO)'
      '  AND (MP.MOECODIGO(+) = CP.IDINDCORRPROJ)'
      '  AND (IDCONDINICIAL   = :IDCONDINICIAL)'
      ''
      ''
      'ORDER BY  CP.TIPOCONDPAG, CP.DATAINI'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 26
    Top = 111
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONDINICIAL'
        ParamType = ptUnknown
      end>
    object qryCondPagIDCONDINICIAL: TFloatField
      FieldName = 'IDCONDINICIAL'
    end
    object qryCondPagVLRFINANC: TFloatField
      FieldName = 'VLRFINANC'
    end
    object qryCondPagTAXAJUROS: TFloatField
      FieldName = 'TAXAJUROS'
    end
    object qryCondPagPERIODOTAXA: TStringField
      FieldName = 'PERIODOTAXA'
      FixedChar = True
      Size = 1
    end
    object qryCondPagFORMACALCULO: TFloatField
      FieldName = 'FORMACALCULO'
    end
    object qryCondPagNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryCondPagDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryCondPagDATAINI: TDateTimeField
      FieldName = 'DATAINI'
    end
    object qryCondPagPERINDPROJ: TFloatField
      FieldName = 'PERINDPROJ'
    end
    object qryCondPagDSCINDCORR: TStringField
      FieldName = 'DSCINDCORR'
      Size = 10
    end
    object qryCondPagDSCINDPROJ: TStringField
      FieldName = 'DSCINDPROJ'
      Size = 10
    end
    object qryCondPagDSCJUROS: TStringField
      FieldName = 'DSCJUROS'
      Size = 17
    end
    object qryCondPagDSCTIPO: TStringField
      FieldName = 'DSCTIPO'
      Size = 13
    end
  end
  object dsCondPag: TwwDataSource
    DataSet = qryCondPag
    Left = 84
    Top = 111
  end
  object pplCondPag: TppBDEPipeline
    DataSource = dsCondPag
    SkipWhenNoRecords = False
    UserName = 'lCondPag'
    Left = 146
    Top = 112
    object pplCondPagppField1: TppField
      FieldAlias = 'IDCONDINICIAL'
      FieldName = 'IDCONDINICIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplCondPagppField2: TppField
      FieldAlias = 'VLRFINANC'
      FieldName = 'VLRFINANC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplCondPagppField3: TppField
      FieldAlias = 'TAXAJUROS'
      FieldName = 'TAXAJUROS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplCondPagppField4: TppField
      FieldAlias = 'PERIODOTAXA'
      FieldName = 'PERIODOTAXA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplCondPagppField5: TppField
      FieldAlias = 'FORMACALCULO'
      FieldName = 'FORMACALCULO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplCondPagppField6: TppField
      FieldAlias = 'NUMPARCELAS'
      FieldName = 'NUMPARCELAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplCondPagppField7: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplCondPagppField8: TppField
      FieldAlias = 'DATAINI'
      FieldName = 'DATAINI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplCondPagppField9: TppField
      FieldAlias = 'PERINDPROJ'
      FieldName = 'PERINDPROJ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplCondPagppField10: TppField
      FieldAlias = 'DSCINDCORR'
      FieldName = 'DSCINDCORR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplCondPagppField11: TppField
      FieldAlias = 'DSCINDPROJ'
      FieldName = 'DSCINDPROJ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplCondPagppField12: TppField
      FieldAlias = 'DSCJUROS'
      FieldName = 'DSCJUROS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplCondPagppField13: TppField
      FieldAlias = 'DSCTIPO'
      FieldName = 'DSCTIPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object TppMasterFieldLink
      MasterFieldName = 'IDCONDINICIAL'
      DetailFieldName = 'IDCONDINICIAL'
      DetailSortOrder = soAscending
    end
  end
  object cdsImovAliDET: TCMClientDataSet
    Active = True
    Aggregates = <>
    Filtered = True
    Params = <>
    Left = 312
    Top = 392
    Data = {
      390100009619E0BD01000000180000000A00000000000300000039010B4E4F4D
      504C414E5052455601004900000002000753554254595045020049000A004669
      7865644368617200055749445448020002004400084E4F4D4550415452010049
      00000002000753554254595045020049000A0046697865644368617200055749
      445448020002003B000B4944504C414E4F505245560800040000000000074944
      504154524F08000400000000000D50455243454E5452415445494F0800040000
      000000084944494D4F56454C08000400000000000E4944494D4F56454C4D4553
      54524508000400000000000B544F54564C5256454E444108000400000000000E
      544F54564C52434F4E544142494C08000400000000000F544F54564C52524553
      554C5441444F08000400000000000100044C4349440400010009080000}
    object cdsImovAliDETIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object cdsImovAliDETIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object cdsImovAliDETPERCENTRATEIO: TFloatField
      FieldName = 'PERCENTRATEIO'
    end
    object cdsImovAliDETIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsImovAliDETIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object cdsImovAliDETTOTVLRVENDA: TFloatField
      FieldName = 'TOTVLRVENDA'
    end
    object cdsImovAliDETTOTVLRCONTABIL: TFloatField
      FieldName = 'TOTVLRCONTABIL'
    end
    object cdsImovAliDETTOTVLRRESULTADO: TFloatField
      FieldName = 'TOTVLRRESULTADO'
    end
    object cdsImovAliDETNOMPLANPREV: TStringField
      DisplayWidth = 40
      FieldName = 'NOMPLANPREV'
      FixedChar = True
      Size = 40
    end
    object cdsImovAliDETNOMEPATR: TStringField
      DisplayWidth = 20
      FieldName = 'NOMEPATR'
      FixedChar = True
    end
  end
  object cdsImovAliTOT: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 314
    Top = 430
    Data = {
      110100009619E0BD01000000180000000800000000000300000011010B4E4F4D
      504C414E5052455601004900000002000753554254595045020049000A004669
      7865644368617200055749445448020002004400084E4F4D4550415452010049
      00000002000753554254595045020049000A0046697865644368617200055749
      445448020002003B000B4944504C414E4F505245560800040000000000074944
      504154524F08000400000000000D50455243454E5452415445494F0800040000
      0000000B544F54564C5256454E444108000400000000000E544F54564C52434F
      4E544142494C08000400000000000F544F54564C52524553554C5441444F0800
      0400000000000100044C4349440400010009080000}
    object cdsImovAliTOTNOMPLANPREV: TStringField
      DisplayWidth = 40
      FieldName = 'NOMPLANPREV'
      FixedChar = True
      Size = 40
    end
    object cdsImovAliTOTNOMEPATR: TStringField
      DisplayWidth = 20
      FieldName = 'NOMEPATR'
      FixedChar = True
    end
    object cdsImovAliTOTIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object cdsImovAliTOTIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object cdsImovAliTOTPERCENTRATEIO: TFloatField
      FieldName = 'PERCENTRATEIO'
    end
    object cdsImovAliTOTTOTVLRVENDA: TFloatField
      FieldName = 'TOTVLRVENDA'
    end
    object cdsImovAliTOTTOTVLRCONTABIL: TFloatField
      FieldName = 'TOTVLRCONTABIL'
    end
    object cdsImovAliTOTTOTVLRRESULTADO: TFloatField
      FieldName = 'TOTVLRRESULTADO'
    end
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      
        'SELECT  '#39'                                                       ' +
        '             '#39' AS NOMPLANPREV,'
      
        '       '#39'                                                        ' +
        '   '#39' AS NOMEPATR, '
      '       0 AS IDPLANOPREV,'
      '       0 AS IDPATRO,'
      '       0.00 AS PERCENTRATEIO,'
      '       0 AS IDIMOVEL,'
      '       0 AS IDIMOVELMESTRE,'
      '       0.00 AS TOTVLRVENDA,'
      '       0.00 AS TOTVLRCONTABIL,'
      '       0.00 AS TOTVLRRESULTADO'
      '  FROM DUAL '
      'WHERE 1 = 2 ')
    ClientDataSet = cdsImovAliDET
    Left = 360
    Top = 224
  end
  object qryInadimplContrAnalitico: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select * from reports where idmodulo = 135 and idreports in (204' +
        '58,3180);'
      ''
      'SELECT PF.IDPARCFINANCIMOV, '
      '       PF.IDCONDPAGIMOVEL,  '
      '       CP.IDCONTRATOIMOVEL, '
      '       CI.CONNUMERO, CI.CONNUMERO AS NUMERO_CONTRATO,       '
      '       CI.CONNOME,          '
      '       T.DESCTIPOIMOVEL ,   '
      '       PF.CODDOCUMENTO,     '
      '       PA.NOME AS NOMEADMIN,'
      '       (CI.CONNUMERO || '#39' - '#39' || CI.CONNOME) AS NOMECONTRATO,'
      '       P.NOME,P.RAZAOSOCIAL,CI.CONDATAASSINATURA,       '
      
        '       DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || '#39'/'#39 +
        ' || TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA, '
      
        '       DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENT' +
        'O) AS DATAVENCIMENTO,  '
      
        '       DECODE(PF.FLGTIPOLANC,9,PF.VLRAMORTIZACAO,PF.VLRPRESTACAO' +
        ') + NVL(ALT.TOT_ALTERADOR,0) AS VLRPRESTACAO,    '
      '       PF.FLGTIPOLANC,'
      '       PF.FLGLANCINTEGRA,'
      
        '       PP.DATAPAGAMENTO,TO_CHAR(PF.DATAVENCIMENTO,'#39'mm/yyyy'#39') AS ' +
        'COMP,      '
      '       ROUND(NVL(PP.VLRPAGO,0),2) AS VLRPAGO, '
      '       PF.DATAPAGAMENTO - PF.DATALIMITE AS DIASDIF, '
      
        '       ROUND( ( ( NVL(PF.VLRPRESTACAO,0) + NVL( CMA.VLRCORRIGIDO' +
        'ATRASO, 0 ) + NVL( MA.VLRMULTAATRASO, 0 ) + NVL( JA.VLRMORAATRAS' +
        'O, 0 ) ) - NVL( PP.VLRPAGO, 0 ) + NVL(ALT.TOT_ALTERADOR,0) ), 2 ' +
        ')  AS VLRDIF, '
      '       CMA.VLRCORRIGIDOATRASO AS VLRCMATRASO,  '
      '       MA.VLRMULTAATRASO AS VLRMULTAATRASO,  '
      '       JA.VLRMORAATRASO AS VLRMORAATRASO,  '
      '       CMS.VLRCORRIGIDOSALDO AS VLRCMCORRIG,  '
      '       MS.VLRMULTASALDO   AS VLRMULTACORRIG,  '
      '       JS.VLRMORASALDO AS VLRJUROSCORRIG,  '
      
        '       ROUND(NVL(PF.VLRPRESTACAO,0) + NVL( CMA.VLRCORRIGIDOATRAS' +
        'O, 0 ) + NVL( MA.VLRMULTAATRASO, 0 ) + NVL( JA.VLRMORAATRASO, 0 ' +
        ')  - NVL( PP.VLRPAGO, 0 ) +'
      
        '       NVL(CMS.VLRCORRIGIDOSALDO,0) + NVL(MS.VLRMULTASALDO,0) + ' +
        'NVL(JS.VLRMORASALDO,0) - NVL(ABONO.TOT_ABONO,0) + NVL(ALT.TOT_AL' +
        'TERADOR,0) ,2)  AS VLRDEVIDO,  '
      '       TO_CHAR(TT.DATALANCTO,'#39'mm/yyyy'#39') AS COMPETENCIA'
      '  FROM PARCFINANCIMOV PF, '
      '       CONDPAGIMOVEL  CP, '
      '       CONTRATOIMOVEL CI, '
      '       PESSOA P,          '
      '       PESSOA PA,         '
      '       TIPOIMOVEL T,      '
      
        '        (SELECT C.IDPARCFINANCIMOV,                             ' +
        '       '
      
        '                DECODE(C.FLGTIPO, NULL, NULL,                   ' +
        '       '
      '                       '#39'R'#39', '#39'S'#39', '#39'T'#39', '#39'S'#39', '#39'M'#39',              '
      '                       '#39'P'#39','#39'J'#39','#39'P'#39','#39'C'#39','#39'P'#39',                  '
      
        '                       '#39'A'#39', '#39'C'#39', P.FLGCONCILIADO ) AS CONCILIADO' +
        'C, '
      
        '                MAX(C.DATA) AS DATA,                            ' +
        '       '
      
        '                MAX(C.FLGTIPO) AS FLGTIPO,                      ' +
        '       '
      
        '                COUNT(*) AS QTDE                                ' +
        '       '
      
        '           FROM CONCILIADOC C, PARCFINANCIMOV P                 ' +
        '       '
      
        '          WHERE C.IDPARCFINANCIMOV = P.IDPARCFINANCIMOV         ' +
        '       '
      '            AND C.FLGTIPO IN('#39'R'#39','#39'T'#39', '#39'A'#39','#39'M'#39','#39'J'#39','#39'C'#39')     '
      
        '            AND C.DATA >= &pDTINI                               ' +
        '       '
      
        '            AND C.DATA <= &pDTFIM                               ' +
        '       '
      
        '            AND ( C.FLGTIPO IN ('#39'T'#39','#39'R'#39') OR                     ' +
        '   '
      
        '                  NOT EXISTS ( SELECT 1                         ' +
        '       '
      
        '                                 FROM CONCILIADOC               ' +
        '       '
      
        '                                WHERE FLGTIPO IN ('#39'T'#39','#39'R'#39')      ' +
        '   '
      
        '                                  AND IDPARCFINANCIMOV = C.IDPAR' +
        'CFINANCIMOV ))'
      
        '         GROUP BY C.IDPARCFINANCIMOV,                           ' +
        '       '
      
        '                  DECODE(C.FLGTIPO, NULL, NULL,                 ' +
        '       '
      '                  '#39'R'#39', '#39'S'#39', '#39'T'#39', '#39'S'#39', '#39'M'#39','#39'P'#39','#39'J'#39',       '
      
        '                  '#39'P'#39','#39'C'#39','#39'P'#39',                                  ' +
        ' '
      
        '                  '#39'A'#39', '#39'C'#39', P.FLGCONCILIADO )) CD2,             ' +
        '   '
      '       ( SELECT /*+ INDEX(D) INDEX(LD)*/            '
      '                LD.CODDOCUMENTO, T.CODTIPIMOVEL,    '
      
        '                SUM( DECODE(LD.DEBCRE,'#39'D'#39', LD.VALOR, (LD.VALOR *' +
        ' -1)) ) AS TOT_ALTERADOR '
      
        '           FROM LANCTODOCUM LD, DOCUMENTO D, PARAMALIENACAO PA, ' +
        '         '
      
        '                PARCFINANCIMOV P, CONDPAGIMOVEL C,  TIPOIMOVEL T' +
        ',        '
      
        '                ( SELECT DISTINCT C.IDCONTRATOIMOVEL, I.CODTIPIM' +
        'OVEL     '
      
        '                    FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI, ' +
        'IMOVEL I '
      
        '                   WHERE CXI.IDIMOVEL = I.IDIMOVEL              ' +
        '         '
      
        '                     AND CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOV' +
        'EL       '
      
        '                     AND C.FLGTIPOCONTRATO IN ('#39'C'#39','#39'A'#39') ) TC    ' +
        '              '
      '          WHERE RTRIM(LD.OPERACAO) = '#39'4'#39'                  '
      '            AND LD.CODALTERADOR <> PA.CODALTERADORCPMF      '
      '         AND (LD.CODALTERADOR <> PA.CODALTERADORADRES OR '
      
        '              LD.CODALTERADOR = PA.CODALTERADORADRES AND EXISTS ' +
        '(SELECT 1 '
      
        '                                                                ' +
        ' FROM CONCILIADOC '
      
        '                                                                ' +
        ' WHERE IDDOCUMENTO = LD.CODDOCUMENTO '
      
        '                                                                ' +
        ' AND   NUMLANCTO   = LD.NUMLANCTO '
      
        '                                                                ' +
        ' AND   DATA        >=  TO_DATE(&pDTINI,'#39'DD/MM/YYYY'#39')   '
      
        '                                                                ' +
        ' AND   DATA        <=  TO_DATE(&pDTFIM,'#39'DD/MM/YYYY'#39'))) '
      '            AND PA.IDPESSOA = 1'
      '            AND LD.CODDOCUMENTO = D.CODDOCUMENTO            '
      '            AND D.CODDOCUMENTO = P.CODDOCUMENTO             '
      '            AND P.IDCONDPAGIMOVEL = C.IDCONDPAGIMOVEL       '
      '            AND C.IDCONTRATOIMOVEL = TC.IDCONTRATOIMOVEL    '
      '            AND TC.CODTIPIMOVEL = T.CODTIPIMOVEL            '
      '            AND LD.DATALANCTO >= &pDTINI                    '
      '            AND LD.DATALANCTO <= &pDTFIM                    '
      '            AND ( PA.IDOPERATUALCM IS NULL OR               '
      '                  ( LD.CODALTERADOR <> T.CODALTCMAL AND     '
      '                    LD.CODALTERADOR <> T.CODALTJRAL AND     '
      '                    LD.CODALTERADOR <> T.CODALTMTAL ) )     '
      '            AND D.IDMODULO = 135                            '
      '          GROUP BY LD.CODDOCUMENTO, T.CODTIPIMOVEL  )  ALT, '
      '       ( '
      '         SELECT /*+ INDEX(LD) INDEX(RP)*/   '
      '                IDPARCFINANCIMOV, '
      
        '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.DATAPAGAMENTO' +
        '), MAX(RP.DATABAIXA) ) AS DATAPAGAMENTO, '
      
        '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), SUM' +
        '(LD.VALOR) ) AS VLRPAGO  '
      
        '           FROM PARCFINANCIMOV P, LANCTODOCUM LD, RECBTOPAGTO RP' +
        ' '
      '          WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+) '
      '            AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) '
      '            AND LD.NUMLANCTO    = RP.NUMLANCTO(+)'
      
        '            AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO >' +
        '= &pDTINI AND DATAPAGAMENTO <= &pDTFIM ) OR '
      
        '                 (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPER' +
        'ACAO) = '#39'5'#39' OR LD.CODALTERADOR = 215 ) '
      
        '                                             AND LD.ESTORNO IS N' +
        'ULL            '
      
        '                                             AND LD.DATALANCTO >' +
        '= &pDTINI      '
      
        '                                             AND LD.DATALANCTO <' +
        '= &pDTFIM ) )  '
      '          GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO  '
      '       ) PP, '
      '     ( '
      '         SELECT P.IDPARCFINANCIMOV, LD.DATALANCTO'
      '           FROM PARCFINANCIMOV P, LANCTODOCUM LD'
      '          WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+)     '
      
        '            AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO >' +
        '= &pDTINI AND DATAPAGAMENTO <= &pDTFIM ) OR '
      
        '                 (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPER' +
        'ACAO) = '#39'2'#39' OR LD.CODALTERADOR = 215 ) '
      
        '                                             AND LD.ESTORNO IS N' +
        'ULL            '
      
        '                                             AND LD.DATALANCTO >' +
        '= &pDTINI      '
      
        '                                             AND LD.DATALANCTO <' +
        '= &pDTFIM ) )  '
      '          GROUP BY IDPARCFINANCIMOV,LD.DATALANCTO '
      '       ) TT,'
      '       ( SELECT A.IDCONDINICIAL  AS IDCONDINICIAL, '
      '                A.NUMPARCELAS    AS NUMPARCELAS,   '
      '                A.DATAINI,                         '
      '                A.IDCONDPAGIMOVEL                  '
      '           FROM CONDPAGIMOVEL A,                   '
      '                (SELECT IDCONDINICIAL,             '
      '                        MAX(DATAINI) AS DATAINI    '
      '                   FROM CONDPAGIMOVEL              '
      '                  GROUP BY IDCONDINICIAL) B        '
      '          WHERE B.IDCONDINICIAL = A.IDCONDINICIAL  '
      '            AND B.DATAINI       = A.DATAINI ) CPFINAL,    '
      '       ( '
      
        '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRCORRIGIDOA' +
        'TRASO '
      '         FROM ( SELECT /*+ INDEX (L) */ '
      
        '                     L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRAC' +
        'UM) AS VLRCORRIGIDOATRASO '
      '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P.IDPESSOA = 1'
      '                AND L.IDCONTRATOIMOVEL = 3481'
      '                AND ( L.IDOPERACAO = P.IDOPERATUALCM ) '
      '                AND L.DATABAIXA IS NOT NULL '
      '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX' +
        '(L2.DATAOPER) AS DTAPUR '
      '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P2.IDPESSOA = 1'
      '                AND L2.IDCONTRATOIMOVEL = 3481'
      '                AND ( L2.IDOPERACAO = P2.IDOPERATUALCM ) '
      
        '                AND ( DATAOPER <= TO_DATE('#39'28/02/2011'#39', '#39'DD/MM/Y' +
        'YYY'#39') ) '
      '                AND L2.DATABAIXA IS NOT NULL '
      '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '                AND D1.DATAOPER = D2.DTAPUR '
      '       ) CMA, '
      '       ( '
      
        '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMULTAATRAS' +
        'O '
      '         FROM ( SELECT /*+ INDEX (L) */ '
      
        '                    L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACU' +
        'M) AS VLRMULTAATRASO '
      '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P.IDPESSOA =  1'
      '                AND L.IDCONTRATOIMOVEL = 3481'
      '                AND ( L.IDOPERACAO = P.IDOPERATUALMULTA ) '
      '                AND L.DATABAIXA IS NOT NULL '
      '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX' +
        '(L2.DATAOPER) AS DTAPUR '
      '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P2.IDPESSOA =  1'
      '                AND L2.IDCONTRATOIMOVEL = 3481'
      '                AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA ) '
      
        '                AND ( DATAOPER <= TO_DATE('#39'28/02/2011'#39', '#39'DD/MM/Y' +
        'YYY'#39') ) '
      '                AND L2.DATABAIXA IS NOT NULL '
      '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '         AND D1.DATAOPER = D2.DTAPUR '
      '       ) MA,'
      '       ( '
      '        SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMORAATRASO '
      '        FROM ( SELECT /*+ INDEX (L) */ '
      
        '                   L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM' +
        ') AS VLRMORAATRASO '
      '               FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '               AND P.IDPESSOA =  1'
      '                AND L.IDCONTRATOIMOVEL = 3481'
      '               AND ( L.IDOPERACAO = P.IDOPERATUALJUROS ) '
      '               AND L.DATABAIXA IS NOT NULL '
      '               GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '             ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(' +
        'L2.DATAOPER) AS DTAPUR '
      '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '               AND P2.IDPESSOA =  1'
      '                AND L2.IDCONTRATOIMOVEL = 3481'
      '               AND ( L2.IDOPERACAO = P2.IDOPERATUALJUROS ) '
      
        '                AND ( DATAOPER <= TO_DATE('#39'28/02/2011'#39', '#39'DD/MM/Y' +
        'YYY'#39') ) '
      '               AND L2.DATABAIXA IS NOT NULL '
      '               GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '        WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '        AND D1.DATAOPER = D2.DTAPUR '
      '       ) JA, '
      '       ( '
      
        '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRCORRIGIDOS' +
        'ALDO '
      '         FROM ( SELECT /*+ INDEX (L) */ '
      
        '                     L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRAC' +
        'UM) AS VLRCORRIGIDOSALDO '
      '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P.IDPESSOA = 1'
      '                AND L.IDCONTRATOIMOVEL = 3481'
      '                AND ( L.IDOPERACAO = P.IDOPERATUALCM ) '
      '                AND L.DATABAIXA IS NULL '
      '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX' +
        '(L2.DATAOPER) AS DTAPUR '
      '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P2.IDPESSOA = 1'
      '                AND L2.IDCONTRATOIMOVEL = 3481'
      '                AND ( L2.IDOPERACAO = P2.IDOPERATUALCM ) '
      
        '                AND ( DATAOPER <= TO_DATE('#39'28/02/2011'#39', '#39'DD/MM/Y' +
        'YYY'#39') ) '
      '                AND L2.DATABAIXA IS NULL '
      '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '                AND D1.DATAOPER = D2.DTAPUR '
      '       ) CMS, '
      '       ( '
      
        '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMULTASALDO' +
        ' '
      '         FROM ( SELECT /*+ INDEX (L) */ '
      
        '                    L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACU' +
        'M) AS VLRMULTASALDO '
      '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P.IDPESSOA =  1'
      '                AND L.IDCONTRATOIMOVEL = 3481'
      '                AND ( L.IDOPERACAO = P.IDOPERATUALMULTA ) '
      '                AND L.DATABAIXA IS NULL '
      '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX' +
        '(L2.DATAOPER) AS DTAPUR '
      '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P2.IDPESSOA =  1'
      '                AND L2.IDCONTRATOIMOVEL = 3481'
      '                AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA ) '
      
        '                AND ( DATAOPER <= TO_DATE('#39'28/02/2011'#39', '#39'DD/MM/Y' +
        'YYY'#39') ) '
      '                AND L2.DATABAIXA IS NULL '
      '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '         AND D1.DATAOPER = D2.DTAPUR '
      '       ) MS, '
      '       ( '
      '        SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMORASALDO '
      '        FROM ( SELECT /*+ INDEX (L) */ '
      
        '                   L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM' +
        ') AS VLRMORASALDO '
      '               FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '               AND P.IDPESSOA =  1'
      '                AND L.IDCONTRATOIMOVEL = 3481'
      '               AND ( L.IDOPERACAO = P.IDOPERATUALJUROS ) '
      '               AND L.DATABAIXA IS NULL '
      '               GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '             ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(' +
        'L2.DATAOPER) AS DTAPUR '
      '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '               AND P2.IDPESSOA =  1'
      '                AND L2.IDCONTRATOIMOVEL = 3481'
      '               AND ( L2.IDOPERACAO = P2.IDOPERATUALJUROS ) '
      
        '               AND ( DATAOPER <= TO_DATE('#39'28/02/2011'#39', '#39'DD/MM/YY' +
        'YY'#39') ) '
      '               AND L2.DATABAIXA IS NULL '
      '               GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '        WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '        AND D1.DATAOPER = D2.DTAPUR '
      '       ) JS, '
      '       ( SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.TOT_ABONO '
      '       FROM ( SELECT /*+ INDEX (L) */ '
      
        '                  L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM)' +
        ' AS TOT_ABONO '
      '              FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '              WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND L.IDMODULO = 135 '
      '                AND P.IDPESSOA =  1'
      '                AND L.IDCONTRATOIMOVEL = 3481'
      '                AND ( L.IDOPERACAO = P.IDOPERABONOMULTA OR '
      '                      L.IDOPERACAO = P.IDOPERABONOJUROS OR '
      '                      L.IDOPERACAO = P.IDOPERABONOCM ) '
      '              GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '           ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2' +
        '.DATAOPER) AS DTAPUR '
      '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '              WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND L2.IDMODULO = 135 '
      '                AND P2.IDPESSOA = 1'
      '                AND L2.IDCONTRATOIMOVEL = 3481'
      '         AND ( L2.IDOPERACAO = P2.IDOPERABONOMULTA OR '
      '               L2.IDOPERACAO = P2.IDOPERABONOJUROS OR '
      '               L2.IDOPERACAO = P2.IDOPERABONOCM ) '
      
        '         AND ( DATAOPER <= TO_DATE('#39'28/02/2011'#39', '#39'DD/MM/YYYY'#39') )' +
        ' '
      '       GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      'WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      'AND D1.DATAOPER = D2.DTAPUR '
      ') ABONO, '
      '       ( SELECT DISTINCT                                  '
      '                CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL, '
      '                M.IMONOME   AS NOMEMESTRE,                '
      '                M.IDIMOVEL  AS IDIMOVELMESTRE,            '
      '                I.CODTIPIMOVEL ,                          '
      '                C.UF        AS UF    '
      '           FROM CONTRATOXIMOVEL CXI, '
      '                IMOVEL I, '
      '                IMOVEL M, '
      '                CIDADES C '
      '          WHERE CXI.IDIMOVEL = I.IDIMOVEL              '
      '           AND  M.IDCIDADES = C.IDCIDADES(+)           '
      '           AND  I.IDIMOVELMESTRE = M.IDIMOVEL ) IM     '
      '  WHERE (PF.FLGTIPOLANC IN (2,3,4,5,6,7,8,9))          '
      '    AND (PF.IDPARCFINANCIMOV NOT IN( SELECT IDPARCFINANCIMOV '
      '                          FROM CONCILIADOC                   '
      '                WHERE FLGTIPO = '#39'R'#39'                        '
      '                  AND DATA >= &pDTINI                        '
      '                  AND DATA <= &pDTFIM))                      '
      
        '    AND (NVL(CD2.CONCILIADOC, NVL(PF.FLGCONCILIADO, '#39'N'#39')) IN ('#39'N' +
        #39', '#39'P'#39')) '
      '    AND (NVL(PF.FLGCONCILIADO,'#39'N'#39') IN ('#39'N'#39','#39'P'#39')) '
      '    AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)      '
      '    AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)    '
      '    AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL)  '
      '    AND (PP.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '
      '    AND (TT.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '
      '    AND (PF.IDPARCFINANCIMOV = MA.IDPARCFINANCIMOV(+))  '
      '    AND (PF.IDPARCFINANCIMOV = JA.IDPARCFINANCIMOV(+))  '
      '    AND (PF.IDPARCFINANCIMOV = CMA.IDPARCFINANCIMOV(+))  '
      '    AND (PF.IDPARCFINANCIMOV = MS.IDPARCFINANCIMOV(+))  '
      '    AND (PF.IDPARCFINANCIMOV = JS.IDPARCFINANCIMOV(+))  '
      '    AND (PF.IDPARCFINANCIMOV = CMS.IDPARCFINANCIMOV(+))  '
      '    AND (PF.IDPARCFINANCIMOV = ABONO.IDPARCFINANCIMOV(+))  '
      '    AND (PF.IDPARCFINANCIMOV = CD2.IDPARCFINANCIMOV(+))    '
      '    AND (ALT.CODDOCUMENTO(+) = PF.CODDOCUMENTO)         '
      '    AND (P.IDPESSOA(+) = CI.IDLOCATARIO)               '
      '    AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL) '
      '    AND (IM.CODTIPIMOVEL     = T.CODTIPIMOVEL ) '
      '    AND (CI.IDADMINIMOVEL = PA.IDPESSOA)        '
      ' AND (CI.IDCONTRATOIMOVEL = 3481)'
      
        '    AND (  (PF.DATAVENCIMENTO >= TO_DATE(&pDTINI,'#39'DD/MM/YYYY'#39')) ' +
        ') '
      
        '    AND (  (PF.DATAVENCIMENTO <= TO_DATE(&pDTFIM,'#39'DD/MM/YYYY'#39')) ' +
        ') '
      
        '    AND ( CI.FLGTIPOCONTRATO = '#39'P'#39' OR CI.FLGTIPOCONTRATO = '#39'C'#39' )' +
        ' '
      ' ORDER BY'
      
        ' CI.CONNUMERO, CI.CONNOME, PF.IDCONDPAGIMOVEL,PF.NUMPARCELA , PF' +
        '.CODDOCUMENTO'
      ' ')
    UpdateObject = updInadimplContrAnalitico
    ValidateWithMask = True
    Left = 34
    Top = 533
    object qryInadimplContrAnaliticoIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
    end
    object qryInadimplContrAnaliticoIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryInadimplContrAnaliticoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryInadimplContrAnaliticoCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryInadimplContrAnaliticoNUMERO_CONTRATO: TStringField
      FieldName = 'NUMERO_CONTRATO'
    end
    object qryInadimplContrAnaliticoCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 100
    end
    object qryInadimplContrAnaliticoDESCTIPOIMOVEL: TStringField
      FieldName = 'DESCTIPOIMOVEL'
      Size = 60
    end
    object qryInadimplContrAnaliticoNOMECONTRATO: TStringField
      FieldName = 'NOMECONTRATO'
      Size = 123
    end
    object qryInadimplContrAnaliticoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryInadimplContrAnaliticoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryInadimplContrAnaliticoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryInadimplContrAnaliticoCONDATAASSINATURA: TDateTimeField
      FieldName = 'CONDATAASSINATURA'
    end
    object qryInadimplContrAnaliticoNUMPARCELA: TStringField
      FieldName = 'NUMPARCELA'
      Size = 81
    end
    object qryInadimplContrAnaliticoDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryInadimplContrAnaliticoVLRPRESTACAO: TFloatField
      FieldName = 'VLRPRESTACAO'
    end
    object qryInadimplContrAnaliticoFLGTIPOLANC: TFloatField
      FieldName = 'FLGTIPOLANC'
    end
    object qryInadimplContrAnaliticoFLGLANCINTEGRA: TFloatField
      FieldName = 'FLGLANCINTEGRA'
    end
    object qryInadimplContrAnaliticoDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
    end
    object qryInadimplContrAnaliticoCOMP: TStringField
      FieldName = 'COMP'
      Size = 7
    end
    object qryInadimplContrAnaliticoVLRPAGO: TFloatField
      FieldName = 'VLRPAGO'
    end
    object qryInadimplContrAnaliticoDIASDIF: TFloatField
      FieldName = 'DIASDIF'
    end
    object qryInadimplContrAnaliticoVLRDIF: TFloatField
      FieldName = 'VLRDIF'
    end
    object qryInadimplContrAnaliticoVLRCMATRASO: TFloatField
      FieldName = 'VLRCMATRASO'
    end
    object qryInadimplContrAnaliticoVLRMULTAATRASO: TFloatField
      FieldName = 'VLRMULTAATRASO'
    end
    object qryInadimplContrAnaliticoVLRMORAATRASO: TFloatField
      FieldName = 'VLRMORAATRASO'
    end
    object qryInadimplContrAnaliticoVLRCMCORRIG: TFloatField
      FieldName = 'VLRCMCORRIG'
    end
    object qryInadimplContrAnaliticoVLRMULTACORRIG: TFloatField
      FieldName = 'VLRMULTACORRIG'
    end
    object qryInadimplContrAnaliticoVLRJUROSCORRIG: TFloatField
      FieldName = 'VLRJUROSCORRIG'
    end
    object qryInadimplContrAnaliticoVLRDEVIDO: TFloatField
      FieldName = 'VLRDEVIDO'
    end
    object qryInadimplContrAnaliticoCOMPETENCIA: TStringField
      FieldName = 'COMPETENCIA'
      Size = 81
    end
  end
  object dsInadimplContrAnalitico: TwwDataSource
    DataSet = qryInadimplContrAnalitico
    Left = 124
    Top = 530
  end
  object pplInadimplContrAnalitico: TppBDEPipeline
    DataSource = dsInadimplContrAnalitico
    UserName = 'lInadAna1'
    Left = 218
    Top = 530
    object pplInadimplContrAnaliticoppField1: TppField
      FieldAlias = 'IDPARCFINANCIMOV'
      FieldName = 'IDPARCFINANCIMOV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField2: TppField
      FieldAlias = 'IDCONDPAGIMOVEL'
      FieldName = 'IDCONDPAGIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField3: TppField
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField4: TppField
      FieldAlias = 'CONNUMERO'
      FieldName = 'CONNUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField5: TppField
      FieldAlias = 'NUMERO_CONTRATO'
      FieldName = 'NUMERO_CONTRATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField6: TppField
      FieldAlias = 'CONNOME'
      FieldName = 'CONNOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField7: TppField
      FieldAlias = 'DESCTIPOIMOVEL'
      FieldName = 'DESCTIPOIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField8: TppField
      FieldAlias = 'NOMECONTRATO'
      FieldName = 'NOMECONTRATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField9: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField10: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField11: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField12: TppField
      FieldAlias = 'CONDATAASSINATURA'
      FieldName = 'CONDATAASSINATURA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField13: TppField
      FieldAlias = 'NUMPARCELA'
      FieldName = 'NUMPARCELA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField14: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField15: TppField
      FieldAlias = 'VLRPRESTACAO'
      FieldName = 'VLRPRESTACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField16: TppField
      FieldAlias = 'FLGTIPOLANC'
      FieldName = 'FLGTIPOLANC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField17: TppField
      FieldAlias = 'FLGLANCINTEGRA'
      FieldName = 'FLGLANCINTEGRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField18: TppField
      FieldAlias = 'DATAPAGAMENTO'
      FieldName = 'DATAPAGAMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField19: TppField
      FieldAlias = 'COMP'
      FieldName = 'COMP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField20: TppField
      FieldAlias = 'VLRPAGO'
      FieldName = 'VLRPAGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField21: TppField
      FieldAlias = 'DIASDIF'
      FieldName = 'DIASDIF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField22: TppField
      FieldAlias = 'VLRDIF'
      FieldName = 'VLRDIF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField23: TppField
      FieldAlias = 'VLRCMATRASO'
      FieldName = 'VLRCMATRASO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField24: TppField
      FieldAlias = 'VLRMULTAATRASO'
      FieldName = 'VLRMULTAATRASO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField25: TppField
      FieldAlias = 'VLRMORAATRASO'
      FieldName = 'VLRMORAATRASO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField26: TppField
      FieldAlias = 'VLRCMCORRIG'
      FieldName = 'VLRCMCORRIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField27: TppField
      FieldAlias = 'VLRMULTACORRIG'
      FieldName = 'VLRMULTACORRIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField28: TppField
      FieldAlias = 'VLRJUROSCORRIG'
      FieldName = 'VLRJUROSCORRIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField29: TppField
      FieldAlias = 'VLRDEVIDO'
      FieldName = 'VLRDEVIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object pplInadimplContrAnaliticoppField30: TppField
      FieldAlias = 'COMPETENCIA'
      FieldName = 'COMPETENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
  end
  object rptInadimplContrAnalAlien: TppReport
    AutoStop = False
    DataPipeline = pplInadimplContrAnalitico
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 0
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
    Left = 306
    Top = 522
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplInadimplContrAnalitico'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 50536
      mmPrintPosition = 0
      object ppLabel177: TppLabel
        UserName = 'TituloInadAna'
        AutoSize = False
        Caption = 'Inadimplência de Alienação por Contrato- Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8467
        mmWidth = 283898
        BandType = 0
      end
      object ppLabel185: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1852
        mmWidth = 283898
        BandType = 0
      end
      object ppLabel207: TppLabel
        UserName = 'Label207'
        Caption = 'Segmento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 21822
        mmTop = 19579
        mmWidth = 14690
        BandType = 0
      end
      object rptInadimplContrAnaliticolblSegmento: TppLabel
        UserName = 'rptInadimplContrAnaliticolblSegmento'
        Caption = 'rptInadimplContrAnaliticolblSegmento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 36777
        mmTop = 19579
        mmWidth = 47498
        BandType = 0
      end
      object ppLabel208: TppLabel
        UserName = 'Label208'
        Caption = 'Responsável:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 16298
        mmTop = 23283
        mmWidth = 20024
        BandType = 0
      end
      object rptInadimplContrAnaliticolblResponsavel: TppLabel
        UserName = 'rptInadimplContrAnaliticolblResponsavel'
        Caption = '< Todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 36777
        mmTop = 23283
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel209: TppLabel
        UserName = 'Label209'
        Caption = 'Administradora :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 13112
        mmTop = 26988
        mmWidth = 22606
        BandType = 0
      end
      object rptInadimplContrAnaliticolblAdministradora: TppLabel
        UserName = 'rptInadimplContrAnaliticolblAdministradora'
        Caption = '< Todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 36777
        mmTop = 26988
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel210: TppLabel
        UserName = 'rptInadimplenciaContratoLabel3'
        Caption = 'Mês de competência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 98161
        mmTop = 20108
        mmWidth = 31750
        BandType = 0
      end
      object rptInadimplContrAnaliticolblMes: TppLabel
        UserName = 'rptInadimplContrAnaliticolblMes'
        Caption = 'rptInadimplContrAnaliticoMEs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 129646
        mmTop = 20108
        mmWidth = 37380
        BandType = 0
      end
      object ppLabel211: TppLabel
        UserName = 'Label211'
        Caption = 'Data Inicio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 113242
        mmTop = 23283
        mmWidth = 15325
        BandType = 0
      end
      object rptInadimplContrAnaliticolblDtInicio: TppLabel
        UserName = 'rptInadimplContrAnaliticolblDtInicio'
        Caption = '< Todas >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 129911
        mmTop = 23283
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel213: TppLabel
        UserName = 'Label213'
        Caption = 'Data Fim:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 115359
        mmTop = 26723
        mmWidth = 12954
        BandType = 0
      end
      object rptInadimplContrAnaliticolblDataFim: TppLabel
        UserName = 'rptInadimplContrAnaliticolblDataFim'
        Caption = 'rptInadimplContrAnaliticolblDataFim'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 129911
        mmTop = 26723
        mmWidth = 45297
        BandType = 0
      end
      object ppLabel203: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 3704
        mmTop = 45245
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel214: TppLabel
        UserName = 'Label214'
        AutoSize = False
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 15610
        mmTop = 45245
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel215: TppLabel
        UserName = 'Label215'
        AutoSize = False
        Caption = 'Comp.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 32279
        mmTop = 45245
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel204: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Data de Vencto.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7144
        mmLeft = 46302
        mmTop = 41540
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel206: TppLabel
        UserName = 'Label204'
        AutoSize = False
        Caption = 'Prestação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 62706
        mmTop = 44715
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel188: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Data de Pagto.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7144
        mmLeft = 83079
        mmTop = 41010
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel189: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Valor Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 99484
        mmTop = 44715
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel192: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Correção Monetária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7144
        mmLeft = 119592
        mmTop = 40746
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel193: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Multa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 140229
        mmTop = 44450
        mmWidth = 13759
        BandType = 0
      end
      object ppLabel194: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 156104
        mmTop = 44450
        mmWidth = 13759
        BandType = 0
      end
      object ppLabel197: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Diferença'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 173038
        mmTop = 44450
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel196: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Correção Monetária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7144
        mmLeft = 200025
        mmTop = 40746
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel202: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Multa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 220928
        mmTop = 44450
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel195: TppLabel
        UserName = 'Label1202'
        AutoSize = False
        Caption = 'Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 241830
        mmTop = 44450
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel190: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = '    Valor Devido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7144
        mmLeft = 266701
        mmTop = 40746
        mmWidth = 20108
        BandType = 0
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        mmHeight = 2117
        mmLeft = 119592
        mmTop = 37571
        mmWidth = 75142
        BandType = 0
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        mmHeight = 2117
        mmLeft = 200025
        mmTop = 37571
        mmWidth = 62177
        BandType = 0
      end
      object ppLabel198: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Correção de Valores Pagos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 119592
        mmTop = 34925
        mmWidth = 75142
        BandType = 0
      end
      object ppLabel201: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Correção de Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 200025
        mmTop = 34925
        mmWidth = 62177
        BandType = 0
      end
      object ppLine30: TppLine
        UserName = 'Line30'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 32808
        mmWidth = 290650
        BandType = 0
      end
    end
    object ppDetailBand14: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppShape5: TppShape
        OnPrint = ppsCorPrint
        UserName = 'sCor2'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 290650
        BandType = 4
      end
      object ppDBText133: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'NUMPARCELA'
        DataPipeline = pplInadimplContrAnalitico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3704
        mmLeft = 6615
        mmTop = 265
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText134: TppDBText
        UserName = 'DBText10'
        DataField = 'CODDOCUMENTO'
        DataPipeline = pplInadimplContrAnalitico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3704
        mmLeft = 18256
        mmTop = 265
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText135: TppDBText
        UserName = 'DBText11'
        BlankWhenZero = True
        DataField = 'DATAVENCIMENTO'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3704
        mmLeft = 46302
        mmTop = 265
        mmWidth = 16510
        BandType = 4
      end
      object ppDBText136: TppDBText
        UserName = 'DBText27'
        BlankWhenZero = True
        DataField = 'VLRPRESTACAO'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3704
        mmLeft = 63765
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText137: TppDBText
        UserName = 'DBText38'
        BlankWhenZero = True
        DataField = 'DATAPAGAMENTO'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3704
        mmLeft = 80698
        mmTop = 265
        mmWidth = 16510
        BandType = 4
      end
      object ppDBText138: TppDBText
        UserName = 'dbtTipo'
        DataField = 'COMPETENCIA'
        DataPipeline = pplInadimplContrAnalitico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3704
        mmLeft = 34396
        mmTop = 265
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText139: TppDBText
        UserName = 'DBText33'
        BlankWhenZero = True
        DataField = 'VLRDEVIDO'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3704
        mmLeft = 263526
        mmTop = 265
        mmWidth = 25929
        BandType = 4
      end
      object ppDBText140: TppDBText
        UserName = 'DBText86'
        BlankWhenZero = True
        DataField = 'VLRPAGO'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3704
        mmLeft = 98954
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText141: TppDBText
        UserName = 'DBText87'
        BlankWhenZero = True
        DataField = 'VLRCMATRASO'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3704
        mmLeft = 118004
        mmTop = 265
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText142: TppDBText
        UserName = 'DBText88'
        BlankWhenZero = True
        DataField = 'VLRMULTAATRASO'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3704
        mmLeft = 140229
        mmTop = 265
        mmWidth = 13759
        BandType = 4
      end
      object ppDBText143: TppDBText
        UserName = 'DBText89'
        BlankWhenZero = True
        DataField = 'VLRMORAATRASO'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3704
        mmLeft = 156104
        mmTop = 265
        mmWidth = 13759
        BandType = 4
      end
      object ppDBText144: TppDBText
        UserName = 'DBText90'
        BlankWhenZero = True
        DataField = 'VLRCMCORRIG'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3704
        mmLeft = 199232
        mmTop = 265
        mmWidth = 20109
        BandType = 4
      end
      object ppDBText145: TppDBText
        UserName = 'DBText92'
        BlankWhenZero = True
        DataField = 'VLRJUROSCORRIG'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3704
        mmLeft = 241565
        mmTop = 265
        mmWidth = 20109
        BandType = 4
      end
      object ppDBText146: TppDBText
        UserName = 'DBText93'
        BlankWhenZero = True
        DataField = 'VLRDIF'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3704
        mmLeft = 173038
        mmTop = 265
        mmWidth = 20109
        BandType = 4
      end
      object ppDBText147: TppDBText
        UserName = 'DBText91'
        BlankWhenZero = True
        DataField = 'VLRMULTACORRIG'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3704
        mmLeft = 220134
        mmTop = 265
        mmWidth = 18786
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLine24: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 0
        mmWidth = 290650
        BandType = 8
      end
      object ppLabel186: TppLabel
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
        mmTop = 795
        mmWidth = 283369
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
        mmTop = 795
        mmWidth = 289984
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 254794
        mmTop = 794
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand12: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppShape12: TppShape
        UserName = 'Shape12'
        mmHeight = 5292
        mmLeft = 3175
        mmTop = 0
        mmWidth = 287074
        BandType = 7
      end
      object ppLabel154: TppLabel
        UserName = 'Label154'
        AutoSize = False
        Caption = 'Totais Gerais :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 7673
        mmTop = 1058
        mmWidth = 32279
        BandType = 7
      end
      object ppDBCalc25: TppDBCalc
        UserName = 'DBCalc25'
        DataField = 'VLRPRESTACAO'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3175
        mmLeft = 58738
        mmTop = 1323
        mmWidth = 20373
        BandType = 7
      end
      object ppDBCalc26: TppDBCalc
        UserName = 'DBCalc201'
        DataField = 'VLRDIF'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3175
        mmLeft = 173038
        mmTop = 1323
        mmWidth = 22225
        BandType = 7
      end
      object ppDBCalc27: TppDBCalc
        UserName = 'DBCalc27'
        DataField = 'VLRCMCORRIG'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3175
        mmLeft = 198702
        mmTop = 1323
        mmWidth = 20108
        BandType = 7
      end
      object ppDBCalc28: TppDBCalc
        UserName = 'DBCalc28'
        DataField = 'VLRJUROSCORRIG'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3175
        mmLeft = 241830
        mmTop = 1323
        mmWidth = 20108
        BandType = 7
      end
      object ppDBCalc29: TppDBCalc
        UserName = 'DBCalc29'
        DataField = 'VLRMULTACORRIG'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3175
        mmLeft = 220134
        mmTop = 1323
        mmWidth = 18786
        BandType = 7
      end
      object ppDBCalc30: TppDBCalc
        UserName = 'DBCalc30'
        DataField = 'VLRDEVIDO'
        DataPipeline = pplInadimplContrAnalitico
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadimplContrAnalitico'
        mmHeight = 3175
        mmLeft = 263526
        mmTop = 1323
        mmWidth = 25929
        BandType = 7
      end
      object ppLine29: TppLine
        UserName = 'Line29'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 290650
        BandType = 7
      end
    end
    object ppGroup15: TppGroup
      BreakName = 'DESCTIPOIMOVEL'
      DataPipeline = pplInadimplContrAnalitico
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplInadimplContrAnalitico'
      object ppGroupHeaderBand13: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppLine25: TppLine
          UserName = 'Line14'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 290650
          BandType = 3
          GroupNo = 0
        end
        object ppShape7: TppShape
          UserName = 'Shape2'
          Pen.Color = clWhite
          mmHeight = 794
          mmLeft = 118269
          mmTop = 2065
          mmWidth = 82286
          BandType = 3
          GroupNo = 0
        end
        object ppShape9: TppShape
          UserName = 'Shape4'
          Pen.Color = clWhite
          mmHeight = 794
          mmLeft = 201348
          mmTop = 2065
          mmWidth = 62177
          BandType = 3
          GroupNo = 0
        end
        object ppLabel191: TppLabel
          UserName = 'Label191'
          Caption = 'Segmento: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4657
          mmLeft = 4233
          mmTop = 794
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object ppDBText148: TppDBText
          UserName = 'DBText148'
          DataField = 'DESCTIPOIMOVEL'
          DataPipeline = pplInadimplContrAnalitico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 4763
          mmLeft = 32279
          mmTop = 794
          mmWidth = 75671
          BandType = 3
          GroupNo = 0
        end
        object ppLine27: TppLine
          UserName = 'Line27'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6879
          mmWidth = 290650
          BandType = 3
          GroupNo = 0
        end
        object ppLine26: TppLine
          UserName = 'Line26'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6879
          mmWidth = 290650
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand13: TppGroupFooterBand
        AfterPrint = gfbExtratoAfterPrint
        BeforePrint = gfbExtratoBeforePrint
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppShape11: TppShape
          UserName = 'Shape101'
          mmHeight = 5292
          mmLeft = 3175
          mmTop = 0
          mmWidth = 287073
          BandType = 5
          GroupNo = 0
        end
        object ppLine32: TppLine
          UserName = 'Line32'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 290650
          BandType = 5
          GroupNo = 0
        end
        object ppLabel152: TppLabel
          UserName = 'Label152'
          AutoSize = False
          Caption = 'Totais do Segmento :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 7144
          mmTop = 794
          mmWidth = 32279
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc19: TppDBCalc
          UserName = 'DBCalc19'
          DataField = 'VLRPRESTACAO'
          DataPipeline = pplInadimplContrAnalitico
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3175
          mmLeft = 58738
          mmTop = 1058
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc20: TppDBCalc
          UserName = 'DBCalc20'
          DataField = 'VLRDIF'
          DataPipeline = pplInadimplContrAnalitico
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3175
          mmLeft = 173038
          mmTop = 1058
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc21: TppDBCalc
          UserName = 'DBCalc21'
          DataField = 'VLRCMCORRIG'
          DataPipeline = pplInadimplContrAnalitico
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3175
          mmLeft = 198702
          mmTop = 1058
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc22: TppDBCalc
          UserName = 'DBCalc22'
          DataField = 'VLRMULTACORRIG'
          DataPipeline = pplInadimplContrAnalitico
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3175
          mmLeft = 220134
          mmTop = 1058
          mmWidth = 18786
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc23: TppDBCalc
          UserName = 'DBCalc23'
          DataField = 'VLRJUROSCORRIG'
          DataPipeline = pplInadimplContrAnalitico
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3175
          mmLeft = 241830
          mmTop = 1058
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc24: TppDBCalc
          UserName = 'DBCalc24'
          DataField = 'VLRDEVIDO'
          DataPipeline = pplInadimplContrAnalitico
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3175
          mmLeft = 263526
          mmTop = 1058
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup16: TppGroup
      BreakName = 'NUMERO_CONTRATO'
      DataPipeline = pplInadimplContrAnalitico
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group16'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplInadimplContrAnalitico'
      object ppGroupHeaderBand14: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object ppLabel205: TppLabel
          UserName = 'Label205'
          Caption = 'Nº Contrato: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 3969
          mmTop = 794
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object ppDBText149: TppDBText
          UserName = 'DBText149'
          DataField = 'NUMERO_CONTRATO'
          DataPipeline = pplInadimplContrAnalitico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3175
          mmLeft = 25929
          mmTop = 794
          mmWidth = 57150
          BandType = 3
          GroupNo = 1
        end
        object ppLabel216: TppLabel
          UserName = 'Label216'
          Caption = 'Comprador: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 88900
          mmTop = 529
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object ppDBMemo1: TppDBMemo
          UserName = 'DBMemo1'
          CharWrap = False
          DataField = 'RAZAOSOCIAL'
          DataPipeline = pplInadimplContrAnalitico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Stretch = True
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3969
          mmLeft = 105834
          mmTop = 529
          mmWidth = 103717
          BandType = 3
          GroupNo = 1
          mmBottomOffset = 794
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppLabel217: TppLabel
          UserName = 'Label217'
          Caption = 'Data da Assinatura : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 88900
          mmTop = 5292
          mmWidth = 26458
          BandType = 3
          GroupNo = 1
        end
        object ppDBText150: TppDBText
          UserName = 'DBText150'
          DataField = 'CONDATAASSINATURA'
          DataPipeline = pplInadimplContrAnalitico
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3704
          mmLeft = 119327
          mmTop = 5292
          mmWidth = 25400
          BandType = 3
          GroupNo = 1
        end
        object ppLabel218: TppLabel
          UserName = 'Label218'
          Caption = 'Administradora: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 3969
          mmTop = 5027
          mmWidth = 20638
          BandType = 3
          GroupNo = 1
        end
        object ppDBText151: TppDBText
          UserName = 'DBText151'
          DataField = 'NOMEADMIN'
          DataPipeline = pplInadimplContrAnalitico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3175
          mmLeft = 25929
          mmTop = 5027
          mmWidth = 57150
          BandType = 3
          GroupNo = 1
        end
        object ppLine31: TppLine
          UserName = 'Line31'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 9790
          mmWidth = 290650
          BandType = 3
          GroupNo = 1
        end
        object ppLine33: TppLine
          UserName = 'Line33'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 9790
          mmWidth = 290650
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand14: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppLine28: TppLine
          UserName = 'Line28'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 290650
          BandType = 5
          GroupNo = 1
        end
        object ppShape10: TppShape
          UserName = 'Shape10'
          mmHeight = 5292
          mmLeft = 3175
          mmTop = 0
          mmWidth = 287074
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc102'
          DataField = 'VLRDIF'
          DataPipeline = pplInadimplContrAnalitico
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3175
          mmLeft = 173038
          mmTop = 794
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'VLRDEVIDO'
          DataPipeline = pplInadimplContrAnalitico
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3175
          mmLeft = 263526
          mmTop = 794
          mmWidth = 25929
          BandType = 5
          GroupNo = 1
        end
        object ppLabel153: TppLabel
          UserName = 'Label153'
          AutoSize = False
          Caption = 'Totais do Contrato :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 6879
          mmTop = 794
          mmWidth = 32279
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          DataField = 'VLRPRESTACAO'
          DataPipeline = pplInadimplContrAnalitico
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3175
          mmLeft = 58738
          mmTop = 794
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc16'
          DataField = 'VLRMULTACORRIG'
          DataPipeline = pplInadimplContrAnalitico
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3175
          mmLeft = 220134
          mmTop = 794
          mmWidth = 18786
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'DBCalc17'
          DataField = 'VLRCMCORRIG'
          DataPipeline = pplInadimplContrAnalitico
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3175
          mmLeft = 198702
          mmTop = 794
          mmWidth = 20108
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc18: TppDBCalc
          UserName = 'DBCalc18'
          DataField = 'VLRJUROSCORRIG'
          DataPipeline = pplInadimplContrAnalitico
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadimplContrAnalitico'
          mmHeight = 3175
          mmLeft = 241830
          mmTop = 794
          mmWidth = 20108
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object updInadimplContrAnalitico: TUpdateSQL
    Left = 51
    Top = 530
  end
  object qryExtratoNovo: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryExtratoNovoCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PF.IDPARCFINANCIMOV, '
      '       PF.IDCONDPAGIMOVEL,  '
      '       CI.IDCONTRATOIMOVEL, '
      '       CI.CONNUMERO,        '
      '       CI.CONNOME,          '
      '       CI.VLRPROPOSTA,      '
      '       CI.CONDATAINICIO,    '
      '       CI.IDCIDADES,        '
      '       CI.IDPAIS,           '
      '       CI.CODESTADO,        '
      '       P.RAZAOSOCIAL,       '
      '      '#39' '#39'as NOMEMESTRE,   '
      '       PF.CODDOCUMENTO,     '
      '       PF.PLNCODIGO,        '
      '       CPMF.TOT_CPMF,       '
      
        '       (NVL(ALT.TOT_ALTERADOR,0) +  NVL(CPMF.TOT_CPMF,0)) AS TOT' +
        '_ALTERADOR,   '
      '       DECODE(NVL(PF.FLGTIPOLANC,1), 1, 0, '
      
        '          DECODE(PF.CODDOCUMENTO, NULL, PF.IDPARCFINANCIMOV, PF.' +
        'CODDOCUMENTO) ) AS NUMDOC, '
      '       PF.NUMPARCELA AS NUMPARC, '
      
        '       DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || '#39'/'#39 +
        ' || TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA, '
      
        '       NVL(DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) ||' +
        ' TO_CHAR(CPFINAL.NUMPARCELAS)),0) AS NUMPARCELAORDEM, '
      
        '       DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENT' +
        'O) AS DATAVENCIMENTO, '
      
        '       TO_CHAR(PF.DATAVENCIMENTO,'#39'MMYYYY'#39') AS MESANO_VENCIMENTO,' +
        ' '
      #39'062012'#39' AS MESANO_CALCULO, '
      '       CPFINAL.INDCORRECAO    AS IDCORR_CONDPAG, '
      '       CPFINAL.MESREFREAJUSTE AS MESREF_CONDPAG, '
      '       CPFINAL.TIPOCONDPAG, '
      '       CPFINAL.NUMPARCELAS, '
      '       ROUND(PF.VLRPRESTACAO,2) AS VLRPRESTACAO, '
      '       PF.VLRNOMINAL,       '
      
        '       PF.VLRPRESTACAO + NVL(ALT.TOT_ALTERADOR,0) +  NVL(CPMF.TO' +
        'T_CPMF,0) AS TOT_DEVIDO, '
      '       PF.VLRJUROS,         '
      '       ROUND(PF.VLRAMORTIZACAO,2) AS VLRAMORTIZACAO, '
      '       PF.VLRSALDODEVEDOR,    '
      '       PF.VLRSALDOATUAL,      '
      '       PF.VLRPRESTATUALIZADA, '
      '       PF.VLRRESIDUO,         '
      '       PF.VLRRESIDUOATUALI,   '
      
        '       (NVL(PF.VLRRESIDUO,0) + NVL(AR.VLRRESIDUOCORRIG,0)) as VL' +
        'RRESIDUOCORRIG,   '
      '       CR.DATACOBRES,         '
      '       PF.IDINDCORRECAO,      '
      '       PF.VLRCORRIGIDOATRASO, '
      '       PF.VLRMULTAATRASO,     '
      '       PF.VLRMORAATRASO,      '
      '       NVL(PF.FLGRESIDUOINCORP,'#39'N'#39') AS FLGRESIDUOINCORP,   '
      '       PF.FLGTIPOLANC,        '
      '       DECODE(PF.IDREPACTUA, NULL, PF.FLGLANCINTEGRA, '
      '              DECODE(CD2.FLGTIPO, NULL,               '
      '                     DECODE(PF.CODDOCUMENTO, NULL,    '
      
        '                            DECODE(NVL(PF.VLRPAGO,0), 0, 0, 3), ' +
        '2), 5) ) AS FLGLANCINTEGRA, '
      '       PF.DATALIMITE,         '
      '       PP.DATAPAGAMENTO,      '
      '       ROUND(NVL(PP.VLRPAGO,0),2) AS VLRPAGO, '
      '       NVL(CD2.CONCILIADOC, '#39'N'#39') AS FLGCONCILIADO, '
      '       PF.IDREPACTUA,         '
      '       CD.IDDOCDIVERGE,       '
      '       TO_DATE('#39'11/06/2012'#39','#39'DD/MM/YYYY'#39') AS DATA_BASE, '
      '       CO2.DTAPUR AS DATA_CORRECAO, '
      
        '       ROUND(DECODE(NVL(CD2.CONCILIADOC, '#39'N'#39'), '#39'S'#39', 0, '#39'C'#39', 0,  ' +
        '  '
      '             DECODE(NVL(PP.VLRPAGO,0), 0, 0,              '
      
        '                        NVL(PF.VLRPRESTACAO,0) + NVL(CO1.TOT_COR' +
        'RECAO,0) + NVL(ALT.TOT_ALTERADOR,0) +  NVL(CPMF.TOT_CPMF,0) - NV' +
        'L(PP.VLRPAGO,0) )),2) AS VLRDIF, '
      '       ROUND(DECODE(CD.IDDOCDIVERGE, NULL,                   '
      '             DECODE(NVL(CD2.CONCILIADOC, '#39'N'#39'), '#39'S'#39', 0, '#39'C'#39', 0, '
      
        '                    NVL(PF.VLRPRESTACAO,0)  + NVL(CO2.TOT_CORREC' +
        'AO,0) + NVL(ALT.TOT_ALTERADOR,0) +  NVL(CPMF.TOT_CPMF,0) - NVL(P' +
        'P.VLRPAGO,0) - NVL(ABONO.TOT_ABONO,0) ), NULL),2) AS VLRCORRIG, '
      '       -- Consultas retiradas do campo OnCalcFields '
      
        '      (SELECT DECODE(D.STATUS, '#39'2'#39', '#39'Baixado'#39', '#39'Aberto'#39') FROM DO' +
        'CUMENTO D WHERE (D.CODDOCUMENTO = PF.CODDOCUMENTO) ) STATUS_CS, '
      
        '      (SELECT NVL(SUM(L.VLRDIA), 0) FROM LANCOPERDIAIMOB L WHERE' +
        ' (L.CODDOCUMENTO  = PF.CODDOCUMENTO) AND (L.IDOPERACAO <> 166)) ' +
        'ATUALIZACAO_CS, '
      
        '      (SELECT NVL((SELECT SUM (L.VALOR) FROM LANCTODOCUM L WHERE' +
        ' (L.CODDOCUMENTO = PF.CODDOCUMENTO) AND (DEBCRE = '#39'D'#39') ),0)  - '
      
        '              NVL((SELECT SUM (L.VALOR) FROM LANCTODOCUM L WHERE' +
        ' (L.CODDOCUMENTO = PF.CODDOCUMENTO) AND (DEBCRE = '#39'C'#39') ),0) TOTA' +
        'L FROM DUAL) SALDO_DOCUMENTO_CS '
      '  FROM  '
      '       PARCFINANCIMOV PF, '
      '       CONDPAGIMOVEL  CP, '
      '       CONTRATOIMOVEL CI, '
      '       PESSOA P,          '
      '       ( '
      '         SELECT /*+ INDEX(LD) INDEX(RP)*/   '
      '                IDPARCFINANCIMOV, '
      
        '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.DATAPAGAMENTO' +
        '), MAX(RP.DATABAIXA) ) AS DATAPAGAMENTO, '
      
        '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), SUM' +
        '(LD.VALOR) ) AS VLRPAGO '
      
        '           FROM PARCFINANCIMOV P, LANCTODOCUM LD, RECBTOPAGTO RP' +
        ' '
      '          WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+) '
      '            AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) '
      '            AND LD.NUMLANCTO    = RP.NUMLANCTO(+)    '
      '            AND ( (P.CODDOCUMENTO IS NULL) OR        '
      
        '                  (P.CODDOCUMENTO IS NOT NULL AND (RP.DATABAIXA ' +
        'IS NOT NULL OR LD.CODALTERADOR = 215) ) )        '
      
        '            AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO <' +
        '=  TO_DATE('#39'11/06/2012'#39','#39'DD/MM/YYYY'#39')  ) OR '
      
        '                 (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPER' +
        'ACAO) = '#39'5'#39') '
      
        '                                             AND LD.ESTORNO IS N' +
        'ULL                  '
      
        '                                             AND LD.DATALANCTO <' +
        '=  TO_DATE('#39'11/06/2012'#39','#39'DD/MM/YYYY'#39')  ) )  '
      
        '          GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO             ' +
        '                     '
      '       ) PP, '
      '        -- Foi criado o indice XIE1CONCILIADOC '
      '       ( SELECT DISTINCT  '
      '                IDPARCFINANCIMOV, '
      
        '                DECODE(IDDOCDIVERGE, NULL, NULL, 1) AS IDDOCDIVE' +
        'RGE '
      '           FROM CONCILIADOC '
      '          WHERE IDPARCFINANCIMOV IS NOT NULL '
      '            AND DATA <=  TO_DATE('#39'11/06/2012'#39','#39'DD/MM/YYYY'#39') '
      '            AND (IDDOCDIVERGE IS NOT NULL OR '
      
        '                 IDPARCFINANCIMOV NOT IN ( SELECT DISTINCT IDPAR' +
        'CFINANCIMOV    '
      
        '                                             FROM CONCILIADOC   ' +
        '               '
      
        '                                            WHERE IDPARCFINANCIM' +
        'OV IS NOT NULL '
      
        '                                              AND DATA <=  TO_DA' +
        'TE('#39'11/06/2012'#39','#39'DD/MM/YYYY'#39') '
      
        '                                              AND IDDOCDIVERGE I' +
        'S NOT NULL ) ) '
      '       ) CD,  '
      
        '       (  SELECT IDPARCFINANCIMOV, DATA, FLGTIPO,               ' +
        '   '
      '                 DECODE(FLGTIPO,'#39'M'#39', DECODE(QTDE,3,'#39'S'#39','#39'P'#39'), '
      '                                '#39'J'#39', DECODE(QTDE,3,'#39'S'#39','#39'P'#39'), '
      '                                '#39'C'#39', DECODE(QTDE,3,'#39'S'#39','#39'P'#39'), '
      
        '                                CONCILIADOC ) AS CONCILIADOC    ' +
        '   '
      '            FROM '
      
        '                 ( SELECT C.IDPARCFINANCIMOV,                   ' +
        '                '
      
        '                          DECODE(C.FLGTIPO, NULL, NULL,         ' +
        '                '
      
        '                                 '#39'R'#39', '#39'S'#39', '#39'T'#39', '#39'S'#39', '#39'M'#39','#39'P'#39','#39'J'#39 +
        ','#39'P'#39','#39'C'#39','#39'P'#39', '
      
        '                                 '#39'A'#39', '#39'C'#39', P.FLGCONCILIADO ) AS ' +
        'CONCILIADOC,'
      
        '                          MAX(C.DATA) AS DATA, MAX(C.FLGTIPO) AS' +
        ' FLGTIPO, COUNT(*) AS QTDE '
      
        '                     FROM CONCILIADOC C, PARCFINANCIMOV P       ' +
        '                '
      
        '                    WHERE C.IDPARCFINANCIMOV = P.IDPARCFINANCIMO' +
        'V               '
      
        '                      AND C.FLGTIPO IN('#39'R'#39','#39'T'#39', '#39'A'#39','#39'M'#39','#39'J'#39','#39'C'#39')' +
        '    '
      
        '                      AND C.DATA <=  TO_DATE('#39'11/06/2012'#39','#39'DD/MM' +
        '/YYYY'#39') '
      
        '                      AND ( C.FLGTIPO IN ('#39'T'#39','#39'R'#39') OR           ' +
        '            '
      
        '                            NOT EXISTS ( SELECT 1 FROM CONCILIAD' +
        'OC              '
      
        '                                          WHERE FLGTIPO IN ('#39'T'#39',' +
        #39'R'#39')        '
      
        '                                            AND IDPARCFINANCIMOV' +
        ' = C.IDPARCFINANCIMOV ) ) '
      
        '                    GROUP BY C.IDPARCFINANCIMOV,                ' +
        '                '
      
        '                             DECODE(C.FLGTIPO, NULL, NULL,      ' +
        '                '
      
        '                                 '#39'R'#39', '#39'S'#39', '#39'T'#39', '#39'S'#39', '#39'M'#39','#39'P'#39','#39'J'#39 +
        ','#39'P'#39','#39'C'#39','#39'P'#39', '
      
        '                                 '#39'A'#39', '#39'C'#39', P.FLGCONCILIADO ) ) )' +
        ' CD2,       '
      '       -- Foi criado o indice XIE1CONDPAGIMOVEL '
      '       ( SELECT A.IDCONDINICIAL  AS IDCONDINICIAL, '
      '                A.NUMPARCELAS    AS NUMPARCELAS,   '
      '                A.DATAINI,         '
      '                A.IDCONDPAGIMOVEL, '
      '                A.INDCORRECAO,     '
      '                A.MESREFREAJUSTE,  '
      '                DECODE(A.TIPOCONDPAG, '#39'V'#39', '#39'A Vista'#39', '
      '                                      '#39'S'#39', '#39'Sinal'#39',   '
      '                                      '#39'C'#39', '#39'Caução'#39',  '
      
        '                                      '#39'P'#39', '#39'Parcelamento'#39' ) AS T' +
        'IPOCONDPAG '
      '         FROM   CONDPAGIMOVEL A,                  '
      '                (SELECT   IDCONDINICIAL,          '
      '                          MAX(DATAINI) AS DATAINI '
      '                 FROM     CONDPAGIMOVEL           '
      '                 GROUP BY IDCONDINICIAL) B        '
      '         WHERE B.IDCONDINICIAL = A.IDCONDINICIAL  '
      '           AND B.DATAINI = A.DATAINI ) CPFINAL,   '
      '       -- Foi criado o indice XIE1IMOVEL          '
      '  --     ( SELECT DISTINCT      Rafael                    '
      '  --              CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL, '
      '  --              M.IMONOME            AS NOMEMESTRE,       '
      '  --              M.IDIMOVEL           AS IDIMOVEL          '
      '  --         FROM CONTRATOXIMOVEL CXI, '
      '  --              IMOVEL I,            '
      '  --              IMOVEL M             '
      '  --        WHERE CXI.IDIMOVEL = I.IDIMOVEL           '
      
        '  --         AND I.IDIMOVELMESTRE = M.IDIMOVEL ) IM, SIG 96396 R' +
        'afael '
      '       -- Foi criado o indice XIE2CONCILIADOC       '
      '       ( SELECT --LD.CODDOCUMENTO, T.CODTIPIMOVEL,    '
      '                P.IDPARCFINANCIMOV, T.CODTIPIMOVEL,  '
      
        '                SUM( DECODE(LD.DEBCRE,'#39'D'#39', LD.VALOR, (LD.VALOR *' +
        ' -1)) ) AS TOT_ALTERADOR '
      
        '           FROM LANCTODOCUM LD, DOCUMENTO D, PARAMALIENACAO PA, ' +
        '         '
      
        '                PARCFINANCIMOV P, CONDPAGIMOVEL C,  TIPOIMOVEL T' +
        ',        '
      
        '                ( SELECT DISTINCT C.IDCONTRATOIMOVEL, I.CODTIPIM' +
        'OVEL     '
      
        '                    FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI, ' +
        'IMOVEL I '
      
        '                   WHERE CXI.IDIMOVEL = I.IDIMOVEL              ' +
        '         '
      
        '                     AND CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOV' +
        'EL       '
      
        '                     AND C.FLGTIPOCONTRATO IN ('#39'C'#39','#39'A'#39','#39'P'#39') ) TC' +
        ' '
      '          WHERE RTRIM(LD.OPERACAO) = '#39'4'#39'                  '
      '            AND LD.CODALTERADOR <> PA.CODALTERADORCPMF      '
      '         AND (LD.CODALTERADOR <> PA.CODALTERADORADRES OR '
      
        '              LD.CODALTERADOR = PA.CODALTERADORADRES AND EXISTS ' +
        '(SELECT 1 '
      
        '                                                                ' +
        ' FROM CONCILIADOC '
      
        '                                                                ' +
        ' WHERE IDDOCUMENTO = LD.CODDOCUMENTO '
      
        '                                                                ' +
        '-- AND   NUMLANCTO   = LD.NUMLANCTO '
      
        '                                                                ' +
        ' AND   DATA        <=  TO_DATE('#39'11/06/2012'#39','#39'DD/MM/YYYY'#39') )) '
      '            AND PA.IDPESSOA = 1'
      '            AND LD.CODDOCUMENTO = D.CODDOCUMENTO            '
      '            AND D.CODDOCUMENTO = P.CODDOCUMENTO             '
      '            AND P.IDCONDPAGIMOVEL = C.IDCONDPAGIMOVEL       '
      '            AND C.IDCONTRATOIMOVEL = TC.IDCONTRATOIMOVEL    '
      '            AND TC.CODTIPIMOVEL = T.CODTIPIMOVEL            '
      
        '            AND LD.DATALANCTO <=  TO_DATE('#39'11/06/2012'#39','#39'DD/MM/YY' +
        'YY'#39') '
      '            AND ( PA.IDOPERATUALCM IS NULL OR               '
      '                  ( LD.CODALTERADOR <> T.CODALTCMAL AND     '
      '                    LD.CODALTERADOR <> T.CODALTJRAL AND     '
      '                    LD.CODALTERADOR <> T.CODALTMTAL ) )     '
      '            AND D.IDMODULO = 135                            '
      
        '          GROUP BY P.IDPARCFINANCIMOV, T.CODTIPIMOVEL /* LD.CODD' +
        'OCUMENTO, T.CODTIPIMOVEL */  )  ALT, '
      '       -- Foi criado o indice XIE9LANCTODOCUM '
      '       ( SELECT /*+ INDEX (D) INDEX(LD) */                  '
      '                LD.CODDOCUMENTO,                            '
      
        '                SUM( DECODE(LD.DEBCRE,'#39'D'#39', LD.VALOR, (LD.VALOR *' +
        ' -1)) ) AS TOT_CPMF '
      '           FROM LANCTODOCUM LD,                  '
      '                DOCUMENTO D                      '
      '          WHERE RTRIM(LD.OPERACAO) = '#39'4'#39'       '
      '            AND CODALTERADOR = 215               '
      '            AND LD.CODDOCUMENTO = D.CODDOCUMENTO '
      '            AND D.IDMODULO = 135                 '
      '          GROUP BY LD.CODDOCUMENTO  )  CPMF,     '
      '       -- Foi criado o indice XIE7LANCOPERDIAIMOB '
      
        '       ( SELECT D1.IDPARCFINANCIMOV, D1.DATAOPER, D1.VLRRESIDUOC' +
        'ORRIG                       '
      
        '           FROM ( SELECT L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.V' +
        'LRACUM) AS VLRRESIDUOCORRIG '
      
        '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P    ' +
        '                            '
      '                   WHERE P.IDPESSOA = 1'
      '                     AND L.IDMODULO = 135'
      
        '                     --AND ( L.IDOPERACAO = P.IDOPERATUALRES )  ' +
        '      '
      '                     AND ( L.IDOPERACAO = 166 )        '
      
        '                   GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,' +
        '    '
      
        '                ( SELECT L2.IDPARCFINANCIMOV, MAX(L2.DATAOPER) A' +
        'S DTAPUR '
      
        '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2  ' +
        '      '
      '                   WHERE P2.IDPESSOA = 1'
      '                     AND L2.IDMODULO = 135'
      
        '                     --AND ( L2.IDOPERACAO = P2.IDOPERATUALRES )' +
        '    '
      '                     AND ( L2.IDOPERACAO = 166 )    '
      
        '                     AND ( DATAOPER <=  TO_DATE('#39'11/06/2012'#39','#39'DD' +
        '/MM/YYYY'#39') )             '
      
        '                   GROUP BY L2.IDPARCFINANCIMOV ) D2            ' +
        '  '
      
        '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV       ' +
        '  '
      
        '            AND D1.DATAOPER = D2.DTAPUR                         ' +
        '  '
      '        ) AR, '
      '        -- Foi criado o indice XIE1PARCEXTRAIMOV '
      '        ( SELECT IDPARCCOBRADA, DATACOBRANCA AS DATACOBRES '
      '            FROM PARCEXTRAIMOV                             '
      '           WHERE FLGTIPOCOBRANCA = '#39'R'#39'                   '
      '         ) CR,                                             '
      '       -- Foi criado o indice XIE7LANCOPERDIAIMOB          '
      
        '       ( SELECT D1.IDPARCFINANCIMOV, SUM(D1.TOT_CORRECAO) AS TOT' +
        '_CORRECAO   '
      
        '           FROM ( SELECT L.IDPARCFINANCIMOV, L.DATAOPER, IDOPERA' +
        'CAO, SUM(L.VLRACUM) AS TOT_CORRECAO '
      
        '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P    ' +
        '            '
      
        '                   WHERE -- L.DATABAIXA IS NOT NULL  AND        ' +
        '                  '
      '                      L.IDMODULO = 135'
      '                     AND P.IDPESSOA = 1'
      
        '                     AND ( L.IDOPERACAO = P.IDOPERATUALMULTA OR ' +
        '            '
      
        '                           L.IDOPERACAO = P.IDOPERATUALJUROS OR ' +
        '            '
      
        '                           L.IDOPERACAO = P.IDOPERATUALCM )     ' +
        '            '
      
        '                   GROUP BY L.IDPARCFINANCIMOV, IDOPERACAO, L.DA' +
        'TAOPER ) D1,'
      
        '                ( SELECT L2.IDPARCFINANCIMOV, IDOPERACAO, MAX(L2' +
        '.DATAOPER) AS DTAPUR '
      
        '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2  ' +
        '      '
      '                   WHERE P2.IDPESSOA = 1'
      '                     AND L2.IDMODULO = 135'
      
        '                    -- AND DATABAIXA IS NOT NULL                ' +
        '        '
      
        '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA O' +
        'R    '
      
        '                           L2.IDOPERACAO = P2.IDOPERATUALJUROS O' +
        'R    '
      
        '                           L2.IDOPERACAO = P2.IDOPERATUALCM )   ' +
        '     '
      
        '                     AND ( DATAOPER <=  TO_DATE('#39'11/06/2012'#39','#39'DD' +
        '/MM/YYYY'#39') )                '
      
        '                   GROUP BY L2.IDPARCFINANCIMOV, IDOPERACAO ) D2' +
        ' '
      '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '            AND D1.DATAOPER = D2.DTAPUR                   '
      '            AND D1.IDOPERACAO = D2.IDOPERACAO             '
      '          GROUP BY D1.IDPARCFINANCIMOV                    '
      '       ) CO1,                                             '
      '       -- Foi criado o indice XIE7LANCOPERDIAIMOB  '
      
        '       ( SELECT D1.IDPARCFINANCIMOV, MAX(D2.DTAPUR) AS DTAPUR, S' +
        'UM(D1.TOT_CORRECAO) AS TOT_CORRECAO '
      '           FROM ( SELECT                                  '
      
        '   L.IDPARCFINANCIMOV, IDOPERACAO, DATABAIXA, L.DATAOPER, SUM(L.' +
        'VLRACUM) AS TOT_CORRECAO '
      
        '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P    ' +
        '            '
      '                   WHERE L.IDMODULO = 135'
      '                     AND P.IDPESSOA = 1'
      
        '                     AND ( L.IDOPERACAO = P.IDOPERATUALMULTA OR ' +
        '            '
      
        '                           L.IDOPERACAO = P.IDOPERATUALJUROS OR ' +
        '            '
      
        '                           L.IDOPERACAO = P.IDOPERATUALCM )     ' +
        '            '
      
        '                   GROUP BY L.IDPARCFINANCIMOV, IDOPERACAO, DATA' +
        'BAIXA, L.DATAOPER ) D1,            '
      
        '( SELECT L2.IDPARCFINANCIMOV,IDOPERACAO, DATABAIXA, MAX(L2.DATAO' +
        'PER) AS DTAPUR '
      
        '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2  ' +
        '      '
      '                   WHERE P2.IDPESSOA = 1'
      '                     AND L2.IDMODULO = 135'
      
        '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA O' +
        'R    '
      
        '                           L2.IDOPERACAO = P2.IDOPERATUALJUROS O' +
        'R    '
      
        '                           L2.IDOPERACAO = P2.IDOPERATUALCM )   ' +
        '     '
      
        '                     AND ( DATAOPER <=  TO_DATE('#39'11/06/2012'#39','#39'DD' +
        '/MM/YYYY'#39') )                '
      
        '  GROUP BY L2.IDPARCFINANCIMOV, L2.IDOPERACAO, L2.DATABAIXA ) D2' +
        ' '
      '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '            AND D1.DATAOPER = D2.DTAPUR                   '
      '            AND D1.IDOPERACAO = D2.IDOPERACAO             '
      
        '            AND NVL(D1.DATABAIXA,SYSDATE+1000) = NVL(D2.DATABAIX' +
        'A,SYSDATE+1000) '
      '          GROUP BY D1.IDPARCFINANCIMOV'
      '        ) CO2,  '
      '       -- Foi criado o indice XIE7LANCOPERDIAIMOB '
      
        '       ( SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.TOT_ABONO    ' +
        '         '
      
        '           FROM ( SELECT L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.V' +
        'LRACUM) AS TOT_ABONO '
      
        '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P    ' +
        '            '
      '                   WHERE L.IDMODULO = 135'
      '                     AND P.IDPESSOA = 1'
      
        '                     AND ( L.IDOPERACAO = P.IDOPERABONOMULTA OR ' +
        '            '
      
        '                           L.IDOPERACAO = P.IDOPERABONOJUROS OR ' +
        '            '
      
        '                           L.IDOPERACAO = P.IDOPERABONOCM )     ' +
        '            '
      
        '                   GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,' +
        '            '
      
        '                ( SELECT L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS' +
        ' DTAPUR '
      
        '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2  ' +
        '      '
      '                   WHERE P2.IDPESSOA = 1'
      '                     AND L2.IDMODULO = 135'
      
        '                     AND ( L2.IDOPERACAO = P2.IDOPERABONOMULTA O' +
        'R    '
      
        '                           L2.IDOPERACAO = P2.IDOPERABONOJUROS O' +
        'R    '
      
        '                           L2.IDOPERACAO = P2.IDOPERABONOCM )   ' +
        '     '
      
        '                     AND ( DATAOPER <=  TO_DATE('#39'11/06/2012'#39','#39'DD' +
        '/MM/YYYY'#39') )                '
      '                   GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '            AND D1.DATAOPER = D2.DTAPUR                   '
      '        ) ABONO                                          '
      '  WHERE (PF.FLGTIPOLANC IN (1,2,3,4,5,6,7,8,9,10,12))  '
      '    AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)      '
      '    AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)    '
      '    AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL)  '
      '    AND (P.IDPESSOA(+) = CI.IDLOCATARIO)               '
      '    AND (PP.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '
      '    AND (CO1.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)'
      '    AND (CO2.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)'
      '    AND (ABONO.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)'
      '    AND (AR.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '
      '    AND (CR.IDPARCCOBRADA(+)    = PF.IDPARCFINANCIMOV) '
      '    AND (CD.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)  '
      '    AND (CD2.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '
      
        '  --  AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL) SIG 963' +
        '96 Rafael '
      '--    AND (ALT.CODDOCUMENTO(+) = PF.CODDOCUMENTO)         '
      '    AND (ALT.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '
      '    AND (CPMF.CODDOCUMENTO(+) = PF.CODDOCUMENTO)        '
      
        '    AND ( (PF.DATAVENCIMENTO IS NULL) OR (PF.DATAVENCIMENTO <=  ' +
        'TO_DATE('#39'11/06/2012'#39','#39'DD/MM/YYYY'#39') ) OR '
      
        '          (PP.DATAPAGAMENTO <=  TO_DATE('#39'11/06/2012'#39','#39'DD/MM/YYYY' +
        #39') ) )'
      ' AND EXISTS (SELECT 1 '
      '               FROM CONTRATOXIMOVEL CXI, '
      '                    PLANOPATROXIMOVEL PPI '
      
        '              WHERE -- CXI.IDCONTRATOIMOVEL(+) = IM.IDCONTRATOIM' +
        'OVE AN L '
      
        '                D CXI.IDIMOVEL = PPI.IDIMOVEL ) ORDER BY CI.CONN' +
        'UMERO, PF.IDCONDPAGIMOVEL,PF.FLGTIPOLANC,to_number(NUMPARCELAORD' +
        'EM),  DATAVENCIMENTO ')
    UpdateObject = updExtratoNovo
    ValidateWithMask = True
    Left = 434
    Top = 163
    object qryExtratoNovoIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
    end
    object qryExtratoNovoIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryExtratoNovoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryExtratoNovoCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryExtratoNovoCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 100
    end
    object qryExtratoNovoVLRPROPOSTA: TFloatField
      FieldName = 'VLRPROPOSTA'
    end
    object qryExtratoNovoCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
    end
    object qryExtratoNovoIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
    end
    object qryExtratoNovoIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object qryExtratoNovoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryExtratoNovoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryExtratoNovoNOMEMESTRE: TStringField
      FieldName = 'NOMEMESTRE'
      Size = 100
    end
    object qryExtratoNovoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryExtratoNovoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryExtratoNovoTOT_ALTERADOR: TFloatField
      FieldName = 'TOT_ALTERADOR'
    end
    object qryExtratoNovoTOT_CPMF: TFloatField
      FieldName = 'TOT_CPMF'
    end
    object qryExtratoNovoNUMDOC: TFloatField
      FieldName = 'NUMDOC'
    end
    object qryExtratoNovoNUMPARC: TFloatField
      FieldName = 'NUMPARC'
    end
    object qryExtratoNovoNUMPARCELA: TStringField
      FieldName = 'NUMPARCELA'
      Size = 81
    end
    object qryExtratoNovoDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryExtratoNovoMESANO_VENCIMENTO: TStringField
      FieldName = 'MESANO_VENCIMENTO'
      Size = 6
    end
    object qryExtratoNovoMESANO_CALCULO: TStringField
      FieldName = 'MESANO_CALCULO'
      FixedChar = True
      Size = 6
    end
    object qryExtratoNovoIDCORR_CONDPAG: TFloatField
      FieldName = 'IDCORR_CONDPAG'
    end
    object qryExtratoNovoMESREF_CONDPAG: TFloatField
      FieldName = 'MESREF_CONDPAG'
    end
    object qryExtratoNovoTIPOCONDPAG: TStringField
      FieldName = 'TIPOCONDPAG'
      Size = 12
    end
    object qryExtratoNovoNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryExtratoNovoVLRPRESTACAO: TFloatField
      FieldName = 'VLRPRESTACAO'
    end
    object qryExtratoNovoVLRNOMINAL: TFloatField
      FieldName = 'VLRNOMINAL'
    end
    object qryExtratoNovoTOT_DEVIDO: TFloatField
      FieldName = 'TOT_DEVIDO'
    end
    object qryExtratoNovoVLRJUROS: TFloatField
      FieldName = 'VLRJUROS'
    end
    object qryExtratoNovoVLRAMORTIZACAO: TFloatField
      FieldName = 'VLRAMORTIZACAO'
    end
    object qryExtratoNovoVLRSALDODEVEDOR: TFloatField
      FieldName = 'VLRSALDODEVEDOR'
    end
    object qryExtratoNovoVLRSALDOATUAL: TFloatField
      FieldName = 'VLRSALDOATUAL'
    end
    object qryExtratoNovoVLRPRESTATUALIZADA: TFloatField
      FieldName = 'VLRPRESTATUALIZADA'
    end
    object qryExtratoNovoVLRRESIDUO: TFloatField
      FieldName = 'VLRRESIDUO'
    end
    object qryExtratoNovoVLRRESIDUOATUALI: TFloatField
      FieldName = 'VLRRESIDUOATUALI'
    end
    object qryExtratoNovoVLRRESIDUOCORRIG: TFloatField
      FieldName = 'VLRRESIDUOCORRIG'
    end
    object qryExtratoNovoDATACOBRES: TDateTimeField
      FieldName = 'DATACOBRES'
    end
    object qryExtratoNovoIDINDCORRECAO: TFloatField
      FieldName = 'IDINDCORRECAO'
    end
    object qryExtratoNovoVLRCORRIGIDOATRASO: TFloatField
      FieldName = 'VLRCORRIGIDOATRASO'
    end
    object qryExtratoNovoVLRMULTAATRASO: TFloatField
      FieldName = 'VLRMULTAATRASO'
    end
    object qryExtratoNovoVLRMORAATRASO: TFloatField
      FieldName = 'VLRMORAATRASO'
    end
    object qryExtratoNovoFLGRESIDUOINCORP: TStringField
      FieldName = 'FLGRESIDUOINCORP'
      Size = 1
    end
    object qryExtratoNovoFLGTIPOLANC: TFloatField
      FieldName = 'FLGTIPOLANC'
    end
    object qryExtratoNovoFLGLANCINTEGRA: TFloatField
      FieldName = 'FLGLANCINTEGRA'
    end
    object qryExtratoNovoDATALIMITE: TDateTimeField
      FieldName = 'DATALIMITE'
    end
    object qryExtratoNovoDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
    end
    object qryExtratoNovoVLRPAGO: TFloatField
      FieldName = 'VLRPAGO'
    end
    object qryExtratoNovoFLGCONCILIADO: TStringField
      FieldName = 'FLGCONCILIADO'
      Size = 1
    end
    object qryExtratoNovoIDREPACTUA: TFloatField
      FieldName = 'IDREPACTUA'
    end
    object qryExtratoNovoIDDOCDIVERGE: TStringField
      FieldName = 'IDDOCDIVERGE'
      Size = 1
    end
    object qryExtratoNovoDATA_BASE: TDateTimeField
      FieldName = 'DATA_BASE'
    end
    object qryExtratoNovoDATA_CORRECAO: TDateTimeField
      FieldName = 'DATA_CORRECAO'
    end
    object qryExtratoNovoVLRDIF: TFloatField
      FieldName = 'VLRDIF'
    end
    object qryExtratoNovoVLRCORRIG: TFloatField
      FieldName = 'VLRCORRIG'
    end
    object qryExtratoNovoNUMPARCELAORDEM: TStringField
      FieldName = 'NUMPARCELAORDEM'
      Size = 50
    end
    object qryExtratoNovoStatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'Status'
      Calculated = True
    end
    object qryExtratoNovoCal_Tipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'Cal_Tipo'
      Calculated = True
    end
    object qryExtratoNovoCal_Abono: TStringField
      FieldKind = fkCalculated
      FieldName = 'Cal_Abono'
      Calculated = True
    end
    object qryExtratoNovoSaldo_Documento: TStringField
      FieldKind = fkCalculated
      FieldName = 'Saldo_Documento'
      Calculated = True
    end
    object qryExtratoNovoTotSaldo_Documento: TStringField
      FieldKind = fkCalculated
      FieldName = 'TotSaldo_Documento'
      Size = 30
      Calculated = True
    end
    object qryExtratoNovoAtualizacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'Atualizacao'
      Size = 30
      Calculated = True
    end
    object qryExtratoNovoPrestAlteAtul: TStringField
      FieldKind = fkCalculated
      FieldName = 'PrestAlteAtul'
      Size = 30
      Calculated = True
    end
    object qryExtratoNovoSTATUS_CS: TStringField
      FieldName = 'STATUS_CS'
      Size = 7
    end
    object qryExtratoNovoATUALIZACAO_CS: TFloatField
      FieldName = 'ATUALIZACAO_CS'
    end
    object qryExtratoNovoSALDO_DOCUMENTO_CS: TFloatField
      FieldName = 'SALDO_DOCUMENTO_CS'
    end
  end
  object updExtratoNovo: TUpdateSQL
    Left = 435
    Top = 205
  end
  object updSegregNovo: TUpdateSQL
    ModifySQL.Strings = (
      'update PLANOPATROXIMOVEL'
      'set'
      '  VALOR = :VALOR'
      'where'
      '  PATRO = :OLD_PATRO')
    InsertSQL.Strings = (
      'insert into PLANOPATROXIMOVEL'
      '  (VALOR)'
      'values'
      '  (:VALOR)')
    DeleteSQL.Strings = (
      'delete from PLANOPATROXIMOVEL'
      'where'
      '  PATRO = :OLD_PATRO')
    Left = 528
    Top = 192
  end
  object dsExtratoNovo: TwwDataSource
    DataSet = qryExtratoNovo
    Left = 436
    Top = 250
  end
  object qrySegregNovo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CTI.IDCONTRATOIMOVEL,'
      '       PES.NOME AS PATRO,'
      '       PPC.NOME AS PLANOPREV,'
      
        '       SUM((PPI.PERCENTRATEIO * 100) / PT.PERCENTRATEIO) AS PERC' +
        'ENTRATEIO,'
      '       0 AS VALOR'
      '  FROM PLANOPATROXVIGENCIAIMOB PPI,'
      '       CONTRATOXIMOVEL CXI,'
      '       PESSOA PES,'
      '       PLANPREVCONTABIL PPC,'
      '       CONTRATOIMOVEL CTI,'
      '       (SELECT SUM(PPI.PERCENTRATEIO) AS PERCENTRATEIO'
      '          FROM PLANOPATROXVIGENCIAIMOB PPI,'
      '               CONTRATOXIMOVEL   CXI,'
      '               CONTRATOIMOVEL    CTI'
      '         WHERE 1=2'
      '           AND CXI.IDCONTRATOIMOVEL = CTI.IDCONTRATOIMOVEL'
      '           AND PPI.IDIMOVEL = CXI.IDIMOVEL) PT'
      ' WHERE 1=2'
      
        '   AND PPI.DATAVIGENCIA = (SELECT MAX(PPV.DATAVIGENCIA) FROM PLA' +
        'NOPATROXVIGENCIAIMOB PPV'
      '                            WHERE 1=2  )'
      '   AND CXI.IDCONTRATOIMOVEL = CTI.IDCONTRATOIMOVEL'
      '   AND PPI.IDIMOVEL = CXI.IDIMOVEL'
      '   AND PPI.IDPATRO = PES.IDPESSOA'
      '   AND PPI.IDPLANOPREV = PPC.IDPLANOPREV'
      
        ' GROUP BY  CTI.IDCONTRATOIMOVEL, PES.NOME, PPC.NOME,PT.PERCENTRA' +
        'TEIO'
      ' ORDER BY PERCENTRATEIO DESC'
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updSegregNovo
    ValidateWithMask = True
    Left = 528
    Top = 152
    object StringField15: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object StringField16: TStringField
      FieldName = 'PLANOPREV'
      Size = 50
    end
    object FloatField36: TFloatField
      FieldName = 'PERCENTRATEIO'
    end
    object FloatField37: TFloatField
      FieldName = 'VALOR'
      currency = True
    end
  end
  object dsSegregExtratoNovo: TwwDataSource
    DataSet = qrySegregNovo
    Left = 528
    Top = 240
  end
  object pplExtratoNovo: TppBDEPipeline
    DataSource = dsExtratoNovo
    UserName = 'lExtratoNovo'
    Left = 442
    Top = 106
    object pplExtratoNovoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPARCFINANCIMOV'
      FieldName = 'IDPARCFINANCIMOV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplExtratoNovoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONDPAGIMOVEL'
      FieldName = 'IDCONDPAGIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplExtratoNovoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplExtratoNovoppField4: TppField
      FieldAlias = 'CONNUMERO'
      FieldName = 'CONNUMERO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 3
    end
    object pplExtratoNovoppField5: TppField
      FieldAlias = 'CONNOME'
      FieldName = 'CONNOME'
      FieldLength = 100
      DisplayWidth = 100
      Position = 4
    end
    object pplExtratoNovoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPROPOSTA'
      FieldName = 'VLRPROPOSTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplExtratoNovoppField7: TppField
      FieldAlias = 'CONDATAINICIO'
      FieldName = 'CONDATAINICIO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object pplExtratoNovoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCIDADES'
      FieldName = 'IDCIDADES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplExtratoNovoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPAIS'
      FieldName = 'IDPAIS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplExtratoNovoppField10: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 9
    end
    object pplExtratoNovoppField11: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 10
    end
    object pplExtratoNovoppField12: TppField
      FieldAlias = 'NOMEMESTRE'
      FieldName = 'NOMEMESTRE'
      FieldLength = 100
      DisplayWidth = 100
      Position = 11
    end
    object pplExtratoNovoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplExtratoNovoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplExtratoNovoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_ALTERADOR'
      FieldName = 'TOT_ALTERADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplExtratoNovoppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_CPMF'
      FieldName = 'TOT_CPMF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplExtratoNovoppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMDOC'
      FieldName = 'NUMDOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplExtratoNovoppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMPARC'
      FieldName = 'NUMPARC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplExtratoNovoppField19: TppField
      FieldAlias = 'NUMPARCELA'
      FieldName = 'NUMPARCELA'
      FieldLength = 81
      DisplayWidth = 81
      Position = 18
    end
    object pplExtratoNovoppField20: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 19
    end
    object pplExtratoNovoppField21: TppField
      FieldAlias = 'MESANO_VENCIMENTO'
      FieldName = 'MESANO_VENCIMENTO'
      FieldLength = 6
      DisplayWidth = 6
      Position = 20
    end
    object pplExtratoNovoppField22: TppField
      FieldAlias = 'MESANO_CALCULO'
      FieldName = 'MESANO_CALCULO'
      FieldLength = 6
      DisplayWidth = 6
      Position = 21
    end
    object pplExtratoNovoppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCORR_CONDPAG'
      FieldName = 'IDCORR_CONDPAG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplExtratoNovoppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'MESREF_CONDPAG'
      FieldName = 'MESREF_CONDPAG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplExtratoNovoppField25: TppField
      FieldAlias = 'TIPOCONDPAG'
      FieldName = 'TIPOCONDPAG'
      FieldLength = 12
      DisplayWidth = 12
      Position = 24
    end
    object pplExtratoNovoppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMPARCELAS'
      FieldName = 'NUMPARCELAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplExtratoNovoppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPRESTACAO'
      FieldName = 'VLRPRESTACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplExtratoNovoppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRNOMINAL'
      FieldName = 'VLRNOMINAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object pplExtratoNovoppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_DEVIDO'
      FieldName = 'TOT_DEVIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object pplExtratoNovoppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRJUROS'
      FieldName = 'VLRJUROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object pplExtratoNovoppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRAMORTIZACAO'
      FieldName = 'VLRAMORTIZACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object pplExtratoNovoppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRSALDODEVEDOR'
      FieldName = 'VLRSALDODEVEDOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object pplExtratoNovoppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRSALDOATUAL'
      FieldName = 'VLRSALDOATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object pplExtratoNovoppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPRESTATUALIZADA'
      FieldName = 'VLRPRESTATUALIZADA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object pplExtratoNovoppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRESIDUO'
      FieldName = 'VLRRESIDUO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object pplExtratoNovoppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRESIDUOATUALI'
      FieldName = 'VLRRESIDUOATUALI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object pplExtratoNovoppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRESIDUOCORRIG'
      FieldName = 'VLRRESIDUOCORRIG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object pplExtratoNovoppField38: TppField
      FieldAlias = 'DATACOBRES'
      FieldName = 'DATACOBRES'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 37
    end
    object pplExtratoNovoppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINDCORRECAO'
      FieldName = 'IDINDCORRECAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object pplExtratoNovoppField40: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCORRIGIDOATRASO'
      FieldName = 'VLRCORRIGIDOATRASO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 39
    end
    object pplExtratoNovoppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMULTAATRASO'
      FieldName = 'VLRMULTAATRASO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 40
    end
    object pplExtratoNovoppField42: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMORAATRASO'
      FieldName = 'VLRMORAATRASO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 41
    end
    object pplExtratoNovoppField43: TppField
      FieldAlias = 'FLGRESIDUOINCORP'
      FieldName = 'FLGRESIDUOINCORP'
      FieldLength = 1
      DisplayWidth = 1
      Position = 42
    end
    object pplExtratoNovoppField44: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGTIPOLANC'
      FieldName = 'FLGTIPOLANC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 43
    end
    object pplExtratoNovoppField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGLANCINTEGRA'
      FieldName = 'FLGLANCINTEGRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 44
    end
    object pplExtratoNovoppField46: TppField
      FieldAlias = 'DATALIMITE'
      FieldName = 'DATALIMITE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 45
    end
    object pplExtratoNovoppField47: TppField
      FieldAlias = 'DATAPAGAMENTO'
      FieldName = 'DATAPAGAMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 46
    end
    object pplExtratoNovoppField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPAGO'
      FieldName = 'VLRPAGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 47
    end
    object pplExtratoNovoppField49: TppField
      FieldAlias = 'FLGCONCILIADO'
      FieldName = 'FLGCONCILIADO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 48
    end
    object pplExtratoNovoppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDREPACTUA'
      FieldName = 'IDREPACTUA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 49
    end
    object pplExtratoNovoppField51: TppField
      FieldAlias = 'IDDOCDIVERGE'
      FieldName = 'IDDOCDIVERGE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 50
    end
    object pplExtratoNovoppField52: TppField
      FieldAlias = 'DATA_BASE'
      FieldName = 'DATA_BASE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 51
    end
    object pplExtratoNovoppField53: TppField
      FieldAlias = 'DATA_CORRECAO'
      FieldName = 'DATA_CORRECAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 52
    end
    object pplExtratoNovoppField54: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRDIF'
      FieldName = 'VLRDIF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 53
    end
    object pplExtratoNovoppField55: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCORRIG'
      FieldName = 'VLRCORRIG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 54
    end
    object pplExtratoNovoppField56: TppField
      FieldAlias = 'NUMPARCELAORDEM'
      FieldName = 'NUMPARCELAORDEM'
      FieldLength = 50
      DisplayWidth = 80
      Position = 55
    end
    object pplExtratoNovoppField57: TppField
      FieldAlias = 'Status'
      FieldName = 'Status'
      FieldLength = 20
      DisplayWidth = 20
      Position = 56
    end
    object pplExtratoNovoppField58: TppField
      FieldAlias = 'Cal_Tipo'
      FieldName = 'Cal_Tipo'
      FieldLength = 20
      DisplayWidth = 20
      Position = 57
    end
    object pplExtratoNovoppField59: TppField
      FieldAlias = 'Cal_Abono'
      FieldName = 'Cal_Abono'
      FieldLength = 20
      DisplayWidth = 20
      Position = 58
    end
    object pplExtratoNovoppField60: TppField
      FieldAlias = 'Saldo_Documento'
      FieldName = 'Saldo_Documento'
      FieldLength = 20
      DisplayWidth = 20
      Position = 59
    end
    object pplExtratoNovoppField61: TppField
      FieldAlias = 'TotSaldo_Documento'
      FieldName = 'TotSaldo_Documento'
      FieldLength = 30
      DisplayWidth = 30
      Position = 60
    end
    object pplExtratoNovoppField62: TppField
      FieldAlias = 'Atualizacao'
      FieldName = 'Atualizacao'
      FieldLength = 30
      DisplayWidth = 30
      Position = 61
    end
    object pplExtratoNovoppField63: TppField
      FieldAlias = 'PrestAlteAtul'
      FieldName = 'PrestAlteAtul'
      FieldLength = 30
      DisplayWidth = 30
      Position = 62
    end
  end
  object pplSegregExtratoNovo: TppDBPipeline
    DataSource = dsSegregExtratoNovo
    SkipWhenNoRecords = False
    UserName = 'lSegregExtrato1'
    Left = 537
    Top = 99
    MasterDataPipelineName = 'pplExtratoNovo'
    object pplSegregExtratoNovoppField1: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplSegregExtratoNovoppField2: TppField
      FieldAlias = 'PLANOPREV'
      FieldName = 'PLANOPREV'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object pplSegregExtratoNovoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTRATEIO'
      FieldName = 'PERCENTRATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplSegregExtratoNovoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
  end
  object rpExtratoNovo: TppReport
    AutoStop = False
    DataPipeline = pplExtratoNovo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    BeforePrint = ppGroupFooterBand12AfterPrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 722
    Top = 122
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplExtratoNovo'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17463
      mmPrintPosition = 0
      object ppTituloExtratoNovo: TppLabel
        UserName = 'ppTituloExtrato'
        AutoSize = False
        Caption = 'Extrato de Alienação - NOVO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8467
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel156: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284428
        BandType = 0
      end
    end
    object ppDetailBand13: TppDetailBand
      BeforePrint = ppDetailBand13BeforePrint
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppLine34: TppLine
        OnPrint = pplnSeparadorPrint
        UserName = 'lSeparador3'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppShape13: TppShape
        OnPrint = ppsCorPrint
        UserName = 'sCor3'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText115: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'NUMPARCELA'
        DataPipeline = pplExtratoNovo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtratoNovo'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText116: TppDBText
        UserName = 'DBText10'
        DataField = 'DATAVENCIMENTO'
        DataPipeline = pplExtratoNovo
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplExtratoNovo'
        mmHeight = 3704
        mmLeft = 11642
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText118: TppDBText
        UserName = 'DBText13'
        BlankWhenZero = True
        DataField = 'VLRAMORTIZACAO'
        DataPipeline = pplExtratoNovo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtratoNovo'
        mmHeight = 3704
        mmLeft = 85990
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText119: TppDBText
        UserName = 'DBText14'
        BlankWhenZero = True
        DataField = 'VLRSALDOATUAL'
        DataPipeline = pplExtratoNovo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtratoNovo'
        mmHeight = 3704
        mmLeft = 65617
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText120: TppDBText
        UserName = 'DBText27'
        DataField = 'DATAPAGAMENTO'
        DataPipeline = pplExtratoNovo
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtratoNovo'
        mmHeight = 3704
        mmLeft = 190500
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText121: TppDBText
        UserName = 'DBText38'
        BlankWhenZero = True
        DataField = 'VLRPAGO'
        DataPipeline = pplExtratoNovo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtratoNovo'
        mmHeight = 3704
        mmLeft = 206905
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText122: TppDBText
        UserName = 'dbtTipo'
        DataField = 'CAL_TIPO'
        DataPipeline = pplExtratoNovo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplExtratoNovo'
        mmHeight = 3704
        mmLeft = 41540
        mmTop = 0
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText124: TppDBText
        UserName = 'DBText43'
        OnGetText = ppDBText124GetText
        BlankWhenZero = True
        DataField = 'Saldo_Documento'
        DataPipeline = pplExtratoNovo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtratoNovo'
        mmHeight = 3704
        mmLeft = 228865
        mmTop = 0
        mmWidth = 18255
        BandType = 4
      end
      object ppDBText125: TppDBText
        UserName = 'dbtTipo1'
        DataField = 'Status'
        DataPipeline = pplExtratoNovo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplExtratoNovo'
        mmHeight = 3704
        mmLeft = 247915
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText126: TppDBText
        UserName = 'DBText1'
        BlankWhenZero = True
        DataField = 'TOT_ALTERADOR'
        DataPipeline = pplExtratoNovo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtratoNovo'
        mmHeight = 3704
        mmLeft = 120121
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText127: TppDBText
        UserName = 'DBText2'
        OnGetText = ppDBText117GetText
        BlankWhenZero = True
        DataField = 'PrestAlteAtul'
        DataPipeline = pplExtratoNovo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtratoNovo'
        mmHeight = 3704
        mmLeft = 156104
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText128: TppDBText
        UserName = 'DBText8'
        DataField = 'DATALIMITE'
        DataPipeline = pplExtratoNovo
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtratoNovo'
        mmHeight = 3704
        mmLeft = 174361
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText130: TppDBText
        UserName = 'DBText94'
        BlankWhenZero = True
        DataField = 'NUMDOC'
        DataPipeline = pplExtratoNovo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtratoNovo'
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText117: TppDBText
        UserName = 'DBText117'
        OnGetText = ppDBText117GetText
        BlankWhenZero = True
        DataField = 'Atualizacao'
        DataPipeline = pplExtratoNovo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtratoNovo'
        mmHeight = 3704
        mmLeft = 137054
        mmTop = 0
        mmWidth = 16670
        BandType = 4
      end
      object ppDBText123: TppDBText
        UserName = 'DBText123'
        DataField = 'Cal_Abono'
        DataPipeline = pplExtratoNovo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplExtratoNovo'
        mmHeight = 3704
        mmLeft = 264319
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText129: TppDBText
        UserName = 'DBText129'
        BlankWhenZero = True
        DataField = 'VLRPRESTACAO'
        DataPipeline = pplExtratoNovo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtratoNovo'
        mmHeight = 3704
        mmLeft = 102923
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
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
        mmWidth = 284163
        BandType = 8
      end
      object ppLine35: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel157: TppLabel
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
        mmWidth = 283898
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 256382
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup14: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplExtratoNovo
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplExtratoNovo'
      object ppGroupHeaderBand12: TppGroupHeaderBand
        AfterPrint = ppGroupHeaderBand12AfterPrint
        BeforePrint = ppGroupHeaderBand12BeforePrint
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 37571
        mmPrintPosition = 0
        object ppRegion10: TppRegion
          UserName = 'Region1'
          Brush.Style = bsClear
          Stretch = True
          Transparent = True
          mmHeight = 20108
          mmLeft = 0
          mmTop = 2381
          mmWidth = 284163
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel158: TppLabel
            UserName = 'Label31'
            Caption = 'Contrato:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 1588
            mmTop = 3704
            mmWidth = 15875
            BandType = 3
            GroupNo = 0
          end
          object ppDBText131: TppDBText
            UserName = 'DBText18'
            AutoSize = True
            DataField = 'CONNUMERO'
            DataPipeline = pplExtratoNovo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplExtratoNovo'
            mmHeight = 4022
            mmLeft = 29898
            mmTop = 3969
            mmWidth = 23453
            BandType = 3
            GroupNo = 0
          end
          object ppDBText132: TppDBText
            UserName = 'DBText19'
            DataField = 'CONNOME'
            DataPipeline = pplExtratoNovo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplExtratoNovo'
            mmHeight = 3969
            mmLeft = 54240
            mmTop = 3969
            mmWidth = 141023
            BandType = 3
            GroupNo = 0
          end
          object ppLabel159: TppLabel
            UserName = 'Label32'
            Caption = 'Valor da  Venda:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3175
            mmLeft = 54504
            mmTop = 10319
            mmWidth = 22225
            BandType = 3
            GroupNo = 0
          end
          object ppDBText152: TppDBText
            UserName = 'DBText20'
            DataField = 'VLRPROPOSTA'
            DataPipeline = pplExtratoNovo
            DisplayFormat = '#,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtratoNovo'
            mmHeight = 3175
            mmLeft = 82286
            mmTop = 10319
            mmWidth = 17198
            BandType = 3
            GroupNo = 0
          end
          object ppLabel160: TppLabel
            UserName = 'Label37'
            AutoSize = False
            Caption = 'Data da Proposta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3704
            mmLeft = 1588
            mmTop = 10319
            mmWidth = 25400
            BandType = 3
            GroupNo = 0
          end
          object ppDBText153: TppDBText
            UserName = 'DBText25'
            DataField = 'CONDATAINICIO'
            DataPipeline = pplExtratoNovo
            DisplayFormat = 'dd/mm/yyyy'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplExtratoNovo'
            mmHeight = 3175
            mmLeft = 29898
            mmTop = 10319
            mmWidth = 19579
            BandType = 3
            GroupNo = 0
          end
          object ppLabel161: TppLabel
            UserName = 'Label38'
            Caption = 'Comprador:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 1588
            mmTop = 16669
            mmWidth = 16140
            BandType = 3
            GroupNo = 0
          end
          object ppDBText154: TppDBText
            UserName = 'DBText26'
            AutoSize = True
            DataField = 'RAZAOSOCIAL'
            DataPipeline = pplExtratoNovo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplExtratoNovo'
            mmHeight = 3260
            mmLeft = 29898
            mmTop = 16669
            mmWidth = 20193
            BandType = 3
            GroupNo = 0
          end
        end
        object ppRegion14: TppRegion
          UserName = 'Region14'
          Caption = 'Region14'
          Stretch = True
          mmHeight = 9790
          mmLeft = 0
          mmTop = 25929
          mmWidth = 220663
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppSubReport9: TppSubReport
            UserName = 'SubReport9'
            ExpandAll = False
            NewPrintJob = False
            OutlineSettings.CreateNode = True
            TraverseAllData = False
            DataPipelineName = 'pplCondExtratoNovo'
            mmHeight = 5027
            mmLeft = 0
            mmTop = 27252
            mmWidth = 220663
            BandType = 3
            GroupNo = 0
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            object ppChildReport10: TppChildReport
              AutoStop = False
              DataPipeline = pplCondExtratoNovo
              PrinterSetup.BinName = 'Default'
              PrinterSetup.DocumentName = 'PpModeloReport1'
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
              Left = 496
              Top = 248
              Version = '7.04'
              mmColumnWidth = 0
              DataPipelineName = 'pplCondExtratoNovo'
              object ppTitleBand10: TppTitleBand
                mmBottomOffset = 0
                mmHeight = 5292
                mmPrintPosition = 0
                object ppLabel155: TppLabel
                  UserName = 'Label155'
                  AutoSize = False
                  Caption = 'Tipo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3386
                  mmLeft = 2646
                  mmTop = 0
                  mmWidth = 21167
                  BandType = 1
                end
                object ppLabel171: TppLabel
                  UserName = 'Label171'
                  AutoSize = False
                  Caption = 'Valor'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3386
                  mmLeft = 27252
                  mmTop = 0
                  mmWidth = 24606
                  BandType = 1
                end
                object ppLabel172: TppLabel
                  UserName = 'Label172'
                  AutoSize = False
                  Caption = 'Nº Parc'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3386
                  mmLeft = 55827
                  mmTop = 0
                  mmWidth = 16404
                  BandType = 1
                end
                object ppLabel163: TppLabel
                  UserName = 'Label163'
                  AutoSize = False
                  Caption = 'Forma de Calculo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3386
                  mmLeft = 74877
                  mmTop = 0
                  mmWidth = 39952
                  BandType = 1
                end
                object ppLine38: TppLine
                  UserName = 'Line38'
                  Weight = 0.75
                  mmHeight = 794
                  mmLeft = 2381
                  mmTop = 4233
                  mmWidth = 218282
                  BandType = 1
                end
              end
              object ppDetailBand17: TppDetailBand
                mmBottomOffset = 0
                mmHeight = 3704
                mmPrintPosition = 0
                object ppDBText162: TppDBText
                  UserName = 'DBText162'
                  DataField = 'CAL_TIPO'
                  DataPipeline = pplCondExtratoNovo
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  DataPipelineName = 'pplCondExtratoNovo'
                  mmHeight = 3259
                  mmLeft = 2646
                  mmTop = 0
                  mmWidth = 21696
                  BandType = 4
                end
                object ppDBText164: TppDBText
                  UserName = 'DBText164'
                  DataField = 'VLRFINANC'
                  DataPipeline = pplCondExtratoNovo
                  DisplayFormat = '#,##0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  DataPipelineName = 'pplCondExtratoNovo'
                  mmHeight = 3259
                  mmLeft = 26723
                  mmTop = 0
                  mmWidth = 24871
                  BandType = 4
                end
                object ppDBText165: TppDBText
                  UserName = 'DBText165'
                  DataField = 'NUMPARCELAS'
                  DataPipeline = pplCondExtratoNovo
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  DataPipelineName = 'pplCondExtratoNovo'
                  mmHeight = 3259
                  mmLeft = 55563
                  mmTop = 0
                  mmWidth = 16669
                  BandType = 4
                end
                object ppDBText163: TppDBText
                  UserName = 'DBText163'
                  DataField = 'cal_forma'
                  DataPipeline = pplCondExtratoNovo
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  DataPipelineName = 'pplCondExtratoNovo'
                  mmHeight = 3259
                  mmLeft = 75406
                  mmTop = 0
                  mmWidth = 145786
                  BandType = 4
                end
              end
              object ppSummaryBand14: TppSummaryBand
                mmBottomOffset = 0
                mmHeight = 4498
                mmPrintPosition = 0
              end
              object raCodeModule7: TraCodeModule
                ProgramStream = {00}
              end
            end
          end
        end
        object ppLabel229: TppLabel
          UserName = 'Label229'
          Caption = 'Condição de Pagto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 22225
          mmWidth = 31877
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand12: TppGroupFooterBand
        AfterPrint = ppGroupFooterBand12AfterPrint
        BeforePrint = ppGroupFooterBand12BeforePrint
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 66940
        mmPrintPosition = 0
        object ppRegion11: TppRegion
          UserName = 'Region2'
          mmHeight = 50800
          mmLeft = 0
          mmTop = 8467
          mmWidth = 91017
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object pplSaldoDevNovo: TppLabel
            UserName = 'lSaldoDev'
            AutoSize = False
            Caption = 'Saldo Devedor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 2910
            mmTop = 13758
            mmWidth = 57679
            BandType = 5
            GroupNo = 0
          end
          object ppLabel164: TppLabel
            UserName = 'Label35'
            Caption = 'Prestações em Atraso'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 2910
            mmTop = 24342
            mmWidth = 26723
            BandType = 5
            GroupNo = 0
          end
          object ppLabel165: TppLabel
            UserName = 'Label36'
            Caption = 'Divergências de Pagamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 2910
            mmTop = 29898
            mmWidth = 33867
            BandType = 5
            GroupNo = 0
          end
          object iAtrasoNovo: TppVariable
            UserName = 'iAtrasoNovo'
            AutoSize = False
            CalcOrder = 0
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetComponent = ppGroupHeaderBand12
            ResetType = veGroupStart
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 61648
            mmTop = 24342
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object ppLabel166: TppLabel
            UserName = 'Label104'
            Caption = 'Saldo Devedor Total'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 2646
            mmTop = 51858
            mmWidth = 34131
            BandType = 5
            GroupNo = 0
          end
          object iSaldoTotNovo: TppVariable
            UserName = 'iSaldoTotNovo'
            AutoSize = False
            CalcOrder = 1
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            ResetComponent = ppGroupHeaderBand12
            ResetType = veGroupStart
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 4233
            mmLeft = 61383
            mmTop = 51858
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object iDivergNovo: TppVariable
            UserName = 'iDivergNovo'
            AutoSize = False
            CalcOrder = 2
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetComponent = ppGroupHeaderBand12
            ResetType = veGroupStart
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 61648
            mmTop = 29898
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object iResiduoNovo: TppVariable
            UserName = 'iResiduoNovo'
            AutoSize = False
            CalcOrder = 3
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetComponent = ppGroupHeaderBand12
            ResetType = veGroupStart
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 37306
            mmTop = 40746
            mmWidth = 21960
            BandType = 5
            GroupNo = 0
          end
          object ppLabel167: TppLabel
            UserName = 'Label107'
            Caption = 'Resíduo Final de Parcelas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 2910
            mmTop = 40746
            mmWidth = 33338
            BandType = 5
            GroupNo = 0
          end
          object ppLabel168: TppLabel
            UserName = 'Label34'
            Caption = 'Acerto de Divergências'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 2910
            mmTop = 35190
            mmWidth = 28046
            BandType = 5
            GroupNo = 0
          end
          object iAcertoNovo: TppVariable
            UserName = 'iAcertoNovo'
            AutoSize = False
            CalcOrder = 4
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetComponent = ppGroupHeaderBand12
            ResetType = veGroupStart
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 61648
            mmTop = 35190
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object iSDNovo: TppVariable
            UserName = 'iSDNovo'
            AutoSize = False
            CalcOrder = 5
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 61648
            mmTop = 13758
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object iResiduoAtualNovo: TppVariable
            UserName = 'iResiduoAtualNovo'
            AutoSize = False
            CalcOrder = 6
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetComponent = ppGroupHeaderBand12
            ResetType = veGroupStart
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 61648
            mmTop = 40746
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object ppLabel169: TppLabel
            UserName = 'Label42'
            Caption = 'Prestação do Mês a vencer'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 2910
            mmTop = 19050
            mmWidth = 34396
            BandType = 5
            GroupNo = 0
          end
          object iPrestMesNovo: TppVariable
            UserName = 'iPrestMesNovo'
            AutoSize = False
            CalcOrder = 7
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 61648
            mmTop = 19050
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object ppLabel170: TppLabel
            UserName = 'LabelCorrecaoIncorpNovo'
            Caption = 'Correções Incorporadas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            Visible = False
            mmHeight = 3175
            mmLeft = 2910
            mmTop = 46038
            mmWidth = 30427
            BandType = 5
            GroupNo = 0
          end
          object CorrecaoIncorporadaNovo: TppVariable
            UserName = 'CorrecaoIncorporadaNovo'
            AutoSize = False
            CalcOrder = 8
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            Visible = False
            mmHeight = 3175
            mmLeft = 61648
            mmTop = 46038
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
        end
        object lblDtLimiteNovo: TppLabel
          UserName = 'lblDtLimiteNovo'
          Caption = 'lblDtLimiteNovo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          Visible = False
          mmHeight = 3260
          mmLeft = 105569
          mmTop = 8996
          mmWidth = 19854
          BandType = 5
          GroupNo = 0
        end
        object relExtratoNovolblDataCorrecao: TppLabel
          UserName = 'relExtratolblDataCorrecao'
          AutoSize = False
          Caption = 'Valores Corrigidos até: 01/01/01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsItalic]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 2910
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object ppRegion12: TppRegion
          UserName = 'Region4'
          Stretch = True
          mmHeight = 7673
          mmLeft = 124619
          mmTop = 14288
          mmWidth = 129646
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppSubReport7: TppSubReport
            OnPrint = ppSubReport7Print
            UserName = 'srSegregacao'
            ExpandAll = False
            NewPrintJob = False
            OutlineSettings.CreateNode = True
            ParentPrinterSetup = False
            ParentWidth = False
            TraverseAllData = False
            DataPipelineName = 'pplSegregExtratoNovo'
            mmHeight = 4763
            mmLeft = 126207
            mmTop = 15610
            mmWidth = 116681
            BandType = 5
            GroupNo = 0
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            object ppChildReport8: TppChildReport
              AutoStop = False
              DataPipeline = pplSegregExtratoNovo
              PrinterSetup.BinName = 'Default'
              PrinterSetup.DocumentName = 'PpModeloReport1'
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
              Left = 176
              Top = 224
              Version = '7.04'
              mmColumnWidth = 0
              DataPipelineName = 'pplSegregExtratoNovo'
              object ppTitleBand8: TppTitleBand
                mmBottomOffset = 0
                mmHeight = 7408
                mmPrintPosition = 0
                object ppLabel173: TppLabel
                  UserName = 'LblPlanoExtrato'
                  Caption = 'Plano'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 2117
                  mmTop = 1323
                  mmWidth = 7673
                  BandType = 1
                end
                object ppLabel174: TppLabel
                  UserName = 'LblPatroExtrato'
                  Caption = 'Patrocinadora'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 45244
                  mmTop = 1323
                  mmWidth = 22754
                  BandType = 1
                end
                object ppLabel175: TppLabel
                  UserName = 'LblPecentExtrato'
                  Caption = '%'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 92604
                  mmTop = 1323
                  mmWidth = 2910
                  BandType = 1
                end
                object ppLabel176: TppLabel
                  UserName = 'LblValorExtrato'
                  Caption = 'Valor (R$)'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 106892
                  mmTop = 1323
                  mmWidth = 14023
                  BandType = 1
                end
                object ppLine36: TppLine
                  UserName = 'Line2'
                  Weight = 0.75
                  mmHeight = 794
                  mmLeft = 1588
                  mmTop = 5821
                  mmWidth = 124354
                  BandType = 1
                end
              end
              object ppDetailBand15: TppDetailBand
                mmBottomOffset = 0
                mmHeight = 5027
                mmPrintPosition = 0
                object ppDBText156: TppDBText
                  UserName = 'DBPlanoExtrato'
                  AutoSize = True
                  DataField = 'PLANOPREV'
                  DataPipeline = pplSegregExtratoNovo
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ParentDataPipeline = False
                  Transparent = True
                  DataPipelineName = 'pplSegregExtratoNovo'
                  mmHeight = 3260
                  mmLeft = 2646
                  mmTop = 529
                  mmWidth = 17357
                  BandType = 4
                end
                object ppDBText157: TppDBText
                  UserName = 'DBPatroExtrato'
                  AutoSize = True
                  DataField = 'PATRO'
                  DataPipeline = pplSegregExtratoNovo
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ParentDataPipeline = False
                  Transparent = True
                  DataPipelineName = 'pplSegregExtratoNovo'
                  mmHeight = 3260
                  mmLeft = 45773
                  mmTop = 529
                  mmWidth = 9356
                  BandType = 4
                end
                object ppDBText158: TppDBText
                  UserName = 'DBPercentExtrato'
                  DataField = 'PERCENTRATEIO'
                  DataPipeline = pplSegregExtratoNovo
                  DisplayFormat = '#,##0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ParentDataPipeline = False
                  TextAlignment = taCentered
                  Transparent = True
                  DataPipelineName = 'pplSegregExtratoNovo'
                  mmHeight = 3175
                  mmLeft = 86784
                  mmTop = 529
                  mmWidth = 12700
                  BandType = 4
                end
                object ppDBText159: TppDBText
                  UserName = 'DBValorExtrato'
                  AutoSize = True
                  DataField = 'VALOR'
                  DataPipeline = pplSegregExtratoNovo
                  DisplayFormat = '###,##0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ParentDataPipeline = False
                  TextAlignment = taRightJustified
                  Transparent = True
                  DataPipelineName = 'pplSegregExtratoNovo'
                  mmHeight = 3260
                  mmLeft = 109538
                  mmTop = 529
                  mmWidth = 9398
                  BandType = 4
                end
              end
              object ppSummaryBand11: TppSummaryBand
                PrintHeight = phDynamic
                mmBottomOffset = 0
                mmHeight = 7144
                mmPrintPosition = 0
              end
              object raCodeModule5: TraCodeModule
                ProgramStream = {00}
              end
            end
          end
        end
        object ppLabel178: TppLabel
          UserName = 'Label127'
          Caption = 'Resumo de Segregação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 124619
          mmTop = 8466
          mmWidth = 39836
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup17: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplExtratoNovo
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplExtratoNovo'
      object ppGroupHeaderBand15: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLine37: TppLine
          UserName = 'Line7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 528
          mmLeft = 0
          mmTop = 3969
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel179: TppLabel
          UserName = 'Label18'
          AutoSize = False
          Caption = 'Parc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2910
          mmTop = 0
          mmWidth = 6879
          BandType = 3
          GroupNo = 1
        end
        object ppLabel180: TppLabel
          UserName = 'Label19'
          AutoSize = False
          Caption = 'Vencto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 12171
          mmTop = 0
          mmWidth = 13758
          BandType = 3
          GroupNo = 1
        end
        object ppLabel181: TppLabel
          UserName = 'Label20'
          AutoSize = False
          Caption = 'Amortiz.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 88900
          mmTop = 0
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object ppLabel183: TppLabel
          UserName = 'Label23'
          AutoSize = False
          Caption = 'Saldo Devedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 64294
          mmTop = 0
          mmWidth = 21167
          BandType = 3
          GroupNo = 1
        end
        object ppLabel184: TppLabel
          UserName = 'Label24'
          AutoSize = False
          Caption = 'Data Pagto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 190765
          mmTop = 0
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object ppLabel187: TppLabel
          UserName = 'Label63'
          AutoSize = False
          Caption = 'Valor Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 208227
          mmTop = 0
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object ppLabel199: TppLabel
          UserName = 'Label50'
          AutoSize = False
          Caption = 'Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 42333
          mmTop = 0
          mmWidth = 18521
          BandType = 3
          GroupNo = 1
        end
        object ppLabel212: TppLabel
          UserName = 'Label41'
          AutoSize = False
          Caption = 'Saldo Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 224632
          mmTop = 0
          mmWidth = 25400
          BandType = 3
          GroupNo = 1
        end
        object ppLabel219: TppLabel
          UserName = 'Label201'
          AutoSize = False
          Caption = 'Alteradores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 120386
          mmTop = 0
          mmWidth = 17463
          BandType = 3
          GroupNo = 1
        end
        object ppLabel220: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 250296
          mmTop = 0
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object ppLabel221: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Vlr. Devido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 156634
          mmTop = 0
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object ppLabel222: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'Data Limite'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 173302
          mmTop = 0
          mmWidth = 16669
          BandType = 3
          GroupNo = 1
        end
        object ppLabel224: TppLabel
          UserName = 'Label124'
          AutoSize = False
          Caption = 'Docum'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 28575
          mmTop = 0
          mmWidth = 12700
          BandType = 3
          GroupNo = 1
        end
        object ppLabel182: TppLabel
          UserName = 'Label182'
          AutoSize = False
          Caption = 'Atualizações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 138113
          mmTop = 0
          mmWidth = 18521
          BandType = 3
          GroupNo = 1
        end
        object ppLabel200: TppLabel
          UserName = 'Label200'
          AutoSize = False
          Caption = 'Observações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 263790
          mmTop = 0
          mmWidth = 19315
          BandType = 3
          GroupNo = 1
        end
        object ppLabel228: TppLabel
          UserName = 'Label228'
          AutoSize = False
          Caption = 'Prestação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 103188
          mmTop = 0
          mmWidth = 16140
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand15: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2117
        mmPrintPosition = 0
      end
    end
    object ppGroup18: TppGroup
      BreakName = 'IDCONDPAGIMOVEL'
      DataPipeline = pplExtratoNovo
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplExtratoNovo'
      object ppGroupHeaderBand16: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand16: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 13229
        mmPrintPosition = 0
        object ppRegion13: TppRegion
          OnPrint = ppRegion13Print
          UserName = 'Region3'
          mmHeight = 10848
          mmLeft = 5292
          mmTop = 1058
          mmWidth = 272521
          BandType = 5
          GroupNo = 2
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel225: TppLabel
            UserName = 'Label26'
            Caption = 'Condição:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 7673
            mmTop = 2910
            mmWidth = 13758
            BandType = 5
            GroupNo = 2
          end
          object ppDBText160: TppDBText
            UserName = 'DBText79'
            AutoSize = True
            DataField = 'TIPOCONDPAG'
            DataPipeline = pplExtratoNovo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplExtratoNovo'
            mmHeight = 3260
            mmLeft = 7408
            mmTop = 6879
            mmWidth = 20743
            BandType = 5
            GroupNo = 2
          end
          object ppLabel226: TppLabel
            UserName = 'Label52'
            Caption = 'Nr. Parcelas:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 35719
            mmTop = 2910
            mmWidth = 17463
            BandType = 5
            GroupNo = 2
          end
          object ppLabel227: TppLabel
            UserName = 'Label110'
            Caption = 'Nr. Parcelas Pagas:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 35454
            mmTop = 6879
            mmWidth = 26458
            BandType = 5
            GroupNo = 2
          end
          object ppDBCalc31: TppDBCalc
            UserName = 'DBCalc5'
            DataField = 'VLRAMORTIZACAO'
            DataPipeline = pplExtratoNovo
            DisplayFormat = '#,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup18
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtratoNovo'
            mmHeight = 3175
            mmLeft = 80169
            mmTop = 3175
            mmWidth = 22225
            BandType = 5
            GroupNo = 2
          end
          object ppDBCalc32: TppDBCalc
            UserName = 'DBCalc6'
            DataField = 'VLRPRESTACAO'
            DataPipeline = pplExtratoNovo
            DisplayFormat = '#,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup18
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtratoNovo'
            mmHeight = 3175
            mmLeft = 102923
            mmTop = 3175
            mmWidth = 17198
            BandType = 5
            GroupNo = 2
          end
          object ppDBCalc34: TppDBCalc
            UserName = 'DBCalc8'
            DataField = 'VLRPAGO'
            DataPipeline = pplExtratoNovo
            DisplayFormat = '#,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup18
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtratoNovo'
            mmHeight = 3260
            mmLeft = 199496
            mmTop = 3175
            mmWidth = 24605
            BandType = 5
            GroupNo = 2
          end
          object ppDBText161: TppDBText
            UserName = 'DBText85'
            DataField = 'NUMPARCELAS'
            DataPipeline = pplExtratoNovo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtratoNovo'
            mmHeight = 3175
            mmLeft = 63765
            mmTop = 3175
            mmWidth = 11113
            BandType = 5
            GroupNo = 2
          end
          object vQtdeParcPagaNovo: TppVariable
            UserName = 'vQtdeParcPagaNovo'
            AutoSize = False
            CalcOrder = 0
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 63765
            mmTop = 7144
            mmWidth = 11113
            BandType = 5
            GroupNo = 2
          end
          object ppLabel223: TppLabel
            UserName = 'Label223'
            AutoSize = False
            Caption = 'Label223'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 228071
            mmTop = 3175
            mmWidth = 20902
            BandType = 5
            GroupNo = 2
          end
        end
      end
    end
    object raCodeModule3: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650611
        6941747261736F4E6F766F4F6E43616C630B50726F6772616D54797065070B74
        7450726F63656475726506536F757263650CEC01000070726F63656475726520
        6941747261736F4E6F766F4F6E43616C63287661722056616C75653A20566172
        69616E74293B0D0A626567696E0D0A20696620286C4578747261746F4E6F766F
        5B27444154414C494D495445275D203C20537472546F44617465286C626C4474
        4C696D6974654E6F766F2E43617074696F6E29202920616E64200D0A20202020
        286C4578747261746F4E6F766F5B27564C525041474F275D203D20302920616E
        64200D0A20202020286C4578747261746F4E6F766F5B27464C475449504F4C41
        4E43275D203C3E203629207468656E20626567696E0D0A202020206966206C45
        78747261746F4E6F766F5B274944434F4E5241544F494D4F56454C275D203C3E
        2032383233207468656E0D0A20202020206941747261736F4E6F766F2E417344
        6F75626C6520203A3D206941747261736F4E6F766F2E4173446F75626C65202B
        206C4578747261746F4E6F766F5B27564C52434F52524947275D0D0A20202020
        656C73652020200D0A20202020206941747261736F4E6F766F2E4173446F7562
        6C65203A3D20206941747261736F4E6F766F2E4173446F75626C65202B20286C
        4578747261746F4E6F766F5B27564C5250524553544143414F275D2D6C457874
        7261746F5B27564C525041474F275D293B0D0A20656E643B0D0A0D0A656E643B
        0D0A0D436F6D706F6E656E744E616D65060B6941747261736F4E6F766F094576
        656E744E616D6506064F6E43616C63074576656E74494402210001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D650611694469766572
        674E6F766F4F6E43616C630B50726F6772616D54797065070B747450726F6365
        6475726506536F757263650C3C01000070726F63656475726520694469766572
        674E6F766F4F6E43616C63287661722056616C75653A2056617269616E74293B
        0D0A626567696E0D0A20696620286C4578747261746F4E6F766F5B2744415441
        56454E43494D454E544F275D203C20537472546F44617465286C626C44744C69
        6D6974654E6F766F2E43617074696F6E29202920616E64200D0A20202020286C
        4578747261746F4E6F766F5B27564C525041474F275D203E20302920616E6420
        286C4578747261746F4E6F766F5B27464C475449504F4C414E43275D203C3E20
        3629207468656E20626567696E0D0A20202020694469766572674E6F766F2E41
        73446F75626C65203A3D20694469766572674E6F766F2E4173446F75626C6520
        2B206C4578747261746F4E6F766F5B27564C52434F52524947275D3B0D0A2065
        6E643B200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B69446976
        6572674E6F766F094576656E744E616D6506064F6E43616C63074576656E7449
        4402210001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D650612695265736964756F4E6F766F4F6E43616C630B50726F6772616D5479
        7065070B747450726F63656475726506536F757263650CC601000070726F6365
        6475726520695265736964756F4E6F766F4F6E43616C63287661722056616C75
        653A2056617269616E74293B0D0A626567696E0D0A206966202820286C457874
        7261746F4E6F766F5B27464C475245534944554F494E434F5250275D203D2027
        4E272920616E64200D0A202020202020286C4578747261746F4E6F766F5B2746
        4C474C414E43494E5445475241275D203C3E20352020202920616E64200D0A20
        2020202020286C4578747261746F4E6F766F5B27464C474C414E43494E544547
        5241275D203C3E2036202020292029206F720D0A202020202820286C45787472
        61746F4E6F766F5B27464C475245534944554F494E434F5250275D203D202743
        272920616E64200D0A202020202020286C4578747261746F4E6F766F5B274441
        5441434F42524553275D203E20537472546F44617465286C626C44744C696D69
        74654E6F766F2E43617074696F6E29292029207468656E20626567696E0D0A20
        202020695265736964756F4E6F766F2E4173446F75626C65203A3D2069526573
        6964756F4E6F766F2E4173446F75626C65202B206C4578747261746F4E6F766F
        5B27564C525245534944554F275D3B0D0A20656E643B200D0A0D0A656E643B0D
        0A0D436F6D706F6E656E744E616D65060C695265736964756F4E6F766F094576
        656E744E616D6506064F6E43616C63074576656E74494402210001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D650611694163657274
        6F4E6F766F4F6E43616C630B50726F6772616D54797065070B747450726F6365
        6475726506536F757263650C9E01000070726F63656475726520694163657274
        6F4E6F766F4F6E43616C63287661722056616C75653A2056617269616E74293B
        0D0A626567696E0D0A20696620286C4578747261746F4E6F766F5B27464C4754
        49504F4C414E43275D203D2036207468656E20626567696E0D0A202020206966
        20286C4578747261746F4E6F766F5B274441544156454E43494D454E544F275D
        203E3D20537472546F44617465286C626C44744C696D6974654E6F766F2E4361
        7074696F6E292029207468656E20626567696E200D0A20202020202020694163
        6572746F4E6F766F2E4173446F75626C65203A3D206941636572746F4E6F766F
        2E4173446F75626C65202B206C4578747261746F4E6F766F5B27544F545F4445
        5649444F275D3B0D0A20202020656E6420656C736520626567696E0D0A202020
        202020206941636572746F4E6F766F2E4173446F75626C65203A3D2069416365
        72746F4E6F766F2E4173446F75626C65202B206C4578747261746F4E6F766F5B
        27564C52434F52524947275D3B0D0A20202020656E643B2020200D0A20656E64
        3B0D0A200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B6941
        636572746F4E6F766F094576656E744E616D6506064F6E43616C63074576656E
        74494402210001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D650617695265736964756F417475616C4E6F766F4F6E43616C630B5072
        6F6772616D54797065070B747450726F63656475726506536F757263650CDA01
        000070726F63656475726520695265736964756F417475616C4E6F766F4F6E43
        616C63287661722056616C75653A2056617269616E74293B0D0A626567696E0D
        0A206966202820286C4578747261746F4E6F766F5B27464C475245534944554F
        494E434F5250275D203D20274E272920616E64200D0A202020202020286C4578
        747261746F4E6F766F5B27464C474C414E43494E5445475241275D203C3E2035
        2020202920616E64200D0A202020202020286C4578747261746F4E6F766F5B27
        464C474C414E43494E5445475241275D203C3E2036202020292029206F720D0A
        202020202820286C4578747261746F4E6F766F5B27464C475245534944554F49
        4E434F5250275D203D202743272920616E64200D0A202020202020286C457874
        7261746F4E6F766F5B2744415441434F42524553275D203E20537472546F4461
        7465286C626C44744C696D6974654E6F766F2E43617074696F6E292920292074
        68656E20626567696E0D0A20202020695265736964756F417475616C4E6F766F
        2E4173446F75626C65203A3D20695265736964756F417475616C4E6F766F2E41
        73446F75626C65202B206C4578747261746F4E6F766F5B27564C525245534944
        554F434F52524947275D3B0D0A20656E643B20200D0A656E643B0D0A0D436F6D
        706F6E656E744E616D650611695265736964756F417475616C4E6F766F094576
        656E744E616D6506064F6E43616C63074576656E74494402210001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D650613695072657374
        4D65734E6F766F4F6E43616C630B50726F6772616D54797065070B747450726F
        63656475726506536F757263650C8F01000070726F6365647572652069507265
        73744D65734E6F766F4F6E43616C63287661722056616C75653A205661726961
        6E74293B0D0A626567696E0D0A2020696620286C4578747261746F4E6F766F5B
        274E554D50415243275D203E20302920616E640D0A2020202020286C45787472
        61746F4E6F766F5B27444154414C494D495445275D203E3D206C457874726174
        6F4E6F766F5B27444154415F42415345275D2920616E640D0A20202020202820
        286C4578747261746F4E6F766F5B2744415441504147414D454E544F275D203E
        206C4578747261746F4E6F766F5B27444154414C494D495445275D29206F720D
        0A20202020202020286C4578747261746F4E6F766F5B2744415441504147414D
        454E544F275D203C3D2030292029207468656E20626567696E0D0A2020202020
        6950726573744D65734E6F766F2E4173446F75626C65203A3D20695072657374
        4D65734E6F766F2E4173446F75626C65202B206C4578747261746F4E6F766F5B
        27564C5250524553544143414F275D3B0D0A2020656E643B200D0A656E643B0D
        0A0D436F6D706F6E656E744E616D65060D6950726573744D65734E6F766F0945
        76656E744E616D6506064F6E43616C63074576656E74494402210001060F5472
        614576656E7448616E646C65720B50726F6772616D4E616D6506136953616C64
        6F546F744E6F766F4F6E43616C630B50726F6772616D54797065070B74745072
        6F63656475726506536F757263650C6001000070726F63656475726520695361
        6C646F546F744E6F766F4F6E43616C63287661722056616C75653A2056617269
        616E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D206941747261
        736F4E6F766F2E56616C7565202B200D0A202020202020202020202069446976
        6572674E6F766F2E56616C7565202B200D0A2020202020202020202020695265
        736964756F4E6F766F2E56616C7565202B200D0A202020202020202020202069
        41636572746F4E6F766F2E56616C7565202B200D0A2020202020202020202020
        6953444E6F766F2E56616C7565202B200D0A2020202020202020202020695265
        736964756F417475616C4E6F766F2E56616C7565202B200D0A20202020202020
        202020206950726573744D65734E6F766F2E56616C7565202B200D0A20202020
        20202020202020436F72726563616F496E636F72706F726164614E6F766F2E56
        616C75653B0D0A20200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
        65060D6953616C646F546F744E6F766F094576656E744E616D6506064F6E4361
        6C63074576656E74494402210001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D65061044657461696C41667465725072696E740B5072
        6F6772616D54797065070B747450726F63656475726506536F7572636506AB70
        726F6365647572652044657461696C41667465725072696E743B0D0A62656769
        6E0D0A20206966206C4578747261746F4E6F766F5B27564C525041474F275D20
        3E2030207468656E20626567696E0D0A20202020207651746465506172635061
        67614E6F766F2E4173496E7465676572203A3D20765174646550617263506167
        614E6F766F2E4173496E7465676572202B20313B0D0A2020656E643B0D0A2020
        0D0A656E643B0D0A0D0A0D436F6D706F6E656E744E616D65060644657461696C
        094576656E744E616D65060A41667465725072696E74074576656E7449440217
        0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
        1C47726F757048656164657242616E6431364265666F72655072696E740B5072
        6F6772616D54797065070B747450726F63656475726506536F75726365065D70
        726F6365647572652047726F757048656164657242616E6431364265666F7265
        5072696E743B0D0A626567696E0D0A2020202076517464655061726350616761
        4E6F766F2E4173496E7465676572203A3D20303B0D0A656E643B0D0A0D436F6D
        706F6E656E744E616D65061147726F757048656164657242616E643136094576
        656E744E616D65060B4265666F72655072696E74074576656E74494402180001
        060F5472614576656E7448616E646C65720B50726F6772616D4E616D65061C47
        726F757048656164657242616E6431324265666F72655072696E740B50726F67
        72616D54797065070B747450726F63656475726506536F757263650C60010000
        70726F6365647572652047726F757048656164657242616E6431324265666F72
        655072696E743B0D0A626567696E0D0A2020206941747261736F4E6F766F2E41
        73446F75626C65202020202020203A3D20303B0D0A202020694469766572674E
        6F766F2E4173446F75626C65202020202020203A3D20303B0D0A202020695265
        736964756F4E6F766F2E4173446F75626C652020202020203A3D20303B0D0A20
        2020695265736964756F417475616C4E6F766F2E4173446F75626C65203A3D20
        303B0D0A2020206941636572746F4E6F766F2E4173446F75626C652020202020
        20203A3D20303B0D0A2020206953616C646F546F744E6F766F2E4173446F7562
        6C6520202020203A3D20303B0D0A2020206953444E6F766F2E4173446F75626C
        6520202020202020202020203A3D20303B0D0A2020206950726573744D65734E
        6F766F2E4173446F75626C6520202020203A3D20303B0D0A0D0A656E643B0D0A
        0D436F6D706F6E656E744E616D65061147726F757048656164657242616E6431
        32094576656E744E616D65060B4265666F72655072696E74074576656E744944
        02180001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
        65061C47726F7570466F6F74657242616E6431324265666F72655072696E740B
        50726F6772616D54797065070B747450726F63656475726506536F7572636506
        E570726F6365647572652047726F7570466F6F74657242616E6431324265666F
        72655072696E743B0D0A626567696E0D0A20206953616C646F546F744E6F766F
        2E56616C7565203A3D206953444E6F766F2E56616C7565202B20695072657374
        4D65734E6F766F2E56616C7565202B206941747261736F4E6F766F2E56616C75
        65202B200D0A2020202020202020202020202020202020202020202069446976
        6572674E6F766F2E56616C7565202B20695265736964756F417475616C4E6F76
        6F2E56616C7565202B206941636572746F4E6F766F2E56616C75653B0D0A0D0A
        656E643B0D0A0D436F6D706F6E656E744E616D65061147726F7570466F6F7465
        7242616E643132094576656E744E616D65060B4265666F72655072696E740745
        76656E74494402180000}
    end
    object ppParameterList3: TppParameterList
    end
  end
  object pplCondExtratoNovo: TppBDEPipeline
    DataSource = dsCondExtrNovo
    SkipWhenNoRecords = False
    UserName = 'lCondExtratoNovo'
    Left = 650
    Top = 98
    MasterDataPipelineName = 'pplExtratoNovo'
    object pplCondExtratoNovoppField1: TppField
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplCondExtratoNovoppField2: TppField
      FieldAlias = 'IDCONDPAGIMOVEL'
      FieldName = 'IDCONDPAGIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplCondExtratoNovoppField3: TppField
      FieldAlias = 'VLRFINANC'
      FieldName = 'VLRFINANC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplCondExtratoNovoppField4: TppField
      FieldAlias = 'PRAZO'
      FieldName = 'PRAZO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplCondExtratoNovoppField5: TppField
      FieldAlias = 'NUMPARCELAS'
      FieldName = 'NUMPARCELAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplCondExtratoNovoppField6: TppField
      FieldAlias = 'TIPOCONDPAG'
      FieldName = 'TIPOCONDPAG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplCondExtratoNovoppField7: TppField
      FieldAlias = 'FORMACALCULO'
      FieldName = 'FORMACALCULO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplCondExtratoNovoppField8: TppField
      FieldAlias = 'Cal_Tipo'
      FieldName = 'Cal_Tipo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplCondExtratoNovoppField9: TppField
      FieldAlias = 'Cal_Forma'
      FieldName = 'Cal_Forma'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object dsCondExtrNovo: TwwDataSource
    DataSet = qryCondExtrNovo
    Left = 648
    Top = 248
  end
  object qryCondExtrNovo: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryCondExtrNovoCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CPI.IDCONTRATOIMOVEL,'
      '     CPI.IDCONDPAGIMOVEL,'
      '     CPI.VLRFINANC,'
      '     CPI.PRAZO,'
      '     CPI.NUMPARCELAS,'
      '     CPI.TIPOCONDPAG,'
      '     CPI.FORMACALCULO'
      'FROM'
      '     CONDPAGIMOVEL CPI'
      'WHERE '
      '     CPI.IDCONTRATOIMOVEL =   :IDCONTRATOIMOVEL'
      'order by CPI.IDCONDPAGIMOVEL'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updCondExtrNovo
    ValidateWithMask = True
    Left = 648
    Top = 154
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryCondExtrNovoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDCONTRATOIMOVEL'
    end
    object qryCondExtrNovoIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDCONDPAGIMOVEL'
    end
    object qryCondExtrNovoVLRFINANC: TFloatField
      FieldName = 'VLRFINANC'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.VLRFINANC'
    end
    object qryCondExtrNovoPRAZO: TStringField
      FieldName = 'PRAZO'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.PRAZO'
      FixedChar = True
      Size = 1
    end
    object qryCondExtrNovoNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.NUMPARCELAS'
    end
    object qryCondExtrNovoTIPOCONDPAG: TStringField
      FieldName = 'TIPOCONDPAG'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.TIPOCONDPAG'
      FixedChar = True
      Size = 1
    end
    object qryCondExtrNovoFORMACALCULO: TFloatField
      FieldName = 'FORMACALCULO'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.FORMACALCULO'
    end
    object qryCondExtrNovoCal_Tipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'Cal_Tipo'
      Calculated = True
    end
    object qryCondExtrNovoCal_Forma: TStringField
      FieldKind = fkCalculated
      FieldName = 'Cal_Forma'
      Size = 200
      Calculated = True
    end
  end
  object updCondExtrNovo: TUpdateSQL
    Left = 643
    Top = 205
  end
  object rpInadAnaNovo: TppReport
    AutoStop = False
    DataPipeline = pplInadAnaNovo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 714
    Top = 338
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplInadAnaNovo'
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 14817
      mmPrintPosition = 0
      object ppTituloInadAnaNovo: TppLabel
        UserName = 'TituloInadAnaNovo'
        AutoSize = False
        Caption = 'Inadimplência de Alienação - Analítico (Novo)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8467
        mmWidth = 283898
        BandType = 0
      end
      object ppLabel231: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1852
        mmWidth = 283898
        BandType = 0
      end
    end
    object ppDetailBand16: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppShape14: TppShape
        OnPrint = ppsCorPrint
        UserName = 'sCor2'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText166: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'NUMPARCELA'
        DataPipeline = pplInadAnaNovo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAnaNovo'
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText167: TppDBText
        UserName = 'DBText10'
        DataField = 'DATAVENCIMENTO'
        DataPipeline = pplInadAnaNovo
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAnaNovo'
        mmHeight = 3704
        mmLeft = 14288
        mmTop = 0
        mmWidth = 16002
        BandType = 4
      end
      object ppDBText168: TppDBText
        UserName = 'DBText11'
        BlankWhenZero = True
        DataField = 'VLRPRESTACAO'
        DataPipeline = pplInadAnaNovo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAnaNovo'
        mmHeight = 3704
        mmLeft = 52652
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText169: TppDBText
        UserName = 'DBText27'
        BlankWhenZero = True
        DataField = 'DATAPAGAMENTO'
        DataPipeline = pplInadAnaNovo
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAnaNovo'
        mmHeight = 3704
        mmLeft = 73025
        mmTop = 0
        mmWidth = 16002
        BandType = 4
      end
      object ppDBText170: TppDBText
        UserName = 'DBText38'
        BlankWhenZero = True
        DataField = 'VLRPAGO'
        DataPipeline = pplInadAnaNovo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAnaNovo'
        mmHeight = 3704
        mmLeft = 89959
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText171: TppDBText
        UserName = 'dbtTipo'
        DataField = 'CAL_TIPO'
        DataPipeline = pplInadAnaNovo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplInadAnaNovo'
        mmHeight = 3704
        mmLeft = 30956
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText172: TppDBText
        UserName = 'DBText33'
        BlankWhenZero = True
        DataField = 'VLRDEVIDO'
        DataPipeline = pplInadAnaNovo
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAnaNovo'
        mmHeight = 3704
        mmLeft = 264055
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText173: TppDBText
        UserName = 'DBText86'
        BlankWhenZero = True
        DataField = 'DIASDIF'
        DataPipeline = pplInadAnaNovo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAnaNovo'
        mmHeight = 3704
        mmLeft = 110861
        mmTop = 0
        mmWidth = 6614
        BandType = 4
      end
      object ppDBText174: TppDBText
        UserName = 'DBText87'
        BlankWhenZero = True
        DataField = 'VLRCMATRASO'
        DataPipeline = pplInadAnaNovo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAnaNovo'
        mmHeight = 3704
        mmLeft = 118269
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText175: TppDBText
        UserName = 'DBText88'
        BlankWhenZero = True
        DataField = 'VLRMULTAATRASO'
        DataPipeline = pplInadAnaNovo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAnaNovo'
        mmHeight = 3704
        mmLeft = 139171
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText176: TppDBText
        UserName = 'DBText89'
        BlankWhenZero = True
        DataField = 'VLRMORAATRASO'
        DataPipeline = pplInadAnaNovo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAnaNovo'
        mmHeight = 3704
        mmLeft = 159809
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText177: TppDBText
        UserName = 'DBText90'
        BlankWhenZero = True
        DataField = 'VLRCMCORRIG'
        DataPipeline = pplInadAnaNovo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAnaNovo'
        mmHeight = 3704
        mmLeft = 201348
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText178: TppDBText
        UserName = 'DBText92'
        BlankWhenZero = True
        DataField = 'VLRJUROSCORRIG'
        DataPipeline = pplInadAnaNovo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAnaNovo'
        mmHeight = 3704
        mmLeft = 243153
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText179: TppDBText
        UserName = 'DBText93'
        BlankWhenZero = True
        DataField = 'VLRDIF'
        DataPipeline = pplInadAnaNovo
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAnaNovo'
        mmHeight = 3704
        mmLeft = 179917
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText180: TppDBText
        UserName = 'DBText91'
        BlankWhenZero = True
        DataField = 'VLRMULTACORRIG'
        DataPipeline = pplInadAnaNovo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAnaNovo'
        mmHeight = 3704
        mmLeft = 222250
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine39: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel232: TppLabel
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
        mmWidth = 283369
        BandType = 8
      end
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 283105
        BandType = 8
      end
      object ppSystemVariable18: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257176
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand13: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel233: TppLabel
        UserName = 'Label82'
        AutoSize = False
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 153723
        mmTop = 2910
        mmWidth = 25135
        BandType = 7
      end
      object ppDBCalc33: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'VLRDEVIDO'
        DataPipeline = pplInadAnaNovo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAnaNovo'
        mmHeight = 3175
        mmLeft = 245798
        mmTop = 2910
        mmWidth = 38365
        BandType = 7
      end
      object ppDBCalc35: TppDBCalc
        UserName = 'DBCalc101'
        DataField = 'VLRDIF'
        DataPipeline = pplInadAnaNovo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAnaNovo'
        mmHeight = 3175
        mmLeft = 180182
        mmTop = 2911
        mmWidth = 20320
        BandType = 7
      end
    end
    object ppGroup19: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplInadAnaNovo
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplInadAnaNovo'
      object ppGroupHeaderBand17: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 30427
        mmPrintPosition = 0
        object ppLine40: TppLine
          UserName = 'Line14'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 12700
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel234: TppLabel
          UserName = 'Label24'
          AutoSize = False
          Caption = 'Data de Pagto.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7144
          mmLeft = 73025
          mmTop = 20902
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppLabel235: TppLabel
          UserName = 'Label63'
          AutoSize = False
          Caption = 'Valor Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 89959
          mmTop = 24606
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel236: TppLabel
          UserName = 'Label51'
          AutoSize = False
          Caption = '    Valor Devido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7144
          mmLeft = 264055
          mmTop = 20902
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLine41: TppLine
          UserName = 'Line7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 28839
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText181: TppDBText
          UserName = 'DBText18'
          DataField = 'NOMECONTRATO'
          DataPipeline = pplInadAnaNovo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplInadAnaNovo'
          mmHeight = 3704
          mmLeft = 22754
          mmTop = 6879
          mmWidth = 71967
          BandType = 3
          GroupNo = 0
        end
        object ppLabel237: TppLabel
          UserName = 'Label113'
          AutoSize = False
          Caption = 'Dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 110861
          mmTop = 24606
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object ppLabel238: TppLabel
          UserName = 'Label114'
          AutoSize = False
          Caption = 'Correção Monetária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7144
          mmLeft = 118269
          mmTop = 20902
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel239: TppLabel
          UserName = 'Label202'
          AutoSize = False
          Caption = 'Multa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 139171
          mmTop = 24606
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel240: TppLabel
          UserName = 'Label116'
          AutoSize = False
          Caption = 'Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 159809
          mmTop = 24606
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object ppLabel241: TppLabel
          UserName = 'Label120'
          AutoSize = False
          Caption = 'Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 243153
          mmTop = 24606
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel242: TppLabel
          UserName = 'Label117'
          AutoSize = False
          Caption = 'Correção Monetária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7144
          mmLeft = 201348
          mmTop = 20902
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel243: TppLabel
          UserName = 'Label121'
          AutoSize = False
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 179917
          mmTop = 24606
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppShape15: TppShape
          UserName = 'Shape1'
          mmHeight = 2117
          mmLeft = 118269
          mmTop = 18256
          mmWidth = 82286
          BandType = 3
          GroupNo = 0
        end
        object ppShape16: TppShape
          UserName = 'Shape2'
          Pen.Color = clWhite
          mmHeight = 794
          mmLeft = 118269
          mmTop = 19844
          mmWidth = 82286
          BandType = 3
          GroupNo = 0
        end
        object ppShape17: TppShape
          UserName = 'Shape3'
          mmHeight = 2117
          mmLeft = 201348
          mmTop = 18256
          mmWidth = 62177
          BandType = 3
          GroupNo = 0
        end
        object ppShape18: TppShape
          UserName = 'Shape4'
          Pen.Color = clWhite
          mmHeight = 794
          mmLeft = 201348
          mmTop = 19844
          mmWidth = 62177
          BandType = 3
          GroupNo = 0
        end
        object ppLabel244: TppLabel
          UserName = 'Label119'
          AutoSize = False
          Caption = 'Correção de Valores Pagos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 118269
          mmTop = 14817
          mmWidth = 82286
          BandType = 3
          GroupNo = 0
        end
        object ppLabel245: TppLabel
          UserName = 'Label122'
          AutoSize = False
          Caption = 'Correção de Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 201348
          mmTop = 14817
          mmWidth = 62177
          BandType = 3
          GroupNo = 0
        end
        object ppLabel246: TppLabel
          UserName = 'Label123'
          AutoSize = False
          Caption = 'Multa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 222250
          mmTop = 24606
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel247: TppLabel
          UserName = 'Label18'
          AutoSize = False
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 2117
          mmTop = 24606
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppLabel248: TppLabel
          UserName = 'Label19'
          AutoSize = False
          Caption = 'Data de Vencto.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7144
          mmLeft = 14288
          mmTop = 20902
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppLabel249: TppLabel
          UserName = 'Label50'
          AutoSize = False
          Caption = 'Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 31485
          mmTop = 24606
          mmWidth = 19844
          BandType = 3
          GroupNo = 0
        end
        object ppLabel250: TppLabel
          UserName = 'Label20'
          AutoSize = False
          Caption = 'Prestação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 52123
          mmTop = 24606
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel251: TppLabel
          UserName = 'Label31'
          AutoSize = False
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 6879
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel252: TppLabel
          UserName = 'Label112'
          AutoSize = False
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 17463
          mmTop = 6879
          mmWidth = 2646
          BandType = 3
          GroupNo = 0
        end
        object ppLabel253: TppLabel
          UserName = 'Label38'
          AutoSize = False
          Caption = 'Comprador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 529
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel254: TppLabel
          UserName = 'Label111'
          AutoSize = False
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 17463
          mmTop = 529
          mmWidth = 2646
          BandType = 3
          GroupNo = 0
        end
        object ppDBText182: TppDBText
          UserName = 'DBText26'
          DataField = 'RAZAOSOCIAL'
          DataPipeline = pplInadAnaNovo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplInadAnaNovo'
          mmHeight = 3704
          mmLeft = 23019
          mmTop = 529
          mmWidth = 69056
          BandType = 3
          GroupNo = 0
        end
        object ppDtInadAnaNovo: TppLabel
          UserName = 'DtInadAnaNovo'
          AutoSize = False
          Caption = 'Data Limite: 99/99/9999 '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 240771
          mmTop = 6879
          mmWidth = 43392
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand17: TppGroupFooterBand
        AfterPrint = gfbExtratoAfterPrint
        BeforePrint = gfbExtratoBeforePrint
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel256: TppLabel
          UserName = 'Label77'
          AutoSize = False
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 159015
          mmTop = 0
          mmWidth = 16002
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc36: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VLRDEVIDO'
          DataPipeline = pplInadAnaNovo
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup19
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadAnaNovo'
          mmHeight = 3175
          mmLeft = 241300
          mmTop = 0
          mmWidth = 43127
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc37: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'VLRDIF'
          DataPipeline = pplInadAnaNovo
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup19
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadAnaNovo'
          mmHeight = 3175
          mmLeft = 179652
          mmTop = 0
          mmWidth = 20320
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object raCodeModule8: TraCodeModule
      ProgramStream = {00}
    end
  end
  object pplInadAnaNovo: TppBDEPipeline
    DataSource = dsInadAnaNovo
    UserName = 'lInadAna2'
    Left = 618
    Top = 338
    object ppField1: TppField
      FieldAlias = 'IDPARCFINANCIMOV'
      FieldName = 'IDPARCFINANCIMOV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppField2: TppField
      FieldAlias = 'IDCONDPAGIMOVEL'
      FieldName = 'IDCONDPAGIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppField3: TppField
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppField4: TppField
      FieldAlias = 'CONNUMERO'
      FieldName = 'CONNUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppField5: TppField
      FieldAlias = 'CONNOME'
      FieldName = 'CONNOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppField6: TppField
      FieldAlias = 'NOMECONTRATO'
      FieldName = 'NOMECONTRATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppField7: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppField8: TppField
      FieldAlias = 'NUMPARCELA'
      FieldName = 'NUMPARCELA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppField9: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppField10: TppField
      FieldAlias = 'VLRPRESTACAO'
      FieldName = 'VLRPRESTACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppField11: TppField
      FieldAlias = 'FLGTIPOLANC'
      FieldName = 'FLGTIPOLANC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppField12: TppField
      FieldAlias = 'FLGLANCINTEGRA'
      FieldName = 'FLGLANCINTEGRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppField13: TppField
      FieldAlias = 'DATAPAGAMENTO'
      FieldName = 'DATAPAGAMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppField14: TppField
      FieldAlias = 'VLRPAGO'
      FieldName = 'VLRPAGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppField15: TppField
      FieldAlias = 'DIASDIF'
      FieldName = 'DIASDIF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppField16: TppField
      FieldAlias = 'VLRCMATRASO'
      FieldName = 'VLRCMATRASO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppField17: TppField
      FieldAlias = 'VLRMULTAATRASO'
      FieldName = 'VLRMULTAATRASO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppField18: TppField
      FieldAlias = 'VLRMORAATRASO'
      FieldName = 'VLRMORAATRASO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppField19: TppField
      FieldAlias = 'VLRDIF'
      FieldName = 'VLRDIF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppField20: TppField
      FieldAlias = 'VLRCMCORRIG'
      FieldName = 'VLRCMCORRIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppField21: TppField
      FieldAlias = 'VLRMULTACORRIG'
      FieldName = 'VLRMULTACORRIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppField22: TppField
      FieldAlias = 'VLRJUROSCORRIG'
      FieldName = 'VLRJUROSCORRIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppField23: TppField
      FieldAlias = 'VLRDEVIDO'
      FieldName = 'VLRDEVIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppField24: TppField
      FieldAlias = 'CAL_TIPO'
      FieldName = 'CAL_TIPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
  end
  object dsInadAnaNovo: TwwDataSource
    DataSet = qryInadAnaNovo
    Left = 540
    Top = 330
  end
  object qryInadAnaNovo: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryInadAnaNovoCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PF.IDPARCFINANCIMOV,'
      '       PF.IDCONDPAGIMOVEL,  '
      '       CP.IDCONTRATOIMOVEL, '
      '       CI.CONNUMERO,        '
      '       CI.CONNOME,          '
      '       (CI.CONNUMERO || '#39' - '#39' || CI.CONNOME) AS NOMECONTRATO, '
      '       P.RAZAOSOCIAL,       '
      
        '       DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || '#39'/'#39 +
        ' || TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA, '
      
        '       DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENT' +
        'O) AS DATAVENCIMENTO,  '
      
        '       DECODE(PF.FLGTIPOLANC,9,PF.VLRAMORTIZACAO,PF.VLRPRESTACAO' +
        ')  AS VLRPRESTACAO,    '
      '       PF.FLGTIPOLANC,        '
      '       PF.FLGLANCINTEGRA,     '
      '       PP.DATAPAGAMENTO,'
      '       ROUND(NVL(PP.VLRPAGO,0),2) AS VLRPAGO,'
      '       PF.DATAPAGAMENTO - PF.DATALIMITE AS DIASDIF, '
      
        '       ROUND( ( ( NVL(PF.VLRPRESTACAO,0) + NVL( CMA.VLRCORRIGIDO' +
        'ATRASO, 0 ) + NVL( MA.VLRMULTAATRASO, 0 ) + NVL( JA.VLRMORAATRAS' +
        'O, 0 ) ) - NVL( PP.VLRPAGO, 0 ) ), 2 )  AS VLRDIF, '
      '       CMA.VLRCORRIGIDOATRASO AS VLRCMATRASO,  '
      '       MA.VLRMULTAATRASO AS VLRMULTAATRASO,  '
      '       JA.VLRMORAATRASO AS VLRMORAATRASO,  '
      '       CMS.VLRCORRIGIDOSALDO AS VLRCMCORRIG,  '
      '       MS.VLRMULTASALDO   AS VLRMULTACORRIG,  '
      '       JS.VLRMORASALDO AS VLRJUROSCORRIG,  '
      
        '       ROUND(NVL(PF.VLRPRESTACAO,0) + NVL( CMA.VLRCORRIGIDOATRAS' +
        'O, 0 ) + NVL( MA.VLRMULTAATRASO, 0 ) + NVL( JA.VLRMORAATRASO, 0 ' +
        ')  - NVL( PP.VLRPAGO, 0 ) +  '
      
        '       NVL(CMS.VLRCORRIGIDOSALDO,0) + NVL(MS.VLRMULTASALDO,0) + ' +
        'NVL(JS.VLRMORASALDO,0) - NVL(ABONO.TOT_ABONO,0),2)  AS VLRDEVIDO' +
        '  '
      '  FROM PARCFINANCIMOV PF, '
      '       CONDPAGIMOVEL  CP, '
      '       CONTRATOIMOVEL CI, '
      '       PESSOA P,          '
      '       ( '
      '         SELECT /*+ INDEX(LD) INDEX(RP)*/   '
      '                IDPARCFINANCIMOV, '
      
        '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.DATAPAGAMENTO' +
        '), MAX(RP.DATABAIXA) ) AS DATAPAGAMENTO, '
      
        '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), SUM' +
        '(LD.VALOR) ) AS VLRPAGO '
      
        '           FROM PARCFINANCIMOV P, LANCTODOCUM LD, RECBTOPAGTO RP' +
        ' '
      '          WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+) '
      '            AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) '
      '            AND LD.NUMLANCTO    = RP.NUMLANCTO(+)    '
      
        '            AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO <' +
        '= 11/08/2006 ) OR'
      
        '                 (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPER' +
        'ACAO) = '#39'5'#39' OR LD.CODALTERADOR = 215 ) '
      
        '                                             AND LD.ESTORNO IS N' +
        'ULL            '
      
        '                                             AND LD.DATALANCTO <' +
        '= 11/08/2006 ) )  '
      
        '          GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO             ' +
        '               '
      '       ) PP, '
      '       ( SELECT A.IDCONDINICIAL  AS IDCONDINICIAL, '
      '                A.NUMPARCELAS    AS NUMPARCELAS,   '
      '                A.DATAINI,                         '
      '                A.IDCONDPAGIMOVEL                  '
      '           FROM CONDPAGIMOVEL A,                   '
      '                (SELECT IDCONDINICIAL,             '
      '                        MAX(DATAINI) AS DATAINI    '
      '                   FROM CONDPAGIMOVEL              '
      '                  GROUP BY IDCONDINICIAL) B        '
      '          WHERE B.IDCONDINICIAL = A.IDCONDINICIAL  '
      '            AND B.DATAINI       = A.DATAINI ) CPFINAL,    '
      '       ( '
      
        '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRCORRIGIDOA' +
        'TRASO '
      '         FROM ( SELECT /*+ INDEX (L) */ '
      
        '                     L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRAC' +
        'UM) AS VLRCORRIGIDOATRASO '
      '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P.IDPESSOA = 1'
      '                AND L.IDCONTRATOIMOVEL = 1848'
      '                AND ( L.IDOPERACAO = P.IDOPERATUALCM ) '
      '                AND L.DATABAIXA IS NOT NULL '
      '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX' +
        '(L2.DATAOPER) AS DTAPUR '
      '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P2.IDPESSOA = 1'
      '                AND L2.IDCONTRATOIMOVEL = 1848'
      '                AND ( L2.IDOPERACAO = P2.IDOPERATUALCM ) '
      '                AND ( DATAOPER <= 11/08/2006) '
      '                AND L2.DATABAIXA IS NOT NULL '
      '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '                AND D1.DATAOPER = D2.DTAPUR '
      '       ) CMA, '
      '       ( '
      
        '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMULTAATRAS' +
        'O '
      '         FROM ( SELECT /*+ INDEX (L) */ '
      
        '                    L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACU' +
        'M) AS VLRMULTAATRASO '
      '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P.IDPESSOA =  1'
      '                AND L.IDCONTRATOIMOVEL = 1848'
      '                AND ( L.IDOPERACAO = P.IDOPERATUALMULTA ) '
      '                AND L.DATABAIXA IS NOT NULL '
      '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX' +
        '(L2.DATAOPER) AS DTAPUR '
      '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P2.IDPESSOA =  1'
      '                AND L2.IDCONTRATOIMOVEL = 1848'
      '                AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA ) '
      '                AND ( DATAOPER <= 11/08/2006) '
      '                AND L2.DATABAIXA IS NOT NULL '
      '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '         AND D1.DATAOPER = D2.DTAPUR '
      '       ) MA, '
      '       ( '
      '        SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMORAATRASO '
      '        FROM ( SELECT /*+ INDEX (L) */ '
      
        '                   L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM' +
        ') AS VLRMORAATRASO '
      '               FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '               AND P.IDPESSOA =  1'
      '                AND L.IDCONTRATOIMOVEL = 1848'
      '               AND ( L.IDOPERACAO = P.IDOPERATUALJUROS ) '
      '               AND L.DATABAIXA IS NOT NULL '
      '               GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '             ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(' +
        'L2.DATAOPER) AS DTAPUR '
      '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '               AND P2.IDPESSOA =  1'
      '                AND L2.IDCONTRATOIMOVEL = 1848'
      '               AND ( L2.IDOPERACAO = P2.IDOPERATUALJUROS ) '
      '               AND ( DATAOPER <= 11/08/2006) '
      '               AND L2.DATABAIXA IS NOT NULL '
      '               GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '        WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '        AND D1.DATAOPER = D2.DTAPUR '
      '       ) JA, '
      '       ( '
      
        '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRCORRIGIDOS' +
        'ALDO '
      '         FROM ( SELECT /*+ INDEX (L) */ '
      
        '                     L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRAC' +
        'UM) AS VLRCORRIGIDOSALDO '
      '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P.IDPESSOA = 1'
      '                AND L.IDCONTRATOIMOVEL = 1848'
      '                AND ( L.IDOPERACAO = P.IDOPERATUALCM ) '
      '                AND L.DATABAIXA IS NULL '
      '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX' +
        '(L2.DATAOPER) AS DTAPUR '
      '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P2.IDPESSOA = 1'
      '                AND L2.IDCONTRATOIMOVEL = 1848'
      '                AND ( L2.IDOPERACAO = P2.IDOPERATUALCM ) '
      '                AND ( DATAOPER <= 11/08/2006) '
      '                AND L2.DATABAIXA IS NULL '
      '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '                AND D1.DATAOPER = D2.DTAPUR '
      '       ) CMS, '
      '       ( '
      
        '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMULTASALDO' +
        ' '
      '         FROM ( SELECT /*+ INDEX (L) */ '
      
        '                    L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACU' +
        'M) AS VLRMULTASALDO '
      '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P.IDPESSOA =  1'
      '                AND L.IDCONTRATOIMOVEL = 1848'
      '                AND ( L.IDOPERACAO = P.IDOPERATUALMULTA ) '
      '                AND L.DATABAIXA IS NULL '
      '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX' +
        '(L2.DATAOPER) AS DTAPUR '
      '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P2.IDPESSOA =  1'
      '                AND L2.IDCONTRATOIMOVEL = 1848'
      '                AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA ) '
      '                AND ( DATAOPER <= 11/08/2006) '
      '                AND L2.DATABAIXA IS NULL '
      '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '         AND D1.DATAOPER = D2.DTAPUR '
      '       ) MS, '
      '       ( '
      '        SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMORASALDO '
      '        FROM ( SELECT /*+ INDEX (L) */ '
      
        '                   L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM' +
        ') AS VLRMORASALDO '
      '               FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '               AND P.IDPESSOA =  1'
      '                AND L.IDCONTRATOIMOVEL = 1848'
      '               AND ( L.IDOPERACAO = P.IDOPERATUALJUROS ) '
      '               AND L.DATABAIXA IS NULL '
      '               GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '             ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(' +
        'L2.DATAOPER) AS DTAPUR '
      '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '               AND P2.IDPESSOA =  1'
      '                AND L2.IDCONTRATOIMOVEL = 1848'
      '               AND ( L2.IDOPERACAO = P2.IDOPERATUALJUROS ) '
      '               AND ( DATAOPER <= 11/08/2006) '
      '               AND L2.DATABAIXA IS NULL '
      '               GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '        WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '        AND D1.DATAOPER = D2.DTAPUR '
      '       ) JS, '
      '       ( SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.TOT_ABONO '
      '       FROM ( SELECT /*+ INDEX (L) */ '
      
        '                  L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM)' +
        ' AS TOT_ABONO '
      '              FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '              WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND L.IDMODULO = 135 '
      '                AND P.IDPESSOA =  1'
      '                AND L.IDCONTRATOIMOVEL = 1848'
      '                AND ( L.IDOPERACAO = P.IDOPERABONOMULTA OR '
      '                      L.IDOPERACAO = P.IDOPERABONOJUROS OR '
      '                      L.IDOPERACAO = P.IDOPERABONOCM ) '
      '              GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '           ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2' +
        '.DATAOPER) AS DTAPUR '
      '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '              WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND L2.IDMODULO = 135 '
      '                AND P2.IDPESSOA = 1'
      '                AND L2.IDCONTRATOIMOVEL = 1848'
      '         AND ( L2.IDOPERACAO = P2.IDOPERABONOMULTA OR '
      '               L2.IDOPERACAO = P2.IDOPERABONOJUROS OR '
      '               L2.IDOPERACAO = P2.IDOPERABONOCM ) '
      '         AND ( DATAOPER <= 11/08/2006 ) '
      '       GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      'WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      'AND D1.DATAOPER = D2.DTAPUR '
      ') ABONO, '
      '       ( SELECT DISTINCT                                  '
      '                CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL, '
      '                M.IMONOME   AS NOMEMESTRE,                '
      '                M.IDIMOVEL  AS IDIMOVELMESTRE,            '
      '                C.UF        AS UF    '
      '           FROM CONTRATOXIMOVEL CXI, '
      '                IMOVEL I, '
      '                IMOVEL M, '
      '                CIDADES C '
      '          WHERE CXI.IDIMOVEL = I.IDIMOVEL'
      '           AND  M.IDCIDADES = C.IDCIDADES(+)'
      '           AND  I.IDIMOVELMESTRE = M.IDIMOVEL ) IM'
      '  WHERE (PF.FLGTIPOLANC IN (2,3,4,5,6,7,8,9))'
      '    AND (NVL(PF.FLGCONCILIADO,'#39'N'#39') IN ('#39'N'#39','#39'P'#39'))'
      '    AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)'
      '    AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      '    AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL)'
      '    AND (PP.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)'
      '    AND (PF.IDPARCFINANCIMOV = MA.IDPARCFINANCIMOV(+))'
      '    AND (PF.IDPARCFINANCIMOV = JA.IDPARCFINANCIMOV(+))'
      '    AND (PF.IDPARCFINANCIMOV = CMA.IDPARCFINANCIMOV(+))'
      '    AND (PF.IDPARCFINANCIMOV = MS.IDPARCFINANCIMOV(+))'
      '    AND (PF.IDPARCFINANCIMOV = JS.IDPARCFINANCIMOV(+))'
      '    AND (PF.IDPARCFINANCIMOV = CMS.IDPARCFINANCIMOV(+))'
      '    AND (PF.IDPARCFINANCIMOV = ABONO.IDPARCFINANCIMOV(+))'
      '    AND (P.IDPESSOA(+) = CI.IDLOCATARIO)'
      '    AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL)'
      ''
      '    AND ( (:pDTINI IS NULL) OR (PF.DATAVENCIMENTO >= :pDTINI) )'
      '    AND ( (:pDTFIM IS NULL) OR (PF.DATAVENCIMENTO <=  :pDTFIM) )'
      '    AND ( CI.FLGTIPOCONTRATO = :pFLGTIPOCONTRATO )'
      
        '  ORDER BY CONNUMERO, PF.IDCONDPAGIMOVEL, DATAVENCIMENTO, PF.FLG' +
        'TIPOLANC, NUMPARCELA'
      ''
      ' '
      ' '
      ''
      ' ')
    ValidateWithMask = True
    Left = 474
    Top = 333
    ParamData = <
      item
        DataType = ftDate
        Name = 'pDTINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDTINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFLGTIPOCONTRATO'
        ParamType = ptUnknown
      end>
    object qryInadAnaNovoIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
    end
    object qryInadAnaNovoIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryInadAnaNovoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryInadAnaNovoCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryInadAnaNovoCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object qryInadAnaNovoNOMECONTRATO: TStringField
      FieldName = 'NOMECONTRATO'
      Size = 83
    end
    object qryInadAnaNovoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryInadAnaNovoNUMPARCELA: TStringField
      FieldName = 'NUMPARCELA'
      Size = 81
    end
    object qryInadAnaNovoDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryInadAnaNovoVLRPRESTACAO: TFloatField
      FieldName = 'VLRPRESTACAO'
    end
    object qryInadAnaNovoFLGTIPOLANC: TFloatField
      FieldName = 'FLGTIPOLANC'
    end
    object qryInadAnaNovoFLGLANCINTEGRA: TFloatField
      FieldName = 'FLGLANCINTEGRA'
    end
    object qryInadAnaNovoDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
    end
    object qryInadAnaNovoVLRPAGO: TFloatField
      FieldName = 'VLRPAGO'
    end
    object qryInadAnaNovoDIASDIF: TFloatField
      FieldName = 'DIASDIF'
    end
    object qryInadAnaNovoVLRCMATRASO: TFloatField
      FieldName = 'VLRCMATRASO'
    end
    object qryInadAnaNovoVLRMULTAATRASO: TFloatField
      FieldName = 'VLRMULTAATRASO'
    end
    object qryInadAnaNovoVLRMORAATRASO: TFloatField
      FieldName = 'VLRMORAATRASO'
    end
    object qryInadAnaNovoVLRDIF: TFloatField
      FieldName = 'VLRDIF'
    end
    object qryInadAnaNovoVLRCMCORRIG: TFloatField
      FieldName = 'VLRCMCORRIG'
    end
    object qryInadAnaNovoVLRMULTACORRIG: TFloatField
      FieldName = 'VLRMULTACORRIG'
    end
    object qryInadAnaNovoVLRJUROSCORRIG: TFloatField
      FieldName = 'VLRJUROSCORRIG'
    end
    object qryInadAnaNovoVLRDEVIDO: TFloatField
      FieldName = 'VLRDEVIDO'
    end
    object qryInadAnaNovoCAL_TIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CAL_TIPO'
      Calculated = True
    end
  end
  object updInadAnaNovo: TUpdateSQL
    Left = 403
    Top = 338
  end
end
