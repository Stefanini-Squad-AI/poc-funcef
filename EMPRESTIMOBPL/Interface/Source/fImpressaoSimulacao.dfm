inherited frmImpressaoSimulacao: TfrmImpressaoSimulacao
  Left = 348
  Top = 213
  Caption = 'frmImpressaoSimulacao'
  PixelsPerInch = 96
  TextHeight = 13
  object QryDados: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 161
    Top = 21
    object QryDadosPrazo: TFloatField
      FieldName = 'Prazo'
    end
    object QryDadosValorSolicitado: TFloatField
      FieldName = 'Valor Solicitado'
    end
    object QryDadosJurosDias: TFloatField
      FieldName = 'Juros Dias'
    end
    object QryDadosPrestao: TFloatField
      FieldName = 'Prestação'
    end
    object QryDadosQQM: TFloatField
      FieldName = 'QQM'
    end
    object QryDadosIOF: TFloatField
      FieldName = 'IOF'
    end
    object QryDadosQuitEPAnterior: TFloatField
      FieldName = 'Quit EP Anterior'
    end
    object QryDadosTxdeAdm: TFloatField
      FieldName = 'Tx de Adm'
    end
    object QryDadosCPMF: TFloatField
      FieldName = 'CPMF'
    end
    object QryDadosCrditoEmprstimo: TFloatField
      FieldName = 'Crédito Empréstimo'
    end
  end
  object QryCadModelo: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 332
    Top = 61
  end
  object qryReports: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT '
      '   REPORTS.NAME,'
      '   REPORTS.IDREPORTS,'
      '   REPORTS.ORIGEMCM,'
      '   REPORTS.TEMPLATE'
      'FROM'
      '  CM.REPORTS'
      'WHERE'
      '   (REPORTS.IDREPORTS = :PIDREPORTS) AND'
      '   (REPORTS.ORIGEMCM  = :PORIGEMCM)')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 118
    Top = 93
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDREPORTS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PORIGEMCM'
        ParamType = ptUnknown
      end>
    object qryReportsNAME: TStringField
      FieldName = 'NAME'
      Origin = 'REPORTS.NAME'
      Size = 100
    end
    object qryReportsIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'REPORTS.IDREPORTS'
    end
    object qryReportsORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'REPORTS.ORIGEMCM'
    end
    object qryReportsTEMPLATE: TBlobField
      FieldName = 'TEMPLATE'
      Origin = 'REPORTS.TEMPLATE'
      BlobType = ftBlob
      Size = 1
    end
  end
  object DsgnCM: TppDesigner
    Caption = 'Gerador de Relatórios e Gráficos'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000033333300003333330000000000000003BBBBBB3003BBBBBB30000
      00000000003BBBBBB3003BBBBBB30000000000000003BBBB3003BBBBBB300000
      000000000003BBBB3003BBBBB3000000000000000003BBBB3003BBBB30000000
      000000000003BBBBB33BBBBB30000000000000000003BBBBBBBBBBB300000000
      000000000003BBBBBBBBBBB300000000000000700003BBBB333BBBBB30000000
      000000800003BBBB3003BBBBB30000000000F8F00003BBBB3003BBBBB3000000
      008F8F800003BBBB3003BBBBB3000070F8F877F80003BBBB333BBBBBB300007F
      8F00F08F003BBBBBBBBBBBBB3000007800FFF048003BBBBBBBBBBBB300000000
      FFFFF08F8003333333333330000070FFFFCCF804F07000000000000000007FFF
      CCFFFF0F8F0000000000000000007FCCFFFCCF074807000000000000000078FF
      FCCFFFF08F80700000000000000007FCCFFFCCF044F8070000000000000007FF
      FFCCFFFF0F8F8000000000000000078FCCFFFCCF07F77000000000000000007F
      FFFCCFFFF07000000000000000000078FCCFFFCCFF0700000000000000000007
      FFFFCCFFFF80000000000000000000078FCCFFFF877000000000000000000000
      7FFFFF8770000000000000000000000007FF8770000000000000000000000000
      007770000000000000000000000000000000000000000000000000000000FFFE
      0781FFFC0300FFFC0300FFFE0601FFFE0603FFFE0607FFFE0007FFFE000FFFFE
      000FFFDE0007FF0E0603FC0E0603F00E0603C0060003C0040007C004000FC002
      001F0001FFFF0001FFFF0000FFFF00007FFF80003FFF80003FFF80007FFFC001
      FFFFC000FFFFE000FFFFE001FFFFF007FFFFF81FFFFFFC7FFFFFFFFFFFFF}
    Position = poScreenCenter
    ShowComponents = [scLabel, scMemo, scRichText, scCalc, scImage, scShape, scLine, scBarCode, scTeeChart, scDBText, scDBMemo, scDBRichText, scDBCalc, scDBImage, scDBBarCode, scDBTeeChart, scRegion]
    Report = RptModelo
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 262
    Top = 85
  end
  object RptModelo: TppReport
    AutoStop = False
    DataPipeline = PpDados
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
    Template.FileName = 'C:\Teste.Txt'
    Template.Format = ftASCII
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 203
    Top = 93
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpDados'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 24606
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Prazo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 19579
        mmWidth = 9525
        BandType = 1
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Vlr Solic.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 16404
        mmTop = 19579
        mmWidth = 15346
        BandType = 1
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Juros Dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 34660
        mmTop = 19579
        mmWidth = 17992
        BandType = 1
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Prestação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 56621
        mmTop = 19579
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'FQM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 80963
        mmTop = 19579
        mmWidth = 7938
        BandType = 1
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Tibutários'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 94986
        mmTop = 19579
        mmWidth = 17463
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Quit. EP Ant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 116417
        mmTop = 19579
        mmWidth = 21960
        BandType = 1
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Encargos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 141817
        mmTop = 14817
        mmWidth = 16140
        BandType = 1
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'CPMF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 162719
        mmTop = 5556
        mmWidth = 10054
        BandType = 1
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Crédito Empréstimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 161396
        mmTop = 19579
        mmWidth = 33867
        BandType = 1
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 24077
        mmWidth = 197300
        BandType = 1
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = 'Simulação de Empréstimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6879
        mmLeft = 62971
        mmTop = 794
        mmWidth = 71173
        BandType = 1
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Admin.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 146050
        mmTop = 19579
        mmWidth = 11906
        BandType = 1
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Encargos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 96309
        mmTop = 14817
        mmWidth = 16140
        BandType = 1
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'CPMF'
        DataPipeline = PpDados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 189177
        mmTop = 265
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'Prazo'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 265
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'Valor Solicitado'
        DataPipeline = PpDados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 13229
        mmTop = 265
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'Juros Dias'
        DataPipeline = PpDados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 34660
        mmTop = 265
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'Prestação'
        DataPipeline = PpDados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 56621
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'FQM'
        DataPipeline = PpDados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 76465
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'Encargos Tributários'
        DataPipeline = PpDados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 100542
        mmTop = 265
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText7: TppDBText
        OnPrint = ppDBText7Print
        UserName = 'DBText7'
        DataField = ' EP Anterior'
        DataPipeline = PpDados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 120386
        mmTop = 265
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'Tx de Adm'
        DataPipeline = PpDados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 142875
        mmTop = 265
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'Crédito Empréstimo'
        DataPipeline = PpDados
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 160867
        mmTop = 265
        mmWidth = 34396
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 5027
        mmWidth = 197300
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 171980
        mmTop = 1588
        mmWidth = 25400
        BandType = 8
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1852
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
    end
  end
  object PpDados: TppBDEPipeline
    DataSource = DsDados
    UserName = 'PpDados'
    Left = 112
    Top = 37
    object PpDadosppField1: TppField
      FieldAlias = 'Prazo'
      FieldName = 'Prazo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpDadosppField2: TppField
      FieldAlias = 'Valor Solicitado'
      FieldName = 'Valor Solicitado'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpDadosppField3: TppField
      FieldAlias = 'Juros Dias'
      FieldName = 'Juros Dias'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpDadosppField4: TppField
      FieldAlias = 'Prestação'
      FieldName = 'Prestação'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PpDadosppField5: TppField
      FieldAlias = 'QQM'
      FieldName = 'QQM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PpDadosppField6: TppField
      FieldAlias = 'IOF'
      FieldName = 'IOF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PpDadosppField7: TppField
      FieldAlias = 'Quit. EP Anterior'
      FieldName = 'Quit. EP Anterior'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PpDadosppField8: TppField
      FieldAlias = 'Tx de Adm'
      FieldName = 'Tx de Adm'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PpDadosppField9: TppField
      FieldAlias = 'CPMF'
      FieldName = 'CPMF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PpDadosppField10: TppField
      FieldAlias = 'Crédito Empréstimo'
      FieldName = 'Crédito Empréstimo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object DsDados: TwwDataSource
    DataSet = QryDados
    Left = 52
    Top = 37
  end
end
