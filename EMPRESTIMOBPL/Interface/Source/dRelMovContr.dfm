inherited dtmRelMovContr: TdtmRelMovContr
  Left = 382
  Top = 306
  Width = 415
  Height = 169
  Caption = 'dRelMovContr'
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
  object pplMovimentoContr: TppBDEPipeline
    DataSource = dtsMovimentoContr
    CloseDataSource = True
    UserName = 'lExemplo1'
    Left = 120
    Top = 56
    object pplMovimentoContrppField1: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField2: TppField
      FieldAlias = 'ORDENACAO'
      FieldName = 'ORDENACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField3: TppField
      FieldAlias = 'DATACREDITO'
      FieldName = 'DATACREDITO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField4: TppField
      FieldAlias = 'IDTIPOCONTREMPTMO'
      FieldName = 'IDTIPOCONTREMPTMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField5: TppField
      FieldAlias = 'IDCONTRATOEMPTMO'
      FieldName = 'IDCONTRATOEMPTMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField6: TppField
      FieldAlias = 'IDITEMEMPTMO'
      FieldName = 'IDITEMEMPTMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField7: TppField
      FieldAlias = 'ITEDESCRICAO'
      FieldName = 'ITEDESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField8: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField9: TppField
      FieldAlias = 'HMEVLRPREVISTO'
      FieldName = 'HMEVLRPREVISTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField10: TppField
      FieldAlias = 'HMEVLREFETIVO'
      FieldName = 'HMEVLREFETIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField11: TppField
      FieldAlias = 'HMETXJUROS'
      FieldName = 'HMETXJUROS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField12: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField13: TppField
      FieldAlias = 'IDRUBRICA'
      FieldName = 'IDRUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField14: TppField
      FieldAlias = 'HMEDATAPREVISTA'
      FieldName = 'HMEDATAPREVISTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField15: TppField
      FieldAlias = 'HMEDATAEFETIVA'
      FieldName = 'HMEDATAEFETIVA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField16: TppField
      FieldAlias = 'HMEDATAVENCTO'
      FieldName = 'HMEDATAVENCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField17: TppField
      FieldAlias = 'ANOCOMP'
      FieldName = 'ANOCOMP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField18: TppField
      FieldAlias = 'MESCOMP'
      FieldName = 'MESCOMP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField19: TppField
      FieldAlias = 'ANOCOBR'
      FieldName = 'ANOCOBR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField20: TppField
      FieldAlias = 'MESCOBR'
      FieldName = 'MESCOBR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField21: TppField
      FieldAlias = 'HMEPARCELA'
      FieldName = 'HMEPARCELA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField22: TppField
      FieldAlias = 'HMESEQCOBRANCA'
      FieldName = 'HMESEQCOBRANCA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField23: TppField
      FieldAlias = 'HMESALDODEV'
      FieldName = 'HMESALDODEV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField24: TppField
      FieldAlias = 'PLNPLANIL'
      FieldName = 'PLNPLANIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField25: TppField
      FieldAlias = 'PLNDATDIA'
      FieldName = 'PLNDATDIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField26: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField27: TppField
      FieldAlias = 'TIPOMOV'
      FieldName = 'TIPOMOV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField28: TppField
      FieldAlias = 'ITCSEQCALCULO'
      FieldName = 'ITCSEQCALCULO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField29: TppField
      FieldAlias = 'FLGFORMAPAG'
      FieldName = 'FLGFORMAPAG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField30: TppField
      FieldAlias = 'SUSPENSAO'
      FieldName = 'SUSPENSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField31: TppField
      FieldAlias = 'EVENTO'
      FieldName = 'EVENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField32: TppField
      FieldAlias = 'ANOMESCOMP'
      FieldName = 'ANOMESCOMP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField33: TppField
      FieldAlias = 'ANOMESCOBR'
      FieldName = 'ANOMESCOBR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object pplMovimentoContrppField34: TppField
      FieldAlias = 'VLR_ABERTO'
      FieldName = 'VLR_ABERTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
  end
  object dtsMovimentoContr: TwwDataSource
    DataSet = qryMovimentoContr
    Left = 120
    Top = 68
  end
  object rpMovimentoContr: TppReport
    AutoStop = False
    DataPipeline = pplMovimentoContr
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Movimentação por Contrato'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Fabio\CM\Relatorios\mov.ep 1.rtm'
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
    mmColumnWidth = 197300
    DataPipelineName = 'pplMovimentoContr'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 22754
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Movimentação de Empréstimo por Contrato'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 43392
        mmTop = 9260
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'Empresa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 3175
        mmWidth = 197380
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object rpMovimentoContrShapeDet: TppShape
        OnPrint = rpMovimentoContrShapeDetPrint
        UserName = 'rpMovimentoContrShapeDet'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'IDITEMEMPTMO'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplMovimentoContr'
        mmHeight = 3175
        mmLeft = 22754
        mmTop = 794
        mmWidth = 3440
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'ITEDESCRICAO'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplMovimentoContr'
        mmHeight = 3175
        mmLeft = 25929
        mmTop = 794
        mmWidth = 32015
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplMovimentoContr
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMovimentoContr'
        mmHeight = 3175
        mmLeft = 133879
        mmTop = 794
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'ANOMESCOMP'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplMovimentoContr'
        mmHeight = 3175
        mmLeft = 74083
        mmTop = 794
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'HMEDATAVENCTO'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplMovimentoContr'
        mmHeight = 3175
        mmLeft = 108479
        mmTop = 794
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'IDRUBRICA'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMovimentoContr'
        mmHeight = 3175
        mmLeft = 236009
        mmTop = 794
        mmWidth = 9260
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'HMETXJUROS'
        DataPipeline = pplMovimentoContr
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMovimentoContr'
        mmHeight = 3175
        mmLeft = 209815
        mmTop = 794
        mmWidth = 7673
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'CODDOCUMENTO'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplMovimentoContr'
        mmHeight = 3175
        mmLeft = 220398
        mmTop = 794
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'HMEDATAPREVISTA'
        DataPipeline = pplMovimentoContr
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMovimentoContr'
        mmHeight = 3175
        mmLeft = 84931
        mmTop = 794
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'HMEVLREFETIVO'
        DataPipeline = pplMovimentoContr
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMovimentoContr'
        mmHeight = 3175
        mmLeft = 147109
        mmTop = 794
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'ANOMESCOBR'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplMovimentoContr'
        mmHeight = 3175
        mmLeft = 97631
        mmTop = 794
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'HMEDATAEFETIVA'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplMovimentoContr'
        mmHeight = 3175
        mmLeft = 121179
        mmTop = 794
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'PLNPLANIL'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplMovimentoContr'
        mmHeight = 3175
        mmLeft = 247121
        mmTop = 794
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'HMEPARCELA'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplMovimentoContr'
        mmHeight = 3175
        mmLeft = 59796
        mmTop = 794
        mmWidth = 7673
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'HMESEQCOBRANCA'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMovimentoContr'
        mmHeight = 3175
        mmLeft = 68527
        mmTop = 794
        mmWidth = 2117
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'HMESALDODEV'
        DataPipeline = pplMovimentoContr
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMovimentoContr'
        mmHeight = 3175
        mmLeft = 195527
        mmTop = 794
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'FLGFORMAPAG'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplMovimentoContr'
        mmHeight = 3175
        mmLeft = 270669
        mmTop = 794
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'EVENTO'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplMovimentoContr'
        mmHeight = 3175
        mmLeft = 265
        mmTop = 794
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'SUSPENSAO'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplMovimentoContr'
        mmHeight = 3175
        mmLeft = 160338
        mmTop = 794
        mmWidth = 32279
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 18256
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line4'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 2646
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 1058
        mmWidth = 41540
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 94986
        mmTop = 1058
        mmWidth = 94192
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 252942
        mmTop = 1058
        mmWidth = 28840
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDCONTRATOEMPTMO'
      DataPipeline = pplMovimentoContr
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplMovimentoContr'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 19844
        mmPrintPosition = 0
        object ppLine2: TppLine
          UserName = 'Line2'
          ParentHeight = True
          ParentWidth = True
          Position = lpBottom
          Weight = 0.75
          mmHeight = 19844
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentWidth = True
          mmHeight = 11377
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplMovimentoContr
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pplMovimentoContr'
          mmHeight = 4233
          mmLeft = 110067
          mmTop = 5556
          mmWidth = 39158
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'NOME'
          DataPipeline = pplMovimentoContr
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pplMovimentoContr'
          mmHeight = 4233
          mmLeft = 19315
          mmTop = 529
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'IDTIPOCONTREMPTMO'
          DataPipeline = pplMovimentoContr
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pplMovimentoContr'
          mmHeight = 3969
          mmLeft = 195527
          mmTop = 5556
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'TCEDESCRICAO'
          DataPipeline = pplMovimentoContr
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pplMovimentoContr'
          mmHeight = 3969
          mmLeft = 203730
          mmTop = 5556
          mmWidth = 79640
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label16'
          Caption = 'Contrato:   '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 92604
          mmTop = 5556
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label17'
          Caption = 'Mutuário:   '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 1588
          mmTop = 529
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label18'
          Caption = 'Tipo de Contrato : '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 165365
          mmTop = 5556
          mmWidth = 29369
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          Caption = 'Evento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 265
          mmTop = 16404
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label2'
          Caption = 'Item'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 22754
          mmTop = 16404
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label14'
          Caption = 'Parc e Seq'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 59267
          mmTop = 16404
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label3'
          Caption = 'Vencto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 109802
          mmTop = 16404
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label15'
          Caption = 'Devedor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 197115
          mmTop = 16404
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label7'
          Caption = 'Cobr.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 98954
          mmTop = 16404
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Juros'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 209815
          mmTop = 16404
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label9'
          Caption = 'Documento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 220398
          mmTop = 16404
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label10'
          Caption = 'Rubrica'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 236009
          mmTop = 16404
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label12'
          Caption = 'Planilha'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 253207
          mmTop = 12965
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'Código / Número'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 248180
          mmTop = 16404
          mmWidth = 19844
          BandType = 3
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'Label21'
          Caption = 'Pagamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 270669
          mmTop = 16404
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object ppLabel26: TppLabel
          UserName = 'Label22'
          Caption = 'Data'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 87577
          mmTop = 12965
          mmWidth = 5292
          BandType = 3
          GroupNo = 0
        end
        object ppLabel27: TppLabel
          UserName = 'Label23'
          Caption = 'Saldo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 200290
          mmTop = 12965
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object ppLabel28: TppLabel
          UserName = 'Label25'
          Caption = 'Tx.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 214048
          mmTop = 12965
          mmWidth = 3440
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label13'
          Caption = 'Forma de '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 270669
          mmTop = 12965
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label20'
          Caption = 'Comp.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 74877
          mmTop = 16404
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'Label26'
          Caption = 'Data'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 111125
          mmTop = 12965
          mmWidth = 5292
          BandType = 3
          GroupNo = 0
        end
        object ppLabel29: TppLabel
          UserName = 'Label29'
          Caption = 'Prevista'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 85461
          mmTop = 16404
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppLabel30: TppLabel
          UserName = 'Label30'
          Caption = 'Efetiva'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 122502
          mmTop = 16404
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppLabel31: TppLabel
          UserName = 'Label31'
          Caption = 'Data'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 123825
          mmTop = 12965
          mmWidth = 5292
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label301'
          Caption = 'Previsto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 135467
          mmTop = 16404
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label4'
          Caption = 'Valor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 139171
          mmTop = 12965
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label5'
          Caption = 'Valor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 152400
          mmTop = 12965
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object ppLabel32: TppLabel
          UserName = 'Label32'
          Caption = 'Efetivo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 150284
          mmTop = 16404
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label6'
          Caption = 'Matrícula:   '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 794
          mmTop = 5556
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          AutoSize = True
          DataField = 'MATRICULA'
          DataPipeline = pplMovimentoContr
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pplMovimentoContr'
          mmHeight = 4233
          mmLeft = 19315
          mmTop = 5556
          mmWidth = 20902
          BandType = 3
          GroupNo = 0
        end
        object ppLabel33: TppLabel
          UserName = 'Label33'
          Caption = 'Código'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 220398
          mmTop = 13229
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 12700
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel34: TppLabel
          UserName = 'Label34'
          Caption = 'Valor em Aberto:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 108215
          mmTop = 1058
          mmWidth = 19844
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALOR_TOTAL_ABERTO'
          DataPipeline = ppBDEPipeline1
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcMaximum
          DataPipelineName = 'ppBDEPipeline1'
          mmHeight = 3175
          mmLeft = 129117
          mmTop = 1058
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryMovimentoContr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   DECODE(DEP.IDTITULAR, NULL, '#39#39', DEP.IDPESSOA, ELP.MATRICULA, ' +
        'DEP.MATRICULA) AS MATRICULA,'
      
        '   DECODE(H.HMETIPOMOV, 0, 0, 1, 2, 2, 6, 3, 9, 4, 7, 5, 1, 6, 3' +
        ', 7, 4, 8, 5, 8) AS ORDENACAO,'
      '   DATACREDITO,'
      '    CASE '
      
        '     WHEN C.IDTIPOCONTREMPTMO IN (82,83,92,93,19,20,15,12,16,13,' +
        '14,11) THEN '#39'Não se aplica'#39
      
        '    WHEN C.IDTIPOCONTREMPTMO IN (28,81,30,90,96,97,21,17,26,85,8' +
        '4,94,18,10,9,8,1,6,2,3,4,5,22,24,23,6,25) THEN '#39'Price'#39
      '    WHEN C.IDTIPOCONTREMPTMO IN (89,95) THEN '#39'Sac'#39
      '         END AS SISTEMA_AMORTIZACAO,'
      '   C.IDTIPOCONTREMPTMO,'
      '   C.IDCONTRATOEMPTMO,'
      '   I.IDITEMEMPTMO,'
      '   I.ITEDESCRICAO,'
      '   P.NOME,'
      '   H.HMEVLRPREVISTO,'
      '   H.HMEVLREFETIVO,'
      '   HMETXJUROS,'
      '   CODDOCUMENTO,'
      '   IDRUBRICA,'
      '   H.HMEDATAPREVISTA,'
      '   H.HMEDATAEFETIVA,'
      '   H.HMEDATAVENCTO,'
      '   H.HMEANOCOMPETENCIA AS ANOCOMP,'
      '   H.HMEMESCOMPETENCIA AS MESCOMP,'
      '   H.HMEANOCOBRANCA AS ANOCOBR,'
      '   H.HMEMESCOBRANCA AS MESCOBR,'
      
        '   (TO_CHAR(NVL(H.HMEPARCELAALT, H.HMEPARCELA), '#39'00'#39') || '#39' / '#39' |' +
        '| TO_CHAR(H.HMENUMPARCELAS, '#39'00'#39')) AS HMEPARCELA,'
      '   H.HMESEQCOBRANCA, '
      '   H.HMESALDODEV, '
      '   (PL.PLNCODIGO||'#39'/'#39'||PL.PLNPLANIL) AS PLNPLANIL, '
      '   PL.PLNDATDIA,'
      '   TC.TCEDESCRICAO, '
      '   H.HMETIPOMOV AS TIPOMOV,'
      '   IC.ITCSEQCALCULO,'
      '   DECODE(C.FLGFORMAPAG,'
      '          '#39'F'#39', '#39'Folha de Pagamento'#39','
      '                 '#39'Banco'#39') AS FLGFORMAPAG,'
      
        '   DECODE(NVL(H.FLGSUSPENSAO, 0), 1, '#39'Suspensa'#39', '#39' '#39') AS SUSPENS' +
        'AO,'
      '   DECODE(H.HMETIPOMOV,'
      '          0, '#39'Concessão/Renovação'#39','
      '          1, '#39'Prestação '#39','
      '          2, '#39'Amortização/Refinanciamento'#39','
      '          3, '#39'Quitação'#39','
      '          4, '#39'Atualização de Débito'#39','
      '          5, '#39'Atualização de Saldo (Diária)'#39' ,'
      '          6, '#39'Importação/Migração'#39','
      '          7, '#39'Ajustes (Cobrança/Devolução)'#39','
      '          8, '#39'Ajustes (Saldo Devedor)'#39
      '         ) AS EVENTO,'
      
        '   TO_CHAR(H.HMEMESCOMPETENCIA, '#39'00'#39') || '#39'/'#39' || TO_CHAR(H.HMEANO' +
        'COMPETENCIA,'#39'0000'#39') AS ANOMESCOMP,'
      
        '   TO_CHAR(H.HMEMESCOBRANCA, '#39'00'#39')    || '#39'/'#39' || TO_CHAR(H.HMEANO' +
        'COBRANCA,'#39'0000'#39')    AS ANOMESCOBR,'
      
        '  DECODE(NVL(H.HMECENTRALIZA,0),0,0,H.HMEVLRPREVISTO-NVL(HMEVLRE' +
        'FETIVO,0)) +'
      
        '  DECODE(NVL(H.HMEDESTACADO,0),0,0,H.HMEVLRPREVISTO-NVL(HMEVLREF' +
        'ETIVO,0)) AS VLR_ABERTO'
      'FROM'
      '   PESSOA           P,'
      '   DEPENTIT         DEP,'
      '   ELEGPATRO        ELP, '
      '   PLANILHA         PL,'
      '   HISTMOVEMPTMO    H,   '
      '   CONTRATOEMPTMO   C,   '
      '   ITEMXTIPOCONTR   IC,  '
      '   TIPOCONTREMPTMO  TC,  '
      '   ITEMEMPTMO       I    '
      'WHERE'
      
        '       (LTRIM(RTRIM(TO_CHAR(H.HMEANOCOMPETENCIA, '#39'0000'#39')))) ||  ' +
        '     (LTRIM(RTRIM(TO_CHAR(H.HMEMESCOMPETENCIA, '#39'00'#39')))) >= '#39'2000' +
        '03'#39
      
        '   AND (LTRIM(RTRIM(TO_CHAR(H.HMEANOCOMPETENCIA, '#39'0000'#39')))) ||  ' +
        '     (LTRIM(RTRIM(TO_CHAR(H.HMEMESCOMPETENCIA, '#39'00'#39')))) <= '#39'2005' +
        '03'#39
      '   AND ((H.FLGESTORNADO IS NULL) OR (H.FLGESTORNADO = 0))'
      '   AND C.IDBENEF           = P.IDPESSOA'
      '   AND C.IDBENEF           = DEP.IDPESSOA'
      '   AND C.IDPESSOA          = DEP.IDTITULAR'
      '   AND C.IDPESSOA          = ELP.IDPESSOA'
      '   AND C.IDPATRO           = ELP.IDPESSJUR'
      '   AND C.IDCONTRATOEMPTMO  = H.IDCONTRATOEMPTMO'
      '   AND C.IDTIPOCONTREMPTMO = IC.IDTIPOCONTREMPTMO'
      '   AND I.IDITEMEMPTMO      = IC.IDITEMEMPTMO'
      '   AND H.IDITEMEMPTMO      = IC.IDITEMEMPTMO'
      '   AND H.PLNCODIGO         = PL.PLNCODIGO(+)'
      
        '   AND C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO   AND H.HMETIP' +
        'OMOV        <> 5'
      '   AND C.IDCONTRATOEMPTMO  = 275805240028'
      '   AND C.IDPATRO           IN (91008, 1)'
      '   AND C.IDPLANOPREV        IN (19, 66, 2)'
      'UNION'
      'SELECT'
      
        '   DECODE(DEP.IDTITULAR, NULL, '#39#39', DEP.IDPESSOA, ELP.MATRICULA, ' +
        'DEP.MATRICULA) AS MATRICULA,'
      
        '   DECODE(H.HMETIPOMOV, 0, 0, 1, 2, 2, 6, 3, 9, 4, 7, 5, 1, 6, 3' +
        ', 7, 4, 8, 5, 8) AS ORDENACAO,'
      '   DATACREDITO,'
      '    CASE '
      
        '                WHEN C.IDTIPOCONTREMPTMO IN (82,83,92,93,19,20,1' +
        '5,12,16,13,14,11) THEN '#39'Não se aplica'#39
      
        '    WHEN C.IDTIPOCONTREMPTMO IN (28,81,30,90,96,97,21,17,26,85,8' +
        '4,94,18,10,9,8,1,6,2,3,4,5,22,24,23,6,25) THEN '#39'Price'#39
      '    WHEN C.IDTIPOCONTREMPTMO IN (89,95) THEN '#39'Sac'#39
      '         END AS SISTEMA_AMORTIZACAO,'
      '   C.IDTIPOCONTREMPTMO,'
      '   C.IDCONTRATOEMPTMO,'
      '   I.IDITEMEMPTMO,'
      '   I.ITEDESCRICAO,'
      '   P.NOME,'
      '   H.HMEVLRPREVISTO, '
      '   H.HMEVLREFETIVO, '
      '   HMETXJUROS, '
      '   CODDOCUMENTO, '
      '   IDRUBRICA, '
      '   H.HMEDATAPREVISTA, '
      '   H.HMEDATAEFETIVA, '
      '   H.HMEDATAVENCTO, '
      '   H.HMEANOCOMPETENCIA AS ANOCOMP, '
      '   H.HMEMESCOMPETENCIA AS MESCOMP, '
      '   H.HMEANOCOBRANCA AS ANOCOBR, '
      '   H.HMEMESCOBRANCA AS MESCOBR,'
      
        '   (TO_CHAR(NVL(H.HMEPARCELAALT, H.HMEPARCELA), '#39'00'#39') || '#39' / '#39' |' +
        '| TO_CHAR(H.HMENUMPARCELAS, '#39'00'#39')) AS HMEPARCELA,'
      '   H.HMESEQCOBRANCA, '
      '   H.HMESALDODEV, '
      '   (PL.PLNCODIGO||'#39'/'#39'||PL.PLNPLANIL) AS PLNPLANIL, '
      '   PL.PLNDATDIA, '
      '   TC.TCEDESCRICAO, '
      '   H.HMETIPOMOV AS TIPOMOV,'
      '   IC.ITCSEQCALCULO, '
      '   DECODE(C.FLGFORMAPAG, '
      '          '#39'F'#39', '#39'Folha de Pagamento'#39', '
      '                 '#39'Banco'#39') AS FLGFORMAPAG, '
      
        '   DECODE(NVL(H.FLGSUSPENSAO, 0), 1, '#39'Suspensa'#39', '#39' '#39') AS SUSPENS' +
        'AO, '
      '   DECODE(H.HMETIPOMOV, '
      '          0, '#39'Concessão/Renovação'#39', '
      '          1, '#39'Prestação '#39', '
      '          2, '#39'Amortização/Refinanciamento'#39', '
      '          3, '#39'Quitação'#39', '
      '          4, '#39'Atualização de Débito'#39', '
      '          5, '#39'Atualização de Saldo (Diária)'#39' , '
      '          6, '#39'Importação/Migração'#39', '
      '          7, '#39'Ajustes (Cobrança/Devolução)'#39', '
      '          8, '#39'Ajustes (Saldo Devedor)'#39' '
      '         ) AS EVENTO, '
      
        '   TO_CHAR(H.HMEMESCOMPETENCIA, '#39'00'#39') || '#39'/'#39' || TO_CHAR(H.HMEANO' +
        'COMPETENCIA,'#39'0000'#39') AS ANOMESCOMP, '
      
        '   TO_CHAR(H.HMEMESCOBRANCA, '#39'00'#39')    || '#39'/'#39' || TO_CHAR(H.HMEANO' +
        'COBRANCA,'#39'0000'#39')    AS ANOMESCOBR,'
      
        '  DECODE(NVL(H.HMECENTRALIZA,0),0,0,H.HMEVLRPREVISTO-NVL(HMEVLRE' +
        'FETIVO,0)) +'
      
        '  DECODE(NVL(H.HMEDESTACADO,0),0,0,H.HMEVLRPREVISTO-NVL(HMEVLREF' +
        'ETIVO,0)) AS VLR_ABERTO'
      'FROM'
      '   PESSOA           P,'
      '   DEPENTIT         DEP,'
      '   ELEGPATRO        ELP,'
      '   PLANILHA         PL,'
      '   HISTMOVEMPTMOEXT H,'
      '   CONTRATOEMPTMO   C,'
      '   ITEMXTIPOCONTR   IC,'
      '   TIPOCONTREMPTMO  TC,'
      '   ITEMEMPTMO       I'
      'WHERE'
      
        '      (LTRIM(RTRIM(TO_CHAR(H.HMEANOCOMPETENCIA, '#39'0000'#39')))) ||   ' +
        '    (LTRIM(RTRIM(TO_CHAR(H.HMEMESCOMPETENCIA, '#39'00'#39')))) >= '#39'20000' +
        '3'#39
      
        '  AND (LTRIM(RTRIM(TO_CHAR(H.HMEANOCOMPETENCIA, '#39'0000'#39')))) ||   ' +
        '    (LTRIM(RTRIM(TO_CHAR(H.HMEMESCOMPETENCIA, '#39'00'#39')))) <= '#39'20050' +
        '3'#39
      '  AND ((H.FLGESTORNADO IS NULL) OR (H.FLGESTORNADO = 0))'
      '  AND C.IDBENEF           = P.IDPESSOA           '
      '  AND C.IDBENEF           = DEP.IDPESSOA           '
      '  AND C.IDPESSOA          = DEP.IDTITULAR           '
      '  AND C.IDPESSOA          = ELP.IDPESSOA           '
      '  AND C.IDPATRO           = ELP.IDPESSJUR           '
      '  AND C.IDCONTRATOEMPTMO  = H.IDCONTRATOEMPTMO   '
      '  AND C.IDTIPOCONTREMPTMO = IC.IDTIPOCONTREMPTMO '
      '  AND I.IDITEMEMPTMO      = IC.IDITEMEMPTMO      '
      '  AND H.IDITEMEMPTMO      = IC.IDITEMEMPTMO      '
      '  AND H.PLNCODIGO         = PL.PLNCODIGO(+)      '
      '  AND C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO '
      '  AND H.HMETIPOMOV    <> 5'
      '  AND (C.IDCONTRATOEMPTMO  = 275805240028 )'
      '  AND (C.IDPATRO           IN (91008, 1) )'
      '  AND (C.IDPLANOPREV       IN (19, 66, 2) )'
      'ORDER BY'
      
        ' IDCONTRATOEMPTMO , HMEDATAPREVISTA, ORDENACAO, HMEPARCELA, ITCS' +
        'EQCALCULO, HMESEQCOBRANCA')
    ValidateWithMask = True
    Left = 120
    Top = 80
    object qryMovimentoContrMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryMovimentoContrORDENACAO: TFloatField
      FieldName = 'ORDENACAO'
    end
    object qryMovimentoContrDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryMovimentoContrIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryMovimentoContrIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryMovimentoContrIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryMovimentoContrITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object SISTEMA_AMORTIZACAO: TStringField
      FieldName = 'SISTEMA_AMORTIZACAO'
      Size = 60
    end
    object qryMovimentoContrNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryMovimentoContrHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryMovimentoContrHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryMovimentoContrHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qryMovimentoContrCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryMovimentoContrIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object qryMovimentoContrHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryMovimentoContrHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
    end
    object qryMovimentoContrHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryMovimentoContrANOCOMP: TFloatField
      FieldName = 'ANOCOMP'
    end
    object qryMovimentoContrMESCOMP: TFloatField
      FieldName = 'MESCOMP'
    end
    object qryMovimentoContrANOCOBR: TFloatField
      FieldName = 'ANOCOBR'
    end
    object qryMovimentoContrMESCOBR: TFloatField
      FieldName = 'MESCOBR'
    end
    object qryMovimentoContrHMEPARCELA: TStringField
      FieldName = 'HMEPARCELA'
      Size = 7
    end
    object qryMovimentoContrHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryMovimentoContrHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryMovimentoContrPLNPLANIL: TStringField
      FieldName = 'PLNPLANIL'
      Size = 81
    end
    object qryMovimentoContrPLNDATDIA: TDateTimeField
      FieldName = 'PLNDATDIA'
    end
    object qryMovimentoContrTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryMovimentoContrTIPOMOV: TFloatField
      FieldName = 'TIPOMOV'
    end
    object qryMovimentoContrITCSEQCALCULO: TFloatField
      FieldName = 'ITCSEQCALCULO'
    end
    object qryMovimentoContrFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      Size = 18
    end
    object qryMovimentoContrSUSPENSAO: TStringField
      FieldName = 'SUSPENSAO'
      Size = 8
    end
    object qryMovimentoContrEVENTO: TStringField
      FieldName = 'EVENTO'
      Size = 29
    end
    object qryMovimentoContrANOMESCOMP: TStringField
      FieldName = 'ANOMESCOMP'
      Size = 9
    end
    object qryMovimentoContrANOMESCOBR: TStringField
      FieldName = 'ANOMESCOBR'
      Size = 9
    end
    object qryMovimentoContrVLR_ABERTO: TFloatField
      FieldName = 'VLR_ABERTO'
    end
  end
  object qryOriginal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'             '#39' AS MATRICULA,'
      '  DATACREDITO,'
      '  C.IDTIPOCONTREMPTMO,'
      '  C.IDCONTRATOEMPTMO,'
      '  I.IDITEMEMPTMO,'
      '  I.ITEDESCRICAO,'
      '  P.NOME,'
      '  H.HMEVLRPREVISTO,'
      '  H.HMEVLREFETIVO,'
      '  HMETXJUROS,'
      '  CODDOCUMENTO,'
      '  IDRUBRICA,'
      '  H.HMEDATAPREVISTA,'
      '  H.HMEDATAEFETIVA,'
      '  H.HMEDATAVENCTO,'
      '  H.HMEANOCOMPETENCIA AS ANOCOMP,'
      '  H.HMEMESCOMPETENCIA AS MESCOMP,'
      '  H.HMEANOCOBRANCA AS ANOCOBR,'
      '  H.HMEMESCOBRANCA AS MESCOBR,'
      '  H.HMEPARCELA, H.HMEPARCELAALT,'
      '  H.HMESEQCOBRANCA,'
      '  H.HMESALDODEV,'
      '  (PL.PLNCODIGO||'#39'/'#39'||PL.PLNPLANIL) AS PLNPLANIL,'
      '  PL.PLNDATDIA,'
      '  TC.TCEDESCRICAO,'
      '  H.HMETIPOMOV AS TIPOMOV,'
      '  IC.ITCSEQCALCULO,'
      
        '  DECODE(C.FLGFORMAPAG, '#39'F'#39', '#39'Folha de Pagamento'#39', '#39'Banco'#39') AS F' +
        'LGFORMAPAG,'
      '  '#39'Suspensa'#39' AS SUSPENSAO,'
      '  DECODE(H.HMETIPOMOV,'
      '      0, '#39'Concessão/Renovação'#39','
      '      1, '#39'Prestação '#39','
      '      2, '#39'Amortização/Refinanciamento'#39','
      '      3, '#39'Quitação'#39','
      '      4, '#39'Atualização de Débito'#39','
      '      5, '#39'Atualização de Saldo (Diária)'#39' ,'
      '      6, '#39'Importação/Migração'#39','
      '      7, '#39'Ajustes (Cobrança/Devolução)'#39','
      '      8, '#39'Ajustes (Saldo Devedor)'#39
      '     ) AS EVENTO,'
      
        '  TO_CHAR(H.HMEMESCOMPETENCIA, 00) ||'#39'/'#39'|| TO_CHAR(H.HMEANOCOMPE' +
        'TENCIA,0000) AS ANOMESCOMP,'
      
        '  TO_CHAR(H.HMEMESCOBRANCA, 00)    ||'#39'/'#39'|| TO_CHAR(H.HMEANOCOBRA' +
        'NCA,0000)    AS ANOMESCOBR'
      'FROM'
      '  PESSOA           P,'
      '  PLANILHA         PL,'
      '  HISTMOVEMPTMO    H,'
      '  CONTRATOEMPTMO   C,'
      '  ITEMXTIPOCONTR   IC,'
      '  TIPOCONTREMPTMO  TC,'
      '  ITEMEMPTMO       I'
      'WHERE'
      '       (LTRIM(RTRIM(TO_CHAR(H.HMEANOCOMPETENCIA, 0000)))) ||  +'
      
        '       (LTRIM(RTRIM(TO_CHAR(H.HMEMESCOMPETENCIA, 00)))) >= '#39'2002' +
        '01'#39
      ''
      '   AND (LTRIM(RTRIM(TO_CHAR(H.HMEANOCOMPETENCIA, 0000)))) ||  +'
      
        '       (LTRIM(RTRIM(TO_CHAR(H.HMEMESCOMPETENCIA, 00)))) <= '#39'2002' +
        '01'#39
      ''
      '   AND c.idcontratoemptmo  > 2002000'
      '   AND ((H.FLGESTORNADO IS NULL) OR (H.FLGESTORNADO = 0))'
      '   AND C.IDBENEF           = P.IDPESSOA'
      '   AND C.IDCONTRATOEMPTMO  = H.IDCONTRATOEMPTMO'
      '   AND C.IDTIPOCONTREMPTMO = IC.IDTIPOCONTREMPTMO'
      '   AND I.IDITEMEMPTMO      = IC.IDITEMEMPTMO'
      '   AND H.IDITEMEMPTMO      = IC.IDITEMEMPTMO'
      '   AND H.PLNCODIGO         = PL.PLNCODIGO(+)'
      '   AND C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO'
      '   AND ( (H.HMECENTRALIZA = 1) OR (H.HMEDESTACADO = 1) )'
      '   AND ( IC.ITCTRATASALDODEV <> 0 )'
      '   AND (C.IDCONTRATOEMPTMO  = -1 )'
      '   AND (C.IDPATRO           IN ( 1) )'
      '   AND (C.IDPLANOPREV       IN ( 1 ) )'
      '   AND (C.IDTIPOCONTREMPTMO = 1 )'
      '   AND (C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO)'
      '   AND (TC.IDTIPOEMPTMO     = 1)'
      '   and 1 = 2'
      'ORDER BY'
      '   H.HMEANOCOMPETENCIA, H.HMEMESCOMPETENCIA,'
      
        '   H.HMETIPOMOV, H.HMEPARCELA, H.HMESEQCOBRANCA, IC.ITCSEQCALCUL' +
        'O')
    ValidateWithMask = True
    Left = 184
    Top = 40
    object DateTimeField1: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object FloatField1: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object FloatField2: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object FloatField3: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object StringField1: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object StringField2: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object FloatField4: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object FloatField5: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object FloatField6: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object FloatField7: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object FloatField8: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object FloatField9: TFloatField
      FieldName = 'ANOCOMP'
    end
    object FloatField10: TFloatField
      FieldName = 'MESCOMP'
    end
    object FloatField11: TFloatField
      FieldName = 'ANOCOBR'
    end
    object FloatField12: TFloatField
      FieldName = 'MESCOBR'
    end
    object FloatField13: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object FloatField14: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object FloatField15: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object StringField3: TStringField
      FieldName = 'PLNPLANIL'
      Size = 81
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'PLNDATDIA'
    end
    object StringField4: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object FloatField16: TFloatField
      FieldName = 'TIPOMOV'
    end
    object FloatField17: TFloatField
      FieldName = 'ITCSEQCALCULO'
    end
    object StringField5: TStringField
      FieldName = 'FLGFORMAPAG'
      Size = 18
    end
    object StringField6: TStringField
      FieldName = 'EVENTO'
      Size = 18
    end
    object StringField7: TStringField
      FieldName = 'ANOMESCOMP'
      Size = 5
    end
    object StringField8: TStringField
      FieldName = 'ANOMESCOBR'
      Size = 5
    end
    object StringField9: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 13
    end
    object FloatField18: TFloatField
      FieldName = 'HMEPARCELAALT'
    end
    object StringField10: TStringField
      FieldName = 'SUSPENSAO'
      FixedChar = True
      Size = 8
    end
  end
  object qryValorAberto: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT'
      '   COUNT(HME.IDITEMEMPTMO) AS QUANT_ABERTO,'
      '   SUM(NVL(HME.VLRPREVISTO, 0)) AS VALOR_TOTAL_ABERTO'
      'FROM HMEALL HME'
      
        'INNER JOIN CONTRATOEMPTMO CON ON CON.IDCONTRATOEMPTMO = HME.IDCO' +
        'NTRATOEMPTMO'
      
        'LEFT JOIN TIPOSUSPEMPTMO TSE ON HME.IDTIPOSUSPEMPTMO = TSE.IDTIP' +
        'OSUSPEMPTMO'
      'WHERE HME.IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO'
      '      AND HME.FLGBAIXADO = 0'
      '      AND HME.VLREFETIVO IS NULL'
      '      AND HME.DATAEFETIVA IS NULL'
      '      AND HME.TIPOMOV IN (1, 2, 3, 4, 6, 7)'
      '      AND HME.NATUREZAITEM IN (1, 2)'
      '      AND HME.FLGQUITABONOESTORNO = 0'
      '      AND TO_CHAR(HME.DATAPREVISTA, '#39'YYYYMM'#39') >= :DATAINICIO'
      '      AND TO_CHAR(HME.DATAPREVISTA, '#39'YYYYMM'#39') >= :DATAFIM'
      
        '      AND ((:PINIBESUSP IS NULL) OR (:PINIBESUSP  = 1 AND (hme.i' +
        'dtiposuspemptmo is null OR TSE.flgemaberto = 1)))'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 248
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DATAINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PINIBESUSP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PINIBESUSP'
        ParamType = ptUnknown
      end>
  end
  object wwDataSource1: TwwDataSource
    DataSet = qryValorAberto
    Left = 336
    Top = 16
  end
  object ppBDEPipeline1: TppBDEPipeline
    DataSource = wwDataSource1
    UserName = 'BDEPipeline1'
    Left = 296
    Top = 72
  end
end
