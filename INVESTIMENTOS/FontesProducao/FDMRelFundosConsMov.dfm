inherited DmRelFundosConsMov: TDmRelFundosConsMov
  Left = 0
  Top = 196
  Width = 984
  Height = 242
  Caption = 'DmRelFundosConsMov'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 42
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
    Left = 42
    Top = 8
  end
  inherited qryExemplo: TwwQuery
    Left = 42
    Top = 8
  end
  inherited rpExemplo: TppReport
    Left = 45
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object RpConsMovFundos: TppReport
    AutoStop = False
    DataPipeline = ppBDEConsMovFundos
    OnStartPage = RpConsMovFundosStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Movimentação dos Fundos de Investimento'
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
    Left = 144
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDEConsMovFundos'
    object ppHeaderBand18: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'RpConsCartRendVarShape1'
        Brush.Color = clSilver
        mmHeight = 7673
        mmLeft = 265
        mmTop = 21960
        mmWidth = 284163
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel107'
        Caption = 'Tipo de Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 32808
        mmTop = 25929
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel123: TppLabel
        UserName = 'ppLabel108'
        Caption = 'Quantidade de Cotas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 179917
        mmTop = 22754
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel124: TppLabel
        UserName = 'ppLabel110'
        Caption = 'Valor Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 201877
        mmTop = 25665
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel127: TppLabel
        UserName = 'ppLabel113'
        Caption = 'Data do Movimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 1588
        mmTop = 22754
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel125: TppLabel
        UserName = 'Label125'
        Caption = 'Fundo de Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 16404
        mmTop = 23019
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel128: TppLabel
        UserName = 'ppLabel1101'
        Caption = 'IRRF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 225425
        mmTop = 25665
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel129: TppLabel
        UserName = 'Label129'
        Caption = 'IOF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 243153
        mmTop = 25665
        mmWidth = 3969
        BandType = 0
      end
      object ppLabel135: TppLabel
        UserName = 'Label135'
        Caption = 'Data de Liquidação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 125413
        mmTop = 22754
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel130: TppLabel
        UserName = 'Label130'
        Caption = 'Valor Líquido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 268288
        mmTop = 25665
        mmWidth = 15610
        BandType = 0
      end
      object LblPlanoMov: TppLabel
        UserName = 'LblPlanoMov'
        Caption = 'LblPlanoMov'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 261938
        mmTop = 8731
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel3: TppLabel
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
        mmLeft = 112184
        mmTop = 22754
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Consulta da Movimentação dos Fundos de Investimentos   -'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 18785
        mmTop = 8731
        mmWidth = 100246
        BandType = 0
      end
      object ppLabel32: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa22'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 18785
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object ppPeriodo: TppLabel
        UserName = 'LPeriodo12'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 18785
        mmTop = 15081
        mmWidth = 11113
        BandType = 0
      end
      object ppDBImage23: TppDBImage
        UserName = 'DbLogo22'
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
      object ppLabel1: TppLabel
        UserName = 'Label2'
        Caption = 'Valor da Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 148432
        mmTop = 25665
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText38: TppDBText
        UserName = 'DBText27'
        DataField = 'DESCTIPOFUNDOINV'
        DataPipeline = ppBDEConsMovFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        DataPipelineName = 'ppBDEConsMovFundos'
        mmHeight = 4233
        mmLeft = 119327
        mmTop = 8731
        mmWidth = 68263
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Taxas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 255323
        mmTop = 25665
        mmWidth = 6879
        BandType = 0
      end
    end
    object dtbDetalhe: TppDetailBand
      BeforePrint = dtbDetalheBeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 265
        mmTop = 265
        mmWidth = 284163
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'ppDBText50'
        DataField = 'QTDOPERACAO'
        DataPipeline = ppBDEConsMovFundos
        DisplayFormat = '###,###,###,###0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsMovFundos'
        mmHeight = 2910
        mmLeft = 164836
        mmTop = 794
        mmWidth = 28575
        BandType = 4
      end
      object ppDBText59: TppDBText
        UserName = 'ppDBText51'
        DataField = 'VLROPERACAO'
        DataPipeline = ppBDEConsMovFundos
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsMovFundos'
        mmHeight = 2910
        mmLeft = 193940
        mmTop = 794
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'DBText62'
        DataField = 'VLRIR'
        DataPipeline = ppBDEConsMovFundos
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsMovFundos'
        mmHeight = 2910
        mmLeft = 215636
        mmTop = 794
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'DBText63'
        DataField = 'VLRIOF'
        DataPipeline = ppBDEConsMovFundos
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsMovFundos'
        mmHeight = 2910
        mmLeft = 231775
        mmTop = 794
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText64: TppDBText
        UserName = 'DBText64'
        DataField = 'VLRLIQUIDO'
        DataPipeline = ppBDEConsMovFundos
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsMovFundos'
        mmHeight = 2910
        mmLeft = 262467
        mmTop = 794
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText65: TppDBText
        UserName = 'DBText65'
        DataField = 'DATALIQUIDACAO'
        DataPipeline = ppBDEConsMovFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEConsMovFundos'
        mmHeight = 2910
        mmLeft = 125413
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText112: TppDBText
        UserName = 'ppDBText501'
        DataField = 'VLRCOTA'
        DataPipeline = ppBDEConsMovFundos
        DisplayFormat = '###,###,###,###0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsMovFundos'
        mmHeight = 2910
        mmLeft = 138642
        mmTop = 794
        mmWidth = 25665
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'DATAAPLICACAO'
        DataPipeline = ppBDEConsMovFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEConsMovFundos'
        mmHeight = 2910
        mmLeft = 112184
        mmTop = 794
        mmWidth = 12700
        BandType = 4
      end
      object srptObservacoes: TppSubReport
        OnPrint = srptObservacoesPrint
        UserName = 'srptObservacoes'
        DrillDownComponent = ppDBTDescTpoOper
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppBDEObservacoes'
        mmHeight = 4233
        mmLeft = 0
        mmTop = 4233
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppBDEObservacoes
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Movimentação dos Fundos de Investimento'
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
          Left = 96
          Top = 112
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppBDEObservacoes'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand1: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 6615
            mmPrintPosition = 0
            object shpObservacao: TppShape
              UserName = 'shpObservacao'
              Brush.Color = 14935011
              Pen.Style = psClear
              mmHeight = 6615
              mmLeft = 265
              mmTop = 0
              mmWidth = 281253
              BandType = 4
            end
            object lblObs: TppLabel
              UserName = 'Label2'
              Caption = 'Obs.: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              mmHeight = 2381
              mmLeft = 19050
              mmTop = 265
              mmWidth = 5556
              BandType = 4
            end
            object ppdbObservacao: TppDBText
              UserName = 'ppdbObservacao'
              DataField = 'OBSERVACAO'
              DataPipeline = ppBDEObservacoes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              SuppressRepeatedValues = True
              Transparent = True
              DataPipelineName = 'ppBDEObservacoes'
              mmHeight = 5556
              mmLeft = 26988
              mmTop = 265
              mmWidth = 254265
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppDBTDescTpoOper: TppDBText
        UserName = 'ppDBTDescTpoOper'
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = ppBDEConsMovFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEConsMovFundos'
        mmHeight = 2910
        mmLeft = 32808
        mmTop = 794
        mmWidth = 78846
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'DBText39'
        DataField = 'DESCTIPOCOTA'
        DataPipeline = ppBDEConsMovFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsItalic]
        Transparent = True
        DataPipelineName = 'ppBDEConsMovFundos'
        mmHeight = 2910
        mmLeft = 265
        mmTop = 794
        mmWidth = 31750
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VLRTAXAS'
        DataPipeline = ppBDEConsMovFundos
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsMovFundos'
        mmHeight = 2910
        mmLeft = 247386
        mmTop = 794
        mmWidth = 14817
        BandType = 4
      end
    end
    object ppFooterBand17: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        OnPrint = LblSistemaPrint
        UserName = 'SystemVariable1'
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
        mmWidth = 281253
        BandType = 8
      end
      object ppLine52: TppLine
        UserName = 'Line52'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 265
        mmTop = 1852
        mmWidth = 283898
        BandType = 8
      end
      object ppLabel132: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'Label131'
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
        mmWidth = 283634
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
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
        mmWidth = 27252
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 51065
      mmPrintPosition = 0
      object ppLabel133: TppLabel
        UserName = 'ppLabel118'
        Caption = 'Total de Aplicação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 1588
        mmTop = 2910
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel136: TppLabel
        UserName = 'Label132'
        Caption = 'Total de Resgate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 1588
        mmTop = 7938
        mmWidth = 19579
        BandType = 7
      end
      object ppLine93: TppLine
        UserName = 'Line93'
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 265
        mmTop = 1323
        mmWidth = 284163
        BandType = 7
      end
      object ppLine53: TppLine
        UserName = 'Line53'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 265
        mmTop = 6615
        mmWidth = 283899
        BandType = 7
      end
      object ppLine54: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 265
        mmTop = 11377
        mmWidth = 283899
        BandType = 7
      end
      object ppLabel2: TppLabel
        UserName = 'Label3'
        Caption = 'Total Outros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 1588
        mmTop = 40481
        mmWidth = 14552
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 265
        mmTop = 44186
        mmWidth = 283899
        BandType = 7
      end
      object ppDBText1: TppDBText
        UserName = 'DBText2'
        BlankWhenZero = True
        DataField = 'VLRLIQUIDO'
        DataPipeline = ppBDETotOutro
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotOutro'
        mmHeight = 2910
        mmLeft = 262467
        mmTop = 40481
        mmWidth = 21431
        BandType = 7
      end
      object ppDBText2: TppDBText
        UserName = 'DBText3'
        DataField = 'VLRIOF'
        DataPipeline = ppBDETotOutro
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotOutro'
        mmHeight = 2910
        mmLeft = 231775
        mmTop = 40481
        mmWidth = 15346
        BandType = 7
      end
      object ppDBText3: TppDBText
        UserName = 'DBText4'
        DataField = 'VLRIR'
        DataPipeline = ppBDETotOutro
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotOutro'
        mmHeight = 2910
        mmLeft = 215636
        mmTop = 40481
        mmWidth = 15610
        BandType = 7
      end
      object ppDBText4: TppDBText
        UserName = 'DBText5'
        DataField = 'VLROPERACAO'
        DataPipeline = ppBDETotOutro
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotOutro'
        mmHeight = 2910
        mmLeft = 193940
        mmTop = 40481
        mmWidth = 21167
        BandType = 7
      end
      object ppDBText5: TppDBText
        UserName = 'ppDBText502'
        DataField = 'QTDOPERACAO'
        DataPipeline = ppBDETotOutro
        DisplayFormat = '###,###,###,###0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotOutro'
        mmHeight = 2910
        mmLeft = 164836
        mmTop = 40481
        mmWidth = 28575
        BandType = 7
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'VLROPERACAO'
        DataPipeline = ppBDETotSub
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotSub'
        mmHeight = 2910
        mmLeft = 193940
        mmTop = 12435
        mmWidth = 21167
        BandType = 7
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'QTDOPERACAO'
        DataPipeline = ppBDETotSub
        DisplayFormat = '###,###,###,###0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotSub'
        mmHeight = 2910
        mmLeft = 164836
        mmTop = 12435
        mmWidth = 28575
        BandType = 7
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Total de Subscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 1588
        mmTop = 12435
        mmWidth = 23283
        BandType = 7
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Total de Integralização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 1588
        mmTop = 17198
        mmWidth = 26194
        BandType = 7
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'QTDOPERACAO'
        DataPipeline = ppBDETotIntegr
        DisplayFormat = '###,###,###,###0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotIntegr'
        mmHeight = 2910
        mmLeft = 164836
        mmTop = 17198
        mmWidth = 28575
        BandType = 7
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'VLROPERACAO'
        DataPipeline = ppBDETotIntegr
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotIntegr'
        mmHeight = 2910
        mmLeft = 193940
        mmTop = 17198
        mmWidth = 21167
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 265
        mmTop = 16140
        mmWidth = 283899
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line4'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 265
        mmTop = 20902
        mmWidth = 283899
        BandType = 7
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'VLRLIQUIDO'
        DataPipeline = ppBDETotSub
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotSub'
        mmHeight = 2910
        mmLeft = 262467
        mmTop = 12435
        mmWidth = 21431
        BandType = 7
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        BlankWhenZero = True
        DataField = 'VLRLIQUIDO'
        DataPipeline = ppBDETotIntegr
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotIntegr'
        mmHeight = 2910
        mmLeft = 262467
        mmTop = 17198
        mmWidth = 21431
        BandType = 7
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'VLRLIQUIDO'
        DataPipeline = ppBDETotApl
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotApl'
        mmHeight = 2910
        mmLeft = 262467
        mmTop = 3175
        mmWidth = 21431
        BandType = 7
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'VLROPERACAO'
        DataPipeline = ppBDETotApl
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotApl'
        mmHeight = 2910
        mmLeft = 193940
        mmTop = 3175
        mmWidth = 21167
        BandType = 7
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'QTDOPERACAO'
        DataPipeline = ppBDETotApl
        DisplayFormat = '###,###,###,###0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotApl'
        mmHeight = 2910
        mmLeft = 164836
        mmTop = 3175
        mmWidth = 28575
        BandType = 7
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'QTDOPERACAO'
        DataPipeline = ppBDETotResg
        DisplayFormat = '###,###,###,###0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotResg'
        mmHeight = 2910
        mmLeft = 164836
        mmTop = 7673
        mmWidth = 28575
        BandType = 7
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'VLROPERACAO'
        DataPipeline = ppBDETotResg
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotResg'
        mmHeight = 2910
        mmLeft = 193940
        mmTop = 7673
        mmWidth = 21167
        BandType = 7
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'VLRIR'
        DataPipeline = ppBDETotResg
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotResg'
        mmHeight = 2910
        mmLeft = 215636
        mmTop = 7673
        mmWidth = 15610
        BandType = 7
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'VLRIOF'
        DataPipeline = ppBDETotResg
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotResg'
        mmHeight = 2910
        mmLeft = 231775
        mmTop = 7673
        mmWidth = 15346
        BandType = 7
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'VLRLIQUIDO'
        DataPipeline = ppBDETotResg
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotResg'
        mmHeight = 2910
        mmLeft = 262467
        mmTop = 7673
        mmWidth = 21431
        BandType = 7
      end
      object ppLine4: TppLine
        UserName = 'Line5'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 265
        mmTop = 30427
        mmWidth = 283899
        BandType = 7
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'VLRLIQUIDO'
        DataPipeline = ppBDETotAmort
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotAmort'
        mmHeight = 2910
        mmLeft = 262467
        mmTop = 26988
        mmWidth = 21431
        BandType = 7
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'VLROPERACAO'
        DataPipeline = ppBDETotAmort
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotAmort'
        mmHeight = 2910
        mmLeft = 193940
        mmTop = 26723
        mmWidth = 21167
        BandType = 7
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Total de Amortização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 1588
        mmTop = 26723
        mmWidth = 24606
        BandType = 7
      end
      object ppLine6: TppLine
        UserName = 'Line7'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 265
        mmTop = 25665
        mmWidth = 283899
        BandType = 7
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Total de Amortização a Receber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 1588
        mmTop = 21960
        mmWidth = 37042
        BandType = 7
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'VLRLIQUIDO'
        DataPipeline = ppBDETotAmortRec
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotAmortRec'
        mmHeight = 2910
        mmLeft = 262467
        mmTop = 22225
        mmWidth = 21431
        BandType = 7
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'VLROPERACAO'
        DataPipeline = ppBDETotAmortRec
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotAmortRec'
        mmHeight = 2910
        mmLeft = 193940
        mmTop = 21960
        mmWidth = 21167
        BandType = 7
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'VLRIR'
        DataPipeline = ppBDETotApl
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotApl'
        mmHeight = 2910
        mmLeft = 215636
        mmTop = 3175
        mmWidth = 15610
        BandType = 7
      end
      object ppDBText27: TppDBText
        UserName = 'DBText201'
        DataField = 'VLRIOF'
        DataPipeline = ppBDETotApl
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotApl'
        mmHeight = 2910
        mmLeft = 231775
        mmTop = 3175
        mmWidth = 15346
        BandType = 7
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Total Transf. Acréscimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 1588
        mmTop = 31485
        mmWidth = 27781
        BandType = 7
      end
      object ppLine7: TppLine
        UserName = 'Line8'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 265
        mmTop = 35190
        mmWidth = 283899
        BandType = 7
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'VLRLIQUIDO'
        DataPipeline = ppBDETotTransfEntr
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotTransfEntr'
        mmHeight = 2910
        mmLeft = 262467
        mmTop = 31485
        mmWidth = 21431
        BandType = 7
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        DataField = 'VLRIOF'
        DataPipeline = ppBDETotTransfEntr
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotTransfEntr'
        mmHeight = 2910
        mmLeft = 231775
        mmTop = 31485
        mmWidth = 15346
        BandType = 7
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'VLRIR'
        DataPipeline = ppBDETotTransfEntr
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotTransfEntr'
        mmHeight = 2910
        mmLeft = 215636
        mmTop = 31485
        mmWidth = 15610
        BandType = 7
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'VLROPERACAO'
        DataPipeline = ppBDETotTransfEntr
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotTransfEntr'
        mmHeight = 2910
        mmLeft = 193940
        mmTop = 31485
        mmWidth = 21167
        BandType = 7
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'QTDOPERACAO'
        DataPipeline = ppBDETotTransfEntr
        DisplayFormat = '###,###,###,###0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotTransfEntr'
        mmHeight = 2910
        mmLeft = 164836
        mmTop = 31485
        mmWidth = 28575
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Total Transf. Baixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 1588
        mmTop = 35983
        mmWidth = 21696
        BandType = 7
      end
      object ppLine8: TppLine
        UserName = 'Line9'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 265
        mmTop = 39423
        mmWidth = 283899
        BandType = 7
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        DataField = 'VLRLIQUIDO'
        DataPipeline = ppBDETotTransfSaida
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotTransfSaida'
        mmHeight = 2910
        mmLeft = 262467
        mmTop = 35983
        mmWidth = 21431
        BandType = 7
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = 'VLRIOF'
        DataPipeline = ppBDETotTransfSaida
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotTransfSaida'
        mmHeight = 2910
        mmLeft = 231775
        mmTop = 35983
        mmWidth = 15346
        BandType = 7
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        DataField = 'VLRIR'
        DataPipeline = ppBDETotTransfSaida
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotTransfSaida'
        mmHeight = 2910
        mmLeft = 215636
        mmTop = 35983
        mmWidth = 15610
        BandType = 7
      end
      object ppDBText36: TppDBText
        UserName = 'DBText36'
        DataField = 'VLROPERACAO'
        DataPipeline = ppBDETotTransfSaida
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotTransfSaida'
        mmHeight = 2910
        mmLeft = 193940
        mmTop = 35983
        mmWidth = 21167
        BandType = 7
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        DataField = 'QTDOPERACAO'
        DataPipeline = ppBDETotTransfSaida
        DisplayFormat = '###,###,###,###0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotTransfSaida'
        mmHeight = 2910
        mmLeft = 164836
        mmTop = 35983
        mmWidth = 28575
        BandType = 7
      end
      object ppDBText41: TppDBText
        UserName = 'DBText41'
        DataField = 'VLRTAXAS'
        DataPipeline = ppBDETotApl
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotApl'
        mmHeight = 2910
        mmLeft = 247386
        mmTop = 3175
        mmWidth = 14817
        BandType = 7
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        DataField = 'VLRTAXAS'
        DataPipeline = ppBDETotResg
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotResg'
        mmHeight = 2910
        mmLeft = 247386
        mmTop = 7673
        mmWidth = 14817
        BandType = 7
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        DataField = 'VLRTAXAS'
        DataPipeline = ppBDETotIntegr
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotIntegr'
        mmHeight = 2910
        mmLeft = 247386
        mmTop = 17198
        mmWidth = 14817
        BandType = 7
      end
      object ppDBText45: TppDBText
        UserName = 'DBText45'
        DataField = 'VLRTAXAS'
        DataPipeline = ppBDETotAmort
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotAmort'
        mmHeight = 2910
        mmLeft = 247386
        mmTop = 26988
        mmWidth = 14817
        BandType = 7
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'DESCTIPOFUNDOINV'
      DataPipeline = ppBDEConsMovFundos
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEConsMovFundos'
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
    object ppGroup2: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = ppBDEConsMovFundos
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEConsMovFundos'
      object ghbPlano: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppDBText40: TppDBText
          UserName = 'ppdbDescFundo1'
          DataField = 'PLANPRVCONTABPATRO'
          DataPipeline = ppBDEConsMovFundos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'ppBDEConsMovFundos'
          mmHeight = 3175
          mmLeft = 265
          mmTop = 1588
          mmWidth = 78846
          BandType = 3
          GroupNo = 1
        end
        object ppLine10: TppLine
          UserName = 'Line11'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1588
          mmLeft = 265
          mmTop = 529
          mmWidth = 284163
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'DATAOPERACAO'
      DataPipeline = ppBDEConsMovFundos
      OutlineSettings.CreateNode = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEConsMovFundos'
      object ghbDataOperacao: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 1323
        mmPrintPosition = 0
        object ppLine5: TppLine
          UserName = 'Line6'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 265
          mmTop = 0
          mmWidth = 284163
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'DESCFUNDOINVEST'
      DataPipeline = ppBDEConsMovFundos
      OutlineSettings.CreateNode = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEConsMovFundos'
      object ghbFundo: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppDBText60: TppDBText
          UserName = 'DBText60'
          DataField = 'DESCFUNDOINVEST'
          DataPipeline = ppBDEConsMovFundos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEConsMovFundos'
          mmHeight = 2910
          mmLeft = 16404
          mmTop = 529
          mmWidth = 102923
          BandType = 3
          GroupNo = 2
        end
        object ppDBText61: TppDBText
          UserName = 'DBText1'
          DataField = 'DATAOPERACAO'
          DataPipeline = ppBDEConsMovFundos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          Transparent = True
          DataPipelineName = 'ppBDEConsMovFundos'
          mmHeight = 2910
          mmLeft = 1588
          mmTop = 529
          mmWidth = 14552
          BandType = 3
          GroupNo = 2
        end
      end
      object gfbFundo: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 1058
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCTIPOOPERACAO'
      DataPipeline = ppBDEConsMovFundos
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEConsMovFundos'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object gfbTipoOperacao: TppGroupFooterBand
        AfterPrint = gfbTipoOperacaoAfterPrint
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object dbcVlrOperacao: TppDBCalc
          UserName = 'dbcVlrOperacao'
          OnGetText = dbcVlrOperacaoGetText
          DataField = 'VLROPERACAO'
          DataPipeline = ppBDEConsMovFundos
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEConsMovFundos'
          mmHeight = 2910
          mmLeft = 193940
          mmTop = 1323
          mmWidth = 21167
          BandType = 5
          GroupNo = 3
        end
        object dbcVlrIR: TppDBCalc
          UserName = 'dbcVlrIR'
          DataField = 'VLRIR'
          DataPipeline = ppBDEConsMovFundos
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEConsMovFundos'
          mmHeight = 2910
          mmLeft = 215636
          mmTop = 1323
          mmWidth = 15610
          BandType = 5
          GroupNo = 3
        end
        object dbcQtdOperacao: TppDBCalc
          UserName = 'dbcQtdOperacao'
          DataField = 'QTDOPERACAO'
          DataPipeline = ppBDEConsMovFundos
          DisplayFormat = '###,###,###,###0.000000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEConsMovFundos'
          mmHeight = 2910
          mmLeft = 164836
          mmTop = 1323
          mmWidth = 28575
          BandType = 5
          GroupNo = 3
        end
        object dbcVlrIOF: TppDBCalc
          UserName = 'dbcVlrIOF'
          DataField = 'VLRIOF'
          DataPipeline = ppBDEConsMovFundos
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEConsMovFundos'
          mmHeight = 2910
          mmLeft = 231775
          mmTop = 1323
          mmWidth = 15346
          BandType = 5
          GroupNo = 3
        end
        object dbcVlrLiquido: TppDBCalc
          UserName = 'dbcVlrLiquido'
          DataField = 'VLRLIQUIDO'
          DataPipeline = ppBDEConsMovFundos
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEConsMovFundos'
          mmHeight = 2910
          mmLeft = 262467
          mmTop = 1323
          mmWidth = 21431
          BandType = 5
          GroupNo = 3
        end
        object pplSomatorio: TppLine
          UserName = 'pplSomatorio'
          Style = lsDouble
          Weight = 0.75
          mmHeight = 2117
          mmLeft = 164571
          mmTop = 0
          mmWidth = 119856
          BandType = 5
          GroupNo = 3
        end
        object dbcVlrTaxa: TppDBCalc
          UserName = 'dbcVlrTaxa'
          DataField = 'VLRTAXAS'
          DataPipeline = ppBDEConsMovFundos
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEConsMovFundos'
          mmHeight = 2910
          mmLeft = 247386
          mmTop = 1323
          mmWidth = 14816
          BandType = 5
          GroupNo = 4
        end
      end
    end
  end
  object ppBDEConsMovFundos: TppBDEPipeline
    DataSource = dsConsMovFundos
    UserName = 'BDEConsMovFundos'
    Left = 43
    Top = 53
    object ppBDEConsMovFundosppField1: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDEConsMovFundosppField2: TppField
      FieldAlias = 'DESCFUNDOINVEST'
      FieldName = 'DESCFUNDOINVEST'
      FieldLength = 60
      DisplayWidth = 24
      Position = 1
    end
    object ppBDEConsMovFundosppField3: TppField
      FieldAlias = 'DESCTIPOOPERACAO'
      FieldName = 'DESCTIPOOPERACAO'
      FieldLength = 60
      DisplayWidth = 16
      Position = 2
    end
    object ppBDEConsMovFundosppField4: TppField
      FieldAlias = 'DATAOPERACAO'
      FieldName = 'DATAOPERACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 10
      Position = 3
    end
    object ppBDEConsMovFundosppField5: TppField
      FieldAlias = 'DATAAPLICACAO'
      FieldName = 'DATAAPLICACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 10
      Position = 4
    end
    object ppBDEConsMovFundosppField6: TppField
      FieldAlias = 'DATALIQUIDACAO'
      FieldName = 'DATALIQUIDACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 10
      Position = 5
    end
    object ppBDEConsMovFundosppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCOTA'
      FieldName = 'VLRCOTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 6
    end
    object ppBDEConsMovFundosppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRTOTAL'
      FieldName = 'VLRTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 7
    end
    object ppBDEConsMovFundosppField9: TppField
      FieldAlias = 'DESCTIPOCOTA'
      FieldName = 'DESCTIPOCOTA'
      FieldLength = 40
      DisplayWidth = 20
      Position = 8
    end
    object ppBDEConsMovFundosppField10: TppField
      FieldAlias = 'DESCTIPOFUNDOINV'
      FieldName = 'DESCTIPOFUNDOINV'
      FieldLength = 80
      DisplayWidth = 80
      Position = 9
    end
    object ppBDEConsMovFundosppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDOPERACAO'
      FieldName = 'QTDOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 20
      Position = 10
    end
    object ppBDEConsMovFundosppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 20
      Position = 11
    end
    object ppBDEConsMovFundosppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIR'
      FieldName = 'VLRIR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppBDEConsMovFundosppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIOF'
      FieldName = 'VLRIOF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppBDEConsMovFundosppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRLIQUIDO'
      FieldName = 'VLRLIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 20
      Position = 14
    end
    object ppBDEConsMovFundosppField16: TppField
      FieldAlias = 'STACONFIRMA'
      FieldName = 'STACONFIRMA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
    object ppBDEConsMovFundosppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOPERACAOFUNDO'
      FieldName = 'IDOPERACAOFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppBDEConsMovFundosppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppBDEConsMovFundosppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPEDIDOFUNDO'
      FieldName = 'IDPEDIDOFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppBDEConsMovFundosppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOINVEST'
      FieldName = 'IDTIPOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppBDEConsMovFundosppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOOPERACAO'
      FieldName = 'IDTIPOOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppBDEConsMovFundosppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFUNDOINVEST'
      FieldName = 'IDFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppBDEConsMovFundosppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRENDIMENTO'
      FieldName = 'VLRRENDIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppBDEConsMovFundosppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDGESTORCARTEIRA'
      FieldName = 'IDGESTORCARTEIRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppBDEConsMovFundosppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOECODIGO'
      FieldName = 'MOECODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppBDEConsMovFundosppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOFUNDOINVEST'
      FieldName = 'IDTIPOFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppBDEConsMovFundosppField27: TppField
      FieldAlias = 'CNPJFUNDO'
      FieldName = 'CNPJFUNDO'
      FieldLength = 25
      DisplayWidth = 25
      Position = 26
    end
    object ppBDEConsMovFundosppField28: TppField
      FieldAlias = 'STAEXCLUSIVO'
      FieldName = 'STAEXCLUSIVO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 27
    end
    object ppBDEConsMovFundosppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'PZOCARENCIA'
      FieldName = 'PZOCARENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object ppBDEConsMovFundosppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'PZOANIVERSARIO'
      FieldName = 'PZOANIVERSARIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object ppBDEConsMovFundosppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'PZOLIQAPLIC'
      FieldName = 'PZOLIQAPLIC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object ppBDEConsMovFundosppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'PZOLIQRESG'
      FieldName = 'PZOLIQRESG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object ppBDEConsMovFundosppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDDECQTD'
      FieldName = 'QTDDECQTD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object ppBDEConsMovFundosppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDDECVALOR'
      FieldName = 'QTDDECVALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object ppBDEConsMovFundosppField35: TppField
      FieldAlias = 'STAFUNDO'
      FieldName = 'STAFUNDO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 34
    end
    object ppBDEConsMovFundosppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'PZOAMORTIZACAO'
      FieldName = 'PZOAMORTIZACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object ppBDEConsMovFundosppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCTXPERFORM'
      FieldName = 'PERCTXPERFORM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object ppBDEConsMovFundosppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCTXADM'
      FieldName = 'PERCTXADM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 37
    end
    object ppBDEConsMovFundosppField39: TppField
      FieldAlias = 'CODFUNCETIP'
      FieldName = 'CODFUNCETIP'
      FieldLength = 30
      DisplayWidth = 30
      Position = 38
    end
    object ppBDEConsMovFundosppField40: TppField
      FieldAlias = 'STAPROVISIONAIR'
      FieldName = 'STAPROVISIONAIR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 39
    end
    object ppBDEConsMovFundosppField41: TppField
      FieldAlias = 'STAPROVISIONAIOF'
      FieldName = 'STAPROVISIONAIOF'
      FieldLength = 1
      DisplayWidth = 1
      Position = 40
    end
    object ppBDEConsMovFundosppField42: TppField
      FieldAlias = 'CONTRCETIP'
      FieldName = 'CONTRCETIP'
      FieldLength = 30
      DisplayWidth = 30
      Position = 41
    end
    object ppBDEConsMovFundosppField43: TppField
      FieldAlias = 'NATUREZAOPERACAO'
      FieldName = 'NATUREZAOPERACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 42
    end
    object ppBDEConsMovFundosppField44: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDAPLICADA'
      FieldName = 'QTDAPLICADA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 43
    end
    object ppBDEConsMovFundosppField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORAPLICADO'
      FieldName = 'VALORAPLICADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 44
    end
    object ppBDEConsMovFundosppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORIRAPLICADO'
      FieldName = 'VALORIRAPLICADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object ppBDEConsMovFundosppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORIOFAPLICADO'
      FieldName = 'VALORIOFAPLICADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 46
    end
    object ppBDEConsMovFundosppField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORLIQAPLICADO'
      FieldName = 'VALORLIQAPLICADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 47
    end
    object ppBDEConsMovFundosppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDRESGATE'
      FieldName = 'QTDRESGATE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 48
    end
    object ppBDEConsMovFundosppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRESGATE'
      FieldName = 'VALORRESGATE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 49
    end
    object ppBDEConsMovFundosppField51: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORIRRESGATE'
      FieldName = 'VALORIRRESGATE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 50
    end
    object ppBDEConsMovFundosppField52: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORIOFRESGATE'
      FieldName = 'VALORIOFRESGATE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 51
    end
    object ppBDEConsMovFundosppField53: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORLIQRESGATE'
      FieldName = 'VALORLIQRESGATE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 52
    end
    object ppBDEConsMovFundosppField54: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDTOTAL'
      FieldName = 'QTDTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 53
    end
    object ppBDEConsMovFundosppField55: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIRTOTAL'
      FieldName = 'VLRIRTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 54
    end
    object ppBDEConsMovFundosppField56: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIOFTOTAL'
      FieldName = 'VLRIOFTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 55
    end
    object ppBDEConsMovFundosppField57: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRLIQTOTAL'
      FieldName = 'VLRLIQTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 56
    end
    object ppBDEConsMovFundosppField58: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 300
      DataType = dtMemo
      DisplayWidth = 10
      Position = 57
      Searchable = False
      Sortable = False
    end
    object ppBDEConsMovFundosppField59: TppField
      FieldAlias = 'STAOBS'
      FieldName = 'STAOBS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 58
    end
    object ppBDEConsMovFundosppField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRTAXAS'
      FieldName = 'VLRTAXAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 59
    end
  end
  object dsConsMovFundos: TwwDataSource
    AutoEdit = False
    DataSet = QryConsMovFundos
    Left = 43
    Top = 145
  end
  object QryConsMovFundos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+INDEX (OPE.XIE4OPERACAOFUNDO)*/'
      
        '   OPE.IDOPERACAOFUNDO   , OPE.IDCARTEIRAINVEST  , OPE.IDPEDIDOF' +
        'UNDO     , OPE.IDTIPOINVEST   ,'
      
        '   OPE.IDTIPOOPERACAO    , OPE.IDFUNDOINVEST     , OPE.DATAOPERA' +
        'CAO      , OPE.DATALIQUIDACAO ,'
      '   OPE.QTDOPERACAO       , OPE.VLRCOTA           ,'
      '   OPE.VLRIR             , NVL(OPE.VLRIOF,0)*-1 AS VLRIOF,'
      '   OPE.VLRRENDIMENTO     ,'
      '   OPE.STACONFIRMA       ,'
      '   OPE.VLROPERACAO   AS VLROPERACAO,'
      '  (OPE.VLROPERACAO - NVL(OPE.VLRIOF,0)) AS VLRLIQUIDO,'
      
        '   FUN.DESCFUNDOINVEST   , FUN.IDGESTORCARTEIRA  , FUN.MOECODIGO' +
        '         ,'
      '   FUN.IDTIPOFUNDOINVEST , FUN.CNPJFUNDO         ,'
      
        '   FUN.STAEXCLUSIVO      , FUN.PZOCARENCIA       , FUN.PZOANIVER' +
        'SARIO    ,'
      
        '   FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD' +
        '         ,'
      
        '   FUN.QTDDECVALOR       , FUN.STAFUNDO          , FUN.PZOAMORTI' +
        'ZACAO    ,'
      
        '   FUN.PERCTXPERFORM     , FUN.PERCTXADM         , FUN.CODFUNCET' +
        'IP       ,'
      
        '   FUN.STAPROVISIONAIR   , FUN.STAPROVISIONAIOF  , FUN.CONTRCETI' +
        'P,'
      '   TPO.DESCTIPOOPERACAO  , NATUREZAOPERACAO,'
      
        '   DECODE(NATUREZAOPERACAO,'#39'A'#39',ABS(OPE.QTDOPERACAO),0)   AS QTDA' +
        'PLICADA,'
      
        '   DECODE(NATUREZAOPERACAO,'#39'A'#39',ABS(OPE.VLROPERACAO),0)   AS VALO' +
        'RAPLICADO,'
      '   0  AS VALORIRAPLICADO,'
      '   0  AS VALORIOFAPLICADO,'
      
        '   DECODE(NATUREZAOPERACAO,'#39'A'#39',ABS(OPE.VLROPERACAO),0)   AS VALO' +
        'RLIQAPLICADO,'
      
        '   DECODE(NATUREZAOPERACAO,'#39'D'#39',ABS(OPE.QTDOPERACAO),0)   AS QTDR' +
        'ESGATE,'
      
        '   DECODE(NATUREZAOPERACAO,'#39'D'#39',ABS(OPE.VLROPERACAO),0)   AS VALO' +
        'RRESGATE,'
      
        '   DECODE(NATUREZAOPERACAO,'#39'D'#39',ABS(NVL(OPE.VLRIR,0)),0)  AS VALO' +
        'RIRRESGATE,'
      
        '   DECODE(NATUREZAOPERACAO,'#39'D'#39',ABS(NVL(OPE.VLRIOF,0)),0) AS VALO' +
        'RIOFRESGATE,'
      
        '   DECODE(NATUREZAOPERACAO,'#39'D'#39',ABS(OPE.VLROPERACAO),0)   AS VALO' +
        'RLIQRESGATE,'
      '   OPE.QTDOPERACAO AS QTDTOTAL,'
      '   OPE.VLROPERACAO AS VLRTOTAL,'
      '   NVL(OPE.VLRIR,0) AS VLRIRTOTAL,'
      '   NVL(OPE.VLRIOF,0) AS VLRIOFTOTAL,'
      
        '   DECODE(NATUREZAOPERACAO,'#39'A'#39',OPE.VLROPERACAO,((OPE.VLROPERACAO' +
        '-NVL(OPE.VLRIOF,0))+NVL(OPE.VLRIR,0))) AS VLRLIQTOTAL,'
      '   PLANO.PLANPRVCONTABPATRO,'
      ''
      '   NVL(TXA.VLRTAXAS,0)+'
      
        '       (DECODE((SELECT MIN(O.IDOPERACAOFUNDO) FROM OPERACAOFUNDO' +
        ' O'
      
        '                WHERE O.IDPEDIDOFUNDO = OPE.IDPEDIDOFUNDO AND O.' +
        'IDTIPOOPERACAO <> -177), OPE.IDOPERACAOFUNDO,'
      '                      NVL(RGT.VLRTAXAS,0),0)) AS VLRTAXAS,'
      ''
      '   DECODE(OPER.DATAAPLICACAO, NULL,'
      '      DECODE(OPE.IDTIPOOPERACAO,-160,'
      
        '                (SELECT DISTINCT /*+INDEX (H1.XIE1HISTFUNDO)*/ D' +
        'ATAAPLICACAO'
      '                 FROM HISTFUNDO H1'
      '                 WHERE'
      '                     (H1.IDTIPOINVEST      = OPE.IDTIPOINVEST)'
      
        '                 AND (H1.IDPLANPREVCTBPATR = OPE.IDPLANPREVCTBPA' +
        'TR)'
      '                 AND (H1.IDFUNDOINVEST     = OPE.IDFUNDOINVEST)'
      '                 AND (H1.DATAMOVFUNDO      = OPE.DATAOPERACAO)'
      '                 AND (H1.IDTIPOOPERACAO    = OPE.IDTIPOOPERACAO)'
      
        '                 AND (H1.IDOPERACAOFUNDO   = OPE.IDOPERACAOFUNDO' +
        ')'
      '                 AND (H1.IDTIPOOPERACAO NOT IN (-43, -143))'
      '                 AND (H1.TIPMOVFUNDO      <> '#39'OPE'#39')'
      
        '                 AND ((:IDTIPOCOTA IS NULL) OR (H1.IDTIPOCOTA = ' +
        'OPE.IDTIPOCOTA)) ),'
      ''
      '                 DECODE(OPE.IDTIPOOPERACAO,-161,'
      
        '                       (SELECT DISTINCT /*+INDEX (H1.XIE1HISTFUN' +
        'DO)*/ DATAAPLICACAO'
      '                        FROM HISTFUNDO H1'
      '                        WHERE'
      
        '                            (H1.IDTIPOINVEST      = OPE.IDTIPOIN' +
        'VEST)'
      
        '                        AND (H1.IDPLANPREVCTBPATR = OPE.IDPLANPR' +
        'EVCTBPATR)'
      
        '                        AND (H1.IDFUNDOINVEST     = OPE.IDFUNDOI' +
        'NVEST)'
      
        '                        AND (H1.DATAMOVFUNDO      = OPE.DATAOPER' +
        'ACAO)'
      
        '                        AND (H1.IDTIPOOPERACAO    = OPE.IDTIPOOP' +
        'ERACAO)'
      
        '                        AND (H1.IDOPERACAOFUNDO   = OPE.IDOPERAC' +
        'AOFUNDO)'
      
        '                        AND (H1.IDTIPOOPERACAO NOT IN (-43, -143' +
        '))'
      '                        AND (H1.TIPMOVFUNDO      <> '#39'OPE'#39')'
      
        '                        AND ((:IDTIPOCOTA IS NULL) OR (H1.IDTIPO' +
        'COTA = OPE.IDTIPOCOTA)) ),'
      ''
      
        '                       (SELECT DISTINCT /*+INDEX (H1.XIE1HISTFUN' +
        'DO)*/ DATAAPLICACAO'
      '                        FROM HISTFUNDO H1'
      '                        WHERE'
      
        '                            (H1.IDTIPOINVEST      = OPE.IDTIPOIN' +
        'VEST)'
      
        '                        AND (H1.IDPLANPREVCTBPATR = OPE.IDPLANPR' +
        'EVCTBPATR)'
      
        '                        AND (H1.IDFUNDOINVEST     = OPE.IDFUNDOI' +
        'NVEST)'
      
        '                        AND (H1.DATAMOVFUNDO      = OPE.DATAOPER' +
        'ACAO)'
      
        '                        AND (H1.IDTIPOOPERACAO    = OPE.IDTIPOOP' +
        'ERACAO)'
      
        '                        AND (H1.IDOPERACAOFUNDO   = OPE.IDOPERAC' +
        'AOORIGEM)'
      
        '                        AND (H1.IDTIPOOPERACAO NOT IN (-43, -143' +
        '))'
      '                        AND (H1.TIPMOVFUNDO      <> '#39'OPE'#39')'
      
        '                        AND ((:IDTIPOCOTA IS NULL) OR (H1.IDTIPO' +
        'COTA = OPE.IDTIPOCOTA)) ) ) ),'
      ''
      '          OPER.DATAAPLICACAO) AS DATAAPLICACAO,'
      ''
      
        '   DECODE(NATUREZAOPERACAO,'#39'A'#39', OPE.OBSERVACAO, PED.OBSERVACAO) ' +
        'AS OBSERVACAO,'
      
        '   DECODE(NATUREZAOPERACAO,'#39'A'#39', DECODE(OPE.OBSERVACAO,'#39#39','#39#39','#39'*'#39')' +
        ', DECODE(PED.OBSERVACAO,'#39#39','#39#39','#39'*'#39')) AS STAOBS,'
      '   TPC.DESCTIPOCOTA, TFI.DESCTIPOFUNDOINV'
      'FROM'
      '    OPERACAOFUNDO OPE,'
      ''
      
        '   (SELECT OP.VLRTAXAS, OP.IDOPERACAOORIGEM FROM OPERACAOFUNDO O' +
        'P'
      '    WHERE'
      '           (OP.IDTIPOINVEST = :IDTIPOINVEST)'
      ''
      
        '       AND (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLANPREV' +
        'CTBPATR > 0)) OR'
      
        '            ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREV' +
        'CTBPATR = :IDPLANPREVCTBPATR)))'
      ''
      
        '       AND (((:IDFUNDOINVEST IS NULL)         AND (OP.IDFUNDOINV' +
        'EST > 0)) OR'
      
        '            ((:IDFUNDOINVEST IS NOT NULL)     AND (OP.IDFUNDOINV' +
        'EST = :IDFUNDOINVEST)))'
      ''
      
        '       AND (OP.DATAOPERACAO BETWEEN TO_DATE(:DATAMOVFUNDOINICIO,' +
        #39'DD/MM/YYYY'#39') AND'
      
        '                                    TO_DATE(:DATAMOVFUNDOFIM,'#39'DD' +
        '/MM/YYYY'#39'))'
      ''
      '       AND (OP.IDTIPOOPERACAO IN (-174,-175,-176))'
      ''
      
        '       AND (((:IDTIPOCOTA IS NOT NULL)        AND (OP.IDTIPOCOTA' +
        ' = :IDTIPOCOTA)) OR'
      '             (:IDTIPOCOTA IS NULL))) TXA,'
      ''
      '   (SELECT OP.VLRTAXAS, OP.IDPEDIDOFUNDO FROM OPERACAOFUNDO OP'
      '    WHERE'
      '           (OP.IDTIPOINVEST = :IDTIPOINVEST)'
      ''
      
        '       AND (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLANPREV' +
        'CTBPATR > 0)) OR'
      
        '            ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREV' +
        'CTBPATR = :IDPLANPREVCTBPATR)))'
      ''
      
        '       AND (((:IDFUNDOINVEST IS NULL)         AND (OP.IDFUNDOINV' +
        'EST > 0)) OR'
      
        '            ((:IDFUNDOINVEST IS NOT NULL)     AND (OP.IDFUNDOINV' +
        'EST = :IDFUNDOINVEST)))'
      ''
      
        '       AND (OP.DATAOPERACAO BETWEEN TO_DATE(:DATAMOVFUNDOINICIO,' +
        #39'DD/MM/YYYY'#39') AND'
      
        '                                    TO_DATE(:DATAMOVFUNDOFIM,'#39'DD' +
        '/MM/YYYY'#39'))'
      ''
      '       AND (OP.IDTIPOOPERACAO = -177)                           '
      ''
      
        '       AND (((:IDTIPOCOTA IS NOT NULL)        AND (OP.IDTIPOCOTA' +
        ' = :IDTIPOCOTA)) OR'
      '             (:IDTIPOCOTA IS NULL))) RGT,'
      ''
      
        '    PEDIDOFUNDO PED, TIPOOPERACAO TPO, HISTFUNDOINVEST FUN, TIPO' +
        'FUNDOINVEST TFI, TIPOCOTA TPC,'
      ''
      
        '   (SELECT PA.IDPLANPREVCTBPATR, PA.IDPLANOPREV, PA.IDPATRO, (PL' +
        '.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      
        '    FROM   PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '    WHERE  (PA.IDPATRO = PE.IDPESSOA(+)) AND'
      '           (PA.IDPLANOPREV = PL.IDPLANOPREV) ) PLANO,'
      ''
      
        '   (SELECT /*+INDEX (H1.XIE1HISTFUNDO)*/ H1.IDOPERACAOFUNDO, H1.' +
        'DATAAPLICACAO, H1.DATAMOVFUNDO, H1.IDTIPOOPERACAO'
      '    FROM HISTFUNDO H1, FUNDOINVEST FI'
      '    WHERE'
      '           (H1.IDTIPOINVEST = :IDTIPOINVEST)'
      ''
      
        '       AND (((:IDPLANPREVCTBPATR IS NULL)     AND (H1.IDPLANPREV' +
        'CTBPATR > 0)) OR'
      
        '            ((:IDPLANPREVCTBPATR IS NOT NULL) AND (H1.IDPLANPREV' +
        'CTBPATR = :IDPLANPREVCTBPATR)))'
      ''
      
        '       AND (((:IDFUNDOINVEST IS NULL)         AND (H1.IDFUNDOINV' +
        'EST > 0)) OR'
      
        '            ((:IDFUNDOINVEST IS NOT NULL)     AND (H1.IDFUNDOINV' +
        'EST = :IDFUNDOINVEST)))'
      ''
      
        '       AND (H1.DATAMOVFUNDO BETWEEN TO_DATE(:DATAMOVFUNDOINICIO,' +
        #39'DD/MM/YYYY'#39') AND'
      
        '                                    TO_DATE(:DATAMOVFUNDOFIM,'#39'DD' +
        '/MM/YYYY'#39'))'
      ''
      
        '       AND (((:IDTIPOCOTA IS NOT NULL)        AND (H1.IDTIPOCOTA' +
        ' = :IDTIPOCOTA)) OR'
      '             (:IDTIPOCOTA IS NULL))'
      ''
      '       AND (H1.IDTIPOOPERACAO NOT IN (-43, -143))'
      '       AND (H1.TIPMOVFUNDO = '#39'OPE'#39')'
      ''
      
        '       AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (FI.IDTIPOFUNDOINVE' +
        'ST = :IDTIPOFUNDOINVEST))'
      '       AND (FI.IDFUNDOINVEST     = H1.IDFUNDOINVEST)  ) OPER,'
      ''
      
        '   (SELECT /*+INDEX (OP.XIE4OPERACAOFUNDO)*/ OP.IDOPERACAOFUNDO,' +
        ' OP.DATAOPERACAO, OP.IDTIPOOPERACAO'
      '    FROM    OPERACAOFUNDO OP, FUNDOINVEST FI'
      '    WHERE'
      '           (OP.IDTIPOINVEST   = :IDTIPOINVEST)'
      ''
      
        '       AND (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLANPREV' +
        'CTBPATR > 0)) OR'
      
        '            ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREV' +
        'CTBPATR = :IDPLANPREVCTBPATR)))'
      ''
      
        '       AND (((:IDFUNDOINVEST IS NULL)         AND (OP.IDFUNDOINV' +
        'EST > 0)) OR'
      
        '            ((:IDFUNDOINVEST IS NOT NULL)     AND (OP.IDFUNDOINV' +
        'EST = :IDFUNDOINVEST)))'
      ''
      
        '       AND (OP.DATAOPERACAO BETWEEN TO_DATE(:DATAMOVFUNDOINICIO,' +
        #39'DD/MM/YYYY'#39') AND'
      
        '                                    TO_DATE(:DATAMOVFUNDOFIM,'#39'DD' +
        '/MM/YYYY'#39'))'
      ''
      '       AND (OP.IDTIPOOPERACAO IN (-43, -143))'
      ''
      
        '       AND  ((:IDTIPOCOTA IS NULL)            OR (OP.IDTIPOCOTA ' +
        '= :IDTIPOCOTA))'
      ''
      
        '       AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (FI.IDTIPOFUNDOINVE' +
        'ST = :IDTIPOFUNDOINVEST))'
      '       AND (FI.IDFUNDOINVEST  = OP.IDFUNDOINVEST) ) AMORT'
      ''
      'WHERE'
      '       (OPE.IDTIPOINVEST = :IDTIPOINVEST)'
      ''
      
        '    AND (((:IDPLANPREVCTBPATR IS NULL)     AND (OPE.IDPLANPREVCT' +
        'BPATR > 0)) OR'
      
        '         ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OPE.IDPLANPREVCT' +
        'BPATR = :IDPLANPREVCTBPATR)))'
      ''
      
        '   AND  (((:IDFUNDOINVEST IS NULL)         AND (OPE.IDFUNDOINVES' +
        'T > 0)) OR'
      
        '         ((:IDFUNDOINVEST IS NOT NULL)     AND (OPE.IDFUNDOINVES' +
        'T = :IDFUNDOINVEST)))'
      ''
      
        '   AND   (OPE.DATAOPERACAO BETWEEN TO_DATE(:DATAMOVFUNDOINICIO, ' +
        #39'DD/MM/YYYY'#39') AND'
      
        '                                   TO_DATE(:DATAMOVFUNDOFIM, '#39'DD' +
        '/MM/YYYY'#39'))'
      ''
      
        '   AND (((:IDTIPOCOTA IS NOT NULL)         AND (OPE.IDTIPOCOTA =' +
        ' :IDTIPOCOTA)) OR'
      '         (:IDTIPOCOTA IS NULL))'
      ''
      
        '   AND   (FUN.IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, ' +
        'HH24:MI:SS'#39') IN'
      
        '           (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCI' +
        'A),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '              FROM   HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '              WHERE'
      '                  (TF.IDTIPOINVEST      = :IDTIPOINVEST)'
      
        '              AND (((:IDTIPOFUNDOINVEST IS NOT NULL)   AND (TF.I' +
        'DTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)) OR'
      '                    (:IDTIPOFUNDOINVEST IS NULL))'
      '              AND (HF.DTAVIGENCIA      <  OPE.DATAOPERACAO+1)'
      '              AND (HF.IDFUNDOINVEST     = OPE.IDFUNDOINVEST)'
      
        '              AND  (HF.IDTIPOFUNDOINVEST  = TF.IDTIPOFUNDOINVEST' +
        ')'
      '              GROUP BY HF.IDFUNDOINVEST))'
      ''
      '   AND   (TFI.IDTIPOINVEST       = OPE.IDTIPOINVEST)'
      '   AND   (TFI.IDTIPOFUNDOINVEST  = FUN.IDTIPOFUNDOINVEST)'
      '   AND   (FUN.IDFUNDOINVEST      = OPE.IDFUNDOINVEST)'
      ''
      '   AND   (TPO.IDTIPOINVEST       = OPE.IDTIPOINVEST)'
      '   AND   (TPO.IDTIPOOPERACAO     = OPE.IDTIPOOPERACAO)'
      ''
      '   AND  (OPER.IDOPERACAOFUNDO(+) = OPE.IDOPERACAOFUNDO)'
      '   AND  (OPER.DATAMOVFUNDO(+)    = OPE.DATAOPERACAO)'
      '   AND  (OPER.IDTIPOOPERACAO(+)  = OPE.IDTIPOOPERACAO)'
      ''
      '   AND (AMORT.IDOPERACAOFUNDO(+) = OPE.IDOPERACAOFUNDO)'
      '   AND (AMORT.DATAOPERACAO(+)    = OPE.DATAOPERACAO)'
      '   AND (AMORT.IDTIPOOPERACAO(+)  = OPE.IDTIPOOPERACAO)'
      ''
      '   AND   (PED.IDPEDIDOFUNDO(+)   = OPE.IDPEDIDOFUNDO)'
      ''
      '   AND   (TPC.IDTIPOCOTA(+)      = OPE.IDTIPOCOTA)'
      ''
      '   AND (PLANO.IDPLANPREVCTBPATR  = OPE.IDPLANPREVCTBPATR)'
      ''
      '   AND   (TXA.IDOPERACAOORIGEM(+)= OPE.IDOPERACAOFUNDO)'
      '   '
      '   AND   (RGT.IDPEDIDOFUNDO(+)= OPE.IDPEDIDOFUNDO)'
      ''
      
        '   AND (((OPE.IDPEDIDOFUNDO IS NOT NULL) AND (OPE.QTDOPERACAO > ' +
        '0)) OR (OPE.IDPEDIDOFUNDO IS NULL))'
      ''
      
        '   AND (((OPE.IDOPERACAOORIGEM IS NOT NULL) AND (OPE.QTDOPERACAO' +
        ' > 0)) OR (OPE.IDOPERACAOORIGEM IS NULL))'
      ''
      
        'ORDER BY TFI.DESCTIPOFUNDOINV, PLANO.PLANPRVCONTABPATRO, OPE.DAT' +
        'AOPERACAO,'
      
        '         FUN.DESCFUNDOINVEST,  TPO.DESCTIPOOPERACAO, OPER.DATAAP' +
        'LICACAO, TPC.DESCTIPOCOTA, OPE.IDOPERACAOFUNDO'
      ''
      ''
      ' '
      ' ')
    ControlType.Strings = (
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 43
    Top = 97
    ParamData = <
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
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDOINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDOFIM'
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
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDOINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDOFIM'
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
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDOINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDOFIM'
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
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDOINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDOFIM'
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
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDOINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDOFIM'
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
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end>
    object QryConsMovFundosPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 24
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QryConsMovFundosDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 24
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryConsMovFundosDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 16
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryConsMovFundosDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Movimento'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
    end
    object QryConsMovFundosDATAAPLICACAO: TDateTimeField
      DisplayLabel = 'Aplicação'
      DisplayWidth = 10
      FieldName = 'DATAAPLICACAO'
    end
    object QryConsMovFundosDATALIQUIDACAO: TDateTimeField
      DisplayLabel = 'Liquidação'
      DisplayWidth = 10
      FieldName = 'DATALIQUIDACAO'
    end
    object QryConsMovFundosVLRCOTA: TFloatField
      DisplayLabel = 'Valor da Cota'
      DisplayWidth = 18
      FieldName = 'VLRCOTA'
      DisplayFormat = '###,#0.000000000'
    end
    object QryConsMovFundosVLRTOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 15
      FieldName = 'VLRTOTAL'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryConsMovFundosDESCTIPOCOTA: TStringField
      DisplayLabel = 'Tipo de Cota'
      DisplayWidth = 20
      FieldName = 'DESCTIPOCOTA'
      Size = 40
    end
    object QryConsMovFundosDESCTIPOFUNDOINV: TStringField
      DisplayWidth = 80
      FieldName = 'DESCTIPOFUNDOINV'
      Visible = False
      Size = 80
    end
    object QryConsMovFundosQTDOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 20
      FieldName = 'QTDOPERACAO'
      Visible = False
      DisplayFormat = '###,#0.000000000'
    end
    object QryConsMovFundosVLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 20
      FieldName = 'VLROPERACAO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryConsMovFundosVLRIR: TFloatField
      DisplayLabel = 'IR'
      DisplayWidth = 10
      FieldName = 'VLRIR'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryConsMovFundosVLRIOF: TFloatField
      DisplayLabel = 'IOF'
      DisplayWidth = 10
      FieldName = 'VLRIOF'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryConsMovFundosVLRLIQUIDO: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 20
      FieldName = 'VLRLIQUIDO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object s: TStringField
      DisplayLabel = 'Confirmada'
      DisplayWidth = 1
      FieldName = 'STACONFIRMA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryConsMovFundosIDOPERACAOFUNDO: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
      Visible = False
    end
    object QryConsMovFundosIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryConsMovFundosIDPEDIDOFUNDO: TFloatField
      FieldName = 'IDPEDIDOFUNDO'
      Visible = False
    end
    object QryConsMovFundosIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryConsMovFundosIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryConsMovFundosIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QryConsMovFundosVLRRENDIMENTO: TFloatField
      FieldName = 'VLRRENDIMENTO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryConsMovFundosIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Visible = False
    end
    object QryConsMovFundosMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object QryConsMovFundosIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryConsMovFundosCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object QryConsMovFundosSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryConsMovFundosPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Visible = False
    end
    object QryConsMovFundosPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Visible = False
    end
    object QryConsMovFundosPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Visible = False
    end
    object QryConsMovFundosPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Visible = False
    end
    object QryConsMovFundosQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Visible = False
    end
    object QryConsMovFundosQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Visible = False
    end
    object QryConsMovFundosSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryConsMovFundosPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Visible = False
    end
    object QryConsMovFundosPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Visible = False
    end
    object QryConsMovFundosPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Visible = False
    end
    object QryConsMovFundosCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object QryConsMovFundosSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryConsMovFundosSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryConsMovFundosCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Visible = False
      Size = 30
    end
    object QryConsMovFundosNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryConsMovFundosQTDAPLICADA: TFloatField
      FieldName = 'QTDAPLICADA'
      Visible = False
      DisplayFormat = '###,#0.000000000'
    end
    object QryConsMovFundosVALORAPLICADO: TFloatField
      FieldName = 'VALORAPLICADO'
      Visible = False
    end
    object QryConsMovFundosVALORIRAPLICADO: TFloatField
      FieldName = 'VALORIRAPLICADO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryConsMovFundosVALORIOFAPLICADO: TFloatField
      FieldName = 'VALORIOFAPLICADO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryConsMovFundosVALORLIQAPLICADO: TFloatField
      FieldName = 'VALORLIQAPLICADO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryConsMovFundosQTDRESGATE: TFloatField
      FieldName = 'QTDRESGATE'
      Visible = False
      DisplayFormat = '###,#0.000000000'
    end
    object QryConsMovFundosVALORRESGATE: TFloatField
      FieldName = 'VALORRESGATE'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryConsMovFundosVALORIRRESGATE: TFloatField
      FieldName = 'VALORIRRESGATE'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryConsMovFundosVALORIOFRESGATE: TFloatField
      FieldName = 'VALORIOFRESGATE'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryConsMovFundosVALORLIQRESGATE: TFloatField
      FieldName = 'VALORLIQRESGATE'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryConsMovFundosQTDTOTAL: TFloatField
      FieldName = 'QTDTOTAL'
      Visible = False
      DisplayFormat = '###,#0.000000000'
    end
    object QryConsMovFundosVLRIRTOTAL: TFloatField
      FieldName = 'VLRIRTOTAL'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryConsMovFundosVLRIOFTOTAL: TFloatField
      FieldName = 'VLRIOFTOTAL'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryConsMovFundosVLRLIQTOTAL: TFloatField
      FieldName = 'VLRLIQTOTAL'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryConsMovFundosOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 300
    end
    object QryConsMovFundosSTAOBS: TStringField
      DisplayWidth = 1
      FieldName = 'STAOBS'
      Visible = False
      Size = 1
    end
    object QryConsMovFundosVLRTAXAS: TFloatField
      FieldName = 'VLRTAXAS'
      Visible = False
    end
  end
  object ppBDEObservacoes: TppBDEPipeline
    DataSource = dsObservacoes
    UserName = 'ppBDEObservacoes'
    Left = 147
    Top = 53
    object ppBDEObservacoesppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOPERACAOFUNDO'
      FieldName = 'IDOPERACAOFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppBDEObservacoesppField2: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 300
      DataType = dtMemo
      DisplayWidth = 10
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDEObservacoesppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOOPERACAO'
      FieldName = 'IDTIPOOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppBDEObservacoesppField4: TppField
      FieldAlias = 'NATUREZAOPERACAO'
      FieldName = 'NATUREZAOPERACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
  end
  object dsObservacoes: TwwDataSource
    AutoEdit = False
    DataSet = qryObservacoes
    Left = 147
    Top = 145
  end
  object qryObservacoes: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filter = 'IDTIPOOPERACAO > 0'
    Filtered = True
    SQL.Strings = (
      'SELECT'
      
        '  OPE.IDOPERACAOFUNDO, DECODE(NATUREZAOPERACAO,'#39'A'#39', OPE.OBSERVAC' +
        'AO, PED.OBSERVACAO) AS OBSERVACAO,'
      '  OPE.IDTIPOOPERACAO, TPO.NATUREZAOPERACAO'
      'FROM'
      
        '  OPERACAOFUNDO OPE, OPERACAOFUNDO APL, PEDIDOFUNDO PED, TIPOOPE' +
        'RACAO TPO, FUNDOINVEST FI'
      'WHERE'
      '      (OPE.IDTIPOINVEST = :IDTIPOINVEST)'
      ''
      
        '  AND  (((:IDPLANPREVCTBPATR IS NULL)     AND (OPE.IDPLANPREVCTB' +
        'PATR > 0)) OR'
      
        '        ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OPE.IDPLANPREVCTB' +
        'PATR = :IDPLANPREVCTBPATR)))'
      ''
      
        '  AND  (((:IDFUNDOINVEST IS NULL)         AND (OPE.IDFUNDOINVEST' +
        ' > 0)) OR'
      
        '        ((:IDFUNDOINVEST IS NOT NULL)     AND (OPE.IDFUNDOINVEST' +
        ' = :IDFUNDOINVEST)))'
      ''
      
        '  AND (OPE.DATAOPERACAO BETWEEN TO_DATE(:DATAMOVFUNDOINICIO, '#39'DD' +
        '/MM/YYYY'#39') AND'
      
        '                                TO_DATE(:DATAMOVFUNDOFIM, '#39'DD/MM' +
        '/YYYY'#39'))'
      ''
      '  AND   ((:IDTIPOCOTA IS NULL) OR (OPE.IDTIPOCOTA =:IDTIPOCOTA))'
      ''
      '  AND  (((:STACONFIRMA IS NOT NULL) AND'
      
        '     ((OPE.STACONFIRMA = :STACONFIRMA) OR ((:STACONFIRMA = '#39'N'#39') ' +
        'AND (OPE.STACONFIRMA IS NULL)))) OR'
      '         (:STACONFIRMA IS NULL))'
      ''
      
        '  AND   ((:IDTIPOFUNDOINVEST IS NULL) OR (FI.IDTIPOFUNDOINVEST =' +
        ' :IDTIPOFUNDOINVEST))'
      '  AND  (FI.IDFUNDOINVEST      = OPE.IDFUNDOINVEST)'
      ''
      '  AND (OPE.IDTIPOINVEST       = TPO.IDTIPOINVEST)'
      '  AND (OPE.IDTIPOOPERACAO     = TPO.IDTIPOOPERACAO)'
      '  AND (APL.IDOPERACAOFUNDO(+) = OPE.IDOPERACAOORIGEM)'
      '  AND (PED.IDPEDIDOFUNDO(+)   = OPE.IDPEDIDOFUNDO)'
      'ORDER BY OPE.IDOPERACAOFUNDO '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 147
    Top = 97
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
        Value = 5
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
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDOINICIO'
        ParamType = ptInput
        Value = '14/04/2003'
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDOFIM'
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
        DataType = ftString
        Name = 'STACONFIRMA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STACONFIRMA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STACONFIRMA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STACONFIRMA'
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
    object FloatField8: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
      Visible = False
    end
    object MemoField1: TMemoField
      FieldName = 'OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 300
    end
    object qryObservacoesIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryObservacoesNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
  end
  object QryTotalMovOutro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+INDEX (OPE.XIE4OPERACAOFUNDO)*/'
      '       SUM(NVL(OPE.QTDOPERACAO,0)) AS QTDOPERACAO,'
      '       SUM(NVL(OPE.VLROPERACAO,0)) AS VLROPERACAO,'
      '       SUM(NVL(OPE.VLRIR,0)) AS VLRIR,'
      
        '       SUM(NVL(OPE.VLRIOF,0)) AS VLRIOF,  SUM(NVL(OPE.VLRRENDIME' +
        'NTO,0)) AS VLRRENDIMENTO,'
      '       SUM(NVL(OPE.VLROPERACAO,0)) AS VLRLIQUIDO'
      'FROM   OPERACAOFUNDO OPE, TIPOOPERACAO TPO, FUNDOINVEST FI'
      'WHERE'
      '      (OPE.IDTIPOINVEST = :IDTIPOINVEST)'
      ''
      
        'AND    (((:IDPLANPREVCTBPATR IS NULL)     AND (OPE.IDPLANPREVCTB' +
        'PATR > 0)) OR'
      
        '        ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OPE.IDPLANPREVCTB' +
        'PATR = :IDPLANPREVCTBPATR)))'
      ''
      
        'AND    (((:IDFUNDOINVEST IS NULL)         AND (OPE.IDFUNDOINVEST' +
        ' > 0)) OR'
      
        '        ((:IDFUNDOINVEST IS NOT NULL)     AND (OPE.IDFUNDOINVEST' +
        ' = :IDFUNDOINVEST)))'
      ''
      'AND ( (OPE.DATAOPERACAO     >= :DATAMOVFUNDOINICIO ) AND'
      '      (OPE.DATAOPERACAO     <= :DATAMOVFUNDOFIM )  )'
      ''
      
        'AND   (OPE.IDTIPOOPERACAO NOT IN (-43, -100, -105, -107, -108, -' +
        '119, -143, -174, -175, -176, -177, -1005))'
      ''
      
        'AND (((:IDTIPOCOTA IS NOT NULL)         AND (OPE.IDTIPOCOTA = :I' +
        'DTIPOCOTA)) OR'
      '      (:IDTIPOCOTA IS NULL))'
      ''
      
        'AND   (((TPO.IDTIPOOPERACAO   <  0) AND (TPO.TIPOMOVTO = '#39'OPE'#39'))' +
        ' OR'
      '       (TPO.TIPOMOVTO        = '#39'BLQ'#39'))'
      ''
      
        'AND   ((:IDTIPOFUNDOINVEST IS NULL) OR (FI.IDTIPOFUNDOINVEST = :' +
        'IDTIPOFUNDOINVEST))'
      'AND    (FI.IDFUNDOINVEST      = OPE.IDFUNDOINVEST)'
      ''
      'AND   (OPE.IDTIPOINVEST       = TPO.IDTIPOINVEST)'
      'AND   (OPE.IDTIPOOPERACAO     = TPO.IDTIPOOPERACAO)')
    ValidateWithMask = True
    Left = 244
    Top = 97
    ParamData = <
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
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOFIM'
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
      end>
    object QryTotalMovOutroQTDOPERACAO: TFloatField
      FieldName = 'QTDOPERACAO'
    end
    object QryTotalMovOutroVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object QryTotalMovOutroVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object QryTotalMovOutroVLRIOF: TFloatField
      FieldName = 'VLRIOF'
    end
    object QryTotalMovOutroVLRRENDIMENTO: TFloatField
      FieldName = 'VLRRENDIMENTO'
    end
    object QryTotalMovOutroVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
    end
  end
  object DsTotalMovOutro: TwwDataSource
    DataSet = QryTotalMovOutro
    Left = 246
    Top = 145
  end
  object ppBDETotOutro: TppBDEPipeline
    DataSource = DsTotalMovOutro
    UserName = 'BDETotOutro'
    Left = 243
    Top = 53
    object ppBDETotOutroppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDOPERACAO'
      FieldName = 'QTDOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppBDETotOutroppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppBDETotOutroppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIR'
      FieldName = 'VLRIR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppBDETotOutroppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIOF'
      FieldName = 'VLRIOF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppBDETotOutroppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRENDIMENTO'
      FieldName = 'VLRRENDIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppBDETotOutroppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRLIQUIDO'
      FieldName = 'VLRLIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
  end
  object ppBDETotSub: TppBDEPipeline
    DataSource = DsTotSub
    UserName = 'BDETotSub'
    Left = 326
    Top = 53
    object ppBDETotSubppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDOPERACAO'
      FieldName = 'QTDOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppBDETotSubppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppBDETotSubppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIR'
      FieldName = 'VLRIR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppBDETotSubppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIOF'
      FieldName = 'VLRIOF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppBDETotSubppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRENDIMENTO'
      FieldName = 'VLRRENDIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppBDETotSubppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRLIQUIDO'
      FieldName = 'VLRLIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
  end
  object QryTotSub: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+INDEX (OPE.XIE4OPERACAOFUNDO)*/'
      '       SUM(NVL(OPE.QTDOPERACAO,0)) AS QTDOPERACAO,'
      '       SUM(NVL(OPE.VLROPERACAO,0)) AS VLROPERACAO,'
      '       SUM(NVL(OPE.VLRIR,0)) AS VLRIR,'
      
        '       SUM(NVL(OPE.VLRIOF,0)) AS VLRIOF,  SUM(NVL(OPE.VLRRENDIME' +
        'NTO,0)) AS VLRRENDIMENTO,'
      '       SUM(NVL(OPE.VLROPERACAO,0)) AS VLRLIQUIDO'
      'FROM'
      '    OPERACAOFUNDO OPE, TIPOOPERACAO TPO, FUNDOINVEST FI'
      'WHERE'
      '     (OPE.IDTIPOINVEST = :IDTIPOINVEST)'
      ''
      
        'AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (OPE.IDPLANPREVCTBP' +
        'ATR > 0)) OR'
      
        '       ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OPE.IDPLANPREVCTBP' +
        'ATR = :IDPLANPREVCTBPATR)))'
      ''
      
        'AND   (((:IDFUNDOINVEST IS NULL)         AND (OPE.IDFUNDOINVEST ' +
        '> 0)) OR'
      
        '       ((:IDFUNDOINVEST IS NOT NULL)     AND (OPE.IDFUNDOINVEST ' +
        '= :IDFUNDOINVEST)))'
      ''
      'AND ((OPE.DATAOPERACAO     >= :DATAMOVFUNDOINICIO ) AND'
      '     (OPE.DATAOPERACAO     <= :DATAMOVFUNDOFIM )  )'
      'AND  (OPE.IDTIPOOPERACAO    = -119)'
      ''
      
        'AND (((:IDTIPOCOTA IS NOT NULL)         AND (OPE.IDTIPOCOTA = :I' +
        'DTIPOCOTA)) OR'
      '      (:IDTIPOCOTA IS NULL))'
      ''
      
        'AND   ((:IDTIPOFUNDOINVEST IS NULL) OR (FI.IDTIPOFUNDOINVEST = :' +
        'IDTIPOFUNDOINVEST))'
      'AND    (FI.IDFUNDOINVEST      = OPE.IDFUNDOINVEST)      '
      ''
      'AND  (TPO.NATUREZAOPERACAO  = '#39'A'#39')'
      'AND  (TPO.IDTIPOINVEST      = OPE.IDTIPOINVEST)'
      'AND  (TPO.IDTIPOOPERACAO    = OPE.IDTIPOOPERACAO)'
      ' ')
    ValidateWithMask = True
    Left = 327
    Top = 97
    ParamData = <
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
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOFIM'
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
      end>
    object QryTotSubQTDOPERACAO: TFloatField
      FieldName = 'QTDOPERACAO'
    end
    object QryTotSubVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object QryTotSubVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object QryTotSubVLRIOF: TFloatField
      FieldName = 'VLRIOF'
    end
    object QryTotSubVLRRENDIMENTO: TFloatField
      FieldName = 'VLRRENDIMENTO'
    end
    object QryTotSubVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
    end
  end
  object DsTotSub: TwwDataSource
    DataSet = QryTotSub
    Left = 329
    Top = 143
  end
  object ppBDETotIntegr: TppBDEPipeline
    DataSource = DsTotIntegr
    UserName = 'BDETotIntegr'
    Left = 403
    Top = 53
  end
  object QryTotIntegr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+INDEX (OPE.XIE4OPERACAOFUNDO)*/'
      '       SUM(NVL(OPE.QTDOPERACAO,0)) AS QTDOPERACAO,'
      '       SUM(NVL(OPE.VLROPERACAO,0)) AS VLROPERACAO,'
      '       SUM(NVL(OPE.VLRIR,0)) AS VLRIR,'
      
        '       SUM(NVL(OPE.VLRIOF,0)) AS VLRIOF,  SUM(NVL(OPE.VLRRENDIME' +
        'NTO,0)) AS VLRRENDIMENTO,'
      '       SUM(NVL(OPE.VLROPERACAO,0)) AS VLRLIQUIDO,'
      '       SUM(NVL(TXA.VLRTAXAS,0)) AS VLRTAXAS'
      'FROM'
      '    OPERACAOFUNDO OPE,'
      
        '   (SELECT OP.VLRTAXAS, OP.IDOPERACAOORIGEM  FROM OPERACAOFUNDO ' +
        'OP'
      '    WHERE (OP.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '    AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLANPREVC' +
        'TBPATR > 0)) OR'
      
        '           ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREVC' +
        'TBPATR = :IDPLANPREVCTBPATR)))'
      ''
      
        '    AND   (((:IDFUNDOINVEST IS NULL)         AND (OP.IDFUNDOINVE' +
        'ST > 0)) OR'
      
        '           ((:IDFUNDOINVEST IS NOT NULL)     AND (OP.IDFUNDOINVE' +
        'ST = :IDFUNDOINVEST)))'
      ''
      '    AND  ((OP.DATAOPERACAO     >= :DATAMOVFUNDOINICIO ) AND'
      '          (OP.DATAOPERACAO     <= :DATAMOVFUNDOFIM )  )'
      ''
      '    AND   (OP.IDTIPOOPERACAO = -174)'
      ''
      
        '    AND   (((:IDTIPOCOTA IS NOT NULL)         AND (OP.IDTIPOCOTA' +
        ' = :IDTIPOCOTA)) OR'
      '            (:IDTIPOCOTA IS NULL))) TXA,'
      '    TIPOOPERACAO TPO, FUNDOINVEST FI'
      'WHERE'
      '     (OPE.IDTIPOINVEST = :IDTIPOINVEST)'
      ''
      
        'AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (OPE.IDPLANPREVCTBP' +
        'ATR > 0)) OR'
      
        '       ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OPE.IDPLANPREVCTBP' +
        'ATR = :IDPLANPREVCTBPATR)))'
      ''
      
        'AND   (((:IDFUNDOINVEST IS NULL)         AND (OPE.IDFUNDOINVEST ' +
        '> 0)) OR'
      
        '       ((:IDFUNDOINVEST IS NOT NULL)     AND (OPE.IDFUNDOINVEST ' +
        '= :IDFUNDOINVEST)))'
      ''
      'AND ((OPE.DATAOPERACAO     >= :DATAMOVFUNDOINICIO ) AND'
      '     (OPE.DATAOPERACAO     <= :DATAMOVFUNDOFIM )  )'
      'AND  (OPE.IDTIPOOPERACAO    IN (-100, -105, -1005))'
      ''
      
        'AND (((:IDTIPOCOTA IS NOT NULL)         AND (OPE.IDTIPOCOTA = :I' +
        'DTIPOCOTA)) OR'
      '        (:IDTIPOCOTA IS NULL))'
      ''
      
        'AND   ((:IDTIPOFUNDOINVEST IS NULL) OR (FI.IDTIPOFUNDOINVEST = :' +
        'IDTIPOFUNDOINVEST))'
      'AND    (FI.IDFUNDOINVEST      = OPE.IDFUNDOINVEST)'
      ''
      'AND  (TPO.NATUREZAOPERACAO  = '#39'A'#39')'
      'AND  (TPO.IDTIPOINVEST      = OPE.IDTIPOINVEST)'
      'AND  (TPO.IDTIPOOPERACAO    = OPE.IDTIPOOPERACAO)'
      'AND  (TXA.IDOPERACAOORIGEM(+)= OPE.IDOPERACAOFUNDO)'
      ' ')
    ValidateWithMask = True
    Left = 404
    Top = 97
    ParamData = <
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
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOFIM'
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
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOFIM'
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
      end>
    object QryTotIntegrQTDOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDOPERACAO'
    end
    object QryTotIntegrVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object QryTotIntegrVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object QryTotIntegrVLRIOF: TFloatField
      FieldName = 'VLRIOF'
    end
    object QryTotIntegrVLRRENDIMENTO: TFloatField
      FieldName = 'VLRRENDIMENTO'
    end
    object QryTotIntegrVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
    end
    object QryTotIntegrVLRTAXAS: TFloatField
      FieldName = 'VLRTAXAS'
    end
  end
  object DsTotIntegr: TwwDataSource
    DataSet = QryTotIntegr
    Left = 406
    Top = 145
  end
  object ppBDETotApl: TppBDEPipeline
    DataSource = DsTotApl
    UserName = 'BDETotApl'
    Left = 483
    Top = 53
  end
  object QryTotApl: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+INDEX (OPE.XIE4OPERACAOFUNDO)*/'
      '       SUM(NVL(OPE.QTDOPERACAO,0)) AS QTDOPERACAO,'
      '       SUM(NVL(OPE.VLROPERACAO,0)) AS VLROPERACAO,'
      '       SUM(NVL(OPE.VLRIR,0)) AS VLRIR,'
      '       SUM(NVL(OPE.VLRIOF,0)) AS VLRIOF,'
      '       SUM(NVL(OPE.VLRRENDIMENTO,0)) AS VLRRENDIMENTO,'
      
        '      (SUM(NVL(OPE.VLROPERACAO,0))-SUM(NVL(OPE.VLRIOF,0))) AS VL' +
        'RLIQUIDO,'
      '       SUM(NVL(TXA.VLRTAXAS,0)) AS VLRTAXAS'
      'FROM'
      '    OPERACAOFUNDO OPE,'
      ''
      
        '   (SELECT OP.VLRTAXAS, OP.IDOPERACAOORIGEM  FROM OPERACAOFUNDO ' +
        'OP'
      '    WHERE (OP.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '    AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLANPREVC' +
        'TBPATR > 0)) OR'
      
        '           ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREVC' +
        'TBPATR = :IDPLANPREVCTBPATR)))'
      ''
      
        '    AND   (((:IDFUNDOINVEST IS NULL)         AND (OP.IDFUNDOINVE' +
        'ST > 0)) OR'
      
        '           ((:IDFUNDOINVEST IS NOT NULL)     AND (OP.IDFUNDOINVE' +
        'ST = :IDFUNDOINVEST)))'
      ''
      '    AND  ((OP.DATAOPERACAO     >= :DATAMOVFUNDOINICIO ) AND'
      '          (OP.DATAOPERACAO     <= :DATAMOVFUNDOFIM )  )'
      ''
      '    AND   (OP.IDTIPOOPERACAO = -176)'
      ''
      
        '    AND   (((:IDTIPOCOTA IS NOT NULL)         AND (OP.IDTIPOCOTA' +
        ' = :IDTIPOCOTA)) OR'
      '            (:IDTIPOCOTA IS NULL))) TXA,'
      ''
      '    TIPOOPERACAO TPO, FUNDOINVEST FI'
      'WHERE'
      '     (OPE.IDTIPOINVEST = :IDTIPOINVEST)'
      ''
      
        'AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (OPE.IDPLANPREVCTBP' +
        'ATR > 0)) OR'
      
        '       ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OPE.IDPLANPREVCTBP' +
        'ATR = :IDPLANPREVCTBPATR)))'
      ''
      
        'AND   (((:IDFUNDOINVEST IS NULL)         AND (OPE.IDFUNDOINVEST ' +
        '> 0)) OR'
      
        '       ((:IDFUNDOINVEST IS NOT NULL)     AND (OPE.IDFUNDOINVEST ' +
        '= :IDFUNDOINVEST)))'
      ''
      'AND ((OPE.DATAOPERACAO     >= :DATAMOVFUNDOINICIO ) AND'
      '     (OPE.DATAOPERACAO     <= :DATAMOVFUNDOFIM )  )'
      ''
      'AND  (OPE.IDTIPOOPERACAO   >  0)     '
      ''
      
        'AND (((:IDTIPOCOTA IS NOT NULL)         AND (OPE.IDTIPOCOTA = :I' +
        'DTIPOCOTA)) OR'
      '      (:IDTIPOCOTA IS NULL))'
      ''
      
        'AND   ((:IDTIPOFUNDOINVEST IS NULL) OR (FI.IDTIPOFUNDOINVEST = :' +
        'IDTIPOFUNDOINVEST))'
      'AND    (FI.IDFUNDOINVEST    = OPE.IDFUNDOINVEST)'
      ''
      'AND  (TPO.NATUREZAOPERACAO  = '#39'A'#39')'
      'AND  (TPO.IDTIPOINVEST      = OPE.IDTIPOINVEST)'
      'AND  (TPO.IDTIPOOPERACAO    = OPE.IDTIPOOPERACAO)'
      'AND  (TXA.IDOPERACAOORIGEM(+)= OPE.IDOPERACAOFUNDO) ')
    ValidateWithMask = True
    Left = 484
    Top = 97
    ParamData = <
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
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOFIM'
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
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOFIM'
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
      end>
    object QryTotAplQTDOPERACAO: TFloatField
      FieldName = 'QTDOPERACAO'
    end
    object QryTotAplVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object QryTotAplVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object QryTotAplVLRIOF: TFloatField
      FieldName = 'VLRIOF'
    end
    object QryTotAplVLRRENDIMENTO: TFloatField
      FieldName = 'VLRRENDIMENTO'
    end
    object QryTotAplVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
    end
    object QryTotAplVLRTAXAS: TFloatField
      FieldName = 'VLRTAXAS'
    end
  end
  object DsTotApl: TwwDataSource
    DataSet = QryTotApl
    Left = 486
    Top = 145
  end
  object ppBDETotAmort: TppBDEPipeline
    DataSource = DsTotAmort
    UserName = 'BDETotAmort'
    Left = 559
    Top = 53
  end
  object QryTotAmort: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+INDEX (OPE.XIE4OPERACAOFUNDO)*/'
      '       SUM(NVL(OPE.QTDOPERACAO,0)) AS QTDOPERACAO,'
      '       SUM(NVL(OPE.VLROPERACAO,0)) AS VLROPERACAO,'
      '       SUM(NVL(OPE.VLRIR,0)) AS VLRIR,'
      
        '       SUM(NVL(OPE.VLRIOF,0)) AS VLRIOF,  SUM(NVL(OPE.VLRRENDIME' +
        'NTO,0)) AS VLRRENDIMENTO,'
      '       SUM(NVL(OPE.VLROPERACAO,0)) AS VLRLIQUIDO,'
      '       SUM(NVL(TXA.VLRTAXAS,0)) AS VLRTAXAS'
      'FROM'
      '    OPERACAOFUNDO OPE,'
      
        '   (SELECT OP.VLRTAXAS, OP.IDOPERACAOORIGEM  FROM OPERACAOFUNDO ' +
        'OP'
      '    WHERE'
      '          (OP.IDTIPOINVEST = :IDTIPOINVEST)'
      ''
      
        '    AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLANPREVC' +
        'TBPATR > 0)) OR'
      
        '           ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREVC' +
        'TBPATR = :IDPLANPREVCTBPATR)))'
      ''
      
        '    AND   (((:IDFUNDOINVEST IS NULL)         AND (OP.IDFUNDOINVE' +
        'ST > 0)) OR'
      
        '           ((:IDFUNDOINVEST IS NOT NULL)     AND (OP.IDFUNDOINVE' +
        'ST = :IDFUNDOINVEST)))'
      ''
      '    AND  ((OP.DATAOPERACAO     >= :DATAMOVFUNDOINICIO )'
      '    AND   (OP.DATAOPERACAO     <= :DATAMOVFUNDOFIM )  )'
      ''
      '    AND   (OP.IDTIPOOPERACAO = -175)'
      ''
      
        '    AND   (((:IDTIPOCOTA IS NOT NULL)         AND (OP.IDTIPOCOTA' +
        ' = :IDTIPOCOTA)) OR'
      '            (:IDTIPOCOTA IS NULL))) TXA,'
      '    TIPOOPERACAO TPO, FUNDOINVEST FI'
      'WHERE'
      '     (OPE.IDTIPOINVEST = :IDTIPOINVEST)'
      ''
      
        'AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (OPE.IDPLANPREVCTBP' +
        'ATR > 0)) OR'
      
        '       ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OPE.IDPLANPREVCTBP' +
        'ATR = :IDPLANPREVCTBPATR)))'
      ''
      
        'AND   (((:IDFUNDOINVEST IS NULL)         AND (OPE.IDFUNDOINVEST ' +
        '> 0)) OR'
      
        '       ((:IDFUNDOINVEST IS NOT NULL)     AND (OPE.IDFUNDOINVEST ' +
        '= :IDFUNDOINVEST)))'
      ''
      'AND ((OPE.DATAOPERACAO     >= :DATAMOVFUNDOINICIO )'
      'AND  (OPE.DATAOPERACAO     <= :DATAMOVFUNDOFIM )  )'
      ''
      'AND  (OPE.IDTIPOOPERACAO    = -43)'
      ''
      
        'AND (((:IDTIPOCOTA IS NOT NULL)         AND (OPE.IDTIPOCOTA = :I' +
        'DTIPOCOTA)) OR'
      '      (:IDTIPOCOTA IS NULL))'
      ''
      
        'AND    ((:IDTIPOFUNDOINVEST IS NULL) OR (FI.IDTIPOFUNDOINVEST = ' +
        ':IDTIPOFUNDOINVEST))'
      'AND   (FI.IDFUNDOINVEST      = OPE.IDFUNDOINVEST)'
      ''
      'AND  (TPO.NATUREZAOPERACAO  = '#39'D'#39')'
      'AND  (TPO.IDTIPOINVEST      = OPE.IDTIPOINVEST)'
      'AND  (TPO.IDTIPOOPERACAO    = OPE.IDTIPOOPERACAO)'
      'AND  (TXA.IDOPERACAOORIGEM(+)= OPE.IDOPERACAOFUNDO)')
    ValidateWithMask = True
    Left = 560
    Top = 97
    ParamData = <
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
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOFIM'
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
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOFIM'
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
      end>
    object QryTotAmortQTDOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDOPERACAO'
    end
    object QryTotAmortVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object QryTotAmortVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object QryTotAmortVLRIOF: TFloatField
      FieldName = 'VLRIOF'
    end
    object QryTotAmortVLRRENDIMENTO: TFloatField
      FieldName = 'VLRRENDIMENTO'
    end
    object QryTotAmortVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
    end
    object QryTotAmortVLRTAXAS: TFloatField
      FieldName = 'VLRTAXAS'
    end
  end
  object DsTotAmort: TwwDataSource
    DataSet = QryTotAmort
    Left = 562
    Top = 145
  end
  object ppBDETotResg: TppBDEPipeline
    DataSource = DsTotResg
    UserName = 'BDETotResg'
    Left = 634
    Top = 53
  end
  object QryTotResg: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+INDEX (OPE.XIE4OPERACAOFUNDO)*/'
      '       SUM(NVL(OPE.QTDOPERACAO,0)) AS QTDOPERACAO,'
      '       SUM(NVL(OPE.VLROPERACAO,0)) AS VLROPERACAO,'
      '       SUM(NVL(OPE.VLRIR,0)) AS VLRIR,'
      '       SUM(NVL(OPE.VLRIOF,0)) AS VLRIOF,'
      '       SUM(NVL(OPE.VLRRENDIMENTO,0)) AS VLRRENDIMENTO,'
      
        '       SUM(NVL(OPE.VLROPERACAO,0))-SUM(NVL(OPE.VLRIOF,0)) AS VLR' +
        'LIQUIDO,'
      
        '       SUM((DECODE((SELECT MIN(O.IDOPERACAOFUNDO) FROM OPERACAOF' +
        'UNDO O'
      
        '                    WHERE O.IDPEDIDOFUNDO = OPE.IDPEDIDOFUNDO AN' +
        'D O.IDTIPOOPERACAO <> -177), OPE.IDOPERACAOFUNDO,'
      '                     NVL(TXA.VLRTAXAS,0),0))) AS VLRTAXAS'
      'FROM'
      '    OPERACAOFUNDO OPE,'
      ''
      '   (SELECT OP.VLRTAXAS, OP.IDPEDIDOFUNDO  FROM OPERACAOFUNDO OP'
      '    WHERE'
      '          (OP.IDTIPOINVEST = :IDTIPOINVEST)'
      ''
      
        '    AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLANPREVC' +
        'TBPATR > 0)) OR'
      
        '           ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREVC' +
        'TBPATR = :IDPLANPREVCTBPATR)))'
      ''
      
        '    AND   (((:IDFUNDOINVEST IS NULL)         AND (OP.IDFUNDOINVE' +
        'ST > 0)) OR'
      
        '           ((:IDFUNDOINVEST IS NOT NULL)     AND (OP.IDFUNDOINVE' +
        'ST = :IDFUNDOINVEST)))'
      ''
      '    AND  ((OP.DATAOPERACAO     >= :DATAMOVFUNDOINICIO )'
      '    AND   (OP.DATAOPERACAO     <= :DATAMOVFUNDOFIM )  )'
      ''
      '    AND   (OP.IDTIPOOPERACAO = -177)'
      ''
      
        '    AND   (((:IDTIPOCOTA IS NOT NULL)         AND (OP.IDTIPOCOTA' +
        ' = :IDTIPOCOTA)) OR'
      '            (:IDTIPOCOTA IS NULL))) TXA,'
      ''
      '    TIPOOPERACAO TPO, FUNDOINVEST FI'
      'WHERE'
      '     (OPE.IDTIPOINVEST = :IDTIPOINVEST)'
      ''
      
        'AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (OPE.IDPLANPREVCTBP' +
        'ATR > 0)) OR'
      
        '       ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OPE.IDPLANPREVCTBP' +
        'ATR = :IDPLANPREVCTBPATR)))'
      ''
      
        'AND   (((:IDFUNDOINVEST IS NULL)         AND (OPE.IDFUNDOINVEST ' +
        '> 0)) OR'
      
        '       ((:IDFUNDOINVEST IS NOT NULL)     AND (OPE.IDFUNDOINVEST ' +
        '= :IDFUNDOINVEST)))'
      ''
      'AND ((OPE.DATAOPERACAO     >= :DATAMOVFUNDOINICIO )'
      'AND  (OPE.DATAOPERACAO     <= :DATAMOVFUNDOFIM )  )'
      ''
      'AND  (OPE.IDTIPOOPERACAO   >  0)'
      ''
      
        'AND (((:IDTIPOCOTA IS NOT NULL)         AND (OPE.IDTIPOCOTA = :I' +
        'DTIPOCOTA)) OR'
      '      (:IDTIPOCOTA IS NULL))'
      ''
      
        'AND    ((:IDTIPOFUNDOINVEST IS NULL) OR (FI.IDTIPOFUNDOINVEST = ' +
        ':IDTIPOFUNDOINVEST))'
      'AND   (FI.IDFUNDOINVEST      = OPE.IDFUNDOINVEST)'
      ''
      'AND  (TPO.NATUREZAOPERACAO  = '#39'D'#39')'
      'AND  (TPO.RECPAG            = '#39'R'#39')'
      'AND  (TPO.IDTIPOINVEST      = OPE.IDTIPOINVEST)'
      'AND  (TPO.IDTIPOOPERACAO    = OPE.IDTIPOOPERACAO)'
      'AND  (TXA.IDPEDIDOFUNDO(+)  = OPE.IDPEDIDOFUNDO)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 634
    Top = 97
    ParamData = <
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
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOFIM'
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
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOFIM'
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
      end>
    object QryTotResgQTDOPERACAO: TFloatField
      FieldName = 'QTDOPERACAO'
    end
    object QryTotResgVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object QryTotResgVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object QryTotResgVLRIOF: TFloatField
      FieldName = 'VLRIOF'
    end
    object QryTotResgVLRRENDIMENTO: TFloatField
      FieldName = 'VLRRENDIMENTO'
    end
    object QryTotResgVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
    end
    object QryTotResgVLRTAXAS: TFloatField
      FieldName = 'VLRTAXAS'
    end
  end
  object DsTotResg: TwwDataSource
    DataSet = QryTotResg
    Left = 634
    Top = 145
  end
  object ppBDETotAmortRec: TppBDEPipeline
    DataSource = DsTotAmortRec
    UserName = 'BDETotAmortRec'
    Left = 718
    Top = 53
    object ppBDETotAmortRecppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDOPERACAO'
      FieldName = 'QTDOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppBDETotAmortRecppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppBDETotAmortRecppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIR'
      FieldName = 'VLRIR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppBDETotAmortRecppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIOF'
      FieldName = 'VLRIOF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppBDETotAmortRecppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRENDIMENTO'
      FieldName = 'VLRRENDIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppBDETotAmortRecppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRLIQUIDO'
      FieldName = 'VLRLIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
  end
  object QryTotAmortRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+INDEX (OPE.XIE4OPERACAOFUNDO)*/'
      '       SUM(NVL(OPE.QTDOPERACAO,0)) AS QTDOPERACAO,'
      '       SUM(NVL(OPE.VLROPERACAO,0)) AS VLROPERACAO,'
      '       SUM(NVL(OPE.VLRIR,0)) AS VLRIR,'
      
        '       SUM(NVL(OPE.VLRIOF,0)) AS VLRIOF,  SUM(NVL(OPE.VLRRENDIME' +
        'NTO,0)) AS VLRRENDIMENTO,'
      '       SUM(NVL(OPE.VLROPERACAO,0)) AS VLRLIQUIDO'
      'FROM'
      '    OPERACAOFUNDO OPE, TIPOOPERACAO TPO, FUNDOINVEST FI'
      'WHERE'
      '     (OPE.IDTIPOINVEST = :IDTIPOINVEST)'
      ''
      
        'AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (OPE.IDPLANPREVCTBP' +
        'ATR > 0)) OR'
      
        '       ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OPE.IDPLANPREVCTBP' +
        'ATR = :IDPLANPREVCTBPATR)))'
      ''
      
        'AND   (((:IDFUNDOINVEST IS NULL)         AND (OPE.IDFUNDOINVEST ' +
        '> 0)) OR'
      
        '       ((:IDFUNDOINVEST IS NOT NULL)     AND (OPE.IDFUNDOINVEST ' +
        '= :IDFUNDOINVEST)))'
      ''
      'AND ((OPE.DATAOPERACAO     >= :DATAMOVFUNDOINICIO )'
      'AND  (OPE.DATAOPERACAO     <= :DATAMOVFUNDOFIM )  )'
      'AND  (OPE.IDTIPOOPERACAO    = -143)'
      ''
      
        'AND (((:IDTIPOCOTA IS NOT NULL)         AND (OPE.IDTIPOCOTA = :I' +
        'DTIPOCOTA)) OR'
      '      (:IDTIPOCOTA IS NULL))'
      ''
      
        'AND    ((:IDTIPOFUNDOINVEST IS NULL) OR (FI.IDTIPOFUNDOINVEST = ' +
        ':IDTIPOFUNDOINVEST))'
      'AND   (FI.IDFUNDOINVEST      = OPE.IDFUNDOINVEST)'
      ''
      'AND  (TPO.NATUREZAOPERACAO  = '#39'D'#39')'
      'AND  (TPO.IDTIPOINVEST      = OPE.IDTIPOINVEST)'
      'AND  (TPO.IDTIPOOPERACAO    = OPE.IDTIPOOPERACAO)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 719
    Top = 97
    ParamData = <
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
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOFIM'
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
      end>
    object QryTotAmortRecQTDOPERACAO: TFloatField
      FieldName = 'QTDOPERACAO'
    end
    object QryTotAmortRecVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object QryTotAmortRecVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object QryTotAmortRecVLRIOF: TFloatField
      FieldName = 'VLRIOF'
    end
    object QryTotAmortRecVLRRENDIMENTO: TFloatField
      FieldName = 'VLRRENDIMENTO'
    end
    object QryTotAmortRecVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
    end
  end
  object DsTotAmortRec: TwwDataSource
    DataSet = QryTotAmortRec
    Left = 721
    Top = 145
  end
  object ppBDETotTransfEntr: TppBDEPipeline
    DataSource = DsTotTransfEntr
    UserName = 'BDETotApl1'
    Left = 803
    Top = 53
    object ppBDETotTransfEntrppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDOPERACAO'
      FieldName = 'QTDOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppBDETotTransfEntrppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppBDETotTransfEntrppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIR'
      FieldName = 'VLRIR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppBDETotTransfEntrppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIOF'
      FieldName = 'VLRIOF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppBDETotTransfEntrppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRENDIMENTO'
      FieldName = 'VLRRENDIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppBDETotTransfEntrppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRLIQUIDO'
      FieldName = 'VLRLIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
  end
  object QryTotTransfEntr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+INDEX (OPE.XIE4OPERACAOFUNDO)*/'
      '       SUM(NVL(OPE.QTDOPERACAO,0)) AS QTDOPERACAO,'
      '       SUM(NVL(OPE.VLROPERACAO,0)) AS VLROPERACAO,'
      '       SUM(NVL(OPE.VLRIR,0)) AS VLRIR,'
      '       SUM(NVL(OPE.VLRIOF,0)*-1) AS VLRIOF,'
      '       SUM(NVL(OPE.VLRRENDIMENTO,0)) AS VLRRENDIMENTO,'
      
        '      (SUM(NVL(OPE.VLROPERACAO,0))-SUM(NVL(OPE.VLRIOF,0))) AS VL' +
        'RLIQUIDO'
      'FROM'
      '    OPERACAOFUNDO OPE, TIPOOPERACAO TPO, FUNDOINVEST FI'
      'WHERE'
      '     (OPE.IDTIPOINVEST = :IDTIPOINVEST)'
      ''
      
        'AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (OPE.IDPLANPREVCTBP' +
        'ATR > 0)) OR'
      
        '       ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OPE.IDPLANPREVCTBP' +
        'ATR = :IDPLANPREVCTBPATR)))'
      ''
      
        'AND   (((:IDFUNDOINVEST IS NULL)         AND (OPE.IDFUNDOINVEST ' +
        '> 0)) OR'
      
        '       ((:IDFUNDOINVEST IS NOT NULL)     AND (OPE.IDFUNDOINVEST ' +
        '= :IDFUNDOINVEST)))'
      ''
      'AND ((OPE.DATAOPERACAO     >= :DATAMOVFUNDOINICIO ) AND'
      '     (OPE.DATAOPERACAO     <= :DATAMOVFUNDOFIM )  )'
      ''
      'AND  (OPE.IDTIPOOPERACAO   IN (-108, -161) )'
      ''
      
        'AND   (((:IDTIPOCOTA IS NOT NULL)         AND (OPE.IDTIPOCOTA = ' +
        ':IDTIPOCOTA)) OR'
      '        (:IDTIPOCOTA IS NULL))'
      ''
      
        'AND    ((:IDTIPOFUNDOINVEST IS NULL) OR (FI.IDTIPOFUNDOINVEST = ' +
        ':IDTIPOFUNDOINVEST))'
      'AND   (FI.IDFUNDOINVEST     = OPE.IDFUNDOINVEST)'
      ''
      'AND  (TPO.NATUREZAOPERACAO  = '#39'A'#39')'
      'AND  (TPO.IDTIPOINVEST      = OPE.IDTIPOINVEST)'
      'AND  (TPO.IDTIPOOPERACAO    = OPE.IDTIPOOPERACAO)')
    ValidateWithMask = True
    Left = 804
    Top = 97
    ParamData = <
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
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOFIM'
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
      end>
    object QryTotTransfEntrQTDOPERACAO: TFloatField
      FieldName = 'QTDOPERACAO'
      DisplayFormat = '###,#0.000000000'
    end
    object QryTotTransfEntrVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object QryTotTransfEntrVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object QryTotTransfEntrVLRIOF: TFloatField
      FieldName = 'VLRIOF'
    end
    object QryTotTransfEntrVLRRENDIMENTO: TFloatField
      FieldName = 'VLRRENDIMENTO'
    end
    object QryTotTransfEntrVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
    end
  end
  object DsTotTransfEntr: TwwDataSource
    DataSet = QryTotTransfEntr
    Left = 806
    Top = 145
  end
  object ppBDETotTransfSaida: TppBDEPipeline
    DataSource = DsTotTransfSaida
    UserName = 'BDETotResg1'
    Left = 890
    Top = 53
    object ppBDETotTransfSaidappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDOPERACAO'
      FieldName = 'QTDOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppBDETotTransfSaidappField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppBDETotTransfSaidappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIR'
      FieldName = 'VLRIR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppBDETotTransfSaidappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIOF'
      FieldName = 'VLRIOF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppBDETotTransfSaidappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRENDIMENTO'
      FieldName = 'VLRRENDIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppBDETotTransfSaidappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRLIQUIDO'
      FieldName = 'VLRLIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
  end
  object QryTotTransfSaida: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+INDEX (OPE.XIE4OPERACAOFUNDO)*/'
      '       SUM(NVL(OPE.QTDOPERACAO,0)) AS QTDOPERACAO,'
      '       SUM(NVL(OPE.VLROPERACAO,0)) AS VLROPERACAO,'
      '       SUM(NVL(OPE.VLRIR,0)) AS VLRIR,'
      '       SUM(NVL(OPE.VLRIOF,0)*-1) AS VLRIOF,'
      '       SUM(NVL(OPE.VLRRENDIMENTO,0)) AS VLRRENDIMENTO,'
      
        '       SUM(NVL(OPE.VLROPERACAO,0))-SUM(NVL(OPE.VLRIOF,0)) AS VLR' +
        'LIQUIDO'
      'FROM'
      '    OPERACAOFUNDO OPE, TIPOOPERACAO TPO, FUNDOINVEST FI'
      'WHERE'
      '     (OPE.IDTIPOINVEST = :IDTIPOINVEST)'
      ''
      
        'AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (OPE.IDPLANPREVCTBP' +
        'ATR > 0)) OR'
      
        '       ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OPE.IDPLANPREVCTBP' +
        'ATR = :IDPLANPREVCTBPATR)))'
      ''
      
        'AND   (((:IDFUNDOINVEST IS NULL)         AND (OPE.IDFUNDOINVEST ' +
        '> 0)) OR'
      
        '       ((:IDFUNDOINVEST IS NOT NULL)     AND (OPE.IDFUNDOINVEST ' +
        '= :IDFUNDOINVEST)))'
      ''
      'AND ((OPE.DATAOPERACAO     >= :DATAMOVFUNDOINICIO )'
      'AND  (OPE.DATAOPERACAO     <= :DATAMOVFUNDOFIM )  )'
      ''
      'AND  (OPE.IDTIPOOPERACAO   IN (-107,-160) )'
      ''
      
        'AND   (((:IDTIPOCOTA IS NOT NULL)    AND (OPE.IDTIPOCOTA = :IDTI' +
        'POCOTA)) OR'
      '        (:IDTIPOCOTA IS NULL))'
      ''
      
        'AND    ((:IDTIPOFUNDOINVEST IS NULL) OR (FI.IDTIPOFUNDOINVEST = ' +
        ':IDTIPOFUNDOINVEST))'
      'AND   (FI.IDFUNDOINVEST      = OPE.IDFUNDOINVEST)'
      ''
      'AND  (TPO.NATUREZAOPERACAO  = '#39'D'#39')'
      
        'AND  (TPO.IDTIPOINVEST      = OPE.IDTIPOINVEST)                 ' +
        '              '
      'AND  (TPO.IDTIPOOPERACAO    = OPE.IDTIPOOPERACAO)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 891
    Top = 97
    ParamData = <
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
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDOFIM'
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
      end>
    object QryTotTransfSaidaQTDOPERACAO: TFloatField
      FieldName = 'QTDOPERACAO'
      DisplayFormat = '###,#0.000000000'
    end
    object QryTotTransfSaidaVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object QryTotTransfSaidaVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object QryTotTransfSaidaVLRIOF: TFloatField
      FieldName = 'VLRIOF'
    end
    object QryTotTransfSaidaVLRRENDIMENTO: TFloatField
      FieldName = 'VLRRENDIMENTO'
    end
    object QryTotTransfSaidaVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
    end
  end
  object DsTotTransfSaida: TwwDataSource
    DataSet = QryTotTransfSaida
    Left = 893
    Top = 145
  end
end
