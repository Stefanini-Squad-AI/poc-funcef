inherited RptCAFSldCtbGrupoA: TRptCAFSldCtbGrupoA
  Left = 237
  Top = 207
  Width = 297
  Height = 164
  Caption = 'Saldo Contábil por Grupo - Analítico'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object sqlSldCtbGrupoA: TCMSqlParams [0]
    SQL.Strings = (
      'SELECT G.CLASSE, G.NOME AS DESCGRUPO,'
      '       CC.CODCENTROCUSTO, CC.NOME AS DESCCCUSTO,'
      '       B.PLACA, SUBSTR(B.DESBEM,1,40) AS DESCBEM,'
      ''
      
        '       ROUND(SUM(NVL(SB.VALORG,0) + NVL(SB.CMBEM,0)),2)         ' +
        '          AS VALORG0,'
      ''
      
        '       ROUND(SUM(NVL(SB.REAVVALORG,0) + NVL(SB.ULTREAVVALORG,0) ' +
        '+'
      
        '                 NVL(SB.REAVCMBEM,0) + NVL(SB.ULTREAVCMBEM,0)),2' +
        ')         AS REAVVALORG0,'
      ''
      
        '       ROUND(SUM(NVL(SB.DEPLANC,0) + NVL(SB.CMDEP,0)),2)        ' +
        '          AS DEPLANC0,'
      ''
      
        '       ROUND(SUM(NVL(SB.REAVDEPLANC,0) + NVL(SB.ULTREAVDEPLANC,0' +
        ') +'
      
        '                 NVL(SB.REAVCMDEP,0) + NVL(SB.ULTREAVCMDEP,0)),2' +
        ')         AS REAVDEPLANC0,'
      ''
      '       ROUND(SUM(NVL(SB.VALORG,0) + NVL(SB.CMBEM,0) +'
      
        '                 NVL(SB.REAVVALORG,0) + NVL(SB.ULTREAVVALORG,0) ' +
        '+'
      
        '                 NVL(SB.REAVCMBEM,0) + NVL(SB.ULTREAVCMBEM,0)),2' +
        ')         AS SUMVALORG0,'
      ''
      '       ROUND(SUM(NVL(SB.DEPLANC,0) + NVL(SB.CMDEP,0) +'
      
        '                 NVL(SB.REAVDEPLANC,0) + NVL(SB.ULTREAVDEPLANC,0' +
        ') +'
      
        '                 NVL(SB.REAVCMDEP,0) + NVL(SB.ULTREAVCMDEP,0)),2' +
        ')         AS SUMDEPLANC0,'
      ''
      '       ROUND(SUM(NVL(SB.VALORG,0) + NVL(SB.CMBEM,0) -'
      '                 NVL(SB.DEPLANC,0) - NVL(SB.CMDEP,0)+'
      '                 NVL(SB.REAVVALORG,0) + NVL(SB.REAVCMBEM,0) -'
      '                 NVL(SB.REAVDEPLANC,0) - NVL(SB.REAVCMDEP,0) +'
      
        '                 NVL(SB.ULTREAVVALORG,0) + NVL(SB.ULTREAVCMBEM,0' +
        ') -'
      
        '                 NVL(SB.ULTREAVDEPLANC,0) - NVL(SB.ULTREAVCMDEP,' +
        '0)),2)    AS VALCTB0'
      ''
      
        'FROM (SELECT SCB1.IDBEM, SCB1.IDPESSOA, SCB1.DATASLDBEM, SCB1.MO' +
        'ECODIGO, SCD1.IDSLDCTBBEMXDEP,'
      '             SCB1.VALORG, SCB1.REAVVALORG, SCB1.ULTREAVVALORG,'
      '             SCB1.CMBEM, SCB1.REAVCMBEM, SCB1.ULTREAVCMBEM,'
      
        '             SCD1.DEPLANC, SCD1.REAVDEPLANC, SCD1.ULTREAVDEPLANC' +
        ','
      '             SCD1.CMDEP, SCD1.REAVCMDEP, SCD1.ULTREAVCMDEP,'
      '             SCB1.IDGRUPO, SCB1.IDLOCALIZACAO'
      '      FROM (SELECT SCB5.IDBEM,'
      '                   MAX(SCB5.DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM SCB5'
      '            WHERE SCB5.DATASLDBEM <= :DATASLD'
      '              AND :MOECODIGO = SCB5.MOECODIGO'
      '              AND :IDPESSOA = SCB5.IDPESSOA'
      '              AND 1E38 >= -SCB5."IDBEM"'
      '            GROUP BY SCB5.IDBEM) DTAMAX,'
      '           SALDOCONTABBEM SCB1, SLDCTBBEMXDEP SCD1'
      '      WHERE SCB1.IDPESSOA = :IDPESSOA'
      '        AND SCB1.MOECODIGO = :MOECODIGO'
      '        AND SCD1.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '        AND DTAMAX.DATA = SCB1.DATASLDBEM'
      '        AND DTAMAX.IDBEM = SCB1.IDBEM'
      '        AND SCB1.IDBEM = SCD1.IDBEM + 0'
      '        AND SCB1.IDPESSOA = SCD1.IDPESSOA'
      '        AND SCB1.MOECODIGO = SCD1.MOECODIGO'
      '        AND SCB1.DATASLDBEM = SCD1.DATASLDBEM'
      '        AND SCD1.IDPESSOA = :IDPESSOA'
      '        AND SCD1.MOECODIGO = :MOECODIGO'
      '        AND DTAMAX.DATA = SCD1.DATASLDBEM'
      '        AND DTAMAX.IDBEM = SCD1.IDBEM) SB,'
      '     GRUPO G, LOCALIZACAO L, CENTCUST CC, BEM B'
      ''
      'WHERE B.IDPESSOA = :IDPESSOA'
      '  AND B.DATAINICIODEP <= :DATASLD'
      ''
      ''
      ''
      ''
      ''
      ''
      '  AND SB.IDBEM = B.IDBEM'
      '  AND SB.IDPESSOA = B.IDPESSOA'
      '  AND SB.IDGRUPO = G.IDGRUPO'
      '  AND SB.IDLOCALIZACAO = L.IDLOCALIZACAO'
      '  AND SB.IDPESSOA = L.IDPESSOA'
      '  AND L.CODCENTROCUSTO = CC.CODCENTROCUSTO'
      '  AND L.IDEMPRESA = CC.IDEMPRESA'
      '  AND :IDPESSOA = SB.IDPESSOA'
      '  AND B.IDPESSOA = L.IDPESSOA'
      '  AND :IDPESSOA = L.IDPESSOA'
      '  AND (B.FLGDEPREC = :PDEPREC OR B.FLGDEPREC = :PNOTDEPREC)'
      
        'GROUP BY G.CLASSE, G.NOME, CC.CODCENTROCUSTO, CC.NOME, B.PLACA, ' +
        'SUBSTR(B.DESBEM, 1, 40)'
      '')
    ClientDataSet = cdsSldCtbGrupoA
    Left = 216
    Top = 64
  end
  object cdsSldCtbGrupoA: TCMClientDataSet [1]
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 50
  end
  object dsSldCtbGrupoA: TwwDataSource [2]
    DataSet = cdsSldCtbGrupoA
    Left = 216
    Top = 36
  end
  object ppSldCtbGrupoA: TppBDEPipeline [3]
    DataSource = dsSldCtbGrupoA
    UserName = 'SldCtbGrupoA'
    Left = 216
    Top = 22
    object ppSldCtbCCustoAppField1: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppSldCtbCCustoAppField2: TppField
      FieldAlias = 'DESCCCUSTO'
      FieldName = 'DESCCCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppSldCtbCCustoAppField3: TppField
      FieldAlias = 'CLASSE'
      FieldName = 'CLASSE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppSldCtbCCustoAppField4: TppField
      FieldAlias = 'DESCGRUPO'
      FieldName = 'DESCGRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppSldCtbCCustoAppField5: TppField
      FieldAlias = 'PLACA'
      FieldName = 'PLACA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppSldCtbCCustoAppField6: TppField
      FieldAlias = 'DESCBEM'
      FieldName = 'DESCBEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppSldCtbCCustoAppField7: TppField
      FieldAlias = 'VALORG0'
      FieldName = 'VALORG0'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppSldCtbCCustoAppField8: TppField
      FieldAlias = 'REAVVALORG0'
      FieldName = 'REAVVALORG0'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppSldCtbCCustoAppField9: TppField
      FieldAlias = 'DEPLANC0'
      FieldName = 'DEPLANC0'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppSldCtbCCustoAppField10: TppField
      FieldAlias = 'REAVDEPLANC0'
      FieldName = 'REAVDEPLANC0'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppSldCtbCCustoAppField11: TppField
      FieldAlias = 'SUMVALORG0'
      FieldName = 'SUMVALORG0'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppSldCtbCCustoAppField12: TppField
      FieldAlias = 'SUMDEPLANC0'
      FieldName = 'SUMDEPLANC0'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppSldCtbCCustoAppField13: TppField
      FieldAlias = 'VALCTB0'
      FieldName = 'VALCTB0'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
  end
  object rpSldCtbGrupoA: TppReport [4]
    AutoStop = False
    DataPipeline = ppSldCtbGrupoA
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 16510
    PrinterSetup.mmMarginRight = 16510
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 216
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32808
      mmPrintPosition = 0
      object ppLabel66: TppLabel
        UserName = 'ppLabel66'
        AutoSize = False
        Caption = 'Saldo Contábil por Grupo - Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 85196
        mmTop = 8731
        mmWidth = 93663
        BandType = 0
      end
      object LBLEMPRESA: TppLabel
        UserName = 'LBLEMPRESA'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 117740
        mmTop = 1588
        mmWidth = 28310
        BandType = 0
      end
      object rpBalPatGrpLabel4: TppLabel
        UserName = 'rpBalPatGrpLabel4'
        AutoSize = False
        Caption = 'Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 104511
        mmTop = 29633
        mmWidth = 12965
        BandType = 0
      end
      object rpBalPatGrpLabel6: TppLabel
        UserName = 'rpBalPatGrpLabel6'
        AutoSize = False
        Caption = 'Reavaliação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 125148
        mmTop = 29633
        mmWidth = 16669
        BandType = 0
      end
      object rpBalPatGrpLabel8: TppLabel
        UserName = 'rpBalPatGrpLabel8'
        AutoSize = False
        Caption = 'Valor Patrimonial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 242623
        mmTop = 24342
        mmWidth = 21167
        BandType = 0
      end
      object rpBalPatGrpLabel9: TppLabel
        UserName = 'rpBalPatGrpLabel9'
        AutoSize = False
        Caption = 'Movimentação até '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 211403
        mmTop = 9525
        mmWidth = 28840
        BandType = 0
      end
      object rpLabelDataMov: TppLabel
        UserName = 'rpLabelDataMov'
        AutoSize = False
        Caption = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 241565
        mmTop = 9525
        mmWidth = 21960
        BandType = 0
      end
      object rpBalPatGrpLabel12: TppLabel
        UserName = 'rpBalPatGrpLabel12'
        Caption = 'Imobilizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 120121
        mmTop = 15875
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 153723
        mmTop = 29633
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Reavaliação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 175419
        mmTop = 29633
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Custo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3302
        mmLeft = 117475
        mmTop = 24342
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Depreciação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 163248
        mmTop = 24342
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Custo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 209021
        mmTop = 29633
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Depreciação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 223573
        mmTop = 29633
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Acumulados'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 213519
        mmTop = 24342
        mmWidth = 15346
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object rpBalPatGrpDBText1: TppDBText
        UserName = 'rpBalPatGrpDBText1'
        DataField = 'PLACA'
        DataPipeline = ppSldCtbGrupoA
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 24871
        BandType = 4
      end
      object rpBalPatGrpDBText2: TppDBText
        UserName = 'rpBalPatGrpDBText2'
        DataField = 'DESCBEM'
        DataPipeline = ppSldCtbGrupoA
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 25135
        mmTop = 0
        mmWidth = 66675
        BandType = 4
      end
      object rpBalPatGrpDBText4: TppDBText
        UserName = 'rpBalPatGrpDBText4'
        DataField = 'VALORG0'
        DataPipeline = ppSldCtbGrupoA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 92075
        mmTop = 0
        mmWidth = 25400
        BandType = 4
      end
      object rpBalPatGrpDBText5: TppDBText
        UserName = 'rpBalPatGrpDBText5'
        DataField = 'REAVVALORG0'
        DataPipeline = ppSldCtbGrupoA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 117740
        mmTop = 0
        mmWidth = 24130
        BandType = 4
      end
      object rpBalPatGrpDBText6: TppDBText
        UserName = 'rpBalPatGrpDBText6'
        DataField = 'DEPLANC0'
        DataPipeline = ppSldCtbGrupoA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 142082
        mmTop = 0
        mmWidth = 25400
        BandType = 4
      end
      object rpBalPatGrpDBText7: TppDBText
        UserName = 'rpBalPatGrpDBText7'
        Color = clSilver
        DataField = 'SUMVALORG0'
        DataPipeline = ppSldCtbGrupoA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 192088
        mmTop = 0
        mmWidth = 24130
        BandType = 4
      end
      object rpBalPatGrpDBText8: TppDBText
        UserName = 'rpBalPatGrpDBText8'
        DataField = 'SUMDEPLANC0'
        DataPipeline = ppSldCtbGrupoA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 215107
        mmTop = 0
        mmWidth = 24130
        BandType = 4
      end
      object rpBalPatGrpDBText9: TppDBText
        UserName = 'rpBalPatGrpDBText9'
        DataField = 'REAVDEPLANC0'
        DataPipeline = ppSldCtbGrupoA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 167746
        mmTop = 0
        mmWidth = 24130
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'VALCTB0'
        DataPipeline = ppSldCtbGrupoA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 239713
        mmTop = 0
        mmWidth = 24130
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLine18: TppLine
        UserName = 'ppLine18'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 264107
        BandType = 8
      end
      object ppCalc17: TppSystemVariable
        UserName = 'Calc17'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 112448
        mmTop = 2910
        mmWidth = 39158
        BandType = 8
      end
      object ppCalc18: TppSystemVariable
        UserName = 'Calc18'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 237596
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
      object LBLSISTEMA: TppLabel
        UserName = 'LBLSISTEMA'
        AutoSize = False
        Caption = 'Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 2910
        mmWidth = 109802
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 8731
        BandType = 7
      end
      object ppDBCalc15: TppDBCalc
        UserName = 'DBCalc15'
        DataField = 'VALORG0'
        DataPipeline = ppSldCtbGrupoA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 93398
        mmTop = 1323
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc16: TppDBCalc
        UserName = 'DBCalc16'
        DataField = 'REAVVALORG0'
        DataPipeline = ppSldCtbGrupoA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 117740
        mmTop = 1323
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc17: TppDBCalc
        UserName = 'DBCalc101'
        DataField = 'DEPLANC0'
        DataPipeline = ppSldCtbGrupoA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 143404
        mmTop = 1323
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc18: TppDBCalc
        UserName = 'DBCalc18'
        DataField = 'REAVDEPLANC0'
        DataPipeline = ppSldCtbGrupoA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 167746
        mmTop = 1323
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc19: TppDBCalc
        UserName = 'DBCalc19'
        DataField = 'SUMVALORG0'
        DataPipeline = ppSldCtbGrupoA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 192088
        mmTop = 1323
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc20: TppDBCalc
        UserName = 'DBCalc20'
        DataField = 'SUMDEPLANC0'
        DataPipeline = ppSldCtbGrupoA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 215107
        mmTop = 1323
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc21: TppDBCalc
        UserName = 'DBCalc21'
        DataField = 'VALCTB0'
        DataPipeline = ppSldCtbGrupoA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 239713
        mmTop = 1323
        mmWidth = 24077
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'CLASSE'
      DataPipeline = ppSldCtbGrupoA
      KeepTogether = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppDBText4: TppDBText
          UserName = 'ppDBText4'
          DataField = 'CLASSE'
          DataPipeline = ppSldCtbGrupoA
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 33602
          mmTop = 0
          mmWidth = 35454
          BandType = 3
          GroupNo = 1
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          ShiftWithParent = True
          AutoSize = True
          DataField = 'DESCGRUPO'
          DataPipeline = ppSldCtbGrupoA
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 70115
          mmTop = 0
          mmWidth = 23019
          BandType = 3
          GroupNo = 1
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'Grupo Contábil'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 26077
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 4233
          mmWidth = 264107
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Soma Grupo Contábil'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 36248
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALORG0'
          DataPipeline = ppSldCtbGrupoA
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 93398
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'REAVVALORG0'
          DataPipeline = ppSldCtbGrupoA
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 117740
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'DEPLANC0'
          DataPipeline = ppSldCtbGrupoA
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 143404
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'REAVDEPLANC0'
          DataPipeline = ppSldCtbGrupoA
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 167746
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'SUMVALORG0'
          DataPipeline = ppSldCtbGrupoA
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 192088
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'SUMDEPLANC0'
          DataPipeline = ppSldCtbGrupoA
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 215107
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'VALCTB0'
          DataPipeline = ppSldCtbGrupoA
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 239713
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CODCENTROCUSTO'
      DataPipeline = ppSldCtbGrupoA
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Centro de Custo '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3895
          mmLeft = 0
          mmTop = 0
          mmWidth = 33020
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'ppDBText2'
          DataField = 'CODCENTROCUSTO'
          DataPipeline = ppSldCtbGrupoA
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3895
          mmLeft = 33602
          mmTop = 0
          mmWidth = 35560
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          ShiftWithParent = True
          AutoSize = True
          DataField = 'DESCCCUSTO'
          DataPipeline = ppSldCtbGrupoA
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3895
          mmLeft = 70115
          mmTop = 0
          mmWidth = 22267
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 5027
          mmWidth = 264107
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Soma Centro de Custo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3895
          mmLeft = 0
          mmTop = 0
          mmWidth = 34713
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'VALORG0'
          DataPipeline = ppSldCtbGrupoA
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 93398
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'REAVVALORG0'
          DataPipeline = ppSldCtbGrupoA
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 117740
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'DEPLANC0'
          DataPipeline = ppSldCtbGrupoA
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 143404
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'REAVDEPLANC0'
          DataPipeline = ppSldCtbGrupoA
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 167746
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'SUMVALORG0'
          DataPipeline = ppSldCtbGrupoA
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 192088
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'SUMDEPLANC0'
          DataPipeline = ppSldCtbGrupoA
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 215107
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          DataField = 'VALCTB0'
          DataPipeline = ppSldCtbGrupoA
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 239713
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 5027
          mmWidth = 264107
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  inherited CmpRptCM: TCmParamReport
    Caption = 'Saldo Contábil por Grupo - Analítico'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Periodo Atualizado até'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Grupo Contábil'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CLASSE, NOME, IDGRUPO'
          'FROM GRUPO'
          'WHERE TIPO = '#39'A'#39
          'ORDER BY CLASSE')
        LookupSettings.Chave = 'IDGRUPO'
        LookupSettings.Display = 'NOME|CLASSE'
        LookupSettings.Descricao = 'Grupo Contábil|Código'
        LookupSettings.Tamanho = '40|8'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Centro de Custo'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CODCENTROCUSTO, NOME'
          'FROM CENTCUST'
          'WHERE (STATUSGRUPOCDC = '#39'A'#39')'
          'ORDER BY CODCENTROCUSTO')
        LookupSettings.Chave = 'CODCENTROCUSTO'
        LookupSettings.Display = 'NOME|CODCENTROCUSTO'
        LookupSettings.Descricao = 'Centro de Custo|Descrição'
        LookupSettings.Tamanho = '40|10'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = ' Bens '
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Patrimoniais'
          'Investimentos Imobiliários')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Incluir Bens com Controle Físico'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = False
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Exibe Bens Baixados'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = ' Processar '
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Todos'
          'Não Depreciáveis'
          'Parcialmente Depreciados'
          'Totalmente Depreciados')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2'
          '3')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 56
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 306
    FormWidth = 520
    Left = 24
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpSldCtbGrupoA
    LabelEmpresa = LBLEMPRESA
    LabelSistema = LBLSISTEMA
  end
  object cdsVerUltFec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 80
  end
  object sqlVerUltFec: TCMSqlParams
    SQL.Strings = (
      'SELECT MAX(PG.DATAULTFEC) AS DATAULT'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      
        'WHERE (G.FLGIMOVEL = :PFLGIMOVELINI OR G.FLGIMOVEL = :PFLGIMOVEL' +
        'FIM)'
      '  AND PG.IDPESSOA = :PIDPESSOA'
      '  AND G.TIPO = '#39'A'#39
      '  AND PG.DATAULTFEC IS NOT NULL'
      '  AND PG.IDGRUPO  = G.IDGRUPO')
    ClientDataSet = cdsVerUltFec
    Left = 120
    Top = 64
  end
  object cdsParamCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 80
  end
  object sqlParamCaf: TCMSqlParams
    SQL.Strings = (
      
        'SELECT C.MOEDAOFICIAL, C.MOEDAFISCAL, C.MOEDAGERENCIAL, C.NUMDIA' +
        'SANO,'
      '       C.MASCCODGRUPO, C.ALUGUELINTERNO, C.GERARREQMAT,'
      '       C.DATAULTDEP, C.DATARECALCDEP, C.DTAULTALUG, C.SEQBEMEMP,'
      
        '       C.EDITACODBEM, C.EDITACODGRUPO, C.SISTEMAS, C.DATAINICIAL' +
        ','
      
        '       C.ULTTXTCONTAB, C.FLGCALCCM, C.FLGTIPOCALC, C.MASCARACLAS' +
        'SE,'
      
        '       C.INTEGRACONTAB, C.INTEGRACAP, C.INTEGRACAR, C.PLANOVIGEN' +
        'TE,'
      
        '       C.FLGREAVAL, C.TIPOPERCTB, C.FLGREMOVEPLANCTB, C.ATIVPROJ' +
        'ETO,'
      
        '       C.PROXIMAPLACA,C.FLGCLSDESBEM, C.DIGMASCPLACA, C.PATROPAD' +
        'RAO,'
      
        '       C.PLANPREVPADRAO, C.TIPATUSALDOCONTAB, C.DTANCAF, C.TIPOC' +
        'ONJUNTO,'
      
        '       I.FLGINTCAFCONT, C.FLGCONTABFECHAM, PC.PACDOBRADA, I.FLGD' +
        'IARIO,'
      '       G.MASCARACC'
      'FROM   PARAMETROSCAFMANUT C,'
      '       PARAMIMOVEL I,'
      '       PARAMCONTAB PC,'
      '       PARAMGLOBAL G'
      'WHERE C.IDPESSOA = :PIDPESSOA'
      '  AND C.IDPESSOA = I.IDPESSOA(+)'
      '  AND C.IDPESSOA = PC.IDPESSOA(+)'
      '  AND C.IDPESSOA = G.IDPESSOA(+)')
    ClientDataSet = cdsParamCaf
    Left = 32
    Top = 64
  end
end
