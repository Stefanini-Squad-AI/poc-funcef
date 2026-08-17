inherited dtmRelConciliaCapCar: TdtmRelConciliaCapCar
  Left = 372
  Top = 302
  Width = 393
  Height = 284
  Caption = 'dtmRelConciliaCapCar'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 24
    Top = 56
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
    Left = 24
    Top = 68
  end
  inherited qryExemplo: TwwQuery
    Left = 24
    Top = 80
  end
  inherited rpExemplo: TppReport
    Left = 24
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object qryConciliaCapCar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TO_DATE('#39'01/01/1980'#39', '#39'DD/MM/YYYY'#39') AS DATA_REF,'
      ''
      '   1234567890                          AS CODDOCUMENTO,'
      '   30000000325648                      AS NODOCUMENTO,'
      '   '#39'000'#39'                               AS COMPLDOCUMENTO,'
      '   '#39'30000000325648 / 001'#39'              AS NODOCUMENTO_COMPL,'
      ''
      '   '#39'A Receber'#39'                         AS REC_PAG,'
      '   '#39'A Receber - 01/01/1980'#39'            AS REC_PAG_DATA,'
      ''
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790'#39' AS PESSOA_DOCUMENTO,'
      ''
      '   999999999         AS HMEVLRPREVISTO,'
      '   999999999         AS HMEVLREFETIVO,'
      '   999999999         AS VLRNAORECEBIDO,'
      ''
      '   999999999         AS VALOR_LANCADO,'
      '   999999999         AS VALOR_BAIXADO,'
      '   999999999         AS RESIDUO'
      ''
      'FROM'
      '   DUAL')
    ValidateWithMask = True
    Left = 120
    Top = 56
    object qryConciliaCapCarDATA_REF: TDateTimeField
      FieldName = 'DATA_REF'
    end
    object qryConciliaCapCarCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryConciliaCapCarNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object qryConciliaCapCarCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object qryConciliaCapCarNODOCUMENTO_COMPL: TStringField
      FieldName = 'NODOCUMENTO_COMPL'
      FixedChar = True
    end
    object qryConciliaCapCarREC_PAG: TStringField
      FieldName = 'REC_PAG'
      FixedChar = True
      Size = 9
    end
    object qryConciliaCapCarREC_PAG_DATA: TStringField
      FieldName = 'REC_PAG_DATA'
      FixedChar = True
      Size = 22
    end
    object qryConciliaCapCarPESSOA_DOCUMENTO: TStringField
      FieldName = 'PESSOA_DOCUMENTO'
      FixedChar = True
      Size = 66
    end
    object qryConciliaCapCarHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryConciliaCapCarHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryConciliaCapCarVLRNAORECEBIDO: TFloatField
      FieldName = 'VLRNAORECEBIDO'
    end
    object qryConciliaCapCarVALOR_LANCADO: TFloatField
      FieldName = 'VALOR_LANCADO'
    end
    object qryConciliaCapCarVALOR_BAIXADO: TFloatField
      FieldName = 'VALOR_BAIXADO'
    end
    object qryConciliaCapCarRESIDUO: TFloatField
      FieldName = 'RESIDUO'
    end
  end
  object pplConciliaCapCar: TppBDEPipeline
    DataSource = dtsConciliaCapCar
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'pplConciliaCapCar'
    Left = 120
    Top = 68
  end
  object dtsConciliaCapCar: TwwDataSource
    DataSet = qryConciliaCapCar
    Left = 120
    Top = 80
  end
  object rptConciliaCapCar: TppReport
    AutoStop = False
    DataPipeline = pplConciliaCapCar
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Valores a Receber - Folha(s)'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 120
    Top = 8
    Version = '7.04'
    mmColumnWidth = 284300
    DataPipelineName = 'pplConciliaCapCar'
    object ppHeaderBand1: TppHeaderBand
      BeforePrint = ppHeaderBand1BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 63500
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Conciliação de Recebimentos - Financeiro - por Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 53446
        mmTop = 8731
        mmWidth = 163777
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        Caption = 'Período de Datas:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 22490
        mmWidth = 26458
        BandType = 0
      end
      object lblDataIni: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 27252
        mmTop = 22490
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Label4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 53446
        mmTop = 2117
        mmWidth = 163777
        BandType = 0
      end
      object lblDataFim: TppLabel
        UserName = 'lblDataFim'
        AutoSize = False
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 46567
        mmTop = 22490
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = '  a  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 42069
        mmTop = 22490
        mmWidth = 4763
        BandType = 0
      end
      object linCabecalhoFolha: TppLine
        UserName = 'linCabecalhoFolha'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 38629
        mmWidth = 63765
        BandType = 0
      end
      object lblCabecalhoFolha: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = 'Exibindo apenas Documentos (Financeiro): '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 34925
        mmWidth = 63765
        BandType = 0
      end
      object lblValorDivergFolha: TppLabel
        UserName = 'lblValorDivergFolha'
        AutoSize = False
        Caption = 'Com divergência de valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 39952
        mmWidth = 63765
        BandType = 0
      end
      object lblValorNAOZeroFolha: TppLabel
        UserName = 'lblValorNAOZeroFolha'
        AutoSize = False
        Caption = 'Recebidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 43921
        mmWidth = 63765
        BandType = 0
      end
      object lblValorZeroFolha: TppLabel
        UserName = 'lblValorZeroFolha'
        AutoSize = False
        Caption = 'Com Valor recebido ZERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 47890
        mmWidth = 63765
        BandType = 0
      end
      object lblNaoProcessadoFolha: TppLabel
        UserName = 'lblNaoProcessadoFolha'
        AutoSize = False
        Caption = 'Não processadas (pela Folha)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 51858
        mmWidth = 63765
        BandType = 0
      end
      object lblCabecalhoEP: TppLabel
        UserName = 'lblCabecalhoEP'
        AutoSize = False
        Caption = 'Exibindo apenas Itens (Empréstimo):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 70115
        mmTop = 34925
        mmWidth = 63765
        BandType = 0
      end
      object lblValorDivergEP: TppLabel
        UserName = 'lblValorDivergEP'
        AutoSize = False
        Caption = 'Com divergência de valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 70115
        mmTop = 39952
        mmWidth = 63765
        BandType = 0
      end
      object lblValorNAOZeroEP: TppLabel
        UserName = 'lblValorNAOZeroEP'
        AutoSize = False
        Caption = 'Recebidos '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 70115
        mmTop = 43921
        mmWidth = 63765
        BandType = 0
      end
      object lblValorZeroEP: TppLabel
        UserName = 'lblValorZeroEP'
        AutoSize = False
        Caption = 'Não recebidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 70115
        mmTop = 47890
        mmWidth = 63765
        BandType = 0
      end
      object lblDivergFolhaEP: TppLabel
        UserName = 'lblDivergFolhaEP'
        AutoSize = False
        Caption = 'Com divergência de valor (em relação à Folha)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 70115
        mmTop = 51858
        mmWidth = 63765
        BandType = 0
      end
      object linCabecalhoEP: TppLine
        UserName = 'linCabecalhoEP'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 70115
        mmTop = 38629
        mmWidth = 63765
        BandType = 0
      end
      object lblCaP: TppLabel
        UserName = 'lblCaP'
        AutoSize = False
        Caption = 'Exibindo valores a Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 70115
        mmTop = 22490
        mmWidth = 63765
        BandType = 0
      end
      object lblCaR: TppLabel
        UserName = 'lblCaR'
        AutoSize = False
        Caption = 'Exibindo valores a Receber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 70115
        mmTop = 26458
        mmWidth = 63765
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'Line201'
        Pen.Style = psClear
        Position = lpBottom
        Weight = 0.75
        mmHeight = 5821
        mmLeft = 0
        mmTop = 29369
        mmWidth = 270669
        BandType = 0
      end
      object lblNaoEnviado: TppLabel
        UserName = 'lblCaR1'
        AutoSize = False
        Caption = 'Não exibindo itens não enviados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 135732
        mmTop = 22490
        mmWidth = 63765
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppLine4: TppLine
        OnPrint = ppLine4Print
        UserName = 'Line4'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VALOR_BAIXADO'
        DataPipeline = pplConciliaCapCar
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConciliaCapCar'
        mmHeight = 2910
        mmLeft = 213255
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CODDOCUMENTO'
        DataPipeline = pplConciliaCapCar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConciliaCapCar'
        mmHeight = 3175
        mmLeft = 794
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'NODOCUMENTO_COMPL'
        DataPipeline = pplConciliaCapCar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConciliaCapCar'
        mmHeight = 3175
        mmLeft = 18785
        mmTop = 794
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'RESIDUO'
        DataPipeline = pplConciliaCapCar
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConciliaCapCar'
        mmHeight = 2910
        mmLeft = 232305
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        BlankWhenZero = True
        DataField = 'VLRNAORECEBIDO'
        DataPipeline = pplConciliaCapCar
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConciliaCapCar'
        mmHeight = 2910
        mmLeft = 252413
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        BlankWhenZero = True
        DataField = 'VALOR_LANCADO'
        DataPipeline = pplConciliaCapCar
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConciliaCapCar'
        mmHeight = 2910
        mmLeft = 194205
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'HMEVLREFETIVO'
        DataPipeline = pplConciliaCapCar
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConciliaCapCar'
        mmHeight = 2910
        mmLeft = 174096
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplConciliaCapCar
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConciliaCapCar'
        mmHeight = 2910
        mmLeft = 155046
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'PESSOA_DOCUMENTO'
        DataPipeline = pplConciliaCapCar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConciliaCapCar'
        mmHeight = 3175
        mmLeft = 49477
        mmTop = 794
        mmWidth = 88900
        BandType = 4
      end
      object ppSubReport1: TppSubReport
        OnPrint = ppSubReport1Print
        UserName = 'SubReport1'
        DrillDownComponent = ppDBText9
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplHistMov'
        mmHeight = 265
        mmLeft = 0
        mmTop = 4498
        mmWidth = 270542
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplHistMov
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Valores a Receber - Folha(s)'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6615
          PrinterSetup.mmMarginLeft = 13229
          PrinterSetup.mmMarginRight = 13229
          PrinterSetup.mmMarginTop = 6615
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utScreenPixels
          Left = 136
          Top = 64
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplHistMov'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 7938
            mmPrintPosition = 0
            object ppShape4: TppShape
              UserName = 'Shape4'
              Brush.Color = 15263976
              mmHeight = 4233
              mmLeft = 13229
              mmTop = 3704
              mmWidth = 257440
              BandType = 1
            end
            object ppLabel11: TppLabel
              UserName = 'Label1'
              Caption = 'Vlr.Previsto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 161925
              mmTop = 4498
              mmWidth = 13494
              BandType = 1
            end
            object ppLabel13: TppLabel
              UserName = 'Label13'
              Caption = 'Vlr.Efetivo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 179652
              mmTop = 4498
              mmWidth = 12171
              BandType = 1
            end
            object ppLabel19: TppLabel
              UserName = 'Label19'
              Caption = 'Mutuário'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 53711
              mmTop = 4498
              mmWidth = 10319
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = 'Evento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 195792
              mmTop = 4498
              mmWidth = 8202
              BandType = 1
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'Origem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 233628
              mmTop = 4498
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel15: TppLabel
              UserName = 'Label2'
              Caption = 'Nº Contrato'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 19579
              mmTop = 4498
              mmWidth = 13494
              BandType = 1
            end
            object ppLabel16: TppLabel
              UserName = 'Label16'
              Caption = 'Matricula'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 35719
              mmTop = 4498
              mmWidth = 10848
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object ppLine7: TppLine
              UserName = 'Line7'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 13229
              mmTop = 0
              mmWidth = 257440
              BandType = 4
            end
            object ppLine8: TppLine
              UserName = 'Line8'
              ParentHeight = True
              Position = lpRight
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 13229
              mmTop = 0
              mmWidth = 257440
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              DataField = 'NOME'
              DataPipeline = pplHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplHistMov'
              mmHeight = 2910
              mmLeft = 53711
              mmTop = 529
              mmWidth = 107421
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              DataField = 'EVENTO'
              DataPipeline = pplHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplHistMov'
              mmHeight = 2910
              mmLeft = 195792
              mmTop = 529
              mmWidth = 35983
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'ORIGEM'
              DataPipeline = pplHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplHistMov'
              mmHeight = 2910
              mmLeft = 233628
              mmTop = 529
              mmWidth = 36248
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'DBText13'
              DataField = 'HMEVLREFETIVO'
              DataPipeline = pplHistMov
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplHistMov'
              mmHeight = 2910
              mmLeft = 177271
              mmTop = 529
              mmWidth = 14552
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              DataField = 'HMEVLRPREVISTO'
              DataPipeline = pplHistMov
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplHistMov'
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 529
              mmWidth = 14552
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              DataField = 'MATRICULA'
              DataPipeline = pplHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplHistMov'
              mmHeight = 2910
              mmLeft = 35719
              mmTop = 529
              mmWidth = 15081
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              DataField = 'IDCONTRATOEMPTMO'
              DataPipeline = pplHistMov
              DisplayFormat = '#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplHistMov'
              mmHeight = 2910
              mmLeft = 13758
              mmTop = 529
              mmWidth = 19315
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 12700
            mmPrintPosition = 0
            object ppLine6: TppLine
              UserName = 'Line6'
              ParentHeight = True
              Weight = 0.75
              mmHeight = 12700
              mmLeft = 13229
              mmTop = 0
              mmWidth = 257440
              BandType = 7
            end
            object ppDBCalc1: TppDBCalc
              UserName = 'DBCalc1'
              DataField = 'HMEVLRPREVISTO'
              DataPipeline = pplHistMov
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'pplHistMov'
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 794
              mmWidth = 14552
              BandType = 7
            end
            object ppDBCalc2: TppDBCalc
              UserName = 'DBCalc2'
              DataField = 'HMEVLREFETIVO'
              DataPipeline = pplHistMov
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'pplHistMov'
              mmHeight = 2910
              mmLeft = 177271
              mmTop = 794
              mmWidth = 14552
              BandType = 7
            end
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 12700
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema1'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 1852
        mmWidth = 25665
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
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
        mmLeft = 87842
        mmTop = 1852
        mmWidth = 94986
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
        mmLeft = 242888
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      NewPage = True
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 35983
      mmPrintPosition = 0
      object ppSubReport2: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplEnviadoSemTmpDesc'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = pplEnviadoSemTmpDesc
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Valores a Receber - Folha(s)'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6615
          PrinterSetup.mmMarginLeft = 13229
          PrinterSetup.mmMarginRight = 13229
          PrinterSetup.mmMarginTop = 6615
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utScreenPixels
          Left = 152
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplEnviadoSemTmpDesc'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 17463
            mmPrintPosition = 0
            object ppShape7: TppShape
              UserName = 'Shape7'
              Brush.Color = 15263976
              mmHeight = 10848
              mmLeft = 13229
              mmTop = 6615
              mmWidth = 257440
              BandType = 1
            end
            object ppLabel34: TppLabel
              UserName = 'Label34'
              Caption = 'Vlr.Previsto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 161925
              mmTop = 14023
              mmWidth = 13494
              BandType = 1
            end
            object ppLabel35: TppLabel
              UserName = 'Label35'
              Caption = 'Vlr.Efetivo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 179652
              mmTop = 14023
              mmWidth = 12171
              BandType = 1
            end
            object ppLabel36: TppLabel
              UserName = 'Label36'
              Caption = 'Mutuário'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 53711
              mmTop = 14023
              mmWidth = 10319
              BandType = 1
            end
            object ppLabel37: TppLabel
              UserName = 'Label37'
              Caption = 'Evento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 195792
              mmTop = 14023
              mmWidth = 8202
              BandType = 1
            end
            object ppLabel38: TppLabel
              UserName = 'Label38'
              Caption = 'Origem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 233628
              mmTop = 14023
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel39: TppLabel
              UserName = 'Label39'
              Caption = 'Nº Contrato'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 19579
              mmTop = 14023
              mmWidth = 13494
              BandType = 1
            end
            object ppLabel40: TppLabel
              UserName = 'Label40'
              Caption = 'Matricula'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 35719
              mmTop = 14023
              mmWidth = 10848
              BandType = 1
            end
            object ppLabel48: TppLabel
              UserName = 'Label48'
              AutoSize = False
              Caption = 'Itens Enviados sem vínculo com Financeiro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 15346
              mmTop = 7673
              mmWidth = 64294
              BandType = 1
            end
            object ppLabel50: TppLabel
              UserName = 'Label50'
              Caption = 'Parcela'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 148167
              mmTop = 14023
              mmWidth = 8731
              BandType = 1
            end
            object ppLabel54: TppLabel
              UserName = 'Label502'
              Caption = 'Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 135467
              mmTop = 14023
              mmWidth = 5292
              BandType = 1
            end
          end
          object ppDetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
            object ppLine12: TppLine
              UserName = 'Line12'
              ParentHeight = True
              Position = lpRight
              Weight = 0.75
              mmHeight = 3440
              mmLeft = 13229
              mmTop = 0
              mmWidth = 257440
              BandType = 4
            end
            object ppLine11: TppLine
              UserName = 'Line11'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3440
              mmLeft = 13229
              mmTop = 0
              mmWidth = 257440
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              DataField = 'NOME'
              DataPipeline = pplEnviadoSemTmpDesc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 53711
              mmTop = 529
              mmWidth = 71438
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              DataField = 'EVENTO'
              DataPipeline = pplEnviadoSemTmpDesc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 195792
              mmTop = 529
              mmWidth = 35983
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              DataField = 'ORIGEM'
              DataPipeline = pplEnviadoSemTmpDesc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 233628
              mmTop = 529
              mmWidth = 36248
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              DataField = 'HMEVLREFETIVO'
              DataPipeline = pplEnviadoSemTmpDesc
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 177271
              mmTop = 529
              mmWidth = 14552
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText24'
              DataField = 'HMEVLRPREVISTO'
              DataPipeline = pplEnviadoSemTmpDesc
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 529
              mmWidth = 14552
              BandType = 4
            end
            object ppDBText25: TppDBText
              UserName = 'DBText25'
              DataField = 'MATRICULA'
              DataPipeline = pplEnviadoSemTmpDesc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 35719
              mmTop = 529
              mmWidth = 15081
              BandType = 4
            end
            object ppDBText26: TppDBText
              UserName = 'DBText26'
              DataField = 'IDCONTRATOEMPTMO'
              DataPipeline = pplEnviadoSemTmpDesc
              DisplayFormat = '#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 13758
              mmTop = 529
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText34: TppDBText
              UserName = 'DBText34'
              DataField = 'HMEPARCELA'
              DataPipeline = pplEnviadoSemTmpDesc
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 146050
              mmTop = 529
              mmWidth = 5556
              BandType = 4
            end
            object ppLabel51: TppLabel
              UserName = 'Label51'
              Caption = ' / '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 151342
              mmTop = 0
              mmWidth = 2381
              BandType = 4
            end
            object ppDBText35: TppDBText
              UserName = 'DBText35'
              DataField = 'HMENUMPARCELAS'
              DataPipeline = pplEnviadoSemTmpDesc
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 153459
              mmTop = 529
              mmWidth = 5556
              BandType = 4
            end
            object ppDBText44: TppDBText
              UserName = 'DBText44'
              DataField = 'HMEDATAVENCTO'
              DataPipeline = pplEnviadoSemTmpDesc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 131234
              mmTop = 529
              mmWidth = 14023
              BandType = 4
            end
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object ppLine15: TppLine
              UserName = 'Line15'
              ParentHeight = True
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 13229
              mmTop = 0
              mmWidth = 257440
              BandType = 7
            end
            object ppDBCalc13: TppDBCalc
              UserName = 'DBCalc13'
              DataField = 'HMEVLRPREVISTO'
              DataPipeline = pplEnviadoSemTmpDesc
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 794
              mmWidth = 14552
              BandType = 7
            end
            object ppDBCalc14: TppDBCalc
              UserName = 'DBCalc14'
              DataField = 'HMEVLREFETIVO'
              DataPipeline = pplEnviadoSemTmpDesc
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 177271
              mmTop = 794
              mmWidth = 14552
              BandType = 7
            end
          end
        end
      end
      object ppSubReport3: TppSubReport
        UserName = 'SubReport3'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSubReport2
        TraverseAllData = False
        DataPipelineName = 'pplNaoEnviado'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 10054
        mmWidth = 270542
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = pplNaoEnviado
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Valores a Receber - Folha(s)'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6615
          PrinterSetup.mmMarginLeft = 13229
          PrinterSetup.mmMarginRight = 13229
          PrinterSetup.mmMarginTop = 6615
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utScreenPixels
          Left = 168
          Top = 144
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplNaoEnviado'
          object ppTitleBand3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 17463
            mmPrintPosition = 0
            object ppShape6: TppShape
              UserName = 'Shape6'
              Brush.Color = 15263976
              mmHeight = 10848
              mmLeft = 13229
              mmTop = 6615
              mmWidth = 257440
              BandType = 1
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              Caption = 'Vlr.Previsto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 161925
              mmTop = 14023
              mmWidth = 13494
              BandType = 1
            end
            object ppLabel22: TppLabel
              UserName = 'Label22'
              Caption = 'Vlr.Efetivo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 179652
              mmTop = 14023
              mmWidth = 12171
              BandType = 1
            end
            object ppLabel23: TppLabel
              UserName = 'Label23'
              Caption = 'Mutuário'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 53711
              mmTop = 14023
              mmWidth = 10319
              BandType = 1
            end
            object ppLabel26: TppLabel
              UserName = 'Label26'
              Caption = 'Evento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 195792
              mmTop = 14023
              mmWidth = 8202
              BandType = 1
            end
            object ppLabel27: TppLabel
              UserName = 'Label27'
              Caption = 'Origem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 233628
              mmTop = 14023
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel29: TppLabel
              UserName = 'Label29'
              Caption = 'Nº Contrato'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 19579
              mmTop = 14023
              mmWidth = 13494
              BandType = 1
            end
            object ppLabel41: TppLabel
              UserName = 'Label401'
              Caption = 'Matricula'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 35719
              mmTop = 14023
              mmWidth = 10848
              BandType = 1
            end
            object ppLabel42: TppLabel
              UserName = 'Label42'
              AutoSize = False
              Caption = 'Itens NÃO Enviados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 15346
              mmTop = 7673
              mmWidth = 64294
              BandType = 1
            end
            object ppLabel18: TppLabel
              UserName = 'Label501'
              Caption = 'Parcela'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 148167
              mmTop = 14023
              mmWidth = 8731
              BandType = 1
            end
            object ppLabel55: TppLabel
              UserName = 'Label55'
              Caption = 'Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 135467
              mmTop = 14023
              mmWidth = 5292
              BandType = 1
            end
          end
          object ppDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
            object ppLine13: TppLine
              UserName = 'Line13'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3440
              mmLeft = 13229
              mmTop = 0
              mmWidth = 257440
              BandType = 4
            end
            object ppLine14: TppLine
              UserName = 'Line14'
              ParentHeight = True
              Position = lpRight
              Weight = 0.75
              mmHeight = 3440
              mmLeft = 13229
              mmTop = 0
              mmWidth = 257440
              BandType = 4
            end
            object ppDBText27: TppDBText
              UserName = 'DBText27'
              DataField = 'NOME'
              DataPipeline = pplNaoEnviado
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplNaoEnviado'
              mmHeight = 2910
              mmLeft = 53711
              mmTop = 529
              mmWidth = 71438
              BandType = 4
            end
            object ppDBText28: TppDBText
              UserName = 'DBText28'
              DataField = 'EVENTO'
              DataPipeline = pplNaoEnviado
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplNaoEnviado'
              mmHeight = 2910
              mmLeft = 195792
              mmTop = 529
              mmWidth = 35983
              BandType = 4
            end
            object ppDBText29: TppDBText
              UserName = 'DBText29'
              DataField = 'ORIGEM'
              DataPipeline = pplNaoEnviado
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplNaoEnviado'
              mmHeight = 2910
              mmLeft = 233628
              mmTop = 529
              mmWidth = 36248
              BandType = 4
            end
            object ppDBText30: TppDBText
              UserName = 'DBText30'
              DataField = 'HMEVLREFETIVO'
              DataPipeline = pplNaoEnviado
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplNaoEnviado'
              mmHeight = 2910
              mmLeft = 177271
              mmTop = 529
              mmWidth = 14552
              BandType = 4
            end
            object ppDBText31: TppDBText
              UserName = 'DBText31'
              DataField = 'HMEVLRPREVISTO'
              DataPipeline = pplNaoEnviado
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplNaoEnviado'
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 529
              mmWidth = 14552
              BandType = 4
            end
            object ppDBText32: TppDBText
              UserName = 'DBText32'
              DataField = 'MATRICULA'
              DataPipeline = pplNaoEnviado
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplNaoEnviado'
              mmHeight = 2910
              mmLeft = 35719
              mmTop = 529
              mmWidth = 15081
              BandType = 4
            end
            object ppDBText33: TppDBText
              UserName = 'DBText33'
              DataField = 'IDCONTRATOEMPTMO'
              DataPipeline = pplNaoEnviado
              DisplayFormat = '#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplNaoEnviado'
              mmHeight = 2910
              mmLeft = 13758
              mmTop = 529
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText19'
              DataField = 'HMEPARCELA'
              DataPipeline = pplNaoEnviado
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplNaoEnviado'
              mmHeight = 2910
              mmLeft = 146050
              mmTop = 529
              mmWidth = 5556
              BandType = 4
            end
            object ppLabel17: TppLabel
              UserName = 'Label17'
              Caption = ' / '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 151342
              mmTop = 0
              mmWidth = 2381
              BandType = 4
            end
            object ppDBText36: TppDBText
              UserName = 'DBText36'
              DataField = 'HMENUMPARCELAS'
              DataPipeline = pplNaoEnviado
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'pplNaoEnviado'
              mmHeight = 2910
              mmLeft = 153459
              mmTop = 529
              mmWidth = 5556
              BandType = 4
            end
            object ppDBText45: TppDBText
              UserName = 'DBText45'
              DataField = 'HMEDATAVENCTO'
              DataPipeline = pplEnviadoSemTmpDesc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 131234
              mmTop = 529
              mmWidth = 14023
              BandType = 4
            end
          end
          object ppSummaryBand4: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object ppLine16: TppLine
              UserName = 'Line16'
              ParentHeight = True
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 13229
              mmTop = 0
              mmWidth = 257440
              BandType = 7
            end
            object ppDBCalc15: TppDBCalc
              UserName = 'DBCalc15'
              DataField = 'HMEVLRPREVISTO'
              DataPipeline = pplNaoEnviado
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'pplNaoEnviado'
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 794
              mmWidth = 14552
              BandType = 7
            end
            object ppDBCalc16: TppDBCalc
              UserName = 'DBCalc16'
              DataField = 'HMEVLREFETIVO'
              DataPipeline = pplNaoEnviado
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'pplNaoEnviado'
              mmHeight = 2910
              mmLeft = 177271
              mmTop = 794
              mmWidth = 14552
              BandType = 7
            end
          end
        end
      end
      object ppSubReport4: TppSubReport
        UserName = 'SubReport4'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSubReport3
        TraverseAllData = False
        DataPipelineName = 'pplDocSemVinculo'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 20638
        mmWidth = 270542
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport4: TppChildReport
          AutoStop = False
          DataPipeline = pplDocSemVinculo
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Valores a Receber - Folha(s)'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6615
          PrinterSetup.mmMarginLeft = 13229
          PrinterSetup.mmMarginRight = 13229
          PrinterSetup.mmMarginTop = 6615
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utScreenPixels
          Left = 184
          Top = 120
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplDocSemVinculo'
          object ppTitleBand4: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 17463
            mmPrintPosition = 0
            object ppShape8: TppShape
              UserName = 'Shape8'
              Brush.Color = 15263976
              mmHeight = 10848
              mmLeft = 13494
              mmTop = 6615
              mmWidth = 257440
              BandType = 1
            end
            object ppLabel43: TppLabel
              UserName = 'Label43'
              Caption = 'Código'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 39158
              mmTop = 14023
              mmWidth = 8467
              BandType = 1
            end
            object ppLabel44: TppLabel
              UserName = 'Label44'
              Caption = 'Número / Compl.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 50536
              mmTop = 14023
              mmWidth = 19579
              BandType = 1
            end
            object ppLabel45: TppLabel
              UserName = 'Label45'
              Caption = 'Debitado / Favorecido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 81227
              mmTop = 14023
              mmWidth = 25400
              BandType = 1
            end
            object ppLabel47: TppLabel
              UserName = 'Label301'
              Caption = 'Baixado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 204788
              mmTop = 14023
              mmWidth = 9525
              BandType = 1
            end
            object ppLabel49: TppLabel
              UserName = 'Label49'
              Caption = 'Lançado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 185209
              mmTop = 14023
              mmWidth = 10054
              BandType = 1
            end
            object ppLabel52: TppLabel
              UserName = 'Label52'
              Caption = 'Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 14552
              mmTop = 14023
              mmWidth = 5292
              BandType = 1
            end
            object ppLabel53: TppLabel
              UserName = 'Label53'
              AutoSize = False
              Caption = 'Documentos de Empréstimo sem vínculo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 15346
              mmTop = 7673
              mmWidth = 64294
              BandType = 1
            end
          end
          object ppDetailBand5: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
            object ppLine17: TppLine
              UserName = 'Line17'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3440
              mmLeft = 13494
              mmTop = 0
              mmWidth = 257440
              BandType = 4
            end
            object ppLine18: TppLine
              UserName = 'Line18'
              ParentHeight = True
              Position = lpRight
              Weight = 0.75
              mmHeight = 3440
              mmLeft = 13494
              mmTop = 0
              mmWidth = 257440
              BandType = 4
            end
            object ppDBText37: TppDBText
              UserName = 'DBText37'
              DataField = 'CODDOCUMENTO'
              DataPipeline = pplDocSemVinculo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplDocSemVinculo'
              mmHeight = 3175
              mmLeft = 32544
              mmTop = 265
              mmWidth = 15081
              BandType = 4
            end
            object ppDBText38: TppDBText
              UserName = 'DBText38'
              DataField = 'NODOCUMENTO_COMPL'
              DataPipeline = pplDocSemVinculo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplDocSemVinculo'
              mmHeight = 3175
              mmLeft = 50536
              mmTop = 265
              mmWidth = 25400
              BandType = 4
            end
            object ppDBText39: TppDBText
              UserName = 'DBText39'
              DataField = 'PESSOA_DOCUMENTO'
              DataPipeline = pplDocSemVinculo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplDocSemVinculo'
              mmHeight = 3175
              mmLeft = 81227
              mmTop = 265
              mmWidth = 88900
              BandType = 4
            end
            object ppDBText40: TppDBText
              UserName = 'DBText101'
              BlankWhenZero = True
              DataField = 'VALOR_LANCADO'
              DataPipeline = pplDocSemVinculo
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplDocSemVinculo'
              mmHeight = 2910
              mmLeft = 178065
              mmTop = 265
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText41: TppDBText
              UserName = 'DBText41'
              DataField = 'VALOR_BAIXADO'
              DataPipeline = pplDocSemVinculo
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplDocSemVinculo'
              mmHeight = 2910
              mmLeft = 197115
              mmTop = 265
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText43: TppDBText
              UserName = 'DBText43'
              DataField = 'DATA_REF'
              DataPipeline = pplDocSemVinculo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplDocSemVinculo'
              mmHeight = 3175
              mmLeft = 14552
              mmTop = 265
              mmWidth = 14023
              BandType = 4
            end
            object ppDBText46: TppDBText
              UserName = 'DBText46'
              DataField = 'REC_PAG'
              DataPipeline = pplDocSemVinculo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplDocSemVinculo'
              mmHeight = 3175
              mmLeft = 239448
              mmTop = 265
              mmWidth = 25400
              BandType = 4
            end
          end
          object ppSummaryBand5: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object ppLine19: TppLine
              UserName = 'Line19'
              ParentHeight = True
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 13494
              mmTop = 0
              mmWidth = 257440
              BandType = 7
            end
            object ppDBCalc3: TppDBCalc
              UserName = 'DBCalc3'
              DataField = 'HMEVLRPREVISTO'
              DataPipeline = pplDocSemVinculo
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'pplDocSemVinculo'
              mmHeight = 2910
              mmLeft = 178065
              mmTop = 794
              mmWidth = 17198
              BandType = 7
            end
            object ppDBCalc4: TppDBCalc
              UserName = 'DBCalc4'
              DataField = 'HMEVLREFETIVO'
              DataPipeline = pplDocSemVinculo
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'pplDocSemVinculo'
              mmHeight = 2910
              mmLeft = 197115
              mmTop = 794
              mmWidth = 17198
              BandType = 7
            end
          end
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'DATA_REF'
      DataPipeline = pplConciliaCapCar
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplConciliaCapCar'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14288
        mmPrintPosition = 0
        object ppShape5: TppShape
          UserName = 'Shape5'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 7408
          mmLeft = 0
          mmTop = 6879
          mmWidth = 270542
          BandType = 3
          GroupNo = 0
        end
        object ppDBText17: TppDBText
          UserName = 'DBText17'
          DataField = 'DATA_REF'
          DataPipeline = pplConciliaCapCar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaCapCar'
          mmHeight = 3704
          mmLeft = 179388
          mmTop = 8731
          mmWidth = 89694
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'REC_PAG'
      DataPipeline = pplConciliaCapCar
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplConciliaCapCar'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14552
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 14552
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentHeight = True
          ParentWidth = True
          Position = lpBottom
          Weight = 0.75
          mmHeight = 14552
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Previsto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 162719
          mmTop = 11113
          mmWidth = 9525
          BandType = 3
          GroupNo = 1
        end
        object ppLabel21: TppLabel
          UserName = 'Label201'
          AutoSize = False
          Caption = 'Empréstimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 155046
          mmTop = 6879
          mmWidth = 36248
          BandType = 3
          GroupNo = 1
        end
        object ppLine9: TppLine
          UserName = 'Line9'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 155046
          mmTop = 10054
          mmWidth = 36248
          BandType = 3
          GroupNo = 1
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'Efetivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 183092
          mmTop = 11113
          mmWidth = 8202
          BandType = 3
          GroupNo = 1
        end
        object ppLabel25: TppLabel
          UserName = 'Label15'
          Caption = 'Lançado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 201348
          mmTop = 11113
          mmWidth = 10054
          BandType = 3
          GroupNo = 1
        end
        object ppLabel28: TppLabel
          UserName = 'Label28'
          AutoSize = False
          Caption = 'Financeiro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 194205
          mmTop = 6879
          mmWidth = 55298
          BandType = 3
          GroupNo = 1
        end
        object ppLine10: TppLine
          UserName = 'Line10'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 194205
          mmTop = 10054
          mmWidth = 55298
          BandType = 3
          GroupNo = 1
        end
        object ppLabel30: TppLabel
          UserName = 'Label30'
          Caption = 'Baixado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 220928
          mmTop = 11113
          mmWidth = 9525
          BandType = 3
          GroupNo = 1
        end
        object ppLabel31: TppLabel
          UserName = 'Label31'
          Caption = 'Resíduo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 239978
          mmTop = 11113
          mmWidth = 9525
          BandType = 3
          GroupNo = 1
        end
        object ppLabel32: TppLabel
          UserName = 'Label32'
          Caption = 'Valor não'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 258498
          mmTop = 7938
          mmWidth = 11113
          BandType = 3
          GroupNo = 1
        end
        object ppLabel33: TppLabel
          UserName = 'Label33'
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 258763
          mmTop = 11113
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 15875
          mmTop = 6879
          mmWidth = 13494
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Debitado / Favorecido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 49477
          mmTop = 11113
          mmWidth = 25400
          BandType = 3
          GroupNo = 1
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'REC_PAG'
          DataPipeline = pplConciliaCapCar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplConciliaCapCar'
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 1058
          mmWidth = 38365
          BandType = 3
          GroupNo = 1
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 794
          mmTop = 10054
          mmWidth = 43392
          BandType = 3
          GroupNo = 1
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Número / Compl.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 18785
          mmTop = 11113
          mmWidth = 19579
          BandType = 3
          GroupNo = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 7408
          mmTop = 11113
          mmWidth = 8467
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 20373
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 20373
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 5
          GroupNo = 1
        end
        object ppShape2: TppShape
          UserName = 'Shape2'
          mmHeight = 5556
          mmLeft = 153459
          mmTop = 2381
          mmWidth = 117475
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'HMEVLRPREVISTO'
          DataPipeline = pplConciliaCapCar
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaCapCar'
          mmHeight = 3175
          mmLeft = 155046
          mmTop = 3440
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'HMEVLREFETIVO'
          DataPipeline = pplConciliaCapCar
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaCapCar'
          mmHeight = 3175
          mmLeft = 174096
          mmTop = 3440
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'VALOR_LANCADO'
          DataPipeline = pplConciliaCapCar
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaCapCar'
          mmHeight = 3175
          mmLeft = 194205
          mmTop = 3440
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'VALOR_BAIXADO'
          DataPipeline = pplConciliaCapCar
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaCapCar'
          mmHeight = 3175
          mmLeft = 213255
          mmTop = 3440
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'RESIDUO'
          DataPipeline = pplConciliaCapCar
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaCapCar'
          mmHeight = 3175
          mmLeft = 232305
          mmTop = 3440
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'VLRNAORECEBIDO'
          DataPipeline = pplConciliaCapCar
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaCapCar'
          mmHeight = 3175
          mmLeft = 252413
          mmTop = 3440
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object dtsHistMov: TwwDataSource
    DataSet = qryHistMov
    Left = 208
    Top = 72
  end
  object qryHistMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   1234567890  AS CODDOCUMENTO,'
      ''
      '   30000000987546 AS IDCONTRATOEMPTMO,'
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790'#39' AS NOME,'
      '   '#39'1234567890123'#39' AS MATRICULA,'
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790'#39' AS TCEDESCRICAO,'
      '   999 AS HMEPARCELA,'
      '   999 AS HMENUMPARCELAS,'
      ''
      '   '#39'Quitação por Falecimento'#39'                      AS EVENTO,'
      '   '#39'Contabilização em Lote de Atualização Diária'#39'  AS ORIGEM,'
      ''
      '   999999 AS HMEVLRPREVISTO,'
      '   999999 AS HMEVLREFETIVO'
      ''
      'FROM'
      '   DUAL')
    ValidateWithMask = True
    Left = 208
    Top = 56
    object qryHistMovIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryHistMovMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryHistMovTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryHistMovHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryHistMovHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryHistMovEVENTO: TStringField
      FieldName = 'EVENTO'
      Size = 29
    end
    object qryHistMovORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 44
    end
    object qryHistMovHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryHistMovHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryHistMovCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
  end
  object pplHistMov: TppBDEPipeline
    DataSource = dtsHistMov
    UserName = 'pplHistMov'
    Left = 208
    Top = 8
  end
  object pplEnviadoSemTmpDesc: TppBDEPipeline
    DataSource = dtsHistMovSemTmpDesc
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'pplEnviadoSemTmpDesc'
    Left = 64
    Top = 144
  end
  object pplNaoEnviado: TppBDEPipeline
    DataSource = dtsHistMovNaoEnviado
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'pplNaoEnviado'
    Left = 200
    Top = 144
  end
  object qryHistMovSemTmpDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   '#39'A Receber'#39' AS HMERECPAG,'
      '   TO_DATE('#39'01/01/1980'#39', '#39'DD/MM/YYYY'#39') AS HMEDATAVENCTO,'
      ''
      '   30000000987546 AS IDCONTRATOEMPTMO,'
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790'#39' AS NOME,'
      '   '#39'1234567890123'#39' AS MATRICULA,'
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790'#39' AS TCEDESCRICAO,'
      '   999 AS HMEPARCELA,'
      '   999 AS HMENUMPARCELAS,'
      ''
      '   '#39'Quitação por Falecimento'#39'                      AS EVENTO,'
      '   '#39'Contabilização em Lote de Atualização Diária'#39'  AS ORIGEM,'
      ''
      '   999999 AS HMEVLRPREVISTO,'
      '   999999 AS HMEVLREFETIVO'
      ''
      'FROM'
      '   DUAL')
    ValidateWithMask = True
    Left = 64
    Top = 208
    object qryHistMovSemTmpDescIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovSemTmpDescNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 66
    end
    object qryHistMovSemTmpDescMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 13
    end
    object qryHistMovSemTmpDescTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      FixedChar = True
      Size = 66
    end
    object qryHistMovSemTmpDescHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryHistMovSemTmpDescHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryHistMovSemTmpDescEVENTO: TStringField
      FieldName = 'EVENTO'
      FixedChar = True
      Size = 24
    end
    object qryHistMovSemTmpDescORIGEM: TStringField
      FieldName = 'ORIGEM'
      FixedChar = True
      Size = 44
    end
    object qryHistMovSemTmpDescHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryHistMovSemTmpDescHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryHistMovSemTmpDescHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryHistMovSemTmpDescHMERECPAG: TStringField
      FieldName = 'HMERECPAG'
      FixedChar = True
      Size = 9
    end
  end
  object dtsHistMovSemTmpDesc: TwwDataSource
    DataSet = qryHistMovSemTmpDesc
    Left = 64
    Top = 192
  end
  object qryHistMovNaoEnviado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   '#39'A Receber'#39' AS HMERECPAG,'
      '   TO_DATE('#39'01/01/1980'#39', '#39'DD/MM/YYYY'#39') AS HMEDATAVENCTO,'
      ''
      '   30000000987546 AS IDCONTRATOEMPTMO,'
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790'#39' AS NOME,'
      '   '#39'1234567890123'#39' AS MATRICULA,'
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790'#39' AS TCEDESCRICAO,'
      '   999 AS HMEPARCELA,'
      '   999 AS HMENUMPARCELAS,'
      ''
      '   '#39'Quitação por Falecimento'#39'                      AS EVENTO,'
      '   '#39'Contabilização em Lote de Atualização Diária'#39'  AS ORIGEM,'
      ''
      '   999999 AS HMEVLRPREVISTO,'
      '   999999 AS HMEVLREFETIVO'
      ''
      'FROM'
      '   DUAL')
    ValidateWithMask = True
    Left = 200
    Top = 208
    object qryHistMovNaoEnviadoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovNaoEnviadoNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 66
    end
    object qryHistMovNaoEnviadoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 13
    end
    object qryHistMovNaoEnviadoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      FixedChar = True
      Size = 66
    end
    object qryHistMovNaoEnviadoHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryHistMovNaoEnviadoHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryHistMovNaoEnviadoEVENTO: TStringField
      FieldName = 'EVENTO'
      FixedChar = True
      Size = 24
    end
    object qryHistMovNaoEnviadoORIGEM: TStringField
      FieldName = 'ORIGEM'
      FixedChar = True
      Size = 44
    end
    object qryHistMovNaoEnviadoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryHistMovNaoEnviadoHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryHistMovNaoEnviadoHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryHistMovNaoEnviadoHMERECPAG: TStringField
      FieldName = 'HMERECPAG'
      FixedChar = True
      Size = 9
    end
  end
  object dtsHistMovNaoEnviado: TwwDataSource
    DataSet = qryHistMovNaoEnviado
    Left = 200
    Top = 192
  end
  object pplDocSemVinculo: TppBDEPipeline
    DataSource = dtsDocSemVinculo
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'pplDocSemVinculo'
    Left = 320
    Top = 144
  end
  object qryDocSemVinculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TO_DATE('#39'01/01/1980'#39', '#39'DD/MM/YYYY'#39') AS DATA_REF,'
      ''
      '   1234567890                          AS CODDOCUMENTO,'
      '   30000000325648                      AS NODOCUMENTO,'
      '   '#39'000'#39'                               AS COMPLDOCUMENTO,'
      '   '#39'30000000325648 / 001'#39'              AS NODOCUMENTO_COMPL,'
      ''
      '   '#39'A Receber'#39'                         AS REC_PAG,'
      '   '#39'A Receber - 01/01/1980'#39'            AS REC_PAG_DATA,'
      ''
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790'#39' AS PESSOA_DOCUMENTO,'
      ''
      '   999999999         AS VALOR_LANCADO,'
      '   999999999         AS VALOR_BAIXADO'
      ''
      'FROM'
      '   DUAL')
    ValidateWithMask = True
    Left = 320
    Top = 208
    object qryDocSemVinculoDATA_REF: TDateTimeField
      FieldName = 'DATA_REF'
    end
    object qryDocSemVinculoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryDocSemVinculoNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object qryDocSemVinculoCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object qryDocSemVinculoNODOCUMENTO_COMPL: TStringField
      FieldName = 'NODOCUMENTO_COMPL'
      FixedChar = True
    end
    object qryDocSemVinculoREC_PAG: TStringField
      FieldName = 'REC_PAG'
      FixedChar = True
      Size = 9
    end
    object qryDocSemVinculoREC_PAG_DATA: TStringField
      FieldName = 'REC_PAG_DATA'
      FixedChar = True
      Size = 22
    end
    object qryDocSemVinculoPESSOA_DOCUMENTO: TStringField
      FieldName = 'PESSOA_DOCUMENTO'
      FixedChar = True
      Size = 66
    end
    object qryDocSemVinculoVALOR_LANCADO: TFloatField
      FieldName = 'VALOR_LANCADO'
    end
    object qryDocSemVinculoVALOR_BAIXADO: TFloatField
      FieldName = 'VALOR_BAIXADO'
    end
  end
  object dtsDocSemVinculo: TwwDataSource
    DataSet = qryDocSemVinculo
    Left = 320
    Top = 192
  end
end
