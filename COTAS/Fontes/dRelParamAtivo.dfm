inherited dtmRelParamAtivo: TdtmRelParamAtivo
  Left = 218
  Top = 134
  Width = 384
  Height = 334
  Caption = 'dtmRelParamAtivo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
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
  inherited qryExemplo: TwwQuery
    Active = True
  end
  inherited rpExemplo: TppReport
    inherited FooterBand1: TppFooterBand
      inherited Calc1: TppSystemVariable [2]
      end
      inherited Calc2: TppSystemVariable [3]
        mmLeft = 2646
      end
    end
  end
  object CdsParamAtivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 168
  end
  object pplParamAtivo: TppDBPipeline
    DataSource = dsParamAtivo
    UserName = 'lParamAtivo'
    Left = 136
    Top = 112
    object pplParamAtivoppField1: TppField
      FieldAlias = 'IDTIPOCUSTORECIMO'
      FieldName = 'IDTIPOCUSTORECIMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplParamAtivoppField2: TppField
      FieldAlias = 'RECCUSTO'
      FieldName = 'RECCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplParamAtivoppField3: TppField
      FieldAlias = 'IDMODULO'
      FieldName = 'IDMODULO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplParamAtivoppField4: TppField
      FieldAlias = 'DESCMODULO'
      FieldName = 'DESCMODULO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplParamAtivoppField5: TppField
      FieldAlias = 'DESCCUSTORECIMO'
      FieldName = 'DESCCUSTORECIMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplParamAtivoppField6: TppField
      FieldAlias = 'FLGMOVCOTA'
      FieldName = 'FLGMOVCOTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object rptParamAtivo: TppReport
    AutoStop = False
    DataPipeline = pplParamAtivo
    OnStartPage = rptParamAtivoStartPage
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Parâmetros de Ativos'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 136
    Top = 168
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppDbLogo: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplDadosEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel13: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa1'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 168540
        BandType = 0
      end
      object ppLabel12: TppLabel
        OnPrint = ppLabel12Print
        UserName = 'Label12'
        Caption = 'Título do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 7673
        mmWidth = 31221
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24342
        mmWidth = 197300
        BandType = 0
      end
      object ppLbDescAtivo: TppLabel
        UserName = 'Label1'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 20638
        mmWidth = 12700
        BandType = 0
      end
      object ppLbDescOperacao: TppLabel
        UserName = 'Label2'
        Caption = 'Tipo de Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 83079
        mmTop = 20638
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label3'
        Caption = 'Tipo Mov.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 183621
        mmTop = 20638
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label4'
        Caption = 'Oper.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 20638
        mmWidth = 7144
        BandType = 0
      end
      object ppLbAtivo: TppLabel
        UserName = 'Label5'
        Caption = 'Label5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 13229
        mmWidth = 10054
        BandType = 0
      end
      object ppLbDescItemEmptmo: TppLabel
        UserName = 'Label6'
        Caption = 'Label6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 138377
        mmTop = 20108
        mmWidth = 8467
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShpRelatorio: TppShape
        OnPrint = ppShpRelatorioPrint
        UserName = 'ShpRelatorio'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 265
        mmWidth = 197380
        BandType = 4
      end
      object ppDbAumDim: TppDBText
        UserName = 'DbAumDim'
        DataPipeline = pplParamAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 265
        mmWidth = 7408
        BandType = 4
      end
      object ppDbDescAtivo: TppDBText
        UserName = 'DbDescAtivo'
        DataPipeline = pplParamAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        SuppressRepeatedValues = True
        Transparent = True
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 265
        mmWidth = 65881
        BandType = 4
      end
      object ppDbDescOperacao: TppDBText
        UserName = 'DbDescOperacao'
        AutoSize = True
        DataPipeline = pplParamAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        SuppressRepeatedValues = True
        Transparent = True
        mmHeight = 3175
        mmLeft = 83079
        mmTop = 265
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'FLGMOVCOTA'
        DataPipeline = pplParamAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 188384
        mmTop = 265
        mmWidth = 3704
        BandType = 4
      end
      object ppLinhaSepar: TppLine
        UserName = 'LinhaSepar'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 2381
        mmWidth = 197300
        BandType = 4
      end
      object ppDbDescItemEmptmo: TppDBText
        UserName = 'DbDescItemEmptmo'
        DataPipeline = pplParamAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 138377
        mmTop = 265
        mmWidth = 44715
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
      object ppLabel1: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema1'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
    end
  end
  object pplDadosEmpresa: TppDBPipeline
    DataSource = dtmLookCotas.dsDadosFundacao
    UserName = 'lDadosEmpresa'
    Left = 288
    Top = 16
  end
  object dsParamAtivo: TwwDataSource
    DataSet = CdsParamAtivo
    Left = 40
    Top = 112
  end
end
