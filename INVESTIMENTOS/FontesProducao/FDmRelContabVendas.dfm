inherited DmRelContabVendas: TDmRelContabVendas
  Left = 260
  Top = 218
  Width = 335
  Height = 282
  Caption = 'DmRelContabVendas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 21
    Top = 64
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
    Left = 21
    Top = 123
  end
  inherited qryExemplo: TwwQuery
    Left = 21
    Top = 187
  end
  inherited rpExemplo: TppReport
    Left = 21
    Top = 8
    DataPipelineName = 'pplExemplo'
    inherited HeaderBand1: TppHeaderBand
      inherited ppDbLogo: TppDBImage [3]
      end
      inherited ppLPeriodo: TppLabel [4]
      end
      inherited ppLCarteiraEx: TppLabel [5]
        mmTop = 14023
      end
    end
  end
  object rptContabVendas: TppReport
    AutoStop = False
    DataPipeline = pplOrdens
    OnStartPage = rptContabVendasStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Contabilização de Vendas'
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 114
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplOrdens'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20638
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19579
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Contabilização de Vendas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 43921
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa1'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'LCarteira1'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182827
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo1'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmOperComum.pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object lblDataOper: TppLabel
        UserName = 'LPeriodo1'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'QTDEORDMOVINV'
        DataPipeline = pplOrdens
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrdens'
        mmHeight = 3175
        mmLeft = 25929
        mmTop = 794
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PUORDMOVINV'
        DataPipeline = pplOrdens
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrdens'
        mmHeight = 3175
        mmLeft = 64029
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VLRVENDA'
        DataPipeline = pplOrdens
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrdens'
        mmHeight = 3175
        mmLeft = 84931
        mmTop = 529
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PUCUSTO'
        DataPipeline = pplOrdens
        DisplayFormat = '###,###,##0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrdens'
        mmHeight = 3175
        mmLeft = 112184
        mmTop = 529
        mmWidth = 30956
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'VLRCUSTO'
        DataPipeline = pplOrdens
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrdens'
        mmHeight = 3175
        mmLeft = 147902
        mmTop = 529
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VARIACAO'
        DataPipeline = pplOrdens
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrdens'
        mmHeight = 3175
        mmLeft = 170657
        mmTop = 529
        mmWidth = 25665
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
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
        mmLeft = 4763
        mmTop = 3175
        mmWidth = 191823
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 196586
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
        mmLeft = 170657
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCINVESTIMENTO'
      DataPipeline = pplOrdens
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplOrdens'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14023
        mmPrintPosition = 0
        object shpCabInvestimento: TppShape
          UserName = 'shpCabInvestimento'
          Brush.Color = clSilver
          ParentHeight = True
          ParentWidth = True
          mmHeight = 14023
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DESCINVESTIMENTO'
          DataPipeline = pplOrdens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplOrdens'
          mmHeight = 4233
          mmLeft = 794
          mmTop = 794
          mmWidth = 76729
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label3'
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 38365
          mmTop = 9790
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label4'
          Caption = 'PU           de Venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 66146
          mmTop = 5556
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label5'
          Caption = 'Valor       da Venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7938
          mmLeft = 92075
          mmTop = 5027
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label6'
          Caption = 'PU                de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7144
          mmLeft = 125413
          mmTop = 5821
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label7'
          Caption = 'Valor            de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 6879
          mmLeft = 153459
          mmTop = 6085
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label8'
          Caption = 'Variação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 184680
          mmTop = 9790
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object shpRodapeInvestimento: TppShape
          UserName = 'shpRodapeInvestimento'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label9'
          Caption = 'Totais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 3704
          mmTop = 529
          mmWidth = 8202
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'QTDEORDMOVINV'
          DataPipeline = pplOrdens
          DisplayFormat = '###,###,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrdens'
          mmHeight = 3175
          mmLeft = 16404
          mmTop = 529
          mmWidth = 37042
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VLRVENDA'
          DataPipeline = pplOrdens
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrdens'
          mmHeight = 3175
          mmLeft = 74877
          mmTop = 529
          mmWidth = 32808
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VLRCUSTO'
          DataPipeline = pplOrdens
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrdens'
          mmHeight = 3175
          mmLeft = 138907
          mmTop = 529
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'VARIACAO'
          DataPipeline = pplOrdens
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrdens'
          mmHeight = 3175
          mmLeft = 170127
          mmTop = 529
          mmWidth = 26194
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object pplOrdens: TppBDEPipeline
    DataSource = dsOrdens
    UserName = 'lOrdens'
    Left = 114
    Top = 64
  end
  object qryOrdens: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT OM.DATAORDMOVINV, IV.DESCINVESTIMENTO,'
      '       OM.QTDEORDMOVINV, OM.PUORDMOVINV,'
      
        '       ROUND((OM.QTDEORDMOVINV * OM.PUORDMOVINV),8) AS VLRVENDA,' +
        ' CT.PUCUSTO,'
      '       ROUND((OM.QTDEORDMOVINV * CT.PUCUSTO),8) AS VLRCUSTO,'
      
        '       ROUND(((OM.QTDEORDMOVINV * OM.PUORDMOVINV) - (OM.QTDEORDM' +
        'OVINV * CT.PUCUSTO)),8) AS VARIACAO'
      ''
      'FROM ORDMOVINV OM, INVESTIMENTO IV, TIPOOPERACAO TP,'
      '     (SELECT H1.IDINVESTIMENTO,'
      '             NVL(H1.SALDOQTDEINVCART,0)      AS QTDE,'
      '             NVL(H1.SALDOVLRINVCART,0)       AS SALDO,'
      '             NVL(H1.SALDOAQUI,0)             AS MOVIMAQUI,'
      
        '             ROUND((H1.SALDOAQUI/H1.SALDOQTDEINVCART),13) AS PUC' +
        'USTO'
      '      FROM  HISTCARTINV H1'
      '      WHERE'
      '            (H1.IDCARTEIRAGERENC IS NULL)'
      '        AND (H1.IDCARTEIRAINVEST   = :IDCARTEIRAINVEST)'
      '        AND (H1.IDTIPOINVEST       = 2)'
      '        AND (NVL(H1.SALDOQTDEINVCART,0) > 0)'
      '        AND (H1.IDHISTCARTINV  IN'
      '                    ( SELECT MAX(H2.IDHISTCARTINV)'
      '                      FROM   HISTCARTINV H2'
      '                      WHERE'
      '                            (H2.IDTIPOINVEST      = 2)'
      '                        AND (H2.IDCARTEIRAGERENC IS NULL)'
      
        '                        AND (H2.IDCARTEIRAINVEST  = :IDCARTEIRAI' +
        'NVEST)'
      
        '                        AND ( (H2.DATAMOVCARTINV || H2.IDINVESTI' +
        'MENTO) IN'
      
        '                                    (SELECT (MAX(H3.DATAMOVCARTI' +
        'NV) || IDINVESTIMENTO)'
      '                                     FROM HISTCARTINV H3'
      '                                     WHERE'
      
        '                                           (H3.IDTIPOINVEST     ' +
        ' = 2)'
      
        '                                       AND (H3.IDCARTEIRAGERENC ' +
        'IS NULL)'
      
        '                                       AND (H3.IDCARTEIRAINVEST ' +
        ' = :IDCARTEIRAINVEST)'
      
        '                                       AND (TRUNC(H3.DATAMOVCART' +
        'INV) <= TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))'
      '                                     GROUP BY H3.IDINVESTIMENTO'
      '                                    )'
      '                            )'
      '                      GROUP BY H2.IDINVESTIMENTO)'
      '                    )'
      '      ORDER BY H1.IDINVESTIMENTO) CT'
      ''
      
        'WHERE TRUNC(OM.DATAORDMOVINV) BETWEEN TO_DATE(:DATA,'#39'DD/MM/YYYY'#39 +
        ') AND'
      
        '                                      TO_DATE(:DATA,'#39'DD/MM/YYYY'#39 +
        ')'
      '  AND OM.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST'
      '  AND OM.IDCARTEIRAGERENC IS NULL'
      '  AND OM.IDTIPOINVEST      = 2'
      '  AND TP.IDTIPOINVEST      = 2'
      '  AND TP.NATUREZAOPERACAO  = '#39'D'#39
      '  AND TP.IDTIPOOPERACAO    > 0'
      '  AND ((FLGOPGERENC        = '#39'N'#39') OR (FLGOPGERENC IS NULL))'
      '  AND OM.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO'
      '  AND OM.IDINVESTIMENTO    = IV.IDINVESTIMENTO(+)'
      '  AND OM.IDINVESTIMENTO    = CT.IDINVESTIMENTO(+)'
      'ORDER BY DESCINVESTIMENTO, PUORDMOVINV'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 114
    Top = 189
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
        Value = '08/11/2001'
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end>
    object qryOrdensDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 19
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryOrdensQTDEORDMOVINV: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 13
      FieldName = 'QTDEORDMOVINV'
      DisplayFormat = '###,###,###,###,##0'
    end
    object qryOrdensPUORDMOVINV: TFloatField
      DisplayLabel = 'PU~de Venda'
      DisplayWidth = 11
      FieldName = 'PUORDMOVINV'
      DisplayFormat = '###,###,##0.00'
    end
    object qryOrdensVLRVENDA: TFloatField
      DisplayLabel = 'Valor~de Venda'
      DisplayWidth = 14
      FieldName = 'VLRVENDA'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryOrdensPUCUSTO: TFloatField
      DisplayLabel = 'PU~de Custo'
      DisplayWidth = 17
      FieldName = 'PUCUSTO'
      DisplayFormat = '###,###,##0.000000000'
    end
    object qryOrdensVLRCUSTO: TFloatField
      DisplayLabel = 'Valor~de Custo'
      DisplayWidth = 14
      FieldName = 'VLRCUSTO'
      DisplayFormat = '###,###,##0.00'
    end
    object qryOrdensVARIACAO: TFloatField
      DisplayLabel = 'Variação'
      DisplayWidth = 15
      FieldName = 'VARIACAO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryOrdensDATAORDMOVINV: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAORDMOVINV'
      Visible = False
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  object dsOrdens: TwwDataSource
    AutoEdit = False
    DataSet = qryOrdens
    Left = 114
    Top = 125
  end
  object qryCarteira: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCARTEIRAINVEST, DESCCARTINVEST'
      'FROM'
      '   CARTEIRAINVEST'
      'ORDER BY DESCCARTINVEST'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 207
    Top = 190
    object qryCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
  end
  object qryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDINVESTIMENTO, DESCINVESTIMENTO'
      'FROM INVESTIMENTO'
      'WHERE IDTIPOINVEST = 2'
      'ORDER BY DESCINVESTIMENTO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 209
    Top = 127
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.IDINVESTIMENTO'
      Visible = False
    end
  end
end
