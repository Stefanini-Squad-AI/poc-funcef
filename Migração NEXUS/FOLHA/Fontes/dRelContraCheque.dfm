inherited dtmRelContraCheque: TdtmRelContraCheque
  Left = 294
  Top = 167
  Width = 344
  Height = 230
  Caption = 'dtmRelContraCheque'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 34
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
    Left = 34
    Top = 106
  end
  inherited qryExemplo: TwwQuery
    Top = 156
  end
  inherited rpExemplo: TppReport
    Left = 35
    Top = 8
  end
  object dsdemonstpag: TwwDataSource
    DataSet = qrydemonstpag
    Left = 114
    Top = 106
  end
  object qrydemonstpag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  HST.IDRESPONSAVEL,'
      '  HST.IDPLANOPREV,'
      '  HST.IDPESSJUR,'
      '  HST.MESCOBRANCA,'
      '  PVD.IDPROVENTO,'
      '  TIT.NOME AS TITULAR,'
      '  BEN.NOME,'
      '  PT.NOME AS PATROCINADORA,'
      '  PVD.IDPROVENTO AS CODIGO,'
      '  PVD.DESCRICAO AS DESCRICAO,'
      '  ELP.MATRICULA,'
      '  PPP.INSCRICAONUMERO,'
      '  PFI.DATANASC,'
      '  HST.VALORINFO,'
      '  PVD.FLGDESCONTO,'
      '  PL.NOME AS PLANO,'
      '  HST.NUMPROCINSS,'
      '  DECODE(PFI.FLGISENTOIRRF, 1, '#39'SIM'#39', '#39'NÃO'#39') ISENTOIRRF,'
      '  PFI.NUMDEPIRRF,'
      '  AG.NUMAGENCIA,'
      '  CB.CONTACORRENTE,'
      '  PVD.FLGESPECIAL,'
      '  BC.NOME AS BANCO,'
      '  SUBSTR(HST.MES,'
      '      6,'
      '      2)||'#39'/'#39'||SUBSTR(HST.MES,'
      '      1,'
      '      4) AS MES,'
      '      HST.VALORPROVENTO,'
      '      HST.DATAPAGAMENTO AS DATACREDITO,'
      '      DECODE(PVD.FLGDESCONTO,'
      '      2,'
      '      HST.VALORINFO||'#39' (I)'#39','
      '      0,'
      '      NULL,'
      '      1,'
      '      DECODE(HST.VALORRECEBIDO-HST.VALORPROVENTO,'
      '      0,'
      '      DECODE(HST.VALORINFO,'
      '      0,'
      '      NULL,'
      '      HST.VALORINFO||'#39' (I)'#39'),'
      '      HST.VALORRECEBIDO-HST.VALORPROVENTO||'#39' (R)'#39')) INFORMATIVO,'
      '      EP.IDPESSOA,'
      '      EP.IDENDERECO,'
      '      EP.LOGRADOURO,'
      '      EP.CEP,'
      '      EST.CODESTADO,'
      '      EP.NUMERO,'
      '      EP.COMPLEMENTO,'
      '      EP.BAIRRO,'
      '      CID.NOME AS CIDADE,'
      '      EP.TIPOENDERECO,'
      '      EP.NOME,'
      '      AGN.NOME AS AGENCIA,'
      '      DECODE(PVD.FLGDESCONTO,'
      '      0,'
      '      '#39'PROVENTO'#39','
      '      1,'
      '      '#39'DESCONTO'#39','
      '      '#39'INFORMATIVA'#39') AS PD,'
      '      DECODE(PVD.FLGDESCONTO,'
      '      0,'
      '      HST.VALORPROVENTO,'
      '      0.0) AS VLPROVENTO,'
      '      DECODE(PVD.FLGDESCONTO,'
      '      1,'
      '      HST.VALORPROVENTO,'
      '      0.0) AS VLDESCONTO,'
      '      HST.VALORPROVENTO - HST.VALORRECEBIDO AS RESIDUO,'
      '      DECODE(PVD.FLGDESCONTO,'
      '      1,'
      '      '#39'D'#39','
      '      0,'
      '      '#39'P'#39','
      '      '#39'I'#39') AS TPRUBRICA  '
      'FROM'
      '      HISTRUBSAL HST,'
      '      ELEGPATRO ELP,'
      '      PARTPREVPLAN PPP,'
      '      PLANPREV PL,'
      '      PESSOA TIT,'
      '      PESSOA BEN,'
      '      PESSOAFISICA PFI,'
      '      PROVDESC PVD,'
      '      ENDPESS EP,'
      '      CONTABANCARIA CB,'
      '      PESSOA BC,'
      '      PESSOA AGN ,'
      '      PESSOA PT,'
      '      BANCO BCO,'
      '      AGENCIABANCARIA AG,'
      '      CIDADES CID,'
      '    ESTADO EST'
      'WHERE HST.IDHSTFOLHABENEF = 230'
      'AND HST.IDTITULAR = 12168'
      'AND HST.IDRESPONSAVEL = 12168'
      'AND 1 = 2'
      'AND HST.IDPLANOPREV = PL.IDPLANOPREV'
      'AND PVD.IDPROVENTO = HST.IDRUBRICA'
      'AND ELP.IDPESSOA = HST.IDTITULAR'
      'AND ELP.IDPESSJUR = HST.IDPATRO'
      'AND PPP.IDPESSJUR = HST.IDPATRO'
      'AND PPP.IDPLANOPREV = HST.IDPLANOPREV'
      'AND PPP.IDPESSOA = HST.IDTITULAR'
      'AND PPP.IDPESSJUR = PT.IDPESSOA'
      'AND PPP.IDPESSOA  = TIT.IDPESSOA'
      'AND PFI.IDPESSOA = HST.IDRESPONSAVEL'
      'AND EP.IDPESSOA(+) = HST.IDRESPONSAVEL'
      'AND BEN.IDENDCORRESP = EP.IDENDERECO'
      'AND EP.IDCIDADES = CID.IDCIDADES(+)  '
      'AND EST.IDESTADO(+) = CID.IDESTADO  '
      'AND BEN.IDPESSOA = HST.IDRESPONSAVEL  '
      'AND ((RTRIM(HST.NUMBANCO) = BCO.NUMBANCO)'
      'OR (HST.NUMBANCO IS NULL))  '
      'AND ((HST.NUMAGENCIA = AG.NUMAGENCIA)'
      'OR (HST.NUMAGENCIA IS NULL))  '
      'AND CB.IDPESSOA = HST.IDRESPONSAVEL  '
      'AND CB.FLGCONTAPREF = 1  '
      'AND AG.IDPESSOA = CB.IDAGENCIA  '
      'AND BC.IDPESSOA = AG.IDBANCO  '
      'AND AGN.IDPESSOA = AG.IDPESSOA  '
      'AND BC.IDPESSOA = BCO.IDPESSOA  '
      'ORDER BY BEN.NOME,'
      'PVD.FLGDESCONTO,'
      'PVD.IDPROVENTO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 114
    Top = 156
  end
  object ppdemonstpag: TppBDEPipeline
    DataSource = dsdemonstpag
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'demonstpag'
    Left = 114
    Top = 56
  end
  object rpdemonstpag: TppReport
    AutoStop = False
    DataPipeline = ppdemonstpag
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Contra-Cheque'
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
    Left = 114
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBandRel: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 49477
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'ppShape1'
        mmHeight = 21696
        mmLeft = 0
        mmTop = 27252
        mmWidth = 197380
        BandType = 0
      end
      object pplTituloRelat: TppLabel
        UserName = 'lTituloRelat'
        Caption = 'DEMONSTRATIVO DE PAGAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold, fsItalic, fsUnderline]
        Transparent = True
        mmHeight = 5821
        mmLeft = 59531
        mmTop = 29633
        mmWidth = 92075
        BandType = 0
      end
      object ppdbNomeFundacao: TppDBText
        UserName = 'rpCredBenefDBText101'
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
      object ppdbCepFund: TppDBText
        UserName = 'dbCepFund'
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
      object ppdbRazaoSocial: TppDBText
        UserName = 'dbRazaoSocial'
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
      object ppdbImagem: TppDBImage
        UserName = 'dbImagem'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 38365
        BandType = 0
      end
      object ppdbEnderecoFund: TppDBText
        UserName = 'dbEnderecoFund'
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
      object ppdbBarIDUF: TppDBText
        UserName = 'dbBarIDUF'
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
      object ppLabel3: TppLabel
        UserName = 'lNome1'
        Caption = 'PATROCINADORA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 39688
        mmWidth = 28310
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'dbNome1'
        DataField = 'PATROCINADORA'
        DataPipeline = ppdemonstpag
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 3175
        mmTop = 44450
        mmWidth = 79111
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'PLANO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 85461
        mmTop = 39688
        mmWidth = 11113
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'PLANO'
        DataPipeline = ppdemonstpag
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 85461
        mmTop = 44450
        mmWidth = 92340
        BandType = 0
      end
    end
    object ppDetailBand22: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppRectRubricas: TppShape
        UserName = 'RectRubricas'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 4
      end
      object ppdbDescricaoRub: TppDBText
        UserName = 'dbDescricaoRub'
        DataField = 'DESCRICAO'
        DataPipeline = ppdemonstpag
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 47096
        mmTop = 529
        mmWidth = 101071
        BandType = 4
      end
      object ppdbValorRubrica: TppDBText
        UserName = 'dbValorRubrica'
        DataField = 'VALORPROVENTO'
        DataPipeline = ppdemonstpag
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 149225
        mmTop = 529
        mmWidth = 21960
        BandType = 4
      end
      object ppdbCodigoRub: TppDBText
        UserName = 'dbCodigoRub'
        DataField = 'CODIGO'
        DataPipeline = ppdemonstpag
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 33602
        mmTop = 529
        mmWidth = 12436
        BandType = 4
      end
      object ppdbMesRub: TppDBText
        UserName = 'dbMesRub'
        DataField = 'MES'
        DataPipeline = ppdemonstpag
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 529
        mmWidth = 12964
        BandType = 4
      end
      object ppLabelDataInicio: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 15610
        mmTop = 529
        mmWidth = 16403
        BandType = 4
      end
      object VarResiduo: TppVariable
        UserName = 'VarResiduo'
        AutoSize = False
        CalcOrder = 0
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 171980
        mmTop = 529
        mmWidth = 21960
        BandType = 4
      end
    end
    object ppFooterBand: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 20373
      mmPrintPosition = 0
      object ppLine38: TppLine
        UserName = 'ppLine38'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 1058
        mmWidth = 197300
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
        mmHeight = 5027
        mmLeft = 1058
        mmTop = 1588
        mmWidth = 197909
        BandType = 8
      end
      object ppCalc33: TppSystemVariable
        UserName = 'Calc33'
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
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc34: TppSystemVariable
        UserName = 'Calc34'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 1058
        mmTop = 1588
        mmWidth = 197380
        BandType = 8
      end
    end
    object rpdemonstpagSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
    end
    object ppGroup5: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppdemonstpag
      NewPage = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 45773
        mmPrintPosition = 0
        object ppRectDados: TppShape
          UserName = 'RectDados'
          mmHeight = 44450
          mmLeft = 0
          mmTop = 265
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object pplNome: TppLabel
          UserName = 'lNome'
          Caption = 'TITULAR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 3175
          mmTop = 2117
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object pplDataNasc: TppLabel
          UserName = 'lDataNasc'
          Caption = 'Data Nasc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 116152
          mmTop = 22754
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object pplMatricula: TppLabel
          UserName = 'lMatricula'
          Caption = 'MATRICULA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 2910
          mmTop = 11642
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object pplEndereco: TppLabel
          UserName = 'lEndereco'
          Caption = 'ENDEREÇO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 2117
          mmTop = 33867
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object pplInscricao: TppLabel
          UserName = 'lInscricao'
          Caption = 'INSCRIÇÃO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 27781
          mmTop = 11642
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppdbNome: TppDBText
          UserName = 'dbNome'
          DataField = 'NOME'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 2381
          mmTop = 28310
          mmWidth = 112184
          BandType = 3
          GroupNo = 0
        end
        object ppdbLogra: TppDBText
          UserName = 'dbLogra'
          DataField = 'LOGRADOURO'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 38629
          mmWidth = 76200
          BandType = 3
          GroupNo = 0
        end
        object ppDBText44: TppDBText
          UserName = 'ppDBText44'
          DataField = 'INSCRICAONUMERO'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 27781
          mmTop = 16404
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object pplBairro: TppLabel
          UserName = 'lBairro'
          Caption = 'BAIRRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 81227
          mmTop = 33867
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppdbBairro: TppDBText
          UserName = 'dbBairro'
          DataField = 'BAIRRO'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 81227
          mmTop = 38629
          mmWidth = 25135
          BandType = 3
          GroupNo = 0
        end
        object pplCidade: TppLabel
          UserName = 'lCidade'
          Caption = 'Cidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 109802
          mmTop = 33867
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object pplNumDep: TppLabel
          UserName = 'lNumDep'
          Caption = 'Número de Dependentes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 135732
          mmTop = 22490
          mmWidth = 37835
          BandType = 3
          GroupNo = 0
        end
        object ppdbCidade: TppDBText
          UserName = 'dbCidade'
          DataField = 'CIDADE'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 109802
          mmTop = 38629
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object ppdbDatanasc: TppDBText
          UserName = 'dbDatanasc'
          DataField = 'DATANASC'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 116152
          mmTop = 27781
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppdbNumDep: TppDBText
          UserName = 'dbNumDep'
          DataField = 'NUMDEPIRRF'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 135732
          mmTop = 27781
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object pplEstado: TppLabel
          UserName = 'lEstado'
          Caption = 'Estado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 134673
          mmTop = 33867
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppdbEstado: TppDBText
          UserName = 'dbEstado'
          DataField = 'CODESTADO'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 134938
          mmTop = 38629
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object pplCEP: TppLabel
          UserName = 'lCEP'
          Caption = 'CEP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 158750
          mmTop = 33867
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object ppdbCep: TppDBText
          UserName = 'dbCep'
          DataField = 'CEP'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 158750
          mmTop = 38629
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText52: TppDBText
          UserName = 'ppDBText52'
          DataField = 'MATRICULA'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 2910
          mmTop = 16669
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppdbmespag: TppDBText
          UserName = 'dbmespag'
          DataField = 'MESCOBRANCA'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 165365
          mmTop = 6879
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object pplMesPagto: TppLabel
          UserName = 'lMesPagto'
          AutoSize = False
          Caption = 'Mês Pagto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 165365
          mmTop = 2381
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'lNumDep1'
          Caption = 'Isento IR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 176477
          mmTop = 22490
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'dbNumDep1'
          DataField = 'ISENTOIRRF'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 176477
          mmTop = 27781
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'lDataInicio1'
          Caption = 'Nº Benef. INSS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 55827
          mmTop = 11642
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'NUMPROCINSS'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 56092
          mmTop = 16669
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'lNome2'
          Caption = 'RECEBEDOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 2381
          mmTop = 23548
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'dbNome2'
          DataField = 'TITULAR'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 2910
          mmTop = 6879
          mmWidth = 129117
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBandTotal: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 26988
        mmPrintPosition = 0
        object ppRectTotal: TppShape
          UserName = 'RectTotal'
          Brush.Style = bsClear
          mmHeight = 26988
          mmLeft = 0
          mmTop = 265
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
        object pplTotalProvento: TppLabel
          UserName = 'lTotalProvento'
          AutoSize = False
          Caption = 'TOTAL DE PROVENTOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 3969
          mmTop = 5292
          mmWidth = 37042
          BandType = 5
          GroupNo = 0
        end
        object pplTotalDesconto: TppLabel
          UserName = 'lTotalDesconto'
          AutoSize = False
          Caption = 'TOTAL DE DESCONTOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 45773
          mmTop = 5292
          mmWidth = 37042
          BandType = 5
          GroupNo = 0
        end
        object pplLiquido: TppLabel
          UserName = 'lLiquido'
          AutoSize = False
          Caption = 'LÍQUIDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 99219
          mmTop = 5292
          mmWidth = 14288
          BandType = 5
          GroupNo = 0
        end
        object pplBanco: TppLabel
          UserName = 'lBanco'
          Caption = 'BANCO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 3440
          mmTop = 17198
          mmWidth = 11642
          BandType = 5
          GroupNo = 0
        end
        object pplAgencia: TppLabel
          UserName = 'lAgencia'
          Caption = 'AGÊNCIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 68792
          mmTop = 17198
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
        end
        object pplContaCorrente: TppLabel
          UserName = 'lContaCorrente'
          Caption = 'CONTA CORRENTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 115094
          mmTop = 17198
          mmWidth = 27781
          BandType = 5
          GroupNo = 0
        end
        object ppdbProvento: TppDBCalc
          UserName = 'dbProvento'
          DataField = 'VLPROVENTO'
          DataPipeline = ppdemonstpag
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 3969
          mmTop = 10319
          mmWidth = 37042
          BandType = 5
          GroupNo = 0
        end
        object ppdbDesconto: TppDBCalc
          UserName = 'dbDesconto'
          DataField = 'VLDESCONTO'
          DataPipeline = ppdemonstpag
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 45773
          mmTop = 10319
          mmWidth = 37042
          BandType = 5
          GroupNo = 0
        end
        object ppdbBanco: TppDBText
          UserName = 'dbBanco'
          DataField = 'BANCO'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 3440
          mmTop = 21696
          mmWidth = 62177
          BandType = 5
          GroupNo = 0
        end
        object ppdbAgencia: TppDBText
          UserName = 'dbAgencia'
          DataField = 'AGENCIA'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 68792
          mmTop = 21696
          mmWidth = 43392
          BandType = 5
          GroupNo = 0
        end
        object ppdbContaCorrente: TppDBText
          UserName = 'dbContaCorrente'
          DataField = 'CONTACORRENTE'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 115359
          mmTop = 21696
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object pplValorLiquido: TppLabel
          UserName = 'lValorLiquido'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 88636
          mmTop = 10319
          mmWidth = 24606
          BandType = 5
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'DATA DE CRÉDITO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 152136
          mmTop = 17198
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DATACREDITO'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3175
          mmLeft = 152400
          mmTop = 21696
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
        object ppLbTotalResiduo: TppLabel
          UserName = 'lLiquido1'
          AutoSize = False
          Caption = 'TOTAL RESÍDUO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 131234
          mmTop = 5556
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalcTotalResiduo: TppDBCalc
          UserName = 'DBCalcTotalResiduo'
          DataField = 'RESIDUO'
          DataPipeline = ppdemonstpag
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 131498
          mmTop = 10583
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'PD'
      DataPipeline = ppdemonstpag
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11642
        mmPrintPosition = 0
        object ppRectCabecRubricas: TppShape
          UserName = 'RectCabecRubricas'
          Brush.Style = bsClear
          mmHeight = 11642
          mmLeft = 0
          mmTop = 0
          mmWidth = 197380
          BandType = 3
          GroupNo = 1
        end
        object ppDbTextPD: TppDBText
          UserName = 'DbTextPD'
          DataField = 'PD'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 2117
          mmTop = 1852
          mmWidth = 26458
          BandType = 3
          GroupNo = 1
        end
        object pplCodigoRub: TppLabel
          UserName = 'lCodigoRub'
          AutoSize = False
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 33602
          mmTop = 7144
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
        end
        object pplDescricaoRub: TppLabel
          UserName = 'lDescricaoRub'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 47096
          mmTop = 7144
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object pplValorRubrica: TppLabel
          UserName = 'lValorRubrica'
          AutoSize = False
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 159279
          mmTop = 7144
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object pplMesRub: TppLabel
          UserName = 'lMesRub'
          Caption = 'Mês Ref.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1588
          mmTop = 7144
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object ppLbDataInicio: TppLabel
          UserName = 'lCodigoRub1'
          AutoSize = False
          Caption = 'Data Início'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 15875
          mmTop = 7144
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object ppLabelResiduo: TppLabel
          UserName = 'lValorRubrica1'
          AutoSize = False
          Caption = 'Resíduo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 181505
          mmTop = 7144
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650610
        5661725265736964756F4F6E43616C630B50726F6772616D54797065070B7474
        50726F63656475726506536F75726365066470726F6365647572652056617252
        65736964756F4F6E43616C63287661722056616C75653A2056617269616E7429
        3B0D0A626567696E0D0A0D0A202056616C7565203A3D64656D6F6E7374706167
        5B275245534944554F275D3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D65060A5661725265736964756F094576656E744E616D6506064F6E4361
        6C63074576656E74494402210000}
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
    Left = 202
    Top = 156
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
    Left = 202
    Top = 106
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 202
    Top = 56
  end
  object qryDataInicio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BBF.DATAINICIO'
      ' FROM BENEFBFCIARIO BBF, BENEFPLANPREV BPV'
      ' WHERE'
      '  BPV.IDRUBRICA = :IDRUBRICA'
      '  AND BPV.IDPLANOPREV = :IDPLANOPREV'
      '  AND BBF.IDPLANOPREV = BPV.IDPLANOPREV'
      '  AND BBF.IDBENEFICIO = BPV.IDBENEFICIO'
      '  AND BBF.IDPESSOA = :IDRESPONSAVEL'
      '  AND BBF.IDPESSJUR = :IDPESSJUR'
      '  AND BBF.IDSITBENEFICIO = 1'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 280
    Top = 156
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
end
