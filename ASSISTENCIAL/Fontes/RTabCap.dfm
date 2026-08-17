inherited RptTabCap: TRptTabCap
  Left = 323
  Top = 200
  Width = 374
  Height = 194
  Caption = 'RptTabCap'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório de Planos Assistenciais'
    DataBaseName = 'BaseDados'
    Formheight = 100
    Left = 141
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    ChangeConnectionType = CrmRptCMChangeConnectionType
    ChangeConnection = CrmRptCMChangeConnection
    DataBaseName = 'BaseDados'
    ShowCancelDialog = False
    Report = rpTabCap
    Left = 81
  end
  object PpRptCM: TppBDEPipeline
    DataSource = DsRptCM
    UserName = 'PpRptCM'
    Left = 247
    Top = 8
    object PpRptCMppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 40
      DisplayWidth = 40
      Position = 0
    end
    object PpRptCMppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCAPSEGASS'
      FieldName = 'IDCAPSEGASS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object PpRptCMppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANASS'
      FieldName = 'IDPLANASS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object PpRptCMppField4: TppField
      FieldAlias = 'TIPOSEG'
      FieldName = 'TIPOSEG'
      FieldLength = 7
      DisplayWidth = 7
      Position = 3
    end
    object PpRptCMppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'CAPITALMN'
      FieldName = 'CAPITALMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object PpRptCMppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'CAPITALIP'
      FieldName = 'CAPITALIP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object PpRptCMppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CAPITALMA'
      FieldName = 'CAPITALMA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object PpRptCMppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'PREMIOFXA'
      FieldName = 'PREMIOFXA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object PpRptCMppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'PREMIOFXB'
      FieldName = 'PREMIOFXB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object PpRptCMppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'PREMIOFXC'
      FieldName = 'PREMIOFXC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object PpRptCMppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'PREMIOFXD'
      FieldName = 'PREMIOFXD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object PpRptCMppField12: TppField
      FieldAlias = 'DESCPLANO'
      FieldName = 'DESCPLANO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 11
    end
    object PpRptCMppField13: TppField
      FieldAlias = 'TRGDTINCLUSAO'
      FieldName = 'TRGDTINCLUSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 12
    end
    object PpRptCMppField14: TppField
      FieldAlias = 'TRGUSERINCLUSAO'
      FieldName = 'TRGUSERINCLUSAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 13
    end
    object PpRptCMppField15: TppField
      FieldAlias = 'DTVIGENCIA'
      FieldName = 'DTVIGENCIA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 14
    end
    object PpRptCMppField16: TppField
      FieldAlias = 'FLGVIGENCIA'
      FieldName = 'FLGVIGENCIA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
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
    SQL.Strings = (
      'SELECT PL.NOME, CP.*'
      'FROM PLANASS PL, CAPSEGASS CP'
      'WHERE (CP.IDPLANASS = PL.IDPLANASS) AND'
      '      (CP.FLGVIGENCIA='#39'1'#39')'
      'ORDER BY ORDEM')
    ValidateWithMask = True
    Left = 11
    Top = 120
    object QryRptCMNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.CAPSEGASS.IDCAPSEGASS'
      Size = 40
    end
    object QryRptCMIDCAPSEGASS: TFloatField
      FieldName = 'IDCAPSEGASS'
      Origin = 'BASEDADOS.CAPSEGASS.IDPLANASS'
    end
    object QryRptCMIDPLANASS: TFloatField
      FieldName = 'IDPLANASS'
      Origin = 'BASEDADOS.CAPSEGASS.TIPOSEG'
    end
    object QryRptCMTIPOSEG: TStringField
      FieldName = 'TIPOSEG'
      Origin = 'BASEDADOS.CAPSEGASS.CAPITALMN'
      Size = 7
    end
    object QryRptCMCAPITALMN: TFloatField
      FieldName = 'CAPITALMN'
      Origin = 'BASEDADOS.CAPSEGASS.CAPITALIP'
    end
    object QryRptCMCAPITALIP: TFloatField
      FieldName = 'CAPITALIP'
      Origin = 'BASEDADOS.CAPSEGASS.CAPITALMA'
    end
    object QryRptCMCAPITALMA: TFloatField
      FieldName = 'CAPITALMA'
      Origin = 'BASEDADOS.CAPSEGASS.PREMIOFXA'
    end
    object QryRptCMPREMIOFXA: TFloatField
      FieldName = 'PREMIOFXA'
      Origin = 'BASEDADOS.CAPSEGASS.PREMIOFXB'
    end
    object QryRptCMPREMIOFXB: TFloatField
      FieldName = 'PREMIOFXB'
      Origin = 'BASEDADOS.CAPSEGASS.PREMIOFXC'
    end
    object QryRptCMPREMIOFXC: TFloatField
      FieldName = 'PREMIOFXC'
      Origin = 'BASEDADOS.CAPSEGASS.PREMIOFXD'
    end
    object QryRptCMPREMIOFXD: TFloatField
      FieldName = 'PREMIOFXD'
      Origin = 'BASEDADOS.CAPSEGASS.DESCPLANO'
    end
    object QryRptCMDESCPLANO: TStringField
      FieldName = 'DESCPLANO'
      Origin = 'BASEDADOS.CAPSEGASS.TRGDTINCLUSAO'
      Size = 40
    end
    object QryRptCMTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.CAPSEGASS.TRGUSERINCLUSAO'
    end
    object QryRptCMTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.CAPSEGASS.DTVIGENCIA'
      Size = 30
    end
    object QryRptCMDTVIGENCIA: TDateTimeField
      FieldName = 'DTVIGENCIA'
      Origin = 'BASEDADOS.CAPSEGASS.FLGVIGENTE'
    end
    object QryRptCMFLGVIGENCIA: TStringField
      FieldName = 'FLGVIGENCIA'
      Origin = 'BASEDADOS.PLANASS.NOME'
      Size = 1
    end
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
    DataSet = qryFundacao
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
      '     ( P.IDIMAGEM = I.IDIMAGEM)')
    ValidateWithMask = True
    Left = 18
    Top = 66
    object qryFundacaoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryFundacaoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'BASEDADOS.PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryFundacaoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'BASEDADOS.ENDPESS.LOGRADOURO'
      Size = 60
    end
    object qryFundacaoNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'BASEDADOS.ENDPESS.NUMERO'
      Size = 8
    end
    object qryFundacaoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'BASEDADOS.ENDPESS.COMPLEMENTO'
    end
    object qryFundacaoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BASEDADOS.ENDPESS.BAIRRO'
    end
    object qryFundacaoCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'BASEDADOS.CIDADES.NOME'
      Size = 50
    end
    object qryFundacaoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Origin = 'BASEDADOS.CIDADES.CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryFundacaoCEP: TStringField
      FieldName = 'CEP'
      Origin = 'BASEDADOS.ENDPESS.CEP'
      Size = 8
    end
    object qryFundacaoIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      Origin = 'BASEDADOS.IMAGENS.IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
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
  object rpTabCap: TppReport
    AutoStop = False
    DataPipeline = PpRptCM
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 308
    Top = 13
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 53181
      mmPrintPosition = 0
      object rpPlanassAnalitLabel1: TppLabel
        UserName = 'rpPlanassAnalitLabel1'
        Caption = 'PLANOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 29633
        mmTop = 38100
        mmWidth = 13229
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
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 21960
        mmWidth = 5821
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
      object ppLine2: TppLine
        UserName = 'Line2'
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 3440
        mmTop = 28840
        mmWidth = 260086
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Style = lsDouble
        Weight = 0.75
        mmHeight = 24342
        mmLeft = 3440
        mmTop = 28840
        mmWidth = 529
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 85725
        mmTop = 34925
        mmWidth = 177536
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 24342
        mmLeft = 85461
        mmTop = 28839
        mmWidth = 794
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 17992
        mmLeft = 107950
        mmTop = 35190
        mmWidth = 265
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 18256
        mmLeft = 130175
        mmTop = 34925
        mmWidth = 265
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 18256
        mmLeft = 153988
        mmTop = 34925
        mmWidth = 265
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 17992
        mmLeft = 178065
        mmTop = 35190
        mmWidth = 265
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 18256
        mmLeft = 198173
        mmTop = 34925
        mmWidth = 265
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 17992
        mmLeft = 219075
        mmTop = 35190
        mmWidth = 265
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 18256
        mmLeft = 240242
        mmTop = 34925
        mmWidth = 265
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Style = lsDouble
        Weight = 0.75
        mmHeight = 24077
        mmLeft = 263261
        mmTop = 29104
        mmWidth = 265
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'CAPITAIS SEGURADOS (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 105834
        mmTop = 30427
        mmWidth = 43656
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'PRÊMIOS (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 206905
        mmTop = 30427
        mmWidth = 22225
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 3440
        mmTop = 51329
        mmWidth = 260351
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'SEGURADOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 87842
        mmTop = 41275
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'MORTE POR QUALQUER CAUSA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 11906
        mmLeft = 109273
        mmTop = 37306
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'MORTE ACIDENTAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 131498
        mmTop = 37571
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'INVALIDEZ PERMANENTE TOTAL OU PARC.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 15081
        mmLeft = 155575
        mmTop = 35719
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'ATÉ 39 ANOS FAIXA A'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 13758
        mmLeft = 179917
        mmTop = 36513
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'DE 40 A 49 ANOS FAIXA B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 13758
        mmLeft = 200555
        mmTop = 36777
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'DE 50 A 59 ANOS FAIXA A'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 13758
        mmLeft = 221192
        mmTop = 37042
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'ACIMA DE 60 ANOS FAIXA A'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 13758
        mmLeft = 242888
        mmTop = 36777
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Início da Vigência '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 169069
        mmTop = 23813
        mmWidth = 31221
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DTVIGENCIA'
        DataPipeline = PpRptCM
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 200819
        mmTop = 23813
        mmWidth = 24077
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object rpPlanassAnalitDBText1: TppDBText
        UserName = 'rpPlanassAnalitDBText1'
        DataField = 'NOME'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 7408
        mmTop = 265
        mmWidth = 47625
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'TIPOSEG'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 86254
        mmTop = 265
        mmWidth = 20902
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Position = lpLeft
        Style = lsDouble
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 3440
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 85461
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 107950
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 130175
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line201'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 153988
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 178065
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 198173
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 219075
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 240242
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine25: TppLine
        UserName = 'Line25'
        Position = lpLeft
        Style = lsDouble
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 263261
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppVarCapMN: TppVariable
        UserName = 'VarCapMN'
        AutoSize = False
        CalcOrder = 0
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 109009
        mmTop = 265
        mmWidth = 19579
        BandType = 4
      end
      object ppVarCapMA: TppVariable
        UserName = 'ppVarCapMA'
        AutoSize = False
        CalcOrder = 1
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 131234
        mmTop = 265
        mmWidth = 20902
        BandType = 4
      end
      object ppVarCapIP: TppVariable
        UserName = 'ppVarCapIP'
        AutoSize = False
        CalcOrder = 2
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 155046
        mmTop = 265
        mmWidth = 21431
        BandType = 4
      end
      object ppVarPremioFxA: TppVariable
        UserName = 'ppVarPremioFxA'
        AutoSize = False
        CalcOrder = 3
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 179123
        mmTop = 265
        mmWidth = 17727
        BandType = 4
      end
      object ppVarPremioFxB: TppVariable
        UserName = 'ppVarPremioFxB'
        AutoSize = False
        CalcOrder = 4
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 199496
        mmTop = 265
        mmWidth = 17992
        BandType = 4
      end
      object ppVarPremioFxC: TppVariable
        UserName = 'ppVarPremioFxC'
        AutoSize = False
        CalcOrder = 5
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 220398
        mmTop = 265
        mmWidth = 18256
        BandType = 4
      end
      object ppVarPremioFxD: TppVariable
        UserName = 'ppVarPremioFxD'
        AutoSize = False
        CalcOrder = 6
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 241300
        mmTop = 265
        mmWidth = 20638
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
      object ppLine17: TppLine
        UserName = 'ppLine17'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 8
      end
      object ppLabelSistema: TppLabel
        UserName = 'LabelSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 3175
        mmWidth = 198173
        BandType = 8
      end
      object ppCalc17: TppSystemVariable
        UserName = 'Calc17'
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
        mmLeft = 2910
        mmTop = 2910
        mmWidth = 197380
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
        mmLeft = 161661
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'TABELA DE USO INTERNO - NÃO SERVE PARA AGENCIAMENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 1588
        mmWidth = 100542
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDPLANASS'
      DataPipeline = PpRptCM
      KeepTogether = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 1058
        mmPrintPosition = 0
        object ppLine15: TppLine
          UserName = 'Line11'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 265
          mmLeft = 3440
          mmTop = 529
          mmWidth = 259821
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060E
        5661724361704D4E4F6E43616C630B50726F6772616D54797065070B74745072
        6F63656475726506536F75726365066270726F63656475726520566172436170
        4D4E4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A62
        6567696E0D0A0D0A202056616C7565203A3D5070527074434D5B274341504954
        414C4D4E275D3B200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65
        06085661724361704D4E094576656E744E616D6506064F6E43616C6307457665
        6E74494402210001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65061070705661724361704D414F6E43616C630B50726F6772616D54
        797065070B747450726F63656475726506536F75726365066470726F63656475
        72652070705661724361704D414F6E43616C63287661722056616C75653A2056
        617269616E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D507052
        7074434D5B274341504954414C4D41275D3B200D0A0D0A656E643B0D0A0D436F
        6D706F6E656E744E616D65060A70705661724361704D41094576656E744E616D
        6506064F6E43616C63074576656E74494402210001060F5472614576656E7448
        616E646C65720B50726F6772616D4E616D650610707056617243617049504F6E
        43616C630B50726F6772616D54797065070B747450726F63656475726506536F
        75726365066470726F63656475726520707056617243617049504F6E43616C63
        287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A
        202056616C7565203A3D5070527074434D5B274341504954414C4950275D3B20
        0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060A707056617243
        61704950094576656E744E616D6506064F6E43616C63074576656E7449440221
        0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
        1470705661725072656D696F4678414F6E43616C630B50726F6772616D547970
        65070B747450726F63656475726506536F75726365066870726F636564757265
        2070705661725072656D696F4678414F6E43616C63287661722056616C75653A
        2056617269616E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D50
        70527074434D5B275052454D494F465841275D3B200D0A0D0A656E643B0D0A0D
        436F6D706F6E656E744E616D65060E70705661725072656D696F467841094576
        656E744E616D6506064F6E43616C63074576656E74494402210001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D650614707056617250
        72656D696F4678424F6E43616C630B50726F6772616D54797065070B74745072
        6F63656475726506536F75726365066870726F63656475726520707056617250
        72656D696F4678424F6E43616C63287661722056616C75653A2056617269616E
        74293B0D0A626567696E0D0A0D0A202056616C7565203A3D205070527074434D
        5B275052454D494F465842275D3B0D0A0D0A656E643B0D0A0D436F6D706F6E65
        6E744E616D65060E70705661725072656D696F467842094576656E744E616D65
        06064F6E43616C63074576656E74494402210001060F5472614576656E744861
        6E646C65720B50726F6772616D4E616D65061470705661725072656D696F4678
        434F6E43616C630B50726F6772616D54797065070B747450726F636564757265
        06536F75726365066870726F6365647572652070705661725072656D696F4678
        434F6E43616C63287661722056616C75653A2056617269616E74293B0D0A6265
        67696E0D0A0D0A202056616C7565203A3D205070527074434D5B275052454D49
        4F465843275D3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        0E70705661725072656D696F467843094576656E744E616D6506064F6E43616C
        63074576656E74494402210001060F5472614576656E7448616E646C65720B50
        726F6772616D4E616D65061470705661725072656D696F4678444F6E43616C63
        0B50726F6772616D54797065070B747450726F63656475726506536F75726365
        066570726F6365647572652070705661725072656D696F4678444F6E43616C63
        287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A
        202056616C7565203A3D5070527074434D5B275052454D494F465844275D3B0D
        0A656E643B0D0A0D436F6D706F6E656E744E616D65060E70705661725072656D
        696F467844094576656E744E616D6506064F6E43616C63074576656E74494402
        210000}
    end
  end
end
