inherited dtmRelItemAnalitico: TdtmRelItemAnalitico
  Left = 411
  Top = 251
  Width = 289
  Height = 160
  Caption = 'dtmRelItemAnalitico'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 32
    Top = 80
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
    Left = 32
    Top = 68
  end
  inherited qryExemplo: TwwQuery
    Left = 32
    Top = 56
  end
  inherited rpExemplo: TppReport
    Left = 32
    Top = 8
  end
  object pplSaldoParcelas: TppBDEPipeline
    DataSource = dsSaldoParcelas
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'lExemplo1'
    Left = 128
    Top = 80
    object pplSaldoParcelasppField1: TppField
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplSaldoParcelasppField2: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplSaldoParcelasppField3: TppField
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplSaldoParcelasppField4: TppField
      FieldAlias = 'DESCPLANO'
      FieldName = 'DESCPLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplSaldoParcelasppField5: TppField
      FieldAlias = 'IDTIPOCONTREMPTMO'
      FieldName = 'IDTIPOCONTREMPTMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplSaldoParcelasppField6: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplSaldoParcelasppField7: TppField
      FieldAlias = 'ITEDESCRICAO'
      FieldName = 'ITEDESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplSaldoParcelasppField8: TppField
      FieldAlias = 'IDITEMEMPTMO'
      FieldName = 'IDITEMEMPTMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplSaldoParcelasppField9: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplSaldoParcelasppField10: TppField
      FieldAlias = 'QUANT'
      FieldName = 'QUANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplSaldoParcelasppField11: TppField
      FieldAlias = 'AFETASALDO'
      FieldName = 'AFETASALDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplSaldoParcelasppField12: TppField
      FieldAlias = 'CENTRALIZADOR'
      FieldName = 'CENTRALIZADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
  end
  object dsSaldoParcelas: TwwDataSource
    DataSet = qrySaldoParcelas
    Left = 128
    Top = 68
  end
  object rptItemAnalitico: TppReport
    AutoStop = False
    DataPipeline = pplSaldoParcelas
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Analítico de Itens'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 296863
    PrinterSetup.mmPaperWidth = 210080
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 120
    Top = 8
    Version = '5.5'
    mmColumnWidth = 270405
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27252
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Analítico de Itens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 11113
        mmTop = 8731
        mmWidth = 150813
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
        mmHeight = 5821
        mmLeft = 11113
        mmTop = 794
        mmWidth = 150813
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Mês de Referência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 18521
        mmWidth = 34396
        BandType = 0
      end
      object ppLabel872: TppLabel
        OnPrint = ppLabel872Print
        UserName = 'Label872'
        Caption = 'Janeiro/2002'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 35983
        mmTop = 18521
        mmWidth = 20373
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object rptContrato: TppShape
        OnPrint = rptContratoPrint
        UserName = 'rptContrato'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 183622
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'QUANT'
        DataPipeline = pplSaldoParcelas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 155575
        mmTop = 1058
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VALOR'
        DataPipeline = pplSaldoParcelas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 132821
        mmTop = 794
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'ITEDESCRICAO'
        DataPipeline = pplSaldoParcelas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 31221
        mmTop = 794
        mmWidth = 86784
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'AFETASALDO'
        DataPipeline = pplSaldoParcelas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 6350
        mmTop = 794
        mmWidth = 4498
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CENTRALIZADOR'
        DataPipeline = pplSaldoParcelas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 19315
        mmTop = 794
        mmWidth = 5556
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 183622
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 265
        mmTop = 3175
        mmWidth = 23019
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
        mmLeft = 36777
        mmTop = 3175
        mmWidth = 94986
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
        mmLeft = 156898
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 11113
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'NOMEPATRO'
      DataPipeline = pplSaldoParcelas
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 9260
          mmWidth = 183622
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'NOMEPATRO'
          DataPipeline = pplSaldoParcelas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 529
          mmTop = 5821
          mmWidth = 75936
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
      BreakName = 'DESCPLANO'
      DataPipeline = pplSaldoParcelas
      KeepTogether = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'DESCPLANO'
          DataPipeline = pplSaldoParcelas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3440
          mmLeft = 2646
          mmTop = 2646
          mmWidth = 79640
          BandType = 3
          GroupNo = 1
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 5821
          mmWidth = 183622
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'TCEDESCRICAO'
      DataPipeline = pplSaldoParcelas
      KeepTogether = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 12700
          mmLeft = 0
          mmTop = 0
          mmWidth = 183622
          BandType = 3
          GroupNo = 2
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          Color = clSilver
          DataField = 'TCEDESCRICAO'
          DataPipeline = pplSaldoParcelas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          mmHeight = 3175
          mmLeft = 4233
          mmTop = 529
          mmWidth = 82815
          BandType = 3
          GroupNo = 2
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 12171
          mmWidth = 183622
          BandType = 3
          GroupNo = 2
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 142082
          mmTop = 8731
          mmWidth = 6879
          BandType = 3
          GroupNo = 2
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Quant.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 156898
          mmTop = 8731
          mmWidth = 8731
          BandType = 3
          GroupNo = 2
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Trata Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7144
          mmLeft = 4233
          mmTop = 5027
          mmWidth = 8731
          BandType = 3
          GroupNo = 2
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Centraliza'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 14817
          mmTop = 8996
          mmWidth = 14552
          BandType = 3
          GroupNo = 2
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Item de Empréstimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 31221
          mmTop = 8996
          mmWidth = 31485
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 529
          mmWidth = 183622
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object qrySaldoParcelas: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      
        '   0                                                            ' +
        '  AS IDPATRO,'
      
        '   '#39'                                                            ' +
        #39' AS NOMEPATRO,'
      
        '   0                                                            ' +
        '  AS IDPLANOPREV,'
      
        '   '#39'                                                  '#39'         ' +
        '  AS DESCPLANO,'
      
        '   0                                                            ' +
        '  AS IDTIPOCONTREMPTMO,'
      
        '   '#39'                                                            ' +
        #39' AS TCEDESCRICAO,'
      
        '   '#39'                                                            ' +
        #39' AS ITEDESCRICAO,'
      
        '   0                                                            ' +
        '  AS IDITEMEMPTMO,'
      
        '   0                                                            ' +
        '  AS VALOR,'
      
        '   0                                                            ' +
        '  AS QUANT,'
      
        '   '#39' '#39'                                                          ' +
        '  AS AFETASALDO,'
      
        '   '#39' '#39'                                                          ' +
        '  AS CENTRALIZADOR'
      'FROM'
      '   DUAL'
      'WHERE 1 = 2'
      ''
      ' '
      ' ')
    UpdateObject = UpdateSQL
    ValidateWithMask = True
    Left = 128
    Top = 56
    object qrySaldoParcelasIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qrySaldoParcelasNOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      FixedChar = True
      Size = 60
    end
    object qrySaldoParcelasIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qrySaldoParcelasDESCPLANO: TStringField
      FieldName = 'DESCPLANO'
      FixedChar = True
      Size = 50
    end
    object qrySaldoParcelasIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qrySaldoParcelasTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      FixedChar = True
      Size = 60
    end
    object qrySaldoParcelasITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      FixedChar = True
      Size = 60
    end
    object qrySaldoParcelasIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qrySaldoParcelasVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qrySaldoParcelasQUANT: TFloatField
      FieldName = 'QUANT'
    end
    object qrySaldoParcelasAFETASALDO: TStringField
      FieldName = 'AFETASALDO'
      FixedChar = True
      Size = 1
    end
    object qrySaldoParcelasCENTRALIZADOR: TStringField
      FieldName = 'CENTRALIZADOR'
      FixedChar = True
      Size = 1
    end
  end
  object UpdateSQL: TUpdateSQL
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (IDPATRO, NOMEPATRO, IDPLANOPREV, DESCPLANO, '
      'IDTIPOCONTREMPTMO, TCEDESCRICAO, '
      '   ITEDESCRICAO, IDITEMEMPTMO, VALOR, QUANT)'
      'values'
      '  (:IDPATRO, :NOMEPATRO, :IDPLANOPREV, :DESCPLANO, '
      ':IDTIPOCONTREMPTMO, '
      '   :TCEDESCRICAO, :ITEDESCRICAO, :IDITEMEMPTMO, :VALOR, :QUANT)')
    Left = 216
    Top = 56
  end
end
