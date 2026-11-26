inherited dtmRelaQtdPartFolha: TdtmRelaQtdPartFolha
  Left = 286
  Top = 202
  Width = 275
  Height = 226
  Caption = 'dtmRelaQtdPartFolha'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 21
    Top = 55
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
    Left = 21
    Top = 103
  end
  inherited qryExemplo: TwwQuery
    Left = 21
    Top = 151
  end
  inherited rpExemplo: TppReport
    Left = 21
    Top = 7
  end
  object ppRRelaQtdPartFolha: TppReport
    AutoStop = False
    DataPipeline = ppBDERelaQtdPartFolha
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Quantidade de Participantes'
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
    Left = 117
    Top = 7
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand21: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 44450
      mmPrintPosition = 0
      object ppLabel95: TppLabel
        UserName = 'Label95'
        Caption = 'Relatório Estatístico de Participantes por Versão de Folha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 42333
        mmTop = 29104
        mmWidth = 117475
        BandType = 0
      end
      object ppLine61: TppLine
        UserName = 'Line61'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 529
        mmTop = 34396
        mmWidth = 196321
        BandType = 0
      end
      object ppDBImage10: TppDBImage
        UserName = 'DBImage10'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmRelFolha.ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 29633
        BandType = 0
      end
      object ppDBText48: TppDBText
        UserName = 'DBText48'
        DataField = 'NOME'
        DataPipeline = dtmRelFolha.ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object ppDBText52: TppDBText
        UserName = 'DBText52'
        DataField = 'CEP'
        DataPipeline = dtmRelFolha.ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = dtmRelFolha.ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 43127
        mmTop = 11906
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = dtmRelFolha.ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 43127
        mmTop = 7408
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'BARCIDUF'
        DataPipeline = dtmRelFolha.ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 43127
        mmTop = 16140
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Histórico: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 35719
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'HISTORICO'
        DataPipeline = ppVerFolha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 18256
        mmTop = 35983
        mmWidth = 17992
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 529
        mmTop = 39688
        mmWidth = 196321
        BandType = 0
      end
    end
    object ppDetailBand22: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        DataField = 'PATRO'
        DataPipeline = ppBDERelaQtdPartFolha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 0
        mmWidth = 45508
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        DataField = 'PLANO'
        DataPipeline = ppBDERelaQtdPartFolha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 48948
        mmTop = 0
        mmWidth = 85725
        BandType = 4
      end
      object ppDBText45: TppDBText
        UserName = 'DBText45'
        DataField = 'QTD'
        DataPipeline = ppBDERelaQtdPartFolha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 136261
        mmTop = 0
        mmWidth = 19845
        BandType = 4
      end
    end
    object ppFooterBand21: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 21960
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
        mmTop = 1058
        mmWidth = 197380
        BandType = 8
      end
      object ppLine64: TppLine
        UserName = 'Line64'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel100: TppLabel
        UserName = 'Label100'
        AutoSize = False
        Caption = 'Folha de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1058
        mmWidth = 197909
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
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PATRO'
      DataPipeline = ppBDERelaQtdPartFolha
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3969
          mmLeft = 2381
          mmTop = 0
          mmWidth = 21696
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3969
          mmLeft = 49213
          mmTop = 0
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Qtde.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3969
          mmLeft = 147902
          mmTop = 0
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 136261
          mmTop = 0
          mmWidth = 19845
          BandType = 5
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 128059
          mmTop = 529
          mmWidth = 7673
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'QTD'
          DataPipeline = ppBDERelaQtdPartFolha
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 136261
          mmTop = 529
          mmWidth = 19845
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppBDERelaQtdPartFolha: TppBDEPipeline
    DataSource = DSRelaQtdPartFolha
    UserName = 'BDERelaQtdPartFolha'
    Left = 117
    Top = 55
    object ppBDERelaQtdPartFolhappField1: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDERelaQtdPartFolhappField2: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppBDERelaQtdPartFolhappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTD'
      FieldName = 'QTD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
  end
  object DSRelaQtdPartFolha: TwwDataSource
    DataSet = qryRelaQtdPartFolha
    Left = 117
    Top = 103
  end
  object qryVerFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select'
      '  historico'
      'from hstFolhaBenef'
      'where idhstFolhaBenef = :idHstFolhaBenef'
      'order by historico')
    ValidateWithMask = True
    Left = 217
    Top = 151
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idHstFolhaBenef'
        ParamType = ptInput
      end>
  end
  object DSVerFolha: TwwDataSource
    DataSet = qryVerFolha
    Left = 217
    Top = 103
  end
  object ppVerFolha: TppBDEPipeline
    DataSource = DSVerFolha
    UserName = 'VerFolha'
    Left = 217
    Top = 55
    object ppVerFolhappField1: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
  end
  object qryRelaQtdPartFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' PT.NOME PATRO,'
      ' PL.NOME PLANO,'
      ' COUNT(*) QTD'
      'FROM HISTRUBSAL H,'
      '     PESSOA PT,'
      '     PLANPREV PL'
      'WHERE PL.IDPLANOPREV = H.IDPLANOPREV AND'
      '      PT.IDPESSOA = H.IDPESSJUR'
      '      and h.idhstfolhabenef = 2030 and h.idpessjur = 2'
      'AND 1 = 2      '
      'GROUP BY PT.NOME, PL.NOME'
      'ORDER BY PT.NOME, PL.NOME'
      ' ')
    ValidateWithMask = True
    Left = 117
    Top = 151
  end
end
