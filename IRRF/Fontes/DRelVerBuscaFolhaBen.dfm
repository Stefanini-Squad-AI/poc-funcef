inherited dtmrelverbuscaFolhaBen: TdtmrelverbuscaFolhaBen
  Left = 107
  Top = 149
  Width = 675
  Height = 338
  Caption = 'dtmrelverbuscaFolhaBen'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 173
    Top = 8
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
    Left = 87
    Top = 8
  end
  inherited qryExemplo: TwwQuery
    Left = 20
    Top = 8
  end
  inherited rpExemplo: TppReport
    Left = 250
    Top = 8
    inherited HeaderBand1: TppHeaderBand
      inherited Line1: TppLine [0]
      end
      inherited LblEmpresa: TppLabel [1]
      end
      inherited Label11: TppLabel [2]
        mmHeight = 5292
        mmLeft = 79640
        mmWidth = 37835
      end
    end
  end
  object qryRelVerBuscaFolhaBen: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      H.IDPESSOA,'
      '      PE.NOME,'
      '      PE.NUMDOCUMENTO,'
      '      '#39'HIST.RUBRICAS'#39' AS ORIGEM,'
      '      H.IDHSTFOLHABENEF,'
      '      HF.MESREFERENCIA,'
      '      H.VALORPROVENTO,'
      '      HF.HISTORICO,'
      '      PD.DESCRICAO AS NOMERUBRICA,'
      '      PD.IDINFORME,'
      '      I.NOMEINFORME                 '
      'FROM'
      '      HISTRUBSAL H,'
      '      PESSOA PE,'
      '      HSTFOLHABENEF HF,'
      '      PROVDESC PD,'
      '    INFORME I  '
      
        '    WHERE H.DATAPAGAMENTO BETWEEN TO_DATE('#39'01/01/2003'#39','#39'DD/MM/YY' +
        'YY'#39') '
      '    AND                 TO_DATE('#39'31/01/2003'#39','
      #39'DD/MM/YYYY'#39')                        '
      
        'AND H.IDMODULO = 18                                             ' +
        '         '
      '    AND H.IDRUBRICA IN (5,'
      '    1561,'
      '1566)                                         '
      
        'AND ((H.FLGESTORNO = 0)OR (H.FLGESTORNO IS NULL))               ' +
        '         '
      
        'AND PE.IDPESSOA = H.IDPESSOA                                    ' +
        '         '
      
        'AND H.VALORPROVENTO > 0                                         ' +
        '         '
      
        'AND H.IDHSTFOLHABENEF = HF.IDHSTFOLHABENEF                      ' +
        '         '
      
        'AND PD.IDPROVENTO = H.IDRUBRICA                                 ' +
        '         '
      
        'AND I.IDINFORME = PD.IDINFORME                                  ' +
        '         '
      
        'UNION                                                           ' +
        '         '
      '       SELECT'
      '    L.IDBENEFIRRF AS IDPESSOA,'
      '    PE.NOME,'
      '    PE.NUMDOCUMENTO,'
      '    '#39'IRRF'#39' AS ORIGEM,'
      '    L.IDHSTFOLHABENEF,'
      '    HF.MESREFERENCIA,'
      '    L.VLRIRRF AS VALORPROVENTO,'
      '    HF.HISTORICO,'
      '    '#39#39' AS NOMERUBRICA,'
      '    TO_NUMBER('#39'0'#39') AS IDINFORME,'
      '             '#39#39' AS NOMEINFORME                       '
      '      FROM'
      '             LANCIRRF L,'
      '             PESSOA PE,'
      '      HSTFOLHABENEF HF '
      
        '      WHERE                     L.DATALANCAMENTO BETWEEN TO_DATE' +
        '('#39'01/01/2003'#39','
      #39'DD/MM/YYYY'#39') '
      '      AND                 TO_DATE('#39'01/01/2003'#39','
      #39'DD/MM/YYYY'#39')                        '
      
        'AND L.IDMODULO = 18                                             ' +
        '         '
      
        'AND L.CODNATUREZA = '#39'0561'#39'                                      ' +
        '       '
      
        'AND L.IDBENEFIRRF = PE.IDPESSOA                                 ' +
        '         '
      
        'AND L.VLRIRRF > 0                                               ' +
        '         '
      
        'AND L.IDHSTFOLHABENEF = HF.IDHSTFOLHABENEF                      ' +
        '         '
      'ORDER BY NOME,'
      'IDHSTFOLHABENEF,'
      'ORIGEM,'
      'VALORPROVENTO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 50
    Top = 64
    object qryRelVerBuscaFolhaBenIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryRelVerBuscaFolhaBenNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryRelVerBuscaFolhaBenNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryRelVerBuscaFolhaBenORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 10
    end
    object qryRelVerBuscaFolhaBenIDHSTFOLHABENEF: TFloatField
      FieldName = 'IDHSTFOLHABENEF'
    end
    object qryRelVerBuscaFolhaBenMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      Size = 7
    end
    object qryRelVerBuscaFolhaBenVALORPROVENTO: TFloatField
      FieldName = 'VALORPROVENTO'
    end
    object qryRelVerBuscaFolhaBenHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 50
    end
    object qryRelVerBuscaFolhaBenNOMERUBRICA: TStringField
      FieldName = 'NOMERUBRICA'
      Size = 130
    end
    object qryRelVerBuscaFolhaBenIDINFORME: TFloatField
      FieldName = 'IDINFORME'
    end
    object qryRelVerBuscaFolhaBenNOMEINFORME: TStringField
      FieldName = 'NOMEINFORME'
      Size = 60
    end
  end
  object dsRelVerBuscaFolhaBen: TwwDataSource
    DataSet = qryRelVerBuscaFolhaBen
    Left = 199
    Top = 64
  end
  object pplRelVerBuscaFolhaBen: TppBDEPipeline
    DataSource = dsRelVerBuscaFolhaBen
    UserName = 'lExemplo1'
    Left = 341
    Top = 64
    object pplRelVerBuscaFolhaBenppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplRelVerBuscaFolhaBenppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplRelVerBuscaFolhaBenppField3: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 2
    end
    object pplRelVerBuscaFolhaBenppField4: TppField
      FieldAlias = 'ORIGEM'
      FieldName = 'ORIGEM'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object pplRelVerBuscaFolhaBenppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDHSTFOLHABENEF'
      FieldName = 'IDHSTFOLHABENEF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplRelVerBuscaFolhaBenppField6: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 5
    end
    object pplRelVerBuscaFolhaBenppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPROVENTO'
      FieldName = 'VALORPROVENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplRelVerBuscaFolhaBenppField8: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object pplRelVerBuscaFolhaBenppField9: TppField
      FieldAlias = 'NOMERUBRICA'
      FieldName = 'NOMERUBRICA'
      FieldLength = 130
      DisplayWidth = 130
      Position = 8
    end
    object pplRelVerBuscaFolhaBenppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINFORME'
      FieldName = 'IDINFORME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplRelVerBuscaFolhaBenppField11: TppField
      FieldAlias = 'NOMEINFORME'
      FieldName = 'NOMEINFORME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 10
    end
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
    Left = 446
    Top = 7
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
    Left = 394
    Top = 7
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 342
    Top = 7
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
    object ppFundacaoppField11: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 10
    end
    object ppFundacaoppField12: TppField
      FieldAlias = 'BARCIDUF'
      FieldName = 'BARCIDUF'
      FieldLength = 79
      DisplayWidth = 79
      Position = 11
    end
  end
  object rpRelVerBuscaFolhaBen: TppReport
    AutoStop = False
    DataPipeline = pplRelVerBuscaFolhaBen
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 296863
    PrinterSetup.mmPaperWidth = 209815
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 480
    Top = 68
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 41540
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel1'
        Caption = 
          'Relatório Comparativo da Busca do IRRF com o Histórico de Rubric' +
          'as Salariais - Folha de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 4233
        mmTop = 31485
        mmWidth = 186796
        BandType = 0
      end
      object rpBenEncerDBImage1: TppDBImage
        UserName = 'rpBenEncerDBImage1'
        MaintainAspectRatio = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 5027
        mmTop = 3175
        mmWidth = 47890
        BandType = 0
      end
      object rpBenEncerDBText11: TppDBText
        UserName = 'rpBenEncerDBText11'
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
        mmLeft = 53711
        mmTop = 3440
        mmWidth = 133615
        BandType = 0
      end
      object rpBenEncerDBText13: TppDBText
        UserName = 'rpBenEncerDBText13'
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
        mmLeft = 53711
        mmTop = 15081
        mmWidth = 41804
        BandType = 0
      end
      object rpBenEncerDBText14: TppDBText
        UserName = 'rpBenEncerDBText14'
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
        mmLeft = 53711
        mmTop = 19579
        mmWidth = 20108
        BandType = 0
      end
      object rpBenEncerLabel14: TppLabel
        UserName = 'rpBenEncerLabel14'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 53711
        mmTop = 24077
        mmWidth = 5027
        BandType = 0
      end
      object rpBenEncerDBText15: TppDBText
        UserName = 'rpBenEncerDBText15'
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
        mmLeft = 61119
        mmTop = 24077
        mmWidth = 17198
        BandType = 0
      end
      object rpBenEncerDBText16: TppDBText
        UserName = 'rpBenEncerDBText16'
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 74348
        mmTop = 19579
        mmWidth = 26723
        BandType = 0
      end
      object rpBenEncerDBText17: TppDBText
        UserName = 'rpBenEncerDBText17'
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
        mmLeft = 96838
        mmTop = 15081
        mmWidth = 17198
        BandType = 0
      end
      object rpBenEncerDBText18: TppDBText
        UserName = 'rpBenEncerDBText18'
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
        mmLeft = 102659
        mmTop = 19579
        mmWidth = 20108
        BandType = 0
      end
      object rpBenEncerDBText12: TppDBText
        UserName = 'rpBenEncerDBText12'
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
        mmLeft = 53711
        mmTop = 9790
        mmWidth = 25929
        BandType = 0
      end
      object pplblTitulo: TppLabel
        UserName = 'lblTitulo'
        Caption = '          '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 3969
        mmTop = 36513
        mmWidth = 11113
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'ORIGEM'
        DataPipeline = pplRelVerBuscaFolhaBen
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 15875
        mmTop = 529
        mmWidth = 26988
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VALORPROVENTO'
        DataPipeline = pplRelVerBuscaFolhaBen
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 44450
        mmTop = 529
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'MESREFERENCIA'
        DataPipeline = pplRelVerBuscaFolhaBen
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 529
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'HISTORICO'
        DataPipeline = pplRelVerBuscaFolhaBen
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 65617
        mmTop = 529
        mmWidth = 76994
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'NOMERUBRICA'
        DataPipeline = pplRelVerBuscaFolhaBen
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 142875
        mmTop = 529
        mmWidth = 53181
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 2117
        mmWidth = 197115
        BandType = 8
      end
      object ppLabel5: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel3'
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
        mmTop = 3440
        mmWidth = 197909
        BandType = 8
      end
      object rpBenEncerLine3: TppLine
        UserName = 'rpBenEncerLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 1323
        mmWidth = 197115
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
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
        mmTop = 3440
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
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
        mmTop = 3440
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDPESSOA'
      DataPipeline = pplRelVerBuscaFolhaBen
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14552
        mmPrintPosition = 0
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Beneficiario :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4498
          mmLeft = 1588
          mmTop = 1323
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'NOME'
          DataPipeline = pplRelVerBuscaFolhaBen
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 25135
          mmTop = 1588
          mmWidth = 129646
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 7144
          mmWidth = 197115
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Nº CPF :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4498
          mmLeft = 156104
          mmTop = 1323
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'NUMDOCUMENTO'
          DataPipeline = pplRelVerBuscaFolhaBen
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 172509
          mmTop = 1588
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 12700
          mmWidth = 197115
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4498
          mmLeft = 5027
          mmTop = 7673
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4498
          mmLeft = 15875
          mmTop = 7673
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4498
          mmLeft = 46567
          mmTop = 7673
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4498
          mmLeft = 65352
          mmTop = 7938
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4498
          mmLeft = 143934
          mmTop = 7938
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 529
          mmWidth = 197115
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
end
