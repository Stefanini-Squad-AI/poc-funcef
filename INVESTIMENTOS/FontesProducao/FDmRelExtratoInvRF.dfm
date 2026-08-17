inherited DmRelExtratoInvRF: TDmRelExtratoInvRF
  Left = 212
  Top = 178
  Width = 219
  Height = 252
  Caption = 'DmRelExtratoInvRF'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 133
    Top = 8
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
    Left = 135
    Top = 8
  end
  inherited qryExemplo: TwwQuery
    Left = 130
    Top = 8
  end
  inherited rpExemplo: TppReport
    Left = 130
    Top = 8
  end
  object rptHistInvRenFix: TppReport
    AutoStop = False
    DataPipeline = pplMovimento
    OnStartPage = rptHistInvRenFixStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Histórico dos Investimentos de Renda Fixa'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 34
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        mmHeight = 5027
        mmLeft = 0
        mmTop = 24077
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Histórico de Investimentos de Renda Fixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 103452
        mmTop = 15081
        mmWidth = 84138
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
        mmHeight = 5556
        mmLeft = 529
        mmTop = 8731
        mmWidth = 283105
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label2'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 46302
        mmTop = 24606
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label4'
        Caption = 'Saldo Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 223309
        mmTop = 24606
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label7'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 208757
        mmTop = 24606
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label8'
        Caption = 'Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 66939
        mmTop = 24606
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 168011
        mmTop = 24606
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Saldo Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 254265
        mmTop = 24606
        mmWidth = 29104
        BandType = 0
      end
      object dbiLogoEmpresa: TppDBImage
        UserName = 'dbiLogoEmpresa'
        DirectDraw = True
        MaintainAspectRatio = True
        ShiftWithParent = True
        Stretch = True
        Transparent = True
        DataField = 'IMAGEM'
        DataPipeline = dtmOperComum.pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 23548
        mmLeft = 1323
        mmTop = 0
        mmWidth = 26194
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 46038
        mmTop = 0
        mmWidth = 238390
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DATAHISTORICO'
        DataPipeline = pplMovimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 46302
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'HISTMOVRENFIX'
        DataPipeline = pplMovimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 66939
        mmTop = 0
        mmWidth = 92604
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'QUANTIDADE'
        DataPipeline = pplMovimento
        DisplayFormat = '###,###,###,##0.#########'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 162190
        mmTop = 0
        mmWidth = 24606
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'VALOR'
        DataPipeline = pplMovimento
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 191030
        mmTop = 0
        mmWidth = 26458
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'SALDOQTD'
        DataPipeline = pplMovimento
        DisplayFormat = '###,###,###,##0.#########'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 222780
        mmTop = 0
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'SALDOVALOR'
        DataPipeline = pplMovimento
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 254530
        mmTop = 0
        mmWidth = 29104
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
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
        mmWidth = 283898
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
        mmLeft = 265
        mmTop = 2910
        mmWidth = 284163
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
        mmLeft = 258763
        mmTop = 3175
        mmWidth = 25400
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCINVESTIMENTO'
      DataPipeline = pplMovimento
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object grpCabInvestimento: TppGroupHeaderBand
        BeforePrint = grpCabInvestimentoBeforePrint
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          mmHeight = 3969
          mmLeft = 0
          mmTop = 0
          mmWidth = 284428
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          Caption = 'Investimento: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 2381
          mmTop = 0
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DESCINVESTIMENTO'
          DataPipeline = pplMovimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 26988
          mmTop = 0
          mmWidth = 91281
          BandType = 3
          GroupNo = 0
        end
      end
      object grpRodInvestimento: TppGroupFooterBand
        BeforePrint = grpRodInvestimentoBeforePrint
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object lblTotSaldoQtdInvest: TppLabel
          UserName = 'lblTotSaldoQtdInvest'
          Caption = 'lblTotSaldoQtdInvest'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 219869
          mmTop = 0
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object lblTotSaldoVlrInvest: TppLabel
          UserName = 'lblTotSaldoVlrInvest'
          Caption = 'lblTotSaldoVlrInvest'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 254530
          mmTop = 0
          mmWidth = 28575
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DATAPLICACAO'
      DataPipeline = pplMovimento
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object grpCabDataAplic: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          Brush.Color = clSilver
          mmHeight = 3969
          mmLeft = 26988
          mmTop = 0
          mmWidth = 257440
          BandType = 3
          GroupNo = 1
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Aplicação: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 27252
          mmTop = 0
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'DATAPLICACAO'
          DataPipeline = pplMovimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 46302
          mmTop = 0
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
      end
      object grpRodDataAplic: TppGroupFooterBand
        AfterPrint = grpRodDataAplicAfterPrint
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object pplMovimento: TppBDEPipeline
    DataSource = dsMovimento
    UserName = 'lMovimento'
    Left = 32
    Top = 64
  end
  object dsMovimento: TwwDataSource
    AutoEdit = False
    DataSet = qryMovimento
    Left = 37
    Top = 112
  end
  object qryMovimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IV.DESCINVESTIMENTO, HS.HISTMOVRENFIX, HS.DATAHISTRENFIX ' +
        'AS DATAHISTORICO,'
      '       OP.DATAOPERACAO AS DATAPLICACAO,'
      
        '       DECODE(PI.IDCLASSETIT,IV.IDCLASSETIT, NULL, HS.QTDHISTREN' +
        'FIX) AS QUANTIDADE,'
      '       HS.VLRHISTRENFIX AS VALOR,'
      
        '       DECODE(PI.IDCLASSETIT,IV.IDCLASSETIT, NULL, HS.SALDOQTDHI' +
        'STRENFI) AS SALDOQTD,'
      '       HS.SALDOVLRHISTRENFI AS SALDOVALOR,'
      '       HS.NATURMOVHISTRENFI, HS.IDINVESTIMENTO'
      ''
      
        'FROM HISTRENFIX HS, INVESTIMENTO IV, OPERRENFIX OP, PARAMINVEST ' +
        'PI'
      ''
      'WHERE (((:IDINVESTIMENTO IS NOT NULL)                        AND'
      '        (HS.IDINVESTIMENTO = :IDINVESTIMENTO))               OR'
      
        '       (:IDINVESTIMENTO IS NULL))                               ' +
        '    AND'
      '      (((:IDCARTEIRAINVEST IS NOT NULL)                      AND'
      '        (HS.IDCARTEIRAINVEST = :IDCARTEIRAINVEST))           OR'
      
        '       (:IDCARTEIRAINVEST IS NULL))                             ' +
        '    AND'
      '      (((:IDEMISSOR IS NOT NULL)                             AND'
      '        (IV.IDEMISSOR = :IDEMISSOR))                         OR'
      
        '       (:IDEMISSOR IS NULL))                                    ' +
        '    AND'
      '      DATAHISTRENFIX BETWEEN TO_DATE(:DATAINI, '#39'DD/MM/YYYY'#39') AND'
      
        '                             TO_DATE(:DATAFIM, '#39'DD/MM/YYYY'#39')    ' +
        '    AND'
      
        '      HS.IDINVESTIMENTO = IV.IDINVESTIMENTO                     ' +
        '    AND'
      '      HS.IDOPERRENFIX = OP.IDOPERRENFIX'
      ''
      'ORDER BY DESCINVESTIMENTO, HS.IDOPERRENFIXAPLIC, DATAHISTRENFIX'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 37
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
        Value = 2345
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
        Value = '01/08/2001'
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
        Value = '05/08/2001'
      end>
    object qryMovimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryMovimentoHISTMOVRENFIX: TStringField
      DisplayLabel = 'Movimentação'
      DisplayWidth = 50
      FieldName = 'HISTMOVRENFIX'
      Size = 60
    end
    object qryMovimentoDATAHISTORICO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAHISTORICO'
    end
    object qryMovimentoDATAPLICACAO: TDateTimeField
      DisplayLabel = 'Aplicação'
      DisplayWidth = 10
      FieldName = 'DATAPLICACAO'
    end
    object qryMovimentoQUANTIDADE: TStringField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'QUANTIDADE'
      Size = 40
    end
    object qryMovimentoVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALOR'
    end
    object qryMovimentoSALDOQTD: TStringField
      DisplayLabel = 'Saldo Quantidade'
      DisplayWidth = 18
      FieldName = 'SALDOQTD'
      Size = 40
    end
    object qryMovimentoSALDOVALOR: TFloatField
      DisplayLabel = 'Saldo Valor'
      DisplayWidth = 18
      FieldName = 'SALDOVALOR'
    end
    object qryMovimentoNATURMOVHISTRENFI: TStringField
      DisplayWidth = 1
      FieldName = 'NATURMOVHISTRENFI'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryMovimentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
  end
  object QRTextFilter1: TQRTextFilter
    Left = 136
    Top = 64
  end
  object qryGrafico: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      
        'SELECT (IV.DESCINVESTIMENTO || '#39' - '#39' || TO_CHAR(OP.DATAOPERACAO,' +
        #39'DD/MM/YYYY'#39')) AS INVESTIMENTO,'
      '       HS.DATAHISTRENFIX,'
      '       SUM(HS.SALDOVLRHISTRENFI) AS SALDO,'
      
        '       HS.IDINVESTIMENTO, TO_CHAR(OP.DATAOPERACAO,'#39'DD/MM/YYYY'#39') ' +
        'AS DATAOPERACAO'
      ''
      'FROM HISTRENFIX HS, INVESTIMENTO IV, OPERRENFIX OP'
      ''
      'WHERE HS.IDINVESTIMENTO = IV.IDINVESTIMENTO AND'
      '      HS.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX AND'
      
        '      (HS.DATAHISTRENFIX BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') ' +
        ' AND'
      '                                 TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      
        'GROUP BY DESCINVESTIMENTO, HS.IDINVESTIMENTO, DATAOPERACAO, DATA' +
        'HISTRENFIX'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 136
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
        Value = '12/06/2001'
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
        Value = '12/07/2001'
      end>
    object qryGraficoINVESTIMENTO: TStringField
      FieldName = 'INVESTIMENTO'
      Size = 73
    end
    object qryGraficoDATAHISTRENFIX: TDateTimeField
      FieldName = 'DATAHISTRENFIX'
    end
    object qryGraficoSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object qryGraficoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryGraficoDATAOPERACAO: TStringField
      FieldName = 'DATAOPERACAO'
      Size = 10
    end
  end
  object dsGrafico: TwwDataSource
    AutoEdit = False
    DataSet = qryGrafico
    Left = 136
    Top = 112
  end
end
