inherited dtmRel2ViaCCheque: TdtmRel2ViaCCheque
  Left = 312
  Top = 179
  Width = 334
  Height = 236
  Caption = 'dtmRel2ViaCCheque'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    CloseDataSource = True
    SkipWhenNoRecords = False
    Left = 24
    Top = 51
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
    Left = 24
    Top = 39
  end
  inherited qryExemplo: TwwQuery
    Left = 24
    Top = 25
  end
  inherited rpExemplo: TppReport
    Left = 24
    Top = 13
    DataPipelineName = 'pplExemplo'
    inherited HeaderBand1: TppHeaderBand
      inherited Line1: TppLine [0]
      end
      inherited LblEmpresa: TppLabel [1]
        mmLeft = 84931
        mmWidth = 28046
      end
      inherited Label11: TppLabel [2]
        mmTop = 9790
      end
    end
    inherited FooterBand1: TppFooterBand
      inherited Calc1: TppSystemVariable [0]
      end
      inherited LblSistema: TppLabel
        mmTop = 2910
      end
      inherited Calc2: TppSystemVariable
        mmLeft = 529
        mmTop = 2910
      end
      inherited Line2: TppLine [3]
      end
    end
  end
  object dsdemonstpag: TwwDataSource
    DataSet = qrydemonstpag
    Left = 106
    Top = 34
  end
  object qrydemonstpag: TwwQuery
    BeforeOpen = qrydemonstpagBeforeOpen
    BeforeClose = qrydemonstpagBeforeClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT HST.IDRESPONSAVEL   , HST.IDPESSJUR         , HS' +
        'T.MESCOBRANCA ,'
      
        '                RUB.CODPROVDESC     , BFC.DATAINICIO        , BE' +
        'N.NOME        ,'
      
        '                ELP.MATRICULA       , PPP.INSCRICAONUMERO   , PF' +
        'I.DATANASC    ,'
      
        '                PFI.NUMDEPIRRF      , AG.NUMAGENCIA         , CB' +
        '.CONTACORRENTE,'
      
        '                BC.NOME AS BANCO    , HST.MES               , HS' +
        'T.REFERENCIA  ,'
      
        '                HST.IDRUBRICA       , PVD.DESCRICAO         , PV' +
        'D.FLGESPECIAL ,'
      
        '                HST.VALORPROVENTO   , EP.IDPESSOA           , EP' +
        '.IDENDERECO   ,'
      
        '                EP.LOGRADOURO       , EP.IDPAIS             , EP' +
        '.CODESTADO    ,'
      
        '                EP.NUMERO           , EP.COMPLEMENTO        , EP' +
        '.BAIRRO       ,'
      
        '                EP.CIDADE           , EP.CEP                , EP' +
        '.TIPOENDERECO ,'
      '                EP.NOME             , PVD.FLGDESCONTO       ,'
      
        '                DECODE(PVD.FLGDESCONTO,0,'#39'PROVENTO'#39',1,'#39'DESCONTO'#39 +
        ') AS PD,'
      
        '                DECODE(PVD.FLGDESCONTO,0,HST.VALORPROVENTO,0.0) ' +
        '  AS VLPROVENTO,'
      
        '                DECODE(PVD.FLGDESCONTO,1,HST.VALORPROVENTO,0.0) ' +
        '  AS VLDESCONTO'
      
        'FROM            HISTRUBSAL       HST , BENEFBFCIARIO BFC , ELEGP' +
        'ATRO ELP   ,'
      
        '                PARTPREVPLAN     PPP , PESSOA        BEN , PESSO' +
        'AFISICA PFI,'
      
        '                PROVDESC         PVD , RUBRICAXPESS  RUB , ENDPE' +
        'SS EP      ,'
      
        '                CONTABANCARIA     CB , PESSOA         BC , PESSO' +
        'A AGN      ,'
      '                AGENCIABANCARIA AG'
      'WHERE           HST.MESCOBRANCA  = '#39'1998/07'#39
      'AND             BC.FLGBANCO      =  1'
      'AND             AGN.FLGAGENCIA   =  1'
      'AND             CB.FLGCONTAPREF  =  1'
      'AND             BC.IDPESSOA      =  AG.IDPESSOA'
      'AND             AG.IDBANCO       =  AGN.IDPESSOA'
      'AND             AGN.IDPESSOA     =  CB.IDAGENCIA'
      'AND             HST.IDMOTIVO     =  2'
      'AND             PVD.FLGDESCONTO  =  0'
      'AND             BFC.IDPLANOPREV = 1'
      'AND             BFC.IDPESSJUR = 20128'
      'AND             PVD.FLGESPECIAL <> 2'
      'AND             HST.IDPESSOA = 53140'
      'AND             PVD.IDPROVENTO    = HST.IDRUBRICA'
      'AND             PVD.IDPROVENTO    = RUB.IDRUBRICA'
      'AND             BFC.IDPESSJUR     = HST.IDPATRO'
      'AND             BFC.IDPESSOA      = HST.IDPESSOA'
      'AND             ELP.IDPESSJUR     = BFC.IDPESSJUR'
      'AND             ELP.IDPESSOA      = BFC.IDTITULAR'
      'AND             PPP.IDPESSJUR     = BFC.IDPESSJUR'
      'AND             PPP.IDPLANOPREV   = BFC.IDPLANOPREV'
      'AND             PPP.IDPESSOA      = BFC.IDTITULAR'
      'AND             PPP.SEQPROPOSTA   = BFC.SEQPROPOSTA'
      'AND             BEN.IDPESSOA      = HST.IDRESPONSAVEL'
      'AND             PFI.IDPESSOA      = HST.IDRESPONSAVEL'
      'ORDER           BY BEN.NOME, PVD.FLGDESCONTO, RUB.CODPROVDESC')
    ValidateWithMask = True
    Left = 162
    Top = 29
  end
  object ppdemonstpag: TppBDEPipeline
    DataSource = dsdemonstpag
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'demonstpag'
    Left = 226
    Top = 25
    object ppdemonstpagppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRESPONSAVEL'
      FieldName = 'IDRESPONSAVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppdemonstpagppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppdemonstpagppField3: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 2
    end
    object ppdemonstpagppField4: TppField
      FieldAlias = 'CODPROVDESC'
      FieldName = 'CODPROVDESC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 3
    end
    object ppdemonstpagppField5: TppField
      FieldAlias = 'DATAINICIO'
      FieldName = 'DATAINICIO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object ppdemonstpagppField6: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object ppdemonstpagppField7: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 6
    end
    object ppdemonstpagppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSCRICAONUMERO'
      FieldName = 'INSCRICAONUMERO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppdemonstpagppField9: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object ppdemonstpagppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMDEPIRRF'
      FieldName = 'NUMDEPIRRF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppdemonstpagppField11: TppField
      FieldAlias = 'NUMAGENCIA'
      FieldName = 'NUMAGENCIA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 10
    end
    object ppdemonstpagppField12: TppField
      FieldAlias = 'CONTACORRENTE'
      FieldName = 'CONTACORRENTE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 11
    end
    object ppdemonstpagppField13: TppField
      FieldAlias = 'BANCO'
      FieldName = 'BANCO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 12
    end
    object ppdemonstpagppField14: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 7
      DisplayWidth = 7
      Position = 13
    end
    object ppdemonstpagppField15: TppField
      FieldAlias = 'REFERENCIA'
      FieldName = 'REFERENCIA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 14
    end
    object ppdemonstpagppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRUBRICA'
      FieldName = 'IDRUBRICA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppdemonstpagppField17: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 130
      DisplayWidth = 130
      Position = 16
    end
    object ppdemonstpagppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGESPECIAL'
      FieldName = 'FLGESPECIAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppdemonstpagppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPROVENTO'
      FieldName = 'VALORPROVENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppdemonstpagppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppdemonstpagppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDENDERECO'
      FieldName = 'IDENDERECO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppdemonstpagppField22: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 21
    end
    object ppdemonstpagppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPAIS'
      FieldName = 'IDPAIS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppdemonstpagppField24: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 23
    end
    object ppdemonstpagppField25: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 24
    end
    object ppdemonstpagppField26: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 25
    end
    object ppdemonstpagppField27: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 26
    end
    object ppdemonstpagppField28: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 27
    end
    object ppdemonstpagppField29: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 28
    end
    object ppdemonstpagppField30: TppField
      FieldAlias = 'TIPOENDERECO'
      FieldName = 'TIPOENDERECO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 29
    end
    object ppdemonstpagppField31: TppField
      FieldAlias = 'NOME_1'
      FieldName = 'NOME_1'
      FieldLength = 40
      DisplayWidth = 40
      Position = 30
    end
    object ppdemonstpagppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGDESCONTO'
      FieldName = 'FLGDESCONTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object ppdemonstpagppField33: TppField
      FieldAlias = 'PD'
      FieldName = 'PD'
      FieldLength = 8
      DisplayWidth = 8
      Position = 32
    end
    object ppdemonstpagppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLPROVENTO'
      FieldName = 'VLPROVENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object ppdemonstpagppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLDESCONTO'
      FieldName = 'VLDESCONTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
  end
  object rpdemonstpag: TppReport
    AutoStop = False
    DataPipeline = ppdemonstpag
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
    Left = 274
    Top = 28
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppdemonstpag'
    object ppHeaderBandRel: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 42333
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'ppShape1'
        mmHeight = 14817
        mmLeft = 0
        mmTop = 26988
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
        mmTop = 31485
        mmWidth = 84667
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
        DataPipelineName = 'ppFundacao'
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
        DataPipelineName = 'ppFundacao'
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
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object ppdbImagem: TppDBImage
        UserName = 'dbImagem'
        MaintainAspectRatio = True
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
        DataPipelineName = 'ppFundacao'
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
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14288
        BandType = 0
      end
    end
    object ppDetailBand22: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
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
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = ppdemonstpag
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdemonstpag'
        mmHeight = 3175
        mmLeft = 32279
        mmTop = 265
        mmWidth = 16669
        BandType = 4
      end
      object ppdbValorRubrica: TppDBText
        UserName = 'dbValorRubrica'
        AutoSize = True
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
        DataPipelineName = 'ppdemonstpag'
        mmHeight = 3175
        mmLeft = 166952
        mmTop = 265
        mmWidth = 25400
        BandType = 4
      end
      object ppdbCodigoRub: TppDBText
        UserName = 'dbCodigoRub'
        DataField = 'CODPROVDESC'
        DataPipeline = ppdemonstpag
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdemonstpag'
        mmHeight = 3704
        mmLeft = 17727
        mmTop = 265
        mmWidth = 9525
        BandType = 4
      end
      object ppdbMesRub: TppDBText
        UserName = 'dbMesRub'
        AutoSize = True
        DataField = 'MES'
        DataPipeline = ppdemonstpag
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdemonstpag'
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 265
        mmWidth = 6085
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
        mmHeight = 794
        mmLeft = 0
        mmTop = 794
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel96: TppLabel
        UserName = 'ppLabel96'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2117
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
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc34: TppSystemVariable
        UserName = 'Calc34'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 2117
        mmWidth = 197380
        BandType = 8
      end
    end
    object rpdemonstpagSummaryBand1: TppSummaryBand
      AfterPrint = rpdemonstpagSummaryBand1AfterPrint
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
    end
    object ppGroup5: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppdemonstpag
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdemonstpag'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 36777
        mmPrintPosition = 0
        object ppRectDados: TppShape
          UserName = 'RectDados'
          mmHeight = 36777
          mmLeft = 0
          mmTop = 0
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object pplNome: TppLabel
          UserName = 'lNome'
          Caption = 'NOME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 3175
          mmTop = 2381
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object pplDataNasc: TppLabel
          UserName = 'lDataNasc'
          Caption = 'Data de Nascimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 134938
          mmTop = 2381
          mmWidth = 30692
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
          mmLeft = 3175
          mmTop = 13758
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
          mmLeft = 3175
          mmTop = 24871
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
          mmLeft = 55827
          mmTop = 13758
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object pplDataInicio: TppLabel
          UserName = 'lDataInicio'
          Caption = 'DATA DE INÍCIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 82286
          mmTop = 13758
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object ppdbNome: TppDBText
          UserName = 'dbNome'
          AutoSize = True
          DataField = 'NOME'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3175
          mmLeft = 3175
          mmTop = 6879
          mmWidth = 8467
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
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 3175
          mmTop = 29633
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
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 55827
          mmTop = 18785
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppdbDataInicio: TppDBText
          UserName = 'dbDataInicio'
          DataField = 'DATAINICIO'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 82286
          mmTop = 18785
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
          mmLeft = 82021
          mmTop = 24871
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
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 82021
          mmTop = 29633
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
          mmLeft = 110067
          mmTop = 24871
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
          mmLeft = 134938
          mmTop = 13758
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
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 110067
          mmTop = 29633
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
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 134938
          mmTop = 6879
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
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 134938
          mmTop = 18785
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
          mmTop = 24871
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppdbEstado: TppDBText
          UserName = 'dbEstado'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 134673
          mmTop = 29633
          mmWidth = 17198
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
          mmTop = 24871
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
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 158750
          mmTop = 29633
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
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 3175
          mmTop = 18785
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppdbmespag: TppDBText
          UserName = 'dbmespag'
          AutoSize = True
          DataField = 'MESCOBRANCA'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3175
          mmLeft = 170392
          mmTop = 6879
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object pplMesPagto: TppLabel
          UserName = 'lMesPagto'
          Caption = 'Mês Pagto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 176742
          mmTop = 2381
          mmWidth = 16140
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
          mmTop = 0
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
        object pplTotalProvento: TppLabel
          UserName = 'lTotalProvento'
          Caption = 'TOTAL DE PROVENTOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
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
          Caption = 'TOTAL DE DESCONTOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 42863
          mmTop = 5292
          mmWidth = 37042
          BandType = 5
          GroupNo = 0
        end
        object pplLiquido: TppLabel
          UserName = 'lLiquido'
          Caption = 'LÍQUIDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 80698
          mmTop = 5292
          mmWidth = 13494
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
          mmLeft = 43656
          mmTop = 17198
          mmWidth = 14817
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
          mmLeft = 84931
          mmTop = 17198
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object ppdbProvento: TppDBCalc
          UserName = 'dbProvento'
          DataField = 'VLPROVENTO'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup5
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 3969
          mmTop = 10319
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppdbDesconto: TppDBCalc
          UserName = 'dbDesconto'
          DataField = 'VLDESCONTO'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup5
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 42863
          mmTop = 10319
          mmWidth = 17198
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
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 3440
          mmTop = 21696
          mmWidth = 37571
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
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 43656
          mmTop = 21696
          mmWidth = 39952
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
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 85196
          mmTop = 21696
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object pplValorLiquido: TppLabel
          OnPrint = pplValorLiquidoPrint
          UserName = 'lValorLiquido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 92340
          mmTop = 10319
          mmWidth = 1588
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'PD'
      DataPipeline = ppdemonstpag
      OutlineSettings.CreateNode = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdemonstpag'
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
        object ppDBText54: TppDBText
          UserName = 'ppDBText54'
          DataField = 'PD'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3440
          mmLeft = 2117
          mmTop = 1852
          mmWidth = 26458
          BandType = 3
          GroupNo = 1
        end
        object pplCodigoRub: TppLabel
          UserName = 'lCodigoRub'
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 17727
          mmTop = 7144
          mmWidth = 11113
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
          mmLeft = 32279
          mmTop = 7144
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object pplValorRubrica: TppLabel
          UserName = 'lValorRubrica'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 184415
          mmTop = 7144
          mmWidth = 7938
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
          mmWidth = 13494
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
    Left = 130
    Top = 115
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
    Top = 120
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 58
    Top = 117
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
end
