inherited dtmRelItensGeradosDiaPP: TdtmRelItensGeradosDiaPP
  Left = 249
  Top = 276
  Width = 215
  Height = 157
  Caption = 'dtmRelItensGeradosDiaPP'
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
    DataPipelineName = 'pplExemplo'
  end
  object pplItensGeradosDiaPP: TppBDEPipeline
    DataSource = dtsItensGeradosDiaPP
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'pplItensGeradosDiaPP'
    Left = 120
    Top = 80
    object pplItensGeradosDiaPPppField1: TppField
      FieldAlias = 'NOMEPLANO'
      FieldName = 'NOMEPLANO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplItensGeradosDiaPPppField2: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplItensGeradosDiaPPppField3: TppField
      FieldAlias = 'PLANO_PATRO'
      FieldName = 'PLANO_PATRO'
      FieldLength = 123
      DisplayWidth = 123
      Position = 2
    end
    object pplItensGeradosDiaPPppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'EVENTO'
      FieldName = 'EVENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplItensGeradosDiaPPppField5: TppField
      FieldAlias = 'DESC_EVENTO'
      FieldName = 'DESC_EVENTO'
      FieldLength = 27
      DisplayWidth = 27
      Position = 4
    end
    object pplItensGeradosDiaPPppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDITEMEMPTMO'
      FieldName = 'IDITEMEMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplItensGeradosDiaPPppField7: TppField
      FieldAlias = 'ITEDESCRICAO'
      FieldName = 'ITEDESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object pplItensGeradosDiaPPppField8: TppField
      FieldAlias = 'HMEDATAPREVISTA'
      FieldName = 'HMEDATAPREVISTA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object pplItensGeradosDiaPPppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_AGRUPADO'
      FieldName = 'VALOR_AGRUPADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplItensGeradosDiaPPppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_CENTRALIZA'
      FieldName = 'VALOR_CENTRALIZA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplItensGeradosDiaPPppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_AGRUPADO_CONTAB'
      FieldName = 'VALOR_AGRUPADO_CONTAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplItensGeradosDiaPPppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_EFETIVO'
      FieldName = 'VALOR_EFETIVO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplItensGeradosDiaPPppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_ABONADO'
      FieldName = 'VALOR_ABONADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplItensGeradosDiaPPppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_ABONADO_CONTAB'
      FieldName = 'VALOR_ABONADO_CONTAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplItensGeradosDiaPPppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'ABONO_CONTAB'
      FieldName = 'ABONO_CONTAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplItensGeradosDiaPPppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_ESTORNADO_CONTAB'
      FieldName = 'VALOR_ESTORNADO_CONTAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplItensGeradosDiaPPppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'ESTORNO_CONTAB'
      FieldName = 'ESTORNO_CONTAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
  end
  object dtsItensGeradosDiaPP: TwwDataSource
    DataSet = qryItensGeradosDiaPP
    Left = 120
    Top = 68
  end
  object qryItensGeradosDiaPP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS NOMEPLANO,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS NOMEPATRO,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        ' / 123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS PLANO_PATRO,'
      ''
      '   10 AS EVENTO,'
      '   '#39'Amortização/Refinanciamento'#39' AS DESC_EVENTO,'
      ''
      '   999 AS IDITEMEMPTMO,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS ITEDESCRICAO,'
      ''
      '   TO_DATE('#39'31/12/2005'#39', '#39'DD/MM/YYYY'#39') AS HMEDATAPREVISTA,'
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
      '   1 = 2')
    ValidateWithMask = True
    Left = 120
    Top = 56
    object qryItensGeradosDiaPPNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      FixedChar = True
      Size = 60
    end
    object qryItensGeradosDiaPPNOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      FixedChar = True
      Size = 60
    end
    object qryItensGeradosDiaPPPLANO_PATRO: TStringField
      FieldName = 'PLANO_PATRO'
      FixedChar = True
      Size = 123
    end
    object qryItensGeradosDiaPPEVENTO: TFloatField
      FieldName = 'EVENTO'
    end
    object qryItensGeradosDiaPPDESC_EVENTO: TStringField
      FieldName = 'DESC_EVENTO'
      FixedChar = True
      Size = 27
    end
    object qryItensGeradosDiaPPIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryItensGeradosDiaPPITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      FixedChar = True
      Size = 60
    end
    object qryItensGeradosDiaPPHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryItensGeradosDiaPPVALOR_AGRUPADO: TFloatField
      FieldName = 'VALOR_AGRUPADO'
    end
    object qryItensGeradosDiaPPVALOR_CENTRALIZA: TFloatField
      FieldName = 'VALOR_CENTRALIZA'
    end
    object qryItensGeradosDiaPPVALOR_AGRUPADO_CONTAB: TFloatField
      FieldName = 'VALOR_AGRUPADO_CONTAB'
    end
    object qryItensGeradosDiaPPVALOR_EFETIVO: TFloatField
      FieldName = 'VALOR_EFETIVO'
    end
    object qryItensGeradosDiaPPVALOR_ABONADO: TFloatField
      FieldName = 'VALOR_ABONADO'
    end
    object qryItensGeradosDiaPPVALOR_ABONADO_CONTAB: TFloatField
      FieldName = 'VALOR_ABONADO_CONTAB'
    end
    object qryItensGeradosDiaPPABONO_CONTAB: TFloatField
      FieldName = 'ABONO_CONTAB'
    end
    object qryItensGeradosDiaPPVALOR_ESTORNADO_CONTAB: TFloatField
      FieldName = 'VALOR_ESTORNADO_CONTAB'
    end
    object qryItensGeradosDiaPPESTORNO_CONTAB: TFloatField
      FieldName = 'ESTORNO_CONTAB'
    end
  end
  object rptItensGeradosDiaPP: TppReport
    AutoStop = False
    DataPipeline = pplItensGeradosDiaPP
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 120
    Top = 8
    Version = '7.04'
    mmColumnWidth = 283770
    DataPipelineName = 'pplItensGeradosDiaPP'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 47890
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Itens Gerados por Dia (Sintético) - por Plano e Patrocinadora'
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
      object ppLabel2: TppLabel
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
      object ppLabel25: TppLabel
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
        mmLeft = 2646
        mmTop = 19844
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel26: TppLabel
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
        mmLeft = 3969
        mmTop = 24342
        mmWidth = 12700
        BandType = 0
      end
      object rptItensGeradosDia_lblPeriodo: TppLabel
        UserName = 'Label2'
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 17198
        mmTop = 19844
        mmWidth = 794
        BandType = 0
      end
      object rptItensGeradosDia_lblEvento: TppLabel
        UserName = 'rptItensGeradosDia_lblEvento'
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 17198
        mmTop = 24342
        mmWidth = 794
        BandType = 0
      end
      object rptItensGeradosDia_lblCompetencia: TppLabel
        UserName = 'Label13'
        Caption = 'janeiro / 2003'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 265907
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
        mmTop = 35983
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
        mmTop = 35983
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
        mmTop = 43392
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
        mmTop = 35983
        mmWidth = 105040
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
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
        mmTop = 35983
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
        mmTop = 43392
        mmWidth = 283898
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
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
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Color = clNone
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 283770
        BandType = 4
      end
      object ppLine4: TppLine
        OnPrint = ppLine4Print
        UserName = 'Line4'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 283770
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        BlankWhenZero = True
        DataField = 'VALOR_AGRUPADO'
        DataPipeline = pplItensGeradosDiaPP
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensGeradosDiaPP'
        mmHeight = 3175
        mmLeft = 101600
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'IDITEMEMPTMO'
        DataPipeline = pplItensGeradosDiaPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensGeradosDiaPP'
        mmHeight = 3175
        mmLeft = 794
        mmTop = 794
        mmWidth = 6879
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'ITEDESCRICAO'
        DataPipeline = pplItensGeradosDiaPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplItensGeradosDiaPP'
        mmHeight = 3175
        mmLeft = 9525
        mmTop = 794
        mmWidth = 84667
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        BlankWhenZero = True
        DataField = 'VALOR_CENTRALIZA'
        DataPipeline = pplItensGeradosDiaPP
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensGeradosDiaPP'
        mmHeight = 3175
        mmLeft = 142875
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        BlankWhenZero = True
        DataField = 'VALOR_EFETIVO'
        DataPipeline = pplItensGeradosDiaPP
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensGeradosDiaPP'
        mmHeight = 3175
        mmLeft = 162984
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        BlankWhenZero = True
        DataField = 'VALOR_ESTORNADO_CONTAB'
        DataPipeline = pplItensGeradosDiaPP
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensGeradosDiaPP'
        mmHeight = 3175
        mmLeft = 245534
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        BlankWhenZero = True
        DataField = 'VALOR_AGRUPADO_CONTAB'
        DataPipeline = pplItensGeradosDiaPP
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensGeradosDiaPP'
        mmHeight = 3175
        mmLeft = 121709
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText102'
        BlankWhenZero = True
        DataField = 'VALOR_ABONADO_CONTAB'
        DataPipeline = pplItensGeradosDiaPP
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensGeradosDiaPP'
        mmHeight = 3175
        mmLeft = 204788
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        BlankWhenZero = True
        DataField = 'ABONO_CONTAB'
        DataPipeline = pplItensGeradosDiaPP
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensGeradosDiaPP'
        mmHeight = 3175
        mmLeft = 224896
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        BlankWhenZero = True
        DataField = 'VALOR_ABONADO'
        DataPipeline = pplItensGeradosDiaPP
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensGeradosDiaPP'
        mmHeight = 3175
        mmLeft = 184680
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        BlankWhenZero = True
        DataField = 'ESTORNO_CONTAB'
        DataPipeline = pplItensGeradosDiaPP
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensGeradosDiaPP'
        mmHeight = 3175
        mmLeft = 265378
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
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
      object ppLabel3: TppLabel
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
        mmLeft = 108215
        mmTop = 2117
        mmWidth = 67469
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
        mmLeft = 256382
        mmTop = 2117
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'HMEDATAPREVISTA'
      DataPipeline = pplItensGeradosDiaPP
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplItensGeradosDiaPP'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppShape1: TppShape
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
        object ppLabel19: TppLabel
          UserName = 'Label19'
          Caption = 'Data:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 253471
          mmTop = 1852
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'HMEDATAPREVISTA'
          DataPipeline = pplItensGeradosDiaPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 4233
          mmLeft = 264848
          mmTop = 1852
          mmWidth = 17727
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
    object ppGroup2: TppGroup
      BreakName = 'EVENTO'
      DataPipeline = pplItensGeradosDiaPP
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplItensGeradosDiaPP'
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
    object ppGroup5: TppGroup
      BreakName = 'DESC_EVENTO'
      DataPipeline = pplItensGeradosDiaPP
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplItensGeradosDiaPP'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'DESC_EVENTO'
          DataPipeline = pplItensGeradosDiaPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 3704
          mmLeft = 265
          mmTop = 529
          mmWidth = 23548
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
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
          mmWidth = 283770
          BandType = 5
          GroupNo = 2
        end
        object ppShape4: TppShape
          UserName = 'Shape4'
          mmHeight = 5556
          mmLeft = 98954
          mmTop = 1852
          mmWidth = 185209
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VALOR_AGRUPADO_CONTAB'
          DataPipeline = pplItensGeradosDiaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 2910
          mmLeft = 121709
          mmTop = 3175
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VALOR_CENTRALIZA'
          DataPipeline = pplItensGeradosDiaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 2910
          mmLeft = 142875
          mmTop = 3175
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'ESTORNO_CONTAB'
          DataPipeline = pplItensGeradosDiaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 2910
          mmLeft = 265378
          mmTop = 3175
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'VALOR_AGRUPADO'
          DataPipeline = pplItensGeradosDiaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 2910
          mmLeft = 101600
          mmTop = 3175
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'VALOR_EFETIVO'
          DataPipeline = pplItensGeradosDiaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 2910
          mmLeft = 162984
          mmTop = 3175
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'VALOR_ESTORNADO_CONTAB'
          DataPipeline = pplItensGeradosDiaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 2910
          mmLeft = 245534
          mmTop = 3175
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'VALOR_ABONADO_CONTAB'
          DataPipeline = pplItensGeradosDiaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 2910
          mmLeft = 204788
          mmTop = 3175
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'ABONO_CONTAB'
          DataPipeline = pplItensGeradosDiaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 2910
          mmLeft = 224896
          mmTop = 3175
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALOR_ABONADO'
          DataPipeline = pplItensGeradosDiaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 2910
          mmLeft = 184680
          mmTop = 3175
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBText15: TppDBText
          UserName = 'DBText15'
          DataField = 'DESC_EVENTO'
          DataPipeline = pplItensGeradosDiaPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 3440
          mmLeft = 529
          mmTop = 2646
          mmWidth = 96573
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'PLANO_PATRO'
      DataPipeline = pplItensGeradosDiaPP
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplItensGeradosDiaPP'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 16140
        mmPrintPosition = 0
        object ppShape2: TppShape
          OnPrint = ppShape2Print
          UserName = 'Shape2'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          mmHeight = 16140
          mmLeft = 0
          mmTop = 0
          mmWidth = 283770
          BandType = 3
          GroupNo = 3
        end
        object ppLabel32: TppLabel
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
          mmLeft = 248709
          mmTop = 9260
          mmWidth = 14023
          BandType = 3
          GroupNo = 3
        end
        object ppLabel31: TppLabel
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
          mmLeft = 256646
          mmTop = 6085
          mmWidth = 6085
          BandType = 3
          GroupNo = 3
        end
        object ppLabel14: TppLabel
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
          mmLeft = 122502
          mmTop = 9260
          mmWidth = 16404
          BandType = 3
          GroupNo = 3
        end
        object ppLabel7: TppLabel
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
          mmLeft = 145786
          mmTop = 12435
          mmWidth = 14288
          BandType = 3
          GroupNo = 3
        end
        object ppLabel6: TppLabel
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
          mmLeft = 123031
          mmTop = 12435
          mmWidth = 15875
          BandType = 3
          GroupNo = 3
        end
        object ppLabel8: TppLabel
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
          mmLeft = 143669
          mmTop = 9260
          mmWidth = 16404
          BandType = 3
          GroupNo = 3
        end
        object ppLabel11: TppLabel
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
          mmLeft = 171980
          mmTop = 12435
          mmWidth = 8202
          BandType = 3
          GroupNo = 3
        end
        object ppLabel12: TppLabel
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
          mmLeft = 174096
          mmTop = 9260
          mmWidth = 6085
          BandType = 3
          GroupNo = 3
        end
        object ppLabel18: TppLabel
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
          mmLeft = 102394
          mmTop = 9260
          mmWidth = 16404
          BandType = 3
          GroupNo = 3
        end
        object ppLabel15: TppLabel
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
          mmLeft = 231511
          mmTop = 9260
          mmWidth = 10583
          BandType = 3
          GroupNo = 3
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Contabilizar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 207963
          mmTop = 12435
          mmWidth = 14023
          BandType = 3
          GroupNo = 3
        end
        object ppLabel28: TppLabel
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
          mmLeft = 215900
          mmTop = 6085
          mmWidth = 6085
          BandType = 3
          GroupNo = 3
        end
        object ppLabel29: TppLabel
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
          mmLeft = 209550
          mmTop = 9260
          mmWidth = 12435
          BandType = 3
          GroupNo = 3
        end
        object ppLabel30: TppLabel
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
          mmLeft = 236009
          mmTop = 6085
          mmWidth = 6085
          BandType = 3
          GroupNo = 3
        end
        object ppLabel20: TppLabel
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
          mmLeft = 226219
          mmTop = 12435
          mmWidth = 15875
          BandType = 3
          GroupNo = 3
        end
        object ppLabel33: TppLabel
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
          mmLeft = 248709
          mmTop = 12435
          mmWidth = 14023
          BandType = 3
          GroupNo = 3
        end
        object ppLabel24: TppLabel
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
          mmLeft = 100542
          mmTop = 12435
          mmWidth = 18256
          BandType = 3
          GroupNo = 3
        end
        object ppLabel10: TppLabel
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
          mmLeft = 195792
          mmTop = 6085
          mmWidth = 6085
          BandType = 3
          GroupNo = 3
        end
        object ppLabel17: TppLabel
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
          mmTop = 9260
          mmWidth = 15610
          BandType = 3
          GroupNo = 3
        end
        object ppLabel27: TppLabel
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
          mmLeft = 188648
          mmTop = 12435
          mmWidth = 13229
          BandType = 3
          GroupNo = 3
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          Caption = 'Contabilizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 266701
          mmTop = 12435
          mmWidth = 15875
          BandType = 3
          GroupNo = 3
        end
        object ppLabel34: TppLabel
          UserName = 'Label34'
          Caption = 'Estorno'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 273315
          mmTop = 9260
          mmWidth = 9260
          BandType = 3
          GroupNo = 3
        end
        object ppLabel5: TppLabel
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
          mmLeft = 794
          mmTop = 12435
          mmWidth = 93134
          BandType = 3
          GroupNo = 3
        end
        object ppDBText14: TppDBText
          UserName = 'DBText14'
          AutoSize = True
          DataField = 'PLANO_PATRO'
          DataPipeline = pplItensGeradosDiaPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 3440
          mmLeft = 1852
          mmTop = 1323
          mmWidth = 21167
          BandType = 3
          GroupNo = 3
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 12700
          mmLeft = 0
          mmTop = 0
          mmWidth = 283770
          BandType = 5
          GroupNo = 3
        end
        object ppShape5: TppShape
          UserName = 'Shape5'
          mmHeight = 5556
          mmLeft = 98954
          mmTop = 1852
          mmWidth = 185209
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'VALOR_AGRUPADO_CONTAB'
          DataPipeline = pplItensGeradosDiaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 2910
          mmLeft = 121709
          mmTop = 3175
          mmWidth = 17198
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'VALOR_CENTRALIZA'
          DataPipeline = pplItensGeradosDiaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 2910
          mmLeft = 142875
          mmTop = 3175
          mmWidth = 17198
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'ESTORNO_CONTAB'
          DataPipeline = pplItensGeradosDiaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 2910
          mmLeft = 265378
          mmTop = 3175
          mmWidth = 17198
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'VALOR_AGRUPADO'
          DataPipeline = pplItensGeradosDiaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 2910
          mmLeft = 101600
          mmTop = 3175
          mmWidth = 17198
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          DataField = 'VALOR_EFETIVO'
          DataPipeline = pplItensGeradosDiaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 2910
          mmLeft = 162984
          mmTop = 3175
          mmWidth = 17198
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'VALOR_ESTORNADO_CONTAB'
          DataPipeline = pplItensGeradosDiaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 2910
          mmLeft = 245534
          mmTop = 3175
          mmWidth = 17198
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc16'
          DataField = 'VALOR_ABONADO_CONTAB'
          DataPipeline = pplItensGeradosDiaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 2910
          mmLeft = 204788
          mmTop = 3175
          mmWidth = 17198
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'DBCalc17'
          DataField = 'ABONO_CONTAB'
          DataPipeline = pplItensGeradosDiaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 2910
          mmLeft = 224896
          mmTop = 3175
          mmWidth = 17198
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc18: TppDBCalc
          UserName = 'DBCalc18'
          DataField = 'VALOR_ABONADO'
          DataPipeline = pplItensGeradosDiaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 2910
          mmLeft = 184680
          mmTop = 3175
          mmWidth = 17198
          BandType = 5
          GroupNo = 3
        end
        object ppDBText16: TppDBText
          UserName = 'DBText16'
          DataField = 'NOMEPLANO'
          DataPipeline = pplItensGeradosDiaPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 3440
          mmLeft = 529
          mmTop = 1058
          mmWidth = 96573
          BandType = 5
          GroupNo = 3
        end
        object ppDBText17: TppDBText
          UserName = 'DBText17'
          DataField = 'NOMEPATRO'
          DataPipeline = pplItensGeradosDiaPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'pplItensGeradosDiaPP'
          mmHeight = 3440
          mmLeft = 529
          mmTop = 4763
          mmWidth = 96573
          BandType = 5
          GroupNo = 3
        end
      end
    end
  end
end
