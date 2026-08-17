inherited dtmRelatoriosTrn: TdtmRelatoriosTrn
  Left = 481
  Width = 189
  Height = 123
  Caption = 'dtmRelatoriosTrn'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 18
    Top = 41
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
  inherited dsExemplo: TwwDataSource
    Left = 18
    Top = 29
  end
  inherited qryExemplo: TwwQuery
    Left = 18
  end
  inherited rpExemplo: TppReport
    Left = 18
    Top = 4
  end
  object rpTabCursos: TppReport
    AutoStop = False
    DataPipeline = ppTabCursos
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 94
    Top = 40
    Version = '5.5'
    mmColumnWidth = 197300
    object rpTabCursosHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21431
      mmPrintPosition = 0
      object rpTabCursosLbl1: TppLabel
        UserName = 'rpBenefPorPessoaLbl1'
        AutoSize = False
        Caption = 'Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 151077
        mmTop = 6085
        mmWidth = 9790
        BandType = 0
      end
      object rpTabCursosLbl2: TppLabel
        UserName = 'rpBenefPorPessoaLbl2'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 146050
        mmTop = 10319
        mmWidth = 14817
        BandType = 0
      end
      object rpTabCursosDBTxt1: TppDBText
        UserName = 'rpBenefPorPessoaDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppTabCursos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 89959
        mmTop = 2381
        mmWidth = 17463
        BandType = 0
      end
      object rpTabCursosCalc1: TppSystemVariable
        UserName = 'rpBenefPorPessoaCalc1'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 6085
        mmWidth = 7938
        BandType = 0
      end
      object rpTabCursosCalc2: TppSystemVariable
        UserName = 'rpBenefPorPessoaCalc2'
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 10319
        mmWidth = 22225
        BandType = 0
      end
      object rpTabCursosDBTxt2: TppDBText
        UserName = 'rpTabCursosDBTxt2'
        AutoSize = True
        DataField = 'DESCRTIPOAVAL'
        DataPipeline = ppTabCursos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 83344
        mmTop = 10319
        mmWidth = 30427
        BandType = 0
      end
      object rpTabCursosLbl3: TppLabel
        UserName = 'rpTabCursosLbl3'
        AutoSize = False
        Caption = 'Título do Curso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 35454
        mmTop = 16404
        mmWidth = 94986
        BandType = 0
      end
      object rpTabCursosLbl4: TppLabel
        UserName = 'rpTabCursosLbl4'
        AutoSize = False
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 11113
        mmTop = 16404
        mmWidth = 22754
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Position = lpBottom
        Weight = 1.5
        mmHeight = 1323
        mmLeft = 11113
        mmTop = 20108
        mmWidth = 176213
        BandType = 0
      end
      object rpTabCursosLbl5: TppLabel
        UserName = 'rpTabCursosLbl5'
        AutoSize = False
        Caption = 'Abreviado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 164571
        mmTop = 16404
        mmWidth = 22754
        BandType = 0
      end
    end
    object rpTabCursosDtlBnd: TppDetailBand
      BeforePrint = rpTabCursosDtlBndBeforePrint
      mmBottomOffset = 0
      mmHeight = 21167
      mmPrintPosition = 0
      object rpTabCursosDBTxt3: TppDBText
        UserName = 'rpTabCursosDBTxt3'
        DataField = 'IDCURSO'
        DataPipeline = ppTabCursos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 11113
        mmTop = 794
        mmWidth = 22754
        BandType = 4
      end
      object rpTabCursosDBTxt4: TppDBText
        UserName = 'rpTabCursosDBTxt4'
        DataField = 'DESCRICAO'
        DataPipeline = ppTabCursos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 35454
        mmTop = 794
        mmWidth = 94986
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'ABREV'
        DataPipeline = ppTabCursos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 164571
        mmTop = 1323
        mmWidth = 22754
        BandType = 4
      end
      object rpTabCursosDBMemo1: TppDBMemo
        UserName = 'rpTabCursosDBMemo1'
        CharWrap = False
        DataField = 'OBSERVACAO'
        DataPipeline = ppTabCursos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 14023
        mmLeft = 11113
        mmTop = 6085
        mmWidth = 167217
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object rpTabCursosSmryBnd: TppSummaryBand
      AfterPrint = rpTabCursosSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppTabCursos
      NewPage = True
      ResetPageNo = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpTabCursosGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpTabCursosGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLabel2: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Total de Cursos Listados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 11113
          mmTop = 2117
          mmWidth = 38100
          BandType = 5
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Weight = 0.5
          mmHeight = 1323
          mmLeft = 11113
          mmTop = 265
          mmWidth = 176213
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'IDCURSO'
          DataPipeline = ppTabCursos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3175
          mmLeft = 51065
          mmTop = 2117
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppTabCursos: TppBDEPipeline
    DataSource = dsTabCursos
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'TabCursos'
    Left = 94
    Top = 27
  end
  object dsTabCursos: TwwDataSource
    DataSet = qryTabCursos
    Left = 94
    Top = 14
  end
  object qryTabCursos: TwwQuery
    BeforeOpen = qryTabCursosBeforeOpen
    AfterOpen = qryTabCursosAfterOpen
    AfterScroll = qryTabCursosAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ('#39'CM'#39') AS EMPRESA,'
      '  IDCURSO, DESCRICAO, ABREV, CODGRPTREIN'
      'FROM'
      '  CURSO'
      'WHERE'
      '  (CODGRPTREIN  = 1)'
      'ORDER BY'
      '  IDCURSO')
    ValidateWithMask = True
    Left = 94
    Top = 2
  end
end
