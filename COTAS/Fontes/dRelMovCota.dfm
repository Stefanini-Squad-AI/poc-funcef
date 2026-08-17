inherited dtmRelMovCota: TdtmRelMovCota
  Left = 251
  Top = 286
  Width = 536
  Height = 304
  Caption = 'dtmRelMovCota'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 16
    Top = 8
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
    Left = 168
    Top = 12
  end
  inherited qryExemplo: TwwQuery
    Left = 120
    Top = 8
  end
  inherited rpExemplo: TppReport
    Left = 64
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object dtsMovCota: TwwDataSource
    DataSet = CdsMovCota
    Left = 104
    Top = 148
  end
  object qryMovCota: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dtsSub
    SQL.Strings = (
      'SELECT'
      '   TO_DATE('#39'01/01/2004'#39', '#39'DD/MM/YYYY'#39') AS DATA,'
      '   TO_DATE('#39'01/01/2004'#39', '#39'DD/MM/YYYY'#39') AS DATAINI,'
      ''
      '   0 AS IDATIVOCOTA,'
      ''
      '   100000000.00 AS VLRCOTIZADO,'
      ''
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS ATIVO,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS NOMEPLANO,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS NOMEPATRO,'
      ''
      '   10000000000.00 AS VLRPATRIMONIO,'
      ''
      '   10   AS PERNUMERO,'
      '   2004 AS PEREXERCICIO,'
      ''
      '   10000.000000 AS VLRCOTA,'
      '   1000000.000000 AS QTDCOTA'
      ''
      'FROM'
      '   DUAL'
      ' ')
    ValidateWithMask = True
    Left = 296
    Top = 16
    object qryMovCotaDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object qryMovCotaVLRCOTIZADO: TFloatField
      FieldName = 'VLRCOTIZADO'
    end
    object qryMovCotaATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 60
    end
    object qryMovCotaNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      FixedChar = True
      Size = 60
    end
    object qryMovCotaNOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      FixedChar = True
      Size = 60
    end
    object qryMovCotaVLRPATRIMONIO: TFloatField
      FieldName = 'VLRPATRIMONIO'
    end
    object qryMovCotaPERNUMERO: TFloatField
      FieldName = 'PERNUMERO'
    end
    object qryMovCotaPEREXERCICIO: TFloatField
      FieldName = 'PEREXERCICIO'
    end
    object qryMovCotaVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
    end
    object qryMovCotaQTDCOTA: TFloatField
      FieldName = 'QTDCOTA'
    end
    object qryMovCotaIDATIVOCOTA: TFloatField
      FieldName = 'IDATIVOCOTA'
    end
  end
  object rptMovCota: TppReport
    AutoStop = False
    DataPipeline = ppMovCota
    OnEndPage = rptMovCotaEndPage
    OnStartPage = rptMovCotaStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Empréstimos Concedidos'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 297128
    PrinterSetup.mmPaperWidth = 210080
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
    Left = 104
    Top = 88
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppMovCota'
    object rptContratosAdminSint_CabecalhoRelat: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 47361
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'rptContratosAdminSint_FundoBandaDetalhe1'
        Brush.Color = 15263976
        ParentWidth = True
        ReprintOnOverFlow = True
        mmHeight = 9790
        mmLeft = 0
        mmTop = 37571
        mmWidth = 183622
        BandType = 0
      end
      object pplbTitulo: TppLabel
        UserName = 'lbTitulo'
        AutoSize = False
        Caption = 'Movimentação de Cotas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 17198
        mmTop = 9790
        mmWidth = 88636
        BandType = 0
      end
      object pplbNomeEmpresa: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'lbNomeEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 17198
        mmTop = 3175
        mmWidth = 159544
        BandType = 0
      end
      object lblTipoData: TppLabel
        UserName = 'lblTipoData'
        AutoSize = False
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 133086
        mmTop = 21167
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'lbCompetenciaIni2'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 165365
        mmTop = 21167
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Valor da'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 171186
        mmTop = 39688
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 175948
        mmTop = 43127
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'lblTipoData1'
        Caption = 'Ativo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 13494
        mmTop = 21167
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Plano:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 12700
        mmTop = 25665
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Patrocinadora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1323
        mmTop = 30163
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label8'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 138642
        mmTop = 39423
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'de Cotas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 142346
        mmTop = 43127
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Cotizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 74613
        mmTop = 43127
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 79375
        mmTop = 39423
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Patrimônio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 40746
        mmTop = 43127
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label201'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 3704
        mmTop = 43127
        mmWidth = 6085
        BandType = 0
      end
      object ppDbLogo: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppDadosFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDadosFundacao'
        mmHeight = 13229
        mmLeft = 2381
        mmTop = 3175
        mmWidth = 13229
        BandType = 0
      end
      object ppLbAtivo: TppLabel
        UserName = 'LbAtivo'
        Caption = 'LbAtivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 23019
        mmTop = 21167
        mmWidth = 10319
        BandType = 0
      end
      object ppLbPlano: TppLabel
        UserName = 'LbPlano'
        Caption = 'LbPlano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 23019
        mmTop = 25665
        mmWidth = 11113
        BandType = 0
      end
      object ppLbPatro: TppLabel
        UserName = 'LbPatro'
        Caption = 'LbPatro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 23019
        mmTop = 30163
        mmWidth = 10583
        BandType = 0
      end
      object LbDtInicio: TppLabel
        UserName = 'LbDtInicio'
        Caption = 'LbDtInicio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 150019
        mmTop = 21167
        mmWidth = 13758
        BandType = 0
      end
      object LbDtFim: TppLabel
        UserName = 'LbDtFim'
        Caption = 'LbDtFim'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 168805
        mmTop = 21167
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 116417
        mmTop = 39158
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Rentabilizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 105040
        mmTop = 43127
        mmWidth = 18521
        BandType = 0
      end
    end
    object ppItensContrato: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 3969
      mmPrintPosition = 0
      object shpItem: TppShape
        OnPrint = shpItemPrint
        UserName = 'shpItem'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 183622
        BandType = 4
      end
      object ppSubReport1: TppSubReport
        OnPrint = ppSubReport1Print
        UserName = 'SubReport1'
        DrillDownComponent = shpItem
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppSub'
        mmHeight = 3175
        mmLeft = 0
        mmTop = 529
        mmWidth = 183622
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppSub
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Empréstimo - Empréstimos Concedidos'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6615
          PrinterSetup.mmMarginLeft = 13229
          PrinterSetup.mmMarginRight = 13229
          PrinterSetup.mmMarginTop = 6615
          PrinterSetup.mmPaperHeight = 297128
          PrinterSetup.mmPaperWidth = 210080
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utScreenPixels
          Left = 128
          Top = 72
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppSub'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 18521
            mmPrintPosition = 0
            object ppLine4: TppLine
              UserName = 'Line4'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 9260
              mmLeft = 0
              mmTop = 9260
              mmWidth = 183622
              BandType = 1
            end
            object ppLine2: TppLine
              UserName = 'Line1'
              Pen.Width = 2
              Position = lpBottom
              Weight = 1.5
              mmHeight = 3969
              mmLeft = 60854
              mmTop = 14023
              mmWidth = 58738
              BandType = 1
            end
            object ppLabel1: TppLabel
              UserName = 'Label1'
              Caption = 'Valor Cotizado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3175
              mmLeft = 81492
              mmTop = 14023
              mmWidth = 18521
              BandType = 1
            end
            object ppLine3: TppLine
              UserName = 'Line3'
              Pen.Width = 2
              Position = lpBottom
              Weight = 1.5
              mmHeight = 3969
              mmLeft = 123031
              mmTop = 14023
              mmWidth = 60061
              BandType = 1
            end
            object ppLabel2: TppLabel
              UserName = 'Label2'
              Caption = 'Valor Rentabilizado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3175
              mmLeft = 140759
              mmTop = 14023
              mmWidth = 24606
              BandType = 1
            end
          end
          object ppDetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppShape2: TppShape
              OnPrint = ppShape2Print
              UserName = 'shpItem1'
              Brush.Color = 13040076
              ParentHeight = True
              ParentWidth = True
              Pen.Style = psClear
              ReprintOnOverFlow = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 0
              mmWidth = 183622
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              DataField = 'DESCRICAO'
              DataPipeline = ppSub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppSub'
              mmHeight = 3175
              mmLeft = 0
              mmTop = 529
              mmWidth = 57150
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              DataField = 'VLRCOTIMENOS'
              DataPipeline = ppSub
              DisplayFormat = '#,#0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppSub'
              mmHeight = 3175
              mmLeft = 91017
              mmTop = 529
              mmWidth = 28575
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              DataField = 'VLRCOTIMAIS'
              DataPipeline = ppSub
              DisplayFormat = '#,#0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppSub'
              mmHeight = 3175
              mmLeft = 60854
              mmTop = 529
              mmWidth = 28840
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              DataField = 'VLRRENTMAIS'
              DataPipeline = ppSub
              DisplayFormat = '#,#0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppSub'
              mmHeight = 3175
              mmLeft = 122502
              mmTop = 529
              mmWidth = 30427
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'VLRRENTMENOS'
              DataPipeline = ppSub
              DisplayFormat = '#,#0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppSub'
              mmHeight = 3175
              mmLeft = 153988
              mmTop = 529
              mmWidth = 29104
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 25400
            mmPrintPosition = 0
            object ppLine5: TppLine
              UserName = 'Line5'
              ParentWidth = True
              Position = lpBottom
              Weight = 0.75
              mmHeight = 8467
              mmLeft = 0
              mmTop = 0
              mmWidth = 183622
              BandType = 7
            end
            object ppShape3: TppShape
              UserName = 'Shape1'
              mmHeight = 4763
              mmLeft = 59267
              mmTop = 529
              mmWidth = 124884
              BandType = 7
            end
            object ppDBCalc1: TppDBCalc
              UserName = 'DBCalc1'
              DataField = 'VLRCOTIMAIS'
              DataPipeline = ppSub
              DisplayFormat = '#,#0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppSub'
              mmHeight = 3175
              mmLeft = 60325
              mmTop = 1323
              mmWidth = 29369
              BandType = 7
            end
            object ppDBCalc2: TppDBCalc
              UserName = 'DBCalc2'
              DataField = 'VLRCOTIMENOS'
              DataPipeline = ppSub
              DisplayFormat = '#,#0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppSub'
              mmHeight = 3175
              mmLeft = 90752
              mmTop = 1323
              mmWidth = 29104
              BandType = 7
            end
            object ppDBCalc3: TppDBCalc
              UserName = 'DBCalc3'
              DataField = 'VLRRENTMAIS'
              DataPipeline = ppSub
              DisplayFormat = '#,#0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppSub'
              mmHeight = 3175
              mmLeft = 121709
              mmTop = 1323
              mmWidth = 31221
              BandType = 7
            end
            object ppDBCalc4: TppDBCalc
              UserName = 'DBCalc4'
              DataField = 'VLRRENTMENOS'
              DataPipeline = ppSub
              DisplayFormat = '#,#0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppSub'
              mmHeight = 3175
              mmLeft = 155311
              mmTop = 1323
              mmWidth = 27781
              BandType = 7
            end
          end
        end
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'QTDCOTA'
        DataPipeline = ppMovCota
        DisplayFormat = '#,#0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppMovCota'
        mmHeight = 3175
        mmLeft = 140494
        mmTop = 529
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'VLRCOTA'
        DataPipeline = ppMovCota
        DisplayFormat = '#,#0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppMovCota'
        mmHeight = 3175
        mmLeft = 169069
        mmTop = 529
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'VLRPATRIMONIO'
        DataPipeline = ppMovCota
        DisplayFormat = '#,#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppMovCota'
        mmHeight = 3175
        mmLeft = 32279
        mmTop = 529
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'VLRCOTIZADO'
        DataPipeline = ppMovCota
        DisplayFormat = '#,#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppMovCota'
        mmHeight = 3175
        mmLeft = 66411
        mmTop = 529
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'DATA'
        DataPipeline = ppMovCota
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppMovCota'
        mmHeight = 3175
        mmLeft = 3704
        mmTop = 529
        mmWidth = 7408
        BandType = 4
      end
      object ppLinhaSeparadora: TppLine
        UserName = 'LinhaSeparadora'
        ParentWidth = True
        Position = lpBottom
        Visible = False
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 2381
        mmWidth = 183622
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'VLRRENTABILIZADO'
        DataPipeline = ppMovCota
        DisplayFormat = '#,#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppMovCota'
        mmHeight = 3175
        mmLeft = 101336
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 40
      mmHeight = 12700
      mmPrintPosition = 0
      object ppLine37: TppLine
        UserName = 'ppLine37'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 4233
        mmWidth = 183622
        BandType = 8
      end
      object pplbNomeSistema: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'lbNomeSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 5556
        mmWidth = 23813
        BandType = 8
      end
      object ppCalc23: TppSystemVariable
        UserName = 'Calc23'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 84402
        mmTop = 5556
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 158221
        mmTop = 5556
        mmWidth = 25400
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 183622
        BandType = 7
      end
    end
  end
  object qrySub: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS MOVIMENTACAO,'
      '   100000000.00 AS COTIZAMAIS,'
      '   0.00 AS COTIZAMENOS,'
      '   0.00 AS RENTABILIZAMAIS,'
      '   0.00 AS RENTABILIZAMENOS'
      'FROM DUAL'
      ''
      'union'
      ''
      'SELECT'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS MOVIMENTACAO,'
      '   0.00 AS COTIZAMAIS,'
      '   100000000.00 AS COTIZAMENOS,'
      '   0.00 AS RENTABILIZAMAIS,'
      '   0.00 AS RENTABILIZAMENOS'
      'FROM DUAL'
      ''
      'union'
      ''
      'SELECT'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS MOVIMENTACAO,'
      '   0.00 AS COTIZAMAIS,'
      '   0.00 AS COTIZAMENOS,'
      '   100000000.00 AS RENTABILIZAMAIS,'
      '   0.00 AS RENTABILIZAMENOS'
      'FROM DUAL'
      ''
      'union'
      ''
      'SELECT'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS MOVIMENTACAO,'
      '   0.00 AS COTIZAMAIS,'
      '   0.00 AS COTIZAMENOS,'
      '   0.00 AS RENTABILIZAMAIS,'
      '   100000000.00 AS RENTABILIZAMENOS'
      'FROM DUAL')
    ValidateWithMask = True
    Left = 344
    Top = 16
    object qrySubCOTIZAMAIS: TFloatField
      FieldName = 'COTIZAMAIS'
    end
    object qrySubCOTIZAMENOS: TFloatField
      FieldName = 'COTIZAMENOS'
    end
    object qrySubRENTABILIZAMAIS: TFloatField
      FieldName = 'RENTABILIZAMAIS'
    end
    object qrySubRENTABILIZAMENOS: TFloatField
      FieldName = 'RENTABILIZAMENOS'
    end
    object qrySubMOVIMENTACAO: TStringField
      FieldName = 'MOVIMENTACAO'
      FixedChar = True
      Size = 60
    end
  end
  object dtsSub: TwwDataSource
    DataSet = CdsSub
    Left = 104
    Top = 204
  end
  object CdsMovCota: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 144
    object CdsMovCotaDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object CdsMovCotaVLRPATRIMONIO: TFloatField
      FieldName = 'VLRPATRIMONIO'
    end
    object CdsMovCotaQTDCOTA: TFloatField
      FieldName = 'QTDCOTA'
    end
    object CdsMovCotaVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
    end
    object CdsMovCotaVLRCOTIZADO: TFloatField
      FieldName = 'VLRCOTIZADO'
    end
    object CdsMovCotaVLRRENTABILIZADO: TFloatField
      FieldName = 'VLRRENTABILIZADO'
    end
    object CdsMovCotaATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 60
    end
    object CdsMovCotaORIGEMATIVO: TStringField
      FieldName = 'ORIGEMATIVO'
      Size = 143
    end
    object CdsMovCotaDATAINI: TDateTimeField
      FieldName = 'DATAINI'
    end
  end
  object ppMovCota: TppDBPipeline
    DataSource = dtsMovCota
    UserName = 'MovCota'
    Left = 24
    Top = 152
  end
  object ppDadosFundacao: TppDBPipeline
    DataSource = dtmLookCotas.dsDadosFundacao
    UserName = 'DadosFundacao'
    Left = 24
    Top = 96
    object ppDadosFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDadosFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDadosFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDadosFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDadosFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDadosFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDadosFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDadosFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDadosFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDadosFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDadosFundacaoppField11: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDadosFundacaoppField12: TppField
      FieldAlias = 'BARCIDUF'
      FieldName = 'BARCIDUF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
  end
  object CdsSub: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 200
    object CdsSubDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object CdsSubDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object CdsSubVLRCOTIMAIS: TFloatField
      FieldName = 'VLRCOTIMAIS'
    end
    object CdsSubVLRCOTIMENOS: TFloatField
      FieldName = 'VLRCOTIMENOS'
    end
    object CdsSubVLRRENTMAIS: TFloatField
      FieldName = 'VLRRENTMAIS'
    end
    object CdsSubVLRRENTMENOS: TFloatField
      FieldName = 'VLRRENTMENOS'
    end
  end
  object ppSub: TppDBPipeline
    DataSource = dtsSub
    UserName = 'Sub'
    Left = 32
    Top = 208
    object ppSubppField1: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppSubppField2: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppSubppField3: TppField
      FieldAlias = 'VLRCOTIMAIS'
      FieldName = 'VLRCOTIMAIS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppSubppField4: TppField
      FieldAlias = 'VLRCOTIMENOS'
      FieldName = 'VLRCOTIMENOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppSubppField5: TppField
      FieldAlias = 'VLRRENTMAIS'
      FieldName = 'VLRRENTMAIS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppSubppField6: TppField
      FieldAlias = 'VLRRENTMENOS'
      FieldName = 'VLRRENTMENOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        'CCO.DATA, CCO.DATAINI, CCO.VLRPATRIMONIO, CCO.QTDCOTA, CCO.VLRCO' +
        'TA, CCO.VLRCOTIZADO, CCO.VLRRENTABILIZADO,'
      'DECODE(A.DESCRICAO, NULL,'
      'DECODE(A.IDFUNDOINVEST, NULL,'
      'DECODE(A.IDINVESTIMENTO, NULL,'
      'DECODE(A.IDTIPOCONTREMPTMO, NULL,'
      'DECODE(A.IDIMOVEL, NULL,'
      'DECODE(A.IDCARTEIRASPC, NULL, '#39#39','
      
        '      (SELECT DESCARTEIRASPC    FROM  CARTEIRASPC      WHERE  ID' +
        'CARTEIRASPC     =  A.IDCARTEIRASPC   )),'
      
        '      (SELECT  IMONOME          FROM  IMOVEL           WHERE  ID' +
        'IMOVEL          =  A.IDIMOVEL)),'
      
        '      (SELECT  TCEDESCRICAO     FROM  TIPOCONTREMPTMO  WHERE  ID' +
        'TIPOCONTREMPTMO =  A.IDTIPOCONTREMPTMO)),'
      
        '      (SELECT  DESCINVESTIMENTO FROM  INVESTIMENTO     WHERE  ID' +
        'INVESTIMENTO    =  A.IDINVESTIMENTO)),'
      
        '      (SELECT  DESCFUNDOINVEST  FROM  FUNDOINVEST      WHERE  ID' +
        'FUNDOINVEST     =  A.IDFUNDOINVEST)),'
      'A.DESCRICAO) AS ATIVO,'
      'DECODE(A.DESCRICAO, NULL,'
      'DECODE(A.IDFUNDOINVEST, NULL,'
      'DECODE(A.IDINVESTIMENTO, NULL,'
      'DECODE(A.IDTIPOCONTREMPTMO, NULL,'
      'DECODE(A.IDIMOVEL, NULL,'
      'DECODE(A.IDCARTEIRASPC, NULL, '#39#39','
      
        '      (SELECT DESCARTEIRASPC    FROM  CARTEIRASPC      WHERE  ID' +
        'CARTEIRASPC     =  A.IDCARTEIRASPC   )),'
      '      '#39'Imobiliário'#39'),'
      '      '#39'Empréstimo'#39'),'
      
        '      (SELECT TI.DESCTIPOINVEST FROM  INVESTIMENTO I, TIPOINVEST' +
        ' TI'
      '       WHERE TI.IDTIPOINVEST = I.IDTIPOINVEST'
      '       AND I.IDINVESTIMENTO = A.IDINVESTIMENTO)),'
      
        '      (SELECT (TI.DESCTIPOINVEST||'#39' - '#39'|| TF.DESCTIPOFUNDOINV) A' +
        'S DESCRICAO'
      '       FROM   FUNDOINVEST F, TIPOINVEST TI, TIPOFUNDOINVEST TF'
      '       WHERE'
      '          F.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST'
      '       AND'
      '          TF.IDTIPOINVEST = TI.IDTIPOINVEST'
      '       AND'
      '          F.IDFUNDOINVEST     =  A.IDFUNDOINVEST)),'
      #39'Cotas Manuais'#39') AS ORIGEMATIVO'
      'FROM'
      '  COTACOTACAO CCO, ATIVOCOTA A'
      'WHERE'
      '    CCO.IDATIVOCOTA  = A.IDATIVOCOTA'
      '    AND 1 = 2')
    Left = 344
    Top = 104
  end
end
