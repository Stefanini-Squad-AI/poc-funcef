inherited DtmRelValorLiquido: TDtmRelValorLiquido
  Left = 397
  Top = 88
  Width = 276
  Height = 246
  Caption = 'DtmRelValorLiquido'
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
    DataPipelineName = 'pplExemplo'
  end
  object qryRelValorLiquido: TwwQuery
    BeforeOpen = qryRelValorLiquidoBeforeOpen
    AfterOpen = qryRelValorLiquidoAfterOpen
    AfterClose = qryRelValorLiquidoAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      #39' '#39' AS MATRICULA,'
      #39' '#39' AS INSCRICAONUMERO,'
      '0 AS IDRESPONSAVEL,'
      #39' '#39' AS RECEBEDOR,'
      '0 AS PROVENTO,'
      '0 AS DESCONTO,'
      '0 AS LIQUIDO,'
      #39' '#39' AS VERSAO'
      'FROM DUAL'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 115
    Top = 162
  end
  object rpRelValorLiquido: TppReport
    AutoStop = False
    DataPipeline = plRelValorLiquido
    OnStartPage = rpRelValorLiquidoStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Valor Líquido em Determinada Faixa'
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
    BeforePrint = rpRelValorLiquidoBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 120
    Top = 11
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'plRelValorLiquido'
    object ppHeaderBand27: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 46567
      mmPrintPosition = 0
      object ppLabelTitulo: TppLabel
        UserName = 'LabelTitulo'
        AutoSize = False
        Caption = 'VALOR LIQUIDO NA FAIXA DE '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 29633
        mmWidth = 168805
        BandType = 0
      end
      object ppDbTextEmpresa: TppDBText
        UserName = 'DbTextEmpresa'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object ppDbTextCep: TppDBText
        UserName = 'DbTextCep'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object ppDbTextRSocial: TppDBText
        UserName = 'DbTextRSocial'
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
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25400
        BandType = 0
      end
      object ppDbImageEmpresa: TppDBImage
        UserName = 'DbImageEmpresa'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppDbTextEndereco: TppDBText
        UserName = 'DbTextEndereco'
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
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 16140
        BandType = 0
      end
      object ppDbTextBairro: TppDBText
        UserName = 'DbTextBairro'
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
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14552
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 27781
        mmWidth = 197300
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 39688
        mmWidth = 197300
        BandType = 0
      end
      object ppLabelVersao: TppLabel
        UserName = 'LabelVersao'
        Caption = 'Versão: '
        Color = clScrollBar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3175
        mmLeft = 2646
        mmTop = 35190
        mmWidth = 10848
        BandType = 0
      end
      object ppLabelMatricula: TppLabel
        UserName = 'LabelMatricula'
        AutoSize = False
        Caption = 'Matricula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 42598
        mmWidth = 15346
        BandType = 0
      end
      object ppLabelInsc: TppLabel
        UserName = 'LabelMatricula1'
        AutoSize = False
        Caption = 'Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 20902
        mmTop = 42598
        mmWidth = 15346
        BandType = 0
      end
      object ppLabelRecebedor: TppLabel
        UserName = 'LabelRecebedor'
        AutoSize = False
        Caption = 'Nome do Recebedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 40217
        mmTop = 42598
        mmWidth = 31221
        BandType = 0
      end
      object ppLabelValorProvento: TppLabel
        UserName = 'LabelValorProvento'
        AutoSize = False
        Caption = 'Total Provento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 115623
        mmTop = 42598
        mmWidth = 26194
        BandType = 0
      end
      object ppLabelValorRecebido: TppLabel
        UserName = 'LabelValorRecebido'
        AutoSize = False
        Caption = 'Total Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 143140
        mmTop = 42598
        mmWidth = 26194
        BandType = 0
      end
      object ppLabelVlLiquido: TppLabel
        UserName = 'LabelValorRecebido1'
        AutoSize = False
        Caption = 'Valor Liquido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 170657
        mmTop = 42598
        mmWidth = 26194
        BandType = 0
      end
    end
    object ppDetalhe: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppShapeDetalhe: TppShape
        OnPrint = ppShapeCorPrint
        UserName = 'ShapeDetalhe'
        ParentHeight = True
        ParentWidth = True
        Pen.Color = clWhite
        Pen.Width = 0
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDbTextMatricula: TppDBText
        UserName = 'DbTextMatricula'
        DataField = 'MATRICULA'
        DataPipeline = plRelValorLiquido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plRelValorLiquido'
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 264
        mmWidth = 18521
        BandType = 4
      end
      object ppDBTextInsc: TppDBText
        UserName = 'DbTextMatricula1'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = plRelValorLiquido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plRelValorLiquido'
        mmHeight = 3969
        mmLeft = 20902
        mmTop = 264
        mmWidth = 18521
        BandType = 4
      end
      object ppDbTextRecebedor: TppDBText
        UserName = 'DbTextRecebedor'
        DataField = 'RECEBEDOR'
        DataPipeline = plRelValorLiquido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plRelValorLiquido'
        mmHeight = 3969
        mmLeft = 40217
        mmTop = 264
        mmWidth = 74877
        BandType = 4
      end
      object ppdbProvento: TppDBText
        UserName = 'DbTextMatricula2'
        DataField = 'PROVENTO'
        DataPipeline = plRelValorLiquido
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plRelValorLiquido'
        mmHeight = 3969
        mmLeft = 115888
        mmTop = 264
        mmWidth = 26194
        BandType = 4
      end
      object ppdbDesconto: TppDBText
        UserName = 'dbDesconto'
        DataField = 'DESCONTO'
        DataPipeline = plRelValorLiquido
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plRelValorLiquido'
        mmHeight = 3969
        mmLeft = 143404
        mmTop = 264
        mmWidth = 26194
        BandType = 4
      end
      object ppdbliquido: TppDBText
        UserName = 'dbliquido'
        DataField = 'LIQUIDO'
        DataPipeline = plRelValorLiquido
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plRelValorLiquido'
        mmHeight = 3969
        mmLeft = 170921
        mmTop = 264
        mmWidth = 26194
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
        mmWidth = 197300
        BandType = 8
      end
      object ppLabelNomeSistema: TppLabel
        UserName = 'LabelNomeSistema'
        AutoSize = False
        Caption = 'Folha de Benefícios'
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
      object ppCalcPagina: TppSystemVariable
        UserName = 'CalcPagina'
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
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 22225
      mmPrintPosition = 0
      object ppLabelQuant: TppLabel
        UserName = 'Label1'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 91546
        mmTop = 10054
        mmWidth = 15610
        BandType = 7
      end
      object ppLabelTotais: TppLabel
        UserName = 'LabelTotais'
        Caption = 'Totais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 74083
        mmTop = 13494
        mmWidth = 8202
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'PROVENTO'
        DataPipeline = plRelValorLiquido
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plRelValorLiquido'
        mmHeight = 3175
        mmLeft = 115623
        mmTop = 15875
        mmWidth = 26194
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'DESCONTO'
        DataPipeline = plRelValorLiquido
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plRelValorLiquido'
        mmHeight = 3175
        mmLeft = 143140
        mmTop = 15875
        mmWidth = 26194
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'LIQUIDO'
        DataPipeline = plRelValorLiquido
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plRelValorLiquido'
        mmHeight = 3175
        mmLeft = 171186
        mmTop = 15875
        mmWidth = 26194
        BandType = 7
      end
      object ppLabel1: TppLabel
        UserName = 'LabelValorProvento1'
        AutoSize = False
        Caption = 'Provento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 115623
        mmTop = 9790
        mmWidth = 26194
        BandType = 7
      end
      object ppLabel2: TppLabel
        UserName = 'LabelValorRecebido2'
        AutoSize = False
        Caption = 'Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 143140
        mmTop = 9790
        mmWidth = 26194
        BandType = 7
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Líquido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 170657
        mmTop = 9790
        mmWidth = 26194
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 1058
        mmWidth = 197300
        BandType = 7
      end
      object ppdbQuantidade: TppDBCalc
        UserName = 'dbQuantidade'
        DataField = 'IDRESPONSAVEL'
        DataPipeline = plRelValorLiquido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'plRelValorLiquido'
        mmHeight = 3175
        mmLeft = 90752
        mmTop = 15875
        mmWidth = 17198
        BandType = 7
      end
    end
  end
  object plRelValorLiquido: TppBDEPipeline
    DataSource = dsRelValorLiquido
    SkipWhenNoRecords = False
    UserName = 'plRelValorLiquido'
    Left = 115
    Top = 71
    object plRelValorLiquidoppField1: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object plRelValorLiquidoppField2: TppField
      FieldAlias = 'INSCRICAONUMERO'
      FieldName = 'INSCRICAONUMERO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 1
    end
    object plRelValorLiquidoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRESPONSAVEL'
      FieldName = 'IDRESPONSAVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object plRelValorLiquidoppField4: TppField
      FieldAlias = 'RECEBEDOR'
      FieldName = 'RECEBEDOR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
    object plRelValorLiquidoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROVENTO'
      FieldName = 'PROVENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object plRelValorLiquidoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCONTO'
      FieldName = 'DESCONTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object plRelValorLiquidoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'LIQUIDO'
      FieldName = 'LIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object plRelValorLiquidoppField8: TppField
      FieldAlias = 'VERSAO'
      FieldName = 'VERSAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 7
    end
  end
  object dsRelValorLiquido: TwwDataSource
    DataSet = qryRelValorLiquido
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
      
        '       --(E.BAIRRO||'#39' - '#39'||C.NOME||'#39' - '#39'||C.CODESTADO) AS BARCID' +
        'UF'
      
        '       substr((E.BAIRRO||'#39' - '#39'||C.NOME||'#39' - '#39'||C.CODESTADO),1,23' +
        '8) AS BARCIDUF'
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
