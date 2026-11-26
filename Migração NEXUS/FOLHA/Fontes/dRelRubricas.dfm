inherited dtmRelRubricas: TdtmRelRubricas
  Left = 271
  Top = 222
  Width = 308
  Height = 284
  Caption = 'dtmRelRubricas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 29
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
    Left = 29
    Top = 104
  end
  inherited qryExemplo: TwwQuery
    Left = 29
    Top = 152
  end
  inherited rpExemplo: TppReport
    Left = 29
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object qryRubricas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  HRS.MES,'
      '  HRS.MESCOBRANCA,'
      '  PJR.NOME AS NOMEPATRO,'
      
        '  DECODE(PD.FLGDESCONTO,0,'#39'Rubrica de Crédito : '#39',1,'#39'Rubrica de ' +
        'Débito : '#39')||'
      '  RP.CODPROVDESC||'#39' - '#39'||RP.DESCRPROVDESC AS TIPORUB,'
      '  PPP.INSCRICAONUMERO,'
      '  EL.MATRICULA,'
      '  HRS.IDRESPONSAVEL,'
      '  P.NOME,'
      '  HRS.VALORPROVENTO,'
      '  (VALORPROVENTO - VALORRECEBIDO) AS RESIDUO,'
      
        '  DECODE(PD.FLGDESCONTO,0,'#39'Recebedor Creditado'#39',1,'#39'Recebedor Deb' +
        'itado'#39') AS TITULO1,'
      
        '  DECODE(PD.FLGDESCONTO,0,'#39'Valor do Crédito'#39',1,'#39'Valor do Débito'#39 +
        ') AS TITULO2,'
      '  DECODE(PD.FLGDESCONTO,0,'#39#39',1,'#39'Resíduo'#39') AS TITULO3'
      'FROM'
      '  HISTRUBSAL HRS,'
      '  RUBRICAXPESS RP,'
      '  PROVDESC PD,'
      '  PARTPREVPLAN PPP,'
      '  ELEGPATRO EL,'
      '  PESSOA P,'
      '  PESSOA PJR'
      'WHERE 1 = 2 AND'
      '  HRS.IDHSTFOLHABENEF = 1924              AND'
      '  HRS.IDRUBRICA       = 3320              AND'
      '  RP.IDPESSOA         = 1                 AND'
      '  RP.IDRUBRICA        = HRS.IDRUBRICA     AND'
      '  PD.IDPROVENTO       = HRS.IDRUBRICA     AND'
      '  PPP.IDPESSJUR       = HRS.IDPATRO       AND'
      '  PPP.IDPESSOA'#9'      = HRS.IDTITULAR     AND'
      '  EL.IDPESSJUR        = HRS.IDPATRO       AND'
      '  EL.IDPESSOA         = HRS.IDTITULAR     AND'
      '  P.IDPESSOA          = HRS.IDRESPONSAVEL AND'
      '  PJR.IDPESSOA        = HRS.IDPATRO'
      'ORDER BY RP.CODPROVDESC, PPP.INSCRICAONUMERO')
    ValidateWithMask = True
    Left = 98
    Top = 152
  end
  object dsRubricas: TwwDataSource
    DataSet = qryRubricas
    Left = 99
    Top = 104
  end
  object plRubricas: TppBDEPipeline
    DataSource = dsRubricas
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plRubricas'
    Left = 99
    Top = 56
    object plRubricasppField1: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object plRubricasppField2: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 1
    end
    object plRubricasppField3: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object plRubricasppField4: TppField
      FieldAlias = 'TIPORUB'
      FieldName = 'TIPORUB'
      FieldLength = 169
      DisplayWidth = 169
      Position = 3
    end
    object plRubricasppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSCRICAONUMERO'
      FieldName = 'INSCRICAONUMERO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object plRubricasppField6: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 5
    end
    object plRubricasppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRESPONSAVEL'
      FieldName = 'IDRESPONSAVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object plRubricasppField8: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object plRubricasppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPROVENTO'
      FieldName = 'VALORPROVENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object plRubricasppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'RESIDUO'
      FieldName = 'RESIDUO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object plRubricasppField11: TppField
      FieldAlias = 'TITULO1'
      FieldName = 'TITULO1'
      FieldLength = 19
      DisplayWidth = 19
      Position = 10
    end
    object plRubricasppField12: TppField
      FieldAlias = 'TITULO2'
      FieldName = 'TITULO2'
      FieldLength = 16
      DisplayWidth = 16
      Position = 11
    end
    object plRubricasppField13: TppField
      FieldAlias = 'TITULO3'
      FieldName = 'TITULO3'
      FieldLength = 7
      DisplayWidth = 7
      Position = 12
    end
  end
  object ppRubricas: TppReport
    AutoStop = False
    DataPipeline = plRubricas
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relação Individual de Rubricas'
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
    BeforePrint = ppRubricasBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 100
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'plRubricas'
    object ppHeaderBand28: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 36248
      mmPrintPosition = 0
      object ppLabel165: TppLabel
        UserName = 'ppLabel165'
        Caption = 'Relatório de Rubricas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 76729
        mmTop = 28046
        mmWidth = 43656
        BandType = 0
      end
      object ppLine61: TppLine
        UserName = 'ppLine61'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 27252
        mmWidth = 197300
        BandType = 0
      end
      object ppLine64: TppLine
        UserName = 'ppLine64'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 35190
        mmWidth = 197300
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'ppDBText18'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'ppDBText22'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText76: TppDBText
        UserName = 'ppDBText76'
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
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25400
        BandType = 0
      end
      object ppDBImage7: TppDBImage
        UserName = 'ppDBImage7'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText77: TppDBText
        UserName = 'ppDBText77'
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
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText78: TppDBText
        UserName = 'ppDBText78'
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
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14552
        BandType = 0
      end
    end
    object ppDetailBand29: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText101: TppDBText
        UserName = 'ppDBText101'
        DataField = 'RESIDUO'
        DataPipeline = plRubricas
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plRubricas'
        mmHeight = 4233
        mmLeft = 170921
        mmTop = 0
        mmWidth = 25135
        BandType = 4
      end
      object ppDBText102: TppDBText
        UserName = 'ppDBText102'
        DataField = 'VALORPROVENTO'
        DataPipeline = plRubricas
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plRubricas'
        mmHeight = 4233
        mmLeft = 142875
        mmTop = 0
        mmWidth = 25135
        BandType = 4
      end
      object ppRubricasDBText1: TppDBText
        UserName = 'ppRubricasDBText1'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = plRubricas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plRubricas'
        mmHeight = 4233
        mmLeft = 24077
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppRubricasDBText2: TppDBText
        UserName = 'ppRubricasDBText2'
        DataField = 'NOME'
        DataPipeline = plRubricas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plRubricas'
        mmHeight = 4233
        mmLeft = 71173
        mmTop = 0
        mmWidth = 69586
        BandType = 4
      end
      object ppRubricasDBText5: TppDBText
        UserName = 'ppRubricasDBText5'
        AutoSize = True
        DataField = 'MATRICULA'
        DataPipeline = plRubricas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plRubricas'
        mmHeight = 3969
        mmLeft = 46831
        mmTop = 0
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MES'
        DataPipeline = plRubricas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plRubricas'
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
    end
    object ppFooterBand28: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppLabel175: TppLabel
        UserName = 'ppLabel175'
        AutoSize = False
        Caption = 'Folha de Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2910
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc45: TppSystemVariable
        UserName = 'Calc45'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 164042
        mmTop = 2910
        mmWidth = 30427
        BandType = 8
      end
      object ppCalc46: TppSystemVariable
        UserName = 'Calc46'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 89165
        mmTop = 2910
        mmWidth = 18785
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
    end
    object ppRubricasSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppRubricasDBCalc2: TppDBCalc
        UserName = 'ppRubricasDBCalc2'
        DataField = 'VALORPROVENTO'
        DataPipeline = plRubricas
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plRubricas'
        mmHeight = 4233
        mmLeft = 211932
        mmTop = 529
        mmWidth = 17198
        BandType = 7
      end
      object ppRubricasLabel1: TppLabel
        UserName = 'ppRubricasLabel1'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 119327
        mmTop = 794
        mmWidth = 19579
        BandType = 7
      end
      object ppRubricasDBCalc4: TppDBCalc
        UserName = 'ppRubricasDBCalc4'
        DataField = 'RESIDUO'
        DataPipeline = plRubricas
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plRubricas'
        mmHeight = 4233
        mmLeft = 256646
        mmTop = 529
        mmWidth = 17198
        BandType = 7
      end
      object ppdbCalcTotalGeral: TppDBCalc
        UserName = 'dbCalcTotalGeral'
        DataField = 'VALORPROVENTO'
        DataPipeline = plRubricas
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plRubricas'
        mmHeight = 4233
        mmLeft = 142875
        mmTop = 794
        mmWidth = 25135
        BandType = 7
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Quantidade Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 12700
        mmTop = 794
        mmWidth = 30427
        BandType = 7
      end
      object ppdbCalcQuantGeral: TppDBCalc
        UserName = 'dbCalcQuantGeral'
        DataField = 'VALORPROVENTO'
        DataPipeline = plRubricas
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'plRubricas'
        mmHeight = 4233
        mmLeft = 51065
        mmTop = 794
        mmWidth = 25135
        BandType = 7
      end
      object ppdbCalcResiduoGeral: TppDBCalc
        UserName = 'dbCalcResiduoGeral'
        DataField = 'RESIDUO'
        DataPipeline = plRubricas
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plRubricas'
        mmHeight = 4233
        mmLeft = 170921
        mmTop = 794
        mmWidth = 25135
        BandType = 7
      end
      object ppLine65: TppLine
        UserName = 'ppLine65'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 7
      end
    end
    object ppRubricasGroup1: TppGroup
      BreakName = 'NOMEPATRO'
      DataPipeline = plRubricas
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'RubricasGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'plRubricas'
      object ppRubricasGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 37042
        mmPrintPosition = 0
        object ppRubricasLabel3: TppLabel
          UserName = 'ppRubricasLabel3'
          Caption = 'Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 28046
          mmTop = 31750
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppRubricasLine1: TppLine
          UserName = 'ppRubricasLine1'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 265
          mmTop = 36248
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppRubricasLabel7: TppLabel
          UserName = 'ppRubricasLabel7'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 51594
          mmTop = 31750
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppRubricasDBText6: TppDBText
          UserName = 'ppRubricasDBText6'
          AutoSize = True
          DataField = 'TITULO1'
          DataPipeline = plRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'plRubricas'
          mmHeight = 4233
          mmLeft = 70908
          mmTop = 31750
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppRubricasDBText3: TppDBText
          UserName = 'ppRubricasDBText3'
          AutoSize = True
          DataField = 'TITULO2'
          DataPipeline = plRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plRubricas'
          mmHeight = 4233
          mmLeft = 153194
          mmTop = 31750
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppRubricasDBText4: TppDBText
          UserName = 'ppRubricasDBText4'
          AutoSize = True
          DataField = 'TITULO3'
          DataPipeline = plRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plRubricas'
          mmHeight = 4233
          mmLeft = 181240
          mmTop = 31750
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppLblMesRef: TppLabel
          UserName = 'LblMesRef'
          AutoSize = False
          Caption = 'Referência    :    '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4498
          mmTop = 1588
          mmWidth = 31750
          BandType = 3
          GroupNo = 0
        end
        object qrlblMesRef: TppLabel
          UserName = 'qrlblMesRef'
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 37571
          mmTop = 1588
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
        object qrDbTxtNomePatro: TppDBText
          UserName = 'qrDbTxtNomePatro'
          DataField = 'NOMEPATRO'
          DataPipeline = plRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'plRubricas'
          mmHeight = 4233
          mmLeft = 37571
          mmTop = 6615
          mmWidth = 111390
          BandType = 3
          GroupNo = 0
        end
        object ppLblPatro: TppLabel
          UserName = 'LblPatro'
          AutoSize = False
          Caption = 'Patrocinadora :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4498
          mmTop = 6615
          mmWidth = 31750
          BandType = 3
          GroupNo = 0
        end
        object ppLblPlano: TppLabel
          UserName = 'LblPlano1'
          AutoSize = False
          Caption = 'Plano Prev.   :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4498
          mmTop = 11906
          mmWidth = 31750
          BandType = 3
          GroupNo = 0
        end
        object qrLblPlano: TppLabel
          UserName = 'qrLblPlano'
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 37571
          mmTop = 11906
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
        object ppRubricasDBText7: TppDBText
          UserName = 'ppRubricasDBText7'
          AutoSize = True
          DataField = 'TIPORUB'
          DataPipeline = plRubricas
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'plRubricas'
          mmHeight = 3969
          mmLeft = 4498
          mmTop = 22490
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Mês Ref.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4498
          mmTop = 31750
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Plano Contábil:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4498
          mmTop = 17198
          mmWidth = 31750
          BandType = 3
          GroupNo = 0
        end
        object pplblPlanoContabil: TppLabel
          UserName = 'qrLblPlano1'
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 37571
          mmTop = 17198
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
      end
      object ppRubricasGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppdbCalcTotalPatro: TppDBCalc
          UserName = 'dbCalcTotalPatro'
          DataField = 'VALORPROVENTO'
          DataPipeline = plRubricas
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppRubricasGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plRubricas'
          mmHeight = 4233
          mmLeft = 142875
          mmTop = 1588
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
        object ppRubricasLabel6: TppLabel
          UserName = 'ppRubricasLabel6'
          Caption = 'Total por Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 99484
          mmTop = 1323
          mmWidth = 41540
          BandType = 5
          GroupNo = 0
        end
        object ppRubricasLine2: TppLine
          UserName = 'ppRubricasLine2'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 265
          mmTop = 6085
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
        object ppdbCalcResiduoPatro: TppDBCalc
          UserName = 'dbCalcResiduoPatro'
          DataField = 'RESIDUO'
          DataPipeline = plRubricas
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppRubricasGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plRubricas'
          mmHeight = 4233
          mmLeft = 170921
          mmTop = 1588
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 265
          mmTop = 529
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Quant. por Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4498
          mmTop = 1323
          mmWidth = 43656
          BandType = 5
          GroupNo = 0
        end
        object ppdbCalcQuantPatro: TppDBCalc
          UserName = 'dbCalcQuantPatro'
          DataField = 'VALORPROVENTO'
          DataPipeline = plRubricas
          DisplayFormat = '#,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppRubricasGroup1
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'plRubricas'
          mmHeight = 4233
          mmLeft = 51065
          mmTop = 1588
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'TIPORUB'
      DataPipeline = plRubricas
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'plRubricas'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
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
      
        '       substr((trim(E.LOGRADOURO)||'#39', '#39'||trim(E.NUMERO)),200) AS' +
        ' ENDERECO   ,'
      
        '       substr((trim(E.BAIRRO)||'#39' - '#39'||trim(C.NOME)||'#39' - '#39'||trim(' +
        'C.CODESTADO)),1,200) AS BARCIDUF'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ValidateWithMask = True
    Left = 174
    Top = 152
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
    Left = 174
    Top = 104
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 174
    Top = 56
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField11: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 10
    end
    object ppFundacaoppField12: TppField
      FieldAlias = 'BARCIDUF'
      FieldName = 'BARCIDUF'
      FieldLength = 79
      DisplayWidth = 79
      Position = 11
    end
  end
end
