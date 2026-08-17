inherited dtmRelTotalItem: TdtmRelTotalItem
  Left = 316
  Top = 158
  Width = 388
  Height = 214
  Caption = 'dRelTotalItem'
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
  inherited rpExemplo: TppReport
    inherited HeaderBand1: TppHeaderBand
      inherited LblEmpresa: TppLabel [1]
      end
      inherited Line1: TppLine [2]
        Pen.Style = psClear
        Pen.Width = 0
        Style = lsDouble
        Weight = 0
        mmTop = 0
      end
    end
    inherited FooterBand1: TppFooterBand
      inherited LblSistema: TppLabel [0]
      end
      inherited Calc2: TppSystemVariable [1]
      end
      inherited Calc1: TppSystemVariable [2]
      end
      inherited Line2: TppLine [3]
        Pen.Style = psClear
        Pen.Width = 0
        Weight = 0
        mmHeight = 0
        mmTop = 0
      end
    end
  end
  object pplTotalItem: TppBDEPipeline
    DataSource = dtsTotalItem
    CloseDataSource = True
    UserName = 'TotalItem'
    Left = 257
    Top = 81
  end
  object dtsTotalItem: TwwDataSource
    AutoEdit = False
    DataSet = cdsTotalItem
    Left = 183
    Top = 82
  end
  object qryTotalItem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'APROPRIAÇÃO DE ITENS'#39' AS DESCRICAO, c.IDTIPOCONTREMPTMO,' +
        ' tc.TCEDESCRICAO,'
      
        '      i.IDITEMEMPTMO, i.ITEDESCRICAO, SUM(h.HMEVLRPREVISTO), PL.' +
        'PLNDATDIA'
      ''
      
        'FROM CONTRATOEMPTMO c, HISTMOVEMPTMO h, ITEMEMPTMO i, ITEMXTIPOC' +
        'ONTR ic,'
      '     TIPOCONTREMPTMO TC, PLANILHA PL'
      ''
      'WHERE  c.IDCONTRATOEMPTMO    = h.IDCONTRATOEMPTMO'
      '   AND c.IDTIPOCONTREMPTMO   = ic.IDTIPOCONTREMPTMO'
      '   AND i.IDITEMEMPTMO        = ic.IDITEMEMPTMO'
      '   AND h.IDITEMEMPTMO        = ic.IDITEMEMPTMO'
      '   AND c.IDTIPOCONTREMPTMO   = tc.IDTIPOCONTREMPTMO'
      
        '   AND ( PL.PLNDATDIA(+) >= :pDATAINI AND PL.PLNDATDIA(+) >= :pD' +
        'ATAFIM )'
      '   AND H.PLNCODIGO = PL.PLNCODIGO(+)'
      ''
      
        'GROUP BY  c.IDTIPOCONTREMPTMO, i.IDITEMEMPTMO, i.ITEDESCRICAO, P' +
        'L.PLNDATDIA, tc.TCEDESCRICAO'
      ''
      'UNION'
      ''
      
        'SELECT '#39'BAIXA DE ITENS'#39' AS DESCRICAO, c.IDTIPOCONTREMPTMO, tc.TC' +
        'EDESCRICAO, i.IDITEMEMPTMO,'
      '      i.ITEDESCRICAO, SUM(H.HMEVLREFETIVO), h.HMEDATAEFETIVA'
      ''
      
        'FROM CONTRATOEMPTMO c, HISTMOVEMPTMO h, ITEMEMPTMO i, ITEMXTIPOC' +
        'ONTR ic, TIPOCONTREMPTMO TC'
      ''
      'WHERE c.IDCONTRATOEMPTMO   = h.IDCONTRATOEMPTMO'
      '  AND c.IDTIPOCONTREMPTMO  = ic.IDTIPOCONTREMPTMO'
      '  AND i.IDITEMEMPTMO       = ic.IDITEMEMPTMO'
      '  AND h.IDITEMEMPTMO       = ic.IDITEMEMPTMO'
      '  AND c.IDTIPOCONTREMPTMO  = tc.IDTIPOCONTREMPTMO'
      '  AND h.HMEDATAEFETIVA IS NOT NULL'
      
        '  AND ( h.HMEDATAEFETIVA >= :pDATAINI and h.HMEDATAEFETIVA >= :p' +
        'DATAFIM )'
      ''
      
        'GROUP BY c.IDTIPOCONTREMPTMO, i.IDITEMEMPTMO, i.ITEDESCRICAO, h.' +
        'HMEDATAEFETIVA, tc.TCEDESCRICAO')
    ValidateWithMask = True
    Left = 106
    Top = 82
    ParamData = <
      item
        DataType = ftDate
        Name = 'pDATAINI'
        ParamType = ptInput
        Value = 37104d
      end
      item
        DataType = ftDate
        Name = 'pDATAFIM'
        ParamType = ptInput
        Value = 37134d
      end
      item
        DataType = ftDate
        Name = 'pDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDATAFIM'
        ParamType = ptInput
      end>
    object qryTotalItemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object qryTotalItemIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryTotalItemTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryTotalItemIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryTotalItemITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryTotalItemSUMHHMEVLRPREVISTO: TFloatField
      FieldName = 'SUM(H.HMEVLRPREVISTO)'
    end
    object qryTotalItemPLNDATDIA: TDateTimeField
      FieldName = 'PLNDATDIA'
    end
  end
  object rptTotalItem: TppReport
    AutoStop = False
    DataPipeline = pplTotalItem
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = '210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\ProjetosCM5\Emprestimo\Relatórios\Total item 4.rtm'
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 328
    Top = 81
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Totalizador de Itens de Empréstimos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 63500
        mmTop = 8731
        mmWidth = 74083
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197379
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'CBS Previdência'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 79640
        mmTop = 1588
        mmWidth = 39688
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = #39'APROPRIAÇÃODEITENS'#39
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 14288
        mmTop = 0
        mmWidth = 55563
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'ITEDESCRICAO'
        DataPipeline = pplTotalItem
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 74348
        mmTop = 0
        mmWidth = 56621
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PLNDATDIA'
        DataPipeline = pplTotalItem
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 132821
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'SUM(H.HMEVLRPREVISTO)'
        DataPipeline = pplTotalItem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 156634
        mmTop = 0
        mmWidth = 36248
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
        mmWidth = 197379
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
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
        Font.Charset = ANSI_CHARSET
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
    object ppGroup1: TppGroup
      BreakName = 'IDTIPOCONTREMPTMO'
      DataPipeline = pplTotalItem
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'IDITEMEMPTMO'
          DataPipeline = pplTotalItem
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 14
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5821
          mmLeft = 0
          mmTop = 0
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'TCEDESCRICAO'
          DataPipeline = pplTotalItem
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 14
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5821
          mmLeft = 18256
          mmTop = 0
          mmWidth = 93398
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 6085
          mmWidth = 197379
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
  end
  object dtpTotalItem: TDataSetProvider
    DataSet = qryTotalItem
    Constraints = True
    Left = 110
    Top = 144
  end
  object cdsTotalItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dtpTotalItem'
    Left = 184
    Top = 144
    object cdsTotalItemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object cdsTotalItemIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object cdsTotalItemTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object cdsTotalItemIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object cdsTotalItemITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object cdsTotalItemSUMHHMEVLRPREVISTO: TFloatField
      FieldName = 'SUM(H.HMEVLRPREVISTO)'
    end
    object cdsTotalItemPLNDATDIA: TDateTimeField
      FieldName = 'PLNDATDIA'
    end
  end
  object adoqryTotalItem: TADOQuery
    Parameters = <>
    Left = 28
    Top = 144
  end
end
