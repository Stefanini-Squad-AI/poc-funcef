inherited dtmRelatAdmPREV2: TdtmRelatAdmPREV2
  Left = 490
  Top = 136
  Width = 668
  Height = 559
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 108
    Top = 4
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
    Left = 69
    Top = 4
  end
  inherited qryExemplo: TwwQuery
    Left = 30
    Top = 4
  end
  inherited rpExemplo: TppReport
    ModalCancelDialog = False
    ModalPreview = False
    Left = 150
    Top = 4
    DataPipelineName = 'pplExemplo'
    inherited HeaderBand1: TppHeaderBand
      inherited LblEmpresa: TppLabel
        mmLeft = 110596
        mmTop = 529
        mmWidth = 28046
      end
    end
    inherited FooterBand1: TppFooterBand
      inherited Calc2: TppSystemVariable [1]
      end
      inherited Calc1: TppSystemVariable [2]
      end
      inherited LblSistema: TppLabel [3]
        Caption = 'Administração Previdenciária'
      end
    end
  end
  object qryEvolFunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT 1 AS NUMQUADRO, EL.IDPESSJUR, EL.IDPESSOA,  EL.MATRICULA,' +
        ' PCS.IDPCS,'
      '       P.NUMDOCUMENTO AS CPF,'
      '       P.NOME AS PARTICIPANTE, PAT.NOME AS PATROCINADORA,'
      '       PL.NOME AS PLANO,'
      '       PCS.NOME AS NOMEPCS, PCS.PRAZOPBC, I.CODITEMPCS,'
      '       EF.DATAINICIO, EF.DATAFINAL,       I.ORDEMCALC,'
      '       ( DECODE(I.TIPO, 1, I.CODITEMPCS,'
      '                         2, I.CODITEMPCS,'
      '                         3, '#39'CARGO'#39','
      '                         4, '#39'FUNÇÃO'#39','
      '                         5, I.CODITEMPCS ) ||'
      '         DECODE(I.TIPO, 1, '#39'NULL '#39','
      '                         2, '#39'NULL '#39','
      '                         3, CEXT.CODIGO,'
      '                         4, CFUNC.CODIGO,'
      '                         5, I.CODITEMPCS ) ) AS NOMEITEM'
      
        'FROM   PESSOA P, PESSOA PAT, PLANPREV PL, ELEGPATRO EL, PARTPREV' +
        'PLAN PP, PCS PCS,'
      '       CARGOEXT CEXT, CARGOEXT CFUNC, ITEMPCS I, EVOLFUNCPREV EF'
      'WHERE  EL.IDPESSJUR = :IDPESSJUR'
      'AND    EL.IDPESSOA  = :IDPESSOA'
      'AND    PAT.IDPESSOA = EL.IDPESSJUR'
      'AND    P.IDPESSOA   = EL.IDPESSOA'
      'AND    PP.IDPESSJUR = EL.IDPESSJUR'
      'AND    PP.IDPESSOA  = EL.IDPESSOA'
      'AND    PP.FLGDESATIVADO = 0'
      'AND    PL.IDPLANOPREV = PP.IDPLANOPREV'
      'AND    EF.IDPESSJUR = EL.IDPESSJUR'
      'AND    EF.IDPESSOA  = EL.IDPESSOA'
      'AND    EF.IDPESSJURCG = CEXT.IDPESSJUR(+) '
      'AND    EF.IDCARGOEXT  = CEXT.IDCARGOEXT(+)  '
      'AND    EF.IDPESSJURFG = CFUNC.IDPESSJUR(+)  '
      'AND    EF.IDFUNCAO = CFUNC.IDCARGOEXT(+)  '
      'AND    I.IDPESSJUR  = EF.IDPESSJUR'
      'AND    I.IDPCS      = PCS.IDPCS'
      'ORDER BY I.ORDEMCALC, I.CODITEMPCS '
      ''
      ' '
      ' '
      ''
      '')
    ValidateWithMask = True
    Left = 29
    Top = 89
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 91008
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 45486
      end>
  end
  object dsEvolfFunc: TwwDataSource
    DataSet = qryEvolFunc
    Left = 69
    Top = 88
  end
  object ppEvolFunc: TppBDEPipeline
    DataSource = dsEvolfFunc
    UserName = 'EvolFunc'
    Left = 109
    Top = 88
  end
  object rpResumoFunc: TppReport
    AutoStop = False
    DataPipeline = ppEvolFunc
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
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 150
    Top = 90
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppEvolFunc'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Informações para Cálculo de Suplementação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 53446
        mmTop = 26723
        mmWidth = 90488
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'ppLine1'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 32279
        mmWidth = 197300
        BandType = 0
      end
      object rpBoletasDBImage1: TppDBImage
        UserName = 'rpBoletasDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object rpBoletasDBText1: TppDBText
        UserName = 'rpBoletasDBText1'
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
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object rpBoletasDBText2: TppDBText
        UserName = 'rpBoletasDBText2'
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
        mmWidth = 32544
        BandType = 0
      end
      object rpBoletasDBText31: TppDBText
        UserName = 'rpBoletasDBText31'
        DataField = 'LOGRADOURO'
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
        mmTop = 12965
        mmWidth = 41804
        BandType = 0
      end
      object rpBoletasDBText32: TppDBText
        UserName = 'rpBoletasDBText32'
        DataField = 'NUMERO'
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
        mmLeft = 86519
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
      object rpBoletasDBText33: TppDBText
        UserName = 'rpBoletasDBText33'
        DataField = 'CODESTADO'
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
        mmLeft = 86254
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object rpBoletasDBText34: TppDBText
        UserName = 'rpBoletasDBText34'
        DataField = 'CIDADE'
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
        mmLeft = 64029
        mmTop = 17463
        mmWidth = 20902
        BandType = 0
      end
      object rpBoletasDBText35: TppDBText
        UserName = 'rpBoletasDBText35'
        DataField = 'BAIRRO'
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
        mmTop = 17463
        mmWidth = 20108
        BandType = 0
      end
      object rpBoletasLabel24: TppLabel
        UserName = 'rpBoletasLabel24'
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
      object rpBoletasDBText36: TppDBText
        UserName = 'rpBoletasDBText36'
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
        mmLeft = 50800
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object rpResumoFuncLabel1: TppLabel
        UserName = 'rpResumoFuncLabel1'
        Caption = 'Matrícula :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 153988
        mmTop = 27252
        mmWidth = 14817
        BandType = 0
      end
      object rpResumoFuncDBText1: TppDBText
        UserName = 'rpResumoFuncDBText1'
        DataField = 'MATRICULA'
        DataPipeline = ppEvolFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEvolFunc'
        mmHeight = 3704
        mmLeft = 180446
        mmTop = 27252
        mmWidth = 15081
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object rpResumoFuncDBText8: TppDBText
        UserName = 'rpResumoFuncDBText8'
        DataField = 'NOMEITEM'
        DataPipeline = ppEvolFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEvolFunc'
        mmHeight = 3704
        mmLeft = 11642
        mmTop = 265
        mmWidth = 31485
        BandType = 4
      end
      object rpResumoFuncDBText9: TppDBText
        UserName = 'rpResumoFuncDBText9'
        DataField = 'DATAINICIO'
        DataPipeline = ppEvolFunc
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEvolFunc'
        mmHeight = 3704
        mmLeft = 51595
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object rpResumoFuncDBText10: TppDBText
        UserName = 'rpResumoFuncDBText10'
        DataField = 'DATAFINAL'
        DataPipeline = ppEvolFunc
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEvolFunc'
        mmHeight = 3704
        mmLeft = 80963
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object rpResumoFuncLine1: TppLine
        UserName = 'rpResumoFuncLine1'
        ParentHeight = True
        Position = lpRight
        Weight = 0.75
        mmHeight = 4233
        mmLeft = 109009
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
      object rpResumoFuncLine4: TppLine
        UserName = 'rpResumoFuncLine4'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4233
        mmLeft = 9260
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'ppLabel3'
        AutoSize = False
        Caption = 'AdmPREV'
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
        mmTop = 3175
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
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpResumoFuncGroup1: TppGroup
      BreakName = 'MATRICULA'
      DataPipeline = ppEvolFunc
      OutlineSettings.CreateNode = True
      UserName = 'rpResumoFuncGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEvolFunc'
      object rpResumoFuncGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 16933
        mmPrintPosition = 0
        object rpResumoFuncLabel2: TppLabel
          UserName = 'rpResumoFuncLabel2'
          Caption = 'Nome :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 9525
          mmTop = 6879
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object rpResumoFuncLabel3: TppLabel
          UserName = 'rpResumoFuncLabel3'
          Caption = 'Patrocinadora :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 73819
          mmTop = 11113
          mmWidth = 21696
          BandType = 3
          GroupNo = 0
        end
        object rpResumoFuncLabel4: TppLabel
          UserName = 'rpResumoFuncLabel4'
          Caption = 'Plano :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 153988
          mmTop = 11113
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object rpResumoFuncLabel5: TppLabel
          UserName = 'rpResumoFuncLabel5'
          Caption = 'PCS :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 73819
          mmTop = 6879
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
        end
        object rpResumoFuncLabel6: TppLabel
          UserName = 'rpResumoFuncLabel6'
          Caption = 'Prazo PBC :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 100806
          mmTop = 6879
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object rpResumoFuncLabel8: TppLabel
          UserName = 'rpResumoFuncLabel8'
          Caption = 'Data do Evento :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 153988
          mmTop = 6879
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object rpResumoFuncDBText2: TppDBText
          UserName = 'rpResumoFuncDBText2'
          DataField = 'PARTICIPANTE'
          DataPipeline = ppEvolFunc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEvolFunc'
          mmHeight = 3704
          mmLeft = 20638
          mmTop = 6879
          mmWidth = 51594
          BandType = 3
          GroupNo = 0
        end
        object rpResumoFuncDBText3: TppDBText
          UserName = 'rpResumoFuncDBText3'
          DataField = 'PATROCINADORA'
          DataPipeline = ppEvolFunc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEvolFunc'
          mmHeight = 3704
          mmLeft = 100806
          mmTop = 11113
          mmWidth = 32808
          BandType = 3
          GroupNo = 0
        end
        object rpResumoFuncDBText4: TppDBText
          UserName = 'rpResumoFuncDBText4'
          DataField = 'PLANO'
          DataPipeline = ppEvolFunc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEvolFunc'
          mmHeight = 3704
          mmLeft = 180446
          mmTop = 11113
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object rpResumoFuncDBText5: TppDBText
          UserName = 'rpResumoFuncDBText5'
          DataField = 'NOMEPCS'
          DataPipeline = ppEvolFunc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEvolFunc'
          mmHeight = 3704
          mmLeft = 82286
          mmTop = 6879
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object rpResumoFuncDBText6: TppDBText
          UserName = 'rpResumoFuncDBText6'
          DataField = 'PRAZOPBC'
          DataPipeline = ppEvolFunc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEvolFunc'
          mmHeight = 3704
          mmLeft = 118269
          mmTop = 6879
          mmWidth = 5821
          BandType = 3
          GroupNo = 0
        end
        object rpResumoFuncDBText7: TppDBText
          UserName = 'rpResumoFuncDBText7'
          DataField = 'DATAREFERENCIA'
          DataPipeline = ppEvolFunc
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEvolFunc'
          mmHeight = 3704
          mmLeft = 180446
          mmTop = 6879
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object rpResumoFuncLabel7: TppLabel
          UserName = 'rpResumoFuncLabel7'
          Caption = 'meses'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 124619
          mmTop = 6879
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object rpResumoFuncLine2: TppLine
          UserName = 'rpResumoFuncLine2'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 16140
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object rpResumoFuncLabel10: TppLabel
          UserName = 'rpResumoFuncLabel10'
          Caption = '( 1 ) '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 529
          mmWidth = 7144
          BandType = 3
          GroupNo = 0
        end
        object rpResumoFuncLabel14: TppLabel
          UserName = 'rpResumoFuncLabel14'
          Caption = 'DADOS DO ASSOCIADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 9525
          mmTop = 529
          mmWidth = 39952
          BandType = 3
          GroupNo = 0
        end
        object rpResumoFuncLabel16: TppLabel
          UserName = 'rpResumoFuncLabel16'
          Caption = 'CPF :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 9525
          mmTop = 11113
          mmWidth = 7144
          BandType = 3
          GroupNo = 0
        end
        object rpResumoFuncDBText11: TppDBText
          UserName = 'rpResumoFuncDBText11'
          DataField = 'CPF'
          DataPipeline = ppEvolFunc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEvolFunc'
          mmHeight = 3704
          mmLeft = 20638
          mmTop = 11113
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
      end
      object rpResumoFuncGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object rpResumoFuncQuadro4: TppSubReport
          UserName = 'rpResumoFuncQuadro4'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppResumoFunc'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpResumoFuncChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = ppResumoFunc
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
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppResumoFunc'
            object rpResumoFuncChildReport1TitleBand1: TppTitleBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 12171
              mmPrintPosition = 0
              object rpResumoFuncChildReport1Shape1: TppShape
                UserName = 'rpResumoFuncChildReport1Shape1'
                mmHeight = 5821
                mmLeft = 9525
                mmTop = 6350
                mmWidth = 101600
                BandType = 1
              end
              object rpResumoFuncChildReport1Label1: TppLabel
                UserName = 'rpResumoFuncChildReport1Label1'
                Caption = '( 3 ) '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 529
                mmTop = 794
                mmWidth = 7144
                BandType = 1
              end
              object rpResumoFuncChildReport1Label2: TppLabel
                UserName = 'rpResumoFuncChildReport1Label2'
                Caption = 'Componentes'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 11641
                mmTop = 7673
                mmWidth = 20902
                BandType = 1
              end
              object rpResumoFuncChildReport1Label3: TppLabel
                UserName = 'rpResumoFuncChildReport1Label3'
                Caption = 'Média no PBC'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 51594
                mmTop = 7673
                mmWidth = 19844
                BandType = 1
              end
              object rpResumoFuncChildReport1Label5: TppLabel
                UserName = 'rpResumoFuncChildReport1Label5'
                Caption = 'Valor na DIB'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 80963
                mmTop = 7673
                mmWidth = 17198
                BandType = 1
              end
              object rpResumoFuncChildReport1Label6: TppLabel
                UserName = 'rpResumoFuncChildReport1Label6'
                Caption = 'VALORES DOS COMPONENTES'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 9525
                mmTop = 794
                mmWidth = 52388
                BandType = 1
              end
            end
            object rpResumoFuncChildReport1DetailBand1: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5027
              mmPrintPosition = 0
              object rpResumoFuncChildReport1DBText1: TppDBText
                UserName = 'rpResumoFuncChildReport1DBText1'
                DataField = 'CODITEMPCS'
                DataPipeline = ppResumoFunc
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppResumoFunc'
                mmHeight = 3704
                mmLeft = 11641
                mmTop = 529
                mmWidth = 31750
                BandType = 4
              end
              object rpResumoFuncChildReport1DBText2: TppDBText
                UserName = 'rpResumoFuncChildReport1DBText2'
                DataField = 'VALORMEDIOITEM'
                DataPipeline = ppResumoFunc
                DisplayFormat = '#,0.00;(#,0.00)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppResumoFunc'
                mmHeight = 3704
                mmLeft = 55563
                mmTop = 794
                mmWidth = 15875
                BandType = 4
              end
              object rpResumoFuncChildReport1DBText3: TppDBText
                UserName = 'rpResumoFuncChildReport1DBText3'
                DataField = 'VALORITEM'
                DataPipeline = ppResumoFunc
                DisplayFormat = '#,0.00;(#,0.00)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppResumoFunc'
                mmHeight = 3704
                mmLeft = 82286
                mmTop = 529
                mmWidth = 15875
                BandType = 4
              end
              object rpResumoFuncChildReport1Line3: TppLine
                UserName = 'rpResumoFuncChildReport1Line3'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5027
                mmLeft = 9525
                mmTop = 0
                mmWidth = 794
                BandType = 4
              end
              object rpResumoFuncChildReport1Line4: TppLine
                UserName = 'rpResumoFuncChildReport1Line4'
                ParentHeight = True
                Position = lpRight
                Weight = 0.75
                mmHeight = 5027
                mmLeft = 109273
                mmTop = 0
                mmWidth = 1852
                BandType = 4
              end
            end
            object rpResumoFuncChildReport1SummaryBand1: TppSummaryBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 12965
              mmPrintPosition = 0
              object rpResumoFuncChildReport1Shape2: TppShape
                UserName = 'rpResumoFuncChildReport1Shape2'
                mmHeight = 5821
                mmLeft = 9525
                mmTop = 0
                mmWidth = 101600
                BandType = 7
              end
              object rpResumoFuncChildReport1Label4: TppLabel
                UserName = 'rpResumoFuncChildReport1Label4'
                Caption = 'Total'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 11641
                mmTop = 1323
                mmWidth = 7144
                BandType = 7
              end
              object rpResumoFuncChildReport1DBCalc1: TppDBCalc
                UserName = 'rpResumoFuncChildReport1DBCalc1'
                DataField = 'VALORMEDIOITEM'
                DataPipeline = ppResumoFunc
                DisplayFormat = '#,0.00;(#,0.00)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppResumoFunc'
                mmHeight = 3704
                mmLeft = 55563
                mmTop = 1323
                mmWidth = 15875
                BandType = 7
              end
              object rpResumoFuncQuadro5: TppSubReport
                UserName = 'rpResumoFuncQuadro5'
                ExpandAll = False
                NewPrintJob = False
                OutlineSettings.CreateNode = True
                TraverseAllData = False
                DataPipelineName = 'ppHistRubSal'
                mmHeight = 5027
                mmLeft = 0
                mmTop = 7673
                mmWidth = 197300
                BandType = 7
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object rpResumoFuncChildReport2: TppChildReport
                  AutoStop = False
                  DataPipeline = ppHistRubSal
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
                  Version = '7.04'
                  mmColumnWidth = 0
                  DataPipelineName = 'ppHistRubSal'
                  object rpResumoFuncChildReport2TitleBand1: TppTitleBand
                    mmBottomOffset = 0
                    mmHeight = 7938
                    mmPrintPosition = 0
                    object rpResumoFuncChildReport2Label1: TppLabel
                      UserName = 'rpResumoFuncChildReport2Label1'
                      Caption = '( 4 ) '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 10
                      Font.Style = [fsBold]
                      Transparent = True
                      mmHeight = 4233
                      mmLeft = 529
                      mmTop = 1323
                      mmWidth = 7144
                      BandType = 1
                    end
                    object rpResumoFuncChildReport2Label3: TppLabel
                      UserName = 'rpResumoFuncChildReport2Label3'
                      Caption = 'VALORES NO PBC - PARA SIMPLES CONFERÊNCIA'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 10
                      Font.Style = [fsBold]
                      Transparent = True
                      mmHeight = 4233
                      mmLeft = 9525
                      mmTop = 1323
                      mmWidth = 85196
                      BandType = 1
                    end
                  end
                  object rpResumoFuncChildReport2DetailBand1: TppDetailBand
                    mmBottomOffset = 0
                    mmHeight = 4233
                    mmPrintPosition = 0
                    object rpResumoFuncChildReport2DBText1: TppDBText
                      UserName = 'rpResumoFuncChildReport2DBText1'
                      DataField = 'MES'
                      DataPipeline = ppHistRubSal
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 8
                      Font.Style = []
                      Transparent = True
                      DataPipelineName = 'ppHistRubSal'
                      mmHeight = 3704
                      mmLeft = 10583
                      mmTop = 265
                      mmWidth = 17198
                      BandType = 4
                    end
                    object rpResumoFuncChildReport2DBText2: TppDBText
                      UserName = 'rpResumoFuncChildReport2DBText2'
                      DataField = 'COLUNA1'
                      DataPipeline = ppHistRubSal
                      DisplayFormat = '#,0.00;(#,0.00)'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 8
                      Font.Style = []
                      TextAlignment = taRightJustified
                      Transparent = True
                      DataPipelineName = 'ppHistRubSal'
                      mmHeight = 3704
                      mmLeft = 45244
                      mmTop = 265
                      mmWidth = 17198
                      BandType = 4
                    end
                    object rpResumoFuncChildReport2DBText3: TppDBText
                      UserName = 'rpResumoFuncChildReport2DBText3'
                      DataField = 'COLUNA2'
                      DataPipeline = ppHistRubSal
                      DisplayFormat = '#,0.00;(#,0.00)'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 8
                      Font.Style = []
                      TextAlignment = taRightJustified
                      Transparent = True
                      DataPipelineName = 'ppHistRubSal'
                      mmHeight = 3704
                      mmLeft = 72231
                      mmTop = 265
                      mmWidth = 17198
                      BandType = 4
                    end
                    object rpResumoFuncChildReport2DBText9: TppDBText
                      UserName = 'rpResumoFuncChildReport2DBText9'
                      DataField = 'COLUNA3'
                      DataPipeline = ppHistRubSal
                      DisplayFormat = '#,0.00;(#,0.00)'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 8
                      Font.Style = []
                      TextAlignment = taRightJustified
                      Transparent = True
                      DataPipelineName = 'ppHistRubSal'
                      mmHeight = 3704
                      mmLeft = 99219
                      mmTop = 265
                      mmWidth = 17198
                      BandType = 4
                    end
                    object rpResumoFuncChildReport2DBText10: TppDBText
                      UserName = 'rpResumoFuncChildReport2DBText10'
                      DataField = 'COLUNA4'
                      DataPipeline = ppHistRubSal
                      DisplayFormat = '#,0.00;(#,0.00)'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 8
                      Font.Style = []
                      TextAlignment = taRightJustified
                      Transparent = True
                      DataPipelineName = 'ppHistRubSal'
                      mmHeight = 3704
                      mmLeft = 126207
                      mmTop = 265
                      mmWidth = 17198
                      BandType = 4
                    end
                    object rpResumoFuncChildReport2DBText11: TppDBText
                      UserName = 'rpResumoFuncChildReport2DBText11'
                      DataField = 'COLUNA5'
                      DataPipeline = ppHistRubSal
                      DisplayFormat = '#,0.00;(#,0.00)'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 8
                      Font.Style = []
                      TextAlignment = taRightJustified
                      Transparent = True
                      DataPipelineName = 'ppHistRubSal'
                      mmHeight = 3704
                      mmLeft = 152136
                      mmTop = 265
                      mmWidth = 17198
                      BandType = 4
                    end
                    object rpResumoFuncChildReport2Line1: TppLine
                      UserName = 'rpResumoFuncChildReport2Line1'
                      ParentHeight = True
                      Position = lpLeft
                      Weight = 0.75
                      mmHeight = 4233
                      mmLeft = 9525
                      mmTop = 0
                      mmWidth = 794
                      BandType = 4
                    end
                    object rpResumoFuncChildReport2Line3: TppLine
                      UserName = 'rpResumoFuncChildReport2Line3'
                      ParentHeight = True
                      Position = lpRight
                      Weight = 0.75
                      mmHeight = 4233
                      mmLeft = 174361
                      mmTop = 0
                      mmWidth = 1852
                      BandType = 4
                    end
                  end
                  object rpResumoFuncChildReport2SummaryBand1: TppSummaryBand
                    mmBottomOffset = 0
                    mmHeight = 794
                    mmPrintPosition = 0
                    object rpResumoFuncChildReport2Line2: TppLine
                      UserName = 'rpResumoFuncChildReport2Line2'
                      Weight = 0.75
                      mmHeight = 794
                      mmLeft = 9525
                      mmTop = 0
                      mmWidth = 166688
                      BandType = 7
                    end
                  end
                  object rpResumoFuncChildReport2Group1: TppGroup
                    BreakName = 'LINHA'
                    DataPipeline = ppHistRubSal
                    OutlineSettings.CreateNode = True
                    UserName = 'rpResumoFuncChildReport2Group1'
                    mmNewColumnThreshold = 0
                    mmNewPageThreshold = 0
                    DataPipelineName = 'ppHistRubSal'
                    object rpResumoFuncChildReport2GroupHeaderBand1: TppGroupHeaderBand
                      mmBottomOffset = 0
                      mmHeight = 5556
                      mmPrintPosition = 0
                      object rpResumoFuncChildReport2Shape1: TppShape
                        UserName = 'rpResumoFuncChildReport2Shape1'
                        ParentHeight = True
                        mmHeight = 5556
                        mmLeft = 9525
                        mmTop = 0
                        mmWidth = 166688
                        BandType = 3
                        GroupNo = 0
                      end
                      object rpResumoFuncChildReport2DBText4: TppDBText
                        UserName = 'rpResumoFuncChildReport2DBText4'
                        AutoSize = True
                        DataField = 'TITULO1'
                        DataPipeline = ppHistRubSal
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = []
                        TextAlignment = taRightJustified
                        Transparent = True
                        DataPipelineName = 'ppHistRubSal'
                        mmHeight = 3440
                        mmLeft = 50800
                        mmTop = 794
                        mmWidth = 11642
                        BandType = 3
                        GroupNo = 0
                      end
                      object rpResumoFuncChildReport2Label2: TppLabel
                        UserName = 'rpResumoFuncChildReport2Label2'
                        Caption = 'AAAA/MM'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = []
                        Transparent = True
                        mmHeight = 3704
                        mmLeft = 10583
                        mmTop = 794
                        mmWidth = 13494
                        BandType = 3
                        GroupNo = 0
                      end
                      object rpResumoFuncChildReport2DBText5: TppDBText
                        UserName = 'rpResumoFuncChildReport2DBText5'
                        AutoSize = True
                        DataField = 'TITULO2'
                        DataPipeline = ppHistRubSal
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = []
                        TextAlignment = taRightJustified
                        Transparent = True
                        DataPipelineName = 'ppHistRubSal'
                        mmHeight = 3440
                        mmLeft = 77788
                        mmTop = 794
                        mmWidth = 11642
                        BandType = 3
                        GroupNo = 0
                      end
                      object rpResumoFuncChildReport2DBText6: TppDBText
                        UserName = 'rpResumoFuncChildReport2DBText6'
                        AutoSize = True
                        DataField = 'TITULO3'
                        DataPipeline = ppHistRubSal
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = []
                        TextAlignment = taRightJustified
                        Transparent = True
                        DataPipelineName = 'ppHistRubSal'
                        mmHeight = 3440
                        mmLeft = 104775
                        mmTop = 794
                        mmWidth = 11642
                        BandType = 3
                        GroupNo = 0
                      end
                      object rpResumoFuncChildReport2DBText7: TppDBText
                        UserName = 'rpResumoFuncChildReport2DBText7'
                        AutoSize = True
                        DataField = 'TITULO4'
                        DataPipeline = ppHistRubSal
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = []
                        TextAlignment = taRightJustified
                        Transparent = True
                        DataPipelineName = 'ppHistRubSal'
                        mmHeight = 3440
                        mmLeft = 131763
                        mmTop = 794
                        mmWidth = 11642
                        BandType = 3
                        GroupNo = 0
                      end
                      object rpResumoFuncChildReport2DBText8: TppDBText
                        UserName = 'rpResumoFuncChildReport2DBText8'
                        AutoSize = True
                        DataField = 'TITULO5'
                        DataPipeline = ppHistRubSal
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = []
                        TextAlignment = taRightJustified
                        Transparent = True
                        DataPipelineName = 'ppHistRubSal'
                        mmHeight = 3440
                        mmLeft = 157692
                        mmTop = 794
                        mmWidth = 11642
                        BandType = 3
                        GroupNo = 0
                      end
                    end
                    object rpResumoFuncChildReport2GroupFooterBand1: TppGroupFooterBand
                      mmBottomOffset = 0
                      mmHeight = 529
                      mmPrintPosition = 0
                    end
                  end
                end
              end
              object rpResumoFuncChildReport1DBCalc2: TppDBCalc
                UserName = 'rpResumoFuncChildReport1DBCalc2'
                DataField = 'VALORITEM'
                DataPipeline = ppResumoFunc
                DisplayFormat = '#,0.00;(#,0.00)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppResumoFunc'
                mmHeight = 3704
                mmLeft = 82286
                mmTop = 1323
                mmWidth = 15875
                BandType = 7
              end
              object rpResumoFuncChildReport1Line1: TppLine
                UserName = 'rpResumoFuncChildReport1Line1'
                ParentWidth = True
                Style = lsDouble
                Weight = 0.75
                mmHeight = 265
                mmLeft = 0
                mmTop = 6350
                mmWidth = 197300
                BandType = 7
              end
            end
          end
        end
      end
    end
    object rpResumoFuncGroup2: TppGroup
      BreakName = 'NUMQUADRO'
      DataPipeline = ppEvolFunc
      OutlineSettings.CreateNode = True
      UserName = 'rpResumoFuncGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEvolFunc'
      object rpResumoFuncGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object rpResumoFuncShape1: TppShape
          UserName = 'rpResumoFuncShape1'
          mmHeight = 5821
          mmLeft = 9260
          mmTop = 6879
          mmWidth = 101600
          BandType = 3
          GroupNo = 1
        end
        object rpResumoFuncLabel9: TppLabel
          UserName = 'rpResumoFuncLabel9'
          Caption = '( 2 ) '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 794
          mmWidth = 7144
          BandType = 3
          GroupNo = 1
        end
        object rpResumoFuncLabel11: TppLabel
          UserName = 'rpResumoFuncLabel11'
          Caption = 'Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 11641
          mmTop = 7938
          mmWidth = 6615
          BandType = 3
          GroupNo = 1
        end
        object rpResumoFuncLabel12: TppLabel
          UserName = 'rpResumoFuncLabel12'
          Caption = 'Início'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 51595
          mmTop = 7938
          mmWidth = 7673
          BandType = 3
          GroupNo = 1
        end
        object rpResumoFuncLabel13: TppLabel
          UserName = 'rpResumoFuncLabel13'
          Caption = 'Término'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 80963
          mmTop = 7938
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
        end
        object rpResumoFuncLabel15: TppLabel
          UserName = 'rpResumoFuncLabel15'
          Caption = 'SITUAÇÃO FUNCIONAL NO PBC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 9525
          mmTop = 794
          mmWidth = 52917
          BandType = 3
          GroupNo = 1
        end
      end
      object rpResumoFuncGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object rpResumoFuncLine3: TppLine
          UserName = 'rpResumoFuncLine3'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 2381
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object rpResumoFuncLine5: TppLine
          UserName = 'rpResumoFuncLine5'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 9260
          mmTop = 0
          mmWidth = 101600
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND'
      '      ( P.IDPESSOA =  E.IDPESSOA(+)) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      ( P.IDIMAGEM = I.IDIMAGEM(+))'
      ''
      ' ')
    ValidateWithMask = True
    Left = 472
    Top = 7
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 547
    Top = 10
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 596
    Top = 11
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
  object qryHistContribAnalit: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT EL.MATRICULA, P.NOME AS PARTICIPANTE, C.NOME AS CONTRIBUI' +
        'CAO,        '
      'PAT.NOME AS PATROCINADORA, PL.NOME AS PLANO,   '
      
        'HST.MESREFERENCIA, HST.MESCOBRANCA, HST.VALORRECEBIDO, HST.VALOR' +
        'ESPERADO, '
      '(HST.VALORRECEBIDO - HST.VALORESPERADO) AS DIFERENCA,  '
      'DECODE(HST.VALORRECEBIDO, 0, '#39'Não Recebida'#39',  '
      'DECODE(HST.SITRECEBIMENTO, 0, '#39'Não Enviadas'#39',  '
      
        '1, '#39'Não Recebida'#39',2, '#39'Recebidas OK'#39',3, '#39'Divergente'#39',            ' +
        '                                                         '
      
        '4, '#39'Divergente'#39',5, '#39'Divergente'#39',6, '#39'Divergente'#39', 7, '#39'Renegociada' +
        #39',                                                              ' +
        '               '
      
        '8, '#39'Canceladas'#39',9, '#39'Divergente'#39', '#39'Outros'#39') ) AS SITUACAO , HST.I' +
        'DCONTRIBUICAO            '
      'FROM   PESSOA P, PESSOA PAT, PLANPREV PL, CONTRIBUICAO C, '
      'ELEGPATRO EL, HSTCONTRIBPREV HST     '
      'WHERE  HST.IDPESSJUR     = 1'
      'AND  HST.IDPLANOPREV   = 7'
      
        'AND    HST.mescobranca = '#39'2002/09'#39'                              ' +
        '              '
      
        'AND    EL.IDPESSJUR      = HST.IDPESSJUR                        ' +
        '                                '
      
        'AND    EL.IDPESSOA       = HST.IDPESSOA                         ' +
        '                                '
      
        'AND    PAT.IDPESSOA      = HST.IDPESSJUR                        ' +
        '                                '
      
        'AND    P.IDPESSOA        = HST.IDPESSOA                         ' +
        '                                '
      
        'AND    PL.IDPLANOPREV    = HST.IDPLANOPREV                      ' +
        '                                '
      
        'AND    C.IDCONTRIBUICAO  = HST.IDCONTRIBUICAO                   ' +
        '                                '
      ''
      'UNION ALL'
      
        'SELECT EL.MATRICULA, P.NOME AS PARTICIPANTE, TA.DESCRICAO AS CON' +
        'TRIBUICAO,        '
      'PAT.NOME AS PATROCINADORA, PL.NOME AS PLANO,   '
      
        'HA.MESREFERENCIA, HA.MESCOBRANCA, HA.VALORRECEBIDO, HA.VALOR VAL' +
        'ORESPERADO, '
      '(HA.VALORRECEBIDO - HA.VALOR) AS DIFERENCA,  '
      'DECODE(HST.VALORRECEBIDO, 0, '#39'Não Recebida'#39',  '
      'DECODE(HST.SITRECEBIMENTO, 0, '#39'Não Enviadas'#39',  '
      
        '1, '#39'Não Recebida'#39',2, '#39'Recebidas OK'#39',3, '#39'Divergente'#39',            ' +
        '                                                         '
      
        '4, '#39'Divergente'#39',5, '#39'Divergente'#39',6, '#39'Divergente'#39', 7, '#39'Renegociada' +
        #39',                                                              ' +
        '               '
      
        '8, '#39'Canceladas'#39',9, '#39'Divergente'#39', '#39'Outros'#39') ) AS SITUACAO, HST.ID' +
        'CONTRIBUICAO             '
      'FROM   PESSOA P, PESSOA PAT, PLANPREV PL, CONTRIBUICAO C, '
      
        'ELEGPATRO EL, HSTCONTRIBPREV HST     , HSTATRASOCONTRIB HA, TIPO' +
        'ALTERADOR TA'
      'WHERE  HST.IDPESSJUR     = 1'
      'AND  HST.IDPLANOPREV   = 7'
      
        'AND    HST.mescobranca = '#39'2002/09'#39'                              ' +
        '              '
      
        'AND    EL.IDPESSJUR      = HST.IDPESSJUR                        ' +
        '                                '
      
        'AND    EL.IDPESSOA       = HST.IDPESSOA                         ' +
        '                                '
      
        'AND    PAT.IDPESSOA      = HST.IDPESSJUR                        ' +
        '                                '
      
        'AND    P.IDPESSOA        = HST.IDPESSOA                         ' +
        '                                '
      
        'AND    PL.IDPLANOPREV    = HST.IDPLANOPREV                      ' +
        '                                '
      'AND    C.IDCONTRIBUICAO  = HST.IDCONTRIBUICAO '
      'AND    HA.NUMRECEBIMENTO = HST.NUMRECEBIMENTO'
      'AND    HA.MESREFERENCIA = HST.MESREFERENCIA '
      'AND    HA.MESCOBRANCA = HST.MESCOBRANCA'
      'AND    TA.CODALTERADOR = HA.CODALTERADOR'
      'ORDER BY MATRICULA , IDCONTRIBUICAO')
    ValidateWithMask = True
    Left = 26
    Top = 168
  end
  object dsHistContribAnalit: TwwDataSource
    DataSet = qryHistContribAnalit
    Left = 64
    Top = 168
  end
  object ppHistContribAnalit: TppBDEPipeline
    DataSource = dsHistContribAnalit
    UserName = 'HistContribAnalit'
    Left = 104
    Top = 168
    object ppHistContribAnalitppField1: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 0
    end
    object ppHistContribAnalitppField2: TppField
      FieldAlias = 'PARTICIPANTE'
      FieldName = 'PARTICIPANTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppHistContribAnalitppField3: TppField
      FieldAlias = 'CONTRIBUICAO'
      FieldName = 'CONTRIBUICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppHistContribAnalitppField4: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppHistContribAnalitppField5: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppHistContribAnalitppField6: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 5
    end
    object ppHistContribAnalitppField7: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 6
    end
    object ppHistContribAnalitppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRECEBIDO'
      FieldName = 'VALORRECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppHistContribAnalitppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORESPERADO'
      FieldName = 'VALORESPERADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppHistContribAnalitppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFERENCA'
      FieldName = 'DIFERENCA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppHistContribAnalitppField11: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 12
      DisplayWidth = 12
      Position = 10
    end
    object ppHistContribAnalitppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRIBUICAO'
      FieldName = 'IDCONTRIBUICAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
  end
  object rpHistContribAnalit: TppReport
    AutoStop = False
    DataPipeline = ppHistContribAnalit
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
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 147
    Top = 168
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppHistContribAnalit'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel6: TppLabel
        UserName = 'ppLabel6'
        Caption = 'Histórico Mensal de Contribuições - Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 53446
        mmTop = 26723
        mmWidth = 90223
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'ppLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 32279
        mmWidth = 197379
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'ppDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 529
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'ppDBText1'
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
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'ppDBText2'
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
        mmWidth = 97367
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'ppDBText3'
        DataField = 'LOGRADOURO'
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
        mmTop = 12965
        mmWidth = 41804
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'ppDBText4'
        DataField = 'NUMERO'
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
        mmLeft = 86519
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'ppDBText5'
        DataField = 'CODESTADO'
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
        mmLeft = 86254
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'ppDBText6'
        DataField = 'CIDADE'
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
        mmLeft = 64029
        mmTop = 17463
        mmWidth = 20902
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'ppDBText7'
        DataField = 'BAIRRO'
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
        mmTop = 17463
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
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
      object ppDBText8: TppDBText
        UserName = 'ppDBText8'
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
        mmLeft = 50800
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object rpHistContribAnaliticoLabel1: TppLabel
        UserName = 'rpHistContribAnaliticoLabel1'
        Caption = 'Referência :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 152400
        mmTop = 26723
        mmWidth = 24342
        BandType = 0
      end
      object rpHistContribAnaliticoDBText1: TppDBText
        UserName = 'rpHistContribAnaliticoDBText1'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppHistContribAnalit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 5027
        mmLeft = 177536
        mmTop = 26723
        mmWidth = 18256
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object rpHistContribAnaliticoDBText4: TppDBText
        UserName = 'rpHistContribAnaliticoDBText4'
        DataField = 'MATRICULA'
        DataPipeline = ppHistContribAnalit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object rpHistContribAnaliticoDBText5: TppDBText
        UserName = 'rpHistContribAnaliticoDBText5'
        DataField = 'PARTICIPANTE'
        DataPipeline = ppHistContribAnalit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 3704
        mmLeft = 19579
        mmTop = 0
        mmWidth = 52652
        BandType = 4
      end
      object rpHistContribAnaliticoDBText6: TppDBText
        UserName = 'rpHistContribAnaliticoDBText6'
        DataField = 'CONTRIBUICAO'
        DataPipeline = ppHistContribAnalit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 3704
        mmLeft = 73290
        mmTop = 0
        mmWidth = 49477
        BandType = 4
      end
      object rpHistContribAnaliticoDBText7: TppDBText
        UserName = 'rpHistContribAnaliticoDBText7'
        DataField = 'VALORESPERADO'
        DataPipeline = ppHistContribAnalit
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 3704
        mmLeft = 124884
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object rpHistContribAnaliticoDBText8: TppDBText
        UserName = 'rpHistContribAnaliticoDBText8'
        DataField = 'VALORRECEBIDO'
        DataPipeline = ppHistContribAnalit
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object rpHistContribAnaliticoDBText9: TppDBText
        UserName = 'rpHistContribAnaliticoDBText9'
        DataField = 'SITUACAO'
        DataPipeline = ppHistContribAnalit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 3704
        mmLeft = 175684
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object rpHistContribAnaliticoDBText10: TppDBText
        UserName = 'rpHistContribAnaliticoDBText10'
        DataField = 'DIFERENCA'
        DataPipeline = ppHistContribAnalit
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'ppLine6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197379
        BandType = 8
      end
      object ppLabel8: TppLabel
        UserName = 'ppLabel8'
        AutoSize = False
        Caption = 'AdmPREV'
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
      object ppCalc5: TppSystemVariable
        UserName = 'Calc5'
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
      object ppCalc6: TppSystemVariable
        UserName = 'Calc6'
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
      BreakName = 'PATROCINADORA'
      DataPipeline = ppHistContribAnalit
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppHistContribAnalit'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpHistContribAnaliticoGroup1: TppGroup
      BreakName = 'PLANO'
      DataPipeline = ppHistContribAnalit
      OutlineSettings.CreateNode = True
      UserName = 'rpHistContribAnaliticoGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppHistContribAnalit'
      object rpHistContribAnaliticoGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12435
        mmPrintPosition = 0
        object rpHistContribAnaliticoLabel2: TppLabel
          UserName = 'rpHistContribAnaliticoLabel2'
          Caption = 'Patrocinadora : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 1323
          mmWidth = 26988
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoLabel3: TppLabel
          UserName = 'rpHistContribAnaliticoLabel3'
          Caption = 'Plano Previdenciário :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 102923
          mmTop = 1323
          mmWidth = 37571
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoDBText2: TppDBText
          UserName = 'rpHistContribAnaliticoDBText2'
          DataField = 'PATROCINADORA'
          DataPipeline = ppHistContribAnalit
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppHistContribAnalit'
          mmHeight = 4233
          mmLeft = 31221
          mmTop = 1323
          mmWidth = 69321
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoDBText3: TppDBText
          UserName = 'rpHistContribAnaliticoDBText3'
          DataField = 'PLANO'
          DataPipeline = ppHistContribAnalit
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppHistContribAnalit'
          mmHeight = 4233
          mmLeft = 141288
          mmTop = 1323
          mmWidth = 55298
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoLine1: TppLine
          UserName = 'rpHistContribAnaliticoLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 6350
          mmWidth = 197379
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoLabel4: TppLabel
          UserName = 'rpHistContribAnaliticoLabel4'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 529
          mmTop = 7408
          mmWidth = 13229
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoLabel5: TppLabel
          UserName = 'rpHistContribAnaliticoLabel5'
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 19579
          mmTop = 7408
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoLabel6: TppLabel
          UserName = 'rpHistContribAnaliticoLabel6'
          Caption = 'Contribuição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 73290
          mmTop = 7408
          mmWidth = 18521
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoLabel7: TppLabel
          UserName = 'rpHistContribAnaliticoLabel7'
          Caption = 'Esperado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 127000
          mmTop = 7408
          mmWidth = 13758
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoLabel8: TppLabel
          UserName = 'rpHistContribAnaliticoLabel8'
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 7408
          mmWidth = 13494
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoLabel9: TppLabel
          UserName = 'rpHistContribAnaliticoLabel9'
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 160338
          mmTop = 7408
          mmWidth = 13758
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoLabel10: TppLabel
          UserName = 'rpHistContribAnaliticoLabel10'
          Caption = 'Situação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 175684
          mmTop = 7408
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoLine2: TppLine
          UserName = 'rpHistContribAnaliticoLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 11377
          mmWidth = 197379
          BandType = 3
          GroupNo = 1
        end
      end
      object rpHistContribAnaliticoGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object rpHistContribAnaliticoDBCalc1: TppDBCalc
          UserName = 'rpHistContribAnaliticoDBCalc1'
          DataField = 'VALORESPERADO'
          DataPipeline = ppHistContribAnalit
          DisplayFormat = '#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpHistContribAnaliticoGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppHistContribAnalit'
          mmHeight = 3704
          mmLeft = 120915
          mmTop = 529
          mmWidth = 19844
          BandType = 5
          GroupNo = 1
        end
        object rpHistContribAnaliticoDBCalc2: TppDBCalc
          UserName = 'rpHistContribAnaliticoDBCalc2'
          DataField = 'VALORRECEBIDO'
          DataPipeline = ppHistContribAnalit
          DisplayFormat = '#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpHistContribAnaliticoGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppHistContribAnalit'
          mmHeight = 3704
          mmLeft = 142082
          mmTop = 529
          mmWidth = 15875
          BandType = 5
          GroupNo = 1
        end
        object rpHistContribAnaliticoLabel11: TppLabel
          UserName = 'rpHistContribAnaliticoLabel11'
          Caption = 'Total :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 110861
          mmTop = 529
          mmWidth = 8731
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object dsSitParticipAtivo: TwwDataSource
    DataSet = qrySitParticipAtivo
    Left = 64
    Top = 277
  end
  object qrySitParticipAtivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT E.MATRICULA, E.IDPESSOA, P.NOME,PF.DATANASC, PF.NUMDEPIRR' +
        'F, DECODE(PF.FLGISENTOIRRF,0,'#39'Não'#39','#39'Sim'#39'),'
      
        '       H.MES,H.IDRUBRICA,PD.DESCRICAO AS DESCRUB, H.VALORPROVENT' +
        'O, CB.CONTACORRENTE,'
      
        '       H.IDPESSOA AS IDBENEFICIARIO, H.IDRESPONSAVEL,PREC.NOME A' +
        'S NOMERECEBEDOR,'
      
        '       SP.DESCRICAO AS SITPART, SF.DESCRICAO AS SITFUNC, SV.DESC' +
        'RICAO AS SITPLANO'
      
        'FROM ELEGPATRO E, PARTPREVPLAN PP, PESSOA P, PESSOA PREC, PESSOA' +
        'FISICA PF,'
      '     HISTRUBSAL H, CONTABANCARIA CB, PROVDESC PD,'
      '     SITPART SP, SITFUNC SF, SITPLANOPREV SV'
      'WHERE E.IDPESSOA = :idpessoa  AND'
      '      E.IDPESSOA  = PP.IDPESSOA  AND'
      '      E.IDPESSJUR = PP.IDPESSJUR AND'
      '      E.IDPESSOA  = P.IDPESSOA   AND'
      '      E.IDPESSOA  = PF.IDPESSOA  AND'
      '      E.IDPESSOA  = H.IDTITULAR  AND'
      '      E.IDPESSOA  = CB.IDPESSOA(+)  AND'
      '      H.IDRUBRICA = PD.IDPROVENTO(+)   AND'
      '      H.IDRESPONSAVEL = PREC.IDPESSOA(+) AND'
      '      E.IDSITFUNC = SF.IDSITFUNC AND'
      '      PP.IDSITPART = SP.IDSITPART AND'
      '      PP.IDSITPLANOPREV = SV.IDSITPLANOPREV'
      ''
      
        'GROUP BY E.MATRICULA, E.IDPESSOA, P.NOME,PF.DATANASC, PF.NUMDEPI' +
        'RRF,  PF.FLGISENTOIRRF,'
      
        '       H.MES,H.IDRUBRICA,PD.DESCRICAO , H.VALORPROVENTO, CB.CONT' +
        'ACORRENTE,H.IDPESSOA,'
      '       H.IDRESPONSAVEL,PREC.NOME,'
      '       SP.DESCRICAO , SF.DESCRICAO , SV.DESCRICAO'
      'ORDER BY H.MES   DESC'
      ' ')
    ValidateWithMask = True
    Left = 26
    Top = 277
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptUnknown
        Value = 10540
      end>
  end
  object ppSitParticipAtivo: TppBDEPipeline
    DataSource = dsSitParticipAtivo
    UserName = 'SitParticipAtivo'
    Left = 103
    Top = 277
  end
  object rpSitParticipAtivo: TppReport
    AutoStop = False
    DataPipeline = ppSitParticipAtivo
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
    CachePages = True
    DeviceType = 'Screen'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 146
    Top = 277
    Version = '7.04'
    mmColumnWidth = 177800
    DataPipelineName = 'ppSitParticipAtivo'
    object ppHeaderBand28: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30163
      mmPrintPosition = 0
      object rpSitParticipAtivoLine1: TppLine
        UserName = 'rpSitParticipAtivoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 13758
        mmWidth = 197300
        BandType = 0
      end
      object rpSitParticipAtivoDBText4: TppDBText
        UserName = 'rpSitParticipAtivoDBText4'
        DataField = 'MATRICULA'
        DataPipeline = ppSitParticipAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppSitParticipAtivo'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 19315
        mmWidth = 21167
        BandType = 0
      end
      object rpSitParticipAtivoDBText5: TppDBText
        UserName = 'rpSitParticipAtivoDBText5'
        DataField = 'NOME'
        DataPipeline = ppSitParticipAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAtivo'
        mmHeight = 3704
        mmLeft = 24342
        mmTop = 19315
        mmWidth = 92075
        BandType = 0
      end
      object rpSitParticipAtivoDBText6: TppDBText
        UserName = 'rpSitParticipAtivoDBText6'
        DataField = 'NUMDEPIRRF'
        DataPipeline = ppSitParticipAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAtivo'
        mmHeight = 3704
        mmLeft = 121179
        mmTop = 19315
        mmWidth = 8996
        BandType = 0
      end
      object rpSitParticipAtivoDBText7: TppDBText
        UserName = 'rpSitParticipAtivoDBText7'
        DataField = 'CONTACORRENTE'
        DataPipeline = ppSitParticipAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAtivo'
        mmHeight = 3704
        mmLeft = 162190
        mmTop = 19315
        mmWidth = 17198
        BandType = 0
      end
      object rpSitParticipAtivoDBText8: TppDBText
        UserName = 'rpSitParticipAtivoDBText8'
        DataField = 'DATANASC'
        DataPipeline = ppSitParticipAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAtivo'
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 19315
        mmWidth = 17198
        BandType = 0
      end
      object rpSitParticipAtivoDBText9: TppDBText
        UserName = 'rpSitParticipAtivoDBText9'
        DataField = 'IDPESSOA'
        DataPipeline = ppSitParticipAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAtivo'
        mmHeight = 3704
        mmLeft = 180711
        mmTop = 19315
        mmWidth = 15081
        BandType = 0
      end
      object rpSitParticipAtivoDBText11: TppDBText
        UserName = 'rpSitParticipAtivoDBText11'
        DataField = 'SITFUNC'
        DataPipeline = ppSitParticipAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAtivo'
        mmHeight = 3704
        mmLeft = 80963
        mmTop = 23813
        mmWidth = 62177
        BandType = 0
      end
      object rpSitParticipAtivoDBText12: TppDBText
        UserName = 'rpSitParticipAtivoDBText12'
        DataField = 'SITPART'
        DataPipeline = ppSitParticipAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAtivo'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 23813
        mmWidth = 79111
        BandType = 0
      end
      object rpSitParticipAtivoDBText13: TppDBText
        UserName = 'rpSitParticipAtivoDBText13'
        DataField = 'SITPLANO'
        DataPipeline = ppSitParticipAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAtivo'
        mmHeight = 3704
        mmLeft = 144198
        mmTop = 23813
        mmWidth = 51594
        BandType = 0
      end
      object rpSitParticipAtivoLabel1: TppLabel
        UserName = 'rpSitParticipAtivoLabel1'
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 14817
        mmWidth = 11377
        BandType = 0
      end
      object rpSitParticipAtivoLabel2: TppLabel
        UserName = 'rpSitParticipAtivoLabel2'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 25665
        mmTop = 14817
        mmWidth = 7144
        BandType = 0
      end
      object rpSitParticipAtivoLabel3: TppLabel
        UserName = 'rpSitParticipAtivoLabel3'
        Caption = 'Dep IR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 121444
        mmTop = 14817
        mmWidth = 8202
        BandType = 0
      end
      object rpSitParticipAtivoLabel4: TppLabel
        UserName = 'rpSitParticipAtivoLabel4'
        Caption = 'Nascimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 142611
        mmTop = 14817
        mmWidth = 14817
        BandType = 0
      end
      object rpSitParticipAtivoLabel5: TppLabel
        UserName = 'rpSitParticipAtivoLabel5'
        Caption = 'C/ Corrente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 162190
        mmTop = 14817
        mmWidth = 14552
        BandType = 0
      end
      object rpSitParticipAtivoLabel6: TppLabel
        UserName = 'rpSitParticipAtivoLabel6'
        Caption = 'IdPessoa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 180711
        mmTop = 14817
        mmWidth = 11642
        BandType = 0
      end
      object rpSitParticipAtivoLine2: TppLine
        UserName = 'rpSitParticipAtivoLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 28310
        mmWidth = 197300
        BandType = 0
      end
      object rpSitParticipAtivoDBText14: TppDBText
        UserName = 'rpSitParticipAtivoDBText14'
        DataField = 'DECODE(PF.FLGISENTOIRRF,0,'#39'N?O'#39
        DataPipeline = ppSitParticipAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAtivo'
        mmHeight = 3704
        mmLeft = 131763
        mmTop = 19315
        mmWidth = 6879
        BandType = 0
      end
      object rpSitParticipAtivoLabel7: TppLabel
        UserName = 'rpSitParticipAtivoLabel7'
        Caption = 'Isento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 131234
        mmTop = 14817
        mmWidth = 9260
        BandType = 0
      end
      object rpSitParticipAtivoLabel8: TppLabel
        UserName = 'rpSitParticipAtivoLabel8'
        Caption = 'Relatório da Situação de Participante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        mmHeight = 7144
        mmLeft = 47361
        mmTop = 2910
        mmWidth = 103717
        BandType = 0
      end
    end
    object ppDetailBand28: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object rpSitParticipAtivoDBText1: TppDBText
        UserName = 'rpSitParticipAtivoDBText1'
        DataField = 'MES'
        DataPipeline = ppSitParticipAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAtivo'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 265
        mmWidth = 12700
        BandType = 4
      end
      object rpSitParticipAtivoDBText2: TppDBText
        UserName = 'rpSitParticipAtivoDBText2'
        DataField = 'DESCRUB'
        DataPipeline = ppSitParticipAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAtivo'
        mmHeight = 3704
        mmLeft = 23813
        mmTop = 265
        mmWidth = 88106
        BandType = 4
      end
      object rpSitParticipAtivoDBText3: TppDBText
        UserName = 'rpSitParticipAtivoDBText3'
        DataField = 'VALORPROVENTO'
        DataPipeline = ppSitParticipAtivo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppSitParticipAtivo'
        mmHeight = 3704
        mmLeft = 179123
        mmTop = 265
        mmWidth = 16669
        BandType = 4
      end
      object rpSitParticipAtivoDBText10: TppDBText
        UserName = 'rpSitParticipAtivoDBText10'
        DataField = 'IDRUBRICA'
        DataPipeline = ppSitParticipAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppSitParticipAtivo'
        mmHeight = 3704
        mmLeft = 14817
        mmTop = 265
        mmWidth = 7938
        BandType = 4
      end
      object rpSitParticipAtivoDBText15: TppDBText
        UserName = 'rpSitParticipAtivoDBText15'
        DataField = 'NOMERECEBEDOR'
        DataPipeline = ppSitParticipAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAtivo'
        mmHeight = 3704
        mmLeft = 113771
        mmTop = 265
        mmWidth = 47096
        BandType = 4
      end
      object rpSitParticipAtivoDBText16: TppDBText
        UserName = 'rpSitParticipAtivoDBText16'
        DataField = 'IDRESPONSAVEL'
        DataPipeline = ppSitParticipAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAtivo'
        mmHeight = 3704
        mmLeft = 162454
        mmTop = 265
        mmWidth = 13758
        BandType = 4
      end
    end
    object ppFooterBand29: TppFooterBand
      PrintOnFirstPage = False
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object rpSitParticipAtivoCalc1: TppSystemVariable
        UserName = 'rpSitParticipAtivoCalc1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 175419
        mmTop = 529
        mmWidth = 20902
        BandType = 8
      end
      object rpSitParticipAtivoCalc2: TppSystemVariable
        UserName = 'rpSitParticipAtivoCalc2'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 87313
        mmTop = 265
        mmWidth = 9525
        BandType = 8
      end
    end
    object rpSitParticipAtivoSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object rpSitParticipAtivoSubReport1: TppSubReport
        UserName = 'rpSitParticipAtivoSubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppSitParticipAtivoDepend'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpSitParticipAtivoChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppSitParticipAtivoDepend
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
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppSitParticipAtivoDepend'
          object rpSitParticipAtivoChildReport1TitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 14817
            mmPrintPosition = 0
            object rpSitParticipAtivoChildReport1Label1: TppLabel
              UserName = 'rpSitParticipAtivoChildReport1Label1'
              Caption = 'Nome'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 2117
              mmTop = 8996
              mmWidth = 7144
              BandType = 1
            end
            object rpSitParticipAtivoChildReport1Label2: TppLabel
              UserName = 'rpSitParticipAtivoChildReport1Label2'
              Caption = 'Designado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 106363
              mmTop = 8996
              mmWidth = 13494
              BandType = 1
            end
            object rpSitParticipAtivoChildReport1Label3: TppLabel
              UserName = 'rpSitParticipAtivoChildReport1Label3'
              Caption = 'Sexo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 123031
              mmTop = 8996
              mmWidth = 6615
              BandType = 1
            end
            object rpSitParticipAtivoChildReport1Label4: TppLabel
              UserName = 'rpSitParticipAtivoChildReport1Label4'
              Caption = 'Dependência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 142875
              mmTop = 8996
              mmWidth = 16669
              BandType = 1
            end
            object rpSitParticipAtivoChildReport1Label5: TppLabel
              UserName = 'rpSitParticipAtivoChildReport1Label5'
              Caption = 'Nascimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 171715
              mmTop = 8996
              mmWidth = 14817
              BandType = 1
            end
            object rpSitParticipAtivoChildReport1Line1: TppLine
              UserName = 'rpSitParticipAtivoChildReport1Line1'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 0
              mmTop = 7938
              mmWidth = 197380
              BandType = 1
            end
            object rpSitParticipAtivoChildReport1Line2: TppLine
              UserName = 'rpSitParticipAtivoChildReport1Line2'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 0
              mmTop = 13229
              mmWidth = 197380
              BandType = 1
            end
            object rpSitParticipAtivoChildReport1Label6: TppLabel
              UserName = 'rpSitParticipAtivoChildReport1Label6'
              Caption = 'Dependentes do Participante'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 14
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 5821
              mmLeft = 55298
              mmTop = 1058
              mmWidth = 70908
              BandType = 1
            end
            object rpSitParticipAtivoChildReport1Line3: TppLine
              UserName = 'rpSitParticipAtivoChildReport1Line3'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 0
              mmTop = 265
              mmWidth = 197300
              BandType = 1
            end
          end
          object rpSitParticipAtivoChildReport1DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object rpSitParticipAtivoChildReport1DBText1: TppDBText
              UserName = 'rpSitParticipAtivoChildReport1DBText1'
              DataField = 'NOMEDEP'
              DataPipeline = ppSitParticipAtivoDepend
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppSitParticipAtivoDepend'
              mmHeight = 3704
              mmLeft = 2381
              mmTop = 265
              mmWidth = 103452
              BandType = 4
            end
            object rpSitParticipAtivoChildReport1DBText2: TppDBText
              UserName = 'rpSitParticipAtivoChildReport1DBText2'
              DataField = 'FLGDESIGNADO'
              DataPipeline = ppSitParticipAtivoDepend
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppSitParticipAtivoDepend'
              mmHeight = 3704
              mmLeft = 107156
              mmTop = 265
              mmWidth = 14817
              BandType = 4
            end
            object rpSitParticipAtivoChildReport1DBText3: TppDBText
              UserName = 'rpSitParticipAtivoChildReport1DBText3'
              DataField = 'SEXO'
              DataPipeline = ppSitParticipAtivoDepend
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppSitParticipAtivoDepend'
              mmHeight = 3704
              mmLeft = 123825
              mmTop = 265
              mmWidth = 6350
              BandType = 4
            end
            object rpSitParticipAtivoChildReport1DBText4: TppDBText
              UserName = 'rpSitParticipAtivoChildReport1DBText4'
              DataField = 'TIPODEPEN'
              DataPipeline = ppSitParticipAtivoDepend
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppSitParticipAtivoDepend'
              mmHeight = 3704
              mmLeft = 143140
              mmTop = 265
              mmWidth = 17198
              BandType = 4
            end
            object rpSitParticipAtivoChildReport1DBText5: TppDBText
              UserName = 'rpSitParticipAtivoChildReport1DBText5'
              DataField = 'DATANASC'
              DataPipeline = ppSitParticipAtivoDepend
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppSitParticipAtivoDepend'
              mmHeight = 3704
              mmLeft = 171450
              mmTop = 265
              mmWidth = 23813
              BandType = 4
            end
          end
          object rpSitParticipAtivoChildReport1SummaryBand1: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object rpSitParticipAtivoChildReport1SubReport1: TppSubReport
              UserName = 'rpSitParticipAtivoChildReport1SubReport1'
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              TraverseAllData = False
              DataPipelineName = 'ppSitParticipContrib'
              mmHeight = 5027
              mmLeft = 0
              mmTop = 265
              mmWidth = 197300
              BandType = 7
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object rpSitParticipAtivoChildReport3: TppChildReport
                AutoStop = False
                DataPipeline = ppSitParticipContrib
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
                Version = '7.04'
                mmColumnWidth = 0
                DataPipelineName = 'ppSitParticipContrib'
                object rpSitParticipAtivoChildReport3TitleBand1: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 15081
                  mmPrintPosition = 0
                  object rpSitParticipAtivoChildReport3Line1: TppLine
                    UserName = 'rpSitParticipAtivoChildReport3Line1'
                    ParentWidth = True
                    Weight = 0.75
                    mmHeight = 1323
                    mmLeft = 0
                    mmTop = 13494
                    mmWidth = 197300
                    BandType = 1
                  end
                  object rpSitParticipAtivoChildReport3Line2: TppLine
                    UserName = 'rpSitParticipAtivoChildReport3Line2'
                    ParentWidth = True
                    Weight = 0.75
                    mmHeight = 1323
                    mmLeft = 0
                    mmTop = 8202
                    mmWidth = 197300
                    BandType = 1
                  end
                  object rpSitParticipAtivoChildReport3Label1: TppLabel
                    UserName = 'rpSitParticipAtivoChildReport3Label1'
                    Caption = 'Contribuição'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3704
                    mmLeft = 39688
                    mmTop = 8996
                    mmWidth = 15875
                    BandType = 1
                  end
                  object rpSitParticipAtivoChildReport3Label2: TppLabel
                    UserName = 'rpSitParticipAtivoChildReport3Label2'
                    Caption = 'Cobrança'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3704
                    mmLeft = 23548
                    mmTop = 8996
                    mmWidth = 12435
                    BandType = 1
                  end
                  object rpSitParticipAtivoChildReport3Label3: TppLabel
                    UserName = 'rpSitParticipAtivoChildReport3Label3'
                    Caption = ' Referência'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3704
                    mmLeft = 4498
                    mmTop = 8996
                    mmWidth = 14817
                    BandType = 1
                  end
                  object rpSitParticipAtivoChildReport3Label4: TppLabel
                    UserName = 'rpSitParticipAtivoChildReport3Label4'
                    Caption = 'Valor Esperado'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3704
                    mmLeft = 135996
                    mmTop = 8996
                    mmWidth = 19844
                    BandType = 1
                  end
                  object rpSitParticipAtivoChildReport3Label5: TppLabel
                    UserName = 'rpSitParticipAtivoChildReport3Label5'
                    Caption = 'Valor Recebido'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3704
                    mmLeft = 160867
                    mmTop = 8996
                    mmWidth = 19579
                    BandType = 1
                  end
                  object rpSitParticipAtivoChildReport3Label6: TppLabel
                    UserName = 'rpSitParticipAtivoChildReport3Label6'
                    Caption = 'Reserva'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3704
                    mmLeft = 186796
                    mmTop = 8996
                    mmWidth = 10848
                    BandType = 1
                  end
                  object rpSitParticipAtivoChildReport3Label7: TppLabel
                    UserName = 'rpSitParticipAtivoChildReport3Label7'
                    Caption = 'Contribuições do Participante'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 14
                    Font.Style = [fsBold]
                    TextAlignment = taRightJustified
                    Transparent = True
                    mmHeight = 5821
                    mmLeft = 57415
                    mmTop = 1588
                    mmWidth = 73025
                    BandType = 1
                  end
                  object rpSitParticipAtivoChildReport3Line3: TppLine
                    UserName = 'rpSitParticipAtivoChildReport3Line3'
                    ParentWidth = True
                    Weight = 0.75
                    mmHeight = 1323
                    mmLeft = 0
                    mmTop = 794
                    mmWidth = 197300
                    BandType = 1
                  end
                end
                object rpSitParticipAtivoChildReport3DetailBand1: TppDetailBand
                  mmBottomOffset = 0
                  mmHeight = 4233
                  mmPrintPosition = 0
                  object rpSitParticipAtivoChildReport3DBText1: TppDBText
                    UserName = 'rpSitParticipAtivoChildReport3DBText1'
                    DataField = 'MESREFERENCIA'
                    DataPipeline = ppSitParticipContrib
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppSitParticipContrib'
                    mmHeight = 3704
                    mmLeft = 2910
                    mmTop = 529
                    mmWidth = 17198
                    BandType = 4
                  end
                  object rpSitParticipAtivoChildReport3DBText2: TppDBText
                    UserName = 'rpSitParticipAtivoChildReport3DBText2'
                    DataField = 'MESCOBRANCA'
                    DataPipeline = ppSitParticipContrib
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppSitParticipContrib'
                    mmHeight = 3704
                    mmLeft = 21696
                    mmTop = 529
                    mmWidth = 17198
                    BandType = 4
                  end
                  object rpSitParticipAtivoChildReport3DBText3: TppDBText
                    UserName = 'rpSitParticipAtivoChildReport3DBText3'
                    DataField = 'IDCONTRIBUICAO'
                    DataPipeline = ppSitParticipContrib
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppSitParticipContrib'
                    mmHeight = 3704
                    mmLeft = 39952
                    mmTop = 529
                    mmWidth = 17198
                    BandType = 4
                  end
                  object rpSitParticipAtivoChildReport3DBText4: TppDBText
                    UserName = 'rpSitParticipAtivoChildReport3DBText4'
                    DataField = 'NOME'
                    DataPipeline = ppSitParticipContrib
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppSitParticipContrib'
                    mmHeight = 3704
                    mmLeft = 60061
                    mmTop = 529
                    mmWidth = 70379
                    BandType = 4
                  end
                  object rpSitParticipAtivoChildReport3DBText5: TppDBText
                    UserName = 'rpSitParticipAtivoChildReport3DBText5'
                    DataField = 'VALORESPERADO'
                    DataPipeline = ppSitParticipContrib
                    DisplayFormat = '#,0.00;-#,0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppSitParticipContrib'
                    mmHeight = 3704
                    mmLeft = 131234
                    mmTop = 529
                    mmWidth = 29369
                    BandType = 4
                  end
                  object rpSitParticipAtivoChildReport3DBText6: TppDBText
                    UserName = 'rpSitParticipAtivoChildReport3DBText6'
                    DataField = 'VALORRECEBIDO'
                    DataPipeline = ppSitParticipContrib
                    DisplayFormat = '#,0.00;-#,0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppSitParticipContrib'
                    mmHeight = 3704
                    mmLeft = 161925
                    mmTop = 529
                    mmWidth = 28575
                    BandType = 4
                  end
                  object rpSitParticipAtivoChildReport3DBText7: TppDBText
                    UserName = 'rpSitParticipAtivoChildReport3DBText7'
                    DataField = 'FLGCALCRESERVA'
                    DataPipeline = ppSitParticipContrib
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppSitParticipContrib'
                    mmHeight = 3704
                    mmLeft = 190765
                    mmTop = 529
                    mmWidth = 6879
                    BandType = 4
                  end
                end
                object rpSitParticipAtivoChildReport3SummaryBand1: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 13229
                  mmPrintPosition = 0
                end
              end
            end
          end
        end
      end
    end
  end
  object dsSitParticipAtivoDepend: TwwDataSource
    DataSet = qrySitParticipAtivoDepend
    Left = 263
    Top = 317
  end
  object qrySitParticipAtivoDepend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME AS NOMEDEP,'
      
        '       DECODE(DP.FLGDESIGNADO, 0 , '#39'NÃO'#39', 1 , '#39'SIM'#39', NULL, '#39'NÃO'#39 +
        ') AS FLGDESIGNADO,'
      '       PF.SEXO, PF.DATANASC, DEPEN.DESCRICAO AS TIPODEPEN'
      'FROM   DEPENTIT DP, PESSOAFISICA PF, PESSOA P, DEPEN'
      'WHERE  DP.IDTITULAR = :IDTITULAR'
      'AND    P.IDPESSOA   = DP.IDPESSOA'
      'AND    PF.IDPESSOA  = P.IDPESSOA'
      'AND    DP.IDDEPENDENCIA = DEPEN.IDDEPENDENCIA')
    ValidateWithMask = True
    Left = 226
    Top = 317
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = 10540
      end>
  end
  object ppSitParticipAtivoDepend: TppBDEPipeline
    DataSource = dsSitParticipAtivoDepend
    UserName = 'SitParticipAtivoDepend'
    Left = 301
    Top = 317
  end
  object ppSitParticipContrib: TppBDEPipeline
    DataSource = dsSitParticipContrib
    UserName = 'SitParticipContrib'
    Left = 301
    Top = 357
  end
  object qrySitParticipContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select H.MESREFERENCIA,H.MESCOBRANCA,H.IDCONTRIBUICAO, C.NOME, H' +
        '.VALORESPERADO, H.VALORRECEBIDO, H.FLGCALCRESERVA'
      'FROM HSTCONTRIBPREV H, CONTRIBUICAO C'
      'WHERE  H.IDPESSOA = :IDPESSOA AND'
      '                H.IDCONTRIBUICAO = C.IDCONTRIBUICAO'
      'ORDER BY MESREFERENCIA DESC')
    ValidateWithMask = True
    Left = 226
    Top = 357
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 10240
      end>
  end
  object dsSitParticipContrib: TwwDataSource
    DataSet = qrySitParticipContrib
    Left = 263
    Top = 357
  end
  object qrySitParticipAssist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT E.MATRICULA, E.IDPESSOA, P.NOME AS NOMETIT,PF.DATANASC, P' +
        'F.NUMDEPIRRF, BF.IDPESSOA, BF.IDRESPONSAVEL,'
      
        '      PRESP.NOME AS NOMERECEBEDOR, PBEN.NOME AS NOMEBENEFICIARIO' +
        ','
      
        '       H.MES,H.MESREFERENCIA,H.IDBENEFICIO,B.NOME AS NOMEBENEF, ' +
        'H.VALORPREV, CB.CONTACORRENTE,'
      
        '       SP.DESCRICAO AS SITPART, SF.DESCRICAO AS SITFUNC, SV.DESC' +
        'RICAO AS SITPLANO,'
      
        '       DECODE(BN.IDSITBENEFICIO,1,'#39'Ativo'#39',2,'#39'Retido'#39', 3,'#39'Cancela' +
        'do'#39'), BN.ULTMESPREPARO,'
      '       DECODE(BN.FLGBENEFMIN,0,'#39'Normal'#39','#39'B.Min'#39')'
      
        'FROM ELEGPATRO E,  HSTBENEFBFCIARIO H, BFCIARIOTITPLAN BF,BENEFB' +
        'FCIARIO BN,'
      
        '    PARTPREVPLAN PP, PESSOA P, PESSOAFISICA PF,  PESSOA PRESP, P' +
        'ESSOA PBEN,'
      '    CONTABANCARIA CB, BENEFICIO B,'
      '     SITPART SP, SITFUNC SF, SITPLANOPREV SV'
      'WHERE  E.IDPESSOA = :idpessoa   AND'
      '      E.IDPESSOA  = H.IDTITULAR(+)   AND'
      '      E.IDPESSJUR = H.IDPESSJUR(+) AND'
      '      H.IDBENEFICIO = B.IDBENEFICIO(+) AND '
      '      H.IDPESSJUR = BF.IDPESSJUR AND'
      '      H.IDPLANOPREV = BF.IDPLANOPREV AND'
      '      H.IDBENEFICIO   = BF.IDBENEFICIO  AND'
      '      H.IDPESSOA    = BF.IDPESSOA   AND'
      '      H.SEQPROPOSTA = BF.SEQPROPOSTA  AND'
      ''
      '      H.IDPESSJUR = BN.IDPESSJUR AND'
      '      H.IDPLANOPREV = BN.IDPLANOPREV AND'
      '      H.IDBENEFICIO   = BN.IDBENEFICIO  AND'
      '      H.IDPESSOA    = BN.IDPESSOA   AND'
      '      H.SEQPROPOSTA = BN.SEQPROPOSTA  AND'
      '      '
      '      E.IDPESSOA  = PP.IDPESSOA  AND'
      '      E.IDPESSJUR = PP.IDPESSJUR AND'
      '      E.IDPESSOA  = P.IDPESSOA   AND'
      '      E.IDSITFUNC = SF.IDSITFUNC AND'
      '      PP.IDSITPART = SP.IDSITPART AND'
      '      PP.IDSITPLANOPREV = SV.IDSITPLANOPREV AND'
      '      BF.IDRESPONSAVEL  = CB.IDPESSOA(+)  AND'
      '      BF.IDPESSOA = PBEN.IDPESSOA AND'
      '      BF.IDRESPONSAVEL = PRESP.IDPESSOA AND'
      '      BF.IDPESSOA  = PF.IDPESSOA'
      ''
      
        'GROUP BY E.MATRICULA, E.IDPESSOA, P.NOME ,PF.DATANASC, PF.NUMDEP' +
        'IRRF, BF.IDPESSOA, BF.IDRESPONSAVEL,'
      '      PRESP.NOME , PBEN.NOME ,'
      
        '       H.MES,H.MESREFERENCIA,H.IDBENEFICIO,B.NOME , H.VALORPREV,' +
        ' CB.CONTACORRENTE,'
      '       SP.DESCRICAO , SF.DESCRICAO , SV.DESCRICAO ,'
      '       BN.IDSITBENEFICIO,BN.ULTMESPREPARO, BN.FLGBENEFMIN'
      'ORDER BY H.IDBENEFICIO,H.MESREFERENCIA DESC'
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 26
    Top = 357
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptUnknown
        Value = 1230193
      end>
  end
  object dsSitParticipAssist: TwwDataSource
    DataSet = qrySitParticipAssist
    Left = 64
    Top = 357
  end
  object ppSitParticipAssist: TppBDEPipeline
    DataSource = dsSitParticipAssist
    UserName = 'SitParticipAssist'
    Left = 103
    Top = 357
  end
  object rpSitParticipAssist: TppReport
    AutoStop = False
    DataPipeline = ppSitParticipAssist
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
    CachePages = True
    DeviceType = 'Screen'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 146
    Top = 357
    Version = '7.04'
    mmColumnWidth = 177800
    DataPipelineName = 'ppSitParticipAssist'
    object ppHeaderBand29: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33867
      mmPrintPosition = 0
      object ppLine47: TppLine
        UserName = 'ppLine47'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 13758
        mmWidth = 284300
        BandType = 0
      end
      object ppDBText76: TppDBText
        UserName = 'ppDBText76'
        DataField = 'MATRICULA'
        DataPipeline = ppSitParticipAssist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppSitParticipAssist'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 19315
        mmWidth = 21167
        BandType = 0
      end
      object ppDBText104: TppDBText
        UserName = 'ppDBText104'
        DataField = 'NOME'
        DataPipeline = ppSitParticipAssist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAssist'
        mmHeight = 3704
        mmLeft = 24342
        mmTop = 19315
        mmWidth = 92075
        BandType = 0
      end
      object ppDBText154: TppDBText
        UserName = 'ppDBText154'
        DataField = 'IDPESSOA'
        DataPipeline = ppSitParticipAssist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAssist'
        mmHeight = 3704
        mmLeft = 180711
        mmTop = 19315
        mmWidth = 15081
        BandType = 0
      end
      object ppDBText155: TppDBText
        UserName = 'ppDBText155'
        DataField = 'SITFUNC'
        DataPipeline = ppSitParticipAssist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAssist'
        mmHeight = 3704
        mmLeft = 80963
        mmTop = 23813
        mmWidth = 62177
        BandType = 0
      end
      object ppDBText156: TppDBText
        UserName = 'ppDBText156'
        DataField = 'SITPART'
        DataPipeline = ppSitParticipAssist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAssist'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 23813
        mmWidth = 79111
        BandType = 0
      end
      object ppDBText157: TppDBText
        UserName = 'ppDBText157'
        DataField = 'SITPLANO'
        DataPipeline = ppSitParticipAssist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAssist'
        mmHeight = 3704
        mmLeft = 144198
        mmTop = 23813
        mmWidth = 51594
        BandType = 0
      end
      object ppLabel99: TppLabel
        UserName = 'ppLabel99'
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 14817
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel100: TppLabel
        UserName = 'ppLabel100'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 25665
        mmTop = 14817
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel132: TppLabel
        UserName = 'ppLabel132'
        Caption = 'Dep IR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 217223
        mmTop = 29633
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel144: TppLabel
        UserName = 'ppLabel144'
        Caption = 'IdPessoa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 180711
        mmTop = 14817
        mmWidth = 11642
        BandType = 0
      end
      object ppLine48: TppLine
        UserName = 'ppLine48'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 28310
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel146: TppLabel
        UserName = 'ppLabel146'
        Caption = 'Isento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 225955
        mmTop = 29633
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel166: TppLabel
        UserName = 'ppLabel166'
        Caption = 'Relatório da Situação de Participante - Assistido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        mmHeight = 7144
        mmLeft = 47361
        mmTop = 2910
        mmWidth = 134144
        BandType = 0
      end
      object rpSitParticipAssistDBText7: TppDBText
        UserName = 'rpSitParticipAssistDBText7'
        DataField = 'DECODE(BN.FLGBENEFMIN,0,'#39'NORMAL'
        DataPipeline = ppSitParticipAssist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAssist'
        mmHeight = 3704
        mmLeft = 267494
        mmTop = 23548
        mmWidth = 9525
        BandType = 0
      end
      object rpSitParticipAssistLabel1: TppLabel
        UserName = 'rpSitParticipAssistLabel1'
        Caption = 'Benefício Mínimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 261144
        mmTop = 19050
        mmWidth = 22225
        BandType = 0
      end
      object rpSitParticipAssistLabel2: TppLabel
        UserName = 'rpSitParticipAssistLabel2'
        Caption = 'Ref.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 29633
        mmWidth = 5027
        BandType = 0
      end
      object rpSitParticipAssistLabel3: TppLabel
        UserName = 'rpSitParticipAssistLabel3'
        Caption = 'Cob.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 13494
        mmTop = 29633
        mmWidth = 5556
        BandType = 0
      end
      object rpSitParticipAssistLabel4: TppLabel
        UserName = 'rpSitParticipAssistLabel4'
        Caption = 'Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 42863
        mmTop = 29633
        mmWidth = 11642
        BandType = 0
      end
      object rpSitParticipAssistLabel5: TppLabel
        UserName = 'rpSitParticipAssistLabel5'
        Caption = 'Beneficiário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 103717
        mmTop = 29633
        mmWidth = 14817
        BandType = 0
      end
      object rpSitParticipAssistLabel6: TppLabel
        UserName = 'rpSitParticipAssistLabel6'
        Caption = 'Recebedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 29633
        mmWidth = 12435
        BandType = 0
      end
      object rpSitParticipAssistLabel7: TppLabel
        UserName = 'rpSitParticipAssistLabel7'
        Caption = 'C/ Corrente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 197909
        mmTop = 29633
        mmWidth = 14288
        BandType = 0
      end
      object rpSitParticipAssistLabel8: TppLabel
        UserName = 'rpSitParticipAssistLabel8'
        Caption = 'Preparo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 239713
        mmTop = 29633
        mmWidth = 9790
        BandType = 0
      end
      object rpSitParticipAssistLabel9: TppLabel
        UserName = 'rpSitParticipAssistLabel9'
        Caption = 'Sit.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 253207
        mmTop = 29633
        mmWidth = 3969
        BandType = 0
      end
      object rpSitParticipAssistLabel10: TppLabel
        UserName = 'rpSitParticipAssistLabel10'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 266701
        mmTop = 29633
        mmWidth = 6615
        BandType = 0
      end
      object rpSitParticipAssistLine1: TppLine
        UserName = 'rpSitParticipAssistLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 33338
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand29: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText159: TppDBText
        UserName = 'ppDBText159'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppSitParticipAssist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAssist'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 265
        mmWidth = 11113
        BandType = 4
      end
      object rpSitParticipAssistDBText1: TppDBText
        UserName = 'rpSitParticipAssistDBText1'
        DataField = 'MES'
        DataPipeline = ppSitParticipAssist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAssist'
        mmHeight = 3704
        mmLeft = 12435
        mmTop = 265
        mmWidth = 12700
        BandType = 4
      end
      object rpSitParticipAssistDBText2: TppDBText
        UserName = 'rpSitParticipAssistDBText2'
        DataField = 'NOMEBENEF'
        DataPipeline = ppSitParticipAssist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAssist'
        mmHeight = 3704
        mmLeft = 26194
        mmTop = 265
        mmWidth = 64558
        BandType = 4
      end
      object rpSitParticipAssistDBText3: TppDBText
        UserName = 'rpSitParticipAssistDBText3'
        DataField = 'NOMEBENEFICIARIO'
        DataPipeline = ppSitParticipAssist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAssist'
        mmHeight = 3704
        mmLeft = 91811
        mmTop = 265
        mmWidth = 47625
        BandType = 4
      end
      object rpSitParticipAssistDBText4: TppDBText
        UserName = 'rpSitParticipAssistDBText4'
        DataField = 'NOMERECEBEDOR'
        DataPipeline = ppSitParticipAssist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAssist'
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 265
        mmWidth = 50536
        BandType = 4
      end
      object rpSitParticipAssistDBText5: TppDBText
        UserName = 'rpSitParticipAssistDBText5'
        DataField = 'CONTACORRENTE'
        DataPipeline = ppSitParticipAssist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAssist'
        mmHeight = 3704
        mmLeft = 194205
        mmTop = 265
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText132: TppDBText
        UserName = 'ppDBText132'
        DataField = 'NUMDEPIRRF'
        DataPipeline = ppSitParticipAssist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAssist'
        mmHeight = 3704
        mmLeft = 218282
        mmTop = 265
        mmWidth = 6350
        BandType = 4
      end
      object ppDBText158: TppDBText
        UserName = 'ppDBText158'
        DataField = 'DECODE(PF.FLGISENTOIRRF,0,'#39'N?O'#39
        DataPipeline = ppSitParticipAssist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAssist'
        mmHeight = 3704
        mmLeft = 226484
        mmTop = 265
        mmWidth = 6879
        BandType = 4
      end
      object rpSitParticipAssistDBText6: TppDBText
        UserName = 'rpSitParticipAssistDBText6'
        DataField = 'VALORPREV'
        DataPipeline = ppSitParticipAssist
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppSitParticipAssist'
        mmHeight = 3704
        mmLeft = 266171
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object rpSitParticipAssistDBText8: TppDBText
        UserName = 'rpSitParticipAssistDBText8'
        DataField = 'DECODE(BN.IDSITBENEFICIO,1,'#39'ATI'
        DataPipeline = ppSitParticipAssist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAssist'
        mmHeight = 3704
        mmLeft = 251884
        mmTop = 0
        mmWidth = 13494
        BandType = 4
      end
      object rpSitParticipAssistDBText9: TppDBText
        UserName = 'rpSitParticipAssistDBText9'
        DataField = 'ULTMESPREPARO'
        DataPipeline = ppSitParticipAssist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSitParticipAssist'
        mmHeight = 3704
        mmLeft = 239978
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
    end
    object ppFooterBand30: TppFooterBand
      PrintOnFirstPage = False
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppCalc52: TppSystemVariable
        UserName = 'Calc52'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 175419
        mmTop = 529
        mmWidth = 20902
        BandType = 8
      end
      object ppCalc53: TppSystemVariable
        UserName = 'Calc53'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 87313
        mmTop = 265
        mmWidth = 9525
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object qryRelatParametrizavel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P.RAZAOSOCIAL FROM'
      'PESSOA P, '
      'EMPRESAPROP E '
      'WHERE  P.IDPESSOA = E.IDPESSOA'
      'AND P.IDPESSOA = :PIDPESSOA')
    ValidateWithMask = True
    Left = 28
    Top = 127
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsRelatParametrizavel: TwwDataSource
    DataSet = qryRelatParametrizavel
    Left = 67
    Top = 127
  end
  object pplRelatParametrizavel: TppBDEPipeline
    DataSource = dsRelatParametrizavel
    UserName = 'lRelatParametrizavel'
    Left = 106
    Top = 127
  end
  object rpRelatParametrizavel: TppReport
    AutoStop = False
    DataPipeline = pplRelatParametrizavel
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 148
    Top = 127
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplRelatParametrizavel'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'ppLabel2'
        Caption = 'Título do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'ppLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84138
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'ppLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel5: TppLabel
        UserName = 'ppLabel5'
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
      object ppCalc3: TppSystemVariable
        UserName = 'Calc3'
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
      object ppCalc4: TppSystemVariable
        UserName = 'Calc4'
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
  end
  object qryDoUsuario: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT R.TEMPLATE'
      'FROM   REPORTS R'
      'WHERE  R.IDREPORTS = :IDREPORTS'
      'AND    R.ORIGEMCM  = :ORIGEMCM')
    ValidateWithMask = True
    Left = 225
    Top = 271
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDREPORTS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ORIGEMCM'
        ParamType = ptUnknown
      end>
    object qryDoUsuarioTEMPLATE: TBlobField
      FieldName = 'TEMPLATE'
      Origin = 'REPORTS.TEMPLATE'
      BlobType = ftBlob
      Size = 1
    end
  end
  object qryResumoFunc: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsEvolfFunc
    SQL.Strings = (
      
        'SELECT I.ORDEMCALC,I.CODITEMPCS, RF.VALORMEDIOITEM, RF.VALORITEM' +
        ',P.IDPCS, P.PRAZOPBC'
      'FROM   PCS P, ITEMPCS I, RESUMOFUNC RF'
      'WHERE  RF.IDPESSJUR = :IDPESSJUR'
      'AND    RF.IDPESSOA  = :IDPESSOA'
      'AND    RF.IDPCS     = :IDPCS'
      'AND    I.IDITEMPCS  = RF.IDITEMPCS'
      'AND    P.IDPCS      = RF.IDPCS'
      'ORDER BY I.ORDEMCALC, I.CODITEMPCS')
    ValidateWithMask = True
    Left = 219
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 91008
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 45486
      end
      item
        DataType = ftFloat
        Name = 'IDPCS'
        ParamType = ptUnknown
      end>
  end
  object dsResumoFunc: TwwDataSource
    DataSet = qryResumoFunc
    Left = 260
    Top = 160
  end
  object ppResumoFunc: TppBDEPipeline
    DataSource = dsResumoFunc
    UserName = 'ResumoFunc'
    Left = 298
    Top = 160
  end
  object qryHistRubSal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0 AS LINHA, '#39'0000/00'#39' AS MES,'
      '       '#39'               '#39' AS TITULO1,'
      '       '#39'               '#39' AS TITULO2,'
      '       '#39'               '#39' AS TITULO3,'
      '       '#39'               '#39' AS TITULO4,'
      '       '#39'               '#39' AS TITULO5,'
      
        '       0   AS COLUNA1, 0   AS COLUNA2, 0   AS COLUNA3, 0   AS CO' +
        'LUNA4, 0   AS COLUNA5'
      'FROM   ELEGPATRO'
      'WHERE  IDPESSJUR = -1'
      'AND    IDPESSOA  = -1')
    UpdateObject = updHistRubSal
    ValidateWithMask = True
    Left = 219
    Top = 125
  end
  object dsHistRubSal: TwwDataSource
    AutoEdit = False
    DataSet = qryHistRubSal
    Left = 259
    Top = 128
  end
  object ppHistRubSal: TppBDEPipeline
    DataSource = dsHistRubSal
    UserName = 'HistRubSal'
    Left = 300
    Top = 125
  end
  object updHistRubSal: TUpdateSQL
    ModifySQL.Strings = (
      'update ELEGPATRO'
      'set'
      '  LINHA = :LINHA,'
      '  MES = :MES,'
      '  TITULO1 = :TITULO1,'
      '  TITULO2 = :TITULO2,'
      '  TITULO3 = :TITULO3,'
      '  TITULO4 = :TITULO4,'
      '  TITULO5 = :TITULO5,'
      '  COLUNA1 = :COLUNA1,'
      '  COLUNA2 = :COLUNA2,'
      '  COLUNA3 = :COLUNA3,'
      '  COLUNA4 = :COLUNA4,'
      '  COLUNA5 = :COLUNA5'
      'where'
      '  LINHA = :OLD_LINHA')
    InsertSQL.Strings = (
      'insert into ELEGPATRO'
      
        '  (LINHA, MES, TITULO1, TITULO2, TITULO3, TITULO4, TITULO5, COLU' +
        'NA1, COLUNA2, '
      '   COLUNA3, COLUNA4, COLUNA5)'
      'values'
      
        '  (:LINHA, :MES, :TITULO1, :TITULO2, :TITULO3, :TITULO4, :TITULO' +
        '5, :COLUNA1, '
      '   :COLUNA2, :COLUNA3, :COLUNA4, :COLUNA5)')
    DeleteSQL.Strings = (
      'delete from ELEGPATRO'
      'where'
      '  LINHA = :OLD_LINHA')
    Left = 333
    Top = 124
  end
  object ppMovBenefOcor: TppBDEPipeline
    DataSource = dsMovBenefOcor
    UserName = 'MovBenefOcor'
    Left = 100
    Top = 314
  end
  object dsMovBenefOcor: TwwDataSource
    DataSet = qryMovBenefOcor
    Left = 62
    Top = 313
  end
  object qryMovBenefOcor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  1 as cont, EL.MATRICULA, MOV.IDMOVBENEF, MOV.IDPLANOPREV' +
        ', MOV.IDPESSJUR, MOV.IDTITULAR, MOV.IDBENEFICIO,'
      
        #9'MOV.NUMEROPROCESSO, MOV.IDPESSOA, MOV.SEQPROPOSTA, MOV.DATAMOV,' +
        ' MOV.VALORATUAL, US.NOMEUSUARIO,'
      
        #9'MOV.VALORTOTAL, MOV.VALORCOTAS, MOV.DATAINICIO, MOV.DATAFINAL, ' +
        'BEN.NOME AS BENEFICIO,MOV.TRGUSERINCLUSAO,'
      
        '        PES.NOME AS PESSOAF, PLA.NOME AS PLANO, MOV.DATAINICIOAN' +
        'T, MOV.DATAFINALANT, MOV.VALORATUALANT,'
      
        '        TIT.NOME AS TITULAR, DECODE( MOV.TIPOMOV, 0, '#39'Renovação'#39 +
        ','
      
        '                                                  1, '#39'Reabertura' +
        #39','
      
        '                                                  2, '#39'Prorrogaçã' +
        'o'#39','
      '                                                  3, '#39'Retenção'#39','
      
        '                                                  4, '#39'Encerramen' +
        'to'#39','
      
        '                                                  5, '#39'Desdobrame' +
        'nto'#39','
      
        '                                                  6, '#39'Reajuste J' +
        'udicial'#39','
      
        '                                                  7, '#39'Concessão'#39 +
        ','
      
        '                                                  8, '#39'Recalculo ' +
        'de Beneficio Provisorio'#39','
      
        '                                                  9, '#39'Registro d' +
        'e falecimento de beneficiario'#39')'
      
        '                                                   AS TIPOMOVIM,' +
        ' '#39'2002/01'#39' AS MESREFERENCIA'
      
        'FROM    ELEGPATRO EL, MOVBENEF MOV, BENEFICIO BEN, PESSOA PES, P' +
        'LANPREV PLA, PESSOA TIT, USUARIOSISTEMA US'
      'WHERE   (TO_CHAR(MOV.DATAMOV,'#39'YYYY/MM'#39') = :MESREF )'
      'AND     (MOV.TIPOMOV IN (:TIPOM))'
      'AND     (MOV.IDBENEFICIO                = BEN.IDBENEFICIO)'
      'AND     (MOV.IDPESSOA '#9#9#9'= PES.IDPESSOA)'
      'AND     (MOV.IDPLANOPREV '#9#9'= PLA.IDPLANOPREV)'
      'AND     (MOV.IDTITULAR '#9#9#9'= TIT.IDPESSOA)'
      'AND     (EL.IDPESSJUR                   = MOV.IDPESSJUR)'
      'AND     (EL.IDPESSOA                    = MOV.IDTITULAR)'
      
        'AND     (SUBSTR(MOV.TRGUSERINCLUSAO,3,10) = TO_CHAR(US.IDUSUARIO' +
        ' ))'
      
        'GROUP BY EL.MATRICULA,MOV.IDMOVBENEF, MOV.IDPLANOPREV, MOV.IDPES' +
        'SJUR, MOV.IDTITULAR, MOV.IDBENEFICIO,'
      
        #9'MOV.NUMEROPROCESSO, MOV.IDPESSOA, MOV.SEQPROPOSTA, MOV.DATAMOV,' +
        ' MOV.VALORATUAL, US.NOMEUSUARIO,'
      
        #9'MOV.VALORTOTAL, MOV.VALORCOTAS, MOV.DATAINICIO, MOV.DATAFINAL, ' +
        'BEN.NOME, MOV.TRGUSERINCLUSAO,'
      
        '        PES.NOME,PLA.NOME, TIT.NOME,MOV.TIPOMOV, MOV.DATAINICIOA' +
        'NT, MOV.DATAFINALANT, MOV.VALORATUALANT'
      'ORDER BY PLA.NOME, TIPOMOVIM, PES.NOME'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 24
    Top = 315
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREF'
        ParamType = ptUnknown
        Value = '2002/01'
      end
      item
        DataType = ftString
        Name = 'TIPOM'
        ParamType = ptUnknown
        Value = '7'
      end>
  end
  object rpMovBenefOcor: TppReport
    AutoStop = False
    DataPipeline = ppMovBenefOcor
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
    BeforePrint = rpMovBenefOcorBeforePrint
    DeviceType = 'Screen'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 147
    Top = 317
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppMovBenefOcor'
    object ppHeaderBand25: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33867
      mmPrintPosition = 0
      object rpMovBenefLabel1: TppLabel
        UserName = 'rpMovBenefLabel1'
        Caption = 
          'Relatório de Alteração de Situação de Benefício (Log de Ocorrênc' +
          'ias)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 71967
        mmTop = 26988
        mmWidth = 140229
        BandType = 0
      end
      object rpMovBenefDBImage1: TppDBImage
        UserName = 'rpMovBenefDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object rpMovBenefDBText1: TppDBText
        UserName = 'rpMovBenefDBText1'
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
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object rpMovBenefDBText2: TppDBText
        UserName = 'rpMovBenefDBText2'
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
        mmWidth = 96309
        BandType = 0
      end
      object rpMovBenefDBText3: TppDBText
        UserName = 'rpMovBenefDBText3'
        DataField = 'LOGRADOURO'
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
        mmTop = 12965
        mmWidth = 41804
        BandType = 0
      end
      object rpMovBenefDBText4: TppDBText
        UserName = 'rpMovBenefDBText4'
        DataField = 'NUMERO'
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
        mmLeft = 86519
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
      object rpMovBenefDBText5: TppDBText
        UserName = 'rpMovBenefDBText5'
        DataField = 'CODESTADO'
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
        mmLeft = 86254
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object rpMovBenefDBText6: TppDBText
        UserName = 'rpMovBenefDBText6'
        DataField = 'CIDADE'
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
        mmLeft = 64029
        mmTop = 17463
        mmWidth = 21431
        BandType = 0
      end
      object rpMovBenefDBText7: TppDBText
        UserName = 'rpMovBenefDBText7'
        DataField = 'BAIRRO'
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
        mmTop = 17463
        mmWidth = 20108
        BandType = 0
      end
      object rpMovBenefLabel2: TppLabel
        UserName = 'rpMovBenefLabel2'
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
      object rpMovBenefDBText8: TppDBText
        UserName = 'rpMovBenefDBText8'
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
        mmLeft = 50800
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel82: TppLabel
        UserName = 'Label82'
        Caption = 'Referência :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 216430
        mmTop = 26988
        mmWidth = 24342
        BandType = 0
      end
      object ppDBText94: TppDBText
        UserName = 'DBText94'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppMovBenefOcor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppMovBenefOcor'
        mmHeight = 5027
        mmLeft = 254530
        mmTop = 26988
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand23: TppDetailBand
      BeforePrint = ppDetailBand23BeforePrint
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object rpMovBenefOcorDBText1: TppDBText
        UserName = 'rpMovBenefOcorDBText1'
        DataField = 'MATRICULA'
        DataPipeline = ppMovBenefOcor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMovBenefOcor'
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object rpMovBenefOcorDBText2: TppDBText
        UserName = 'rpMovBenefOcorDBText2'
        DataField = 'PESSOAF'
        DataPipeline = ppMovBenefOcor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMovBenefOcor'
        mmHeight = 3175
        mmLeft = 16669
        mmTop = 0
        mmWidth = 52123
        BandType = 4
      end
      object rpMovBenefOcorDBText3: TppDBText
        UserName = 'rpMovBenefOcorDBText3'
        DataField = 'BENEFICIO'
        DataPipeline = ppMovBenefOcor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMovBenefOcor'
        mmHeight = 3175
        mmLeft = 69586
        mmTop = 0
        mmWidth = 45508
        BandType = 4
      end
      object rpMovBenefOcorDBText4: TppDBText
        UserName = 'rpMovBenefOcorDBText4'
        DataField = 'NUMEROPROCESSO'
        DataPipeline = ppMovBenefOcor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppMovBenefOcor'
        mmHeight = 3175
        mmLeft = 134938
        mmTop = 0
        mmWidth = 12435
        BandType = 4
      end
      object rpMovBenefOcorDBText5: TppDBText
        UserName = 'rpMovBenefOcorDBText5'
        DataField = 'VALORATUAL'
        DataPipeline = ppMovBenefOcor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppMovBenefOcor'
        mmHeight = 3175
        mmLeft = 148961
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
      object rpMovBenefOcorDBText7: TppDBText
        UserName = 'rpMovBenefOcorDBText7'
        DataField = 'DATAINICIO'
        DataPipeline = ppMovBenefOcor
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMovBenefOcor'
        mmHeight = 3175
        mmLeft = 166159
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
      object rpMovBenefOcorDBText8: TppDBText
        UserName = 'rpMovBenefOcorDBText8'
        DataField = 'DATAFINAL'
        DataPipeline = ppMovBenefOcor
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMovBenefOcor'
        mmHeight = 3175
        mmLeft = 179652
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object rpMovBenefOcorDBText9: TppDBText
        UserName = 'rpMovBenefOcorDBText9'
        DataField = 'DATAMOV'
        DataPipeline = ppMovBenefOcor
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMovBenefOcor'
        mmHeight = 3175
        mmLeft = 254530
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText1'
        DataField = 'DATAINICIOANT'
        DataPipeline = ppMovBenefOcor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMovBenefOcor'
        mmHeight = 2910
        mmLeft = 194734
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText2'
        DataField = 'DATAFINALANT'
        DataPipeline = ppMovBenefOcor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMovBenefOcor'
        mmHeight = 2910
        mmLeft = 216430
        mmTop = 531
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText3'
        DataField = 'VALORATUALANT'
        DataPipeline = ppMovBenefOcor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppMovBenefOcor'
        mmHeight = 2910
        mmLeft = 234421
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText4'
        DataField = 'NOMEUSUARIO'
        DataPipeline = ppMovBenefOcor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMovBenefOcor'
        mmHeight = 3175
        mmLeft = 115888
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand25: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLabel95: TppLabel
        UserName = 'ppLabel95'
        AutoSize = False
        Caption = 'AdmPREV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1323
        mmWidth = 283898
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
        mmLeft = 0
        mmTop = 1323
        mmWidth = 283898
        BandType = 8
      end
      object ppLine50: TppLine
        UserName = 'ppLine50'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 8
      end
    end
    object ppSummaryBand5: TppSummaryBand
      BeforePrint = ppSummaryBand5BeforePrint
      mmBottomOffset = 0
      mmHeight = 11113
      mmPrintPosition = 0
      object ppLabel86: TppLabel
        UserName = 'Label86'
        Caption = 'Total Geral de Ocorrências :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 173038
        mmTop = 529
        mmWidth = 47096
        BandType = 7
      end
      object ppLabel87: TppLabel
        UserName = 'Label87'
        Caption = '[ Total Geral de Processos :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 173038
        mmTop = 5556
        mmWidth = 46567
        BandType = 7
      end
      object lblBenefOcorrTotalProcesso: TppLabel
        UserName = 'lblBenefOcorrTotalProcesso'
        AutoSize = False
        Caption = 'lblBenefOcorrTotalProcesso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 254530
        mmTop = 5556
        mmWidth = 18256
        BandType = 7
      end
      object ppLabel88: TppLabel
        UserName = 'Label88'
        Caption = '] '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 273051
        mmTop = 5556
        mmWidth = 2117
        BandType = 7
      end
      object ppLine39: TppLine
        UserName = 'Line39'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc9'
        DataField = 'CONT'
        DataPipeline = ppMovBenefOcor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppMovBenefOcor'
        mmHeight = 4233
        mmLeft = 254530
        mmTop = 529
        mmWidth = 17198
        BandType = 7
      end
      object ppLine40: TppLine
        UserName = 'Line40'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 10319
        mmWidth = 284300
        BandType = 7
      end
      object ppLine41: TppLine
        UserName = 'Line41'
        ParentHeight = True
        Position = lpLeft
        Style = lsDouble
        Weight = 0.75
        mmHeight = 11113
        mmLeft = 0
        mmTop = 0
        mmWidth = 1588
        BandType = 7
      end
      object ppLine42: TppLine
        UserName = 'Line42'
        ParentHeight = True
        Position = lpRight
        Style = lsDouble
        Weight = 0.75
        mmHeight = 11113
        mmLeft = 282840
        mmTop = 0
        mmWidth = 1588
        BandType = 7
      end
    end
    object rpMovBenefGroup1: TppGroup
      BreakName = 'PLANO'
      DataPipeline = ppMovBenefOcor
      OutlineSettings.CreateNode = True
      UserName = 'rpMovBenefGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppMovBenefOcor'
      object rpMovBenefGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpMovBenefGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppLabel85: TppLabel
          UserName = 'rpMovBenefOcorLabel101'
          Caption = 'Total de Ocorrências do Plano :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 173038
          mmTop = 529
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'CONT'
          DataPipeline = ppMovBenefOcor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpMovBenefGroup1
          Transparent = True
          DataPipelineName = 'ppMovBenefOcor'
          mmHeight = 4233
          mmLeft = 254530
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpMovBenefOcorGroup1: TppGroup
      BreakName = 'TIPOMOVIM'
      DataPipeline = ppMovBenefOcor
      OutlineSettings.CreateNode = True
      UserName = 'rpMovBenefOcorGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppMovBenefOcor'
      object rpMovBenefOcorGroupHeaderBand1: TppGroupHeaderBand
        BeforePrint = rpMovBenefOcorGroupHeaderBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object rpMovBenefLabel4: TppLabel
          UserName = 'rpMovBenefLabel4'
          Caption = 'Plano Previdenciário : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 529
          mmWidth = 38629
          BandType = 3
          GroupNo = 1
        end
        object rpMovBenefDBText10: TppDBText
          UserName = 'rpMovBenefDBText10'
          AutoSize = True
          DataField = 'PLANO'
          DataPipeline = ppMovBenefOcor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppMovBenefOcor'
          mmHeight = 4233
          mmLeft = 40746
          mmTop = 529
          mmWidth = 71173
          BandType = 3
          GroupNo = 1
        end
        object rpMovBenefOcorLine1: TppLine
          UserName = 'rpMovBenefOcorLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5292
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object rpMovBenefOcorLabel1: TppLabel
          UserName = 'rpMovBenefOcorLabel1'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 1323
          mmTop = 6085
          mmWidth = 10054
          BandType = 3
          GroupNo = 1
        end
        object rpMovBenefOcorLabel2: TppLabel
          UserName = 'rpMovBenefOcorLabel2'
          Caption = 'Participante '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 16669
          mmTop = 6085
          mmWidth = 13494
          BandType = 3
          GroupNo = 1
        end
        object rpMovBenefOcorLabel3: TppLabel
          UserName = 'rpMovBenefOcorLabel3'
          Caption = 'Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 69586
          mmTop = 6085
          mmWidth = 10054
          BandType = 3
          GroupNo = 1
        end
        object rpMovBenefOcorLabel4: TppLabel
          UserName = 'rpMovBenefOcorLabel4'
          Caption = 'Processo Nº'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 133879
          mmTop = 6085
          mmWidth = 13494
          BandType = 3
          GroupNo = 1
        end
        object rpMovBenefOcorLabel5: TppLabel
          UserName = 'rpMovBenefOcorLabel5'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 158221
          mmTop = 6085
          mmWidth = 5821
          BandType = 3
          GroupNo = 1
        end
        object rpMovBenefOcorLabel6: TppLabel
          UserName = 'rpMovBenefOcorLabel6'
          Caption = 'Início'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 166159
          mmTop = 6085
          mmWidth = 5821
          BandType = 3
          GroupNo = 1
        end
        object rpMovBenefOcorLabel7: TppLabel
          UserName = 'rpMovBenefOcorLabel7'
          Caption = 'Término'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 179652
          mmTop = 6085
          mmWidth = 8996
          BandType = 3
          GroupNo = 1
        end
        object rpMovBenefOcorLabel8: TppLabel
          UserName = 'rpMovBenefOcorLabel8'
          Caption = 'Data da Ocor.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 254530
          mmTop = 6085
          mmWidth = 15081
          BandType = 3
          GroupNo = 1
        end
        object rpMovBenefOcorLabel9: TppLabel
          UserName = 'rpMovBenefOcorLabel9'
          Caption = 'Tipo de Ocorrência: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 216430
          mmTop = 529
          mmWidth = 34396
          BandType = 3
          GroupNo = 1
        end
        object rpMovBenefOcorDBText10: TppDBText
          UserName = 'rpMovBenefOcorDBText10'
          DataField = 'TIPOMOVIM'
          DataPipeline = ppMovBenefOcor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppMovBenefOcor'
          mmHeight = 4233
          mmLeft = 254530
          mmTop = 529
          mmWidth = 25665
          BandType = 3
          GroupNo = 1
        end
        object rpMovBenefOcorLine2: TppLine
          UserName = 'rpMovBenefOcorLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 9525
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object rpMovBenefOcorLbldtInicioAnt: TppLabel
          UserName = 'Label1'
          Caption = 'Data Início Ant.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 194734
          mmTop = 6085
          mmWidth = 16669
          BandType = 3
          GroupNo = 1
        end
        object rpMovBenefOcorLbldtFimAnt: TppLabel
          UserName = 'Label2'
          Caption = 'Data Fim Ant.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 216430
          mmTop = 6085
          mmWidth = 15081
          BandType = 3
          GroupNo = 1
        end
        object rpMovBenefOcorLblValorAnt: TppLabel
          UserName = 'Label3'
          Caption = 'Valor Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 236803
          mmTop = 6085
          mmWidth = 14817
          BandType = 3
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Usuário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 115888
          mmTop = 6085
          mmWidth = 8467
          BandType = 3
          GroupNo = 1
        end
        object rpMovBenefLine1: TppLine
          UserName = 'rpMovBenefLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
      end
      object rpMovBenefOcorGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object rpMovBenefOcorLabel10: TppLabel
          UserName = 'rpMovBenefOcorLabel10'
          Caption = 'Total de Ocorrências do Tipo '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 173038
          mmTop = 529
          mmWidth = 49742
          BandType = 5
          GroupNo = 1
        end
        object rpMovBenefOcorDBCalc1: TppDBCalc
          UserName = 'rpMovBenefOcorDBCalc1'
          DataField = 'CONT'
          DataPipeline = ppMovBenefOcor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpMovBenefOcorGroup1
          Transparent = True
          DataPipelineName = 'ppMovBenefOcor'
          mmHeight = 4233
          mmLeft = 254530
          mmTop = 265
          mmWidth = 15875
          BandType = 5
          GroupNo = 1
        end
        object ppDBText98: TppDBText
          UserName = 'rpMovBenefOcorDBText101'
          DataField = 'TIPOMOVIM'
          DataPipeline = ppMovBenefOcor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppMovBenefOcor'
          mmHeight = 4233
          mmLeft = 223838
          mmTop = 529
          mmWidth = 25665
          BandType = 5
          GroupNo = 1
        end
        object ppLabel83: TppLabel
          UserName = 'Label83'
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 250296
          mmTop = 529
          mmWidth = 1058
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object rpCertificado: TppReport
    AutoStop = False
    DataPipeline = ppCertificado
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
    CachePages = True
    DeviceType = 'Screen'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 147
    Top = 203
    Version = '7.04'
    mmColumnWidth = 177800
    DataPipelineName = 'ppCertificado'
    object rpCertificadoHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 39158
      mmPrintPosition = 0
      object ppDBImage4: TppDBImage
        UserName = 'ppDBImage4'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 35454
        mmLeft = 11642
        mmTop = 1852
        mmWidth = 32544
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'ppDBText3'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 14
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 7144
        mmLeft = 45508
        mmTop = 2117
        mmWidth = 116946
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'ppDBText6'
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
        mmLeft = 45508
        mmTop = 10054
        mmWidth = 25929
        BandType = 0
      end
      object rpCertificadoDBText1: TppDBText
        UserName = 'rpCertificadoDBText1'
        DataField = 'LOGRADOURO'
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
        mmLeft = 45508
        mmTop = 14817
        mmWidth = 75142
        BandType = 0
      end
      object rpCertificadoDBText2: TppDBText
        UserName = 'rpCertificadoDBText2'
        DataField = 'NUMERO'
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
        mmLeft = 121709
        mmTop = 14817
        mmWidth = 17198
        BandType = 0
      end
      object rpCertificadoDBText3: TppDBText
        UserName = 'rpCertificadoDBText3'
        DataField = 'BAIRRO'
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
        mmLeft = 45508
        mmTop = 19315
        mmWidth = 42598
        BandType = 0
      end
      object rpCertificadoDBText4: TppDBText
        UserName = 'rpCertificadoDBText4'
        DataField = 'CIDADE'
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
        mmLeft = 90223
        mmTop = 19315
        mmWidth = 52388
        BandType = 0
      end
      object rpCertificadoDBText5: TppDBText
        UserName = 'rpCertificadoDBText5'
        DataField = 'CODESTADO'
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
        mmLeft = 146050
        mmTop = 19315
        mmWidth = 17198
        BandType = 0
      end
      object rpCertificadoLabel1: TppLabel
        UserName = 'rpCertificadoLabel1'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 45508
        mmTop = 23813
        mmWidth = 5027
        BandType = 0
      end
      object rpCertificadoDBText6: TppDBText
        UserName = 'rpCertificadoDBText6'
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
        mmLeft = 52917
        mmTop = 23813
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand15: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppDBText15: TppDBText
        UserName = 'ppDBText13'
        DataField = 'NOMECONTRIB'
        DataPipeline = ppCertificado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppCertificado'
        mmHeight = 3704
        mmLeft = 15610
        mmTop = 794
        mmWidth = 111919
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'ppDBText16'
        DataField = 'NOMEVALORBASE1'
        DataPipeline = ppCertificado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppCertificado'
        mmHeight = 3704
        mmLeft = 15610
        mmTop = 5556
        mmWidth = 39158
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'ppDBText17'
        DataField = 'NOMEVALORBASE2'
        DataPipeline = ppCertificado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppCertificado'
        mmHeight = 3704
        mmLeft = 73290
        mmTop = 5556
        mmWidth = 39158
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'ppDBText20'
        DataField = 'NOMEVALORBASE3'
        DataPipeline = ppCertificado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppCertificado'
        mmHeight = 3704
        mmLeft = 131234
        mmTop = 5556
        mmWidth = 39158
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'ppDBText21'
        DataField = 'VALORESPERADO'
        DataPipeline = ppCertificado
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppCertificado'
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 794
        mmWidth = 26458
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'ppDBText23'
        BlankWhenZero = True
        DataField = 'VALORBASE1'
        DataPipeline = ppCertificado
        DisplayFormat = '###,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppCertificado'
        mmHeight = 3704
        mmLeft = 55827
        mmTop = 5556
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'ppDBText24'
        BlankWhenZero = True
        DataField = 'VALORBASE2'
        DataPipeline = ppCertificado
        DisplayFormat = '###,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppCertificado'
        mmHeight = 3704
        mmLeft = 113242
        mmTop = 5556
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'ppDBText25'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'VALORBASE3'
        DataPipeline = ppCertificado
        DisplayFormat = '###,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppCertificado'
        mmHeight = 2910
        mmLeft = 171980
        mmTop = 5556
        mmWidth = 16140
        BandType = 4
      end
    end
    object ppFooterBand14: TppFooterBand
      PrintOnFirstPage = False
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup4: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppCertificado
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppCertificado'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 88900
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'ppShape2'
          Shape = stRoundRect
          mmHeight = 8731
          mmLeft = 159544
          mmTop = 23283
          mmWidth = 33602
          BandType = 3
          GroupNo = 0
        end
        object ppShape3: TppShape
          UserName = 'ppShape3'
          Shape = stRoundRect
          mmHeight = 8731
          mmLeft = 13229
          mmTop = 23283
          mmWidth = 95515
          BandType = 3
          GroupNo = 0
        end
        object ppShape4: TppShape
          UserName = 'ppShape4'
          Shape = stRoundRect
          mmHeight = 8731
          mmLeft = 12965
          mmTop = 11906
          mmWidth = 95779
          BandType = 3
          GroupNo = 0
        end
        object ppLabel38: TppLabel
          UserName = 'ppLabel38'
          Caption = 'NOME DO PARTICIPANTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          mmHeight = 2910
          mmLeft = 14817
          mmTop = 10583
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
        object ppShape5: TppShape
          UserName = 'ppShape5'
          Shape = stRoundRect
          mmHeight = 8731
          mmLeft = 109273
          mmTop = 11906
          mmWidth = 28840
          BandType = 3
          GroupNo = 0
        end
        object ppLabel39: TppLabel
          UserName = 'ppLabel39'
          Caption = 'CPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          mmHeight = 2910
          mmLeft = 111125
          mmTop = 10583
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object ppShape6: TppShape
          UserName = 'ppShape6'
          Shape = stRoundRect
          mmHeight = 8731
          mmLeft = 134938
          mmTop = 23283
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppLabel47: TppLabel
          UserName = 'ppLabel47'
          Caption = 'Salário Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          mmHeight = 2910
          mmLeft = 136525
          mmTop = 21960
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppLabel48: TppLabel
          UserName = 'ppLabel48'
          Caption = 'PLANO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          mmHeight = 2910
          mmLeft = 15346
          mmTop = 21960
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppShape7: TppShape
          UserName = 'ppShape7'
          Shape = stRoundRect
          mmHeight = 8731
          mmLeft = 109538
          mmTop = 23283
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object ppLabel49: TppLabel
          UserName = 'ppLabel49'
          Caption = 'INSCRIÇÃO Nº'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          mmHeight = 2910
          mmLeft = 111390
          mmTop = 21960
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel50: TppLabel
          UserName = 'ppLabel50'
          Caption = 'INSCRIÇÃO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          mmHeight = 2910
          mmLeft = 166952
          mmTop = 21960
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppDBText26: TppDBText
          UserName = 'ppDBText26'
          DataField = 'PARTICIPANTE'
          DataPipeline = ppCertificado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppCertificado'
          mmHeight = 3704
          mmLeft = 15346
          mmTop = 14817
          mmWidth = 91546
          BandType = 3
          GroupNo = 0
        end
        object ppDBText28: TppDBText
          UserName = 'ppDBText28'
          DataField = 'CPF'
          DataPipeline = ppCertificado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppCertificado'
          mmHeight = 3704
          mmLeft = 110596
          mmTop = 14817
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppDBText30: TppDBText
          UserName = 'ppDBText30'
          DataField = 'VALORPROVENTO'
          DataPipeline = ppCertificado
          DisplayFormat = '###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppCertificado'
          mmHeight = 3704
          mmLeft = 136525
          mmTop = 26723
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppDBText31: TppDBText
          UserName = 'ppDBText31'
          DataField = 'NOMEPLAN'
          DataPipeline = ppCertificado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppCertificado'
          mmHeight = 3704
          mmLeft = 15610
          mmTop = 26194
          mmWidth = 91546
          BandType = 3
          GroupNo = 0
        end
        object ppDBText32: TppDBText
          UserName = 'ppDBText32'
          DataField = 'INSCRICAONUMERO'
          DataPipeline = ppCertificado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppCertificado'
          mmHeight = 3704
          mmLeft = 111390
          mmTop = 26194
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppDBText33: TppDBText
          UserName = 'ppDBText33'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'INSCRICAODATA'
          DataPipeline = ppCertificado
          DisplayFormat = 'DD/MM/YYYYY'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppCertificado'
          mmHeight = 3175
          mmLeft = 162719
          mmTop = 26194
          mmWidth = 23019
          BandType = 3
          GroupNo = 0
        end
        object ppShape8: TppShape
          UserName = 'ppShape8'
          Shape = stRoundRect
          mmHeight = 8731
          mmLeft = 163513
          mmTop = 11906
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppDBText35: TppDBText
          UserName = 'ppDBText35'
          AutoSize = True
          DataField = 'DATA_DE_NASCIMENTO'
          DataPipeline = ppCertificado
          DisplayFormat = 'DD/MM/YYYYY'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppCertificado'
          mmHeight = 3175
          mmLeft = 156898
          mmTop = 14817
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object ppLabel51: TppLabel
          UserName = 'ppLabel51'
          Caption = 'NASCIMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          mmHeight = 2910
          mmLeft = 164307
          mmTop = 10319
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppShape9: TppShape
          UserName = 'ppShape9'
          Shape = stRoundRect
          mmHeight = 8731
          mmLeft = 182827
          mmTop = 11906
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppDBText36: TppDBText
          UserName = 'ppDBText36'
          AutoSize = True
          DataField = 'SEXO'
          DataPipeline = ppCertificado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppCertificado'
          mmHeight = 3175
          mmLeft = 183886
          mmTop = 14552
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLabel52: TppLabel
          UserName = 'ppLabel52'
          Caption = 'SEXO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          mmHeight = 2910
          mmLeft = 183621
          mmTop = 10054
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object ppShape10: TppShape
          UserName = 'ppShape10'
          Shape = stRoundRect
          mmHeight = 8996
          mmLeft = 138642
          mmTop = 11642
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppLabel53: TppLabel
          UserName = 'ppLabel53'
          Caption = 'Idade Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          mmHeight = 2910
          mmLeft = 140229
          mmTop = 10583
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object ppLabel54: TppLabel
          UserName = 'ppLabel54'
          Caption = 'Informações Cadastrais de Filiação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 18
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 7673
          mmLeft = 46567
          mmTop = 1058
          mmWidth = 107156
          BandType = 3
          GroupNo = 0
        end
        object ppShape11: TppShape
          UserName = 'ppShape11'
          Brush.Color = clSilver
          Pen.Color = clSilver
          mmHeight = 2117
          mmLeft = 10319
          mmTop = 34925
          mmWidth = 183886
          BandType = 3
          GroupNo = 0
        end
        object ppShape12: TppShape
          UserName = 'ppShape12'
          Shape = stRoundRect
          mmHeight = 8731
          mmLeft = 143934
          mmTop = 66675
          mmWidth = 50271
          BandType = 3
          GroupNo = 0
        end
        object ppShape13: TppShape
          UserName = 'ppShape13'
          Shape = stRoundRect
          mmHeight = 8731
          mmLeft = 138907
          mmTop = 42863
          mmWidth = 29898
          BandType = 3
          GroupNo = 0
        end
        object ppShape14: TppShape
          UserName = 'ppShape14'
          Shape = stRoundRect
          mmHeight = 8731
          mmLeft = 13229
          mmTop = 43127
          mmWidth = 99484
          BandType = 3
          GroupNo = 0
        end
        object ppLabel55: TppLabel
          UserName = 'ppLabel55'
          Caption = 'OUTRAS INFORMAÇÕES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 79904
          mmTop = 37571
          mmWidth = 40746
          BandType = 3
          GroupNo = 0
        end
        object ppShape15: TppShape
          UserName = 'ppShape15'
          Brush.Color = clSilver
          Pen.Color = clSilver
          mmHeight = 2910
          mmLeft = 10583
          mmTop = 77523
          mmWidth = 184415
          BandType = 3
          GroupNo = 0
        end
        object ppShape16: TppShape
          UserName = 'ppShape16'
          Shape = stRoundRect
          mmHeight = 8731
          mmLeft = 171450
          mmTop = 54504
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object ppShape17: TppShape
          UserName = 'ppShape17'
          Shape = stRoundRect
          mmHeight = 8731
          mmLeft = 12435
          mmTop = 54769
          mmWidth = 66940
          BandType = 3
          GroupNo = 0
        end
        object ppShape18: TppShape
          UserName = 'ppShape18'
          Shape = stRoundRect
          mmHeight = 8731
          mmLeft = 12435
          mmTop = 66675
          mmWidth = 86254
          BandType = 3
          GroupNo = 0
        end
        object ppLabel56: TppLabel
          UserName = 'ppLabel56'
          Caption = 'LOGRADOURO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          mmHeight = 3175
          mmLeft = 16404
          mmTop = 41804
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppShape19: TppShape
          UserName = 'ppShape19'
          Shape = stRoundRect
          mmHeight = 8731
          mmLeft = 115094
          mmTop = 43392
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object ppLabel57: TppLabel
          UserName = 'ppLabel57'
          Caption = 'NÚMERO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          mmHeight = 3175
          mmLeft = 117211
          mmTop = 42069
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppShape20: TppShape
          UserName = 'ppShape20'
          Shape = stRoundRect
          mmHeight = 8731
          mmLeft = 102394
          mmTop = 66411
          mmWidth = 38894
          BandType = 3
          GroupNo = 0
        end
        object ppLabel58: TppLabel
          UserName = 'ppLabel58'
          Caption = 'COMPLEMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          mmHeight = 3175
          mmLeft = 141817
          mmTop = 41540
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object ppLabel59: TppLabel
          UserName = 'ppLabel59'
          Caption = 'BAIRRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          mmHeight = 3175
          mmLeft = 15081
          mmTop = 53446
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppShape21: TppShape
          UserName = 'ppShape21'
          Shape = stRoundRect
          mmHeight = 8731
          mmLeft = 81492
          mmTop = 55033
          mmWidth = 87048
          BandType = 3
          GroupNo = 0
        end
        object ppLabel64: TppLabel
          UserName = 'ppLabel64'
          Caption = 'CIDADE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          mmHeight = 3175
          mmLeft = 84667
          mmTop = 53446
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppLabel65: TppLabel
          UserName = 'ppLabel65'
          Caption = 'ESTADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          mmHeight = 3175
          mmLeft = 172773
          mmTop = 52652
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppDBText38: TppDBText
          UserName = 'ppDBText38'
          DataField = 'LOGRADOURO'
          DataPipeline = ppCertificado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppCertificado'
          mmHeight = 3704
          mmLeft = 15610
          mmTop = 46038
          mmWidth = 94721
          BandType = 3
          GroupNo = 0
        end
        object ppDBText39: TppDBText
          UserName = 'ppDBText39'
          DataField = 'NUMERO'
          DataPipeline = ppCertificado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppCertificado'
          mmHeight = 3704
          mmLeft = 116681
          mmTop = 45773
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppDBText40: TppDBText
          UserName = 'ppDBText40'
          AutoSize = True
          DataField = 'COMPLEMENTO'
          DataPipeline = ppCertificado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppCertificado'
          mmHeight = 3175
          mmLeft = 142875
          mmTop = 45773
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object ppDBText41: TppDBText
          UserName = 'ppDBText41'
          DataField = 'BAIRRO'
          DataPipeline = ppCertificado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppCertificado'
          mmHeight = 3704
          mmLeft = 15875
          mmTop = 56886
          mmWidth = 62442
          BandType = 3
          GroupNo = 0
        end
        object ppDBText42: TppDBText
          UserName = 'ppDBText42'
          DataField = 'CIDADE'
          DataPipeline = ppCertificado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppCertificado'
          mmHeight = 3704
          mmLeft = 83344
          mmTop = 57415
          mmWidth = 82286
          BandType = 3
          GroupNo = 0
        end
        object ppDBText47: TppDBText
          UserName = 'ppDBText47'
          DataField = 'ESTADO_PARTICIPANTE'
          DataPipeline = ppCertificado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppCertificado'
          mmHeight = 3704
          mmLeft = 173832
          mmTop = 56886
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object ppShape22: TppShape
          UserName = 'ppShape22'
          Shape = stRoundRect
          mmHeight = 8731
          mmLeft = 170657
          mmTop = 42863
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object ppLabel66: TppLabel
          UserName = 'ppLabel66'
          Caption = 'CEP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          mmHeight = 3175
          mmLeft = 172509
          mmTop = 41275
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object ppDBText48: TppDBText
          UserName = 'ppDBText48'
          AutoSize = True
          DataField = 'CEP'
          DataPipeline = ppCertificado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppCertificado'
          mmHeight = 3175
          mmLeft = 178594
          mmTop = 44979
          mmWidth = 5821
          BandType = 3
          GroupNo = 0
        end
        object ppLabel67: TppLabel
          UserName = 'ppLabel67'
          Caption = 'PATROCINADORA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          mmHeight = 3175
          mmLeft = 15081
          mmTop = 64823
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object ppDBText50: TppDBText
          UserName = 'ppDBText50'
          DataField = 'NOME_PATROCINADORA'
          DataPipeline = ppCertificado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppCertificado'
          mmHeight = 3704
          mmLeft = 14552
          mmTop = 69056
          mmWidth = 82815
          BandType = 3
          GroupNo = 0
        end
        object ppLabel68: TppLabel
          UserName = 'ppLabel68'
          Caption = 'MATRÍCULA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          mmHeight = 3175
          mmLeft = 104775
          mmTop = 64823
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppDBText51: TppDBText
          UserName = 'ppDBText51'
          DataField = 'MATRICULA'
          DataPipeline = ppCertificado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppCertificado'
          mmHeight = 3704
          mmLeft = 104511
          mmTop = 69321
          mmWidth = 32808
          BandType = 3
          GroupNo = 0
        end
        object ppLabel69: TppLabel
          UserName = 'ppLabel69'
          Caption = 'TEMPO SERV. ANTERIOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          mmHeight = 3175
          mmLeft = 146579
          mmTop = 65088
          mmWidth = 29898
          BandType = 3
          GroupNo = 0
        end
        object ppDBText52: TppDBText
          UserName = 'ppDBText52'
          BlankWhenZero = True
          DataField = 'TEMPOSERVANTERIOR'
          DataPipeline = ppCertificado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppCertificado'
          mmHeight = 3704
          mmLeft = 147902
          mmTop = 69586
          mmWidth = 42863
          BandType = 3
          GroupNo = 0
        end
        object ppShape23: TppShape
          UserName = 'ppShape23'
          Shape = stRoundRect
          mmHeight = 6350
          mmLeft = 11906
          mmTop = 81492
          mmWidth = 182298
          BandType = 3
          GroupNo = 0
        end
        object rpCertificadoLabel14: TppLabel
          UserName = 'rpCertificadoLabel14'
          Caption = 'Contribuição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 16404
          mmTop = 82550
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object rpCertificadoLabel16: TppLabel
          UserName = 'rpCertificadoLabel16'
          Caption = 'CONTRIBUIÇÕES NA INSCRIÇÃO '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Bookman Old Style'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 65881
          mmTop = 82021
          mmWidth = 74348
          BandType = 3
          GroupNo = 0
        end
        object rpCertificadoLabel37: TppLabel
          UserName = 'rpCertificadoLabel37'
          Caption = 'Valor Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 169863
          mmTop = 82815
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
      end
      object NomeFooter: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 9260
        mmPrintPosition = 0
        object ppShape24: TppShape
          UserName = 'ppShape24'
          Brush.Color = clSilver
          Pen.Color = clSilver
          mmHeight = 2910
          mmLeft = 14552
          mmTop = 794
          mmWidth = 180711
          BandType = 5
          GroupNo = 0
        end
        object rpCertificadoSubReport1: TppSubReport
          UserName = 'rpCertificadoSubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppCertifDep'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 4233
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpCertificadoChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = ppCertifDep
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 296863
            PrinterSetup.mmPaperWidth = 210079
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppCertifDep'
            object rpCertificadoChildReport1TitleBand1: TppTitleBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 11906
              mmPrintPosition = 0
              object rpCertificadoChildReport1Shape1: TppShape
                UserName = 'rpCertificadoChildReport1Shape1'
                Shape = stRoundRect
                mmHeight = 6350
                mmLeft = 25929
                mmTop = 794
                mmWidth = 152400
                BandType = 1
              end
              object rpCertificadoChildReport1Label1: TppLabel
                UserName = 'rpCertificadoChildReport1Label1'
                Caption = 'BENEFICIÁRIOS / DESIGNADOS'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Bookman Old Style'
                Font.Size = 12
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 5027
                mmLeft = 65881
                mmTop = 1323
                mmWidth = 71967
                BandType = 1
              end
              object rpCertificadoChildReport1Label2: TppLabel
                UserName = 'rpCertificadoChildReport1Label2'
                Caption = 'Nome'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                mmHeight = 3704
                mmLeft = 15081
                mmTop = 8202
                mmWidth = 8467
                BandType = 1
              end
              object rpCertificadoChildReport1Label3: TppLabel
                UserName = 'rpCertificadoChildReport1Label3'
                Caption = 'Nascimento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                mmHeight = 3704
                mmLeft = 102394
                mmTop = 8202
                mmWidth = 17198
                BandType = 1
              end
              object rpCertificadoChildReport1Label4: TppLabel
                UserName = 'rpCertificadoChildReport1Label4'
                Caption = 'Sexo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                mmHeight = 3704
                mmLeft = 123031
                mmTop = 8202
                mmWidth = 7144
                BandType = 1
              end
              object rpCertificadoChildReport1Label5: TppLabel
                UserName = 'rpCertificadoChildReport1Label5'
                Caption = 'Designado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                mmHeight = 3704
                mmLeft = 134409
                mmTop = 8202
                mmWidth = 15346
                BandType = 1
              end
              object rpCertificadoChildReport1Label6: TppLabel
                UserName = 'rpCertificadoChildReport1Label6'
                Caption = 'Dependência com o Titular'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                mmHeight = 3704
                mmLeft = 154252
                mmTop = 8202
                mmWidth = 38629
                BandType = 1
              end
            end
            object rpCertificadoChildReport1DetailBand1: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object rpCertificadoChildReport1DBText1: TppDBText
                UserName = 'rpCertificadoChildReport1DBText1'
                DataField = 'NOMEDEP'
                DataPipeline = ppCertifDep
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppCertifDep'
                mmHeight = 3704
                mmLeft = 15081
                mmTop = 794
                mmWidth = 83609
                BandType = 4
              end
              object rpCertificadoChildReport1DBText2: TppDBText
                UserName = 'rpCertificadoChildReport1DBText2'
                DataField = 'DATANASC'
                DataPipeline = ppCertifDep
                DisplayFormat = 'dd/mm/yyyy'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppCertifDep'
                mmHeight = 3704
                mmLeft = 102129
                mmTop = 794
                mmWidth = 17198
                BandType = 4
              end
              object rpCertificadoChildReport1DBText3: TppDBText
                UserName = 'rpCertificadoChildReport1DBText3'
                DataField = 'SEXO'
                DataPipeline = ppCertifDep
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppCertifDep'
                mmHeight = 3704
                mmLeft = 123825
                mmTop = 794
                mmWidth = 5556
                BandType = 4
              end
              object rpCertificadoChildReport1DBText4: TppDBText
                UserName = 'rpCertificadoChildReport1DBText4'
                DataField = 'FLGDESIGNADO'
                DataPipeline = ppCertifDep
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppCertifDep'
                mmHeight = 3704
                mmLeft = 138377
                mmTop = 794
                mmWidth = 10583
                BandType = 4
              end
              object rpCertificadoChildReport1DBText5: TppDBText
                UserName = 'rpCertificadoChildReport1DBText5'
                DataField = 'TIPODEPEN'
                DataPipeline = ppCertifDep
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppCertifDep'
                mmHeight = 3704
                mmLeft = 155046
                mmTop = 794
                mmWidth = 38629
                BandType = 4
              end
            end
            object rpCertificadoChildReport1SummaryBand1: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
    end
    object rpCertificadoGroup2: TppGroup
      BreakName = 'NOMECONTRIB'
      DataPipeline = ppCertificado
      OutlineSettings.CreateNode = True
      UserName = 'rpCertificadoGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppCertificado'
      object rpCertificadoGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpCertificadoGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppCertificado: TppBDEPipeline
    DataSource = dsCertificado
    UserName = 'Certificado'
    Left = 103
    Top = 205
  end
  object qryCertificado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.NOME AS PARTICIPANTE,PAT.NOME AS NOME_PATROCINADORA,PF.' +
        'DATANASC AS DATA_DE_NASCIMENTO, PF.SEXO, PP.IDPESSOA AS IDTITULA' +
        'R, PP.IDPESSJUR, PP.IDPLANOPREV,'
      
        '       P.NUMDOCUMENTO AS CPF,EL.DATAADMISSAO, EL.MATRICULA as MA' +
        'TRICULA,  EL.TEMPOSERVANTERIOR,'
      
        '       PLP.NOME AS NOMEPLAN, PP.INSCRICAODATA, PP.REQUERIMENTODA' +
        'TA AS DATA_REQUERIMENTO, PP.SALPARTICIPACAO,'
      
        '       PP.INSCRICAONUMERO,PF.CODESTADO AS NATURALIDADE, EP.LOGRA' +
        'DOURO,  EP.NUMERO,  EP.COMPLEMENTO,'
      '       ES.CODESTADO AS ESTADO_PARTICIPANTE,'
      
        '       EP.BAIRRO, CD.NOME AS CIDADE , ES.CODESTADO, EP.CEP,  C.N' +
        'OME AS NOMECONTRIB,'
      
        '       CPP.VALORBASE1,  CPP.VALORBASE2,  CPP.VALORBASE3, PF.ESTC' +
        'IVIL AS ESTADO_CIVIL,'
      '       CP.NOMEVALORBASE1,CP.NOMEVALORBASE2,  CP.NOMEVALORBASE3,'
      
        '       PP.SALINSCRICAO AS VALORPROVENTO, CPP.DATAINICIO, CPP.DAT' +
        'AFINAL,'
      
        '       HST.VALORESPERADO , PAIS.NOMENACIONALIDADE AS NACIONALIDA' +
        'DE'
      'FROM   PESSOA P, PESSOA PAT, PESSOAFISICA PF, ENDPESS EP,'
      '       CIDADES CD,ESTADO ES, ELEGPATRO EL, PARTPREVPLAN PP,'
      '       PLANPREV PLP, CONTRIBPREVPARTP CPP, CONTRIBUICAO C,'
      '       CONTPREV CP  ,  SITPART SP, CONTPREVEVENTO CPE,'
      '       EVENTOGERADOR EG,   HSTCONTRIBPREV HST, PAIS'
      'WHERE  PP.IDPESSOA     =:piIdPessoa'
      'AND    PP.IDPLANOPREV  =:piIdPlanoPrev'
      'AND    PP.IDPESSJUR    =:piIdPessJur'
      'AND    PP.SEQPROPOSTA  =:piSeqProposta'
      'AND    EL.IDPESSJUR    = PP.IDPESSJUR'
      'AND    PF.IDPAIS       = PAIS.IDPAIS'
      'AND    EL.IDPESSOA     = PP.IDPESSOA'
      'AND    P.IDPESSOA      = EL.IDPESSOA'
      'AND    PAT.IDPESSOA    = EL.IDPESSJUR'
      'AND    PLP.IDPLANOPREV = PP.IDPLANOPREV                     '
      'AND    PF.IDPESSOA     = P.IDPESSOA                         '
      'AND    SP.IDSITPART    = PP.IDSITPART'
      'AND    P.IDENDRESIDENCIAL = EP.IDENDERECO(+)'
      'AND    P.IDPESSOA         = EP.IDPESSOA(+)'
      'AND    CD.IDESTADO        = ES.IDESTADO(+)'
      'AND    CD.IDCIDADES       = EP.IDCIDADES'
      'AND    CPP.IDPESSJUR      = PP.IDPESSJUR'
      'AND    CPP.IDPLANOPREV    = PP.IDPLANOPREV'
      'AND    CPP.IDPESSOA       = PP.IDPESSOA'
      'AND    CPP.SEQPROPOSTA    = PP.SEQPROPOSTA'
      'AND    CPP.IDPLANOPREV    = CPE.IDPLANOPREV'
      'AND    CPP.IDCONTRIBUICAO = CPE.IDCONTRIBUICAO'
      'AND    CPE.IDEVENTOGERADOR = EG.IDEVENTOGERADOR'
      'AND    EG.FLGINTERNO      = '#39'IP'#39
      'AND    CP.IDPLANOPREV     = CPP.IDPLANOPREV'
      'AND    CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO'
      'AND    C.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO'
      'AND    CPP.IDPESSJUR      = HST.IDPESSJUR(+)'
      'AND   CPP.IDPLANOPREV   = HST.IDPLANOPREV(+)'
      'AND   CPP.IDPESSOA      = HST.IDPESSOA(+)'
      'AND    CPP.SEQPROPOSTA   =  HST.SEQPROPOSTA(+)'
      'AND    CPP.IDCONTRIBUICAO  = HST.IDCONTRIBUICAO(+)'
      
        'AND   ( HST.MESREFERENCIA  = TO_CHAR(CPP.DATAINICIO,'#39'YYYY/MM'#39') O' +
        'R  HST.MESREFERENCIA  IS NULL )'
      '')
    ValidateWithMask = True
    Left = 24
    Top = 206
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piIdPessoa'
        ParamType = ptUnknown
        Value = 307283
      end
      item
        DataType = ftInteger
        Name = 'piIdPlanoPrev'
        ParamType = ptUnknown
        Value = 19
      end
      item
        DataType = ftInteger
        Name = 'piIdPessJur'
        ParamType = ptUnknown
        Value = '91008'
      end
      item
        DataType = ftInteger
        Name = 'piSeqProposta'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object dsCertificado: TwwDataSource
    AutoEdit = False
    DataSet = qryCertificado
    Left = 63
    Top = 205
  end
  object ppCertifDep: TppBDEPipeline
    DataSource = dsCertifDep
    SkipWhenNoRecords = False
    UserName = 'CertifDep'
    Left = 301
    Top = 196
    MasterDataPipelineName = 'ppCertificado'
  end
  object qryCertifDep: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsCertificado
    SQL.Strings = (
      'SELECT P.NOME AS NOMEDEP,'
      
        '       DECODE(DP.FLGDESIGNADO, 0 , '#39'NÃO'#39', 1 , '#39'SIM'#39', NULL, '#39'NÃO'#39 +
        ') AS FLGDESIGNADO,'
      '       PF.SEXO, PF.DATANASC, DEPEN.DESCRICAO AS TIPODEPEN'
      'FROM   DEPENTIT DP, PESSOAFISICA PF, PESSOA P, DEPEN'
      'WHERE  DP.IDTITULAR = :IDTITULAR'
      'AND    P.IDPESSOA   = DP.IDPESSOA'
      'AND    PF.IDPESSOA  = P.IDPESSOA'
      'AND    DP.IDDEPENDENCIA <> '#39'PRP'#39
      'AND    DP.IDDEPENDENCIA = DEPEN.IDDEPENDENCIA')
    ValidateWithMask = True
    Left = 219
    Top = 199
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object dsCertifDep: TwwDataSource
    DataSet = qryCertifDep
    Left = 258
    Top = 197
  end
  object updQryCert: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  INSCRICAONUMERO1 = :INSCRICAONUMERO1,'
      '  DIAINSC1 = :DIAINSC1,'
      '  MESINSC1 = :MESINSC1,'
      '  ANOINSC1 = :ANOINSC1,'
      '  NOME1 = :NOME1,'
      '  PLANO1 = :PLANO1,'
      '  INSCRICAONUMERO2 = :INSCRICAONUMERO2,'
      '  DIAINSC2 = :DIAINSC2,'
      '  MESINSC2 = :MESINSC2,'
      '  ANOINSC2 = :ANOINSC2,'
      '  NOME2 = :NOME2,'
      '  PLANO2 = :PLANO2,'
      '  INSCRICAONUMERO3 = :INSCRICAONUMERO3,'
      '  DIAINSC3 = :DIAINSC3,'
      '  MESINSC3 = :MESINSC3,'
      '  ANOINSC3 = :ANOINSC3,'
      '  NOME3 = :NOME3,'
      '  PLANO3 = :PLANO3,'
      '  INSCRICAONUMERO4 = :INSCRICAONUMERO4,'
      '  DIAINSC4 = :DIAINSC4,'
      '  MESINSC4 = :MESINSC4,'
      '  ANOINSC4 = :ANOINSC4,'
      '  NOME4 = :NOME4,'
      '  PLANO4 = :PLANO4'
      'where'
      '  INSCRICAONUMERO1 = :OLD_INSCRICAONUMERO1')
    InsertSQL.Strings = (
      'insert into PESSOA'
      
        '  (INSCRICAONUMERO1, DIAINSC1, MESINSC1, ANOINSC1, NOME1, PLANO1' +
        ', '
      'INSCRICAONUMERO2, '
      
        '   DIAINSC2, MESINSC2, ANOINSC2, NOME2, PLANO2, INSCRICAONUMERO3' +
        ', '
      'DIAINSC3, '
      
        '   MESINSC3, ANOINSC3, NOME3, PLANO3, INSCRICAONUMERO4, DIAINSC4' +
        ', '
      'MESINSC4, '
      '   ANOINSC4, NOME4, PLANO4)'
      'values'
      
        '  (:INSCRICAONUMERO1, :DIAINSC1, :MESINSC1, :ANOINSC1, :NOME1, :' +
        'PLANO1, '
      
        '   :INSCRICAONUMERO2, :DIAINSC2, :MESINSC2, :ANOINSC2, :NOME2, :' +
        'PLANO2, '
      
        '   :INSCRICAONUMERO3, :DIAINSC3, :MESINSC3, :ANOINSC3, :NOME3, :' +
        'PLANO3, '
      
        '   :INSCRICAONUMERO4, :DIAINSC4, :MESINSC4, :ANOINSC4, :NOME4, :' +
        'PLANO4)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  INSCRICAONUMERO1 = :OLD_INSCRICAONUMERO1')
    Left = 224
    Top = 229
  end
  object qryCertTemp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 1 FROM DUAL')
    ValidateWithMask = True
    Left = 264
    Top = 229
  end
  object qryParticipSituacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT 1 AS CONTADOR ,PLANO.NOME AS PLANO , PART.NOME AS PARTICI' +
        'PANTE,'
      '       PATRO.NOME AS PATROCINADORA,'
      '       E.MATRICULA, SPART.DESCRICAO AS DESCPART,'
      
        '       SFUNC.DESCRICAO AS DESCFUNC, SPLANO.DESCRICAO AS DESCPLAN' +
        'O,'
      '       P.INSCRICAODATA, P.DATACANCELAMENTO'
      ''
      'FROM    PESSOA PATRO, PESSOA PART, ELEGPATRO E, PARTPREVPLAN P,'
      '        SITPART SPART, SITFUNC SFUNC, SITPLANOPREV SPLANO,'
      '        EVENTOSPREV EPREV, PLANPREV PLANO'
      'WHERE     PATRO.IDPESSOA        =:IDPESSJUR'
      '      AND PLANO.IDPLANOPREV     =:IDPLANOPREV'
      '      AND PLANO.IDPLANOPREV     = P.IDPLANOPREV'
      '      AND PATRO.IDPESSOA        = P.IDPESSJUR'
      '      AND PART.IDPESSOA         = P.IDPESSOA'
      '      AND E.IDPESSJUR           = P.IDPESSJUR'
      '      AND E.IDPESSOA            = P.IDPESSOA'
      '      AND E.IDSITFUNC           = SFUNC.IDSITFUNC'
      '      AND P.IDSITPART           = SPART.IDSITPART'
      '      AND P.IDSITPLANOPREV      = SPLANO.IDSITPLANOPREV'
      '      AND P.IDPESSOA            = EPREV.IDPESSOA'
      '      AND P.IDPESSJUR           = EPREV.IDPESSJUR'
      '      AND P.IDPLANOPREV         = EPREV.IDPLANOPREV'
      '      AND P.SEQPROPOSTA         = EPREV.SEQPROPOSTA'
      ''
      'ORDER BY PATRO.NOME, PLANO.NOME, SFUNC.DESCRICAO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 30
    Top = 49
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = 4
      end>
  end
  object dsParticipSituacao: TwwDataSource
    DataSet = qryParticipSituacao
    Left = 68
    Top = 50
  end
  object pplParticipSituacao: TppBDEPipeline
    DataSource = dsParticipSituacao
    UserName = 'pplParticipSituacao'
    Left = 109
    Top = 50
    object pplParticipSituacaoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONTADOR'
      FieldName = 'CONTADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplParticipSituacaoppField2: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object pplParticipSituacaoppField3: TppField
      FieldAlias = 'PARTICIPANTE'
      FieldName = 'PARTICIPANTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplParticipSituacaoppField4: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplParticipSituacaoppField5: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 4
    end
    object pplParticipSituacaoppField6: TppField
      FieldAlias = 'DESCPART'
      FieldName = 'DESCPART'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object pplParticipSituacaoppField7: TppField
      FieldAlias = 'DESCFUNC'
      FieldName = 'DESCFUNC'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object pplParticipSituacaoppField8: TppField
      FieldAlias = 'DESCPLANO'
      FieldName = 'DESCPLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object pplParticipSituacaoppField9: TppField
      FieldAlias = 'INSCRICAODATA'
      FieldName = 'INSCRICAODATA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object pplParticipSituacaoppField10: TppField
      FieldAlias = 'DATACANCELAMENTO'
      FieldName = 'DATACANCELAMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 9
    end
  end
  object rpParticipSituacao: TppReport
    AutoStop = False
    DataPipeline = pplParticipSituacao
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
    DeviceType = 'Screen'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 150
    Top = 50
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplParticipSituacao'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel21: TppLabel
        UserName = 'Label11'
        Caption = 'Relatório de Participantes por Situação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 102129
        mmTop = 26194
        mmWidth = 79375
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 32015
        mmWidth = 284300
        BandType = 0
      end
      object ppDBImage2: TppDBImage
        UserName = 'rpBoletasDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText29: TppDBText
        UserName = 'rpBoletasDBText1'
        AutoSize = True
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
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'rpBoletasDBText2'
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
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'rpBoletasDBText31'
        AutoSize = True
        DataField = 'LOGRADOURO'
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
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 20373
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'rpBoletasDBText32'
        AutoSize = True
        DataField = 'NUMERO'
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
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText27: TppDBText
        UserName = 'rpBoletasDBText33'
        AutoSize = True
        DataField = 'CODESTADO'
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
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText34: TppDBText
        UserName = 'rpBoletasDBText34'
        AutoSize = True
        DataField = 'CIDADE'
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
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText43: TppDBText
        UserName = 'rpBoletasDBText35'
        AutoSize = True
        DataField = 'BAIRRO'
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
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'rpBoletasLabel24'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText44: TppDBText
        UserName = 'rpBoletasDBText36'
        AutoSize = True
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
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'LabelMesRef'
        Caption = 'Mês de Referência: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 220928
        mmTop = 27252
        mmWidth = 33338
        BandType = 0
      end
      object ppLabelparticipSituacao: TppLabel
        UserName = 'LabelMesRef1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 255059
        mmTop = 27252
        mmWidth = 23283
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object ppDBText45: TppDBText
        UserName = 'DBText5'
        DataField = 'PARTICIPANTE'
        DataPipeline = pplParticipSituacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParticipSituacao'
        mmHeight = 3175
        mmLeft = 55033
        mmTop = 0
        mmWidth = 82286
        BandType = 4
      end
      object ppDBText49: TppDBText
        UserName = 'DBText38'
        DataField = 'DESCFUNC'
        DataPipeline = pplParticipSituacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplParticipSituacao'
        mmHeight = 3175
        mmLeft = 137848
        mmTop = 0
        mmWidth = 51065
        BandType = 4
      end
      object ppDBText53: TppDBText
        UserName = 'DBText40'
        DataField = 'DESCPLANO'
        DataPipeline = pplParticipSituacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParticipSituacao'
        mmHeight = 3175
        mmLeft = 190236
        mmTop = 0
        mmWidth = 47361
        BandType = 4
      end
      object ppDBText46: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'MATRICULA'
        DataPipeline = pplParticipSituacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParticipSituacao'
        mmHeight = 3175
        mmLeft = 36513
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText401'
        DataField = 'INSCRICAODATA'
        DataPipeline = pplParticipSituacao
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParticipSituacao'
        mmHeight = 3175
        mmLeft = 239713
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText100: TppDBText
        UserName = 'DBText100'
        DataField = 'DATACANCELAMENTO'
        DataPipeline = pplParticipSituacao
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParticipSituacao'
        mmHeight = 3175
        mmLeft = 260086
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLine8: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 1058
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel43: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administração Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 280723
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 138642
        mmTop = 3175
        mmWidth = 18256
        BandType = 8
      end
      object ppSystemVariable6: TppSystemVariable
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
        mmLeft = 254530
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      NewPage = True
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppLabel10: TppLabel
        UserName = 'Label54'
        Caption = 'Total Geral :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 0
        mmWidth = 20902
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'MATRICULA'
        DataPipeline = pplParticipSituacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pplParticipSituacao'
        mmHeight = 3969
        mmLeft = 44979
        mmTop = 0
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel89: TppLabel
        UserName = 'Label89'
        Caption = 'participantes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 63500
        mmTop = 0
        mmWidth = 20108
        BandType = 7
      end
    end
    object ppGroup9: TppGroup
      BreakName = 'PLANO'
      DataPipeline = pplParticipSituacao
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplParticipSituacao'
      object ppGroupHeaderBand9: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppLabel11: TppLabel
          UserName = 'Label2'
          Caption = 'Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 794
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
        end
        object ppDBText55: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'PLANO'
          DataPipeline = pplParticipSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplParticipSituacao'
          mmHeight = 3969
          mmLeft = 36513
          mmTop = 794
          mmWidth = 11113
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppLabel12: TppLabel
          UserName = 'Label102'
          Caption = 'Total por Plano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 0
          mmWidth = 24606
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'MATRICULA'
          DataPipeline = pplParticipSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplParticipSituacao'
          mmHeight = 3969
          mmLeft = 44979
          mmTop = 264
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = pplParticipSituacao
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplParticipSituacao'
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppLabel44: TppLabel
          UserName = 'Label1'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 529
          mmWidth = 21696
          BandType = 3
          GroupNo = 0
        end
        object ppDBText54: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'PATROCINADORA'
          DataPipeline = pplParticipSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplParticipSituacao'
          mmHeight = 3969
          mmLeft = 36513
          mmTop = 529
          mmWidth = 28310
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppLabel46: TppLabel
          UserName = 'Label16'
          Caption = 'Total por Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 0
          mmWidth = 41540
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'MATRICULA'
          DataPipeline = pplParticipSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplParticipSituacao'
          mmHeight = 3969
          mmLeft = 44979
          mmTop = 264
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'DESCPART'
      DataPipeline = pplParticipSituacao
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplParticipSituacao'
      object ppGroupHeaderBand8: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9525
        mmPrintPosition = 0
        object ppLabel13: TppLabel
          UserName = 'Label48'
          Caption = 'Matrícula'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 36513
          mmTop = 5027
          mmWidth = 17463
          BandType = 3
          GroupNo = 1
        end
        object ppLabel14: TppLabel
          UserName = 'Label50'
          Caption = 'Nome'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 55033
          mmTop = 5027
          mmWidth = 7673
          BandType = 3
          GroupNo = 1
        end
        object ppLabel15: TppLabel
          UserName = 'Label51'
          AutoSize = False
          Caption = 'Situação na Patrocinadora'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 8202
          mmLeft = 137848
          mmTop = 265
          mmWidth = 25400
          BandType = 3
          GroupNo = 1
        end
        object ppLabel16: TppLabel
          UserName = 'Label53'
          AutoSize = False
          Caption = 'Situação no Plano Previdenciário'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 8202
          mmLeft = 190236
          mmTop = 529
          mmWidth = 33073
          BandType = 3
          GroupNo = 1
        end
        object ppLabel17: TppLabel
          UserName = 'Label52'
          Caption = 'Situação na Fundação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 265
          mmWidth = 34131
          BandType = 3
          GroupNo = 2
        end
        object ppDBText56: TppDBText
          UserName = 'DBText39'
          AutoSize = True
          DataField = 'DESCPART'
          DataPipeline = pplParticipSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplParticipSituacao'
          mmHeight = 3969
          mmLeft = 36513
          mmTop = 265
          mmWidth = 17463
          BandType = 3
          GroupNo = 2
        end
        object ppLine10: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 529
          mmTop = 9260
          mmWidth = 284163
          BandType = 3
          GroupNo = 2
        end
        object ppLabel90: TppLabel
          UserName = 'Label501'
          AutoSize = False
          Caption = 'Data de Inscrição'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 8202
          mmLeft = 239713
          mmTop = 265
          mmWidth = 17463
          BandType = 3
          GroupNo = 2
        end
        object ppLabel91: TppLabel
          UserName = 'Label91'
          AutoSize = False
          Caption = 'Data de Cancelamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 8202
          mmLeft = 260086
          mmTop = 265
          mmWidth = 23283
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel18: TppLabel
          UserName = 'Label55'
          Caption = 'Total por Situação :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 1058
          mmWidth = 30163
          BandType = 5
          GroupNo = 2
        end
        object ppLine11: TppLine
          UserName = 'Line11'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 284163
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'MATRICULA'
          DataPipeline = pplParticipSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplParticipSituacao'
          mmHeight = 3969
          mmLeft = 44979
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object dsResumoSituacao: TwwDataSource
    DataSet = qryResumoSituacao
    Left = 264
    Top = 48
  end
  object qryResumoSituacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      SFUNC.DESCRICAO AS DESCFUNC,'
      #9'COUNT(*) QUANTIDADE'
      ''
      'FROM    PESSOA PATRO, PESSOA PART, ELEGPATRO E, PARTPREVPLAN P,'
      '        SITPART SPART, SITFUNC SFUNC, SITPLANOPREV SPLANO,'
      '        EVENTOSPREV EPREV, PLANPREV PLANO'
      ''
      'WHERE     PATRO.IDPESSOA        =:IDPESSJUR'
      '      AND PLANO.IDPLANOPREV     =:IDPLANOPREV'
      #9'   AND PLANO.IDPLANOPREV     = P.IDPLANOPREV'
      '      AND PATRO.IDPESSOA        = P.IDPESSJUR'
      '      AND PART.IDPESSOA         = P.IDPESSOA'
      '      AND E.IDPESSJUR           = P.IDPESSJUR'
      '      AND E.IDPESSOA            = P.IDPESSOA'
      '      AND E.IDSITFUNC           = SFUNC.IDSITFUNC'
      '      AND P.IDSITPART           = SPART.IDSITPART'
      '      AND P.IDSITPLANOPREV      = SPLANO.IDSITPLANOPREV'
      '      AND P.IDPESSOA            = EPREV.IDPESSOA'
      '      AND P.IDPESSJUR           = EPREV.IDPESSJUR'
      '      AND P.IDPLANOPREV         = EPREV.IDPLANOPREV'
      '      AND P.SEQPROPOSTA         = EPREV.SEQPROPOSTA'
      'GROUP BY SFUNC.DESCRICAO')
    ValidateWithMask = True
    Left = 312
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = '4'
      end>
  end
  object ppResumoSituacao: TppBDEPipeline
    DataSource = dsResumoSituacao
    UserName = 'ResumoSituacao'
    Left = 216
    Top = 48
    object ppResumoSituacaoppField1: TppField
      FieldAlias = 'DESCFUNC'
      FieldName = 'DESCFUNC'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppResumoSituacaoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTIDADE'
      FieldName = 'QUANTIDADE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
  end
  object ppEvGerXParticip: TppBDEPipeline
    DataSource = dsEvGerXParticip
    UserName = 'EvGerXParticip'
    Left = 108
    Top = 412
    object ppEvGerXParticipppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppEvGerXParticipppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSCRICAONUMERO'
      FieldName = 'INSCRICAONUMERO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppEvGerXParticipppField3: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppEvGerXParticipppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDEVENTOSPREV'
      FieldName = 'IDEVENTOSPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppEvGerXParticipppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDEVENTOGERADOR'
      FieldName = 'IDEVENTOGERADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppEvGerXParticipppField6: TppField
      FieldAlias = 'NOME_EVENTO'
      FieldName = 'NOME_EVENTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object ppEvGerXParticipppField7: TppField
      FieldAlias = 'DATAREGISTRO'
      FieldName = 'DATAREGISTRO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object ppEvGerXParticipppField8: TppField
      FieldAlias = 'DATAEVENTO'
      FieldName = 'DATAEVENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object ppEvGerXParticipppField9: TppField
      FieldAlias = 'DATAALTERADO'
      FieldName = 'DATAALTERADO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object ppEvGerXParticipppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBENEFICIO'
      FieldName = 'IDBENEFICIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppEvGerXParticipppField11: TppField
      FieldAlias = 'NOME_BENEF'
      FieldName = 'NOME_BENEF'
      FieldLength = 60
      DisplayWidth = 60
      Position = 10
    end
    object ppEvGerXParticipppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALPARTICIPACAO'
      FieldName = 'SALPARTICIPACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppEvGerXParticipppField13: TppField
      FieldAlias = 'NOMEUSUARIO'
      FieldName = 'NOMEUSUARIO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 12
    end
    object ppEvGerXParticipppField14: TppField
      FieldAlias = 'NOME_PESSOA'
      FieldName = 'NOME_PESSOA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 13
    end
  end
  object dsEvGerXParticip: TwwDataSource
    DataSet = qryEvGerXParticip
    Left = 69
    Top = 412
  end
  object qryEvGerXParticip: TwwQuery
    BeforeOpen = qryEvGerXParticipBeforeOpen
    AfterOpen = qryEvGerXParticipAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT T1.IDPESSOA,t2.INSCRICAONUMERO,'
      'T7.NOME PLANO,'
      'T1.IDEVENTOSPREV,'
      'T1.IDEVENTOGERADOR,T4.NOME AS NOME_EVENTO,'
      'T1.DATAREGISTRO,T1.DATAEVENTO,T1.DATAALTERADO,'
      'T1.IDBENEFICIO,T3.NOME AS NOME_BENEF,'
      'T1.SALPARTICIPACAO,T5.NOMEUSUARIO,T6.NOME AS NOME_PESSOA'
      ''
      'FROM EVENTOSPREV T1,'
      ' PARTPREVPLAN T2,'
      ' BENEFICIO T3,'
      ' EVENTOGERADOR T4,'
      ' USUARIOSISTEMA T5,'
      ' PESSOA T6,'
      ' PLANPREV T7'
      ''
      'WHERE T1.IDPESSOA = T2.IDPESSOA '
      'AND '#9'T1.IDPESSJUR = T2.IDPESSJUR '
      'AND '#9'T1.IDPLANOPREV = T2.IDPLANOPREV'
      'AND '#9'T1.IDPESSOA = 4139'
      'AND    '#9'T1.IDBENEFICIO = T3.IDBENEFICIO(+) '
      'AND    '#9'T1.IDEVENTOGERADOR = T4.IDEVENTOGERADOR'
      'AND '#9'SUBSTR(T1.TRGUSERINCLUSAO,3,5) = T5.IDUSUARIO(+)'
      'AND'#9' T1.IDPESSOA = T6.IDPESSOA'
      'AND '#9'T7.IDPLANOPREV = T2.IDPLANOPREV'
      'ORDER BY T1.DATAREGISTRO,T1.DATAEVENTO'
      '')
    ValidateWithMask = True
    Left = 30
    Top = 412
  end
  object rpEvGerXParticip: TppReport
    AutoStop = False
    DataPipeline = ppEvGerXParticip
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
    Template.FileName = 'C:\Documentos\CBS\Eventos Gerados data x participante.rtm'
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpEvGerXParticipBeforePrint
    DeviceType = 'Screen'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 150
    Top = 412
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppEvGerXParticip'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 42863
      mmPrintPosition = 0
      object ppLabel24: TppLabel
        UserName = 'Label11'
        Caption = 'Eventos Gerados no ADMPREV '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 112184
        mmTop = 31750
        mmWidth = 64558
        BandType = 0
      end
      object ppDBImage3: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText72: TppDBText
        UserName = 'DBText72'
        AutoSize = True
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
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 45508
        BandType = 0
      end
      object ppDBText73: TppDBText
        UserName = 'DBText73'
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
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 32544
        BandType = 0
      end
      object ppDBText74: TppDBText
        UserName = 'DBText74'
        AutoSize = True
        DataField = 'LOGRADOURO'
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
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 9790
        BandType = 0
      end
      object ppDBText75: TppDBText
        UserName = 'DBText75'
        AutoSize = True
        DataField = 'NUMERO'
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
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 3175
        BandType = 0
      end
      object ppDBText77: TppDBText
        UserName = 'DBText77'
        AutoSize = True
        DataField = 'CODESTADO'
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
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 3440
        BandType = 0
      end
      object ppDBText78: TppDBText
        UserName = 'DBText78'
        AutoSize = True
        DataField = 'CIDADE'
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
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 24077
        BandType = 0
      end
      object ppDBText79: TppDBText
        UserName = 'DBText79'
        AutoSize = True
        DataField = 'BAIRRO'
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
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 27781
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText80: TppDBText
        UserName = 'DBText80'
        AutoSize = True
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
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'Label74'
        Caption = 'Referência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 38629
        mmWidth = 19315
        BandType = 0
      end
      object lblDataIni: TppLabel
        UserName = 'lblDataIni'
        Caption = '00/00/000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 22754
        mmTop = 38629
        mmWidth = 15610
        BandType = 0
      end
      object lblDataFim: TppLabel
        UserName = 'lblDataIni1'
        Caption = '00/00/000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 48683
        mmTop = 38629
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'lblDataIni2'
        Caption = 'até'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 41275
        mmTop = 38629
        mmWidth = 5027
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText60: TppDBText
        UserName = 'DBText3'
        DataField = 'PLANO'
        DataPipeline = ppEvGerXParticip
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppEvGerXParticip'
        mmHeight = 3175
        mmLeft = 0
        mmTop = 265
        mmWidth = 35983
        BandType = 4
      end
      object ppDBText64: TppDBText
        UserName = 'DBText7'
        DataField = 'DATAEVENTO'
        DataPipeline = ppEvGerXParticip
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEvGerXParticip'
        mmHeight = 3175
        mmLeft = 127529
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText66: TppDBText
        UserName = 'DBText9'
        DataField = 'NOME_BENEF'
        DataPipeline = ppEvGerXParticip
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppEvGerXParticip'
        mmHeight = 3440
        mmLeft = 153459
        mmTop = 264
        mmWidth = 56092
        BandType = 4
      end
      object ppDBText67: TppDBText
        UserName = 'DBText10'
        DataField = 'DATAALTERADO'
        DataPipeline = ppEvGerXParticip
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppEvGerXParticip'
        mmHeight = 3440
        mmLeft = 215371
        mmTop = 264
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText68: TppDBText
        UserName = 'DBText11'
        DataField = 'NOMEUSUARIO'
        DataPipeline = ppEvGerXParticip
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppEvGerXParticip'
        mmHeight = 3440
        mmLeft = 238655
        mmTop = 264
        mmWidth = 42333
        BandType = 4
      end
      object ppDBText69: TppDBText
        UserName = 'DBText12'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = ppEvGerXParticip
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppEvGerXParticip'
        mmHeight = 3175
        mmLeft = 41275
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText70: TppDBText
        UserName = 'DBText13'
        DataField = 'NOME_PESSOA'
        DataPipeline = ppEvGerXParticip
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppEvGerXParticip'
        mmHeight = 3175
        mmLeft = 63500
        mmTop = 265
        mmWidth = 58738
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine15: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel33: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Eventos Gerados do ADMPREV'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 23283
        mmTop = 3175
        mmWidth = 239978
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 255588
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DATAREGISTRO'
      DataPipeline = ppEvGerXParticip
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEvGerXParticip'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object ppDBText71: TppDBText
          UserName = 'DBText1'
          DataField = 'DATAREGISTRO'
          DataPipeline = ppEvGerXParticip
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppEvGerXParticip'
          mmHeight = 4233
          mmLeft = 26988
          mmTop = 3440
          mmWidth = 28840
          BandType = 3
          GroupNo = 0
        end
        object ppLabel26: TppLabel
          UserName = 'Label1'
          Caption = 'Data Registro:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1588
          mmTop = 3440
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppLine14: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 8202
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 265
        mmPrintPosition = 0
        object ppLine16: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'IDEVENTOSPREV'
      DataPipeline = ppEvGerXParticip
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEvGerXParticip'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9525
        mmPrintPosition = 0
        object ppLabel27: TppLabel
          UserName = 'Label27'
          Caption = 'Evento:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 794
          mmWidth = 10319
          BandType = 3
          GroupNo = 1
        end
        object ppDBText61: TppDBText
          UserName = 'DBText4'
          DataField = 'NOME_EVENTO'
          DataPipeline = ppEvGerXParticip
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppEvGerXParticip'
          mmHeight = 3175
          mmLeft = 11113
          mmTop = 794
          mmWidth = 69056
          BandType = 3
          GroupNo = 1
        end
        object ppLabel25: TppLabel
          UserName = 'Label8'
          Caption = 'Plano'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 6350
          mmWidth = 7408
          BandType = 3
          GroupNo = 1
        end
        object ppLabel35: TppLabel
          UserName = 'Label35'
          Caption = 'Nº Inscrição'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 41275
          mmTop = 6350
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object ppLabel36: TppLabel
          UserName = 'Label36'
          Caption = 'Participante'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 63500
          mmTop = 6350
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object ppLabel29: TppLabel
          UserName = 'Label4'
          Caption = 'Dt.Evento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127529
          mmTop = 6350
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object ppLabel30: TppLabel
          UserName = 'Label5'
          Caption = 'Beneficio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 153459
          mmTop = 6350
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
        end
        object ppLabel31: TppLabel
          UserName = 'Label6'
          Caption = 'Dt.Alteração'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 215371
          mmTop = 6350
          mmWidth = 16140
          BandType = 3
          GroupNo = 1
        end
        object ppLabel32: TppLabel
          UserName = 'Label7'
          Caption = 'Usuário'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 238655
          mmTop = 6350
          mmWidth = 10319
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppQuadroSalarios: TppBDEPipeline
    DataSource = dsQuadroSalarios
    UserName = 'EvGerXParticip1'
    Left = 108
    Top = 468
  end
  object dsQuadroSalarios: TwwDataSource
    DataSet = qryQuadroSalarios
    Left = 69
    Top = 468
  end
  object qryQuadroSalarios: TwwQuery
    BeforeOpen = qryQuadroSalariosBeforeOpen
    AfterOpen = qryQuadroSalariosAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  T4.NOME,'
      '        T3.MES, '
      '        T3.MESCOBRANCA,'
      '        T3.VALORPROVENTO AS SALARIO,'
      '        T3.IDRUBRICA,T2.DESCRICAO,'
      '        T5.INSCRICAONUMERO,'
      '        T6.MATRICULA'
      'FROM PATRO T1,'
      '     PROVDESC T2 , '
      '     HISTRUBSAL T3,'
      '     PESSOA T4,'
      '     PARTPREVPLAN T5,'
      '     ELEGPATRO T6'
      'WHERE (  T1.IDRUBSALPARTICIP  = T2.IDPROVENTO '
      '   OR    T1.IDRUBREMTOTAL     = T2.IDPROVENTO '
      '   OR    T1.IDRUBSALMANUT     = T2.IDPROVENTO '
      '   OR    T1.IDRUBSALAUXDOENCA = T2.IDPROVENTO  )'
      'AND   T2.IDPROVENTO       = T3.IDRUBRICA'
      'AND   T3.IDPESSOA         = T4.IDPESSOA '
      'AND   T4.IDPESSOA         = 74742'
      'AND   T3.IDPESSOA         = T5.IDPESSOA'
      'AND   T3.IDPESSOA         = T6.IDPESSOA'
      'AND   T3.IDPATRO          = T6.IDPESSJUR'
      'AND   T5.FLGDESATIVADO    = '#39'0'#39
      'AND   T6.IDPESSJUR        = T1.IDPESSOA'
      ''
      'ORDER BY MES DESC'
      '')
    ValidateWithMask = True
    Left = 30
    Top = 468
  end
  object rpQuadroSalarios: TppReport
    AutoStop = False
    DataPipeline = ppQuadroSalarios
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
    Template.FileName = 'C:\Documentos\CBS\Quadro de Salários.rtm'
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpQuadroSalariosBeforePrint
    DeviceType = 'Screen'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 158
    Top = 468
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppQuadroSalarios'
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 48683
      mmPrintPosition = 0
      object ppLabel28: TppLabel
        UserName = 'Label11'
        Caption = 'Quadro de Salários'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 79904
        mmTop = 31221
        mmWidth = 38894
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 48154
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label4'
        Caption = 'Mês Ref.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 18521
        mmTop = 42863
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label5'
        Caption = 'Mês Cobrança'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 47096
        mmTop = 42598
        mmWidth = 29104
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label6'
        Caption = 'Rubrica'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 102394
        mmTop = 42333
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'Label7'
        Caption = 'Valor do Salário'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 165100
        mmTop = 42069
        mmWidth = 32279
        BandType = 0
      end
      object ppDBImage5: TppDBImage
        UserName = 'DBImage5'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText85: TppDBText
        UserName = 'DBText85'
        AutoSize = True
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
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 45508
        BandType = 0
      end
      object ppDBText86: TppDBText
        UserName = 'DBText86'
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
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 32544
        BandType = 0
      end
      object ppDBText87: TppDBText
        UserName = 'DBText87'
        AutoSize = True
        DataField = 'LOGRADOURO'
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
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 9790
        BandType = 0
      end
      object ppDBText88: TppDBText
        UserName = 'DBText88'
        AutoSize = True
        DataField = 'NUMERO'
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
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 3175
        BandType = 0
      end
      object ppDBText89: TppDBText
        UserName = 'DBText89'
        AutoSize = True
        DataField = 'CODESTADO'
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
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 3440
        BandType = 0
      end
      object ppDBText90: TppDBText
        UserName = 'DBText90'
        AutoSize = True
        DataField = 'CIDADE'
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
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 24077
        BandType = 0
      end
      object ppDBText91: TppDBText
        UserName = 'DBText91'
        AutoSize = True
        DataField = 'BAIRRO'
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
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 27781
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'Label72'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText92: TppDBText
        UserName = 'DBText801'
        AutoSize = True
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
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 12171
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText59: TppDBText
        UserName = 'DBText4'
        DataField = 'MES'
        DataPipeline = ppQuadroSalarios
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppQuadroSalarios'
        mmHeight = 3969
        mmLeft = 18521
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'DBText5'
        DataField = 'MESCOBRANCA'
        DataPipeline = ppQuadroSalarios
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppQuadroSalarios'
        mmHeight = 3969
        mmLeft = 51065
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'DBText6'
        DataField = 'IDRUBRICA'
        DataPipeline = ppQuadroSalarios
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppQuadroSalarios'
        mmHeight = 3969
        mmLeft = 98425
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object ppDBText65: TppDBText
        UserName = 'DBText7'
        DataField = 'DESCRICAO'
        DataPipeline = ppQuadroSalarios
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppQuadroSalarios'
        mmHeight = 3969
        mmLeft = 106363
        mmTop = 0
        mmWidth = 52917
        BandType = 4
      end
      object ppDBText81: TppDBText
        UserName = 'DBText8'
        DataField = 'SALARIO'
        DataPipeline = ppQuadroSalarios
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppQuadroSalarios'
        mmHeight = 3969
        mmLeft = 174361
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine18: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel62: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Quadro de Salários'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 2646
        mmWidth = 197380
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = ANSI_CHARSET
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
    object ppGroup5: TppGroup
      BreakName = 'INSCRICAONUMERO'
      DataPipeline = ppQuadroSalarios
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppQuadroSalarios'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppDBText82: TppDBText
          UserName = 'DBText1'
          DataField = 'INSCRICAONUMERO'
          DataPipeline = ppQuadroSalarios
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppQuadroSalarios'
          mmHeight = 4233
          mmLeft = 24077
          mmTop = 265
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText83: TppDBText
          UserName = 'DBText2'
          DataField = 'MATRICULA'
          DataPipeline = ppQuadroSalarios
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppQuadroSalarios'
          mmHeight = 4233
          mmLeft = 66940
          mmTop = 265
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText84: TppDBText
          UserName = 'DBText3'
          DataField = 'NOME'
          DataPipeline = ppQuadroSalarios
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppQuadroSalarios'
          mmHeight = 4233
          mmLeft = 115359
          mmTop = 0
          mmWidth = 79640
          BandType = 3
          GroupNo = 0
        end
        object ppLabel63: TppLabel
          UserName = 'Label1'
          Caption = 'Inscrição Nº'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 0
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel70: TppLabel
          UserName = 'Label2'
          Caption = 'Matr.Epsa'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 48948
          mmTop = 0
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object ppLabel71: TppLabel
          UserName = 'Label3'
          Caption = 'Nome '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 104246
          mmTop = 0
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppLine19: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5027
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppTotEventos: TppBDEPipeline
    DataSource = dsTotEventos
    UserName = 'TotEventos'
    Left = 316
    Top = 420
    object ppTotEventosppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'COUNT(*)'
      FieldName = 'COUNT(*)'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppTotEventosppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONTADOR'
      FieldName = 'CONTADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppTotEventosppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppTotEventosppField4: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppTotEventosppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppTotEventosppField6: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object ppTotEventosppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDEVENTOGERADOR'
      FieldName = 'IDEVENTOGERADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppTotEventosppField8: TppField
      FieldAlias = 'NOME_EVENTO'
      FieldName = 'NOME_EVENTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object ppTotEventosppField9: TppField
      FieldAlias = 'REFER_YYYYMM'
      FieldName = 'REFER_YYYYMM'
      FieldLength = 6
      DisplayWidth = 6
      Position = 8
    end
    object ppTotEventosppField10: TppField
      FieldAlias = 'CONTROLE'
      FieldName = 'CONTROLE'
      FieldLength = 7
      DisplayWidth = 7
      Position = 9
    end
  end
  object dsTotEventos: TwwDataSource
    DataSet = qryTotEventos
    Left = 277
    Top = 420
  end
  object qryTotEventos: TwwQuery
    BeforeOpen = qryTotEventosBeforeOpen
    AfterOpen = qryTotEventosAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT COUNT(*), 1 AS CONTADOR, T1.IDPLANOPREV, T3.NOME, T1.IDPE' +
        'SSJUR, T4.RAZAOSOCIAL,'
      '   T1.IDEVENTOGERADOR,  T2.NOME AS NOME_EVENTO,'
      '   TO_CHAR(T1.DATAREGISTRO,'#39'YYYYMM'#39') AS REFER_YYYYMM,'
      '   TO_CHAR(T1.DATAREGISTRO,'#39'MM/YYYY'#39') AS CONTROLE'
      'FROM EVENTOSPREV T1, EVENTOGERADOR T2,'
      '   PLANPREV T3, PESSOA T4'
      'WHERE   T1.IDEVENTOGERADOR = T2.IDEVENTOGERADOR'
      'AND     T1.IDPLANOPREV     = T3.IDPLANOPREV'
      'AND     T1.IDPESSJUR       = T4.IDPESSOA'
      'AND ROWNUM < 31'
      
        'GROUP BY  TO_CHAR(T1.DATAREGISTRO,'#39'YYYYMM'#39'), TO_CHAR(T1.DATAREGI' +
        'STRO,'#39'MM/YYYY'#39'),'
      '   T1.IDPLANOPREV, T3.NOME, T1.IDPESSJUR, T4.RAZAOSOCIAL,'
      '   T1.IDEVENTOGERADOR, T2.NOME'
      'ORDER BY TO_CHAR(T1.DATAREGISTRO,'#39'YYYYMM'#39')'
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 238
    Top = 420
  end
  object rpTotEventos: TppReport
    AutoStop = False
    DataPipeline = ppTotEventos
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
    Template.FileName = 'C:\Documentos\CBS\Totalizador de Eventos Data Tipo Evento.rtm'
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 354
    Top = 423
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppTotEventos'
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 47361
      mmPrintPosition = 0
      object ppLabel37: TppLabel
        UserName = 'Label11'
        Caption = 'Totalizador de Eventos do ADMPREV'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 48683
        mmTop = 33867
        mmWidth = 75142
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 47096
        mmWidth = 197300
        BandType = 0
      end
      object ppDBText93: TppDBText
        UserName = 'DBText7'
        DataField = 'CONTROLE'
        DataPipeline = ppTotEventos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppTotEventos'
        mmHeight = 5027
        mmLeft = 124354
        mmTop = 33867
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'Label3'
        Caption = 'Quant.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 181769
        mmTop = 42069
        mmWidth = 11377
        BandType = 0
      end
      object ppDBImage6: TppDBImage
        UserName = 'DBImage6'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText102: TppDBText
        UserName = 'DBText102'
        AutoSize = True
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
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 45508
        BandType = 0
      end
      object ppDBText103: TppDBText
        UserName = 'DBText103'
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
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 32544
        BandType = 0
      end
      object ppDBText105: TppDBText
        UserName = 'DBText105'
        AutoSize = True
        DataField = 'LOGRADOURO'
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
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 9790
        BandType = 0
      end
      object ppDBText106: TppDBText
        UserName = 'DBText106'
        AutoSize = True
        DataField = 'NUMERO'
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
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 3175
        BandType = 0
      end
      object ppDBText107: TppDBText
        UserName = 'DBText107'
        AutoSize = True
        DataField = 'CODESTADO'
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
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 3440
        BandType = 0
      end
      object ppDBText108: TppDBText
        UserName = 'DBText901'
        AutoSize = True
        DataField = 'CIDADE'
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
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 24077
        BandType = 0
      end
      object ppDBText109: TppDBText
        UserName = 'DBText109'
        AutoSize = True
        DataField = 'BAIRRO'
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
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 27781
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'Label73'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText110: TppDBText
        UserName = 'DBText110'
        AutoSize = True
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
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'Label80'
        Caption = 'Referência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 41804
        mmWidth = 19315
        BandType = 0
      end
      object lblDataIni2: TppLabel
        UserName = 'lblDataIni3'
        Caption = '00/00/000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 21696
        mmTop = 41804
        mmWidth = 15610
        BandType = 0
      end
      object lblDataFim2: TppLabel
        UserName = 'lblDataFim2'
        Caption = '00/00/000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 48154
        mmTop = 41804
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'Label84'
        Caption = 'até'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 40746
        mmTop = 41804
        mmWidth = 5027
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText96: TppDBText
        UserName = 'DBText5'
        DataField = 'NOME_EVENTO'
        DataPipeline = ppTotEventos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppTotEventos'
        mmHeight = 3969
        mmLeft = 19579
        mmTop = 0
        mmWidth = 92340
        BandType = 4
      end
      object ppDBText97: TppDBText
        UserName = 'DBText6'
        DataField = 'COUNT(*)'
        DataPipeline = ppTotEventos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppTotEventos'
        mmHeight = 3969
        mmLeft = 169334
        mmTop = 0
        mmWidth = 23548
        BandType = 4
      end
      object ppLine29: TppLine
        UserName = 'Line29'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 3175
        BandType = 4
      end
      object ppLine30: TppLine
        UserName = 'Line30'
        Position = lpRight
        Weight = 0.75
        mmHeight = 4233
        mmLeft = 194205
        mmTop = 0
        mmWidth = 3175
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13758
      mmPrintPosition = 0
      object ppLine20: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel77: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Totalizador de Eventos do ADMPREV'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2910
        mmWidth = 197380
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
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand4: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel81: TppLabel
        UserName = 'Label81'
        Caption = 'Quant. Eventos Geral'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 6879
        mmTop = 1058
        mmWidth = 36248
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'COUNT(*)'
        DataPipeline = ppTotEventos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppTotEventos'
        mmHeight = 4233
        mmLeft = 175684
        mmTop = 1058
        mmWidth = 17198
        BandType = 7
      end
      object ppLine36: TppLine
        UserName = 'Line36'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 6350
        mmWidth = 197300
        BandType = 7
      end
      object ppLine37: TppLine
        UserName = 'Line37'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 0
        mmTop = 0
        mmWidth = 3175
        BandType = 7
      end
      object ppLine38: TppLine
        UserName = 'Line38'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 194205
        mmTop = 0
        mmWidth = 3175
        BandType = 7
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'REFER_YYYYMM'
      DataPipeline = ppTotEventos
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppTotEventos'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLabel78: TppLabel
          UserName = 'Label5'
          Caption = 'Eventos Referência :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 6350
          mmTop = 1323
          mmWidth = 34925
          BandType = 3
          GroupNo = 0
        end
        object ppDBText99: TppDBText
          UserName = 'DBText8'
          DataField = 'CONTROLE'
          DataPipeline = ppTotEventos
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppTotEventos'
          mmHeight = 4233
          mmLeft = 41804
          mmTop = 1323
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object ppLine24: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6085
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLine21: TppLine
          UserName = 'Line21'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 7408
          mmLeft = 0
          mmTop = 0
          mmWidth = 3175
          BandType = 3
          GroupNo = 0
        end
        object ppLine33: TppLine
          UserName = 'Line33'
          Position = lpRight
          Weight = 0.75
          mmHeight = 7408
          mmLeft = 194205
          mmTop = 0
          mmWidth = 3175
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup10: TppGroup
      BreakName = 'IDPLANOPREV'
      DataPipeline = ppTotEventos
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppTotEventos'
      object ppGroupHeaderBand10: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppDBText101: TppDBText
          UserName = 'DBText2'
          DataField = 'NOME'
          DataPipeline = ppTotEventos
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppTotEventos'
          mmHeight = 3969
          mmLeft = 10054
          mmTop = 529
          mmWidth = 70908
          BandType = 3
          GroupNo = 0
        end
        object ppLine23: TppLine
          UserName = 'Line23'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 6350
          mmLeft = 0
          mmTop = 0
          mmWidth = 3175
          BandType = 3
          GroupNo = 1
        end
        object ppLine32: TppLine
          UserName = 'Line32'
          Position = lpRight
          Weight = 0.75
          mmHeight = 6350
          mmLeft = 194205
          mmTop = 0
          mmWidth = 3175
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppLabel79: TppLabel
          UserName = 'Label4'
          Caption = 'Quantidade'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 9790
          mmTop = 265
          mmWidth = 19579
          BandType = 5
          GroupNo = 1
        end
        object ppLine25: TppLine
          UserName = 'Line6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'COUNT(*)'
          DataPipeline = ppTotEventos
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          ResetGroup = ppGroup10
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppTotEventos'
          mmHeight = 4233
          mmLeft = 175684
          mmTop = 265
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppLine34: TppLine
          UserName = 'Line34'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4763
          mmLeft = 0
          mmTop = 265
          mmWidth = 3175
          BandType = 5
          GroupNo = 1
        end
        object ppLine22: TppLine
          UserName = 'Line5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 4498
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object ppLine35: TppLine
          UserName = 'Line301'
          Position = lpRight
          Weight = 0.75
          mmHeight = 4763
          mmLeft = 194205
          mmTop = 265
          mmWidth = 3175
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup11: TppGroup
      BreakName = 'IDPESSJUR'
      DataPipeline = ppTotEventos
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group11'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppTotEventos'
      object ppGroupHeaderBand11: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppDBText95: TppDBText
          UserName = 'DBText4'
          DataField = 'RAZAOSOCIAL'
          DataPipeline = ppTotEventos
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppTotEventos'
          mmHeight = 3969
          mmLeft = 15875
          mmTop = 794
          mmWidth = 105569
          BandType = 3
          GroupNo = 2
        end
        object ppLine26: TppLine
          UserName = 'Line26'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 5292
          mmWidth = 197300
          BandType = 3
          GroupNo = 2
        end
        object ppLine27: TppLine
          UserName = 'Line27'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 3
          GroupNo = 2
        end
        object ppLine28: TppLine
          UserName = 'Line28'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 6350
          mmLeft = 0
          mmTop = 0
          mmWidth = 3175
          BandType = 3
          GroupNo = 2
        end
        object ppLine31: TppLine
          UserName = 'Line31'
          Position = lpRight
          Weight = 0.75
          mmHeight = 6350
          mmLeft = 194205
          mmTop = 0
          mmWidth = 3175
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand10: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppDemonsRetroativo: TppBDEPipeline
    DataSource = dsDemonsRetroativo
    UserName = 'TotEventos1'
    Left = 321
    Top = 477
  end
  object dsDemonsRetroativo: TwwDataSource
    DataSet = qryDemonsRetroativo
    Left = 283
    Top = 477
  end
  object qryDemonsRetroativo: TwwQuery
    BeforeOpen = qryTotEventosBeforeOpen
    AfterOpen = qryTotEventosAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.IDRETROATIVO,'
      'R.IDLOTE,'
      'R.IDMOTIVO,'
      'R.IDPESSOA,'
      'R.IDTITULAR,'
      'R.IDPESSJUR,'
      'R.IDPLANOPREV,'
      'R.FLGALTINFBENEF,'
      'R.FLGTIPRETROATIVO,'
      'R.ANOMESINI,'
      'R.ANOMESFIM,'
      'R.ANOMESINIACERTO,'
      'R.ANOMESFIMACERTO,'
      'R.RUBFOLHAEXTRA,'
      'R.SEQPROPOSTA,'
      'R.FLGALTCADASTRAL,'
      'R.FLGALTFUNCIONAL,'
      'R.FLGALTOPCONTRIB,'
      'R.FLGALTTIPOBENEF,'
      'R.ANOMESACERTO,'
      'R.DATAACERTO,'
      'R.DATAPREVISTA,'
      'DECODE(R.FLGDESCFOLHAAT,1,'#39'Folha'#39','#39'Banco'#39') AS FORMACOBATIVO,'
      'DECODE(R.FLGDESCFOLHAMA,1,'#39'Folha'#39','#39'Banco'#39') AS FORMACOBMANTIDO,'
      'DECODE(R.FLGDESCFOLHAAS,1,'#39'Folha'#39','#39'Banco'#39') AS FORMACOBASSISTIDO,'
      
        'DECODE(R.FLGDESCFOLHAFL,1,'#39'Folha'#39','#39'Banco'#39') AS FORMACOBPENSIONIST' +
        'A,'
      
        'DECODE(R.FLGINCALTAT, 1, '#39'Com Alterador'#39','#39'Sem Alterador'#39') AS INC' +
        'ALTERADORATIVO,'
      
        'DECODE(R.FLGINCALTMA, 1, '#39'Com Alterador'#39','#39'Sem Alterador'#39') AS INC' +
        'ALTERADORMANTIDO,'
      ''
      'R.OBS,'
      'M.DESCRICAO AS DESCMOTIVO,'
      
        'DECODE(R.IDTITULAR,R.IDPESSOA,EL.MATRICULA,DP.MATRICULA) AS MATR' +
        'ICULA,'
      'R.TRGDTINCLUSAO,'
      'U.NOMEUSUARIO,'
      'RA.CAMPO, RA.VALORANTERIOR, RA.NOVOVALOR'
      
        'FROM RETROATIVOPREV R, MOTIVO M, ELEGPATRO EL, DEPENTIT DP, USUA' +
        'RIOSISTEMA U,'
      '     RETROATIVOXALT RA'
      'WHERE R.IDPESSJUR   = :IDPESSJUR'
      'AND   R.IDPLANOPREV = :IDPLANOPREV'
      'AND   R.IDTITULAR   = :IDTITULAR'
      'AND   R.SEQPROPOSTA = :SEQPROPOSTA'
      'AND   M.IDMOTIVO    = R.IDMOTIVO'
      'AND   EL.IDPESSJUR  = R.IDPESSJUR'
      'AND   EL.IDPESSOA   = R.IDTITULAR'
      'AND   DP.IDTITULAR  = R.IDTITULAR'
      'AND   DP.IDPESSOA   = R.IDPESSOA'
      
        'AND   TRIM(R.TRGUSERINCLUSAO) = TRIM('#39'CM'#39'||TO_CHAR(U.IDUSUARIO) ' +
        ')'
      'AND   RA.IDRETROATIVO(+) = R.IDRETROATIVO'
      'ORDER BY R.IDRETROATIVO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 247
    Top = 477
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '2002'
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = '6'
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = '8885'
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
        Value = '1'
      end>
  end
  object rpDemonsRetroativo: TppReport
    AutoStop = False
    DataPipeline = ppDemonsRetroativo
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
    Template.FileName = 'C:\Documentos\CBS\Totalizador de Eventos Data Tipo Evento.rtm'
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 360
    Top = 477
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppDemonsRetroativo'
    object ppHeaderBand8: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26194
      mmPrintPosition = 0
      object ppDBImage7: TppDBImage
        UserName = 'DBImage6'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText58: TppDBText
        UserName = 'DBText102'
        AutoSize = True
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
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 45508
        BandType = 0
      end
      object ppDBText111: TppDBText
        UserName = 'DBText103'
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
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 97367
        BandType = 0
      end
      object ppDBText112: TppDBText
        UserName = 'DBText105'
        AutoSize = True
        DataField = 'LOGRADOURO'
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
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText113: TppDBText
        UserName = 'DBText106'
        AutoSize = True
        DataField = 'NUMERO'
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
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 3175
        BandType = 0
      end
      object ppDBText114: TppDBText
        UserName = 'DBText107'
        AutoSize = True
        DataField = 'CODESTADO'
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
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 3440
        BandType = 0
      end
      object ppDBText115: TppDBText
        UserName = 'DBText901'
        AutoSize = True
        DataField = 'CIDADE'
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
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 24077
        BandType = 0
      end
      object ppDBText116: TppDBText
        UserName = 'DBText109'
        AutoSize = True
        DataField = 'BAIRRO'
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
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 27781
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label73'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText117: TppDBText
        UserName = 'DBText110'
        AutoSize = True
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
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 12171
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText139: TppDBText
        UserName = 'DBText139'
        AutoSize = True
        DataField = 'CAMPO'
        DataPipeline = ppDemonsRetroativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonsRetroativo'
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 529
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText140: TppDBText
        UserName = 'DBText140'
        AutoSize = True
        DataField = 'VALORANTERIOR'
        DataPipeline = ppDemonsRetroativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonsRetroativo'
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 529
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText141: TppDBText
        UserName = 'DBText141'
        AutoSize = True
        DataField = 'NOVOVALOR'
        DataPipeline = ppDemonsRetroativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonsRetroativo'
        mmHeight = 3175
        mmLeft = 100542
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
    end
    object ppFooterBand8: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppSystemVariable9: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2910
        mmWidth = 197380
        BandType = 8
      end
      object ppLine44: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel96: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Cálculos Retroativos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = ANSI_CHARSET
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
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup13: TppGroup
      BreakName = 'MATRICULA'
      DataPipeline = ppDemonsRetroativo
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDemonsRetroativo'
      object ppGroupHeaderBand13: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppLine9: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label11'
          Caption = 'Cálculos Retroativos Realizados para a Matrícula '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5292
          mmLeft = 37306
          mmTop = 1588
          mmWidth = 100277
          BandType = 3
          GroupNo = 0
        end
        object ppDBText57: TppDBText
          UserName = 'DBText57'
          AutoSize = True
          DataField = 'MATRICULA'
          DataPipeline = ppDemonsRetroativo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 5292
          mmLeft = 141023
          mmTop = 1852
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand12: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 1323
        mmPrintPosition = 0
        object ppLine12: TppLine
          UserName = 'Line12'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup12: TppGroup
      BreakName = 'IDRETROATIVO'
      DataPipeline = ppDemonsRetroativo
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group12'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDemonsRetroativo'
      object ppGroupHeaderBand12: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 55298
        mmPrintPosition = 0
        object ppShape31: TppShape
          UserName = 'Shape3'
          Shape = stRoundRect
          mmHeight = 6615
          mmLeft = 0
          mmTop = 38629
          mmWidth = 194469
          BandType = 3
          GroupNo = 1
        end
        object ppShape30: TppShape
          UserName = 'Shape30'
          Shape = stRoundRect
          mmHeight = 23283
          mmLeft = 130175
          mmTop = 12965
          mmWidth = 66411
          BandType = 3
          GroupNo = 1
        end
        object ppShape29: TppShape
          UserName = 'Shape29'
          Shape = stRoundRect
          mmHeight = 23283
          mmLeft = 0
          mmTop = 12965
          mmWidth = 60854
          BandType = 3
          GroupNo = 1
        end
        object ppShape28: TppShape
          UserName = 'Shape28'
          Shape = stRoundRect
          mmHeight = 23283
          mmLeft = 61648
          mmTop = 12965
          mmWidth = 67998
          BandType = 3
          GroupNo = 1
        end
        object ppShape27: TppShape
          UserName = 'Shape2'
          Shape = stRoundRect
          mmHeight = 10848
          mmLeft = 265
          mmTop = 0
          mmWidth = 59796
          BandType = 3
          GroupNo = 1
        end
        object ppShape1: TppShape
          UserName = 'Shape1'
          Shape = stRoundRect
          mmHeight = 10848
          mmLeft = 61648
          mmTop = 0
          mmWidth = 33338
          BandType = 3
          GroupNo = 1
        end
        object ppDBText121: TppDBText
          UserName = 'DBText2'
          DataField = 'IDRETROATIVO'
          DataPipeline = ppDemonsRetroativo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3175
          mmLeft = 2381
          mmTop = 6350
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = 'No.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2646
          mmTop = 2646
          mmWidth = 4498
          BandType = 3
          GroupNo = 1
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = 'Efetuado em '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 14023
          mmTop = 2646
          mmWidth = 17463
          BandType = 3
          GroupNo = 1
        end
        object ppDBText120: TppDBText
          UserName = 'DBText120'
          DataField = 'TRGDTINCLUSAO'
          DataPipeline = ppDemonsRetroativo
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3175
          mmLeft = 14023
          mmTop = 6350
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object ppLabel92: TppLabel
          UserName = 'Label92'
          Caption = 'Motivo '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2381
          mmTop = 15081
          mmWidth = 9790
          BandType = 3
          GroupNo = 1
        end
        object ppDBText118: TppDBText
          UserName = 'DBText118'
          AutoSize = True
          DataField = 'DESCMOTIVO'
          DataPipeline = ppDemonsRetroativo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3175
          mmLeft = 2381
          mmTop = 18785
          mmWidth = 26988
          BandType = 3
          GroupNo = 1
        end
        object ppLabel94: TppLabel
          UserName = 'Label94'
          Caption = ' Período de Cálculo '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3175
          mmLeft = 64029
          mmTop = 0
          mmWidth = 26458
          BandType = 3
          GroupNo = 1
        end
        object ppDBText122: TppDBText
          UserName = 'DBText122'
          DataField = 'ANOMESFIM'
          DataPipeline = ppDemonsRetroativo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3175
          mmLeft = 78052
          mmTop = 6350
          mmWidth = 12700
          BandType = 3
          GroupNo = 1
        end
        object ppDBText123: TppDBText
          UserName = 'DBText123'
          DataField = 'ANOMESINI'
          DataPipeline = ppDemonsRetroativo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3175
          mmLeft = 64558
          mmTop = 6350
          mmWidth = 12700
          BandType = 3
          GroupNo = 1
        end
        object ppLabel97: TppLabel
          UserName = 'Label97'
          Caption = 'Do Mês'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 64558
          mmTop = 2646
          mmWidth = 9790
          BandType = 3
          GroupNo = 1
        end
        object ppLabel98: TppLabel
          UserName = 'Label98'
          Caption = 'Até o Mês '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 78052
          mmTop = 2646
          mmWidth = 13758
          BandType = 3
          GroupNo = 1
        end
        object ppShape25: TppShape
          UserName = 'Shape25'
          Shape = stRoundRect
          mmHeight = 10848
          mmLeft = 96309
          mmTop = 0
          mmWidth = 33338
          BandType = 3
          GroupNo = 1
        end
        object ppLabel101: TppLabel
          UserName = 'Label101'
          Caption = ' Período de Acerto '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3175
          mmLeft = 98690
          mmTop = 0
          mmWidth = 25135
          BandType = 3
          GroupNo = 1
        end
        object ppShape26: TppShape
          UserName = 'Shape26'
          Shape = stRoundRect
          mmHeight = 10848
          mmLeft = 130175
          mmTop = 0
          mmWidth = 66411
          BandType = 3
          GroupNo = 1
        end
        object ppLabel93: TppLabel
          UserName = 'Label93'
          Caption = ' Dados dos Acertos '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3175
          mmLeft = 132557
          mmTop = 0
          mmWidth = 26458
          BandType = 3
          GroupNo = 1
        end
        object ppDBText127: TppDBText
          UserName = 'DBText127'
          DataField = 'ANOMESACERTO'
          DataPipeline = ppDemonsRetroativo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3175
          mmLeft = 133086
          mmTop = 6350
          mmWidth = 12700
          BandType = 3
          GroupNo = 1
        end
        object ppDBText119: TppDBText
          UserName = 'DBText119'
          DataField = 'DATAACERTO'
          DataPipeline = ppDemonsRetroativo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3175
          mmLeft = 166423
          mmTop = 6350
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object ppDBText126: TppDBText
          UserName = 'DBText126'
          DataField = 'DATAPREVISTA'
          DataPipeline = ppDemonsRetroativo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3175
          mmLeft = 146579
          mmTop = 6350
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object ppDBText128: TppDBText
          UserName = 'DBText128'
          DataField = 'NOMEUSUARIO'
          DataPipeline = ppDemonsRetroativo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3175
          mmLeft = 34396
          mmTop = 6350
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppLabel104: TppLabel
          UserName = 'Label104'
          Caption = 'Por'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 34396
          mmTop = 2646
          mmWidth = 4498
          BandType = 3
          GroupNo = 1
        end
        object ppLabel105: TppLabel
          UserName = 'Label105'
          Caption = ' Dados do Retroativo '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3175
          mmLeft = 2646
          mmTop = 0
          mmWidth = 28575
          BandType = 3
          GroupNo = 1
        end
        object ppLabel102: TppLabel
          UserName = 'Label1'
          Caption = 'Do Mês'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 97896
          mmTop = 2646
          mmWidth = 9790
          BandType = 3
          GroupNo = 1
        end
        object ppDBText124: TppDBText
          UserName = 'DBText124'
          DataField = 'ANOMESINIACERTO'
          DataPipeline = ppDemonsRetroativo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3175
          mmLeft = 97896
          mmTop = 6350
          mmWidth = 12700
          BandType = 3
          GroupNo = 1
        end
        object ppLabel103: TppLabel
          UserName = 'Label103'
          Caption = 'Até o Mês '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 114829
          mmTop = 2646
          mmWidth = 13758
          BandType = 3
          GroupNo = 1
        end
        object ppDBText125: TppDBText
          UserName = 'DBText125'
          DataField = 'ANOMESFIMACERTO'
          DataPipeline = ppDemonsRetroativo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3175
          mmLeft = 114829
          mmTop = 6350
          mmWidth = 12700
          BandType = 3
          GroupNo = 1
        end
        object ppLabel106: TppLabel
          UserName = 'Label106'
          Caption = 'Ano/Mês'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 133086
          mmTop = 2646
          mmWidth = 11642
          BandType = 3
          GroupNo = 1
        end
        object ppLabel107: TppLabel
          UserName = 'Label107'
          Caption = 'Data'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 146579
          mmTop = 2646
          mmWidth = 5821
          BandType = 3
          GroupNo = 1
        end
        object ppLabel108: TppLabel
          UserName = 'Label108'
          Caption = 'Data Prev.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 166423
          mmTop = 2646
          mmWidth = 13494
          BandType = 3
          GroupNo = 1
        end
        object ppLabel109: TppLabel
          UserName = 'Label109'
          Caption = 'Lote'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 183357
          mmTop = 2646
          mmWidth = 5821
          BandType = 3
          GroupNo = 1
        end
        object ppDBText129: TppDBText
          UserName = 'DBText129'
          DataField = 'IDLOTE'
          DataPipeline = ppDemonsRetroativo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3175
          mmLeft = 183357
          mmTop = 6350
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object ppLabel110: TppLabel
          UserName = 'Label110'
          Caption = ' Tipos de Alteração '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3175
          mmLeft = 64029
          mmTop = 11113
          mmWidth = 26194
          BandType = 3
          GroupNo = 1
        end
        object myDBCheckBox1: TmyDBCheckBox
          UserName = 'DBCheckBox1'
          BooleanFalse = '0'
          BooleanTrue = '1'
          DataPipeline = ppDemonsRetroativo
          DataField = 'FLGALTCADASTRAL'
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3969
          mmLeft = 63765
          mmTop = 15346
          mmWidth = 4233
          BandType = 3
          GroupNo = 1
        end
        object myDBCheckBox2: TmyDBCheckBox
          UserName = 'DBCheckBox2'
          BooleanFalse = '0'
          BooleanTrue = '1'
          DataPipeline = ppDemonsRetroativo
          DataField = 'FLGALTFUNCIONAL'
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3969
          mmLeft = 63765
          mmTop = 19050
          mmWidth = 4233
          BandType = 3
          GroupNo = 1
        end
        object myDBCheckBox3: TmyDBCheckBox
          UserName = 'DBCheckBox3'
          BooleanFalse = '0'
          BooleanTrue = '1'
          DataPipeline = ppDemonsRetroativo
          DataField = 'FLGALTOPCONTRIB'
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3969
          mmLeft = 63765
          mmTop = 22754
          mmWidth = 4233
          BandType = 3
          GroupNo = 1
        end
        object myDBCheckBox4: TmyDBCheckBox
          UserName = 'DBCheckBox4'
          BooleanFalse = '0'
          BooleanTrue = '1'
          DataPipeline = ppDemonsRetroativo
          DataField = 'FLGALTTIPOBENEF'
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3969
          mmLeft = 63765
          mmTop = 26458
          mmWidth = 4233
          BandType = 3
          GroupNo = 1
        end
        object myDBCheckBox5: TmyDBCheckBox
          UserName = 'DBCheckBox5'
          BooleanFalse = '0'
          BooleanTrue = '1'
          DataPipeline = ppDemonsRetroativo
          DataField = 'FLGALTINFBENEF'
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3969
          mmLeft = 63765
          mmTop = 30692
          mmWidth = 4233
          BandType = 3
          GroupNo = 1
        end
        object ppLabel111: TppLabel
          UserName = 'Label111'
          Caption = 'Alteração Cadastral'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 67998
          mmTop = 15346
          mmWidth = 23813
          BandType = 3
          GroupNo = 1
        end
        object ppLabel112: TppLabel
          UserName = 'Label112'
          Caption = 'Alteração Funcional '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 67998
          mmTop = 19050
          mmWidth = 24606
          BandType = 3
          GroupNo = 1
        end
        object ppLabel113: TppLabel
          UserName = 'Label113'
          AutoSize = False
          Caption = 'Alteração de Opção de Contribuição '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 67998
          mmTop = 22754
          mmWidth = 48154
          BandType = 3
          GroupNo = 1
        end
        object ppLabel114: TppLabel
          UserName = 'Label114'
          Caption = 'Alteração de Tipo de Benefício '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 67998
          mmTop = 26458
          mmWidth = 37835
          BandType = 3
          GroupNo = 1
        end
        object ppLabel115: TppLabel
          UserName = 'Label115'
          Caption = 'Alteração de Dados de Benefício '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 67998
          mmTop = 30692
          mmWidth = 48154
          BandType = 3
          GroupNo = 1
        end
        object ppLabel116: TppLabel
          UserName = 'Label116'
          Caption = ' Observação '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3175
          mmLeft = 1852
          mmTop = 36513
          mmWidth = 17463
          BandType = 3
          GroupNo = 1
        end
        object ppLabel117: TppLabel
          UserName = 'Label117'
          Caption = ' Outros Parâmetros '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3175
          mmLeft = 3175
          mmTop = 11113
          mmWidth = 26458
          BandType = 3
          GroupNo = 1
        end
        object ppLabel118: TppLabel
          UserName = 'Label1101'
          Caption = ' Formas de Cobrança '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3175
          mmLeft = 132557
          mmTop = 11113
          mmWidth = 29104
          BandType = 3
          GroupNo = 1
        end
        object ppLabel119: TppLabel
          UserName = 'Label119'
          Caption = 'Ativos :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 133086
          mmTop = 15346
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppLabel120: TppLabel
          UserName = 'Label120'
          Caption = 'Mantidos :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 133086
          mmTop = 19050
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppLabel121: TppLabel
          UserName = 'Label121'
          Caption = 'Assistidos :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 133086
          mmTop = 22754
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppLabel122: TppLabel
          UserName = 'Label122'
          Caption = 'Pensionistas :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 133086
          mmTop = 26458
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppDBText131: TppDBText
          UserName = 'DBText131'
          DataField = 'FORMACOBATIVO'
          DataPipeline = ppDemonsRetroativo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3175
          mmLeft = 152136
          mmTop = 15346
          mmWidth = 11113
          BandType = 3
          GroupNo = 1
        end
        object ppDBText133: TppDBText
          UserName = 'DBText133'
          DataField = 'FORMACOBMANTIDO'
          DataPipeline = ppDemonsRetroativo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3175
          mmLeft = 152136
          mmTop = 19050
          mmWidth = 11113
          BandType = 3
          GroupNo = 1
        end
        object ppDBText134: TppDBText
          UserName = 'DBText134'
          DataField = 'FORMACOBASSISTIDO'
          DataPipeline = ppDemonsRetroativo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3175
          mmLeft = 152136
          mmTop = 22754
          mmWidth = 11113
          BandType = 3
          GroupNo = 1
        end
        object ppDBText135: TppDBText
          UserName = 'DBText135'
          DataField = 'FORMACOBPENSIONISTA'
          DataPipeline = ppDemonsRetroativo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3175
          mmLeft = 152136
          mmTop = 26458
          mmWidth = 11113
          BandType = 3
          GroupNo = 1
        end
        object ppDBText136: TppDBText
          UserName = 'DBText136'
          DataField = 'INCALTERADORATIVO'
          DataPipeline = ppDemonsRetroativo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3175
          mmLeft = 166423
          mmTop = 15346
          mmWidth = 18256
          BandType = 3
          GroupNo = 1
        end
        object ppDBText137: TppDBText
          UserName = 'DBText137'
          DataField = 'INCALTERADORMANTIDO'
          DataPipeline = ppDemonsRetroativo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3175
          mmLeft = 166423
          mmTop = 19050
          mmWidth = 19050
          BandType = 3
          GroupNo = 1
        end
        object ppLabel123: TppLabel
          UserName = 'Label123'
          Caption = 'Rubricas de Folha Extra a Considerar '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2381
          mmTop = 22490
          mmWidth = 50006
          BandType = 3
          GroupNo = 1
        end
        object ppDBText138: TppDBText
          UserName = 'DBText138'
          AutoSize = True
          DataField = 'RUBFOLHAEXTRA'
          DataPipeline = ppDemonsRetroativo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3175
          mmLeft = 2381
          mmTop = 26194
          mmWidth = 24606
          BandType = 3
          GroupNo = 1
        end
        object ppDBText130: TppDBText
          UserName = 'DBText130'
          AutoSize = True
          DataField = 'OBS'
          DataPipeline = ppDemonsRetroativo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDemonsRetroativo'
          mmHeight = 3175
          mmLeft = 1852
          mmTop = 40746
          mmWidth = 9260
          BandType = 3
          GroupNo = 1
        end
        object ppLabel124: TppLabel
          UserName = 'Label124'
          Caption = 'Alterações Efetuadas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2381
          mmTop = 47361
          mmWidth = 28046
          BandType = 3
          GroupNo = 1
        end
        object ppLabel125: TppLabel
          UserName = 'Label125'
          Caption = 'Campo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 4763
          mmTop = 51329
          mmWidth = 9525
          BandType = 3
          GroupNo = 1
        end
        object ppLabel126: TppLabel
          UserName = 'Label126'
          Caption = 'Valor Antes da Alteração'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 48683
          mmTop = 51329
          mmWidth = 32544
          BandType = 3
          GroupNo = 1
        end
        object ppLabel127: TppLabel
          UserName = 'Label127'
          Caption = 'Valor Após Alteração'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 100277
          mmTop = 51329
          mmWidth = 27781
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand11: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryEstatBeneficio: TwwQuery
    BeforeOpen = qryTotEventosBeforeOpen
    AfterOpen = qryTotEventosAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT MES, PATROCINADORA, PLANO, BENEFICIO, IDBENEFICIO, CODBEN' +
        'EFSPC, SITUACAO, TIPO,'
      '       SUM(DECODE(TIPO,1,QUANTIDADE,0)) AS QUANTIDADE_MES,'
      '       SUM(DECODE(TIPO,1,VALOR,0))      AS VALOR_MES,'
      '       SUM(DECODE(TIPO,2,QUANTIDADE,0)) AS QUANTIDADE_ATRASADO,'
      '       SUM(DECODE(TIPO,2,VALOR,0))      AS VALOR_ATRASADO,'
      '       SUM(DECODE(TIPO,3,QUANTIDADE,0)) AS QUANTIDADE_ABONO,'
      '       SUM(DECODE(TIPO,3,VALOR,0))      AS VALOR_ABONO,'
      '       SUM(QUANTIDADE) AS QUANTIDADE_TOTAL,'
      '       SUM(VALOR)      AS VALOR_TOTAL'
      'FROM ('
      ''
      'SELECT H.MES, P.NOME AS PATROCINADORA, PL.NOME AS PLANO,'
      '  '#9' B.NOME AS BENEFICIO, B.IDBENEFICIO, B.CODBENEFSPC,'
      #9' COUNT(DISTINCT H.IDPESSOA) QUANTIDADE,'
      
        '       DECODE(H.FLGENVIADO, 9, SUM(DECODE(H.FLGDEVOLUCAO,1,-H.VA' +
        'LORPREV,H.VALORPREV)),'
      
        '                               SUM(DECODE(H.FLGDEVOLUCAO,1,-H.VL' +
        'BENEFPGTO,H.VLBENEFPGTO)) '
      '             )   AS VALOR,'
      ''
      '       DECODE(H.FLGENVIADO, 9, '#39'Retidos'#39','#39'Pagos'#39' ) AS SITUACAO,'
      '       1 AS TIPO'
      'FROM   PESSOA P, PLANPREV PL, BENEFICIO B, HSTBENEFBFCIARIO H'
      'WHERE  H.MES = :MES'
      'AND    H.MESREFERENCIA = H.MES'
      'AND    P.IDPESSOA = H.IDPESSJUR'
      'AND    PL.IDPLANOPREV = H.IDPLANOPREV'
      'AND    B.IDBENEFICIO = H.IDBENEFICIO'
      
        'AND    ( (H.FLGENVIADO = 9) OR  ( (H.FLGENVIADO <> 9) AND (H.VLB' +
        'ENEFPGTO > 0) ) )'
      
        'GROUP BY H.MES, P.NOME, PL.NOME, B.NOME, B.IDBENEFICIO, B.CODBEN' +
        'EFSPC, H.FLGENVIADO'
      'UNION'
      'SELECT H.MES, P.NOME AS PATROCINADORA, PL.NOME AS PLANO,'
      '  '#9'    B.NOME AS BENEFICIO, B.IDBENEFICIO, B.CODBENEFSPC,'
      #9'    COUNT(DISTINCT H.IDPESSOA) QUANTIDADE,'
      
        '       DECODE(H.FLGENVIADO, 9, SUM(DECODE(H.FLGDEVOLUCAO,1,-H.VA' +
        'LORPREV,H.VALORPREV)),'
      
        '                               SUM(DECODE(H.FLGDEVOLUCAO,1,-H.VL' +
        'BENEFPGTO,H.VLBENEFPGTO)) '
      '             )   AS VALOR,'
      ''
      '       DECODE(H.FLGENVIADO, 9, '#39'Retidos'#39','#39'Pagos'#39' ) AS SITUACAO,'
      '       2 AS TIPO'
      'FROM   PESSOA P, PLANPREV PL, BENEFICIO B, HSTBENEFBFCIARIO H'
      'WHERE  H.MES = :MES'
      'AND    SUBSTR(H.MESREFERENCIA,6,2) <> '#39'13'#39
      'AND    H.MESREFERENCIA <> H.MES'
      'AND    P.IDPESSOA = H.IDPESSJUR'
      'AND    PL.IDPLANOPREV = H.IDPLANOPREV'
      'AND    B.IDBENEFICIO = H.IDBENEFICIO'
      
        'AND    ( (H.FLGENVIADO = 9) OR  ( (H.FLGENVIADO <> 9) AND (H.VLB' +
        'ENEFPGTO > 0) ) ) '
      
        'GROUP BY H.MES, P.NOME, PL.NOME, B.NOME, B.IDBENEFICIO, B.CODBEN' +
        'EFSPC, H.FLGENVIADO'
      'UNION'
      'SELECT H.MES, P.NOME AS PATROCINADORA, PL.NOME AS PLANO,'
      '  '#9'    B.NOME AS BENEFICIO, B.IDBENEFICIO, B.CODBENEFSPC,'
      #9'    COUNT(DISTINCT H.IDPESSOA) QUANTIDADE,'
      
        '       DECODE(H.FLGENVIADO, 9, SUM(DECODE(H.FLGDEVOLUCAO,1,-H.VA' +
        'LORPREV,H.VALORPREV)),'
      
        '                               SUM(DECODE(H.FLGDEVOLUCAO,1,-H.VL' +
        'BENEFPGTO,H.VLBENEFPGTO)) '
      '             )   AS VALOR,'
      ''
      '       DECODE(H.FLGENVIADO, 9, '#39'Retidos'#39','#39'Pagos'#39' ) AS SITUACAO,'
      '       3 AS TIPO'
      'FROM   PESSOA P, PLANPREV PL, BENEFICIO B, HSTBENEFBFCIARIO H'
      'WHERE  H.MES = :MES'
      'AND    SUBSTR(H.MESREFERENCIA,6,2) = '#39'13'#39
      'AND    P.IDPESSOA = H.IDPESSJUR'
      'AND    PL.IDPLANOPREV = H.IDPLANOPREV'
      'AND    B.IDBENEFICIO = H.IDBENEFICIO'
      
        'AND    ( (H.FLGENVIADO = 9) OR  ( (H.FLGENVIADO <> 9) AND (H.VLB' +
        'ENEFPGTO > 0) ) )'
      
        'GROUP BY H.MES, P.NOME, PL.NOME, B.NOME, B.IDBENEFICIO, B.CODBEN' +
        'EFSPC, H.FLGENVIADO'
      ')'
      
        'GROUP BY MES, PATROCINADORA, PLANO, BENEFICIO, IDBENEFICIO, CODB' +
        'ENEFSPC, SITUACAO, TIPO'
      'ORDER BY PATROCINADORA, PLANO, SITUACAO, CODBENEFSPC'
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 457
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptUnknown
        Value = '2002/12'
      end
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptUnknown
      end>
  end
  object dsEstatBeneficio: TwwDataSource
    DataSet = qryEstatBeneficio
    Left = 493
    Top = 72
  end
  object ppEstatBeneficio: TppBDEPipeline
    DataSource = dsEstatBeneficio
    UserName = 'EstatBeneficio'
    Left = 531
    Top = 72
    object ppEstatBeneficioppField1: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 7
      DisplayWidth = 7
      Position = 0
    end
    object ppEstatBeneficioppField2: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppEstatBeneficioppField3: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppEstatBeneficioppField4: TppField
      FieldAlias = 'BENEFICIO'
      FieldName = 'BENEFICIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppEstatBeneficioppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBENEFICIO'
      FieldName = 'IDBENEFICIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppEstatBeneficioppField6: TppField
      FieldAlias = 'CODBENEFSPC'
      FieldName = 'CODBENEFSPC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object ppEstatBeneficioppField7: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 7
      DisplayWidth = 7
      Position = 6
    end
    object ppEstatBeneficioppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppEstatBeneficioppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTIDADE_MES'
      FieldName = 'QUANTIDADE_MES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppEstatBeneficioppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_MES'
      FieldName = 'VALOR_MES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppEstatBeneficioppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTIDADE_ATRASADO'
      FieldName = 'QUANTIDADE_ATRASADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppEstatBeneficioppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_ATRASADO'
      FieldName = 'VALOR_ATRASADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppEstatBeneficioppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTIDADE_ABONO'
      FieldName = 'QUANTIDADE_ABONO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppEstatBeneficioppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_ABONO'
      FieldName = 'VALOR_ABONO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppEstatBeneficioppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTIDADE_TOTAL'
      FieldName = 'QUANTIDADE_TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppEstatBeneficioppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_TOTAL'
      FieldName = 'VALOR_TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
  end
  object rpEstatBeneficio: TppReport
    AutoStop = False
    DataPipeline = ppEstatBeneficio
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
    Template.FileName = 'C:\Documentos\CBS\Totalizador de Eventos Data Tipo Evento.rtm'
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 570
    Top = 72
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppEstatBeneficio'
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35719
      mmPrintPosition = 0
      object ppDBImage8: TppDBImage
        UserName = 'DBImage6'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText142: TppDBText
        UserName = 'DBText102'
        AutoSize = True
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
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText143: TppDBText
        UserName = 'DBText103'
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
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 58738
        BandType = 0
      end
      object ppDBText144: TppDBText
        UserName = 'DBText105'
        AutoSize = True
        DataField = 'LOGRADOURO'
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
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 40481
        BandType = 0
      end
      object ppDBText145: TppDBText
        UserName = 'DBText106'
        AutoSize = True
        DataField = 'NUMERO'
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
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 3175
        BandType = 0
      end
      object ppDBText146: TppDBText
        UserName = 'DBText107'
        AutoSize = True
        DataField = 'CODESTADO'
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
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 3440
        BandType = 0
      end
      object ppDBText147: TppDBText
        UserName = 'DBText901'
        AutoSize = True
        DataField = 'CIDADE'
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
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 22490
        BandType = 0
      end
      object ppDBText148: TppDBText
        UserName = 'DBText109'
        AutoSize = True
        DataField = 'BAIRRO'
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
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel128: TppLabel
        UserName = 'Label73'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText149: TppDBText
        UserName = 'DBText110'
        AutoSize = True
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
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel130: TppLabel
        UserName = 'Label130'
        AutoSize = False
        Caption = 'Relatório Estatístico de Pagamento de Benefícios - Mês : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        mmHeight = 5821
        mmLeft = 23548
        mmTop = 27517
        mmWidth = 128852
        BandType = 0
      end
      object ppDBText150: TppDBText
        UserName = 'DBText150'
        DataField = 'MES'
        DataPipeline = ppEstatBeneficio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEstatBeneficio'
        mmHeight = 5821
        mmLeft = 153194
        mmTop = 27517
        mmWidth = 20638
        BandType = 0
      end
      object ppLine45: TppLine
        UserName = 'Line45'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 34131
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppShape35: TppShape
        UserName = 'Shape35'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText153: TppDBText
        UserName = 'DBText153'
        DataField = 'IDBENEFICIO'
        DataPipeline = ppEstatBeneficio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstatBeneficio'
        mmHeight = 3175
        mmLeft = 10848
        mmTop = 794
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText160: TppDBText
        UserName = 'DBText160'
        DataField = 'CODBENEFSPC'
        DataPipeline = ppEstatBeneficio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstatBeneficio'
        mmHeight = 3175
        mmLeft = 23019
        mmTop = 794
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText161: TppDBText
        UserName = 'DBText161'
        DataField = 'BENEFICIO'
        DataPipeline = ppEstatBeneficio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEstatBeneficio'
        mmHeight = 3175
        mmLeft = 34396
        mmTop = 794
        mmWidth = 58208
        BandType = 4
      end
      object ppDBText164: TppDBText
        UserName = 'DBText164'
        DataField = 'VALOR_ABONO'
        DataPipeline = ppEstatBeneficio
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstatBeneficio'
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText165: TppDBText
        UserName = 'DBText165'
        DataField = 'QUANTIDADE_ABONO'
        DataPipeline = ppEstatBeneficio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstatBeneficio'
        mmHeight = 3175
        mmLeft = 163248
        mmTop = 794
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText162: TppDBText
        UserName = 'DBText162'
        DataField = 'QUANTIDADE_ATRASADO'
        DataPipeline = ppEstatBeneficio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstatBeneficio'
        mmHeight = 3175
        mmLeft = 129382
        mmTop = 794
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText166: TppDBText
        UserName = 'DBText166'
        DataField = 'VALOR_ATRASADO'
        DataPipeline = ppEstatBeneficio
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstatBeneficio'
        mmHeight = 3175
        mmLeft = 144463
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText167: TppDBText
        UserName = 'DBText167'
        DataField = 'QUANTIDADE_MES'
        DataPipeline = ppEstatBeneficio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstatBeneficio'
        mmHeight = 3175
        mmLeft = 93927
        mmTop = 794
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText168: TppDBText
        UserName = 'DBText168'
        DataField = 'VALOR_MES'
        DataPipeline = ppEstatBeneficio
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstatBeneficio'
        mmHeight = 3175
        mmLeft = 106363
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppLine46: TppLine
        UserName = 'Line46'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 21960
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine49: TppLine
        UserName = 'Line49'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 33602
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine51: TppLine
        UserName = 'Line51'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 92869
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine52: TppLine
        UserName = 'Line52'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 128323
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine53: TppLine
        UserName = 'Line53'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 162190
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppSystemVariable11: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2910
        mmWidth = 197380
        BandType = 8
      end
      object ppLine43: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel129: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Estatístico de Benefícios'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable12: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = ANSI_CHARSET
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
    object ppSummaryBand6: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup14: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = ppEstatBeneficio
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group14'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEstatBeneficio'
      object ppGroupHeaderBand14: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppShape32: TppShape
          UserName = 'Shape32'
          Brush.Color = clSilver
          ParentHeight = True
          ParentWidth = True
          mmHeight = 5292
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel131: TppLabel
          UserName = 'Label131'
          Caption = 'Patrocinadora : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 529
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object ppDBText151: TppDBText
          UserName = 'DBText151'
          AutoSize = True
          DataField = 'PATROCINADORA'
          DataPipeline = ppEstatBeneficio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 4233
          mmLeft = 27781
          mmTop = 529
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand13: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppShape38: TppShape
          UserName = 'Shape38'
          ParentWidth = True
          mmHeight = 4498
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel153: TppLabel
          UserName = 'Label153'
          Caption = 'Total da Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 26194
          mmTop = 529
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc21: TppDBCalc
          UserName = 'DBCalc21'
          DataField = 'QUANTIDADE_MES'
          DataPipeline = ppEstatBeneficio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup14
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 3175
          mmLeft = 93927
          mmTop = 529
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc22: TppDBCalc
          UserName = 'DBCalc22'
          DataField = 'VALOR_MES'
          DataPipeline = ppEstatBeneficio
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup14
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 3175
          mmLeft = 106363
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc23: TppDBCalc
          UserName = 'DBCalc23'
          DataField = 'QUANTIDADE_ATRASADO'
          DataPipeline = ppEstatBeneficio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup14
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 3175
          mmLeft = 129382
          mmTop = 529
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc24: TppDBCalc
          UserName = 'DBCalc24'
          DataField = 'VALOR_ATRASADO'
          DataPipeline = ppEstatBeneficio
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup14
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 3175
          mmLeft = 144463
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc25: TppDBCalc
          UserName = 'DBCalc25'
          DataField = 'QUANTIDADE_ABONO'
          DataPipeline = ppEstatBeneficio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup14
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 3175
          mmLeft = 163777
          mmTop = 529
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc26: TppDBCalc
          UserName = 'DBCalc201'
          DataField = 'VALOR_ABONO'
          DataPipeline = ppEstatBeneficio
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup14
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 3175
          mmLeft = 177800
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLine65: TppLine
          UserName = 'Line65'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 92869
          mmTop = 0
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object ppLine66: TppLine
          UserName = 'Line66'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 128323
          mmTop = 0
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object ppLine67: TppLine
          UserName = 'Line67'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 162190
          mmTop = 0
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup15: TppGroup
      BreakName = 'PLANO'
      DataPipeline = ppEstatBeneficio
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group15'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEstatBeneficio'
      object ppGroupHeaderBand15: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand14: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppShape37: TppShape
          UserName = 'Shape37'
          ParentWidth = True
          mmHeight = 4498
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object ppLabel152: TppLabel
          UserName = 'Label152'
          Caption = 'Total do Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 26194
          mmTop = 529
          mmWidth = 19050
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'QUANTIDADE_MES'
          DataPipeline = ppEstatBeneficio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 3175
          mmLeft = 93927
          mmTop = 529
          mmWidth = 11377
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc103'
          DataField = 'VALOR_MES'
          DataPipeline = ppEstatBeneficio
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 3175
          mmLeft = 106363
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'DBCalc17'
          DataField = 'QUANTIDADE_ATRASADO'
          DataPipeline = ppEstatBeneficio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 3175
          mmLeft = 129382
          mmTop = 529
          mmWidth = 11377
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc18: TppDBCalc
          UserName = 'DBCalc18'
          DataField = 'VALOR_ATRASADO'
          DataPipeline = ppEstatBeneficio
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 3175
          mmLeft = 144463
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc19: TppDBCalc
          UserName = 'DBCalc19'
          DataField = 'QUANTIDADE_ABONO'
          DataPipeline = ppEstatBeneficio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 3175
          mmLeft = 163777
          mmTop = 529
          mmWidth = 11377
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc20: TppDBCalc
          UserName = 'DBCalc20'
          DataField = 'VALOR_ABONO'
          DataPipeline = ppEstatBeneficio
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 3175
          mmLeft = 177800
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppLine62: TppLine
          UserName = 'Line62'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 92869
          mmTop = 0
          mmWidth = 1588
          BandType = 5
          GroupNo = 1
        end
        object ppLine63: TppLine
          UserName = 'Line63'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 128323
          mmTop = 0
          mmWidth = 1588
          BandType = 5
          GroupNo = 1
        end
        object ppLine64: TppLine
          UserName = 'Line64'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 162190
          mmTop = 0
          mmWidth = 1588
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup16: TppGroup
      BreakName = 'SITUACAO'
      DataPipeline = ppEstatBeneficio
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group16'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEstatBeneficio'
      object ppGroupHeaderBand16: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14552
        mmPrintPosition = 0
        object ppShape33: TppShape
          UserName = 'Shape33'
          ParentWidth = True
          mmHeight = 6085
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 2
        end
        object ppShape34: TppShape
          UserName = 'Shape34'
          ParentWidth = True
          mmHeight = 8731
          mmLeft = 0
          mmTop = 5821
          mmWidth = 197300
          BandType = 3
          GroupNo = 2
        end
        object ppLabel134: TppLabel
          UserName = 'Label134'
          Caption = 'Cód.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 15346
          mmTop = 6879
          mmWidth = 5821
          BandType = 3
          GroupNo = 2
        end
        object ppLabel135: TppLabel
          UserName = 'Label135'
          Caption = 'Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 9790
          mmTop = 10583
          mmWidth = 11377
          BandType = 3
          GroupNo = 2
        end
        object ppLabel136: TppLabel
          UserName = 'Label136'
          Caption = 'Cód.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 26988
          mmTop = 6879
          mmWidth = 5821
          BandType = 3
          GroupNo = 2
        end
        object ppLabel137: TppLabel
          UserName = 'Label137'
          Caption = 'SPC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 26988
          mmTop = 10583
          mmWidth = 5821
          BandType = 3
          GroupNo = 2
        end
        object ppLabel138: TppLabel
          UserName = 'Label138'
          Caption = 'Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 34396
          mmTop = 6879
          mmWidth = 11377
          BandType = 3
          GroupNo = 2
        end
        object ppLabel141: TppLabel
          UserName = 'Label141'
          Caption = 'Qtde.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 98690
          mmTop = 10583
          mmWidth = 6615
          BandType = 3
          GroupNo = 2
        end
        object ppLabel142: TppLabel
          UserName = 'Label142'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 117211
          mmTop = 10583
          mmWidth = 6350
          BandType = 3
          GroupNo = 2
        end
        object ppDBText163: TppDBText
          UserName = 'DBText163'
          DataField = 'SITUACAO'
          DataPipeline = ppEstatBeneficio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 3175
          mmLeft = 181769
          mmTop = 794
          mmWidth = 13229
          BandType = 3
          GroupNo = 2
        end
        object ppLabel139: TppLabel
          UserName = 'Label139'
          Caption = 'Do Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 108479
          mmTop = 6879
          mmWidth = 9525
          BandType = 3
          GroupNo = 2
        end
        object ppLabel140: TppLabel
          UserName = 'Label140'
          Caption = 'Atrasados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 140494
          mmTop = 6879
          mmWidth = 12171
          BandType = 3
          GroupNo = 2
        end
        object ppLabel143: TppLabel
          UserName = 'Label143'
          Caption = 'Abono Anual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 174361
          mmTop = 6615
          mmWidth = 15610
          BandType = 3
          GroupNo = 2
        end
        object ppLabel145: TppLabel
          UserName = 'Label145'
          Caption = 'Qtde.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 134144
          mmTop = 10583
          mmWidth = 6615
          BandType = 3
          GroupNo = 2
        end
        object ppLabel147: TppLabel
          UserName = 'Label147'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 155311
          mmTop = 10583
          mmWidth = 6350
          BandType = 3
          GroupNo = 2
        end
        object ppLabel148: TppLabel
          UserName = 'Label148'
          Caption = 'Qtde.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 168011
          mmTop = 10583
          mmWidth = 6615
          BandType = 3
          GroupNo = 2
        end
        object ppLabel149: TppLabel
          UserName = 'Label149'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 188648
          mmTop = 10583
          mmWidth = 6350
          BandType = 3
          GroupNo = 2
        end
        object ppLabel150: TppLabel
          UserName = 'Label150'
          Caption = 'Benefícios '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 166688
          mmTop = 794
          mmWidth = 14552
          BandType = 3
          GroupNo = 2
        end
        object ppLine54: TppLine
          UserName = 'Line54'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8731
          mmLeft = 21960
          mmTop = 5821
          mmWidth = 1058
          BandType = 3
          GroupNo = 2
        end
        object ppLine55: TppLine
          UserName = 'Line55'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8731
          mmLeft = 33602
          mmTop = 5822
          mmWidth = 794
          BandType = 3
          GroupNo = 2
        end
        object ppLine56: TppLine
          UserName = 'Line56'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8731
          mmLeft = 92869
          mmTop = 5821
          mmWidth = 1058
          BandType = 3
          GroupNo = 2
        end
        object ppLine57: TppLine
          UserName = 'Line57'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8731
          mmLeft = 128323
          mmTop = 5821
          mmWidth = 529
          BandType = 3
          GroupNo = 2
        end
        object ppLine58: TppLine
          UserName = 'Line58'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8731
          mmLeft = 162190
          mmTop = 5821
          mmWidth = 265
          BandType = 3
          GroupNo = 2
        end
        object ppLabel133: TppLabel
          UserName = 'Label133'
          Caption = 'Plano :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 11906
          mmTop = 529
          mmWidth = 9260
          BandType = 3
          GroupNo = 2
        end
        object ppDBText152: TppDBText
          UserName = 'DBText152'
          AutoSize = True
          DataField = 'PLANO'
          DataPipeline = ppEstatBeneficio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 3175
          mmLeft = 26194
          mmTop = 529
          mmWidth = 44450
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand15: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppShape36: TppShape
          UserName = 'Shape36'
          ParentHeight = True
          ParentWidth = True
          mmHeight = 4498
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 2
        end
        object ppDBText169: TppDBText
          UserName = 'DBText169'
          DataField = 'SITUACAO'
          DataPipeline = ppEstatBeneficio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 3175
          mmLeft = 54769
          mmTop = 529
          mmWidth = 13229
          BandType = 5
          GroupNo = 2
        end
        object ppLabel151: TppLabel
          UserName = 'Label1501'
          Caption = 'Total de Benefícios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 26194
          mmTop = 529
          mmWidth = 25400
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'QUANTIDADE_MES'
          DataPipeline = ppEstatBeneficio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 3175
          mmLeft = 93927
          mmTop = 529
          mmWidth = 11377
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'VALOR_MES'
          DataPipeline = ppEstatBeneficio
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 3175
          mmLeft = 106363
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'QUANTIDADE_ATRASADO'
          DataPipeline = ppEstatBeneficio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 3175
          mmLeft = 129382
          mmTop = 529
          mmWidth = 11377
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc101'
          DataField = 'VALOR_ATRASADO'
          DataPipeline = ppEstatBeneficio
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 3175
          mmLeft = 144463
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'QUANTIDADE_ABONO'
          DataPipeline = ppEstatBeneficio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 3175
          mmLeft = 163777
          mmTop = 529
          mmWidth = 11377
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc102'
          DataField = 'VALOR_ABONO'
          DataPipeline = ppEstatBeneficio
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficio'
          mmHeight = 3175
          mmLeft = 177800
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppLine59: TppLine
          UserName = 'Line59'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 92869
          mmTop = 0
          mmWidth = 1058
          BandType = 5
          GroupNo = 2
        end
        object ppLine60: TppLine
          UserName = 'Line60'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 128323
          mmTop = 0
          mmWidth = 1058
          BandType = 5
          GroupNo = 2
        end
        object ppLine61: TppLine
          UserName = 'Line61'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 162190
          mmTop = 0
          mmWidth = 1058
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object qryEstatBeneficioGRUPO: TwwQuery
    BeforeOpen = qryTotEventosBeforeOpen
    AfterOpen = qryTotEventosAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39'0000/00'#39' AS MES,'
      
        '       '#39'                                                  '#39'     ' +
        '  AS GRUPO,'
      
        '       '#39'                                                  '#39'     ' +
        '  AS PATROCINADORA,'
      
        '       '#39'                                                  '#39'     ' +
        '  AS PLANO,'
      
        '       '#39'                                                  '#39'     ' +
        '  AS BENEFICIO,'
      '       -1 AS IDBENEFICIO, -1 AS CODBENEFSPC,'
      '       0 AS TOTAL_ANTERIOR,'
      '       0 AS TOTAL_CONCEDIDO,'
      '       0 AS ACUM_ANO,'
      '       0 AS ACUMULADO'
      'FROM DUAL ')
    ValidateWithMask = True
    Left = 454
    Top = 147
  end
  object dsEstatBeneficioGRUPO: TwwDataSource
    DataSet = qryEstatBeneficioGRUPO
    Left = 490
    Top = 147
  end
  object ppEstatBeneficioGRUPO: TppBDEPipeline
    DataSource = dsEstatBeneficioGRUPO
    UserName = 'EstatBeneficio1'
    Left = 528
    Top = 147
    object ppEstatBeneficioGRUPOppField1: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 7
      DisplayWidth = 7
      Position = 0
    end
    object ppEstatBeneficioGRUPOppField2: TppField
      FieldAlias = 'GRUPO'
      FieldName = 'GRUPO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppEstatBeneficioGRUPOppField3: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppEstatBeneficioGRUPOppField4: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppEstatBeneficioGRUPOppField5: TppField
      FieldAlias = 'BENEFICIO'
      FieldName = 'BENEFICIO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppEstatBeneficioGRUPOppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBENEFICIO'
      FieldName = 'IDBENEFICIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppEstatBeneficioGRUPOppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODBENEFSPC'
      FieldName = 'CODBENEFSPC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppEstatBeneficioGRUPOppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL_ANTERIOR'
      FieldName = 'TOTAL_ANTERIOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppEstatBeneficioGRUPOppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL_CONCEDIDO'
      FieldName = 'TOTAL_CONCEDIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppEstatBeneficioGRUPOppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'ACUM_ANO'
      FieldName = 'ACUM_ANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppEstatBeneficioGRUPOppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'ACUMULADO'
      FieldName = 'ACUMULADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
  end
  object rpEstatBeneficioGRUPO: TppReport
    AutoStop = False
    DataPipeline = ppEstatBeneficioGRUPO
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
    Template.FileName = 'C:\Documentos\CBS\Totalizador de Eventos Data Tipo Evento.rtm'
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 567
    Top = 147
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppEstatBeneficioGRUPO'
    object ppHeaderBand10: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35719
      mmPrintPosition = 0
      object ppDBImage9: TppDBImage
        UserName = 'DBImage6'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText170: TppDBText
        UserName = 'DBText102'
        AutoSize = True
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
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText171: TppDBText
        UserName = 'DBText103'
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
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 58738
        BandType = 0
      end
      object ppDBText172: TppDBText
        UserName = 'DBText105'
        AutoSize = True
        DataField = 'LOGRADOURO'
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
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 40481
        BandType = 0
      end
      object ppDBText173: TppDBText
        UserName = 'DBText106'
        AutoSize = True
        DataField = 'NUMERO'
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
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 3175
        BandType = 0
      end
      object ppDBText174: TppDBText
        UserName = 'DBText107'
        AutoSize = True
        DataField = 'CODESTADO'
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
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 3440
        BandType = 0
      end
      object ppDBText175: TppDBText
        UserName = 'DBText901'
        AutoSize = True
        DataField = 'CIDADE'
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
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 22490
        BandType = 0
      end
      object ppDBText176: TppDBText
        UserName = 'DBText109'
        AutoSize = True
        DataField = 'BAIRRO'
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
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel154: TppLabel
        UserName = 'Label73'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText177: TppDBText
        UserName = 'DBText110'
        AutoSize = True
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
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel155: TppLabel
        UserName = 'Label130'
        AutoSize = False
        Caption = 
          'Relatório Estatístico de Pagamento de Benefícios por Grupo - Mês' +
          ' : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        mmHeight = 5821
        mmLeft = 11642
        mmTop = 27781
        mmWidth = 152665
        BandType = 0
      end
      object ppDBText178: TppDBText
        UserName = 'DBText150'
        DataField = 'MES'
        DataPipeline = ppEstatBeneficioGRUPO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEstatBeneficioGRUPO'
        mmHeight = 5821
        mmLeft = 165100
        mmTop = 27781
        mmWidth = 20638
        BandType = 0
      end
      object ppLine68: TppLine
        UserName = 'Line45'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 34131
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppShape39: TppShape
        UserName = 'Shape35'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText179: TppDBText
        UserName = 'DBText153'
        DataField = 'IDBENEFICIO'
        DataPipeline = ppEstatBeneficioGRUPO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstatBeneficioGRUPO'
        mmHeight = 3175
        mmLeft = 10848
        mmTop = 794
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText180: TppDBText
        UserName = 'DBText160'
        DataField = 'CODBENEFSPC'
        DataPipeline = ppEstatBeneficioGRUPO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstatBeneficioGRUPO'
        mmHeight = 3175
        mmLeft = 23019
        mmTop = 794
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText181: TppDBText
        UserName = 'DBText161'
        DataField = 'BENEFICIO'
        DataPipeline = ppEstatBeneficioGRUPO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEstatBeneficioGRUPO'
        mmHeight = 3175
        mmLeft = 34396
        mmTop = 794
        mmWidth = 58208
        BandType = 4
      end
      object ppDBText182: TppDBText
        UserName = 'DBText164'
        DataField = 'VALOR_ABONO'
        DataPipeline = ppEstatBeneficioGRUPO
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstatBeneficioGRUPO'
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText183: TppDBText
        UserName = 'DBText165'
        DataField = 'QUANTIDADE_ABONO'
        DataPipeline = ppEstatBeneficioGRUPO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstatBeneficioGRUPO'
        mmHeight = 3175
        mmLeft = 163248
        mmTop = 794
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText184: TppDBText
        UserName = 'DBText162'
        DataField = 'QUANTIDADE_ATRASADO'
        DataPipeline = ppEstatBeneficioGRUPO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstatBeneficioGRUPO'
        mmHeight = 3175
        mmLeft = 129382
        mmTop = 794
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText185: TppDBText
        UserName = 'DBText166'
        DataField = 'VALOR_ATRASADO'
        DataPipeline = ppEstatBeneficioGRUPO
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstatBeneficioGRUPO'
        mmHeight = 3175
        mmLeft = 144463
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText186: TppDBText
        UserName = 'DBText167'
        DataField = 'QUANTIDADE_MES'
        DataPipeline = ppEstatBeneficioGRUPO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstatBeneficioGRUPO'
        mmHeight = 3175
        mmLeft = 93927
        mmTop = 794
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText187: TppDBText
        UserName = 'DBText168'
        DataField = 'VALOR_MES'
        DataPipeline = ppEstatBeneficioGRUPO
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstatBeneficioGRUPO'
        mmHeight = 3175
        mmLeft = 106363
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppLine69: TppLine
        UserName = 'Line46'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 21960
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine70: TppLine
        UserName = 'Line49'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 33602
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine71: TppLine
        UserName = 'Line51'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 92869
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine72: TppLine
        UserName = 'Line52'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 128323
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine73: TppLine
        UserName = 'Line53'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 162190
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
    end
    object ppFooterBand10: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppSystemVariable13: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2910
        mmWidth = 197380
        BandType = 8
      end
      object ppLine74: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel156: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Estatístico de Benefícios'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable14: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = ANSI_CHARSET
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
    object ppSummaryBand7: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup17: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = ppEstatBeneficioGRUPO
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group14'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEstatBeneficioGRUPO'
      object ppGroupHeaderBand17: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppShape40: TppShape
          UserName = 'Shape32'
          Brush.Color = clSilver
          ParentHeight = True
          ParentWidth = True
          mmHeight = 5292
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText188: TppDBText
          UserName = 'DBText151'
          AutoSize = True
          DataField = 'PATROCINADORA'
          DataPipeline = ppEstatBeneficioGRUPO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 4233
          mmLeft = 28840
          mmTop = 529
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object ppLabel157: TppLabel
          UserName = 'Label157'
          Caption = 'Patrocinadora: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1852
          mmTop = 529
          mmWidth = 26194
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand16: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppShape41: TppShape
          UserName = 'Shape38'
          ParentWidth = True
          mmHeight = 4498
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel158: TppLabel
          UserName = 'Label153'
          Caption = 'Total da Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 26194
          mmTop = 529
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc27: TppDBCalc
          UserName = 'DBCalc21'
          DataField = 'QUANTIDADE_MES'
          DataPipeline = ppEstatBeneficioGRUPO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup17
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 3175
          mmLeft = 93927
          mmTop = 529
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc28: TppDBCalc
          UserName = 'DBCalc22'
          DataField = 'VALOR_MES'
          DataPipeline = ppEstatBeneficioGRUPO
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup17
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 3175
          mmLeft = 106363
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc29: TppDBCalc
          UserName = 'DBCalc23'
          DataField = 'QUANTIDADE_ATRASADO'
          DataPipeline = ppEstatBeneficioGRUPO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup17
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 3175
          mmLeft = 129382
          mmTop = 529
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc30: TppDBCalc
          UserName = 'DBCalc24'
          DataField = 'VALOR_ATRASADO'
          DataPipeline = ppEstatBeneficioGRUPO
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup17
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 3175
          mmLeft = 144463
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc31: TppDBCalc
          UserName = 'DBCalc25'
          DataField = 'QUANTIDADE_ABONO'
          DataPipeline = ppEstatBeneficioGRUPO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup17
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 3175
          mmLeft = 163777
          mmTop = 529
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc32: TppDBCalc
          UserName = 'DBCalc201'
          DataField = 'VALOR_ABONO'
          DataPipeline = ppEstatBeneficioGRUPO
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup17
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 3175
          mmLeft = 177800
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLine75: TppLine
          UserName = 'Line65'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 92869
          mmTop = 0
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object ppLine76: TppLine
          UserName = 'Line66'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 128323
          mmTop = 0
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object ppLine77: TppLine
          UserName = 'Line67'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 162190
          mmTop = 0
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup18: TppGroup
      BreakName = 'PLANO'
      DataPipeline = ppEstatBeneficioGRUPO
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group15'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEstatBeneficioGRUPO'
      object ppGroupHeaderBand18: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppShape46: TppShape
          UserName = 'Shape46'
          ParentHeight = True
          ParentWidth = True
          mmHeight = 5821
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel176: TppLabel
          UserName = 'Label133'
          Caption = 'Plano :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1852
          mmTop = 529
          mmWidth = 11906
          BandType = 3
          GroupNo = 1
        end
        object ppDBText190: TppDBText
          UserName = 'DBText190'
          AutoSize = True
          DataField = 'PLANO'
          DataPipeline = ppEstatBeneficioGRUPO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 4233
          mmLeft = 28840
          mmTop = 529
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand17: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppShape42: TppShape
          UserName = 'Shape37'
          ParentWidth = True
          mmHeight = 4498
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object ppLabel159: TppLabel
          UserName = 'Label152'
          Caption = 'Total do Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 26194
          mmTop = 529
          mmWidth = 19050
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc33: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'QUANTIDADE_MES'
          DataPipeline = ppEstatBeneficioGRUPO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup18
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 3175
          mmLeft = 93927
          mmTop = 529
          mmWidth = 11377
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc34: TppDBCalc
          UserName = 'DBCalc103'
          DataField = 'VALOR_MES'
          DataPipeline = ppEstatBeneficioGRUPO
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup18
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 3175
          mmLeft = 106363
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc35: TppDBCalc
          UserName = 'DBCalc17'
          DataField = 'QUANTIDADE_ATRASADO'
          DataPipeline = ppEstatBeneficioGRUPO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup18
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 3175
          mmLeft = 129382
          mmTop = 529
          mmWidth = 11377
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc36: TppDBCalc
          UserName = 'DBCalc18'
          DataField = 'VALOR_ATRASADO'
          DataPipeline = ppEstatBeneficioGRUPO
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup18
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 3175
          mmLeft = 144463
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc37: TppDBCalc
          UserName = 'DBCalc19'
          DataField = 'QUANTIDADE_ABONO'
          DataPipeline = ppEstatBeneficioGRUPO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup18
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 3175
          mmLeft = 163777
          mmTop = 529
          mmWidth = 11377
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc38: TppDBCalc
          UserName = 'DBCalc20'
          DataField = 'VALOR_ABONO'
          DataPipeline = ppEstatBeneficioGRUPO
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup18
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 3175
          mmLeft = 177800
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppLine78: TppLine
          UserName = 'Line62'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 92869
          mmTop = 0
          mmWidth = 1588
          BandType = 5
          GroupNo = 1
        end
        object ppLine79: TppLine
          UserName = 'Line63'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 128323
          mmTop = 0
          mmWidth = 1588
          BandType = 5
          GroupNo = 1
        end
        object ppLine80: TppLine
          UserName = 'Line64'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 162190
          mmTop = 0
          mmWidth = 1588
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup19: TppGroup
      BreakName = 'GRUPO'
      DataPipeline = ppEstatBeneficioGRUPO
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group16'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEstatBeneficioGRUPO'
      object ppGroupHeaderBand19: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14552
        mmPrintPosition = 0
        object ppShape43: TppShape
          UserName = 'Shape33'
          ParentWidth = True
          mmHeight = 6085
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 2
        end
        object ppShape44: TppShape
          UserName = 'Shape34'
          ParentWidth = True
          mmHeight = 8731
          mmLeft = 0
          mmTop = 5821
          mmWidth = 197300
          BandType = 3
          GroupNo = 2
        end
        object ppLabel160: TppLabel
          UserName = 'Label134'
          Caption = 'Cód.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 15346
          mmTop = 6879
          mmWidth = 5821
          BandType = 3
          GroupNo = 2
        end
        object ppLabel161: TppLabel
          UserName = 'Label135'
          Caption = 'Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 9790
          mmTop = 10583
          mmWidth = 11377
          BandType = 3
          GroupNo = 2
        end
        object ppLabel162: TppLabel
          UserName = 'Label136'
          Caption = 'Cód.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 26988
          mmTop = 6879
          mmWidth = 5821
          BandType = 3
          GroupNo = 2
        end
        object ppLabel163: TppLabel
          UserName = 'Label137'
          Caption = 'SPC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 26988
          mmTop = 10583
          mmWidth = 5821
          BandType = 3
          GroupNo = 2
        end
        object ppLabel164: TppLabel
          UserName = 'Label138'
          Caption = 'Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 34396
          mmTop = 6879
          mmWidth = 11377
          BandType = 3
          GroupNo = 2
        end
        object ppDBText189: TppDBText
          UserName = 'DBText163'
          DataField = 'SITUACAO'
          DataPipeline = ppEstatBeneficioGRUPO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 3175
          mmLeft = 181769
          mmTop = 794
          mmWidth = 13229
          BandType = 3
          GroupNo = 2
        end
        object ppLabel168: TppLabel
          UserName = 'Label139'
          Caption = 'Mês Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 93927
          mmTop = 6615
          mmWidth = 15346
          BandType = 3
          GroupNo = 2
        end
        object ppLabel169: TppLabel
          UserName = 'Label140'
          Caption = 'Concedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 110861
          mmTop = 6350
          mmWidth = 14288
          BandType = 3
          GroupNo = 2
        end
        object ppLabel170: TppLabel
          UserName = 'Label143'
          Caption = 'Cancelados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 147638
          mmTop = 6350
          mmWidth = 14288
          BandType = 3
          GroupNo = 2
        end
        object ppLabel175: TppLabel
          UserName = 'Label150'
          Caption = 'Benefícios '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 166688
          mmTop = 794
          mmWidth = 14552
          BandType = 3
          GroupNo = 2
        end
        object ppLine81: TppLine
          UserName = 'Line54'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8731
          mmLeft = 21960
          mmTop = 5821
          mmWidth = 1058
          BandType = 3
          GroupNo = 2
        end
        object ppLine82: TppLine
          UserName = 'Line55'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8731
          mmLeft = 33602
          mmTop = 5822
          mmWidth = 794
          BandType = 3
          GroupNo = 2
        end
        object ppLine83: TppLine
          UserName = 'Line56'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8731
          mmLeft = 92869
          mmTop = 5821
          mmWidth = 1058
          BandType = 3
          GroupNo = 2
        end
        object ppDBText192: TppDBText
          UserName = 'DBText192'
          AutoSize = True
          DataField = 'GRUPO'
          DataPipeline = ppEstatBeneficioGRUPO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 4233
          mmLeft = 28840
          mmTop = 1058
          mmWidth = 17198
          BandType = 3
          GroupNo = 2
        end
        object ppLabel178: TppLabel
          UserName = 'Label178'
          Caption = 'Tipo : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1852
          mmTop = 529
          mmWidth = 10848
          BandType = 3
          GroupNo = 2
        end
        object ppLabel165: TppLabel
          UserName = 'Label165'
          Caption = 'no Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 112448
          mmTop = 10583
          mmWidth = 8996
          BandType = 3
          GroupNo = 2
        end
        object ppLabel167: TppLabel
          UserName = 'Label167'
          Caption = 'Cancelados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 130175
          mmTop = 7144
          mmWidth = 14552
          BandType = 3
          GroupNo = 2
        end
        object ppLabel171: TppLabel
          UserName = 'Label171'
          Caption = 'no Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 129911
          mmTop = 11377
          mmWidth = 8996
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand18: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppShape45: TppShape
          UserName = 'Shape36'
          ParentHeight = True
          ParentWidth = True
          mmHeight = 4498
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 2
        end
        object ppDBText191: TppDBText
          UserName = 'DBText169'
          DataField = 'SITUACAO'
          DataPipeline = ppEstatBeneficioGRUPO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 3175
          mmLeft = 54769
          mmTop = 529
          mmWidth = 13229
          BandType = 5
          GroupNo = 2
        end
        object ppLabel177: TppLabel
          UserName = 'Label1501'
          Caption = 'Total de Benefícios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 26194
          mmTop = 529
          mmWidth = 25400
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc39: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'QUANTIDADE_MES'
          DataPipeline = ppEstatBeneficioGRUPO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup19
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 3175
          mmLeft = 93927
          mmTop = 529
          mmWidth = 11377
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc40: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'VALOR_MES'
          DataPipeline = ppEstatBeneficioGRUPO
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup19
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 3175
          mmLeft = 106363
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc41: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'QUANTIDADE_ATRASADO'
          DataPipeline = ppEstatBeneficioGRUPO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup19
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 3175
          mmLeft = 129382
          mmTop = 529
          mmWidth = 11377
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc42: TppDBCalc
          UserName = 'DBCalc101'
          DataField = 'VALOR_ATRASADO'
          DataPipeline = ppEstatBeneficioGRUPO
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup19
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 3175
          mmLeft = 144463
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc43: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'QUANTIDADE_ABONO'
          DataPipeline = ppEstatBeneficioGRUPO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup19
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 3175
          mmLeft = 163777
          mmTop = 529
          mmWidth = 11377
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc44: TppDBCalc
          UserName = 'DBCalc102'
          DataField = 'VALOR_ABONO'
          DataPipeline = ppEstatBeneficioGRUPO
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup19
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEstatBeneficioGRUPO'
          mmHeight = 3175
          mmLeft = 177800
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppLine86: TppLine
          UserName = 'Line59'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 92869
          mmTop = 0
          mmWidth = 1058
          BandType = 5
          GroupNo = 2
        end
        object ppLine87: TppLine
          UserName = 'Line60'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 128323
          mmTop = 0
          mmWidth = 1058
          BandType = 5
          GroupNo = 2
        end
        object ppLine88: TppLine
          UserName = 'Line61'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 162190
          mmTop = 0
          mmWidth = 1058
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object dsContribPlano: TDataSource
    DataSet = qryContribPlano
    Left = 472
    Top = 235
  end
  object qryContribPlano: TwwQuery
    AfterScroll = qryContribPlanoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.MATRICULA,'
      '       H.IDPESSOA,'
      '       H.NUMRECEBIMENTO,'
      '       H.MESREFERENCIA,'
      '       H.DATARECEBIMENTO,'
      '       H.IDMOTIVO,'
      '       H.VALOROP1,'
      '       H.IDCONTRIBUICAO,'
      '       PP.NOME PLANO,'
      '       H.MESCOBRANCA,'
      '       NVL(H.SALCONTRIB, 0),'
      
        '       DECODE(H.FLGDEVOLUCAO, 0, H.VALORESPERADO, -H.VALORESPERA' +
        'DO) VALORESPERADO,'
      
        '       DECODE(H.FLGDEVOLUCAO, 0, H.VALORRECEBIDO, -H.VALORRECEBI' +
        'DO) VALORRECEBIDO,'
      
        '       SUM(DECODE(HA.FLGTIPO, '#39'A'#39', HA.VALOR, -HA.VALOR)) ALTERAD' +
        'OR,'
      '       C.NOME CONTRIBUICAO'
      '  FROM HSTCONTRIBPREV H'
      '  LEFT JOIN HSTATRASOCONTRIB HA'
      '    ON HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO'
      '   AND HA.MESREFERENCIA = H.MESREFERENCIA'
      '   AND HA.MESCOBRANCA = H.MESCOBRANCA'
      '   AND HA.IDMOTIVO = H.IDMOTIVO'
      '  JOIN ELEGPATRO E'
      '    ON H.IDPESSOA = E.IDPESSOA'
      '  JOIN CONTRIBUICAO C'
      '    ON H.IDCONTRIBUICAO = C.IDCONTRIBUICAO'
      '  LEFT JOIN PLANPREV PP'
      '    ON H.IDPLANOPREV = PP.IDPLANOPREV'
      ' WHERE  '
      '    E.IDPESSOA = H.IDPESSOA'
      '    AND 1 = 2'
      'GROUP BY E.MATRICULA,'
      '       H.IDPESSOA,'
      '       H.NUMRECEBIMENTO,'
      '       H.MESREFERENCIA,'
      '       H.DATARECEBIMENTO,'
      '       H.IDMOTIVO,'
      '       H.VALOROP1,'
      '       H.IDCONTRIBUICAO,'
      '       PP.NOME ,'
      '       H.MESCOBRANCA,'
      '       NVL(H.SALCONTRIB, 0),'
      
        '       DECODE(H.FLGDEVOLUCAO, 0, H.VALORESPERADO, -H.VALORESPERA' +
        'DO) ,'
      
        '       DECODE(H.FLGDEVOLUCAO, 0, H.VALORRECEBIDO, -H.VALORRECEBI' +
        'DO) ,'
      '       C.NOME ')
    ValidateWithMask = True
    Left = 525
    Top = 235
    object qryContribPlanoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryContribPlanoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryContribPlanoNUMRECEBIMENTO: TFloatField
      FieldName = 'NUMRECEBIMENTO'
    end
    object qryContribPlanoMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryContribPlanoDATARECEBIMENTO: TDateTimeField
      FieldName = 'DATARECEBIMENTO'
    end
    object qryContribPlanoIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
    end
    object qryContribPlanoVALOROP1: TFloatField
      FieldName = 'VALOROP1'
    end
    object qryContribPlanoIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
    end
    object qryContribPlanoPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object qryContribPlanoMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryContribPlanoNVLHSALCONTRIB0: TFloatField
      FieldName = 'NVL(H.SALCONTRIB,0)'
    end
    object qryContribPlanoVALORESPERADO: TFloatField
      FieldName = 'VALORESPERADO'
    end
    object qryContribPlanoVALORRECEBIDO: TFloatField
      FieldName = 'VALORRECEBIDO'
    end
    object qryContribPlanoALTERADOR: TFloatField
      FieldName = 'ALTERADOR'
    end
    object qryContribPlanoCONTRIBUICAO: TStringField
      FieldName = 'CONTRIBUICAO'
      Size = 60
    end
  end
  object ppContribPlano: TppDBPipeline
    DataSource = dsContribPlano
    UserName = 'ContribPlano'
    Left = 473
    Top = 283
    object ppContribPlanoppField1: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppContribPlanoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppContribPlanoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMRECEBIMENTO'
      FieldName = 'NUMRECEBIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppContribPlanoppField4: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 3
    end
    object ppContribPlanoppField5: TppField
      FieldAlias = 'DATARECEBIMENTO'
      FieldName = 'DATARECEBIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object ppContribPlanoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDMOTIVO'
      FieldName = 'IDMOTIVO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppContribPlanoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOROP1'
      FieldName = 'VALOROP1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppContribPlanoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRIBUICAO'
      FieldName = 'IDCONTRIBUICAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppContribPlanoppField9: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 8
    end
    object ppContribPlanoppField10: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 9
    end
    object ppContribPlanoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'NVL(H.SALCONTRIB,0)'
      FieldName = 'NVL(H.SALCONTRIB,0)'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppContribPlanoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORESPERADO'
      FieldName = 'VALORESPERADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppContribPlanoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRECEBIDO'
      FieldName = 'VALORRECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppContribPlanoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'ALTERADOR'
      FieldName = 'ALTERADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppContribPlanoppField15: TppField
      FieldAlias = 'CONTRIBUICAO'
      FieldName = 'CONTRIBUICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 14
    end
  end
  object rpContribPlano: TppReport
    AutoStop = False
    DataPipeline = ppContribPlano
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5000
    PrinterSetup.mmMarginLeft = 2500
    PrinterSetup.mmMarginRight = 2500
    PrinterSetup.mmMarginTop = 5000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 260000
    PrinterSetup.PaperSize = 256
    Template.FileName = 
      'C:\Users\william.santana\Desktop\Relatorio Analítico de Contribu' +
      'ição por - Cópia.rtm'
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 525
    Top = 283
    Version = '7.04'
    mmColumnWidth = 185000
    DataPipelineName = 'ppContribPlano'
    object ppTitleBand5: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand11: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 2381
      mmPrintPosition = 0
      object ppDBText193: TppDBText
        UserName = 'DBText2'
        DataField = 'MATRICULA'
        DataPipeline = ppContribPlano
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppContribPlano'
        mmHeight = 2498
        mmLeft = 265
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText194: TppDBText
        UserName = 'DBText3'
        DataField = 'IDPESSOA'
        DataPipeline = ppContribPlano
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppContribPlano'
        mmHeight = 2498
        mmLeft = 17727
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText195: TppDBText
        UserName = 'DBText4'
        DataField = 'NUMRECEBIMENTO'
        DataPipeline = ppContribPlano
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppContribPlano'
        mmHeight = 2498
        mmLeft = 33073
        mmTop = 0
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText196: TppDBText
        UserName = 'DBText8'
        DataField = 'DATARECEBIMENTO'
        DataPipeline = ppContribPlano
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppContribPlano'
        mmHeight = 2498
        mmLeft = 72761
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText197: TppDBText
        UserName = 'DBText9'
        DataField = 'IDMOTIVO'
        DataPipeline = ppContribPlano
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppContribPlano'
        mmHeight = 2498
        mmLeft = 92869
        mmTop = 0
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText198: TppDBText
        UserName = 'DBText10'
        DataField = 'VALOROP1'
        DataPipeline = ppContribPlano
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppContribPlano'
        mmHeight = 2498
        mmLeft = 107156
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
      object ppDBText199: TppDBText
        UserName = 'DBText12'
        DataField = 'VALORESPERADO'
        DataPipeline = ppContribPlano
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppContribPlano'
        mmHeight = 2498
        mmLeft = 135732
        mmTop = 0
        mmWidth = 25665
        BandType = 4
      end
      object ppDBText200: TppDBText
        UserName = 'DBText13'
        DataField = 'VALORRECEBIDO'
        DataPipeline = ppContribPlano
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppContribPlano'
        mmHeight = 2498
        mmLeft = 162719
        mmTop = 0
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText201: TppDBText
        UserName = 'DBText14'
        DataField = 'CONTRIBUICAO'
        DataPipeline = ppContribPlano
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppContribPlano'
        mmHeight = 2381
        mmLeft = 208492
        mmTop = 0
        mmWidth = 43921
        BandType = 4
      end
      object ppDBText202: TppDBText
        UserName = 'DBText6'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppContribPlano
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppContribPlano'
        mmHeight = 2498
        mmLeft = 57679
        mmTop = 0
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText203: TppDBText
        UserName = 'DBText5'
        DataField = 'NVL(H.SALCONTRIB,0)'
        DataPipeline = ppContribPlano
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppContribPlano'
        mmHeight = 2498
        mmLeft = 116417
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText204: TppDBText
        UserName = 'DBText11'
        DataField = 'ALTERADOR'
        DataPipeline = ppContribPlano
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppContribPlano'
        mmHeight = 2381
        mmLeft = 186532
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
    end
    object ppFooterBand11: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppLabel188: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Relatório - Analítico de Contribuições por Plano'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 2381
        mmLeft = 1058
        mmTop = 1852
        mmWidth = 53711
        BandType = 8
      end
      object ppSystemVariable15: TppSystemVariable
        UserName = 'SystemVariable3'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2879
        mmLeft = 232569
        mmTop = 1323
        mmWidth = 20638
        BandType = 8
      end
      object ppLine84: TppLine
        UserName = 'Line2'
        Pen.Style = psDot
        Pen.Width = 0
        Weight = 0.125
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 253471
        BandType = 8
      end
    end
    object ppSummaryBand8: TppSummaryBand
      AfterPrint = ppSummaryBand8AfterPrint
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
    end
    object ppGroup20: TppGroup
      BreakName = 'GRUPO'
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand20: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 38894
        mmPrintPosition = 0
        object ppLabel189: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'RELATÓRIO - ANALÍTICO DE CONTRIBUIÇÕES POR PLANO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 0
          mmTop = 15081
          mmWidth = 255059
          BandType = 3
          GroupNo = 0
        end
        object ppLabel190: TppLabel
          UserName = 'Label25'
          AutoSize = False
          Caption = 'DIBEN/GECAD/COARI'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 29369
          mmWidth = 255059
          BandType = 3
          GroupNo = 0
        end
        object ppLabel191: TppLabel
          UserName = 'Label16'
          AutoSize = False
          Caption = 'FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 14
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 6085
          mmLeft = 0
          mmTop = 529
          mmWidth = 255059
          BandType = 3
          GroupNo = 0
        end
        object ppLabel192: TppLabel
          UserName = 'Label20'
          AutoSize = False
          Caption = 
            'SCN, Quadra 2, Bloco A Edifício Corporate Financial Center 12º e' +
            ' 13º Andares'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 7144
          mmWidth = 255059
          BandType = 3
          GroupNo = 0
        end
        object ppLabel193: TppLabel
          UserName = 'Label201'
          AutoSize = False
          Caption = 'Brasília  DF CEP 70.712-900 - (61) 3329-1700 - www.funcef.com.br'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 11642
          mmWidth = 255059
          BandType = 3
          GroupNo = 0
        end
        object ppImage1: TppImage
          UserName = 'Image1'
          DirectDraw = True
          MaintainAspectRatio = False
          Stretch = True
          Picture.Data = {
            07544269746D6170D6A90000424DD6A90000000000003604000028000000C800
            0000D40000000100080000000000A0A50000232E0000232E0000000100000000
            00006A4F4D006B504E006B514F006C514F006D5351006D5250006F5453006F55
            53006E5452006F555400705654007157550072585600735A5800745B5900745B
            5A00765D5B00775E5D00765D5C00785F5E0079615F0078605E007B6361007A62
            60007B6462007C6463007E6765007E6665007D6564007F6866002DA0D5002FA0
            D50030A1D50034A3D60036A4D6003AA5D70039A5D7003CA6D7003EA7D80041A9
            D80041A8D80043A9D90047ABDA004AADDA004DAEDB004FAFDB0057B3DD0055B2
            DC0053B0DC005DB5DE005EB6DE005FB6DF0058B3DD0060B7DF0064B8DF0062B8
            DF0066B9E00069BBE0006BBCE1006DBCE1006EBDE10072BFE20077C1E30074C0
            E3007EC4E5007AC3E40080696700826B6900836C6A00836D6B00826C6A00846E
            6D0086706E0085706E0087716F0088727100897473008B7674008A7574008C77
            76008C7876008D7877008F7B79008D797700927E7D00907C7A0093807F009480
            7F0095828100978583009987850098868400998685009B8887009C8B89009E8C
            8B009F8E8D00A08F8E00A1908F00A2929100A5959300A4949300A7979500A493
            9200A8989700A9999800AA9B9A00A99A9900AB9C9B00AD9E9D00AEA09F00AEA0
            9E00AFA1A000B0A2A100B2A4A300B3A5A400B4A6A500B4A7A600B5A7A600B5A8
            A700B6A9A800B7AAA900B7ABAA00B8ABAA00B9ACAB00BAAEAD00BCB0AF00BEB2
            B100BFB4B30081C5E50084C7E50086C8E6008BCAE70089C9E7008ECBE70096CF
            E90097CFE90095CEE9009AD1EA009ED3EB00A1D4EC00A6D6EC00A9D7ED00AEDA
            EE00ADD9EE00AAD8ED00B2DBEF00B6DEF000B9DFF000C2B7B700C2B7B600C1B5
            B500C3B8B700C3B9B800C5BAB900C5BBBA00C6BBBB00C4B9B900C6BCBB00C8BE
            BD00C8BEBE00CBC2C100CBC2C200CCC3C200CCC3C300CFC6C500CFC7C600CFC6
            C600CDC4C300D0C8C700D1C9C800D2CACA00D3CBCA00D2CAC900D4CDCC00D4CC
            CC00D5CECD00D6CFCF00D7D0D000D8D1D100DAD3D300D9D3D200DCD6D500DBD5
            D500DED8D700DFD9D900DFDAD900C6E5F300CCE7F400CEE8F400D2EAF500D7EC
            F600D4EBF500DBEEF700DBEFF700D9EDF700DDEFF800DEF0F800E0DBDA00E1DC
            DB00E2DDDD00E4E0DF00E7E3E200E6E2E200E6E1E100E8E4E300E9E4E400EAE6
            E600EBE7E700E9E6E500EBE8E800ECE8E800EEEBEB00EFECEC00E6F3F900E7F4
            FA00E7F4F900E3F2F800EAF5FA00EDF7FB00EDF6FB00EEF7FB00F0EDED00F1EF
            EE00F2EFEF00F2F0F000F3F1F100F4F2F200F6F5F500F7F6F500F7F6F600F5F4
            F400F3F9FC00F1F8FC00F5FAFC00F6FBFD00F4F9FC00F9F7F700F8F7F700F9F8
            F800FAF9F900FBFAFA00F8FBFD00F9FCFD00F8FCFD00FBFDFE00FCFBFB00FCFC
            FC00FDFCFC00FDFDFD00FDFEFE00FEFDFD00FEFEFE00FFFFFF00FCFDFE00FCFC
            FB00FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFCE1B097726A666C7499B4E6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDF8C99F786C686C779FCCFBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFD564444444444444444A4FDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDE37E4B0200000000000000000004559EEFFDFDFDFDFDFD
            FDFDFDFD524444444444444449F6FDFDFDFDFDFDFDFD6C4444444444444444B6
            FDFDFDFDFDFDFDFDFDFCC665100000000000000000001671D5FDFDFDFDFDFDFD
            FDFDEF4644444444444444444444444444444444444444444444A5FDFDFDEE44
            4444444444444444C9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF87D0D0000000000000000000000000000
            0018A5FDFDFDFDFDFDFDFDFD140000000000000004F6FDFDFDFDFDFDFDB20000
            00000000000000AEFDFDFDFDFDFDFDFDD15B0000000000000000000000000000
            0A7CF9FDFDFDFDFDFDFDED000000000000000000000000000000000000000000
            00009AFDFDFDE5000000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
            00000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE6540000000000000000
            00000000000000000000006EFCFDFDFDFDFDFDFD140000000000000004F6FDFD
            FDFDFDFDEE1C000000000000000000AEFDFDFDFDFDFDFC9E0A00000000000000
            0000000000000000000059E6FDFDFDFDFDFDED00000000000000000000000000
            000000000000000000009AFDFDFDE5000000000000000000BAFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF95800
            00000000000000000000000000000000000000007CFDFDFDFDFDFDFD14000000
            0000000004F6FDFDFDFDFDFD6C00000000000000000000AEFDFDFDFDFDFD7D01
            0000000000000000000000000000000000000054F1FDFDFDFDFDED0000000000
            0000000000000000000000000000000000009AFDFDFDE5000000000000000000
            BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFD980000000000000000000000000000000000000000000005CCFDFD
            FDFDFDFD140000000000000004F6FDFDFDFDFDB80200000000000000000000AE
            FDFDFDFDFDA3000000000000000000000000000000000000000000006CFDFDFD
            FDFDED00000000000000000000000000000000000000000000009AFDFDFDE500
            0000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDF617000000000000000000000000000000000000
            00000000005EFDFDFDFDFDFD140000000000000004F6FDFDFDFDF14500000000
            00000000000000AEFDFDFDFDD40C000000000000000000000000000000000000
            0000000001C6FDFDFDFDED000000000000000000000000000000000000000000
            00009AFDFDFDE5000000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
            00000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDAC0000000000000000000258
            747C704C00000000000000000004E3FDFDFDFDFD140000000000000004F6FDFD
            FDFD74000000000000000000000000AEFDFDFDFD60000000000000000000085F
            809F7B4800000000000000000057FDFDFDFDED0000000000000000001D484848
            48484848484848484848A9FDFDFDE5000000000000000000BAFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD66000000
            000000000004B1FDFDFDFDFC7C000000000000000000A1FDFDFDFDFD14000000
            0000000004F6FDFDFDC904000000000000000000000000AEFDFDFDD202000000
            000000000042CDFDFDFDFDF970000000000000000001CFFDFDFDED0000000000
            00000000B6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE5000000000000000000
            BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFD4B000000000000000066FDFDFDFDFDFDFB4600000000000000006CFD
            FDFDFDFD140000000000000004F6FDFDF74C00000000000000000000000000AE
            FDFDFD78000000000000000008CDFDFDFDFDFDFDFC4D00000000000000007EFD
            FDFDED000000000000000000B6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE500
            0000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFC0C0000000000000000A9FDFDFDFDFDFDFD6D0000
            00000000000057FDFDFDFDFD140000000000000004F7FDFD7D00000000000000
            00000000000000AEFDFDFD4E000000000000000065FDFDFDFDFDFDFDFDA80000
            0000000000005BFDFDFDED000000000000000000B6FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDE5000000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
            00000005070707070707070707A4FDFDFDFDFDE4000000000000000000C8FDFD
            FDFDFDFDFD97000000000000000047FDFDFDFDFD14000000000000000DFCFDD1
            070000000000000000000000000000AEFDFDF0040000000000000000AEFDFDFD
            FDFDFDFDFDE300000000000000001BFDFDFDED000000000000000000B6FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDE50000000000000000000807070707070707
            0707CEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFD1A000000000000000000000000000000000000A1FDFDFDFDFDDE00000000
            0000000000CBFDFDFDFDFDFDFD9A000000000000000019FDFDFDFDFD14000000
            0000000014FDFB55000000000000000000000000000000AEFDFDCB0000000000
            00000000E1FDFDFDFDFDFDFDFDFCCFCFCFCFCFCFCFCFD0FCFDFDED0000000000
            000000000C0E0E0E0E0E0E0E0E0E0E58FDFDFDFDFDFDE5000000000000000000
            00000000000000000000CDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFD1A000000000000000000000000000000000000A1FDFD
            FDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C000000000000000016FD
            FDFDFDFD140000000000000042FD9800000000000000000000000000000000AE
            FDFDB000000000000000000AF9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDED000000000000000000000000000000000000000051FDFDFDFDFDFDE500
            000000000000000000000000000000000000CDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A00000000000000000000000000
            0000000000A1FDFDFDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C0000
            00000000000016FDFDFDFDFD14000000000000004AD40C000000000000005300
            00000000000000AEFDFDA1000000000000000011FDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDED000000000000000000000000000000000000000051
            FDFDFDFDFDFDE500000000000000000000000000000000000000CDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
            00000000000000000000000000A1FDFDFDFDFDD4000000000000000000CAFDFD
            FDFDFDFDFD9C000000000000000016FDFDFDFDFD140000000000000051590000
            000000000053980000000000000000AEFDFDA0000000000000000011FDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDED00000000000000000000000000
            0000000000000051FDFDFDFDFDFDE50000000000000000000000000000000000
            0000CDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFD1A000000000000000000000000000000000000A1FDFDFDFDFDD400000000
            0000000000CAFDFDFDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000
            000000000B0000000000000008CA7E0000000000000000AEFDFDA60000000000
            0000000BFBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDED0000000000
            00000000000000000000000000000051FDFDFDFDFDFDE5000000000000000000
            00000000000000000000CDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFD1A0000000000000000485A5A5A5A5A5A5A5A5AB6FDFD
            FDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C000000000000000016FD
            FDFDFDFD140000000000000000000000000000007CFD780000000000000000AE
            FDFDB8000000000000000000E2FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDED000000000000000000000000000000000000000051FDFDFDFDFDFDE500
            0000000000000000525A5A5A5A5A5A5A5A5ADEFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C0000
            00000000000016FDFDFDFDFD1400000000000000000000000000004AF6FD7000
            00000000000000AEFDFDE2000000000000000000B3FDFDFDFDFDFDFDFDEE6F6E
            6E6E6E6E6E6E9BFDFDFDED0000000000000000004E565656565656565656566D
            FDFDFDFDFDFDE5000000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
            00000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD4000000000000000000CAFDFD
            FDFDFDFDFD9C000000000000000016FDFDFDFDFD140000000000000000000000
            000005C8FDFD690000000000000000AEFDFDFD1D00000000000000006DFDFDFD
            FDFDFDFDFDC7000000000000000064FDFDFDED000000000000000000B6FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDE5000000000000000000BAFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD400000000
            0000000000CAFDFDFDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000
            0000000000000000000071FDFDFD640000000000000000AEFDFDFD6B00000000
            0000000012EEFDFDFDFDFDFDFD7900000000000000009AFDFDFDED0000000000
            00000000B6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE5000000000000000000
            BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C000000000000000016FD
            FDFDFDFD1400000000000000000000000043F0FDFDFD640000000000000000AE
            FDFDFDB90000000000000000006DFDFDFDFDFDFDDE110000000000000001D4FD
            FDFDED000000000000000000B6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE500
            0000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000066A6A6A6A6
            A6A6A6A6A6A6A6AAFCFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C0000
            00000000000016FDFDFDFDFD14000000000000000000000001B7FDFDFDFD6400
            00000000000000AEFDFDFDFD530000000000000000006ADFFCFDE49915000000
            000000000054FDFDFDFDED0000000000000000007AA6A6A6A6A6A6A6A6A6A6A6
            A6B2FDFDFDFDE50000000000000000007DA6A6A6A6A6A6A6A6A6A6A6B4FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
            00000000000000000000000000000007F9FDFDD4000000000000000000CAFDFD
            FDFDFDFDFD9C000000000000000016FDFDFDFDFD140000000000000000000000
            69FDFDFDFDFD640000000000000000AEFDFDFDFDC60200000000000000000003
            181B0400000000000000000000B1FDFDFDFDED00000000000000000000000000
            00000000000000000045FDFDFDFDE50000000000000000000000000000000000
            000000004DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFD1A000000000000000000000000000000000000000007F9FDFDD400000000
            0000000000CAFDFDFDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000
            0000000000000019E4FDFDFDFDFD640000000000000000AEFDFDFDFDFD710000
            000000000000000000000000000000000000000059FCFDFDFDFDED0000000000
            000000000000000000000000000000000045FDFDFDFDE5000000000000000000
            0000000000000000000000004DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFD1A000000000000000000000000000000000000000007
            F9FDFDD4000000000000000000CAFDFDFDFDFDFDFD9C000000000000000016FD
            FDFDFDFD1400000000000000000000AEFDFDFDFDFDFD640000000000000000AE
            FDFDFDFDFDF758000000000000000000000000000000000000000013DEFDFDFD
            FDFDED0000000000000000000000000000000000000000000045FDFDFDFDE500
            00000000000000000000000000000000000000004DFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A00000000000000000000000000
            0000000000000007F9FDFDD4000000000000000000CAFDFDFDFDFDFDFD9C0000
            00000000000016FDFDFDFDFD1400000000000000000062FCFDFDFDFDFDFD6400
            00000000000000AEFDFDFDFDFDFDF05800000000000000000000000000000000
            00000AB9FDFDFDFDFDFDED000000000000000000000000000000000000000000
            0045FDFDFDFDE50000000000000000000000000000000000000000004DFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
            00000000000000000000000000000007F9FDFDD4000000000000000000CAFDFD
            FDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000000000000011E2FD
            FDFDFDFDFDFD640000000000000000AEFDFDFDFDFDFDFDF77305000000000000
            00000000000000000016B8FDFDFDFDFDFDFDED00000000000000000000000000
            00000000000000000045FDFDFDFDE50000000000000000000000000000000000
            000000004DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFD1A000000000000000000000000000000000000000007F9FDFDD400000000
            0000000000CAFDFDFDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000
            0000000000A8FDFDFDFDFDFDFDFD640000000000000000AEFDFDFDFDFDFDFDFD
            FDCB600400000000000000000000001377E6FDFDFDFDFDFDFDFDED0000000000
            000000000000000000000000000000000045FDFDFDFDE5000000000000000000
            0000000000000000000000004DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDACA3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A5
            FCFDFDEFA3A3A3A3A3A3A3A3A3E5FDFDFDFDFDFDFDD0A3A3A3A3A3A3A3A3ABFD
            FDFDFDFDA9A3A3A3A3A3A3A3ADFCFDFDFDFDFDFDFDFDC6A3A3A3A3A3A3A3A3DF
            FDFDFDFDFDFDFDFDFDFDFDDF965A1907050911475A78B4F7FDFDFDFDFDFDFDFD
            FDFDF7A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3B0FDFDFDFDFFA4
            A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3B3FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFCF8F6F9FCFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE8DB
            DBDBDBDBDBDBDBDDFCFCDBDBDBDBDBDBDBDBDBE8FDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFCE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1F6FDFD
            FDEEE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E7FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDDDDBDBDBDBDBDBDBDBE8FDF5DBDBDBDBDBDBDBDBDB
            EBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
            0000000000ABFDFDFD7400000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
            1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
            1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
            1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
            FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
            1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
            FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
            87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
            0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
            1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
            1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
            1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
            FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
            1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
            FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
            87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
            0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
            1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
            1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
            1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
            FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
            1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
            FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
            87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
            0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
            1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
            1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
            1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
            FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
            1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
            FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
            87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
            0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
            1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
            1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
            1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
            FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
            1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
            FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
            87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
            0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
            1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
            1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
            1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
            FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
            1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
            FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
            87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
            0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
            1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
            1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
            1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
            FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
            1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
            FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
            87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
            0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
            1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
            1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
            1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
            FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
            1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
            FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
            87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
            0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
            1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
            1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
            1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
            FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
            1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
            FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
            87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
            0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
            1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
            1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
            1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
            FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
            1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
            FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
            87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
            0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
            1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
            1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
            1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
            FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
            1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
            FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
            87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
            0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
            1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
            1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
            1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
            FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
            1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
            FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
            87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
            0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
            1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFD361E1E1E1E1E1E1E1E22FCFA221E1E1E1E1E
            1E1E1E36FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFA231E1E1E1E
            1E1E1E1E35FDC41E1E1E1E1E1E1E1E1E86FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDEA231E1E1E1E1E1E1E1E2D
            FCFC2D1E1E1E1E1E1E1E1E23EAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDC01E1E1E1E1E1E1E1E1E41FDEC1F1E1E1E1E1E1E1E1E2EFCFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC851E1E
            1E1E1E1E1E1E1E82FDFD821E1E1E1E1E1E1E1E1E85FCFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
            FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF5351E1E1E1E1E1E1E1E1E8FFDFC341E1E1E1E1E1E1E1E
            1E92FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDEB841E1E1E1E1E1E1E1E1E1EBEFDFDC01E1E1E1E1E1E1E1E1E1E84EBFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
            0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDDA391E1E1E1E1E1E1E1E1E24E8FDFD8E
            1E1E1E1E1E1E1E1E1E208DFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC413E3E3E3E3E
            3E3E3E3E3E3E3E3E3E3E3C251E1E1E1E1E1E1E1E1E1E3BFCFDFDFC3B1E1E1E1E
            1E1E1E1E1E1E253B3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E41FDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDD83E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E38211E1E1E1E1E1E1E
            1E1E1E8AFDFDFDF22B1E1E1E1E1E1E1E1E1E1E2A3D3E3E3E3E3E3E3E3E3E3E3E
            3E3E3E3E88FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFC211E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E26D7FD
            FDFDFDD6261E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E21
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDC21E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
            1E1E1E1E1E1E1E1E1E1E2EF3FDFDFDFDBC201E1E1E1E1E1E1E1E1E1E1E1E1E1E
            1E1E1E1E1E1E1E1E1E1E1E1E32FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFC211E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
            1E1E1E1E22BDFDFDFDFDFDFDBD221E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
            1E1E1E1E1E1E1E21FDF907000000000000000000000000000000000000ABFDFD
            FD7500000000000000000000000000000000000050FDC21E1E1E1E1E1E1E1E1E
            1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2AD7FDFDFDFDFDFD901F1E1E1E1E1E
            1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E32FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC211E1E1E1E1E1E1E1E1E1E1E1E1E
            1E1E1E1E1E1E1E1E1E1E1E29BEFDFDFDFDFDFDFDFDBE291E1E1E1E1E1E1E1E1E
            1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E21FDF90700000000000000000000000000
            0000000000ABFDFDFD7500000000000000000000000000000000000050FDC21E
            1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2ED7FDFDFDFDFDFD
            FDFD93211E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E32FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC211E1E1E1E1E
            1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2040DDFDFDFDFDFDFDFDFDFDFDDB40
            201E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E21FDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDC21E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2487
            F3FDFDFDFDFDFDFDFDFDFDC4391E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
            1E1E1E1E32FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFC3731313131313131313131313131313131313131353D8CD6FDFDFDFDFDFD
            FDFDFDFDFDFDFDFDD68C3D333131313131313131313131313131313131313136
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDD93131313131313131313131313131313131
            31313135418FE9FDFDFDFDFDFDFDFDFDFDFDFDFDFCC3873A3231313131313131
            31313131313131313131313182FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
            FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
            0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
            FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDC4842F23232F84C5FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
            0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDBC402C222631
            8ADCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF3851F1E1E1E1E1E1E1F84F3FD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            DB3A1E1E1E1E1E1E1E248EFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF3381E1E1E1E
            1E1E1E1E1E1E38F4FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDDA2B1E1E1E1E1E1E1E1E1E1E84FCFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFD831E1E1E1E1E1E1E1E1E1E1E1E82FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
            FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFE311E1E1E1E1E1E1E1E1E1E1E1E8FFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDBF1E1E1E1E1E1E1E1E1E1E1E1E1E1EBFFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
            0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD8F1E1E1E1E1E1E1E1E1E
            1E1E1E1E25E8FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD811E1E1E1E1E1E1E1E1E1E1E1E1E1E
            81FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC2F1E
            1E1E1E1E1E1E1E1E1E1E1E1E1E91FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC2A1E1E1E1E1E1E
            1E1E1E1E1E1E1E1E2AFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDDC1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E3DFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            F2201E1E1E1E1E1E1E1E1E1E1E1E1E1E20F3FDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
            FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDBE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2FFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDEB1F1E1E1E1E1E1E1E1E1E1E1E1E1E1E1EEBFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
            0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDBD1E1E1E1E1E1E1E1E1E1E
            1E1E1E1E1E30FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC281E1E1E1E1E1E1E1E1E1E1E1E1E1E
            28FCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD71E1E
            1E1E1E1E1E1E1E1E1E1E1E1E1E39FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3F1E1E1E1E1E1E
            1E1E1E1E1E1E1E1E3FFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFC2B1E1E1E1E1E1E1E1E1E1E1E1E1E1E8BFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDBB1E1E1E1E1E1E1E1E1E1E1E1E1E1EBBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
            FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFD8A1E1E1E1E1E1E1E1E1E1E1E1E1E21DAFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFC391E1E1E1E1E1E1E1E1E1E1E1E3AFCFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
            0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDEA2A1E1E1E1E1E1E1E1E
            1E1E1E1E89FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDDC2C1E1E1E1E1E1E1E1E1E1E2CDC
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDBF
            231E1E1E1E1E1E1E1E1E1E39F5FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDDC361E1E1E
            1E1E1E1E1E36DCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDC32C1E1E1E1E1E1E1E1E81F2FDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFA9436211E1E213894FAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
            FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF48D2E1F1E1E233DBDFCFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF3D7D7F3FDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
            0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFCEAD6DAFE
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
            FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
            0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
            00000000000000000000000000ABFDFDFD750000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
            FD7700000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE60000000000000000000000000000
            0000000000B1FDFDFD7B00000000000000000000000000000000000043FCFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDB3000000000000
            00000000000000000000000000C9FDFDFD9E0000000000000000000000000000
            0000000003E3FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FD6500000000000000000000000000000000000005EFFDFDFDB9000000000000
            0000000000000000000000000096FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDCD040000000000000000000000000000000000004CFDFDFD
            FDF00700000000000000000000000000000000000018EEFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF14D000000000000000000000000000000
            0000000074FDFDFDFDFD580000000000000000000000000000000000000066FC
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF15E0000000000000000
            000000000000000000000001CEFDFDFDFDFDA100000000000000000000000000
            0000000000000079FCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD35200
            0000000000000000000000000000000000000056FDFDFDFDFDFDF11500000000
            0000000000000000000000000000000063E4FDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDF7C76A0A000000000000000000000000000000000000000000B7FDFDFDFD
            FDFDFD7F0000000000000000000000000000000000000000001179D1F9FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC1C14141414141414141414141414
            1414141414141414141414141414141414141414141414141414141414141414
            1414141414141414141509000000000000000000000000000000000000000000
            00005DFDFDFDFDFDFDFDFDF14200000000000000000000000000000000000000
            000000000C151414141414141414141414141414141414141414141414141414
            141414141414141414141414141414141414141414141414141414145BFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC060000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000DD5FDFDFDFDFDFDFDFDFDB40100000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFC060000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000A5FDFDFDFDFDFDFDFDFDFDFD710000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFC06000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000073FDFDFDFDFDFDFD
            FDFDFDFDFDF85800000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC0600000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000064
            FCFDFDFDFDFDFDFDFDFDFDFDFDFDEE5100000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC060000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000069F9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE45400000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFC060000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000037EFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            F164000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFC06000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000001DB6FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFCA00E0000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC0600000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000B76EFFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDDF670500000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000050FDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC060000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000001C
            78E2FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDCF6A0F
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFC441A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
            1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
            1A1A424C5E7DC7FBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDF1B373594A1D1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
            1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
            1A1A1A1A1A1A1A1A1A1A1A1A5EFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDE7B3967671799BB8F0FDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDEF9D5203000000000000000A5CAAF8FD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF6801200000000000000
            00000000000043AAFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD04E00
            000000000000000000000000000000005FE7FDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDB40F0000000000000000000000000000000000000046D3FDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDB40700000000000000000000000000000000000000
            000017D2FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDCD0E000000000000000000000000
            000000000000000000000043E6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF1480000000000
            000000000000000000000000000000000000000061FCFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FD7C000000000000000000000000000000000000000000000000000000B1FDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDE30D00000000000000000000000000000000000000000000
            00000000004BFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD7D000000000000000000000000000000
            0000000000000000000000000000B5FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC4700000000000000
            0000000000000000000000000000000000000000000063FDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD3
            00000000000000000000000000000000000000000000000000000000000011F9
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDA1000000000000000000000000000000000000000000000000
            00000000000000D1FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD7300000000000000000000000000000000
            000000000000000000000000000000AAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD650000000000000000
            000000000000000000000000000000000000000000000095FDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD60
            000000000000000000000000000000000000000000000000000000000000007F
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFD67000000000000000000000000000000000000000000000000
            0000000000000096FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD7100000000000000000000000000000000
            000000000000000000000000000000A9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDA00000000000000000
            0000000000000000000000000000000000000000000000CBFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDCE
            0000000000000000000000000000000000000000000000000000000000000EF8
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFC420000000000000000000000000000000000000000000000
            0000000000005FFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD77000000000000000000000000000000
            0000000000000000000000000000AFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE009000000000000
            00000000000000000000000000000000000000000046F9FDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FD72000000000000000000000000000000000000000000000000000000A9FDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDEE42000000000000000000000000000000000000000000
            000000005BFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDC707000000000000000000000000
            00000000000000000000001CE2FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDA703000000
            0000000000000000000000000000000000000ECBFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDA7070000000000000000000000000000000000000014C8FDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDC7420000000000000000000000000000000000
            55DEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDED720A00000000000000
            0000000000001598F9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            E079430000000000000000014F98EFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFCD3A27569656A7BAAE0FCFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FDFD}
          mmHeight = 16933
          mmLeft = 6085
          mmTop = 265
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLine85: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 33338
          mmWidth = 254530
          BandType = 3
          GroupNo = 0
        end
        object ppLabel194: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'MATRICULA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2498
          mmLeft = 265
          mmTop = 34131
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel195: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'IDPESSOA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2498
          mmLeft = 17727
          mmTop = 34131
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel196: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'N° RECEBIMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2498
          mmLeft = 33073
          mmTop = 34131
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppLabel197: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'MES REF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2498
          mmLeft = 58208
          mmTop = 34131
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppLabel198: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'DATA RECE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2498
          mmLeft = 72231
          mmTop = 34131
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppLabel199: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'MOTIVO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2498
          mmLeft = 93134
          mmTop = 34131
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppLabel200: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'PERC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2498
          mmLeft = 106627
          mmTop = 34131
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object ppLabel201: TppLabel
          UserName = 'Label11'
          AutoSize = False
          Caption = 'ALTERADOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2381
          mmLeft = 185738
          mmTop = 34131
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel202: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'VALOR ESPERADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2381
          mmLeft = 135732
          mmTop = 34131
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppLabel203: TppLabel
          UserName = 'Label13'
          AutoSize = False
          Caption = 'VALOR RECEBIDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2498
          mmLeft = 161661
          mmTop = 34131
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppLabel204: TppLabel
          UserName = 'Label14'
          AutoSize = False
          Caption = 'CONTRIBUICAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2381
          mmLeft = 208227
          mmTop = 34131
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object ppDBText205: TppDBText
          UserName = 'DBText1'
          DataField = 'MESCOBRANCA'
          DataPipeline = ppContribPlano
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppContribPlano'
          mmHeight = 4233
          mmLeft = 0
          mmTop = 24871
          mmWidth = 254794
          BandType = 3
          GroupNo = 0
        end
        object ppDBText206: TppDBText
          UserName = 'DBText7'
          DataField = 'PLANO'
          DataPipeline = ppContribPlano
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppContribPlano'
          mmHeight = 4233
          mmLeft = 265
          mmTop = 20373
          mmWidth = 254530
          BandType = 3
          GroupNo = 0
        end
        object ppLine89: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1323
          mmLeft = 0
          mmTop = 37042
          mmWidth = 254001
          BandType = 3
          GroupNo = 0
        end
        object ppLabel205: TppLabel
          UserName = 'Label15'
          AutoSize = False
          Caption = 'SAL CONTRIB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2498
          mmLeft = 115623
          mmTop = 34131
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand19: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object ppDBCalc45: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALORESPERADO'
          DataPipeline = ppContribPlano
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup20
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppContribPlano'
          mmHeight = 3969
          mmLeft = 157957
          mmTop = 529
          mmWidth = 24606
          BandType = 5
          GroupNo = 0
        end
        object ppLine90: TppLine
          UserName = 'Line4'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1323
          mmLeft = 0
          mmTop = 0
          mmWidth = 254001
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc46: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VALORRECEBIDO'
          DataPipeline = ppContribPlano
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup20
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppContribPlano'
          mmHeight = 3969
          mmLeft = 185738
          mmTop = 529
          mmWidth = 24606
          BandType = 5
          GroupNo = 0
        end
        object ppLabel206: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4191
          mmLeft = 136790
          mmTop = 265
          mmWidth = 18785
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
end
