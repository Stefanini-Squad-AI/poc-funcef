inherited dtmRelatoriosAvalCurso: TdtmRelatoriosAvalCurso
  Left = 481
  Width = 216
  Height = 123
  Caption = 'dtmRelatoriosAvalCurso'
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
  object rpAvalCurso: TppReport
    AutoStop = False
    DataPipeline = ppAvalCurso
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
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
      mmHeight = 65881
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 12435
        mmLeft = 11377
        mmTop = 22225
        mmWidth = 177536
        BandType = 0
      end
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
        DataPipeline = ppAvalCurso
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
        mmWidth = 17198
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
      object rpTabCursosLbl3: TppLabel
        UserName = 'rpTabCursosLbl3'
        Caption = 'Cargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 83079
        mmTop = 29369
        mmWidth = 8202
        BandType = 0
      end
      object rpTabCursosLbl4: TppLabel
        UserName = 'rpTabCursosLbl4'
        Caption = 'Matrícula:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 12435
        mmTop = 23548
        mmWidth = 13229
        BandType = 0
      end
      object rpTabCursosLbl5: TppLabel
        UserName = 'rpTabCursosLbl5'
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 83079
        mmTop = 23548
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'AVALIAÇÃO DE PARTICIPAÇÃO EM ATIVIDADE DE TREINAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 17727
        mmTop = 10319
        mmWidth = 112713
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MATRICULA'
        DataPipeline = ppAvalCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 27252
        mmTop = 23548
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'NOME'
        DataPipeline = ppAvalCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 93134
        mmTop = 23548
        mmWidth = 91546
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CARGO'
        DataPipeline = ppAvalCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 93134
        mmTop = 29369
        mmWidth = 91281
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 15346
        mmLeft = 11377
        mmTop = 43127
        mmWidth = 177536
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'EMPREGADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 11377
        mmTop = 17727
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'CURSO / EVENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 11377
        mmTop = 38894
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 12171
        mmTop = 53975
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 12171
        mmTop = 44979
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Entidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 12171
        mmTop = 49477
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Local:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 82815
        mmTop = 53975
        mmWidth = 8202
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'CURSO'
        DataPipeline = ppAvalCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 26458
        mmTop = 44979
        mmWidth = 10319
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'ENTIDADE'
        DataPipeline = ppAvalCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 26458
        mmTop = 49477
        mmWidth = 14288
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'PERIODO'
        DataPipeline = ppAvalCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 26458
        mmTop = 53975
        mmWidth = 12965
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'LOCAL'
        DataPipeline = ppAvalCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 97102
        mmTop = 53975
        mmWidth = 88900
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 11377
        mmTop = 65352
        mmWidth = 177536
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 11377
        mmTop = 61648
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Descrição / Observações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 35454
        mmTop = 61648
        mmWidth = 33602
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Avaliação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 61648
        mmWidth = 12965
        BandType = 0
      end
    end
    object rpTabCursosDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object rpTabCursosDBTxt3: TppDBText
        UserName = 'rpTabCursosDBTxt3'
        DataField = 'IDFATORAVAL'
        DataPipeline = ppAvalCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 11377
        mmTop = 794
        mmWidth = 22754
        BandType = 4
      end
      object rpTabCursosDBTxt4: TppDBText
        UserName = 'rpTabCursosDBTxt4'
        DataField = 'DESCRICAO'
        DataPipeline = ppAvalCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 35454
        mmTop = 794
        mmWidth = 116681
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'AVALIACAO'
        DataPipeline = ppAvalCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 155311
        mmTop = 1058
        mmWidth = 22754
        BandType = 4
      end
      object rpTabCursosDBMemo1: TppDBMemo
        UserName = 'rpTabCursosDBMemo1'
        CharWrap = False
        DataField = 'OBSERVACAO'
        DataPipeline = ppAvalCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 14023
        mmLeft = 11377
        mmTop = 6085
        mmWidth = 177536
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 11377
        mmTop = 21431
        mmWidth = 177536
        BandType = 4
      end
    end
    object rpTabCursosSmryBnd: TppSummaryBand
      AfterPrint = rpTabCursosSmryBndAfterPrint
      mmBottomOffset = 0
      mmHeight = 1000
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppAvalCurso
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
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppAvalCurso: TppBDEPipeline
    DataSource = dsAvalCurso
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'AvalCurso'
    Left = 94
    Top = 27
  end
  object dsAvalCurso: TwwDataSource
    DataSet = qryAvalCurso
    Left = 94
    Top = 14
  end
  object qryAvalCurso: TwwQuery
    BeforeOpen = qryAvalCursoBeforeOpen
    AfterOpen = qryAvalCursoAfterOpen
    AfterScroll = qryAvalCursoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ('#39'CM'#39') AS EMPRESA,'
      '  '#39'       '#39' AS NOME,'
      '  '#39'      '#39'  AS MATRICULA,'
      '  '#39'      '#39'  AS CARGO,'
      '  '#39'      '#39'  AS CURSO,'
      '  '#39'      '#39'  AS PERIODO,'
      '  '#39'      '#39' AS ENTIDADE,'
      '  '#39'      '#39' AS LOCAL,'
      '  0      AS AVALIACAO,'
      '  '#39'      '#39' AS DESCRICAO,'
      '  '#39'      '#39' AS OBSERVACAO,'
      '  0      AS IDFATORAVAL '
      'FROM'
      '  DUAL'
      'ORDER BY'
      '  IDFATORAVAL')
    ValidateWithMask = True
    Left = 94
    Top = 2
  end
  object dsgnRelatorios: TppDesigner
    Caption = 'Alteração do Layout de Etiquetas de Atualização de CTPS'
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000033333300003333330000000000000003BBBBBB3003BBBBBB30000
      00000000003BBBBBB3003BBBBBB30000000000000003BBBB3003BBBBBB300000
      000000000003BBBB3003BBBBB3000000000000000003BBBB3003BBBB30000000
      000000000003BBBBB33BBBBB30000000000000000003BBBBBBBBBBB300000000
      000000000003BBBBBBBBBBB300000000000000700003BBBB333BBBBB30000000
      000000800003BBBB3003BBBBB30000000000F8F00003BBBB3003BBBBB3000000
      008F8F800003BBBB3003BBBBB3000070F8F877F80003BBBB333BBBBBB300007F
      8F00F08F003BBBBBBBBBBBBB3000007800FFF048003BBBBBBBBBBBB300000000
      FFFFF08F8003333333333330000070FFFFCCF804F07000000000000000007FFF
      CCFFFF0F8F0000000000000000007FCCFFFCCF074807000000000000000078FF
      FCCFFFF08F80700000000000000007FCCFFFCCF044F8070000000000000007FF
      FFCCFFFF0F8F8000000000000000078FCCFFFCCF07F77000000000000000007F
      FFFCCFFFF07000000000000000000078FCCFFFCCFF0700000000000000000007
      FFFFCCFFFF80000000000000000000078FCCFFFF877000000000000000000000
      7FFFFF8770000000000000000000000007FF8770000000000000000000000000
      007770000000000000000000000000000000000000000000000000000000FFFE
      0781FFFC0300FFFC0300FFFE0601FFFE0603FFFE0607FFFE0007FFFE000FFFFE
      000FFFDE0007FF0E0603FC0E0603F00E0603C0060003C0040007C004000FC002
      001F0001FFFF0001FFFF0000FFFF00007FFF80003FFF80003FFF80007FFFC001
      FFFFC000FFFFE000FFFFE001FFFFF007FFFFF81FFFFFFC7FFFFFFFFFFFFF}
    Position = poScreenCenter
    ShowComponents = [scLabel, scMemo, scRichText, scCalc, scImage, scShape, scLine, scBarCode, scTeeChart, scDBText, scDBMemo, scDBRichText, scDBCalc, scDBImage, scDBBarCode, scDBTeeChart, scRegion]
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.SQLType = sqBDELocal
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 161
    Top = 5
  end
end
