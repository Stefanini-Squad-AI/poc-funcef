inherited DtmRelResRubrica: TDtmRelResRubrica
  Left = 397
  Top = 88
  Width = 276
  Height = 246
  Caption = 'DtmRelResRubrica'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 25
    Top = 71
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
    Left = 25
    Top = 119
  end
  inherited qryExemplo: TwwQuery
    Left = 25
    Top = 162
  end
  inherited rpExemplo: TppReport
    Left = 25
    Top = 11
  end
  object qryRelResumoRubrica: TwwQuery
    BeforeOpen = qryRelResumoRubricaBeforeOpen
    AfterOpen = qryRelResumoRubricaAfterOpen
    AfterClose = qryRelResumoRubricaAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM DUAL ')
    ValidateWithMask = True
    Left = 115
    Top = 162
  end
  object qrRelResumoRubrica: TppReport
    AutoStop = False
    DataPipeline = plRelResumoRubrica
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
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
    BeforePrint = qrRelResumoRubricaBeforePrint
    DeviceType = 'Screen'
    Left = 115
    Top = 11
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand27: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 62442
      mmPrintPosition = 0
      object ppLabel159: TppLabel
        UserName = 'ppLabel159'
        Caption = 'Relatório de Resumo por Rubricas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 108215
        mmTop = 28840
        mmWidth = 69850
        BandType = 0
      end
      object ppLine59: TppLine
        UserName = 'ppLine59'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 34660
        mmWidth = 284300
        BandType = 0
      end
      object lblCaptionPatro: TppLabel
        UserName = 'lblCaptionPatro'
        AutoSize = False
        Caption = 'Patrocinadora:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 41275
        mmWidth = 29634
        BandType = 0
      end
      object ppLine60: TppLine
        UserName = 'ppLine60'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 61648
        mmWidth = 284300
        BandType = 0
      end
      object qrRelResumoRubricaLabel1: TppLabel
        UserName = 'qrRelResumoRubricaLabel1'
        AutoSize = False
        Caption = 'Referência   :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 36248
        mmWidth = 29634
        BandType = 0
      end
      object qrRelResumoRubricaLabel2: TppLabel
        UserName = 'qrRelResumoRubricaLabel2'
        Caption = 'Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 56886
        mmWidth = 13229
        BandType = 0
      end
      object qrlblMesRef: TppLabel
        UserName = 'qrlblMesRef'
        Caption = '-'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 35454
        mmTop = 36248
        mmWidth = 2117
        BandType = 0
      end
      object qrRelResumoRubricaLabel4: TppLabel
        UserName = 'qrRelResumoRubricaLabel4'
        Caption = 'Proventos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 215107
        mmTop = 56886
        mmWidth = 17463
        BandType = 0
      end
      object qrRelResumoRubricaLabel5: TppLabel
        UserName = 'qrRelResumoRubricaLabel5'
        Caption = 'Descontos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 259557
        mmTop = 56886
        mmWidth = 17992
        BandType = 0
      end
      object qrRelResumoRubricaLabel3: TppLabel
        UserName = 'qrRelResumoRubricaLabel3'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 33602
        mmTop = 56886
        mmWidth = 16933
        BandType = 0
      end
      object qrRelResumoRubricaDBText1: TppDBText
        UserName = 'qrRelResumoRubricaDBText1'
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
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object qrRelResumoRubricaDBText2: TppDBText
        UserName = 'qrRelResumoRubricaDBText2'
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
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object qrRelResumoRubricaDBText7: TppDBText
        UserName = 'qrRelResumoRubricaDBText7'
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
      object qrRelResumoRubricaDBImage1: TppDBImage
        UserName = 'qrRelResumoRubricaDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object qrRelResumoRubricaDBText8: TppDBText
        UserName = 'qrRelResumoRubricaDBText8'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 15875
        BandType = 0
      end
      object qrRelResumoRubricaDBText9: TppDBText
        UserName = 'qrRelResumoRubricaDBText9'
        AutoSize = True
        DataField = 'BARCIDUF'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14288
        BandType = 0
      end
      object qrRelResumoRubricaLabel8: TppLabel
        UserName = 'qrRelResumoRubricaLabel8'
        Caption = 'Quant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 176742
        mmTop = 56886
        mmWidth = 11377
        BandType = 0
      end
      object qrRelResumoRubricaLabel9: TppLabel
        UserName = 'qrRelResumoRubricaLabel9'
        AutoSize = False
        Caption = 'Plano        :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 46302
        mmWidth = 29634
        BandType = 0
      end
      object lblPlano: TppLabel
        UserName = 'lblPlano'
        Caption = '-'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 35454
        mmTop = 46302
        mmWidth = 2117
        BandType = 0
      end
      object qrRelResumoRubricaDBText10: TppDBText
        UserName = 'qrRelResumoRubricaDBText10'
        DataField = 'NOME'
        DataPipeline = plRelResumoRubrica
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 35454
        mmTop = 41275
        mmWidth = 111390
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 27781
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand28: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object qrRelResumoRubricaDBText3: TppDBText
        UserName = 'qrRelResumoRubricaDBText3'
        DataField = 'CODPROVDESC'
        DataPipeline = plRelResumoRubrica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object qrRelResumoRubricaDBText4: TppDBText
        UserName = 'qrRelResumoRubricaDBText4'
        DataField = 'DESCRPROVDESC'
        DataPipeline = plRelResumoRubrica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 33602
        mmTop = 0
        mmWidth = 126736
        BandType = 4
      end
      object qrRelResumoRubricaDBText11: TppDBText
        UserName = 'qrRelResumoRubricaDBText11'
        DataField = 'QUANTIDADE'
        DataPipeline = plRelResumoRubrica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 174890
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object qrRelResumoRubricaDBText5: TppDBText
        UserName = 'qrRelResumoRubricaDBText5'
        BlankWhenZero = True
        DataField = 'PROVENTOS'
        DataPipeline = plRelResumoRubrica
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 199761
        mmTop = 0
        mmWidth = 32808
        BandType = 4
      end
      object qrRelResumoRubricaDBText6: TppDBText
        UserName = 'qrRelResumoRubricaDBText6'
        BlankWhenZero = True
        DataField = 'DESCONTOS'
        DataPipeline = plRelResumoRubrica
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 244740
        mmTop = 0
        mmWidth = 32808
        BandType = 4
      end
    end
    object ppFooterBand27: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLine62: TppLine
        UserName = 'ppLine62'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel174: TppLabel
        UserName = 'ppLabel174'
        AutoSize = False
        Caption = 'Folha de Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2910
        mmWidth = 280194
        BandType = 8
      end
      object ppCalc43: TppSystemVariable
        UserName = 'Calc43'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 254265
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc44: TppSystemVariable
        UserName = 'Calc44'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 130969
        mmTop = 2910
        mmWidth = 18785
        BandType = 8
      end
    end
    object qrRelResumoRubricaGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = plRelResumoRubrica
      NewPage = True
      UserName = 'qrRelResumoRubricaGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object qrRelResumoRubricaGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object qrRelResumoRubricaGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 16404
        mmPrintPosition = 0
        object lblSomaProventos: TppDBCalc
          UserName = 'lblSomaProventos'
          AutoSize = True
          DataField = 'PROVENTOS'
          DataPipeline = plRelResumoRubrica
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = qrRelResumoRubricaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 196850
          mmTop = 1058
          mmWidth = 35719
          BandType = 5
          GroupNo = 0
        end
        object lblSomaDescontos: TppDBCalc
          UserName = 'lblSomaDescontos'
          AutoSize = True
          DataField = 'DESCONTOS'
          DataPipeline = plRelResumoRubrica
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = qrRelResumoRubricaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 241565
          mmTop = 1058
          mmWidth = 35983
          BandType = 5
          GroupNo = 0
        end
        object qrRelResumoRubricaLabel6: TppLabel
          UserName = 'qrRelResumoRubricaLabel6'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 144198
          mmTop = 1058
          mmWidth = 9525
          BandType = 5
          GroupNo = 0
        end
        object qrRelResumoRubricaLabel7: TppLabel
          UserName = 'qrRelResumoRubricaLabel7'
          Caption = 'Total Líquido:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 130704
          mmTop = 9260
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object qrRelResumoRubricaDBCalc1: TppDBCalc
          UserName = 'qrRelResumoRubricaDBCalc1'
          DataField = 'QUANTIDADE'
          DataPipeline = plRelResumoRubrica
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = qrRelResumoRubricaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 169069
          mmTop = 1058
          mmWidth = 19050
          BandType = 5
          GroupNo = 0
        end
        object qrRelResumoRubricaLine1: TppLine
          UserName = 'qrRelResumoRubricaLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 529
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object qrRelResumoRubricaDBCalc2: TppDBCalc
          UserName = 'qrRelResumoRubricaDBCalc2'
          DataField = 'LIQ'
          DataPipeline = plRelResumoRubrica
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = qrRelResumoRubricaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 166159
          mmTop = 9260
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
        object qrRelResumoRubricaLine2: TppLine
          UserName = 'qrRelResumoRubricaLine2'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 130704
          mmTop = 7408
          mmWidth = 153723
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object plRelResumoRubrica: TppBDEPipeline
    DataSource = dsRelResumoRubrica
    SkipWhenNoRecords = False
    UserName = 'plRelResumoRubrica'
    Left = 115
    Top = 71
    object plRelResumoRubricappField1: TppField
      FieldAlias = 'DUMMY'
      FieldName = 'DUMMY'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
  end
  object dsRelResumoRubrica: TwwDataSource
    DataSet = qryRelResumoRubrica
    Left = 115
    Top = 119
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
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
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ValidateWithMask = True
    Left = 207
    Top = 162
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 2002
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
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 207
    Top = 119
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 207
    Top = 71
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField11: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField12: TppField
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
