inherited dtmRelItensGeradosTipoContr: TdtmRelItensGeradosTipoContr
  Left = 362
  Top = 248
  Width = 259
  Height = 157
  Caption = 'dtmRelItensGeradosTipoContr'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 24
    Top = 80
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
    Top = 56
  end
  inherited rpExemplo: TppReport
    Left = 24
    Top = 8
  end
  object pplItensGeradosTipoContr: TppBDEPipeline
    DataSource = dtsItensGeradosTipoContr
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'pplItensGeradosTipoContr'
    Left = 128
    Top = 80
    object pplItensGeradosTipoContrppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOCONTREMPTMO'
      FieldName = 'IDTIPOCONTREMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplItensGeradosTipoContrppField2: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplItensGeradosTipoContrppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'EVENTO'
      FieldName = 'EVENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplItensGeradosTipoContrppField4: TppField
      FieldAlias = 'DESC_EVENTO'
      FieldName = 'DESC_EVENTO'
      FieldLength = 27
      DisplayWidth = 27
      Position = 3
    end
    object pplItensGeradosTipoContrppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDITEMEMPTMO'
      FieldName = 'IDITEMEMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplItensGeradosTipoContrppField6: TppField
      FieldAlias = 'ITEDESCRICAO'
      FieldName = 'ITEDESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object pplItensGeradosTipoContrppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_AGRUPADO'
      FieldName = 'VALOR_AGRUPADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplItensGeradosTipoContrppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_CENTRALIZA'
      FieldName = 'VALOR_CENTRALIZA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplItensGeradosTipoContrppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_AGRUPADO_CONTAB'
      FieldName = 'VALOR_AGRUPADO_CONTAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplItensGeradosTipoContrppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_EFETIVO'
      FieldName = 'VALOR_EFETIVO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplItensGeradosTipoContrppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_ABONADO'
      FieldName = 'VALOR_ABONADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplItensGeradosTipoContrppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_ABONADO_CONTAB'
      FieldName = 'VALOR_ABONADO_CONTAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplItensGeradosTipoContrppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'ABONO_CONTAB'
      FieldName = 'ABONO_CONTAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplItensGeradosTipoContrppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_ESTORNADO_CONTAB'
      FieldName = 'VALOR_ESTORNADO_CONTAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplItensGeradosTipoContrppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'ESTORNO_CONTAB'
      FieldName = 'ESTORNO_CONTAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
  end
  object dtsItensGeradosTipoContr: TwwDataSource
    DataSet = qryItensGeradosTipoContr
    Left = 128
    Top = 68
  end
  object qryItensGeradosTipoContr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   15 AS IDTIPOCONTREMPTMO,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS TCEDESCRICAO,'
      ''
      '   10 AS EVENTO,'
      '   '#39'Amortização/Refinanciamento'#39' AS DESC_EVENTO,'
      ''
      '   999 AS IDITEMEMPTMO,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS ITEDESCRICAO,'
      ''
      '   10000000 AS VALOR_AGRUPADO,'
      '   10000000 AS VALOR_CENTRALIZA,'
      '   10000000 AS VALOR_AGRUPADO_CONTAB,'
      '   10000000 AS VALOR_EFETIVO,'
      '   10000000 AS VALOR_ABONADO,'
      '   10000000 AS VALOR_ABONADO_CONTAB,'
      '   10000000 AS ABONO_CONTAB,'
      '   10000000 AS VALOR_ESTORNADO_CONTAB,'
      '   10000000 AS ESTORNO_CONTAB'
      ''
      'FROM'
      '   DUAL'
      ''
      'WHERE'
      '   1 = 1')
    ValidateWithMask = True
    Left = 128
    Top = 56
    object qryItensGeradosTipoContrIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryItensGeradosTipoContrTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      FixedChar = True
      Size = 60
    end
    object qryItensGeradosTipoContrEVENTO: TFloatField
      FieldName = 'EVENTO'
    end
    object qryItensGeradosTipoContrDESC_EVENTO: TStringField
      FieldName = 'DESC_EVENTO'
      FixedChar = True
      Size = 27
    end
    object qryItensGeradosTipoContrIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryItensGeradosTipoContrITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      FixedChar = True
      Size = 60
    end
    object qryItensGeradosTipoContrVALOR_AGRUPADO: TFloatField
      FieldName = 'VALOR_AGRUPADO'
    end
    object qryItensGeradosTipoContrVALOR_CENTRALIZA: TFloatField
      FieldName = 'VALOR_CENTRALIZA'
    end
    object qryItensGeradosTipoContrVALOR_AGRUPADO_CONTAB: TFloatField
      FieldName = 'VALOR_AGRUPADO_CONTAB'
    end
    object qryItensGeradosTipoContrVALOR_EFETIVO: TFloatField
      FieldName = 'VALOR_EFETIVO'
    end
    object qryItensGeradosTipoContrVALOR_ABONADO: TFloatField
      FieldName = 'VALOR_ABONADO'
    end
    object qryItensGeradosTipoContrVALOR_ABONADO_CONTAB: TFloatField
      FieldName = 'VALOR_ABONADO_CONTAB'
    end
    object qryItensGeradosTipoContrABONO_CONTAB: TFloatField
      FieldName = 'ABONO_CONTAB'
    end
    object qryItensGeradosTipoContrVALOR_ESTORNADO_CONTAB: TFloatField
      FieldName = 'VALOR_ESTORNADO_CONTAB'
    end
    object qryItensGeradosTipoContrESTORNO_CONTAB: TFloatField
      FieldName = 'ESTORNO_CONTAB'
    end
  end
  object rptItensGeradosTipoContr: TppReport
    AutoStop = False
    DataPipeline = pplItensGeradosTipoContr
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'EP - Relatório de Itens Gerados (Analítico)'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13229
    PrinterSetup.mmMarginLeft = 6615
    PrinterSetup.mmMarginRight = 6615
    PrinterSetup.mmMarginTop = 13229
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 128
    Top = 8
    Version = '5.5'
    mmColumnWidth = 283770
    object ppHeaderBand2: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 47625
      mmPrintPosition = 0
      object memPlano: TppRichText
        UserName = 'memPlano'
        Caption = 'memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todos >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 178859
        mmTop = 35719
        mmWidth = 105040
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Itens Gerados por Dia (Sintético)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 48154
        mmTop = 8731
        mmWidth = 187325
        BandType = 0
      end
      object ppLabel15: TppLabel
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
        mmLeft = 48154
        mmTop = 1588
        mmWidth = 187325
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label4'
        Caption = 'Período:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 12171
        mmTop = 19844
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label26'
        Caption = 'Evento:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 13494
        mmTop = 24342
        mmWidth = 12700
        BandType = 0
      end
      object rptItensGeradosTipoContr_lblPeriodo: TppLabel
        UserName = 'Label2'
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 25929
        mmTop = 19844
        mmWidth = 794
        BandType = 0
      end
      object rptItensGeradosTipoContr_lblEvento: TppLabel
        UserName = 'rptItensGeradosTipoContr_lblEvento'
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 25929
        mmTop = 24342
        mmWidth = 794
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label3'
        Caption = 'Competência:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 244211
        mmTop = 19844
        mmWidth = 21167
        BandType = 0
      end
      object rptItensGeradosTipoContr_lblCompetencia: TppLabel
        UserName = 'Label13'
        Caption = 'janeiro / 2003'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 265113
        mmTop = 19844
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Patrocinadoras:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 35719
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Caption = 'Planos:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 166423
        mmTop = 35719
        mmWidth = 12700
        BandType = 0
      end
      object ppMemo2: TppMemo
        UserName = 'Memo2'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 43127
        mmWidth = 283898
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memPatro: TppRichText
        UserName = 'memPatro'
        Caption = 'memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todas >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 25929
        mmTop = 35719
        mmWidth = 105040
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ShiftRelativeTo = memPlano
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 43127
        mmWidth = 283898
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        AutoSize = False
        Caption = 'Tipo Empréstimo:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 30956
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        Caption = 'Tipo Contrato:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 157163
        mmTop = 30956
        mmWidth = 21960
        BandType = 0
      end
      object lblTipoEmptmo: TppLabel
        UserName = 'lblTipoEmptmo'
        AutoSize = False
        Caption = ' < todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 28310
        mmTop = 30956
        mmWidth = 102659
        BandType = 0
      end
      object lblTipoContr: TppLabel
        UserName = 'lblTipoContr'
        AutoSize = False
        Caption = ' < todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 178859
        mmTop = 30956
        mmWidth = 105040
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppShape5: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Color = clNone
        Pen.Style = psClear
        mmHeight = 5292
        mmLeft = 0
        mmTop = 0
        mmWidth = 283770
        BandType = 4
      end
      object ppLine5: TppLine
        OnPrint = ppLine4Print
        UserName = 'Line4'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 5292
        mmLeft = 0
        mmTop = 0
        mmWidth = 283770
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText6'
        BlankWhenZero = True
        DataField = 'VALOR_AGRUPADO'
        DataPipeline = pplItensGeradosTipoContr
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 101865
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText7'
        DataField = 'IDITEMEMPTMO'
        DataPipeline = pplItensGeradosTipoContr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 1058
        mmWidth = 6879
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText9'
        DataField = 'ITEDESCRICAO'
        DataPipeline = pplItensGeradosTipoContr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 9790
        mmTop = 1058
        mmWidth = 84667
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText5'
        BlankWhenZero = True
        DataField = 'VALOR_CENTRALIZA'
        DataPipeline = pplItensGeradosTipoContr
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 143140
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText3'
        BlankWhenZero = True
        DataField = 'VALOR_EFETIVO'
        DataPipeline = pplItensGeradosTipoContr
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 163248
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText10'
        BlankWhenZero = True
        DataField = 'VALOR_ESTORNADO_CONTAB'
        DataPipeline = pplItensGeradosTipoContr
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 245798
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText8'
        BlankWhenZero = True
        DataField = 'VALOR_AGRUPADO_CONTAB'
        DataPipeline = pplItensGeradosTipoContr
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 121973
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText102'
        BlankWhenZero = True
        DataField = 'VALOR_ABONADO_CONTAB'
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 205052
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText12'
        BlankWhenZero = True
        DataField = 'ABONO_CONTAB'
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 225161
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText13'
        BlankWhenZero = True
        DataField = 'ESTORNO_CONTAB'
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 265907
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText4'
        BlankWhenZero = True
        DataField = 'VALOR_ABONADO'
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 184944
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1588
        mmLeft = 0
        mmTop = 794
        mmWidth = 283770
        BandType = 8
      end
      object ppLabel19: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 2117
        mmWidth = 23019
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
        mmLeft = 108215
        mmTop = 2117
        mmWidth = 67469
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
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
        mmLeft = 256911
        mmTop = 2117
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'TCEDESCRICAO'
      DataPipeline = pplItensGeradosTipoContr
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppShape6: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentHeight = True
          ParentWidth = True
          mmHeight = 7938
          mmLeft = 0
          mmTop = 0
          mmWidth = 283770
          BandType = 3
          GroupNo = 0
        end
        object ppDBText20: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'TCEDESCRICAO'
          DataPipeline = pplItensGeradosTipoContr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 255059
          mmTop = 1852
          mmWidth = 28046
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
      BreakName = 'EVENTO'
      DataPipeline = pplItensGeradosTipoContr
      KeepTogether = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'DESC_EVENTO'
      DataPipeline = pplItensGeradosTipoContr
      KeepTogether = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object ppShape7: TppShape
          OnPrint = ppShape2Print
          UserName = 'Shape2'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          mmHeight = 12171
          mmLeft = 0
          mmTop = 0
          mmWidth = 283770
          BandType = 3
          GroupNo = 2
        end
        object ppDBText21: TppDBText
          UserName = 'DBText1'
          DataField = 'DESC_EVENTO'
          DataPipeline = pplItensGeradosTipoContr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1058
          mmTop = 794
          mmWidth = 93134
          BandType = 3
          GroupNo = 2
        end
        object ppLabel21: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Item (código - descrição)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 1058
          mmTop = 8467
          mmWidth = 93134
          BandType = 3
          GroupNo = 2
        end
        object ppLabel24: TppLabel
          UserName = 'Label14'
          Caption = 'Valor Previsto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 122767
          mmTop = 5292
          mmWidth = 16404
          BandType = 3
          GroupNo = 2
        end
        object ppLabel27: TppLabel
          UserName = 'Label7'
          Caption = '(para Envio)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 146050
          mmTop = 8467
          mmWidth = 14288
          BandType = 3
          GroupNo = 2
        end
        object ppLabel28: TppLabel
          UserName = 'Label6'
          Caption = 'Contabilizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 123296
          mmTop = 8467
          mmWidth = 15875
          BandType = 3
          GroupNo = 2
        end
        object ppLabel29: TppLabel
          UserName = 'Label8'
          Caption = 'Valor Previsto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 143934
          mmTop = 5292
          mmWidth = 16404
          BandType = 3
          GroupNo = 2
        end
        object ppLabel30: TppLabel
          UserName = 'Label9'
          Caption = 'Estorno'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 273844
          mmTop = 5292
          mmWidth = 9260
          BandType = 3
          GroupNo = 2
        end
        object ppLabel31: TppLabel
          UserName = 'Label101'
          Caption = 'Efetivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 172244
          mmTop = 8467
          mmWidth = 8202
          BandType = 3
          GroupNo = 2
        end
        object ppLabel32: TppLabel
          UserName = 'Label12'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 174361
          mmTop = 5292
          mmWidth = 6085
          BandType = 3
          GroupNo = 2
        end
        object ppLabel33: TppLabel
          UserName = 'Label16'
          Caption = 'Contabilizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 267230
          mmTop = 8467
          mmWidth = 15875
          BandType = 3
          GroupNo = 2
        end
        object ppLabel34: TppLabel
          UserName = 'Label18'
          Caption = 'Valor Previsto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 102659
          mmTop = 5292
          mmWidth = 16404
          BandType = 3
          GroupNo = 2
        end
        object ppLabel35: TppLabel
          UserName = 'Label15'
          Caption = 'Abonado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 231775
          mmTop = 5292
          mmWidth = 10583
          BandType = 3
          GroupNo = 2
        end
        object ppLabel36: TppLabel
          UserName = 'Label19'
          Caption = 'Contabilizar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 208227
          mmTop = 8467
          mmWidth = 14023
          BandType = 3
          GroupNo = 2
        end
        object ppLabel37: TppLabel
          UserName = 'Label102'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 216165
          mmTop = 2117
          mmWidth = 6085
          BandType = 3
          GroupNo = 2
        end
        object ppLabel38: TppLabel
          UserName = 'Label29'
          Caption = 'Abonado a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 209815
          mmTop = 5292
          mmWidth = 12435
          BandType = 3
          GroupNo = 2
        end
        object ppLabel39: TppLabel
          UserName = 'Label103'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 236273
          mmTop = 2117
          mmWidth = 6085
          BandType = 3
          GroupNo = 2
        end
        object ppLabel40: TppLabel
          UserName = 'Label20'
          Caption = 'Contabilizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 226484
          mmTop = 8467
          mmWidth = 15875
          BandType = 3
          GroupNo = 2
        end
        object ppLabel41: TppLabel
          UserName = 'Label104'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 256911
          mmTop = 2117
          mmWidth = 6085
          BandType = 3
          GroupNo = 2
        end
        object ppLabel42: TppLabel
          UserName = 'Label32'
          Caption = 'Estornado a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 248973
          mmTop = 5292
          mmWidth = 14023
          BandType = 3
          GroupNo = 2
        end
        object ppLabel43: TppLabel
          UserName = 'Label33'
          Caption = 'Contabilizar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 248973
          mmTop = 8467
          mmWidth = 14023
          BandType = 3
          GroupNo = 2
        end
        object ppLabel44: TppLabel
          UserName = 'Label24'
          Caption = '(não estornado)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 100806
          mmTop = 8467
          mmWidth = 18256
          BandType = 3
          GroupNo = 2
        end
        object ppLabel45: TppLabel
          UserName = 'Label10'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 195527
          mmTop = 2117
          mmWidth = 6085
          BandType = 3
          GroupNo = 2
        end
        object ppLabel46: TppLabel
          UserName = 'Label17'
          Caption = 'Abonado não'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 186267
          mmTop = 5292
          mmWidth = 15610
          BandType = 3
          GroupNo = 2
        end
        object ppLabel47: TppLabel
          UserName = 'Label27'
          Caption = 'Apropriado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 188384
          mmTop = 8467
          mmWidth = 13229
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 14288
        mmPrintPosition = 0
        object ppLine7: TppLine
          UserName = 'Line1'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 14288
          mmLeft = 0
          mmTop = 0
          mmWidth = 283770
          BandType = 5
          GroupNo = 2
        end
        object ppShape8: TppShape
          UserName = 'Shape4'
          mmHeight = 5556
          mmLeft = 98954
          mmTop = 1588
          mmWidth = 185209
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VALOR_AGRUPADO_CONTAB'
          DataPipeline = pplItensGeradosTipoContr
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 121973
          mmTop = 2646
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VALOR_CENTRALIZA'
          DataPipeline = pplItensGeradosTipoContr
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 143140
          mmTop = 2646
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'ESTORNO_CONTAB'
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 265907
          mmTop = 2646
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'VALOR_AGRUPADO'
          DataPipeline = pplItensGeradosTipoContr
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 101865
          mmTop = 2646
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'VALOR_EFETIVO'
          DataPipeline = pplItensGeradosTipoContr
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 163248
          mmTop = 2646
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'VALOR_ESTORNADO_CONTAB'
          DataPipeline = pplItensGeradosTipoContr
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 245798
          mmTop = 2646
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'VALOR_ABONADO_CONTAB'
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 204523
          mmTop = 2646
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'ABONO_CONTAB'
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 224632
          mmTop = 2646
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALOR_ABONADO'
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 184415
          mmTop = 2646
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
end
