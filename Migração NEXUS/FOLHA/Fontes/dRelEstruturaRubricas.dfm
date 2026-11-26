inherited dtmRelEstruturaRubricas: TdtmRelEstruturaRubricas
  Left = 207
  Top = 177
  Width = 450
  Height = 311
  Caption = 'dtmRelEstruturaRubricas'
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
    DataPipelineName = 'pplExemplo'
  end
  object pplEstrutura: TppBDEPipeline
    DataSource = dsEstrutura
    UserName = 'lExemplo1'
    Left = 157
    Top = 88
    object pplEstruturappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDESTRUTURA'
      FieldName = 'IDESTRUTURA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplEstruturappField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDREGRA'
      FieldName = 'IDREGRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplEstruturappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRUBRICAEXIBICAO'
      FieldName = 'IDRUBRICAEXIBICAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplEstruturappField4: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplEstruturappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRUBRICA'
      FieldName = 'IDRUBRICA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplEstruturappField6: TppField
      FieldAlias = 'GRUPOCALCULO'
      FieldName = 'GRUPOCALCULO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object pplEstruturappField7: TppField
      FieldAlias = 'NOMEREGRA'
      FieldName = 'NOMEREGRA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object pplEstruturappField8: TppField
      FieldAlias = 'RUBESTRUTURA'
      FieldName = 'RUBESTRUTURA'
      FieldLength = 130
      DisplayWidth = 130
      Position = 7
    end
    object pplEstruturappField9: TppField
      FieldAlias = 'RUBESTXRUB'
      FieldName = 'RUBESTXRUB'
      FieldLength = 130
      DisplayWidth = 130
      Position = 8
    end
    object pplEstruturappField10: TppField
      FieldAlias = 'CODPROVDESC'
      FieldName = 'CODPROVDESC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 9
    end
  end
  object dsEstrutura: TwwDataSource
    DataSet = qryEstrutura
    Left = 95
    Top = 88
  end
  object qryEstrutura: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   EST.IDESTRUTURA,'
      '   EST.IDREGRA,'
      '   EST.IDRUBRICAEXIBICAO,'
      '   EST.DESCRICAO,'
      '   EXR.IDRUBRICA,'
      '   EXR.GRUPOCALCULO,'
      '   REG.NOMEREGRA,'
      '   RUE.DESCRICAO AS RUBESTRUTURA,'
      '   RUX.CODPROVDESC, '
      '   RUX.DESCRICAO AS RUBESTXRUB'
      
        'FROM ESTRUTURACALCULO EST,ESTRUTURAXRUBRICA EXR,PROVDESC RUE,PRO' +
        'VDESC RUX,'
      '     REGRA REG'
      'WHERE'
      '    EXR.IDESTRUTURA = EST.IDESTRUTURA'
      'AND REG.IDREGRA = EST.IDREGRA'
      'AND RUE.IDPROVENTO = EST.IDRUBRICAEXIBICAO'
      'AND RUX.IDPROVENTO = EXR.IDRUBRICA'
      'ORDER BY'
      '   EST.IDESTRUTURA, EXR.GRUPOCALCULO, EXR.IDRUBRICA')
    ValidateWithMask = True
    Left = 34
    Top = 88
    object qryEstruturaIDESTRUTURA: TFloatField
      FieldName = 'IDESTRUTURA'
      Origin = 'BASEDADOS.ESTRUTURACALCULO.IDESTRUTURA'
    end
    object qryEstruturaIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.ESTRUTURACALCULO.IDREGRA'
    end
    object qryEstruturaIDRUBRICAEXIBICAO: TFloatField
      FieldName = 'IDRUBRICAEXIBICAO'
      Origin = 'BASEDADOS.ESTRUTURACALCULO.IDRUBRICAEXIBICAO'
    end
    object qryEstruturaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.ESTRUTURACALCULO.DESCRICAO'
      Size = 60
    end
    object qryEstruturaIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
      Origin = 'BASEDADOS.ESTRUTURAXRUBRICA.IDRUBRICA'
    end
    object qryEstruturaGRUPOCALCULO: TStringField
      FieldName = 'GRUPOCALCULO'
      Origin = 'BASEDADOS.ESTRUTURAXRUBRICA.GRUPOCALCULO'
      FixedChar = True
      Size = 1
    end
    object qryEstruturaNOMEREGRA: TStringField
      FieldName = 'NOMEREGRA'
      Origin = 'BASEDADOS.REGRA.NOMEREGRA'
      Size = 60
    end
    object qryEstruturaRUBESTRUTURA: TStringField
      FieldName = 'RUBESTRUTURA'
      Origin = 'BASEDADOS.PROVDESC.DESCRICAO'
      Size = 130
    end
    object qryEstruturaRUBESTXRUB: TStringField
      FieldName = 'RUBESTXRUB'
      Origin = 'BASEDADOS.PROVDESC.DESCRICAO'
      Size = 130
    end
    object qryEstruturaCODPROVDESC: TStringField
      FieldName = 'CODPROVDESC'
      Origin = 'BASEDADOS.PROVDESC.CODPROVDESC'
      Size = 15
    end
  end
  object ppEstrutura: TppReport
    AutoStop = False
    DataPipeline = pplEstrutura
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 218
    Top = 88
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplEstrutura'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33338
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 32015
        mmWidth = 197300
        BandType = 0
      end
      object rpBenefAlterDBImage1: TppDBImage
        UserName = 'rpBenefAlterDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppfundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppfundacao'
        mmHeight = 25135
        mmLeft = 0
        mmTop = 0
        mmWidth = 32544
        BandType = 0
      end
      object rpBenefAlterDBText9: TppDBText
        UserName = 'rpBenefAlterDBText9'
        DataField = 'NOME'
        DataPipeline = ppfundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppfundacao'
        mmHeight = 5821
        mmLeft = 33602
        mmTop = 794
        mmWidth = 133615
        BandType = 0
      end
      object rpBenefAlterDBText10: TppDBText
        UserName = 'rpBenefAlterDBText10'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppfundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppfundacao'
        mmHeight = 4233
        mmLeft = 34131
        mmTop = 8996
        mmWidth = 76994
        BandType = 0
      end
      object rpBenefAlterDBText11: TppDBText
        UserName = 'rpBenefAlterDBText11'
        DataField = 'LOGRADOURO'
        DataPipeline = ppfundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppfundacao'
        mmHeight = 3175
        mmLeft = 34131
        mmTop = 14817
        mmWidth = 41804
        BandType = 0
      end
      object rpBenefAlterLabel9: TppLabel
        UserName = 'rpBenefAlterLabel9'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 34131
        mmTop = 20373
        mmWidth = 5556
        BandType = 0
      end
      object rpBenefAlterDBText13: TppDBText
        UserName = 'rpBenefAlterDBText13'
        DataField = 'CEP'
        DataPipeline = ppfundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppfundacao'
        mmHeight = 3175
        mmLeft = 44715
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object rpBenefAlterDBText14: TppDBText
        UserName = 'rpBenefAlterDBText14'
        DataField = 'CIDADE'
        DataPipeline = ppfundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppfundacao'
        mmHeight = 3175
        mmLeft = 83873
        mmTop = 14817
        mmWidth = 26988
        BandType = 0
      end
      object rpBenefAlterDBText16: TppDBText
        UserName = 'rpBenefAlterDBText16'
        DataField = 'CODESTADO'
        DataPipeline = ppfundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppfundacao'
        mmHeight = 3175
        mmLeft = 112977
        mmTop = 15081
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label2'
        Caption = 'Relatório  de Estrutura Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 74877
        mmTop = 25400
        mmWidth = 62706
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'IDRUBRICA'
        DataPipeline = pplEstrutura
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplEstrutura'
        mmHeight = 3175
        mmLeft = 23548
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'RUBESTXRUB'
        DataPipeline = pplEstrutura
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplEstrutura'
        mmHeight = 3175
        mmLeft = 42863
        mmTop = 529
        mmWidth = 81227
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'CODPROVDESC'
        DataPipeline = pplEstrutura
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplEstrutura'
        mmHeight = 3175
        mmLeft = 4498
        mmTop = 529
        mmWidth = 17198
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
    object ppGroup1: TppGroup
      BreakName = 'IDESTRUTURA'
      DataPipeline = pplEstrutura
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplEstrutura'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 23019
        mmPrintPosition = 0
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Rubrica:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 1588
          mmTop = 17463
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'IDRUBRICAEXIBICAO'
          DataPipeline = pplEstrutura
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplEstrutura'
          mmHeight = 3175
          mmLeft = 18256
          mmTop = 17727
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'RUBESTRUTURA'
          DataPipeline = pplEstrutura
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplEstrutura'
          mmHeight = 3175
          mmLeft = 33602
          mmTop = 17727
          mmWidth = 107156
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'NOMEREGRA'
          DataPipeline = pplEstrutura
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplEstrutura'
          mmHeight = 3969
          mmLeft = 17992
          mmTop = 12435
          mmWidth = 53975
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DESCRICAO'
          DataPipeline = pplEstrutura
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplEstrutura'
          mmHeight = 3175
          mmLeft = 18256
          mmTop = 7938
          mmWidth = 53975
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Regra:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 1323
          mmTop = 12171
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          Caption = 'Estrutura:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 1323
          mmTop = 7673
          mmWidth = 11906
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
      BreakName = 'GRUPOCALCULO'
      DataPipeline = pplEstrutura
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplEstrutura'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 18256
        mmPrintPosition = 0
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Grupo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 4763
          mmTop = 6615
          mmWidth = 8467
          BandType = 3
          GroupNo = 1
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'GRUPOCALCULO'
          DataPipeline = pplEstrutura
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplEstrutura'
          mmHeight = 3175
          mmLeft = 16933
          mmTop = 6879
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Cód. Interno'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 25400
          mmTop = 12435
          mmWidth = 15610
          BandType = 3
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Descrição  Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 48948
          mmTop = 12435
          mmWidth = 29369
          BandType = 3
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label3'
          Caption = 'Cód. Externo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 5556
          mmTop = 12435
          mmWidth = 17198
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
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 88
    Top = 136
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME          , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO        , E.COMPLEMENTO, E.BAIRRO    ,'
      '       C.NOME AS CIDADE, C.CODESTADO  , E.CEP       , I.IMAGEM, '
      '       (E.LOGRADOURO||'#39', '#39'||E.NUMERO) AS ENDERECO   ,'
      '       (E.BAIRRO||'#39' - '#39'||C.NOME||'#39' - '#39'||C.CODESTADO) AS BARCIDUF'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)'
      '')
    ValidateWithMask = True
    Left = 24
    Top = 136
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = '1'
      end>
    object qryFundacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryFundacaoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryFundacaoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object qryFundacaoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object qryFundacaoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qryFundacaoBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qryFundacaoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryFundacaoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryFundacaoCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryFundacaoIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryFundacaoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 70
    end
    object qryFundacaoBARCIDUF: TStringField
      FieldName = 'BARCIDUF'
      Size = 79
    end
  end
  object ppfundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'fundacao'
    Left = 157
    Top = 136
    object ppfundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppfundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppfundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppfundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppfundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppfundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppfundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppfundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppfundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppfundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppfundacaoppField11: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppfundacaoppField12: TppField
      FieldAlias = 'BARCIDUF'
      FieldName = 'BARCIDUF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
  end
end
