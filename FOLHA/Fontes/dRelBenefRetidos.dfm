inherited dtmRelBenefRetidos: TdtmRelBenefRetidos
  Left = 285
  Top = 187
  Width = 248
  Height = 219
  Caption = 'dtmRelBenefRetidos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 18
    Top = 53
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
    Left = 18
    Top = 99
  end
  inherited qryExemplo: TwwQuery
    Left = 18
    Top = 144
  end
  inherited rpExemplo: TppReport
    Left = 18
    Top = 8
  end
  object plBenefRetidos: TppBDEPipeline
    DataSource = dsBenefRetidos
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plBenefRetidos'
    Left = 98
    Top = 53
    object plBenefRetidosppField1: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object plBenefRetidosppField2: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object plBenefRetidosppField3: TppField
      FieldAlias = 'BENEF'
      FieldName = 'BENEF'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object plBenefRetidosppField4: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object plBenefRetidosppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORATUAL'
      FieldName = 'VALORATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object plBenefRetidosppField6: TppField
      FieldAlias = 'DATAFINALPREVISTA'
      FieldName = 'DATAFINALPREVISTA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object plBenefRetidosppField7: TppField
      FieldAlias = 'DATAREQ'
      FieldName = 'DATAREQ'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object plBenefRetidosppField8: TppField
      FieldAlias = 'DATAINI'
      FieldName = 'DATAINI'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object plBenefRetidosppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANO'
      FieldName = 'IDPLANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object plBenefRetidosppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBENEFICIO'
      FieldName = 'IDBENEFICIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object plBenefRetidosppField11: TppField
      FieldAlias = 'DATAINICIO'
      FieldName = 'DATAINICIO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 10
    end
  end
  object dsBenefRetidos: TwwDataSource
    DataSet = qryBenefRetidos
    Left = 98
    Top = 99
  end
  object qryBenefRetidos: TwwQuery
    BeforeOpen = qryBenefRetidosBeforeOpen
    AfterOpen = qryBenefRetidosAfterOpen
    AfterClose = qryBenefRetidosAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  E.MATRICULA,'
      '  PJ.NOME AS PATRO,'
      '  BE.NOME AS BENEF,'
      '  PE.NOME,'
      '  BF.VALORATUAL,'
      '  BF.DATAFINALPREVISTA,'
      '  BF.DATAREQUERIMENTO AS DATAREQ,'
      '  BF.DATAINICIO AS DATAINI,'
      '  BF.IDPLANOPREV AS IDPLANO,'
      '  BE.IDBENEFICIO,'
      '  BF.DATAINICIO AS DATAINICIO'
      ''
      'FROM'
      '  BENEFBFCIARIO BF,'
      '  PESSOA PE,'
      '  BENEFICIO BE,'
      '  PESSOA PJ,'
      '  ELEGPATRO E,'
      '  BENEFPLANPREV BPP'
      ''
      'WHERE'
      '  (BF.IDSITBENEFICIO = 2)                 AND'
      
        '  (((:PIDPESSJUR IS NOT NULL) AND (BF.IDPESSJUR = :PIDPESSJUR)) ' +
        'OR (:PIDPESSJUR IS NULL)) AND'
      '  (BF.IDPESSOA       = PE.IDPESSOA)       AND'
      '  (BF.IDPESSJUR      = E.IDPESSJUR)       AND'
      '  (BF.IDTITULAR      = E.IDPESSOA)        AND'
      '  (BF.IDPESSJUR      = PJ.IDPESSOA)       AND'
      '  (BE.IDBENEFICIO    = BF.IDBENEFICIO)    AND'
      '  (BE.TIPOBENEFICIO  < 99)                AND'
      '  (BPP.FLGREFERENCIA = 0)                 AND'
      '  (BF.IDBENEFICIO    = BPP.IDBENEFICIO)   AND'
      '  (BF.IDPLANOPREV    = BPP.IDPLANOPREV)'
      ''
      'ORDER BY'
      '  PJ.NOME,'
      '  BE.NOME,'
      '  PE.NOME'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 98
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'PIDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object rpBenefRetidos: TppReport
    AutoStop = False
    DataPipeline = plBenefRetidos
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Benefícios Retidos'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5080
    PrinterSetup.mmMarginLeft = 5080
    PrinterSetup.mmMarginRight = 5080
    PrinterSetup.mmMarginTop = 5080
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpBenefRetidosBeforePrint
    DeviceType = 'Screen'
    Left = 98
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand20: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 36513
      mmPrintPosition = 0
      object rpBenefRetidosLabel10: TppLabel
        UserName = 'rpBenefRetidosLabel10'
        Caption = 'RELATÓRIO DE BENEFÍCIOS RETIDOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 59796
        mmTop = 27517
        mmWidth = 79375
        BandType = 0
      end
      object rpBenefProvDBText10: TppDBText
        UserName = 'rpBenefProvDBText10'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 35719
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object rpBenefProvDBText11: TppDBText
        UserName = 'rpBenefProvDBText11'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 35719
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object rpBenefProvDBText12: TppDBText
        UserName = 'rpBenefProvDBText12'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 35719
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object rpBenefProvDBImage1: TppDBImage
        UserName = 'rpBenefProvDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 31750
        BandType = 0
      end
      object rpBenefRetidosDBText7: TppDBText
        UserName = 'rpBenefRetidosDBText7'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 35719
        mmTop = 12171
        mmWidth = 15875
        BandType = 0
      end
      object rpBenefRetidosDBText8: TppDBText
        UserName = 'rpBenefRetidosDBText8'
        AutoSize = True
        DataField = 'BARCIDUF'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 35719
        mmTop = 16140
        mmWidth = 14288
        BandType = 0
      end
    end
    object ppDetailBand21: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object rpBenefRetidosDBText3: TppDBText
        UserName = 'rpBenefRetidosDBText3'
        DataField = 'NOME'
        DataPipeline = plBenefRetidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 529
        mmWidth = 60325
        BandType = 4
      end
      object rpBenefRetidosDBText4: TppDBText
        UserName = 'rpBenefRetidosDBText4'
        DataField = 'DATAREQ'
        DataPipeline = plBenefRetidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 89959
        mmTop = 529
        mmWidth = 21167
        BandType = 4
      end
      object rpBenefRetidosDBText5: TppDBText
        UserName = 'rpBenefRetidosDBText5'
        DataField = 'DATAINI'
        DataPipeline = plBenefRetidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 114300
        mmTop = 529
        mmWidth = 21167
        BandType = 4
      end
      object rpBenefRetidosDBText6: TppDBText
        UserName = 'rpBenefRetidosDBText6'
        DataField = 'VALORATUAL'
        DataPipeline = plBenefRetidos
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 165629
        mmTop = 529
        mmWidth = 27517
        BandType = 4
      end
      object dbDataRetencao: TppDBText
        UserName = 'dbDataRetencao'
        DataField = 'DATAFINALPREVISTA'
        DataPipeline = plBenefRetidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 139171
        mmTop = 529
        mmWidth = 23283
        BandType = 4
      end
      object dbMatricula: TppDBText
        UserName = 'dbMatricula'
        DataField = 'MATRICULA'
        DataPipeline = plBenefRetidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 529
        mmWidth = 20108
        BandType = 4
      end
    end
    object ppFooterBand20: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppLabel94: TppLabel
        UserName = 'ppLabel94'
        AutoSize = False
        Caption = 'Folha de Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 1588
        mmWidth = 197909
        BandType = 8
      end
      object ppLine40: TppLine
        UserName = 'ppLine40'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 199919
        BandType = 8
      end
      object ppCalc31: TppSystemVariable
        UserName = 'Calc31'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 1588
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc32: TppSystemVariable
        UserName = 'Calc32'
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
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpBenefRetidosGroup1: TppGroup
      BreakName = 'PATRO'
      DataPipeline = plBenefRetidos
      NewPage = True
      UserName = 'rpBenefRetidosGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpBenefRetidosGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpBenefRetidosGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object rpBenefRetidosLabel9: TppLabel
          UserName = 'rpBenefRetidosLabel9'
          Caption = 'Total por Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 109802
          mmTop = 794
          mmWidth = 39952
          BandType = 5
          GroupNo = 0
        end
        object rpBenefRetidosDBCalc2: TppDBCalc
          UserName = 'rpBenefRetidosDBCalc2'
          DataField = 'VALORATUAL'
          DataPipeline = plBenefRetidos
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpBenefRetidosGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 159544
          mmTop = 794
          mmWidth = 33602
          BandType = 5
          GroupNo = 0
        end
        object rpBenefRetidosLine3: TppLine
          UserName = 'rpBenefRetidosLine3'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 0
          mmWidth = 196586
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpBenefRetidosGroup2: TppGroup
      BreakName = 'BENEF'
      DataPipeline = plBenefRetidos
      UserName = 'rpBenefRetidosGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpBenefRetidosGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 19579
        mmPrintPosition = 0
        object rpBenefRetidosLabel2: TppLabel
          UserName = 'rpBenefRetidosLabel2'
          Caption = 'Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 3704
          mmWidth = 24871
          BandType = 3
          GroupNo = 1
        end
        object rpBenefRetidosLabel3: TppLabel
          UserName = 'rpBenefRetidosLabel3'
          Caption = 'Benefício:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 8467
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object rpBenefRetidosDBText1: TppDBText
          UserName = 'rpBenefRetidosDBText1'
          AutoSize = True
          DataField = 'PATRO'
          DataPipeline = plBenefRetidos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 28575
          mmTop = 3704
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object rpBenefRetidosDBText2: TppDBText
          UserName = 'rpBenefRetidosDBText2'
          AutoSize = True
          DataField = 'BENEF'
          DataPipeline = plBenefRetidos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 28575
          mmTop = 8467
          mmWidth = 11906
          BandType = 3
          GroupNo = 1
        end
        object rpBenefRetidosLine1: TppLine
          UserName = 'rpBenefRetidosLine1'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 265
          mmTop = 18256
          mmWidth = 196586
          BandType = 3
          GroupNo = 1
        end
        object rpBenefRetidosLabel4: TppLabel
          UserName = 'rpBenefRetidosLabel4'
          Caption = 'Beneficiário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 25400
          mmTop = 13758
          mmWidth = 20373
          BandType = 3
          GroupNo = 1
        end
        object rpBenefRetidosLabel5: TppLabel
          UserName = 'rpBenefRetidosLabel5'
          Caption = 'Requerido Em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 88636
          mmTop = 13758
          mmWidth = 23813
          BandType = 3
          GroupNo = 1
        end
        object rpBenefRetidosLabel6: TppLabel
          UserName = 'rpBenefRetidosLabel6'
          Caption = 'Início'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 119327
          mmTop = 13758
          mmWidth = 9260
          BandType = 3
          GroupNo = 1
        end
        object rpBenefRetidosLabel7: TppLabel
          UserName = 'rpBenefRetidosLabel7'
          Caption = 'Valor do Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 165365
          mmTop = 13758
          mmWidth = 31221
          BandType = 3
          GroupNo = 1
        end
        object rpBenefRetidosLine5: TppLine
          UserName = 'rpBenefRetidosLine5'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1852
          mmLeft = 0
          mmTop = 0
          mmWidth = 196586
          BandType = 3
          GroupNo = 1
        end
        object lblDataRetencao: TppLabel
          UserName = 'lblDataRetencao'
          Caption = 'Retido Em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 142082
          mmTop = 13758
          mmWidth = 17463
          BandType = 3
          GroupNo = 1
        end
        object lblMatricula: TppLabel
          UserName = 'lblMatricula'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 13758
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
      end
      object rpBenefRetidosGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 14552
        mmPrintPosition = 0
        object rpBenefRetidosLabel8: TppLabel
          UserName = 'rpBenefRetidosLabel8'
          Caption = 'Total por Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 109802
          mmTop = 1058
          mmWidth = 32279
          BandType = 5
          GroupNo = 1
        end
        object rpBenefRetidosDBCalc1: TppDBCalc
          UserName = 'rpBenefRetidosDBCalc1'
          DataField = 'VALORATUAL'
          DataPipeline = plBenefRetidos
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpBenefRetidosGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 159544
          mmTop = 794
          mmWidth = 33602
          BandType = 5
          GroupNo = 1
        end
        object rpBenefRetidosLine2: TppLine
          UserName = 'rpBenefRetidosLine2'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 0
          mmWidth = 196586
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object rpBenefRetidosGroup3: TppGroup
      BreakName = 'NOME'
      DataPipeline = plBenefRetidos
      UserName = 'rpBenefRetidosGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpBenefRetidosGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpBenefRetidosGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME          , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO        , E.COMPLEMENTO, E.BAIRRO    ,'
      '       C.NOME AS CIDADE, C.CODESTADO  , E.CEP       , I.IMAGEM, '
      '       (E.LOGRADOURO||'#39', '#39'||E.NUMERO) AS ENDERECO   ,'
      '       (E.BAIRRO||'#39' - '#39'||C.NOME||'#39' - '#39'||C.CODESTADO) AS BARCIDUF'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ValidateWithMask = True
    Left = 181
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 2002
      end>
    object qryFundacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryFundacaoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryFundacaoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object qryFundacaoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object qryFundacaoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qryFundacaoBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qryFundacaoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryFundacaoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Size = 3
    end
    object qryFundacaoCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryFundacaoIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryFundacaoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 70
    end
    object qryFundacaoBARCIDUF: TStringField
      FieldName = 'BARCIDUF'
      Size = 79
    end
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 181
    Top = 99
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 181
    Top = 53
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField11: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField12: TppField
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
end
