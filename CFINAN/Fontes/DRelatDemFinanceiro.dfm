inherited dtmRelatDemFinanceiro: TdtmRelatDemFinanceiro
  Left = 353
  Top = 213
  Width = 311
  Height = 158
  Caption = 'Demonstrativo da Posição Financeira'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
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
  object pplDemFinan: TppBDEPipeline
    DataSource = dsDemFinan
    UserName = 'pplDemFinan'
    Left = 181
    Top = 80
    object pplDemFinanppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplDemFinanppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODLANCFINANC'
      FieldName = 'CODLANCFINANC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplDemFinanppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplDemFinanppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODPORTADOR'
      FieldName = 'CODPORTADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplDemFinanppField5: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pplDemFinanppField6: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object pplDemFinanppField7: TppField
      FieldAlias = 'STATUSCONCILIA'
      FieldName = 'STATUSCONCILIA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object pplDemFinanppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOCONTAB'
      FieldName = 'SALDOCONTAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplDemFinanppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOCONCILIA'
      FieldName = 'SALDOCONCILIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplDemFinanppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOANA'
      FieldName = 'SALDOANA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplDemFinanppField11: TppField
      FieldAlias = 'DESCSTATUS'
      FieldName = 'DESCSTATUS'
      FieldLength = 30
      DisplayWidth = 30
      Position = 10
    end
    object pplDemFinanppField12: TppField
      FieldAlias = 'DATALANCFINAN'
      FieldName = 'DATALANCFINAN'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
  end
  object dsDemFinan: TwwDataSource
    DataSet = qryDemFinan
    Left = 111
    Top = 80
  end
  object qryDemFinan: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PE.NOME,'
      '   M.CODLANCFINANC,'
      '   M.IDPESSOA,'
      '   P.CODPORTADOR,'
      '   M.HISTORICO,'
      '   P.DESCRICAO,'
      '   M.STATUSCONCILIA,'
      '   MAX(SC.SALDO) AS SALDOCONTAB,'
      '   MAX(SX.SALDO) AS SALDOCONCILIA,'
      
        '   SUM(DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALORLANCFINAN,-M.VALORLANCFI' +
        'NAN)) AS SALDOANA,'
      
        '   DECODE(M.STATUSCONCILIA,'#39'I'#39','#39'B) VALORES A CLASSIFICAR'#39','#39'C) LA' +
        'NÇAMENTOS NÃO CONCILIADOS'#39') AS DESCSTATUS,'
      '   M.DATALANCFINAN'
      'FROM'
      '   PESSOA PE,'
      '   PORTADORCONTA P,'
      ''
      '   (SELECT'
      '       IDPESSOA,'
      '       CODLANCFINANC,'
      '       CODPORTADOR,'
      '       HISTORICO,'
      '       STATUSCONCILIA,'
      '       ENTRADASAIDA,'
      '       VALORLANCFINAN,'
      '       DATALANCFINAN'
      '    FROM'
      '       MOVIMFINANC'
      '    WHERE'
      '       (IDPESSOA = :IDPessoa) AND'
      '       (STATUSCONCILIA IN ('#39'I'#39','#39'N'#39','#39'C'#39')) AND'
      '       (DATALANCFINAN(+) <= :DataFinal)) M,'
      ''
      '   (SELECT'
      '       IDPESSOA,'
      '       CODPORTADOR,'
      
        '       SUM(DECODE(ENTRADASAIDA,'#39'E'#39',VALORLANCFINAN,-VALORLANCFINA' +
        'N)) AS SALDO'
      '    FROM'
      '       MOVIMFINANC'
      '    WHERE'
      '       (IDPESSOA = :IDPessoa) AND'
      '       (STATUSCONCILIA <> '#39'I'#39') AND'
      '       (STATUSCONCILIA <> '#39'J'#39') AND'
      '       (DATALANCFINAN <= :DataFinal)'
      '    GROUP BY IDPESSOA,CODPORTADOR) SC,'
      ''
      '   (SELECT'
      '       IDPESSOA,'
      '       CODPORTADOR,'
      
        '       SUM(DECODE(ENTRADASAIDA,'#39'E'#39',VALORLANCFINAN,-VALORLANCFINA' +
        'N)) AS SALDO'
      '    FROM'
      '       MOVIMFINANC'
      '    WHERE'
      '       (IDPESSOA = :IDPessoa) AND'
      '       (STATUSCONCILIA IN ('#39'I'#39','#39'X'#39')) AND'
      '       (DATALANCFINAN <= :DataFinal)'
      '    GROUP BY IDPESSOA,CODPORTADOR) SX'
      ''
      'WHERE'
      '   (P.IDPESSOA = PE.IDPESSOA) AND'
      
        '   ((P.CODPORTADOR = :CodPortador) OR ( :TodosBancos = '#39'Todos'#39'))' +
        ' AND'
      '   (P.CODPORTADOR = M.CODPORTADOR(+)) AND'
      '   (P.CODPORTADOR = SC.CODPORTADOR(+)) AND'
      '   (P.CODPORTADOR = SX.CODPORTADOR(+))'
      'GROUP BY'
      '   PE.NOME,'
      '   M.STATUSCONCILIA,'
      '   M.CODLANCFINANC,'
      '   M.IDPESSOA,'
      '   P.CODPORTADOR,'
      '   M.HISTORICO,'
      '   P.DESCRICAO,'
      '   M.DATALANCFINAN'
      'ORDER BY'
      '   PE.NOME,'
      '   P.DESCRICAO,'
      '   DESCSTATUS,'
      '   M.STATUSCONCILIA,'
      '   M.HISTORICO')
    ValidateWithMask = True
    Left = 34
    Top = 80
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DataFinal'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DataFinal'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DataFinal'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CodPortador'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TodosBancos'
        ParamType = ptInput
      end>
  end
  object rpDemFinan: TppReport
    AutoStop = False
    DataPipeline = pplDemFinan
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpDemFinanBeforePrint
    DeviceType = 'Screen'
    Left = 250
    Top = 80
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Desmonstrativo da Posição Financeira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 61648
        mmTop = 8731
        mmWidth = 78052
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84931
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object DBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'HISTORICO'
        DataPipeline = pplDemFinan
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 6085
        mmTop = 265
        mmWidth = 123561
        BandType = 4
      end
      object dbtValor: TppDBText
        OnPrint = dbtValorPrint
        UserName = 'dbtValor'
        AutoSize = True
        DataField = 'SALDOANA'
        DataPipeline = pplDemFinan
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 265
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText9'
        DataField = 'DATALANCFINAN'
        DataPipeline = pplDemFinan
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 133615
        mmTop = 265
        mmWidth = 24871
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
        mmWidth = 197300
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
        mmWidth = 197909
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
        mmTop = 3175
        mmWidth = 197380
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      BeforePrint = ppSummaryBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = pplDemFinan
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object DBText7: TppDBText
          UserName = 'DBText7'
          AutoSize = True
          DataField = 'NOME'
          DataPipeline = pplDemFinan
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5292
          mmLeft = 92340
          mmTop = 265
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object pplDataFinal: TppLabel
          OnPrint = pplDataFinalPrint
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Data Final:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 133350
          mmTop = 794
          mmWidth = 60590
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
      BreakName = 'DESCRICAO'
      DataPipeline = pplDemFinan
      KeepTogether = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 17463
        mmPrintPosition = 0
        object DBText6: TppDBText
          UserName = 'DBText6'
          AutoSize = True
          DataField = 'SALDOCONTAB'
          DataPipeline = pplDemFinan
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 165629
          mmTop = 9790
          mmWidth = 27517
          BandType = 3
          GroupNo = 1
        end
        object Line4: TppLine
          UserName = 'Line4'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 8202
          mmWidth = 197380
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'ppLabel2'
          Caption = 'A) SALDO JÁ CONTABILIZADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 9790
          mmWidth = 52917
          BandType = 3
          GroupNo = 1
        end
        object DBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'DESCRICAO'
          DataPipeline = pplDemFinan
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5292
          mmLeft = 86519
          mmTop = 2117
          mmWidth = 25135
          BandType = 3
          GroupNo = 1
        end
        object ppLine3: TppLine
          UserName = 'ppLine1'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 794
          mmWidth = 197380
          BandType = 3
          GroupNo = 1
        end
        object Line3: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 15875
          mmWidth = 197380
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 16404
        mmPrintPosition = 0
        object Line5: TppLine
          UserName = 'Line5'
          Weight = 0.75
          mmHeight = 2117
          mmLeft = 0
          mmTop = 794
          mmWidth = 197380
          BandType = 5
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'ppLabel3'
          Caption = 'D) SALDO CONCILIADO (A + B - C)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 2381
          mmWidth = 58738
          BandType = 5
          GroupNo = 1
        end
        object DBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'SALDOCONCILIA'
          DataPipeline = pplDemFinan
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 163777
          mmTop = 2381
          mmWidth = 29369
          BandType = 5
          GroupNo = 1
        end
        object ppLine4: TppLine
          UserName = 'ppLine2'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 7938
          mmWidth = 197380
          BandType = 5
          GroupNo = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'E) SALDO REAL (A + B)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 9525
          mmWidth = 39952
          BandType = 5
          GroupNo = 1
        end
        object ppLine5: TppLine
          UserName = 'Line6'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 15081
          mmWidth = 197380
          BandType = 5
          GroupNo = 1
        end
        object pplSaldoReal: TppLabel
          OnPrint = pplSaldoRealPrint
          UserName = 'lSaldoReal'
          Caption = 'Valor do Saldo Real'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 159279
          mmTop = 9790
          mmWidth = 33602
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'STATUSCONCILIA'
      DataPipeline = pplDemFinan
      KeepTogether = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand3BeforePrint
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object DBDescStatus: TppDBText
          UserName = 'DBDescStatus'
          AutoSize = True
          DataField = 'DESCSTATUS'
          DataPipeline = pplDemFinan
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 1058
          mmWidth = 24077
          BandType = 3
          GroupNo = 2
        end
        object ppLabel7: TppLabel
          UserName = 'ppLabel4'
          Caption = 'Status:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 95250
          mmTop = 1058
          mmWidth = 11906
          BandType = 3
          GroupNo = 2
        end
        object DBText8: TppDBText
          UserName = 'DBText8'
          AutoSize = True
          DataField = 'STATUSCONCILIA'
          DataPipeline = pplDemFinan
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 109273
          mmTop = 1058
          mmWidth = 31485
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLabel5: TppLabel
          UserName = 'ppLabel5'
          Caption = 'SUB-TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 95250
          mmTop = 1058
          mmWidth = 20638
          BandType = 5
          GroupNo = 2
        end
        object DBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          AutoSize = True
          DataField = 'SALDOANA'
          DataPipeline = pplDemFinan
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 160073
          mmTop = 1058
          mmWidth = 33073
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
end
