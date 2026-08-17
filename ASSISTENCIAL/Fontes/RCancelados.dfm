inherited RptCancelados: TRptCancelados
  Left = 255
  Top = 157
  Width = 374
  Height = 194
  Caption = 'RptCancelados'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório de Participantes Cancelados'
    DataBaseName = 'BaseDados'
    Formheight = 200
    Left = 141
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    ChangeConnectionType = CrmRptCMChangeConnectionType
    ChangeConnection = CrmRptCMChangeConnection
    DataBaseName = 'BaseDados'
    ShowCancelDialog = False
    Report = RpCancel
    Left = 81
  end
  object RpCancel: TppReport
    AutoStop = False
    DataPipeline = PpRptCM
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
    PrinterSetup.PaperSize = 0
    Template.SaveTo = stDatabase
    Units = utMillimeters
    BeforePrint = RpCancelBeforePrint
    CachePages = True
    DeviceType = 'Screen'
    ModalCancelDialog = False
    ShowCancelDialog = False
    Left = 299
    Top = 13
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand23: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35190
      mmPrintPosition = 0
      object ppLine34: TppLine
        UserName = 'Line34'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 265
        mmTop = 26723
        mmWidth = 197380
        BandType = 0
      end
      object ppLine36: TppLine
        UserName = 'Line36'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 529
        mmTop = 34131
        mmWidth = 197380
        BandType = 0
      end
      object ppLabelTituloSeg: TppLabel
        UserName = 'ppLabel87'
        Caption = 'SEGURADOS CANCELADOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 2910
        mmTop = 28310
        mmWidth = 57944
        BandType = 0
      end
      object ppDBImage19: TppDBImage
        UserName = 'DBImage17'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText187: TppDBText
        UserName = 'DBText165'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object ppDBText188: TppDBText
        UserName = 'DBText166'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText189: TppDBText
        UserName = 'DBText167'
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 12965
        mmWidth = 41804
        BandType = 0
      end
      object ppDBText190: TppDBText
        UserName = 'DBText168'
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 17463
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel113: TppLabel
        UserName = 'Label98'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 21960
        mmWidth = 5027
        BandType = 0
      end
      object ppDBText191: TppDBText
        UserName = 'DBText169'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 50800
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText192: TppDBText
        UserName = 'DBText170'
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 64029
        mmTop = 17463
        mmWidth = 23019
        BandType = 0
      end
      object ppDBText193: TppDBText
        UserName = 'DBText171'
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 86519
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText194: TppDBText
        UserName = 'DBText172'
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 87842
        mmTop = 17198
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand21: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText195: TppDBText
        UserName = 'DBText1'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 2910
        mmTop = 265
        mmWidth = 18521
        BandType = 4
      end
      object ppDBTextTitular: TppDBText
        OnPrint = ppDBTextTitularPrint
        UserName = 'DBTextTitular'
        DataField = 'TITULAR'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        SuppressRepeatedValues = True
        Transparent = True
        mmHeight = 3175
        mmLeft = 21960
        mmTop = 265
        mmWidth = 60061
        BandType = 4
      end
      object ppDBText197: TppDBText
        UserName = 'DBText197'
        DataField = 'DESCRICAO'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 83079
        mmTop = 265
        mmWidth = 48683
        BandType = 4
      end
      object ppDBText199: TppDBText
        UserName = 'DBText199'
        DataField = 'DTCANCELAMENTO'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 133615
        mmTop = 265
        mmWidth = 18521
        BandType = 4
      end
    end
    object ppFooterBand21: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLabelSistema: TppLabel
        UserName = 'ppLabel90'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1588
        mmTop = 2381
        mmWidth = 198173
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'Calc39'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 2381
        mmWidth = 197644
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'ppCalc401'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 163513
        mmTop = 2646
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand5: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 25665
      mmPrintPosition = 0
      object ppLabelTotalT: TppLabel
        OnPrint = ppLabelTotalTPrint
        UserName = 'rpRelBenSaudeLabel6'
        Caption = 'Quantidade de Segurados =>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 10848
        mmWidth = 49477
        BandType = 7
      end
    end
    object ppGroup14: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = PpRptCM
      NewPage = True
      UserName = 'Group14'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand14: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object ppLabel120: TppLabel
          UserName = 'rpRelBenSaudeLabel2'
          Caption = 'Patrocinadora: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 3704
          mmTop = 1323
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object ppDBText198: TppDBText
          UserName = 'rpRelBenSaudeDBText1'
          AutoSize = True
          DataField = 'PATROCINADORA'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5292
          mmLeft = 36777
          mmTop = 1323
          mmWidth = 37306
          BandType = 3
          GroupNo = 0
        end
        object ppLabel121: TppLabel
          UserName = 'ppLabel91'
          Caption = 'Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2910
          mmTop = 7408
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppLabel122: TppLabel
          UserName = 'ppLabel92'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 23283
          mmTop = 7408
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLabel112: TppLabel
          UserName = 'Label112'
          AutoSize = False
          Caption = 'Situação '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 83344
          mmTop = 7673
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppLabel118: TppLabel
          UserName = 'Label118'
          AutoSize = False
          Caption = 'Data de Cancelamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 132292
          mmTop = 7673
          mmWidth = 33338
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand13: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object ppLabelTotal: TppLabel
          OnPrint = ppLabelTotalPrint
          UserName = 'LabelTotal'
          Caption = 'Total da Patrocinadora => '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 3969
          mmTop = 3704
          mmWidth = 44979
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object PpRptCM: TppBDEPipeline
    DataSource = DsRptCM
    UserName = 'PpRptCM'
    Left = 247
    Top = 8
    object PpRptCMppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object PpRptCMppField2: TppField
      FieldAlias = 'NOME_1'
      FieldName = 'NOME_1'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object PpRptCMppField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object PpRptCMppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSCRICAONUMERO'
      FieldName = 'INSCRICAONUMERO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object PpRptCMppField5: TppField
      FieldAlias = 'DTCANCELAMENTO'
      FieldName = 'DTCANCELAMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
  end
  object DsRptCM: TwwDataSource
    DataSet = Cds
    Left = 153
    Top = 120
  end
  object Cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 104
    Top = 120
  end
  object Dsp: TDataSetProvider
    DataSet = QryRptCM
    Constraints = True
    Left = 57
    Top = 120
  end
  object QryRptCM: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 11
    Top = 120
  end
  object AQryFundacao: TADOQuery
    DataSource = DsRptCM
    Parameters = <>
    Left = 305
    Top = 120
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 305
    Top = 65
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object dsFundacao: TwwDataSource
    DataSet = CdsFundacao
    Left = 241
    Top = 66
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P,  FUNDACAO F,  ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE '
      '     ( P.IDPESSOA =  F.IDPESSOA) AND'
      '     ( P.IDPESSOA =  E.IDPESSOA) AND'
      '     (E.IDCIDADES   = C.IDCIDADES)  AND'
      '     ( P.IDIMAGEM = I.IDIMAGEM)'
      ' ')
    ValidateWithMask = True
    Left = 18
    Top = 66
  end
  object DspFundacao: TDataSetProvider
    DataSet = qryFundacao
    Constraints = True
    Left = 96
    Top = 66
  end
  object CdsFundacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFundacao'
    Left = 171
    Top = 67
  end
  object aQryRptCm: TADOQuery
    DataSource = DsRptCM
    Parameters = <>
    Left = 209
    Top = 120
  end
end
