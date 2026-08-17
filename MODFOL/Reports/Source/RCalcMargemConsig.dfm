inherited rptCalcMargemConsig: TrptCalcMargemConsig
  Left = 743
  Top = 197
  Width = 308
  Height = 307
  Caption = 'rptCalcMargemConsig'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object rpCalcMC: TppReport
    AutoStop = False
    DataPipeline = ppDBCalcMC
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToFile = True
    BeforePrint = rpCalcMCBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 208
    Top = 8
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBCalcMC'
    object ppCabecalho: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 58473
      mmPrintPosition = 0
      object ppTituloFundacao: TppLabel
        UserName = 'TituloFundacao'
        Caption = 'FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6646
        mmLeft = 33501
        mmTop = 794
        mmWidth = 121920
        BandType = 0
      end
      object ppSubTitulo: TppLabel
        UserName = 'SubTitulo'
        Caption = 
          'SCN. Quadra 2. Bloco A Edifício Corporate Financial Center 12 e ' +
          '13 Andares'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 35983
        mmTop = 8731
        mmWidth = 117740
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'SubTitulo1'
        Caption = 'Brasília DF CEP 70.712-900 - (61)3329-1700 - www.funcef.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 43512
        mmTop = 12965
        mmWidth = 103209
        BandType = 0
      end
      object ppDirCentCust: TppLabel
        UserName = 'Label1'
        Caption = 'DIATI/COPES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 2910
        mmTop = 25929
        mmWidth = 22098
        BandType = 0
      end
      object ppCalcMargem: TppLabel
        UserName = 'CalcMargem'
        Caption = 'CÁLCULO DA MARGEM CONSIGNÁVEL - 30%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 2910
        mmTop = 31485
        mmWidth = 76623
        BandType = 0
      end
      object pplblEmpregado: TppLabel
        UserName = 'lblEmpregado'
        Caption = 'EMPREGADO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 2910
        mmTop = 37042
        mmWidth = 24172
        BandType = 0
      end
      object pplblMes: TppLabel
        UserName = 'lblMes'
        Caption = 'MÊS:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 2910
        mmTop = 43127
        mmWidth = 8848
        BandType = 0
      end
      object ppNomeFunc: TppLabel
        UserName = 'NomeFunc'
        Caption = 'Nome do Funcionário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 27781
        mmTop = 37042
        mmWidth = 36248
        BandType = 0
      end
      object ppMes: TppLabel
        UserName = 'Mes'
        Caption = 'Mes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 12435
        mmTop = 43127
        mmWidth = 6900
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 529
        mmTop = 51065
        mmWidth = 196586
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 529
        mmTop = 56886
        mmWidth = 196586
        BandType = 0
      end
      object ppRubrica: TppLabel
        UserName = 'Rubrica'
        Caption = 'Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 4233
        mmTop = 52123
        mmWidth = 12171
        BandType = 0
      end
      object ppValor: TppLabel
        UserName = 'Valor'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 181769
        mmTop = 52123
        mmWidth = 7938
        BandType = 0
      end
      object dbimgLogo: TppDBImage
        UserName = 'dbimgLogo'
        AutoSize = True
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppImg
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppImg'
        mmHeight = 21167
        mmLeft = 2381
        mmTop = 529
        mmWidth = 26723
        BandType = 0
      end
    end
    object ppDetalhe: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 61913
      mmPrintPosition = 0
      object ppNomeRubricas: TppDBText
        OnPrint = ppNomeRubricasPrint
        UserName = 'Grupo2'
        DataField = 'NOME'
        DataPipeline = ppDBCalcMC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBCalcMC'
        mmHeight = 3260
        mmLeft = 2381
        mmTop = 529
        mmWidth = 152400
        BandType = 4
      end
      object ppVlrRubricas: TppDBText
        OnPrint = ppVlrRubricasPrint
        UserName = 'VlrRubricas'
        BlankWhenZero = True
        DataField = 'VALOR'
        DataPipeline = ppDBCalcMC
        DisplayFormat = '###,###,###,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBCalcMC'
        mmHeight = 3260
        mmLeft = 157163
        mmTop = 529
        mmWidth = 34131
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
      object ppModulo: TppLabel
        UserName = 'Modulo'
        Caption = 'Folha de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 4233
        mmWidth = 55298
        BandType = 8
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 1323
        mmWidth = 197380
        BandType = 8
      end
      object ppDataEmissao: TppLabel
        UserName = 'DataEmissao'
        Caption = 'DATA DE EMISSÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 165365
        mmTop = 3969
        mmWidth = 31750
        BandType = 8
      end
      object ppPaginas: TppSystemVariable
        UserName = 'Paginas'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 101865
        mmTop = 4498
        mmWidth = 9948
        BandType = 8
      end
      object pplblPagina: TppLabel
        UserName = 'lblPagina'
        Caption = 'Página'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 88636
        mmTop = 4498
        mmWidth = 11515
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Fundo1'
        Brush.Color = clMenu
        mmHeight = 5821
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 196321
        BandType = 7
      end
      object ppMargemFinal: TppLabel
        UserName = 'MargemFinal'
        Caption = 'VI - Margem Final (IV - V)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3970
        mmLeft = 4498
        mmTop = 1852
        mmWidth = 40047
        BandType = 7
      end
      object ppVlrMargemFinal: TppLabel
        UserName = 'VlrMargemFinal'
        Caption = 'VlrMargemFinal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3970
        mmLeft = 157163
        mmTop = 1852
        mmWidth = 34130
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'GRUPO'
      DataPipeline = ppDBCalcMC
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBCalcMC'
      object ppGrupoBand: TppGroupHeaderBand
        Save = True
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 16140
        mmPrintPosition = 0
        object ppFundo: TppShape
          UserName = 'Fundo'
          Brush.Color = clScrollBar
          Pen.Style = psClear
          mmHeight = 5821
          mmLeft = 1323
          mmTop = 1058
          mmWidth = 196057
          BandType = 3
          GroupNo = 0
        end
        object ppGrupo: TppDBText
          UserName = 'Grupo'
          DataField = 'GRUPO'
          DataPipeline = ppDBCalcMC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBCalcMC'
          mmHeight = 4022
          mmLeft = 3440
          mmTop = 1852
          mmWidth = 152400
          BandType = 3
          GroupNo = 0
        end
        object ppVlrTotal: TppDBText
          UserName = 'Grupo1'
          DataField = 'VALORTOTAL'
          DataPipeline = ppDBCalcMC
          DisplayFormat = '###,###,###,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBCalcMC'
          mmHeight = 4022
          mmLeft = 157163
          mmTop = 1852
          mmWidth = 34131
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
    object raCodeModule2: TraCodeModule
      ProgramStream = {00}
    end
  end
  object ppDBCalcMC: TppBDEPipeline
    DataSource = dsCalcMC
    UserName = 'DBCalcMC'
    Left = 24
    Top = 56
    object ppDBCalcMCppField1: TppField
      FieldAlias = 'GRUPO'
      FieldName = 'GRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBCalcMCppField2: TppField
      FieldAlias = 'CODGRUPO'
      FieldName = 'CODGRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBCalcMCppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBCalcMCppField4: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object dsCalcMC: TDataSource
    DataSet = cdsCalcMC
    Left = 24
    Top = 104
  end
  object cdsCalcMC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 160
  end
  object sqlCalcMC: TCMSqlParams
    SQL.Strings = (
      'SELECT GR.GRUPO, '
      '              GR.CODGRUPO, '
      '              GR.NOME, '
      '              GR.VALOR,'
      '              GR.IDRUBRICA,'
      '              GR.VALORTOTAL'
      'FROM ('
      'SELECT '#39'I - Remuneração'#39' AS GRUPO, '
      '       1 AS CODGRUPO,'
      '       RX.IDRUBRICA,  '
      '       RX.DESCRPROVDESC  AS NOME,'
      '       0  AS VALOR,'
      '       0 AS VALORTOTAL'
      '  FROM  RUBRICAXPESS RX, PROVDESC P'
      'WHERE RX.IDRUBRICA = P.IDPROVENTO '
      '  AND P.IDMODULO = 21 '
      '  AND :RUBREMUN'
      '   '
      'UNION'
      ''
      'SELECT '#39'II - Deduções'#39' AS GRUPO, '
      '       2 AS CODGRUPO,'
      '       RX.IDRUBRICA,  '
      '       RX.DESCRPROVDESC  AS NOME,'
      '       0 AS VALOR,'
      '       0 AS VALORTOTAL '
      '  FROM RUBRICAXPESS RX, PROVDESC P'
      'WHERE RX.IDRUBRICA = P.IDPROVENTO '
      '  AND P.IDMODULO = 21 '
      '  AND :RUBDEDUCAO'
      ''
      'UNION'
      ''
      'SELECT '#39'III - Base de Cálculo (I - II)'#39' AS GRUPO,'
      '       3 AS CODGRUPO,'
      '       0 AS IDRUBRICA,'
      '       '#39' '#39' AS NOME,'
      '       0 AS VALOR,'
      '       0 AS VALORTOTAL   '
      '  FROM DUAL'
      ''
      'UNION'
      '  '
      'SELECT '#39'IV - Margem Preliminar (30% de III)'#39' AS GRUPO,'
      '       4 AS CODGRUPO,'
      '       0 AS IDRUBRICA,'
      '       '#39' '#39' AS NOME,'
      '       0 AS VALOR,'
      '       0 AS VALORTOTAL   '
      '  FROM DUAL '
      '   '
      'UNION'
      ''
      'SELECT '#39'V - Descontos Facultativos'#39' AS GRUPO, '
      '       5 AS CODGRUPO,'
      '       RX.IDRUBRICA,  '
      '       RX.DESCRPROVDESC AS NOME,'
      '       0 AS VALOR,'
      '       0 AS VALORTOTAL'
      '  FROM RUBRICAXPESS RX, PROVDESC P'
      'WHERE RX.IDRUBRICA = P.IDPROVENTO '
      '  AND P.IDMODULO = 21 '
      '  AND :RUBDESCFACUL'
      ''
      'UNION  '
      ''
      'SELECT '#39'I - Remuneração'#39' AS GRUPO, '
      '       1 AS CODGRUPO,'
      '       0 AS IDRUBRICA,'
      '       '#39' '#39' AS NOME,'
      '       0 AS VALOR,'
      '       0 AS VALORTOTAL   '
      '  FROM DUAL'
      ''
      'UNION  '
      ''
      'SELECT '#39'II - Deduções'#39' AS GRUPO, '
      '       2 AS CODGRUPO,'
      '       0 AS IDRUBRICA,'
      '       '#39' '#39' AS NOME,'
      '       0 AS VALOR,'
      '       0 AS VALORTOTAL   '
      '  FROM DUAL'
      ''
      'UNION  '
      ''
      'SELECT '#39'V - Descontos Facultativos'#39' AS GRUPO, '
      '       5 AS CODGRUPO,'
      '       0 AS IDRUBRICA,  '
      '       '#39' '#39' AS NOME,'
      '       0 AS VALOR,'
      '       0 AS VALORTOTAL'
      '  FROM DUAL) GR'
      'ORDER BY GRUPO, NOME')
    OnFormartParam = FormatParametros
    ClientDataSet = cdsCalcMC
    Left = 24
    Top = 208
  end
  object sqlRubValores: TCMSqlParams
    SQL.Strings = (
      'SELECT'#39'I - REMUNERAÇÃO'#39' AS GRUPO, '
      '              1 AS CODGRUPO,'
      '              RX.IDRUBRICA,'
      '              HR.VALORPROVENTO AS VALOR'
      '   FROM HISTRUBSAL HR, RUBRICAXPESS RX, PROVDESC P'
      '  WHERE HR.IDRUBRICA = P.IDPROVENTO'
      '        AND RX.IDRUBRICA = P.IDPROVENTO'
      '        AND P.IDMODULO = 21'
      '        AND HR.IDPESSOA = :IDPESSOA'
      '        AND HR.MES = :MES'
      '        AND :RUBREMUN'
      ''
      'UNION'
      ''
      'SELECT'#39'II - DEDUÇÃO'#39' AS GRUPO, '
      '              2 AS CODGRUPO,'
      '              RX.IDRUBRICA,'
      '              HR.VALORPROVENTO AS VALOR'
      '   FROM HISTRUBSAL HR, RUBRICAXPESS RX, PROVDESC P'
      '  WHERE HR.IDRUBRICA = P.IDPROVENTO'
      '        AND RX.IDRUBRICA = P.IDPROVENTO'
      '        AND P.IDMODULO = 21'
      '        AND HR.IDPESSOA = :IDPESSOA'
      '        AND HR.MES = :MES'
      '        AND :RUBDEDUCAO'
      ''
      'UNION'
      ''
      'SELECT '#39'V - DESCONTOS FACULTATIVOS'#39' AS GRUPO, '
      '              5 AS CODGRUPO,'
      '              RX.IDRUBRICA,'
      '              HR.VALORPROVENTO AS VALOR'
      '   FROM HISTRUBSAL HR, RUBRICAXPESS RX, PROVDESC P'
      '  WHERE HR.IDRUBRICA = P.IDPROVENTO'
      '        AND RX.IDRUBRICA = P.IDPROVENTO'
      '        AND P.IDMODULO = 21 '
      '        AND HR.IDPESSOA = :IDPESSOA'
      '        AND HR.MES = :MES'
      '        AND :RUBDESCFACUL'
      ''
      '')
    OnFormartParam = FormatParametros
    ClientDataSet = cdsRubValores
    Left = 120
    Top = 216
  end
  object cdsRubValores: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 160
  end
  object ppImg: TppBDEPipeline
    DataSource = dsImg
    UserName = 'DBCalcMC1'
    Left = 208
    Top = 56
    object ppField1: TppField
      FieldAlias = 'GRUPO'
      FieldName = 'GRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppField2: TppField
      FieldAlias = 'CODGRUPO'
      FieldName = 'CODGRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppField4: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object dsImg: TDataSource
    DataSet = cdsImg
    Left = 208
    Top = 104
  end
  object cdsImg: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 160
  end
  object sqlImg: TCMSqlParams
    SQL.Strings = (
      'SELECT IMAGEM FROM IMAGENS'
      ' WHERE IDIMAGEM = 18')
    OnFormartParam = FormatParametros
    ClientDataSet = cdsImg
    Left = 208
    Top = 208
  end
end
