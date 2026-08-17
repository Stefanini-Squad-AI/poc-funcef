inherited dtmRelConfereEnvioFolha: TdtmRelConfereEnvioFolha
  Left = 118
  Top = 235
  Width = 241
  Height = 176
  Caption = 'dtmRelConfereEnvioFolha'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 32
    Top = 56
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
    Top = 80
  end
  inherited rpExemplo: TppReport
    Left = 32
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object pplConfereEnvioFolha: TppBDEPipeline
    DataSource = dsConfereEnvioFolha
    UserName = 'lExemplo1'
    Left = 136
    Top = 56
    object pplConfereEnvioFolhappField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplConfereEnvioFolhappField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPROVENTO'
      FieldName = 'IDPROVENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplConfereEnvioFolhappField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 130
      DisplayWidth = 130
      Position = 2
    end
    object pplConfereEnvioFolhappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplConfereEnvioFolhappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDCONTRATO'
      FieldName = 'QTDCONTRATO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplConfereEnvioFolhappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDREGISTRO'
      FieldName = 'QTDREGISTRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
  end
  object dsConfereEnvioFolha: TwwDataSource
    DataSet = qryConfereEnvioFolha
    Left = 136
    Top = 68
  end
  object qryConfereEnvioFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME,'
      '       X.IDPROVENTO,'
      '       X.DESCRICAO,'
      '       NVL(X.VALOR,0)       VALOR,'
      '       NVL(X.QTDCONTRATO,0) QTDCONTRATO,'
      '       NVL(X.QTDREGISTRO,0) QTDREGISTRO'
      'FROM PESSOA P,'
      '     PATRO F,'
      '     PROVDESC R,'
      '    ('
      '     SELECT T.IDPATRO,'
      '            R.IDPROVENTO,'
      '            R.DESCRICAO,'
      '            NVL(T.VALOR,0)       VALOR,'
      '            NVL(T.QTDCONTRATO,0) QTDCONTRATO,'
      '            NVL(T.QTDREGISTRO,0) QTDREGISTRO'
      '     FROM   PROVDESC R,'
      '           ('
      '            SELECT C.IDPATRO,'
      '                   H.IDRUBRICA,'
      '                   SUM(H.HMEVLRPREVISTO)     VALOR,'
      '                   COUNT(H.IDCONTRATOEMPTMO) QTDCONTRATO,'
      '                   COUNT(H.IDCONTRATOEMPTMO) QTDREGISTRO'
      '            FROM   HISTMOVEMPTMO H, CONTRATOEMPTMO C'
      '            WHERE  H.HMEFORMACOBRANCA = '#39'F'#39
      '            AND    H.FLGENVIO IS NULL'
      '            AND    H.HMEANOCOBRANCA = :PHMEANOCOBRANCA'
      '            AND    H.HMEMESCOBRANCA = :PHMEMESCOBRANCA'
      '            AND    H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO'
      '            GROUP BY C.IDPATRO, H.IDRUBRICA'
      '           ) T'
      '     WHERE R.IDPROVENTO = T.IDRUBRICA(+)'
      '    ) X'
      'WHERE'
      '      P.IDPESSOA = F.IDPESSOA'
      'AND   F.IDPESSOA = X.IDPATRO'
      'AND   R.IDPROVENTO = X.IDPROVENTO'
      '')
    ValidateWithMask = True
    Left = 136
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
        Value = '2002'
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
        Value = '1'
      end>
    object qryConfereEnvioFolhaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryConfereEnvioFolhaIDPROVENTO: TFloatField
      FieldName = 'IDPROVENTO'
    end
    object qryConfereEnvioFolhaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 130
    end
    object qryConfereEnvioFolhaVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryConfereEnvioFolhaQTDCONTRATO: TFloatField
      FieldName = 'QTDCONTRATO'
    end
    object qryConfereEnvioFolhaQTDREGISTRO: TFloatField
      FieldName = 'QTDREGISTRO'
    end
  end
  object rptConfereEnvioFolha: TppReport
    AutoStop = False
    DataPipeline = pplConfereEnvioFolha
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 136
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplConfereEnvioFolha'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27252
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Rubricas Enviadas/Recebidas (por Patrocinadora)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8731
        mmWidth = 183621
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
        mmLeft = 0
        mmTop = 794
        mmWidth = 183621
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Mês/Ano:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 18521
        mmWidth = 17992
        BandType = 0
      end
      object rptContratosAdminAnal_lblAdministradora: TppLabel
        UserName = 'rptContratosAdminAnal_lblAdministradora'
        Caption = 'Janeiro/2002'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 19579
        mmTop = 18521
        mmWidth = 20373
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLine1: TppLine
        OnPrint = ppLine1Print
        UserName = 'Line1'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 5292
        mmLeft = 0
        mmTop = 0
        mmWidth = 183542
        BandType = 4
      end
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 5292
        mmLeft = 0
        mmTop = 0
        mmWidth = 183542
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'QTDCONTRATO'
        DataPipeline = pplConfereEnvioFolha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereEnvioFolha'
        mmHeight = 3175
        mmLeft = 90223
        mmTop = 1058
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'DESCRICAO'
        DataPipeline = pplConfereEnvioFolha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplConfereEnvioFolha'
        mmHeight = 3969
        mmLeft = 6615
        mmTop = 794
        mmWidth = 79640
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VALOR'
        DataPipeline = pplConfereEnvioFolha
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereEnvioFolha'
        mmHeight = 3175
        mmLeft = 111919
        mmTop = 1058
        mmWidth = 16140
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
        mmTop = 265
        mmWidth = 183542
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
        mmTop = 1588
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
        mmLeft = 44186
        mmTop = 1058
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
        mmLeft = 157427
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 26988
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 7144
        mmLeft = 72231
        mmTop = 6615
        mmWidth = 111390
        BandType = 7
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 3704
        mmWidth = 183542
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'QTDCONTRATO'
        DataPipeline = pplConfereEnvioFolha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereEnvioFolha'
        mmHeight = 3175
        mmLeft = 92869
        mmTop = 8467
        mmWidth = 7408
        BandType = 7
      end
      object ppDBCalc31: TppDBCalc
        UserName = 'DBCalc31'
        DataField = 'VALOR'
        DataPipeline = pplConfereEnvioFolha
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereEnvioFolha'
        mmHeight = 3175
        mmLeft = 111919
        mmTop = 8467
        mmWidth = 16140
        BandType = 7
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 52917
        mmTop = 8202
        mmWidth = 15610
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = pplConfereEnvioFolha
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplConfereEnvioFolha'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 5821
          mmWidth = 183542
          BandType = 3
          GroupNo = 0
        end
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 0
          mmTop = 1588
          mmWidth = 183542
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Qtde'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 88371
          mmTop = 2117
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 109802
          mmTop = 2117
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'NOME'
          DataPipeline = pplConfereEnvioFolha
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplConfereEnvioFolha'
          mmHeight = 3969
          mmLeft = 1588
          mmTop = 1852
          mmWidth = 77258
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object rptContratosAdminAnalShape1: TppShape
          UserName = 'rptContratosAdminAnalShape1'
          mmHeight = 5556
          mmLeft = 72231
          mmTop = 1852
          mmWidth = 111390
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'QTDCONTRATO'
          DataPipeline = pplConfereEnvioFolha
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConfereEnvioFolha'
          mmHeight = 3175
          mmLeft = 92869
          mmTop = 3175
          mmWidth = 7408
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc25: TppDBCalc
          UserName = 'DBCalc25'
          DataField = 'VALOR'
          DataPipeline = pplConfereEnvioFolha
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConfereEnvioFolha'
          mmHeight = 3175
          mmLeft = 111919
          mmTop = 2910
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 529
          mmWidth = 183542
          BandType = 5
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Total da Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 37571
          mmTop = 2646
          mmWidth = 30956
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
