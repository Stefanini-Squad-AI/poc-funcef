inherited dtmRelTIRPorProjeto: TdtmRelTIRPorProjeto
  Left = 342
  Top = 293
  Width = 266
  Height = 150
  Caption = 'dtmRelTIRPorProjeto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 21
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
    Left = 23
    Top = 8
  end
  inherited qryExemplo: TwwQuery
    Left = 26
    Top = 8
  end
  inherited rpExemplo: TppReport
    Left = 26
    Top = 8
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 96
    Top = 8
    object cdsIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsIMONOME: TStringField
      FieldName = 'IMONOME'
      Size = 60
    end
    object cdsMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 6
    end
    object cdsTAXACOMPRA: TFloatField
      FieldName = 'TAXACOMPRA'
    end
    object cdsDATAAQUISICAO: TDateTimeField
      FieldName = 'DATAAQUISICAO'
    end
    object cdsINDTIR1: TStringField
      FieldName = 'INDTIR1'
      Size = 10
    end
    object cdsINDTIR2: TStringField
      FieldName = 'INDTIR2'
      Size = 10
    end
    object cdsTXTIR1: TFloatField
      FieldName = 'TXTIR1'
    end
    object cdsTXTIR2: TFloatField
      FieldName = 'TXTIR2'
    end
    object cdsPERCVPL1: TStringField
      FieldName = 'PERCVPL1'
      Size = 10
    end
    object cdsPERCVPL2: TStringField
      FieldName = 'PERCVPL2'
      Size = 10
    end
    object cdsPERCVPL3: TStringField
      FieldName = 'PERCVPL3'
      Size = 10
    end
    object cdsVPL1: TFloatField
      FieldName = 'VPL1'
    end
    object cdsVPL2: TFloatField
      FieldName = 'VPL2'
    end
    object cdsVPL3: TFloatField
      FieldName = 'VPL3'
    end
    object cdsPAYBACK: TFloatField
      FieldName = 'PAYBACK'
    end
  end
  object dts: TDataSource
    DataSet = cds
    Left = 136
    Top = 8
  end
  object ppppln: TppDBPipeline
    DataSource = dts
    UserName = 'ppln'
    Left = 176
    Top = 8
    object pppplnppField1: TppField
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pppplnppField2: TppField
      FieldAlias = 'IMONOME'
      FieldName = 'IMONOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pppplnppField3: TppField
      FieldAlias = 'MOESIGLA'
      FieldName = 'MOESIGLA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pppplnppField4: TppField
      FieldAlias = 'TAXACOMPRA'
      FieldName = 'TAXACOMPRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pppplnppField5: TppField
      FieldAlias = 'DATAAQUISICAO'
      FieldName = 'DATAAQUISICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pppplnppField6: TppField
      FieldAlias = 'INDTIR1'
      FieldName = 'INDTIR1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pppplnppField7: TppField
      FieldAlias = 'INDTIR2'
      FieldName = 'INDTIR2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pppplnppField8: TppField
      FieldAlias = 'TXTIR1'
      FieldName = 'TXTIR1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pppplnppField9: TppField
      FieldAlias = 'TXTIR2'
      FieldName = 'TXTIR2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pppplnppField10: TppField
      FieldAlias = 'PERCVPL1'
      FieldName = 'PERCVPL1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pppplnppField11: TppField
      FieldAlias = 'PERCVPL2'
      FieldName = 'PERCVPL2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pppplnppField12: TppField
      FieldAlias = 'PERCVPL3'
      FieldName = 'PERCVPL3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pppplnppField13: TppField
      FieldAlias = 'VPL1'
      FieldName = 'VPL1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pppplnppField14: TppField
      FieldAlias = 'VPL2'
      FieldName = 'VPL2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pppplnppField15: TppField
      FieldAlias = 'VPL3'
      FieldName = 'VPL3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pppplnppField16: TppField
      FieldAlias = 'PAYBACK'
      FieldName = 'PAYBACK'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
  end
  object pprpt: TppReport
    AutoStop = False
    DataPipeline = ppppln
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'TIR por Projeto'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    AllowPrintToFile = True
    BeforePrint = pprptBeforePrint
    DeviceType = 'Screen'
    Left = 216
    Top = 8
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 51329
      mmPrintPosition = 0
      object ppLogoTipo: TppImage
        UserName = 'ppLogoTipo'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 529
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
      object pplblEmpresa: TppLabel
        UserName = 'LblEmpresa1'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 265
        mmTop = 1852
        mmWidth = 283369
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'TIR por Projeto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 264
        mmTop = 8996
        mmWidth = 283105
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 1588
        mmTop = 18521
        mmWidth = 281517
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'ppLogoTipo1'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 529
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
      object rgParam: TppRegion
        UserName = 'rgParam'
        Pen.Style = psClear
        Pen.Width = 0
        mmHeight = 15346
        mmLeft = 794
        mmTop = 20638
        mmWidth = 283369
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel19: TppLabel
          UserName = 'lblImovelMestre2'
          AutoSize = False
          Caption = 'Competência Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 105569
          mmTop = 23019
          mmWidth = 28310
          BandType = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          AutoSize = False
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 134144
          mmTop = 23019
          mmWidth = 1852
          BandType = 0
        end
        object pplblCompetencia: TppLabel
          UserName = 'Label16'
          AutoSize = False
          Caption = 'pplblCompetencia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 136525
          mmTop = 23019
          mmWidth = 51329
          BandType = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          AutoSize = False
          Caption = 'Segmento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 2646
          mmTop = 22755
          mmWidth = 16404
          BandType = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label201'
          AutoSize = False
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 19844
          mmTop = 22755
          mmWidth = 1852
          BandType = 0
        end
        object pplblTipoSegmento: TppLabel
          UserName = 'lblTipoSegmento'
          AutoSize = False
          Caption = 'pplblTipoSegmento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 23284
          mmTop = 23020
          mmWidth = 78317
          BandType = 0
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          AutoSize = False
          Caption = '* Receitas apropriadas por regime de CAIXA no dia '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2646
          mmTop = 29898
          mmWidth = 77523
          BandType = 0
        end
        object pplblDia: TppLabel
          UserName = 'lblDia'
          AutoSize = False
          Caption = 'lblDia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 80433
          mmTop = 29898
          mmWidth = 4233
          BandType = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'de cada mês.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3704
          mmLeft = 84931
          mmTop = 29898
          mmWidth = 78317
          BandType = 0
        end
      end
      object pplblIndicePayBack: TppLabel
        UserName = 'pplblIndicePayBack'
        AutoSize = False
        Caption = 'pplblIndicePayBack'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 266436
        mmTop = 46302
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3969
        mmLeft = 59002
        mmTop = 46038
        mmWidth = 20373
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 8731
        mmTop = 50271
        mmWidth = 275167
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Empreendimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 3969
        mmLeft = 8731
        mmTop = 46038
        mmWidth = 44450
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Índice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 80963
        mmTop = 46038
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label102'
        AutoSize = False
        Caption = 'Taxa (%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 103188
        mmTop = 46038
        mmWidth = 20373
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 1323
        mmLeft = 59002
        mmTop = 44186
        mmWidth = 64558
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Pen.Color = clWhite
        mmHeight = 529
        mmLeft = 59002
        mmTop = 45244
        mmWidth = 64558
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Dados da Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 59002
        mmTop = 40481
        mmWidth = 64558
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 1323
        mmLeft = 129646
        mmTop = 44186
        mmWidth = 47625
        BandType = 0
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Pen.Color = clWhite
        mmHeight = 529
        mmLeft = 129646
        mmTop = 45244
        mmWidth = 47625
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'TIR Realizada (% a.a.)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 129646
        mmTop = 40481
        mmWidth = 47625
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'INDTIR1'
        DataPipeline = ppppln
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 129646
        mmTop = 46302
        mmWidth = 22754
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'INDTIR2'
        DataPipeline = ppppln
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 154517
        mmTop = 46302
        mmWidth = 22754
        BandType = 0
      end
      object ppShapeVPL: TppShape
        UserName = 'ShapeVPL'
        mmHeight = 1323
        mmLeft = 183357
        mmTop = 44186
        mmWidth = 72761
        BandType = 0
      end
      object ppLbl_VPL: TppShape
        UserName = 'Lbl_VPL'
        Pen.Color = clWhite
        mmHeight = 529
        mmLeft = 183357
        mmTop = 45244
        mmWidth = 72761
        BandType = 0
      end
      object ppLblVPL: TppLabel
        UserName = 'LblVPL'
        AutoSize = False
        Caption = 'VPL (a.a.)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 183357
        mmTop = 40481
        mmWidth = 72761
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'PERCVPL1'
        DataPipeline = ppppln
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 183357
        mmTop = 46302
        mmWidth = 22754
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'PERCVPL2'
        DataPipeline = ppppln
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 208227
        mmTop = 46302
        mmWidth = 22754
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText101'
        DataField = 'PERCVPL3'
        DataPipeline = ppppln
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 233363
        mmTop = 46302
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Pay Back'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Albertus (W1)'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 261144
        mmTop = 40481
        mmWidth = 22754
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object ppsCor: TppShape
        OnPrint = ppsCorPrint
        UserName = 'sCor'
        Brush.Color = clLime
        Pen.Style = psClear
        StretchWithParent = True
        mmHeight = 4763
        mmLeft = 8731
        mmTop = 0
        mmWidth = 275167
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DATAAQUISICAO'
        DataPipeline = ppppln
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 58738
        mmTop = 0
        mmWidth = 20373
        BandType = 4
      end
      object ppDbNome: TppDBText
        UserName = 'DbNome'
        DataField = 'IMONOME'
        DataPipeline = ppppln
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 8731
        mmTop = 0
        mmWidth = 44450
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MOESIGLA'
        DataPipeline = ppppln
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 80963
        mmTop = 0
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'TAXACOMPRA'
        DataPipeline = ppppln
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 103188
        mmTop = 0
        mmWidth = 20373
        BandType = 4
      end
      object ppdbTXTIR1: TppDBText
        UserName = 'dbTXTIR1'
        DataField = 'TXTIR1'
        DataPipeline = ppppln
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 129382
        mmTop = 0
        mmWidth = 22860
        BandType = 4
      end
      object ppdbTXTIR2: TppDBText
        UserName = 'dbTXTIR2'
        DataField = 'TXTIR2'
        DataPipeline = ppppln
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 154517
        mmTop = 0
        mmWidth = 22860
        BandType = 4
      end
      object ppdbVPL1: TppDBText
        UserName = 'dbVPL1'
        DataField = 'VPL1'
        DataPipeline = ppppln
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 183092
        mmTop = 0
        mmWidth = 22860
        BandType = 4
      end
      object ppdbVPL2: TppDBText
        UserName = 'dbVPL2'
        DataField = 'VPL2'
        DataPipeline = ppppln
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 208227
        mmTop = 0
        mmWidth = 22860
        BandType = 4
      end
      object ppdbVPL3: TppDBText
        UserName = 'dbVPL3'
        DataField = 'VPL3'
        DataPipeline = ppppln
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 233363
        mmTop = 0
        mmWidth = 22860
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'PAYBACK'
        DataPipeline = ppppln
        DisplayFormat = '#,##0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 261144
        mmTop = 0
        mmWidth = 22860
        BandType = 4
      end
      object rptFluxo: TppSubReport
        OnPrint = rptFluxoPrint
        UserName = 'rptFluxo'
        DrillDownComponent = ppDbNome
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 4233
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplFluxo
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'TIR por Projeto'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Left = 120
          Top = 56
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 12435
            mmPrintPosition = 0
            object ppLine6: TppLine
              UserName = 'Line6'
              Weight = 0.75
              mmHeight = 1852
              mmLeft = 59796
              mmTop = 5027
              mmWidth = 57944
              BandType = 1
            end
            object ppLabel11: TppLabel
              UserName = 'Label1'
              Caption = 'Ano/Mes'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 15081
              mmTop = 7673
              mmWidth = 11642
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = 'Valor Nominal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 37042
              mmTop = 7673
              mmWidth = 19050
              BandType = 1
            end
            object ppLabel13: TppLabel
              UserName = 'Label13'
              Caption = 'Nr. Indice'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 71173
              mmTop = 7673
              mmWidth = 12965
              BandType = 1
            end
            object ppLabel15: TppLabel
              UserName = 'Label15'
              Caption = 'Valor Corrigido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 97367
              mmTop = 7673
              mmWidth = 20638
              BandType = 1
            end
            object ppLine4: TppLine
              UserName = 'Line4'
              ParentWidth = True
              StretchWithParent = True
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 0
              mmTop = 11377
              mmWidth = 284300
              BandType = 1
            end
            object ppLabel16: TppLabel
              UserName = 'Label2'
              Caption = '  Fluxo 1  '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              mmHeight = 3440
              mmLeft = 82550
              mmTop = 3440
              mmWidth = 13229
              BandType = 1
            end
            object ppLine7: TppLine
              UserName = 'Line7'
              Weight = 0.75
              mmHeight = 1852
              mmLeft = 119327
              mmTop = 5027
              mmWidth = 57944
              BandType = 1
            end
            object ppLabel17: TppLabel
              UserName = 'Label17'
              Caption = '  Fluxo 2  '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              mmHeight = 3440
              mmLeft = 142082
              mmTop = 3440
              mmWidth = 13229
              BandType = 1
            end
            object ppLabel18: TppLabel
              UserName = 'Label18'
              Caption = 'Nr. Indice'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 131234
              mmTop = 7673
              mmWidth = 12965
              BandType = 1
            end
            object ppLabel23: TppLabel
              UserName = 'Label23'
              Caption = 'Valor Corrigido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 157427
              mmTop = 7673
              mmWidth = 20638
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'Fluxo de Calculo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 0
              mmWidth = 28046
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppShape5: TppShape
              OnPrint = ppsCorPrint
              UserName = 'sCor1'
              Brush.Color = clLime
              ParentHeight = True
              Pen.Style = psClear
              StretchWithParent = True
              mmHeight = 3969
              mmLeft = 9525
              mmTop = 0
              mmWidth = 275167
              BandType = 4
            end
            object ppDBText1: TppDBText
              UserName = 'DBText1'
              DataField = 'ANOMES'
              DataPipeline = pplFluxo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 9525
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              DataField = 'VLR_NOMINAL'
              DataPipeline = pplFluxo
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 29369
              mmTop = 0
              mmWidth = 26723
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'VLR_COTA_1'
              DataPipeline = pplFluxo
              DisplayFormat = '#,0.00000000;-#,0.00000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 59002
              mmTop = 0
              mmWidth = 25135
              BandType = 4
            end
            object ppDBText11: TppDBText
              UserName = 'DBText11'
              DataField = 'VLR_TIR_1'
              DataPipeline = pplFluxo
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 85461
              mmTop = 0
              mmWidth = 32544
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              DataField = 'VLR_COTA_2'
              DataPipeline = pplFluxo
              DisplayFormat = '#,0.00000000;-#,0.00000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 119063
              mmTop = 0
              mmWidth = 25135
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              DataField = 'VLR_TIR_2'
              DataPipeline = pplFluxo
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 145521
              mmTop = 0
              mmWidth = 32544
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppLine5: TppLine
              UserName = 'Line5'
              Pen.Width = 2
              ParentWidth = True
              StretchWithParent = True
              Weight = 1.5
              mmHeight = 1058
              mmLeft = 0
              mmTop = 2381
              mmWidth = 284300
              BandType = 7
            end
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object pplblSistema: TppLabel
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
        mmTop = 1058
        mmWidth = 90488
        BandType = 8
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 2646
        mmLeft = 265
        mmTop = 265
        mmWidth = 283634
        BandType = 8
      end
      object ppOrcamentoSystemVariable8: TppSystemVariable
        UserName = 'OrcamentoSystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 252413
        mmTop = 1058
        mmWidth = 31485
        BandType = 8
      end
      object ppOrcamentoSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 1058
        mmWidth = 283898
        BandType = 8
      end
    end
  end
  object cdsFluxo: TCMClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'IDIMOVEL;ANOMES'
    Params = <>
    Left = 79
    Top = 69
    Data = {
      C90000009619E0BD010000001800000007000000000003000000C90008494449
      4D4F56454C080004000000000006414E4F4D4553010049000000020007535542
      54595045020049000A0046697865644368617200055749445448020002000A00
      0B564C525F4E4F4D494E414C08000400000000000A564C525F434F54415F3108
      0004000000000009564C525F5449525F3108000400000000000A564C525F434F
      54415F32080004000000000009564C525F5449525F3208000400000000000100
      044C4349440400010009080000}
  end
  object dsFluxo: TDataSource
    DataSet = cdsFluxo
    Left = 136
    Top = 72
  end
  object sqlFluxo: TCMSqlParams
    SQL.Strings = (
      'SELECT IDIMOVEL,'
      '       '#39'          '#39' AS ANOMES,'
      '       0 AS VLR_NOMINAL,'
      '       0 AS VLR_COTA_1,'
      '       0 AS VLR_TIR_1,'
      '       0 AS VLR_COTA_2,'
      '       0 AS VLR_TIR_2'
      '  FROM IMOVEL'
      'WHERE IDIMOVEL = -3 '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsFluxo
    Left = 24
    Top = 72
  end
  object pplFluxo: TppDBPipeline
    DataSource = dsFluxo
    UserName = 'pplFluxo'
    Left = 200
    Top = 72
    object pplFluxoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplFluxoppField2: TppField
      FieldAlias = 'ANOMES'
      FieldName = 'ANOMES'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object pplFluxoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_NOMINAL'
      FieldName = 'VLR_NOMINAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplFluxoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_COTA_1'
      FieldName = 'VLR_COTA_1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplFluxoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_TIR_1'
      FieldName = 'VLR_TIR_1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplFluxoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_COTA_2'
      FieldName = 'VLR_COTA_2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplFluxoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_TIR_2'
      FieldName = 'VLR_TIR_2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
end
