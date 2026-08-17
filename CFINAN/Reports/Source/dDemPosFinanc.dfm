inherited dtmDemPosFinanc: TdtmDemPosFinanc
  Left = 338
  Top = 232
  Width = 379
  Height = 329
  Caption = 'dtmDemPosFinanc'
  PixelsPerInch = 96
  TextHeight = 13
  inherited rpExemplo: TppReport
    OnEndPage = rpExemploEndPage
    OnStartPage = rpExemploStartPage
    Left = 234
    Top = 8
    DataPipelineName = 'pplExemplo'
    inherited HeaderBand1: TppHeaderBand
      mmHeight = 33867
      inherited Line1: TppLine [0]
      end
      inherited Label11: TppLabel [1]
        Caption = 'Demonstrativo da posição financeira'
        Font.Style = [fsItalic]
        mmLeft = 66675
        mmWidth = 68792
      end
      inherited LblEmpresa: TppLabel
        mmLeft = 84667
        mmWidth = 28310
      end
      object ppLine1: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 32544
        mmWidth = 197300
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 23019
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'lbPortadorForma'
        Caption = 'PORTADORFORMA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 78846
        mmTop = 17463
        mmWidth = 39423
        BandType = 0
      end
      object lbData: TppLabel
        UserName = 'Label1'
        Caption = 'Data Final:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 529
        mmTop = 27517
        mmWidth = 19844
        BandType = 0
      end
    end
    inherited DetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmHeight = 10848
      object ppShape1: TppShape
        UserName = 'shpLinhaDest'
        ParentWidth = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 1058
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'STATUS'
        DataPipeline = pplExemplo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplExemplo'
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 1852
        mmWidth = 64029
        BandType = 4
      end
      object ppSubReport2: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplDetalhe'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 7144
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplDetalhe
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 192
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplDetalhe'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 3175
            mmPrintPosition = 0
          end
          object ppDetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              DataField = 'HISTORICO'
              DataPipeline = pplDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplDetalhe'
              mmHeight = 3175
              mmLeft = 27517
              mmTop = 529
              mmWidth = 102659
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              DataField = 'DATALANCFINAN'
              DataPipeline = pplDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplDetalhe'
              mmHeight = 3175
              mmLeft = 8996
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'TOTAL'
              DataPipeline = pplDetalhe
              DisplayFormat = '#,##0.00;(#,##0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplDetalhe'
              mmHeight = 3175
              mmLeft = 134144
              mmTop = 529
              mmWidth = 24077
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'TOTALOM'
              DataPipeline = pplDetalhe
              DisplayFormat = '#,##0.00;(#,##0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplDetalhe'
              mmHeight = 3175
              mmLeft = 169334
              mmTop = 529
              mmWidth = 24077
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 5556
            mmPrintPosition = 0
            object ppLine3: TppLine
              UserName = 'Line1'
              Weight = 0.75
              mmHeight = 3969
              mmLeft = 8996
              mmTop = 794
              mmWidth = 187590
              BandType = 7
            end
          end
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'STATUS'
      DataPipeline = pplExemplo
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplExemplo'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8202
        mmPrintPosition = 0
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Moeda Corrente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 137584
          mmTop = 4233
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Outra Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 177271
          mmTop = 4233
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'TOTAL'
          DataPipeline = pplExemplo
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplExemplo'
          mmHeight = 3969
          mmLeft = 140759
          mmTop = 265
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'TOTALOM'
          DataPipeline = pplExemplo
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplExemplo'
          mmHeight = 3969
          mmLeft = 176477
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object SqlMestre: TCMSqlParams
    SQL.Strings = (
      ' -- Qry Total Conciliado'
      '  SELECT'
      '      '#39'A) Lançamentos Conciliados'#39' AS STATUS,'
      '      '#39'X'#39' AS STATUSCONCILIA,'
      
        '      NVL(SUM(DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALORLANCFINAN,M.VALOR' +
        'LANCFINAN * -1)),0)   AS TOTAL,'
      
        '      NVL(SUM(DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALOROUTRAMOEDA,M.VALO' +
        'ROUTRAMOEDA * -1)),0) AS TOTALOM'
      ''
      '  FROM'
      '      MOVIMFINANC M'
      '  WHERE'
      '     (M.DATALANCFINAN <= :DATAFINAL) AND'
      '     (M.STATUSCONCILIA = '#39'X'#39')        AND'
      '     (M.CODPORTADOR    = :CODPORTADOR)'
      ''
      '  UNION'
      ''
      ''
      ' -- Qry Total Não-Identificado'
      '  SELECT'
      '     '#39'B) Lançamentos Não-Identificados'#39' AS STATUS,'
      '     '#39'I'#39' AS STATUSCONCILIA,'
      
        '      NVL(SUM(DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALORLANCFINAN,M.VALOR' +
        'LANCFINAN * -1)),0)   AS TOTAL,'
      
        '      NVL(SUM(DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALOROUTRAMOEDA,M.VALO' +
        'ROUTRAMOEDA * -1)),0) AS TOTALOM'
      ''
      '  FROM'
      '      MOVIMFINANC M'
      '  WHERE'
      '     (M.DATALANCFINAN <= :DATAFINAL) AND'
      '     (M.STATUSCONCILIA = '#39'I'#39')        AND'
      '     (M.CODPORTADOR    = :CODPORTADOR)'
      ''
      ''
      '  UNION'
      ''
      ' -- Qry Total Não-Conciliados'
      '  SELECT'
      '     '#39'C) Lançamentos Não-Conciliados'#39' AS STATUS,'
      '     '#39'N'#39' AS STATUSCONCILIA,'
      
        '      NVL(SUM(DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALORLANCFINAN,M.VALOR' +
        'LANCFINAN * -1)),0)   AS TOTAL,'
      
        '      NVL(SUM(DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALOROUTRAMOEDA,M.VALO' +
        'ROUTRAMOEDA * -1)),0) AS TOTALOM'
      ''
      '  FROM'
      '      MOVIMFINANC M'
      '  WHERE'
      '     (M.DATALANCFINAN <= :DATAFINAL) AND'
      '     (M.STATUSCONCILIA = '#39'N'#39')        AND'
      '     (M.CODPORTADOR    = :CODPORTADOR)'
      ''
      '  UNION'
      ''
      ''
      '   -- Qry Total Na Casa'
      '  SELECT'
      '     '#39'D) Lançamentos Na Casa'#39' AS STATUS,'
      '     '#39'C'#39' AS STATUSCONCILIA,'
      
        '      NVL(SUM(DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALORLANCFINAN,M.VALOR' +
        'LANCFINAN * -1)),0)   AS TOTAL,'
      
        '      NVL(SUM(DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALOROUTRAMOEDA,M.VALO' +
        'ROUTRAMOEDA * -1)),0) AS TOTALOM'
      ''
      '  FROM'
      '      MOVIMFINANC M'
      '  WHERE'
      '     (M.DATALANCFINAN <= :DATAFINAL) AND'
      '     (M.STATUSCONCILIA = '#39'C'#39')        AND'
      '     (M.CODPORTADOR    = :CODPORTADOR)'
      ''
      '  UNION'
      ''
      ''
      '  -- Qry Saldo Conciliado'
      ' SELECT'
      '      '#39'E) Saldo Não-Conciliado (C + D)'#39' AS STATUS,'
      '      '#39' '#39' AS STATUSCONCILIA,'
      
        '      NVL(SUM(DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALORLANCFINAN,M.VALOR' +
        'LANCFINAN * -1)),0)   AS TOTAL,'
      
        '      NVL(SUM(DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALOROUTRAMOEDA,M.VALO' +
        'ROUTRAMOEDA * -1)),0) AS TOTALOM'
      ''
      ' FROM'
      '      MOVIMFINANC M'
      ' WHERE'
      '     (M.DATALANCFINAN <= :DATAFINAL) AND'
      '     (M.STATUSCONCILIA IN ('#39'N'#39','#39'C'#39')) AND'
      '     (M.CODPORTADOR    = :CODPORTADOR)'
      ''
      ' UNION'
      ''
      '   -- Qry Saldo Conciliado'
      '  SELECT'
      '      '#39'F) Saldo Conciliado (A + B)'#39' AS STATUS,'
      '      '#39' '#39' AS STATUSCONCILIA,'
      
        '      NVL(SUM(DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALORLANCFINAN,M.VALOR' +
        'LANCFINAN * -1)),0)   AS TOTAL,'
      
        '      NVL(SUM(DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALOROUTRAMOEDA,M.VALO' +
        'ROUTRAMOEDA * -1)),0) AS TOTALOM'
      ''
      '  FROM'
      '      MOVIMFINANC M'
      '  WHERE'
      '     (M.DATALANCFINAN <= :DATAFINAL) AND'
      '     (M.STATUSCONCILIA IN ('#39'I'#39','#39'X'#39')) AND'
      '     (M.CODPORTADOR    = :CODPORTADOR)'
      ''
      '  UNION'
      ''
      ''
      '  -- Qry Saldo Real'
      '  SELECT'
      '      '#39'G) Saldo Real (A + B + C + D)'#39' AS STATUS,'
      '      '#39' '#39' AS STATUSCONCILIA,'
      
        '      NVL(SUM(DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALORLANCFINAN,M.VALOR' +
        'LANCFINAN * -1)),0)   AS TOTAL,'
      
        '      NVL(SUM(DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALOROUTRAMOEDA,M.VALO' +
        'ROUTRAMOEDA * -1)),0) AS TOTALOM'
      ''
      '  FROM'
      '      MOVIMFINANC M'
      '  WHERE'
      '     (M.DATALANCFINAN <= :DATAFINAL)         AND'
      '     (M.STATUSCONCILIA IN ('#39'I'#39','#39'X'#39','#39'N'#39','#39'C'#39')) AND'
      '     (M.CODPORTADOR    = :CODPORTADOR)'
      ''
      ''
      ' '
      ' '
      ' ')
    ClientDataSet = CdsMestre
    Left = 328
    Top = 208
  end
  object CdsMestre: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 248
    Data = {
      8A0100009619E0BD010000001800000003000700000003000000600006535441
      545553010049000000010005574944544802000200200005544F54414C080004
      000000000007544F54414C4F4D08000400000000000100044C43494404000100
      1608000000001A417D204C616EE7616D656E746F7320436F6E63696C6961646F
      731F85EB51B8B79A400000000000000000001420427D204C616EE7616D656E74
      6F73204EE36F2D4964656E746966696361646F7300001E437D204C616EE7616D
      656E746F73204EE36F2D436F6E63696C6961646F731F85EB51B8B79AC0000000
      0000000000001416447D204C616EE7616D656E746F73204E6120436173610000
      1F457D2053616C646F204EE36F2D436F6E63696C6961646F202843202B204429
      1F85EB51B8B79AC0000000000000000000001B467D2053616C646F20436F6E63
      696C6961646F202841202B2042291F85EB51B8B79A4000000000000000000000
      1D467D2053616C646F205265616C202841202B2042202B2043202B2044290000
      0000000000000000000000000000}
  end
  object SqlDetalhe: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   M.STATUSCONCILIA,'
      '   M.HISTORICO,'
      '   M.DATALANCFINAN,'
      
        '   DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALORLANCFINAN,M.VALORLANCFINAN  ' +
        ' * -1) AS TOTAL,'
      
        '   DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALOROUTRAMOEDA,M.VALOROUTRAMOEDA' +
        ' * -1) AS TOTALOM'
      ''
      ''
      'FROM'
      '   MOVIMFINANC M'
      '   '
      'WHERE'
      '   (M.CODPORTADOR = :CODPORTADOR)  AND'
      '   '
      '   -- Somente os Não-Identificados(I) e Não-Conciliados(N)'
      '   (M.STATUSCONCILIA IN ('#39'I'#39','#39'N'#39','#39'C'#39')) AND'
      '   (M.DATALANCFINAN <= :DATAFINAL)'
      ''
      'ORDER BY'
      '   M.DATALANCFINAN, M.HISTORICO   '
      ' ')
    ClientDataSet = CdsDetalhe
    Left = 104
    Top = 208
  end
  object CdsDetalhe: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 248
    Data = {
      C50D00009619E0BD010000001800000005003400000003000000CE000E535441
      545553434F4E43494C494101004900000002000753554254595045020049000A
      004669786564436861720005574944544802000200010009484953544F524943
      4F0100490000000100055749445448020002003C000D444154414C414E434649
      4E414E080008000000000005544F54414C080004000000000007544F54414C4F
      4D080004000000000002000D44454641554C545F4F5244455202008200020000
      0003000200044C4349440400010016080000000000014E16504147544F205441
      524946412042414E43C1524941200000D849DAB9CC4200000000000020C00000
      000000000000000000014E19504147544F2043504D462041444D494E49535452
      415449564F00003470DFB9CC42AE47E17A14C483C00000000000000000000000
      014E20504147544F20454C455452D44E49434F205354502E303639204E2E2035
      3337350000B2CF1FBACC42AE47E17AE93413C10000000000000000000000014E
      3C5472616E73666572EA6E6369612041424E20414D524F205245414C2D41472E
      56494C4120313031323030382D3820706172612042414E455350412D410000B2
      CF1FBACC4200000000B04113410000000000000000000000014E0A504147544F
      2043504D4600003C8927BACC425C8FC2F528AF92C00000000000000000000000
      014E15504147544F205441524946412042414E43C152494100006A1C2ABACC42
      00000000000020C00000000000000000000000014E0A504147544F2043504D46
      00007E8F39BACC42B81E85EB51B89EBF0000000000000000000000014E3B5041
      47544F20454C455452D44E49434F205354502E303639204E2E20353439362072
      65662E20646F632E2031303131303438322042414E455350410000160F6DBACC
      42713D0AD73D5604C10000000000000000000000014E3C5472616E73666572EA
      6E6369612041424E20414D524F205245414C2D41472E56494C41203130313230
      30382D3820706172612042414E455350412D410000160F6DBACC4200000000C0
      6204410000000000000000000000014E0A504147544F2043504D460000FCEE79
      BACC42CDCCCCCCCCC883C00000000000000000000000014E15504147544F2054
      41524946412042414E43C15249410000FCEE79BACC4200000000000020C00000
      000000000000000000014E3B504147544F20454C455452D44E49434F20535450
      2E303639204E2E2035353836207265662E20646F632E20313031323434383220
      42414E455350410000C8AE93BACC42295C8FC27F5D0EC1000000000000000000
      0000014E3C5472616E73662E2041424E20414D524F205245414C2D41472E5649
      4C41203120706172612042414E455350412D41472E20412E504549584F544F20
      310000C8AE93BACC420000000080840E410000000000000000000000014E0A50
      4147544F2043504D4600000AB5A5BACC4200000000008A8DC000000000000000
      00000000014E3B504147544F20454C455452D44E49434F205354502E30363920
      4E2E2035363534207265662E20646F632E2031303132373438322042414E4553
      504100004CBBB7BACC42C3F5285C279F03C10000000000000000000000014E3C
      5472616E73666572EA6E6369612041424E20414D524F205245414C2D41472E56
      494C4120313031323030382D3820706172612042414E455350412D4100004CBB
      B7BACC420000000040A703410000000000000000000000014E0A504147544F20
      43504D4600008EC1C9BACC4215AE47E17A1683C0000000000000000000000001
      4E24504147544F205441524946412042414E43C1524941204D414E5554454EC7
      414F20432F4300008EC1C9BACC4200000000000020C000000000000000000000
      00014E0A504147544F2043504D460000D0C7DBBACC42B81E85EB51B89EBF0000
      000000000000000000014E3B504147544F20454C455452D44E49434F20535450
      2E303639204E2E2035373734207265662E20646F632E20313031343334383220
      42414E4553504100003AB40CBBCC42713D0AD72F3306C1000000000000000000
      0000014E3C5472616E73662E2041424E20414D524F205245414C2D41472E5649
      4C41203120706172612042414E455350412D41472E20412E504549584F544F20
      3100003AB40CBBCC4200000000C05606410000000000000000000000014E2950
      4147544F205441524946412042414E43C1524941202D204D414E5554454EC7C3
      4F20444120432F4300004E271CBBCC4200000000000020C00000000000000000
      000000014E0A504147544F2043504D460000D8E023BBCC42CDCCCCCCCC9885C0
      0000000000000000000000014E33504147544F20454C455452D44E49434F204E
      2E2035393235207265662E20646F632E2031303135363438322042414E455350
      410000706057BBCC420AD7A370BD2007C10000000000000000000000014E3C54
      72616E73662E2041424E20414D524F205245414C2D41472E56494C4120312070
      6172612042414E455350412D41472E20412E504549584F544F20310000706057
      BBCC4200000000803107410000000000000000000000014E22504147544F2054
      41524946412042414E43C1524941202D204D414E55542E20435C430000B26669
      BBCC4200000000000020C00000000000000000000000014E0A504147544F2043
      504D460000E0F96BBBCC4252B81E85EB7F86C00000000000000000000000014E
      33504147544F20454C455452D44E49434F204E2E2036303330207265662E2064
      6F632E2031303137333438322042414E45535041000078799FBBCC42F6285C8F
      10DE06C10000000000000000000000014E3C5472616E73662E2041424E20414D
      524F205245414C2D41472E56494C41203120706172612042414E455350412D41
      472E20412E504549584F544F2031000078799FBBCC4200000000803107410000
      000000000000000000014E26504147544F205441524946412042414E43C15249
      41202D204D414E5554454EC7414F20432F4300008CECAEBBCC42000000000000
      20C00000000000000000000000014E0A504147544F2043504D460000E812B4BB
      CC42D7A3703D0A3F86C00000000000000000000000014E33504147544F20454C
      455452D44E49434F204E2E2036313631207265662E20646F632E203130313835
      3438322042414E4553504100006672F4BBCC42E17A14AEA5CE0AC10000000000
      000000000000014E3C5472616E73662E2041424E20414D524F205245414C2D41
      472E56494C41203120706172612042414E455350412D41472E20412E50454958
      4F544F203100006672F4BBCC420000000020AC0A410000000000000000000000
      014E28504147544F205441524946412042414E43C1524941202D204D414E5554
      454E43414F20444120434300001EBFFEBBCC4200000000000020C00000000000
      000000000000014E0A504147544F2043504D46000032320EBCCC425C8FC2F528
      148AC00000000000000000000000014E33504147544F20454C455452D44E4943
      4F204E2E2036333034207265662E20646F632E2031303139383438322042414E
      455350410000CAB141BCCC423E0AD7A3DE7206C1000000000000000000000001
      4E3C5472616E73662E2041424E20414D524F205245414C2D41472E56494C4120
      3120706172612042414E455350412D41472E20412E504549584F544F20310000
      CAB141BCCC4200000000409506410000000000000000000000014E2C50414754
      4F205441524946412042414E43C1524941202D204D414E55542E434F4E544120
      434F5252454E54450000B0914EBCCC4200000000000020C00000000000000000
      000000014E0A504147544F2043504D4600003A4B56BCCC421F85EB51B8D685C0
      0000000000000000000000014E18504147544F20454C455452D44E49434F204E
      2E20363431390000005E8CBCCC423E0AD7A3000F0BC100000000000000000000
      00014E3C5472616E73662E2041424E20414D524F205245414C2D41472E56494C
      41203120706172612042414E455350412D41472E20412E504549584F544F2031
      0000005E8CBCCC420000000080190B410000000000000000000000014E155041
      47544F205441524946412042414E43C15249410000E63D99BCCC420000000000
      0020C00000000000000000000000014E0A504147544F2043504D46000042649E
      BCCC42CDCCCCCCCC528AC00000000000000000000000014E15504147544F2054
      41524946412042414E43C152494100007810E9BCCC4200000000000020C00000
      000000000000000000014E0A504147544F2043504D4600008C83F8BCCC42B81E
      85EB51B89EBF0000000000000000000000014E1F504147544F20544152494641
      2042414E43C1524941204D414E555420432F4300000AE338BDCC420000000000
      0020C00000000000000000000000014E0A504147544F2043504D460000949C40
      BDCC42B81E85EB51B89EBF0000000000000000000000014E15504147544F2054
      41524946412042414E43C152494100006E2286BDCC4200000000000020C00000
      000000000000000000014E0A504147544F2043504D4600009CB588BDCC42B81E
      85EB51B89EBF0000000000000000000000014E1B504147544F20544152494641
      2042414E43C152494120444F432052000048A8CBBDCC4200000000000022C000
      00000000000000000000014E3C5472616E73662E2042414E455350412D41472E
      20412E504549584F544F2031207061726120425241444553434F2D41472E2041
      2E504549584F544F20000048A8CBBDCC42B81E85EB51147EC000000000000000
      00000000014E0A504147544F2043504D460000A4CED0BDCC42B81E85EB51B89E
      BF0000000000000000}
  end
  object pplDetalhe: TppBDEPipeline
    DataSource = dsDetalhe
    UserName = 'lDetalhe'
    Left = 56
    Top = 256
    object pplDetalheppField1: TppField
      FieldAlias = 'STATUSCONCILIA'
      FieldName = 'STATUSCONCILIA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplDetalheppField2: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplDetalheppField3: TppField
      FieldAlias = 'DATALANCFINAN'
      FieldName = 'DATALANCFINAN'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object pplDetalheppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplDetalheppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALOM'
      FieldName = 'TOTALOM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
  end
  object dsDetalhe: TwwDataSource
    DataSet = CdsDetalhe
    Left = 64
    Top = 216
  end
  object rptDemonst: TppReport
    AutoStop = False
    DataPipeline = pplMestre
    OnEndPage = rpExemploEndPage
    OnStartPage = rpExemploStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 186
    Top = 144
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplMestre'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 44450
      mmPrintPosition = 0
      object ppLine4: TppLine
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
        UserName = 'Label11'
        Caption = 'Demonstrativo da Posição Financeira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 65617
        mmTop = 8731
        mmWidth = 70644
        BandType = 0
      end
      object ppLabel5: TppLabel
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
        mmLeft = 84667
        mmTop = 1588
        mmWidth = 28310
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 38365
        mmWidth = 197300
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 23019
        mmWidth = 197300
        BandType = 0
      end
      object lbPortador: TppLabel
        UserName = 'lbPortadorForma'
        Caption = 'PORTADORFORMA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 78846
        mmTop = 17463
        mmWidth = 39423
        BandType = 0
      end
      object lbDataFinal: TppLabel
        UserName = 'Label1'
        Caption = 'Data Final:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 529
        mmTop = 33338
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label3'
        Caption = 'Moeda Corrente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 137319
        mmTop = 40746
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label4'
        Caption = 'Outra Moeda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 177007
        mmTop = 40746
        mmWidth = 16404
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
      object shpLinhaDest: TppShape
        UserName = 'shpLinhaDest'
        ParentWidth = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 1058
        mmWidth = 197300
        BandType = 4
      end
      object lbStatus: TppDBText
        UserName = 'DBText1'
        DataField = 'STATUS'
        DataPipeline = pplMestre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplMestre'
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 1852
        mmWidth = 64029
        BandType = 4
      end
      object ppSubReport: TppSubReport
        OnPrint = ppSubReportPrint
        UserName = 'SubReport'
        DrillDownComponent = LinhaDrilDraw
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplDetalhe'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 7144
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = pplDetalhe
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 192
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplDetalhe'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object ppShape2: TppShape
              UserName = 'Shape1'
              Shape = stRoundRect
              mmHeight = 3704
              mmLeft = 6879
              mmTop = 529
              mmWidth = 190500
              BandType = 1
            end
            object ppLabel6: TppLabel
              UserName = 'Label6'
              Caption = 'Data:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 7938
              mmTop = 794
              mmWidth = 6879
              BandType = 1
            end
            object ppLabel7: TppLabel
              UserName = 'Label7'
              Caption = 'Histórico'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 27517
              mmTop = 794
              mmWidth = 11113
              BandType = 1
            end
          end
          object ppDetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppDBText9: TppDBText
              UserName = 'DBText4'
              DataField = 'HISTORICO'
              DataPipeline = pplDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplDetalhe'
              mmHeight = 3175
              mmLeft = 27517
              mmTop = 529
              mmWidth = 102659
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'DBText5'
              DataField = 'DATALANCFINAN'
              DataPipeline = pplDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplDetalhe'
              mmHeight = 3175
              mmLeft = 7938
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText11: TppDBText
              UserName = 'DBText6'
              AutoSize = True
              DataField = 'TOTAL'
              DataPipeline = pplDetalhe
              DisplayFormat = '#,##0.00;(#,##0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplDetalhe'
              mmHeight = 3175
              mmLeft = 150813
              mmTop = 529
              mmWidth = 7408
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText7'
              AutoSize = True
              DataField = 'TOTALOM'
              DataPipeline = pplDetalhe
              DisplayFormat = '#,##0.00;(#,##0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplDetalhe'
              mmHeight = 3175
              mmLeft = 187855
              mmTop = 529
              mmWidth = 5556
              BandType = 4
            end
            object lnSeparadora: TppLine
              UserName = 'Line1'
              Position = lpBottom
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 7938
              mmTop = 2910
              mmWidth = 187590
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
          end
        end
      end
      object LinhaDrilDraw: TppLine
        UserName = 'Line5'
        Pen.Style = psClear
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 794
        mmTop = 1588
        mmWidth = 195792
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine8: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel8: TppLabel
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
    object ppGroup2: TppGroup
      BreakName = 'STATUS'
      DataPipeline = pplMestre
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplMestre'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppDBText13: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'TOTAL'
          DataPipeline = pplMestre
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMestre'
          mmHeight = 3969
          mmLeft = 144198
          mmTop = 265
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object ppDBText14: TppDBText
          UserName = 'DBText3'
          AutoSize = True
          DataField = 'TOTALOM'
          DataPipeline = pplMestre
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMestre'
          mmHeight = 3969
          mmLeft = 186796
          mmTop = 529
          mmWidth = 6879
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object pplMestre: TppBDEPipeline
    DataSource = dsMestre
    UserName = 'lMestre'
    Left = 280
    Top = 200
    object pplMestreppField1: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplMestreppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplMestreppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALOM'
      FieldName = 'TOTALOM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
  end
  object dsMestre: TwwDataSource
    DataSet = CdsMestre
    Left = 280
    Top = 240
  end
end
