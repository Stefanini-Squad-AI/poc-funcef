inherited dtmRelBenef: TdtmRelBenef
  Left = 265
  Width = 374
  Height = 260
  Caption = 'dtmRelBenef'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 29
    Top = 72
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
    Left = 29
    Top = 120
  end
  inherited qryExemplo: TwwQuery
    Left = 29
    Top = 176
  end
  inherited rpExemplo: TppReport
    Left = 29
    DataPipelineName = 'pplExemplo'
  end
  object qryRelbenHistSINT: TwwQuery
    BeforeOpen = qryRelbenHistSINTBeforeOpen
    DatabaseName = 'BaSEDADOS'
    SQL.Strings = (
      'Select'
      #9'hfb.historico AS VERSAO,'
      #9'PESPATRO.NOME AS EMPRESA,'
      #9'SUM(hst.valorprovento) AS TOTAL'
      'from'
      #9'histrubsal hst,'
      #9'PESSOA PESPATRO,'
      #9'hstfolhabenef hfb'
      'where'
      #9'hst.mescobranca = '#39'2001/03'#39' and'
      #9'hst.idrubrica = '#39'3320'#39' AND'
      #9'HST.IDPATRO = PESPATRO.IDPESSOA and'
      #9'hst.idhstfolhabenef = hfb.idhstfolhabenef'
      'AND 1 = 2'
      'GROUP BY hfb.historico,PESPATRO.NOME'
      ' ')
    ValidateWithMask = True
    Left = 112
    Top = 176
  end
  object dsRelbenhistSINT: TwwDataSource
    DataSet = qryRelbenHistSINT
    Left = 112
    Top = 120
  end
  object RelbenhistSINT: TppReport
    AutoStop = False
    DataPipeline = pipeRelbenhistsINT
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Benefícios Pagos - Sintético'
    PrinterSetup.PaperName = 'A4'
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 112
    Top = 16
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pipeRelbenhistsINT'
    object ppReport1HeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32279
      mmPrintPosition = 0
      object RelResFolhaLabel1: TppLabel
        UserName = 'RelResFolhaLabel1'
        Caption = 'TITULODO RELATORIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 75406
        mmTop = 24871
        mmWidth = 47890
        BandType = 0
      end
      object RelResFolhaLine1: TppLine
        UserName = 'RelResFolhaLine1'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 265
        mmTop = 30956
        mmWidth = 196057
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
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
      object ppDBImage2: TppDBImage
        UserName = 'DBImage2'
        MaintainAspectRatio = True
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
      object ppDBText16: TppDBText
        UserName = 'DBText16'
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
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
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
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
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
        mmWidth = 14288
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
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
    end
    object ppReport1DetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = pipeRelbenhistsINT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipeRelbenhistsINT'
        mmHeight = 4233
        mmLeft = 50006
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'TOTAL'
        DataPipeline = pipeRelbenhistsINT
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipeRelbenhistsINT'
        mmHeight = 4233
        mmLeft = 158750
        mmTop = 265
        mmWidth = 37571
        BandType = 4
      end
    end
    object ppReport1FooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'TOTAL'
        DataPipeline = pipeRelbenhistsINT
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipeRelbenhistsINT'
        mmHeight = 4233
        mmLeft = 159809
        mmTop = 1058
        mmWidth = 37571
        BandType = 8
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'TOTAL GERAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 1323
        mmWidth = 24606
        BandType = 8
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 794
        mmTop = 529
        mmWidth = 196057
        BandType = 8
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 1058
        mmTop = 5821
        mmWidth = 196057
        BandType = 8
      end
    end
    object RelResFolhaGroup1: TppGroup
      BreakName = 'ppDBText3'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'RelResFolhaGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object RelResFolhaGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'VERSÃO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 1852
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          AutoSize = True
          DataField = 'VERSAO'
          DataPipeline = pipeRelbenhistsINT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pipeRelbenhistsINT'
          mmHeight = 4233
          mmLeft = 16669
          mmTop = 1852
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppLine10: TppLine
          UserName = 'Line10'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 529
          mmTop = 6614
          mmWidth = 196057
          BandType = 3
          GroupNo = 0
        end
        object ppLine11: TppLine
          UserName = 'Line101'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 794
          mmTop = 265
          mmWidth = 196057
          BandType = 3
          GroupNo = 0
        end
      end
      object RelResFolhaGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'TOTAL'
          DataPipeline = pipeRelbenhistsINT
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = RelResFolhaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pipeRelbenhistsINT'
          mmHeight = 4233
          mmLeft = 159015
          mmTop = 1058
          mmWidth = 37571
          BandType = 5
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'TOTAL DA VERSÃO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 1058
          mmWidth = 33338
          BandType = 5
          GroupNo = 0
        end
        object ppLine12: TppLine
          UserName = 'Line12'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 794
          mmTop = 5821
          mmWidth = 196057
          BandType = 5
          GroupNo = 0
        end
        object ppLine13: TppLine
          UserName = 'Line13'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 794
          mmTop = 529
          mmWidth = 196057
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object RelResFolhaGroup2: TppGroup
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      UserName = 'RelResFolhaGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object RelResFolhaGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object RelResFolhaGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object pipeRelbenhistsINT: TppBDEPipeline
    DataSource = dsRelbenhistSINT
    UserName = 'pipeRelbenhistsINT'
    Left = 112
    Top = 72
  end
  object pipeRelbenHistANAL: TppBDEPipeline
    DataSource = dsrelbenhistANAL
    UserName = 'pipeRelbenhist1'
    Left = 212
    Top = 72
    object pipeRelbenHistANALppField1: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 0
    end
    object pipeRelbenHistANALppField2: TppField
      FieldAlias = 'NOME_BENEFICIARIO'
      FieldName = 'NOME_BENEFICIARIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pipeRelbenHistANALppField3: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pipeRelbenHistANALppField4: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 3
    end
    object pipeRelbenHistANALppField5: TppField
      FieldAlias = 'VERSAO'
      FieldName = 'VERSAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object pipeRelbenHistANALppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
  end
  object qryrelbenhistANAL: TwwQuery
    BeforeOpen = qryrelbenhistANALBeforeOpen
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'Select'
      #9'ELG.MATRICULA,'
      #9'PES.NOME AS NOME_BENEFICIARIO,'
      '    '#9'PESPATRO.NOME AS EMPRESA,'
      #9'hst.mescobranca,'
      #9'hfb.historico AS VERSAO,'
      #9'sum(hst.valorprovento) AS VALOR'
      'FROM'
      #9'histrubsal hst,'
      #9'PESSOA PESPATRO,'
      #9'PESSOA PES,'
      #9'ELEGPATRO ELG,'
      #9'hstfolhabenef hfb'
      'where'
      #9'hst.mescobranca = '#39'2001/03'#39' and'
      #9'hst.idrubrica in (3820,3320) AND'
      #9'HST.IDPATRO = PESPATRO.IDPESSOA and'
      #9'HST.IDPESSOA = PES.IDPESSOA AND'
      #9'hst.idhstfolhabenef = hfb.idhstfolhabenef   and'
      '                hst.idpessoa = elg.idpessoa'
      'AND 1 = 2'
      'group by'
      #9'ELG.MATRICULA,'
      #9'PES.NOME  ,'
      '    '#9'PESPATRO.NOME ,'
      #9'hst.mescobranca,'
      #9'hfb.historico'
      'ORDER BY hfb.historico,PESPATRO.NOME,elg.matricula'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 212
    Top = 176
  end
  object relbenhistANAL: TppReport
    AutoStop = False
    DataPipeline = pipeRelbenHistANAL
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Benefícios Pagos - Analíticos'
    PrinterSetup.PaperName = 'A4'
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 212
    Top = 16
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pipeRelbenHistANAL'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 31485
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'RelResFolhaLabel1'
        Caption = 'TITULO DO RELATORIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 75142
        mmTop = 24871
        mmWidth = 49213
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'RelResFolhaLine1'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 529
        mmTop = 30956
        mmWidth = 196057
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'ppDBText1'
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
      object ppDBImage1: TppDBImage
        UserName = 'ppDBImage1'
        MaintainAspectRatio = True
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
      object ppDBText11: TppDBText
        UserName = 'ppDBText3'
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
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'ppDBText4'
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
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'ppDBText5'
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
        mmWidth = 14288
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'ppDBText2'
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
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'NOME_BENEFICIARIO'
        DataPipeline = pipeRelbenHistANAL
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipeRelbenHistANAL'
        mmHeight = 4233
        mmLeft = 21696
        mmTop = 265
        mmWidth = 119063
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText1'
        DataField = 'MATRICULA'
        DataPipeline = pipeRelbenHistANAL
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipeRelbenHistANAL'
        mmHeight = 4233
        mmLeft = 529
        mmTop = 529
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'MESCOBRANCA'
        DataPipeline = pipeRelbenHistANAL
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipeRelbenHistANAL'
        mmHeight = 4233
        mmLeft = 144198
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VALOR'
        DataPipeline = pipeRelbenHistANAL
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipeRelbenHistANAL'
        mmHeight = 4233
        mmLeft = 162719
        mmTop = 265
        mmWidth = 33867
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'TOTAL GERAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 1323
        mmWidth = 24606
        BandType = 8
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = pipeRelbenHistANAL
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipeRelbenHistANAL'
        mmHeight = 4233
        mmLeft = 170657
        mmTop = 1058
        mmWidth = 25665
        BandType = 8
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 1058
        mmTop = 529
        mmWidth = 196057
        BandType = 8
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 794
        mmTop = 5821
        mmWidth = 196057
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'ppDBText8'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'RelResFolhaGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object VERSAO: TppLabel
          UserName = 'VERSAO'
          Caption = 'VERSÃO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 794
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          DataField = 'VERSAO'
          DataPipeline = pipeRelbenHistANAL
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pipeRelbenHistANAL'
          mmHeight = 4233
          mmLeft = 17463
          mmTop = 794
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object ppLine8: TppLine
          UserName = 'Line8'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 794
          mmTop = 5556
          mmWidth = 196057
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object rpBenefAlterDBCalc1: TppDBCalc
          UserName = 'rpBenefAlterDBCalc1'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = pipeRelbenHistANAL
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pipeRelbenHistANAL'
          mmHeight = 4233
          mmLeft = 170657
          mmTop = 1058
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'TOTAL DA VERSÃO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 1058
          mmWidth = 33338
          BandType = 5
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 1323
          mmTop = 529
          mmWidth = 196057
          BandType = 5
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 1058
          mmTop = 5821
          mmWidth = 196057
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'ppDBText6'
      BreakType = btCustomField
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'EMPRESA'
          DataPipeline = pipeRelbenHistANAL
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pipeRelbenHistANAL'
          mmHeight = 4233
          mmLeft = 18785
          mmTop = 529
          mmWidth = 31221
          BandType = 3
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'VERSAO1'
          Caption = 'EMPRESA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 529
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppLine9: TppLine
          UserName = 'Line9'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 529
          mmTop = 5291
          mmWidth = 196057
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = pipeRelbenHistANAL
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pipeRelbenHistANAL'
          mmHeight = 4233
          mmLeft = 170921
          mmTop = 1588
          mmWidth = 25665
          BandType = 5
          GroupNo = 1
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'TOTAL DA EMPRESA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 1588
          mmWidth = 35454
          BandType = 5
          GroupNo = 1
        end
        object ppLine2: TppLine
          UserName = 'Line1'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 794
          mmTop = 529
          mmWidth = 196057
          BandType = 5
          GroupNo = 1
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 1058
          mmTop = 6350
          mmWidth = 196057
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object dsrelbenhistANAL: TwwDataSource
    DataSet = qryrelbenhistANAL
    Left = 212
    Top = 120
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      
        'SELECT P.NOME          , P.RAZAOSOCIAL, E.LOGRADOURO            ' +
        '   ,'
      
        '       E.NUMERO        , E.COMPLEMENTO, E.BAIRRO                ' +
        '   ,'
      
        '       C.NOME AS CIDADE, C.CODESTADO  , E.CEP                   ' +
        '   ,'
      
        '       I.IMAGEM        , (E.LOGRADOURO||'#39', '#39'||E.NUMERO) AS ENDER' +
        'ECO,'
      
        '       (E.BAIRRO||'#39' - '#39'||C.NOME||'#39' - '#39'||C.CODESTADO)    AS BARCI' +
        'DUF           '
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ValidateWithMask = True
    Left = 303
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
      end>
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 303
    Top = 120
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    CloseDataSource = True
    UserName = 'Fundacao'
    Left = 303
    Top = 72
  end
end
