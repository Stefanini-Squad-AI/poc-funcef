inherited dtmRelPortadorVersao: TdtmRelPortadorVersao
  Left = 171
  Top = 148
  Width = 211
  Height = 227
  Caption = 'dtmRelPortadorVersao'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 21
    Top = 59
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
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
    Left = 21
    Top = 103
  end
  inherited qryExemplo: TwwQuery
    Left = 21
    Top = 149
  end
  inherited rpExemplo: TppReport
    Left = 21
  end
  object qryPrinc: TwwQuery
    CachedUpdates = True
    BeforeOpen = qryPrincBeforeOpen
    AfterClose = qryPrincAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select pp.inscricaonumero,'
      '       dp.NUMSEQUENCIA,'
      '       dp.matricula,'
      '       h.NUMBANCo,'
      '       h.NUMAGENCIA,'
      '       h.CONTACORRENTE,'
      '       h.CODPORTFORMA,'
      '       pf.descricao,'
      '       h.IDHSTFOLHABENEF,'
      '       h.DATAPAGAMENTO,'
      '       h.idpessoa,'
      '       h.idplanocontabil,'
      '       h.idpatro,'
      '       p.nome,'
      
        '       sum(decode(pd.flgdesconto,0,h.VALORPROVENTO,h.VALORPROVEN' +
        'TO * -1)) as valor'
      
        'from histrubsal h, pessoa p, partprevplan pp, depentit dp, provd' +
        'esc pd, portadorforma pf'
      'where IDHSTFOLHABENEF = 61'
      'and H.CODPORTFORMA IN (70,74)'
      'AND 1 = 2'
      'and p.idpessoa = h.idpessoa'
      'and h.idtitular = pp.idpessoa'
      'and h.idplanoprev = pp.idplanoprev'
      'and h.idpatro = pp.idpessjur'
      'and h.idpessoa = dp.idpessoa(+)'
      'and h.idtitular = dp.idtitular(+)'
      'and h.idrubrica = pd.idprovento'
      'and h.CODPORTFORMA = pf.CODPORTFORMA'
      
        'group by h.DATAPAGAMENTO, h.CODPORTFORMA, h.IDHSTFOLHABENEF, p.n' +
        'ome, pp.inscricaonumero, h.NUMBANCo, h.NUMAGENCIA,'
      
        '         h.CONTACORRENTE, pf.descricao, dp.NUMSEQUENCIA, h.idpes' +
        'soa,'
      '         h.idplanocontabil, h.idpatro,        dp.matricula'
      
        'order by h.DATAPAGAMENTO, h.CODPORTFORMA, h.IDHSTFOLHABENEF, p.n' +
        'ome'
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 86
    Top = 149
  end
  object dsPrinc: TwwDataSource
    DataSet = qryPrinc
    Left = 86
    Top = 103
  end
  object ppPrinc: TppBDEPipeline
    DataSource = dsPrinc
    SkipWhenNoRecords = False
    UserName = 'ppPrinc'
    Left = 86
    Top = 59
  end
  object rptPrinc: TppReport
    AutoStop = False
    DataPipeline = ppPrinc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Depósito Bancário'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 86
    Top = 16
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 42333
      mmPrintPosition = 0
      object ppDBImage1: TppDBImage
        UserName = 'ppDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 28046
        mmLeft = 4498
        mmTop = 2910
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText28: TppDBText
        UserName = 'ppDBText28'
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
        mmLeft = 44979
        mmTop = 3175
        mmWidth = 133615
        BandType = 0
      end
      object ppDBText29: TppDBText
        UserName = 'ppDBText29'
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
        mmLeft = 44979
        mmTop = 9525
        mmWidth = 25400
        BandType = 0
      end
      object ppDBText30: TppDBText
        UserName = 'ppDBText30'
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
        mmLeft = 44979
        mmTop = 14817
        mmWidth = 41804
        BandType = 0
      end
      object ppDBText34: TppDBText
        UserName = 'ppDBText34'
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
        mmLeft = 87842
        mmTop = 14817
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText35: TppDBText
        UserName = 'ppDBText35'
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
        mmLeft = 94456
        mmTop = 19050
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText33: TppDBText
        UserName = 'ppDBText33'
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
        mmLeft = 66411
        mmTop = 19050
        mmWidth = 26723
        BandType = 0
      end
      object ppDBText31: TppDBText
        UserName = 'ppDBText31'
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
        mmLeft = 44979
        mmTop = 19315
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'ppLabel2'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 44979
        mmTop = 23813
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText32: TppDBText
        UserName = 'ppDBText32'
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
        mmLeft = 52388
        mmTop = 23813
        mmWidth = 17198
        BandType = 0
      end
      object rpFichaBeneficiosLabel1: TppLabel
        UserName = 'rpFichaBeneficiosLabel1'
        Caption = 'Relatório de Depósito Bancário da Folha de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 42598
        mmTop = 33867
        mmWidth = 110596
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 2646
      mmPrintPosition = 0
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'NOME'
        DataPipeline = ppPrinc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 8996
        mmTop = 0
        mmWidth = 54504
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = ppPrinc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 83873
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'NUMSEQUENCIA'
        DataPipeline = ppPrinc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2381
        mmLeft = 94192
        mmTop = 0
        mmWidth = 5556
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'NUMBANCO'
        DataPipeline = ppPrinc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 101071
        mmTop = 0
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'NUMAGENCIA'
        DataPipeline = ppPrinc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 108479
        mmTop = 0
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'CONTACORRENTE'
        DataPipeline = ppPrinc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 117740
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'VALOR'
        DataPipeline = ppPrinc
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 135202
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'IDHSTFOLHABENEF'
        DataPipeline = ppPrinc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2381
        mmLeft = 156104
        mmTop = 0
        mmWidth = 8202
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'IDPESSOA'
        DataPipeline = ppPrinc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2381
        mmLeft = 187061
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'IDPATRO'
        DataPipeline = ppPrinc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2381
        mmLeft = 176742
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'IDPLANOCONTABIL'
        DataPipeline = ppPrinc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2381
        mmLeft = 166159
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'MATRICULA'
        DataPipeline = ppPrinc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 69850
        mmTop = 0
        mmWidth = 9260
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 14552
      mmPrintPosition = 0
      object ppLine9: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabelSistema: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Folha de Benefícios - Depósito da Folha de Benefícios'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 794
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'Calc2'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 529
        mmTop = 794
        mmWidth = 196321
        BandType = 8
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 169598
        mmTop = 794
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'DATAPAGAMENTO'
      DataPipeline = ppPrinc
      NewPage = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppLabel10: TppLabel
          UserName = 'Label11'
          Caption = 'Depósito da Folha de Benefício'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 8996
          mmTop = 0
          mmWidth = 53181
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DATAPAGAMENTO'
          DataPipeline = ppPrinc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 66940
          mmTop = 0
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 5027
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppLabel19: TppLabel
          UserName = 'Label8'
          Caption = 'Valor Total Geral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 133086
          mmTop = 1588
          mmWidth = 28575
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalcQuantGeral: TppDBCalc
          UserName = 'DBCalcQuantGeral'
          DataField = 'INSCRICAONUMERO'
          DataPipeline = ppPrinc
          DisplayFormat = '#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 4233
          mmLeft = 80169
          mmTop = 1588
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalcTotalGeral: TppDBCalc
          UserName = 'DBCalcTotalGeral'
          DataField = 'VALOR'
          DataPipeline = ppPrinc
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 164307
          mmTop = 1588
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object ppLine11: TppLine
          UserName = 'Line9'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 6085
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppLine10: TppLine
          UserName = 'Line10'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 1058
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'Label25'
          Caption = 'Total Geral de Recebedores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 30163
          mmTop = 1588
          mmWidth = 47096
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'CODPORTFORMA'
      DataPipeline = ppPrinc
      NewPage = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object ppLine12: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 529
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel11: TppLabel
          UserName = 'Label9'
          Caption = 'Portador Forma :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 35983
          mmTop = 1852
          mmWidth = 28575
          BandType = 3
          GroupNo = 1
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'CODPORTFORMA'
          DataPipeline = ppPrinc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 66411
          mmTop = 1852
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'DESCRICAO'
          DataPipeline = ppPrinc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 84138
          mmTop = 1852
          mmWidth = 109802
          BandType = 3
          GroupNo = 1
        end
        object ppLabel12: TppLabel
          UserName = 'Label2'
          Caption = 'Nome do Favorecido'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2646
          mmLeft = 8996
          mmTop = 7673
          mmWidth = 20902
          BandType = 3
          GroupNo = 1
        end
        object ppLabel13: TppLabel
          UserName = 'Label3'
          Caption = 'Nº de Inscrição '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 85196
          mmTop = 7673
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object ppLabel14: TppLabel
          UserName = 'Label4'
          Caption = 'Dados Bancários'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 106627
          mmTop = 7673
          mmWidth = 17463
          BandType = 3
          GroupNo = 1
        end
        object ppLabel15: TppLabel
          UserName = 'Label5'
          Caption = 'Valor Líquido R$'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 135996
          mmTop = 7673
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppLabel16: TppLabel
          UserName = 'Label6'
          Caption = 'HSTFolha'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 155046
          mmTop = 7673
          mmWidth = 10054
          BandType = 3
          GroupNo = 1
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = 'Planoprev'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2646
          mmLeft = 166159
          mmTop = 7673
          mmWidth = 10319
          BandType = 3
          GroupNo = 1
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          Caption = 'IdPatro'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2646
          mmLeft = 177800
          mmTop = 7673
          mmWidth = 7408
          BandType = 3
          GroupNo = 1
        end
        object ppLabel17: TppLabel
          UserName = 'Label7'
          Caption = 'Idpessoa'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2646
          mmLeft = 187325
          mmTop = 7673
          mmWidth = 9260
          BandType = 3
          GroupNo = 1
        end
        object ppLine8: TppLine
          UserName = 'Line6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 11113
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel1: TppLabel
          UserName = 'Label10'
          Caption = 'Matrícula'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2646
          mmLeft = 69850
          mmTop = 7673
          mmWidth = 9260
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppLabel20: TppLabel
          UserName = 'Label1'
          Caption = 'Quantidade de Recebedores no Portador Forma'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 14288
          mmTop = 1323
          mmWidth = 62971
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalcQuantPort: TppDBCalc
          UserName = 'DBCalcQuantPort'
          DataField = 'INSCRICAONUMERO'
          DataPipeline = ppPrinc
          DisplayFormat = '#0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3440
          mmLeft = 79904
          mmTop = 1323
          mmWidth = 16140
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalcValorPort: TppDBCalc
          UserName = 'DBCalcValorPort'
          DataField = 'VALOR'
          DataPipeline = ppPrinc
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 165365
          mmTop = 1323
          mmWidth = 22754
          BandType = 5
          GroupNo = 1
        end
        object ppLine15: TppLine
          UserName = 'Line7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 5292
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object ppLine13: TppLine
          UserName = 'Line13'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 794
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'Total Portador Forma'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 133350
          mmTop = 1323
          mmWidth = 28310
          BandType = 5
          GroupNo = 1
        end
      end
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
    Left = 146
    Top = 149
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 1
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
    Left = 146
    Top = 103
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 146
    Top = 59
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
