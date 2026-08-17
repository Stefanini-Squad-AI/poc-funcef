inherited dtmRelatoriosAlmox: TdtmRelatoriosAlmox
  Left = 200
  Top = 78
  Width = 435
  Height = 394
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    SkipWhenNoRecords = False
    Left = 205
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
    Left = 118
  end
  inherited rpExemplo: TppReport
    PrinterSetup.mmMarginBottom = 14000
    Units = utMillimeters
    Left = 286
    DataPipelineName = 'pplExemplo'
  end
  object pplRequisicao: TppBDEPipeline
    DataSource = dsRequisicao
    UserName = 'lRequisicao'
    Left = 205
    Top = 72
  end
  object dsRequisicao: TwwDataSource
    DataSet = qryRequisicao
    Left = 118
    Top = 72
  end
  object qryRequisicao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+ rule */'
      '  AL.DESCALMOX AS ALMOXARIFADO,'
      '  SL.LOCALIZACAO,'
      '  M.NUMDOCUMENTO AS NUMERO,'
      '  M.DATAMOV,'
      '  M.CODCENTROCUSTO,'
      '  M.CODARTIGO,'
      '  PR.CODMEDCUSTO,'
      '  PR.DESCPROD || A.CODCOR || A.CODTAMANHO AS DESCRICAO,'
      '  M.QTDEMOV,'
      '  M.VALORMOV,'
      '  M.CUSTOMEDIOMOV,'
      '  M.CODTIPOMOV,'
      '  C.NOME,'
      '  M.NUMDOCUMENTO||M.CODCENTROCUSTO AS GRUPO'
      
        'FROM MOVIMENT M, SALDO SL,PRODUTO PR, TIPOMOV T, ARTIGO A, ALMOX' +
        ' AL,  CentCust c'
      'WHERE (1=2) and'
      '      M.DATAMOV >= TO_DATE('#39'01/08/1998'#39', '#39'DD/MM/YYYY'#39')'
      '  AND M.DATAMOV <= TO_DATE('#39'25/11/2001'#39', '#39'DD/MM/YYYY'#39')'
      '  AND T.ENTRADASAIDA = '#39'S'#39
      '  AND M.IDPESSOA = 1'
      '  AND C.IDEMPRESA = 1'
      '  AND A.CODARTIGO = M.CODARTIGO'
      '  AND A.CODPRODUTO = PR.CODPRODUTO'
      '  AND M.CODTIPOMOV = T.CODTIPOMOV'
      '  AND M.CODALMOXARIFADO = AL.CODALMOXARIFADO'
      '  AND M.CODCENTROCUSTO'#9'= C.CODCENTROCUSTO'
      '  AND (A.CODARTIGO(+)       = SL.CODARTIGO) '
      '  AND (Al.CODALMOXARIFADO(+)= SL.CODALMOXARIFADO )'
      ''
      'ORDER BY'
      ' ALMOXARIFADO, M.DATAMOV, NUMERO, M.CODCENTROCUSTO, DESCRICAO'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 37
    Top = 72
  end
  object rpRequisicao: TppReport
    AutoStop = False
    DataPipeline = pplRequisicao
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 286
    Top = 72
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplRequisicao'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15610
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel2'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83873
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object rpExtratoContaLabel10: TppLabel
        UserName = 'rpExtratoContaLabel10'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 125677
        mmTop = 11377
        mmWidth = 12435
        BandType = 0
      end
      object lbData: TppLabel
        UserName = 'lbData'
        Caption = 'lbData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 140229
        mmTop = 11642
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Requisições Lançadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 75671
        mmTop = 8731
        mmWidth = 46038
        BandType = 0
      end
      object rpRequisicaoLabel13: TppLabel
        UserName = 'rpRequisicaoLabel13'
        Caption = 'Tipos :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 11377
        mmWidth = 9790
        BandType = 0
      end
      object LbTipo: TppLabel
        UserName = 'LbTipo'
        Caption = 'Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10583
        mmTop = 11377
        mmWidth = 8996
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object rpRequisicaoDBText4: TppDBText
        UserName = 'rpRequisicaoDBText4'
        AutoSize = True
        DataField = 'CODARTIGO'
        DataPipeline = pplRequisicao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRequisicao'
        mmHeight = 3175
        mmLeft = 4763
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object rpRequisicaoDBText6: TppDBText
        UserName = 'rpRequisicaoDBText6'
        AutoSize = True
        DataField = 'QTDEMOV'
        DataPipeline = pplRequisicao
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRequisicao'
        mmHeight = 3175
        mmLeft = 120650
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object rpRequisicaoDBText8: TppDBText
        UserName = 'rpRequisicaoDBText8'
        AutoSize = True
        DataField = 'CUSTOMEDIOMOV'
        DataPipeline = pplRequisicao
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRequisicao'
        mmHeight = 3175
        mmLeft = 133615
        mmTop = 0
        mmWidth = 25400
        BandType = 4
      end
      object rpRequisicaoDBText5: TppDBText
        UserName = 'rpRequisicaoDBText5'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = pplRequisicao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRequisicao'
        mmHeight = 3175
        mmLeft = 27252
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object rpRequisicaoDBText9: TppDBText
        UserName = 'rpRequisicaoDBText9'
        AutoSize = True
        DataField = 'CODTIPOMOV'
        DataPipeline = pplRequisicao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplRequisicao'
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object rpRequisicaoDBText7: TppDBText
        UserName = 'rpRequisicaoDBText7'
        AutoSize = True
        DataField = 'VALORMOV'
        DataPipeline = pplRequisicao
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRequisicao'
        mmHeight = 3175
        mmLeft = 161661
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object rpRequisicaoDBText12: TppDBText
        UserName = 'rpRequisicaoDBText12'
        AutoSize = True
        DataField = 'CODMEDCUSTO'
        DataPipeline = pplRequisicao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRequisicao'
        mmHeight = 3175
        mmLeft = 108215
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel3: TppLabel
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
        mmTop = 794
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
        mmTop = 794
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
        mmTop = 794
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpRequisicaoGroup3: TppGroup
      BreakName = 'ALMOXARIFADO'
      DataPipeline = pplRequisicao
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpRequisicaoGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRequisicao'
      object rpRequisicaoGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object rpRequisicaoLabel10: TppLabel
          UserName = 'rpRequisicaoLabel10'
          Caption = 'Almoxarifado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 117740
          mmTop = 0
          mmWidth = 20902
          BandType = 3
          GroupNo = 0
        end
        object rpRequisicaoDBText10: TppDBText
          UserName = 'rpRequisicaoDBText10'
          AutoSize = True
          DataField = 'ALMOXARIFADO'
          DataPipeline = pplRequisicao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplRequisicao'
          mmHeight = 3704
          mmLeft = 139965
          mmTop = 265
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
      end
      object rpRequisicaoGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object rpRequisicaoLabel12: TppLabel
          UserName = 'rpRequisicaoLabel12'
          Caption = 'Total Geral:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 134673
          mmTop = 1323
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object rpRequisicaoLine3: TppLine
          UserName = 'rpRequisicaoLine3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object rpRequisicaoLine4: TppLine
          UserName = 'rpRequisicaoLine4'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6085
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object rpRequisicaoDBCalc2: TppDBCalc
          UserName = 'rpRequisicaoDBCalc2'
          AutoSize = True
          DataField = 'VALORMOV'
          DataPipeline = pplRequisicao
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = rpRequisicaoGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRequisicao'
          mmHeight = 3969
          mmLeft = 146579
          mmTop = 1323
          mmWidth = 30956
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpRequisicaoGroup1: TppGroup
      BreakName = 'DATAMOV'
      DataPipeline = pplRequisicao
      OutlineSettings.CreateNode = True
      UserName = 'rpRequisicaoGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRequisicao'
      object rpRequisicaoGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object rpRequisicaoDBText1: TppDBText
          UserName = 'rpRequisicaoDBText1'
          AutoSize = True
          DataField = 'DATAMOV'
          DataPipeline = pplRequisicao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplRequisicao'
          mmHeight = 3704
          mmLeft = 11377
          mmTop = 794
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object rpRequisicaoLabel2: TppLabel
          UserName = 'rpRequisicaoLabel2'
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1588
          mmTop = 794
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object rpRequisicaoLine1: TppLine
          UserName = 'rpRequisicaoLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object rpRequisicaoLine2: TppLine
          UserName = 'rpRequisicaoLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 5027
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
      end
      object rpRequisicaoGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpRequisicaoGroup2: TppGroup
      BreakName = 'GRUPO'
      DataPipeline = pplRequisicao
      OutlineSettings.CreateNode = True
      UserName = 'rpRequisicaoGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRequisicao'
      object rpRequisicaoGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14288
        mmPrintPosition = 0
        object rpRequisicaoLabel8: TppLabel
          UserName = 'rpRequisicaoLabel8'
          Caption = 'Requisição nº'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 4498
          mmTop = 2117
          mmWidth = 20373
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoLabel1: TppLabel
          UserName = 'rpRequisicaoLabel1'
          Caption = 'Artigo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 4763
          mmTop = 8996
          mmWidth = 8996
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoLabel3: TppLabel
          UserName = 'rpRequisicaoLabel3'
          AutoSize = False
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 27252
          mmTop = 8996
          mmWidth = 20108
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoDBText3: TppDBText
          UserName = 'rpRequisicaoDBText3'
          AutoSize = True
          DataField = 'NUMERO'
          DataPipeline = pplRequisicao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplRequisicao'
          mmHeight = 3704
          mmLeft = 25665
          mmTop = 2117
          mmWidth = 14023
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoLabel9: TppLabel
          UserName = 'rpRequisicaoLabel9'
          Caption = 'Centro de Custo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 47096
          mmTop = 2117
          mmWidth = 24871
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoDBText2: TppDBText
          UserName = 'rpRequisicaoDBText2'
          DataField = 'CODCENTROCUSTO'
          DataPipeline = pplRequisicao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplRequisicao'
          mmHeight = 3969
          mmLeft = 74348
          mmTop = 2117
          mmWidth = 19579
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoLabel6: TppLabel
          UserName = 'rpRequisicaoLabel6'
          Caption = 'Preço Médio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 140229
          mmTop = 8996
          mmWidth = 18785
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoLabel5: TppLabel
          UserName = 'rpRequisicaoLabel5'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 169598
          mmTop = 8996
          mmWidth = 7938
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoLabel7: TppLabel
          UserName = 'rpRequisicaoLabel7'
          Caption = 'Tipo Mov.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 180975
          mmTop = 8996
          mmWidth = 14023
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoDBText11: TppDBText
          UserName = 'rpRequisicaoDBText11'
          AutoSize = True
          DataField = 'NOME'
          DataPipeline = pplRequisicao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplRequisicao'
          mmHeight = 3704
          mmLeft = 95515
          mmTop = 2117
          mmWidth = 9525
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoLabel4: TppLabel
          UserName = 'rpRequisicaoLabel4'
          Caption = 'Qtde'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 127794
          mmTop = 8996
          mmWidth = 7144
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoLabel14: TppLabel
          UserName = 'rpRequisicaoLabel14'
          Caption = 'Unid.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 107950
          mmTop = 8996
          mmWidth = 7408
          BandType = 3
          GroupNo = 2
        end
      end
      object rpRequisicaoGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object rpRequisicaoLabel11: TppLabel
          UserName = 'rpRequisicaoLabel11'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 143669
          mmTop = 265
          mmWidth = 7938
          BandType = 5
          GroupNo = 2
        end
        object rpRequisicaoDBCalc1: TppDBCalc
          UserName = 'rpRequisicaoDBCalc1'
          AutoSize = True
          DataField = 'VALORMOV'
          DataPipeline = pplRequisicao
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpRequisicaoGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRequisicao'
          mmHeight = 3175
          mmLeft = 151077
          mmTop = 265
          mmWidth = 26458
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object qryRecebimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT  /*+ rule */'
      '     AL.DESCALMOX AS ALMOXARIFADO, '
      '     P.NOME AS FORNECEDOR, '
      '     NF.DATAENTDEVOL as DATAEMISNF, '
      
        '     DECODE(NF.COMPLNF,'#39#39',TO_CHAR(NF.NUMNF), RTRIM(TO_CHAR(NF.NU' +
        'MNF),'#39' '#39')||'#39'/'#39'||NF.COMPLNF) AS NNF, '
      '     AR.CODARTIGO, '
      
        '     DECODE(IT.IDPRODVARI,NULL,PR.DESCPROD||'#39' '#39'||RTRIM(AR.CODCOR' +
        ','#39' '#39') ||'#39' '#39'|| RTRIM(AR.CODTAMANHO),PV.DESCPRODVARI)AS PRODUTO, '
      '     IT.QTDERECEBDEVOL, '
      '     IT.VLRUNITARIO, '
      '     IT.CODMEDIDA, '
      '     IT.QTDERECEBDEVOL*IT.VLRUNITARIO AS VALORTOTAL, '
      
        '     (IT.QTDERECEBDEVOL*IT.VLRUNITARIO) - IT.VLRESTOQUE AS ACDES' +
        ', '
      
        '     ((IT.QTDERECEBDEVOL*IT.VLRUNITARIO)+(IT.QTDERECEBDEVOL*IT.V' +
        'LRUNITARIO- IT.VLRESTOQUE )) as ValPag,'
      '     IT.VLRESTOQUE,        '
      '     IT.IDITENSRECDEV,     '
      '     NF.VLRNOTAFISCAL, '
      '     TD.DESCRICAO AS TIPODOC,    '
      '     TOT.TOTAL             '
      ' FROM                      '
      '     ALMOX AL,             '
      '     ARTIGO AR,            '
      '     PRODUTO PR,           '
      '     ITENSRECEBDEVOL IT,   '
      '     NFRECEBDEVOL NF,      '
      '     PESSOA P,             '
      '     PRODVARI PV,     '
      '     DOCUMENTO D,'
      '     TIPODOCRECPAG TD,     '
      '     ( SELECT              '
      '             SUM(VLRNOTAFISCAL ) AS TOTAL '
      '        FROM '
      '             NFRECEBDEVOL '
      '        WHERE '
      '               (IDPESSOA = 1)'
      '           AND (FLGTIPONOTA = '#39'R'#39') '
      
        '           AND (DATAENTDEVOL >= TO_DATE('#39'29/05/2000'#39','#39'DD/MM/YYYY' +
        #39'))'
      
        '           AND (DATAENTDEVOL <= TO_DATE('#39'29/05/2000'#39','#39'DD/MM/YYYY' +
        #39')) ) TOT '
      ' WHERE (1=2) and'
      '       (NF.IDPESSOA = 1)'
      '   AND (NF.DATAENTDEVOL >= TO_DATE('#39'29/05/2000'#39','#39'DD/MM/YYYY'#39'))'
      '   AND (NF.DATAENTDEVOL <= TO_DATE('#39'29/05/2000'#39','#39'DD/MM/YYYY'#39'))'
      '   AND (NF.FLGTIPONOTA = '#39'R'#39') '
      '   AND (NF.CODDOCUMENTO = D.CODDOCUMENTO)'
      '   AND (D.CODTIPDOC = TD.CODTIPDOC)'
      '   AND (NF.IDFORCLI = P.IDPESSOA) '
      '   AND (IT.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL) '
      '   AND (IT.CODALMOXARIFADO = AL.CODALMOXARIFADO) '
      '   AND (IT.CODARTIGO = AR.CODARTIGO) '
      '   AND (AR.CODPRODUTO = PR.CODPRODUTO) '
      '   AND (PV.IDPRODVARI(+) = IT.IDPRODVARI) '
      
        ' ORDER BY ALMOXARIFADO, DATAEMISNF, FORNECEDOR, NNF,IT.IDITENSRE' +
        'CDEV '
      '')
    ValidateWithMask = True
    Left = 37
    Top = 128
  end
  object dsRecebimento: TwwDataSource
    DataSet = qryRecebimento
    Left = 118
    Top = 128
  end
  object pplRecebimento: TppBDEPipeline
    DataSource = dsRecebimento
    SkipWhenNoRecords = False
    UserName = 'lRecebimento'
    Left = 205
    Top = 128
    object pplRecebimentoppField1: TppField
      FieldAlias = 'ALMOXARIFADO'
      FieldName = 'ALMOXARIFADO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplRecebimentoppField2: TppField
      FieldAlias = 'FORNECEDOR'
      FieldName = 'FORNECEDOR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplRecebimentoppField3: TppField
      FieldAlias = 'DATAEMISNF'
      FieldName = 'DATAEMISNF'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object pplRecebimentoppField4: TppField
      FieldAlias = 'NNF'
      FieldName = 'NNF'
      FieldLength = 46
      DisplayWidth = 46
      Position = 3
    end
    object pplRecebimentoppField5: TppField
      FieldAlias = 'CODARTIGO'
      FieldName = 'CODARTIGO'
      FieldLength = 14
      DisplayWidth = 14
      Position = 4
    end
    object pplRecebimentoppField6: TppField
      FieldAlias = 'PRODUTO'
      FieldName = 'PRODUTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object pplRecebimentoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDERECEBDEVOL'
      FieldName = 'QTDERECEBDEVOL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplRecebimentoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRUNITARIO'
      FieldName = 'VLRUNITARIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplRecebimentoppField9: TppField
      FieldAlias = 'CODMEDIDA'
      FieldName = 'CODMEDIDA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 8
    end
    object pplRecebimentoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORTOTAL'
      FieldName = 'VALORTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplRecebimentoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'ACDES'
      FieldName = 'ACDES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplRecebimentoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALPAG'
      FieldName = 'VALPAG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplRecebimentoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRESTOQUE'
      FieldName = 'VLRESTOQUE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplRecebimentoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDITENSRECDEV'
      FieldName = 'IDITENSRECDEV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplRecebimentoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRNOTAFISCAL'
      FieldName = 'VLRNOTAFISCAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplRecebimentoppField16: TppField
      FieldAlias = 'TIPODOC'
      FieldName = 'TIPODOC'
      FieldLength = 35
      DisplayWidth = 35
      Position = 15
    end
    object pplRecebimentoppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
  end
  object rpRecebimento: TppReport
    AutoStop = False
    DataPipeline = pplRecebimento
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 289
    Top = 128
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplRecebimento'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15610
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        Caption = 'Recebimento de Mercadoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 114036
        mmTop = 8731
        mmWidth = 56356
        BandType = 0
      end
      object ppLabel5: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel5'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 125942
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object lbDataRecebimento: TppLabel
        UserName = 'lbDataRecebimento'
        Caption = 'lbDataRecebimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 241830
        mmTop = 11906
        mmWidth = 24342
        BandType = 0
      end
      object rpRecebimentoLabel1: TppLabel
        UserName = 'rpRecebimentoLabel1'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 228071
        mmTop = 11906
        mmWidth = 12171
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppReport1DBText3: TppDBText
        UserName = 'ppReport1DBText3'
        AutoSize = True
        DataField = 'PRODUTO'
        DataPipeline = pplRecebimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3175
        mmLeft = 29104
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object ppReport1DBText4: TppDBText
        UserName = 'ppReport1DBText4'
        AutoSize = True
        DataField = 'QTDERECEBDEVOL'
        DataPipeline = pplRecebimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3175
        mmLeft = 92604
        mmTop = 0
        mmWidth = 26988
        BandType = 4
      end
      object ppReport1DBText5: TppDBText
        UserName = 'ppReport1DBText5'
        AutoSize = True
        DataField = 'VLRUNITARIO'
        DataPipeline = pplRecebimento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3175
        mmLeft = 132557
        mmTop = 265
        mmWidth = 18785
        BandType = 4
      end
      object ppReport1DBText6: TppDBText
        UserName = 'ppReport1DBText6'
        AutoSize = True
        DataField = 'CODARTIGO'
        DataPipeline = pplRecebimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3175
        mmLeft = 11642
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object rpRecebimentoDBText1: TppDBText
        UserName = 'rpRecebimentoDBText1'
        AutoSize = True
        DataField = 'VALORTOTAL'
        DataPipeline = pplRecebimento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3175
        mmLeft = 166688
        mmTop = 0
        mmWidth = 18521
        BandType = 4
      end
      object rpRecebimentoDBText2: TppDBText
        UserName = 'rpRecebimentoDBText2'
        AutoSize = True
        DataField = 'ACDES'
        DataPipeline = pplRecebimento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3175
        mmLeft = 201084
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object rpRecebimentoDBText3: TppDBText
        UserName = 'rpRecebimentoDBText3'
        AutoSize = True
        DataField = 'VLRESTOQUE'
        DataPipeline = pplRecebimento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3175
        mmLeft = 224896
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object rpRecebimentoDBText7: TppDBText
        UserName = 'rpRecebimentoDBText7'
        DataField = 'CODMEDIDA'
        DataPipeline = pplRecebimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3704
        mmLeft = 120650
        mmTop = 0
        mmWidth = 8996
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'ppLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel6: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel6'
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
        mmTop = 2646
        mmWidth = 274638
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
        mmTop = 2646
        mmWidth = 274638
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
        mmLeft = 248709
        mmTop = 2646
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object rpRecebimentoLine2: TppLine
        UserName = 'rpRecebimentoLine2'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 284428
        BandType = 7
      end
      object rpRecebimentoLine3: TppLine
        UserName = 'rpRecebimentoLine3'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 6615
        mmWidth = 284428
        BandType = 7
      end
      object rpRecebimentoLabel10: TppLabel
        UserName = 'rpRecebimentoLabel10'
        Caption = 'Valor Total das Notas R$ '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 18256
        mmTop = 1852
        mmWidth = 33338
        BandType = 7
      end
      object rpRecebimentoDBText5: TppDBText
        UserName = 'rpRecebimentoDBText5'
        AutoSize = True
        DataField = 'TOTAL'
        DataPipeline = pplRecebimento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3175
        mmLeft = 77788
        mmTop = 1852
        mmWidth = 9260
        BandType = 7
      end
      object rpRecebimentoLabel3: TppLabel
        UserName = 'rpRecebimentoLabel3'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 1852
        mmWidth = 18521
        BandType = 7
      end
      object rpRecebimentoDBCalc1: TppDBCalc
        UserName = 'rpRecebimentoDBCalc1'
        AutoSize = True
        DataField = 'VALORTOTAL'
        DataPipeline = pplRecebimento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3175
        mmLeft = 155311
        mmTop = 1852
        mmWidth = 29369
        BandType = 7
      end
      object rpRecebimentoDBCalc5: TppDBCalc
        UserName = 'rpRecebimentoDBCalc5'
        AutoSize = True
        DataField = 'ACDES'
        DataPipeline = pplRecebimento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3175
        mmLeft = 189971
        mmTop = 1852
        mmWidth = 20108
        BandType = 7
      end
      object rpRecebimentoDBCalc7: TppDBCalc
        UserName = 'rpRecebimentoDBCalc7'
        AutoSize = True
        DataField = 'VLRESTOQUE'
        DataPipeline = pplRecebimento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3175
        mmLeft = 214578
        mmTop = 1852
        mmWidth = 29633
        BandType = 7
      end
    end
    object ppReport1Group1: TppGroup
      BreakName = 'DATAEMISNF'
      DataPipeline = pplRecebimento
      OutlineSettings.CreateNode = True
      UserName = 'Report1Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRecebimento'
      object ppReport1GroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object rpRecebimentoShape1: TppShape
          UserName = 'rpRecebimentoShape1'
          mmHeight = 5292
          mmLeft = 0
          mmTop = 265
          mmWidth = 275432
          BandType = 3
          GroupNo = 1
        end
        object ppReport1Label1: TppLabel
          UserName = 'ppReport1Label1'
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 3440
          mmTop = 1058
          mmWidth = 6879
          BandType = 3
          GroupNo = 1
        end
        object ppReport1DBText1: TppDBText
          UserName = 'ppReport1DBText1'
          AutoSize = True
          DataField = 'DATAEMISNF'
          DataPipeline = pplRecebimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplRecebimento'
          mmHeight = 3175
          mmLeft = 11906
          mmTop = 1058
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
        end
      end
      object ppReport1GroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppReport1Group2: TppGroup
      BreakName = 'NNF'
      DataPipeline = pplRecebimento
      OutlineSettings.CreateNode = True
      UserName = 'Report1Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRecebimento'
      object ppReport1GroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppReport1DBText2: TppDBText
          UserName = 'ppReport1DBText2'
          AutoSize = True
          DataField = 'NNF'
          DataPipeline = pplRecebimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplRecebimento'
          mmHeight = 3175
          mmLeft = 24606
          mmTop = 0
          mmWidth = 5821
          BandType = 3
          GroupNo = 2
        end
        object ppReport1Label2: TppLabel
          UserName = 'ppReport1Label2'
          Caption = 'Nota Fiscal:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 6879
          mmTop = 0
          mmWidth = 16140
          BandType = 3
          GroupNo = 2
        end
        object ppReport1Label3: TppLabel
          UserName = 'ppReport1Label3'
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 29104
          mmTop = 6350
          mmWidth = 11642
          BandType = 3
          GroupNo = 2
        end
        object ppReport1Label4: TppLabel
          UserName = 'ppReport1Label4'
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 103188
          mmTop = 6350
          mmWidth = 16404
          BandType = 3
          GroupNo = 2
        end
        object ppReport1Label6: TppLabel
          UserName = 'ppReport1Label6'
          Caption = 'Artigo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 11642
          mmTop = 6350
          mmWidth = 8996
          BandType = 3
          GroupNo = 2
        end
        object rpRecebimentoLabel5: TppLabel
          UserName = 'rpRecebimentoLabel5'
          Caption = 'Decrescimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 193411
          mmTop = 6615
          mmWidth = 17463
          BandType = 3
          GroupNo = 2
        end
        object rpRecebimentoLabel6: TppLabel
          UserName = 'rpRecebimentoLabel6'
          Caption = 'Valor Estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 223838
          mmTop = 6350
          mmWidth = 20373
          BandType = 3
          GroupNo = 2
        end
        object rpRecebimentoLabel8: TppLabel
          UserName = 'rpRecebimentoLabel8'
          Caption = 'Valor Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 169598
          mmTop = 6350
          mmWidth = 15610
          BandType = 3
          GroupNo = 2
        end
        object rpRecebimentoLabel9: TppLabel
          UserName = 'rpRecebimentoLabel9'
          Caption = 'Valor Unitário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 131763
          mmTop = 6350
          mmWidth = 19579
          BandType = 3
          GroupNo = 2
        end
        object rpRecebimentoLabel7: TppLabel
          UserName = 'rpRecebimentoLabel7'
          Caption = 'Acrescimo /'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 193411
          mmTop = 3440
          mmWidth = 17463
          BandType = 3
          GroupNo = 3
        end
        object rpRecebimentoDBText4: TppDBText
          UserName = 'rpRecebimentoDBText4'
          AutoSize = True
          DataField = 'FORNECEDOR'
          DataPipeline = pplRecebimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplRecebimento'
          mmHeight = 3175
          mmLeft = 108744
          mmTop = 0
          mmWidth = 20108
          BandType = 3
          GroupNo = 3
        end
        object rpRecebimentoLabel2: TppLabel
          UserName = 'rpRecebimentoLabel2'
          Caption = 'Fornecedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 89959
          mmTop = 0
          mmWidth = 17727
          BandType = 3
          GroupNo = 3
        end
        object rpRecebimentoDBText6: TppDBText
          UserName = 'rpRecebimentoDBText6'
          AutoSize = True
          DataField = 'VLRNOTAFISCAL'
          DataPipeline = pplRecebimento
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRecebimento'
          mmHeight = 3175
          mmLeft = 64029
          mmTop = 0
          mmWidth = 23019
          BandType = 3
          GroupNo = 2
        end
        object rpRecebimentoLabel11: TppLabel
          UserName = 'rpRecebimentoLabel11'
          Caption = 'Valor R$ '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 51329
          mmTop = 0
          mmWidth = 12700
          BandType = 3
          GroupNo = 2
        end
        object rpRecebimentoLabel12: TppLabel
          UserName = 'rpRecebimentoLabel12'
          Caption = 'Tipo de Documento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 163777
          mmTop = 0
          mmWidth = 29104
          BandType = 3
          GroupNo = 2
        end
        object rpRecebimentoDBText8: TppDBText
          UserName = 'rpRecebimentoDBText8'
          AutoSize = True
          DataField = 'TIPODOC'
          DataPipeline = pplRecebimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplRecebimento'
          mmHeight = 3175
          mmLeft = 193675
          mmTop = 0
          mmWidth = 12965
          BandType = 3
          GroupNo = 2
        end
      end
      object ppReport1GroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object rpRecebimentoLabel4: TppLabel
          UserName = 'rpRecebimentoLabel4'
          Caption = 'Totais:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 141552
          mmTop = 0
          mmWidth = 9790
          BandType = 5
          GroupNo = 2
        end
        object rpRecebimentoDBCalc2: TppDBCalc
          UserName = 'rpRecebimentoDBCalc2'
          AutoSize = True
          DataField = 'VALORTOTAL'
          DataPipeline = pplRecebimento
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppReport1Group2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRecebimento'
          mmHeight = 3175
          mmLeft = 155840
          mmTop = 0
          mmWidth = 29369
          BandType = 5
          GroupNo = 2
        end
        object rpRecebimentoDBCalc3: TppDBCalc
          UserName = 'rpRecebimentoDBCalc3'
          AutoSize = True
          DataField = 'ACDES'
          DataPipeline = pplRecebimento
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppReport1Group2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRecebimento'
          mmHeight = 3175
          mmLeft = 190500
          mmTop = 0
          mmWidth = 20108
          BandType = 5
          GroupNo = 2
        end
        object rpRecebimentoDBCalc4: TppDBCalc
          UserName = 'rpRecebimentoDBCalc4'
          AutoSize = True
          DataField = 'VLRESTOQUE'
          DataPipeline = pplRecebimento
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppReport1Group2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRecebimento'
          mmHeight = 3175
          mmLeft = 214578
          mmTop = 0
          mmWidth = 29633
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object rpDevolucao: TppReport
    AutoStop = False
    DataPipeline = pplDevolucao
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 289
    Top = 182
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplDevolucao'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15610
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
        Caption = 'Devolução de Mercadoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 116946
        mmTop = 8731
        mmWidth = 51329
        BandType = 0
      end
      object ppLabel8: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel8'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 125942
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object lbDataDevolucao: TppLabel
        UserName = 'lbDataDevolucao'
        Caption = 'lbDataDevolucao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 241830
        mmTop = 11906
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'ppLabel10'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 228071
        mmTop = 11906
        mmWidth = 12171
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'ppDBText1'
        AutoSize = True
        DataField = 'PRODUTO'
        DataPipeline = pplDevolucao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDevolucao'
        mmHeight = 3175
        mmLeft = 29104
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'ppDBText2'
        AutoSize = True
        DataField = 'QTDERECEBDEVOL'
        DataPipeline = pplDevolucao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDevolucao'
        mmHeight = 3175
        mmLeft = 92604
        mmTop = 0
        mmWidth = 26988
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'ppDBText3'
        AutoSize = True
        DataField = 'VLRUNITARIO'
        DataPipeline = pplDevolucao
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDevolucao'
        mmHeight = 3175
        mmLeft = 132557
        mmTop = 265
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'ppDBText4'
        AutoSize = True
        DataField = 'CODARTIGO'
        DataPipeline = pplDevolucao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDevolucao'
        mmHeight = 3175
        mmLeft = 11642
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'ppDBText5'
        AutoSize = True
        DataField = 'VALORTOTAL'
        DataPipeline = pplDevolucao
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDevolucao'
        mmHeight = 3175
        mmLeft = 171450
        mmTop = 0
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'ppDBText6'
        AutoSize = True
        DataField = 'ACDES'
        DataPipeline = pplDevolucao
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDevolucao'
        mmHeight = 3175
        mmLeft = 215107
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'ppDBText7'
        AutoSize = True
        DataField = 'VLRESTOQUE'
        DataPipeline = pplDevolucao
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDevolucao'
        mmHeight = 3175
        mmLeft = 254530
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'ppLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel11: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel11'
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
        mmTop = 3175
        mmWidth = 274638
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
        mmWidth = 274638
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
        mmLeft = 248709
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'ALMOXARIFADO'
      DataPipeline = pplDevolucao
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplDevolucao'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object ppDBText8: TppDBText
          UserName = 'ppDBText8'
          AutoSize = True
          DataField = 'ALMOXARIFADO'
          DataPipeline = pplDevolucao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplDevolucao'
          mmHeight = 3175
          mmLeft = 241830
          mmTop = 0
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'ppLabel12'
          Caption = 'Almoxarifado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 220134
          mmTop = 0
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppLabel13: TppLabel
          UserName = 'ppLabel13'
          Caption = 'Total Geral:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 132821
          mmTop = 1588
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'ppDBCalc1'
          AutoSize = True
          DataField = 'VALORTOTAL'
          DataPipeline = pplDevolucao
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDevolucao'
          mmHeight = 3175
          mmLeft = 184680
          mmTop = 1588
          mmWidth = 5292
          BandType = 5
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'ppLine4'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'ppLine5'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6085
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'ppDBCalc2'
          AutoSize = True
          DataField = 'ACDES'
          DataPipeline = pplDevolucao
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDevolucao'
          mmHeight = 3175
          mmLeft = 219340
          mmTop = 1588
          mmWidth = 5292
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'ppDBCalc3'
          AutoSize = True
          DataField = 'VLRESTOQUE'
          DataPipeline = pplDevolucao
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDevolucao'
          mmHeight = 3175
          mmLeft = 268553
          mmTop = 1588
          mmWidth = 5292
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DATAEMISNF'
      DataPipeline = pplDevolucao
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplDevolucao'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'ppShape1'
          mmHeight = 5292
          mmLeft = 0
          mmTop = 265
          mmWidth = 275432
          BandType = 3
          GroupNo = 1
        end
        object ppLabel14: TppLabel
          UserName = 'ppLabel14'
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 3440
          mmTop = 1058
          mmWidth = 6879
          BandType = 3
          GroupNo = 1
        end
        object ppDBText9: TppDBText
          UserName = 'ppDBText9'
          AutoSize = True
          DataField = 'DATAEMISNF'
          DataPipeline = pplDevolucao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplDevolucao'
          mmHeight = 3175
          mmLeft = 11906
          mmTop = 1058
          mmWidth = 17992
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
    object ppGroup3: TppGroup
      BreakName = 'NNF'
      DataPipeline = pplDevolucao
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplDevolucao'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppDBText10: TppDBText
          UserName = 'ppDBText10'
          AutoSize = True
          DataField = 'NNF'
          DataPipeline = pplDevolucao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplDevolucao'
          mmHeight = 3175
          mmLeft = 24606
          mmTop = 0
          mmWidth = 5821
          BandType = 3
          GroupNo = 2
        end
        object ppLabel15: TppLabel
          UserName = 'ppLabel15'
          Caption = 'Nota Fiscal:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 6879
          mmTop = 0
          mmWidth = 16140
          BandType = 3
          GroupNo = 2
        end
        object ppLabel16: TppLabel
          UserName = 'ppLabel16'
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 29104
          mmTop = 6350
          mmWidth = 11642
          BandType = 3
          GroupNo = 2
        end
        object ppLabel17: TppLabel
          UserName = 'ppLabel17'
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 103188
          mmTop = 6350
          mmWidth = 16404
          BandType = 3
          GroupNo = 2
        end
        object ppLabel18: TppLabel
          UserName = 'ppLabel18'
          Caption = 'Artigo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 11642
          mmTop = 6350
          mmWidth = 8996
          BandType = 3
          GroupNo = 2
        end
        object ppLabel19: TppLabel
          UserName = 'ppLabel19'
          Caption = 'Decrescimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 207169
          mmTop = 6350
          mmWidth = 17463
          BandType = 3
          GroupNo = 2
        end
        object ppLabel20: TppLabel
          UserName = 'ppLabel20'
          Caption = 'Valor Estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 253471
          mmTop = 6350
          mmWidth = 20373
          BandType = 3
          GroupNo = 2
        end
        object ppLabel21: TppLabel
          UserName = 'ppLabel21'
          Caption = 'Valor Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 174361
          mmTop = 6350
          mmWidth = 15610
          BandType = 3
          GroupNo = 2
        end
        object ppLabel22: TppLabel
          UserName = 'ppLabel22'
          Caption = 'Valor Unitário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 131763
          mmTop = 6350
          mmWidth = 19579
          BandType = 3
          GroupNo = 2
        end
        object ppLabel23: TppLabel
          UserName = 'ppLabel23'
          Caption = 'Acrescimo /'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 207169
          mmTop = 2910
          mmWidth = 17463
          BandType = 3
          GroupNo = 3
        end
        object ppDBText11: TppDBText
          UserName = 'ppDBText11'
          AutoSize = True
          DataField = 'FORNECEDOR'
          DataPipeline = pplDevolucao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplDevolucao'
          mmHeight = 3175
          mmLeft = 121973
          mmTop = 0
          mmWidth = 20108
          BandType = 3
          GroupNo = 3
        end
        object ppLabel24: TppLabel
          UserName = 'ppLabel24'
          Caption = 'Fornecedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 103188
          mmTop = 0
          mmWidth = 17727
          BandType = 3
          GroupNo = 3
        end
        object rpDevolucaoLabel1: TppLabel
          UserName = 'rpDevolucaoLabel1'
          Caption = 'Valor da Nota de Devolução:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 36777
          mmTop = 0
          mmWidth = 39952
          BandType = 3
          GroupNo = 2
        end
        object rpDevolucaoDBText1: TppDBText
          UserName = 'rpDevolucaoDBText1'
          AutoSize = True
          DataField = 'VLRNOTAFISCAL'
          DataPipeline = pplDevolucao
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDevolucao'
          mmHeight = 3175
          mmLeft = 64823
          mmTop = 0
          mmWidth = 23019
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppLabel25: TppLabel
          UserName = 'ppLabel25'
          Caption = 'Totais:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 141552
          mmTop = 0
          mmWidth = 9790
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'ppDBCalc4'
          AutoSize = True
          DataField = 'VALORTOTAL'
          DataPipeline = pplDevolucao
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDevolucao'
          mmHeight = 3175
          mmLeft = 184680
          mmTop = 0
          mmWidth = 5292
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'ppDBCalc5'
          AutoSize = True
          DataField = 'ACDES'
          DataPipeline = pplDevolucao
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDevolucao'
          mmHeight = 3175
          mmLeft = 219340
          mmTop = 0
          mmWidth = 5292
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'ppDBCalc6'
          AutoSize = True
          DataField = 'VLRESTOQUE'
          DataPipeline = pplDevolucao
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDevolucao'
          mmHeight = 3175
          mmLeft = 268553
          mmTop = 0
          mmWidth = 5292
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object pplDevolucao: TppBDEPipeline
    DataSource = dsDevolucao
    SkipWhenNoRecords = False
    UserName = 'lDevolucao'
    Left = 205
    Top = 182
  end
  object dsDevolucao: TwwDataSource
    DataSet = qryDevolucao
    Left = 118
    Top = 182
  end
  object qryDevolucao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+ rule */ '
      '  AL.DESCALMOX AS ALMOXARIFADO,'
      '  P.NOME AS FORNECEDOR,'
      '  NF.DATAEMISNF,'
      '  NF.VLRNOTAFISCAL,'
      
        '  DECODE(NF.COMPLNF,'#39#39',TO_CHAR(NF.NUMNF), RTRIM(TO_CHAR(NF.NUMNF' +
        '),'#39' '#39')||'#39'/'#39'||NF.COMPLNF) AS NNF, '
      '  AR.CODARTIGO,'
      
        '  PR.DESCPROD || '#39' '#39' || RTRIM(AR.CODCOR, '#39' '#39') || '#39' '#39' || RTRIM(AR' +
        '.CODTAMANHO, '#39' '#39') AS PRODUTO,  '
      '  IT.QTDERECEBDEVOL,  '
      '  IT.VLRUNITARIO, '
      '  IT.QTDERECEBDEVOL*IT.VLRUNITARIO AS VALORTOTAL,'
      '  (IT.QTDERECEBDEVOL*IT.VLRUNITARIO) - IT.VLRESTOQUE AS ACDES,'
      '  IT.VLRESTOQUE'
      
        'FROM ALMOX AL, ARTIGO AR, PRODUTO PR, ITENSRECEBDEVOL IT, NFRECE' +
        'BDEVOL NF, PESSOA P'
      'WHERE (1=2) and'
      '           NF.IDPESSOA = 1'
      '  AND FLGTIPONOTA = '#39'D'#39
      '  AND NF.IDFORCLI = P.IDPESSOA'
      '  AND IT.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL'
      '  AND IT.CODALMOXARIFADO = AL.CODALMOXARIFADO   '
      '  AND IT.CODARTIGO = AR.CODARTIGO     '
      '  AND AR.CODPRODUTO = PR.CODPRODUTO'
      'ORDER BY ALMOXARIFADO, NF.DATAEMISNF, FORNECEDOR, NNF')
    ValidateWithMask = True
    Left = 37
    Top = 182
  end
  object qryValidade: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  /*+ rule */'
      '   AL.DESCALMOX AS ALMOXARIFADO,'
      '   AR.CODARTIGO,'
      
        '   PR.DESCPROD || '#39' '#39' || RTRIM(AR.CODCOR, '#39' '#39') || '#39' '#39' || RTRIM(A' +
        'R.CODTAMANHO, '#39' '#39') AS PRODUTO,  '
      '   L.DATAVALIDADE,'
      '   L.SALDOLOTE'
      'FROM ALMOX AL, ARTIGO AR, PRODUTO PR, LOTEVALI L'
      'WHERE (1=2) and'
      '            AL.IDPESSOA = 1'
      '   AND AL.CODALMOXARIFADO = L.CODALMOXARIFADO   '
      '   AND L.CODARTIGO = AR.CODARTIGO'
      '   AND AR.CODPRODUTO = PR.CODPRODUTO'
      'ORDER BY DATAVALIDADE, PRODUTO, ALMOXARIFADO'
      '')
    ValidateWithMask = True
    Left = 40
    Top = 238
  end
  object dsValidade: TwwDataSource
    DataSet = qryValidade
    Left = 121
    Top = 238
  end
  object pplValidade: TppBDEPipeline
    DataSource = dsValidade
    SkipWhenNoRecords = False
    UserName = 'lValidade'
    Left = 208
    Top = 238
  end
  object rpValidade: TppReport
    AutoStop = False
    DataPipeline = pplValidade
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 292
    Top = 238
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplValidade'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20108
      mmPrintPosition = 0
      object ppLabel9: TppLabel
        UserName = 'ppLabel9'
        Caption = 'Validade dos Produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 76200
        mmTop = 8731
        mmWidth = 46038
        BandType = 0
      end
      object ppLabel26: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel26'
        Caption = 'CM Soluções'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 81756
        mmTop = 1588
        mmWidth = 32544
        BandType = 0
      end
      object lblDataValidade: TppLabel
        UserName = 'lblDataValidade'
        Caption = 'lblDataValidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 162719
        mmTop = 12171
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'ppLabel27'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 148961
        mmTop = 12171
        mmWidth = 12171
        BandType = 0
      end
      object lblOpcao: TppLabel
        UserName = 'lblOpcao'
        Caption = 'lblOpcao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 162719
        mmTop = 16140
        mmWidth = 11113
        BandType = 0
      end
      object rpValidadeLabel1: TppLabel
        UserName = 'rpValidadeLabel1'
        Caption = 'Ordenado por:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 140229
        mmTop = 16140
        mmWidth = 20902
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText12: TppDBText
        UserName = 'ppDBText12'
        AutoSize = True
        DataField = 'PRODUTO'
        DataPipeline = pplValidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplValidade'
        mmHeight = 3175
        mmLeft = 58738
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'ppDBText13'
        AutoSize = True
        DataField = 'CODARTIGO'
        DataPipeline = pplValidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValidade'
        mmHeight = 3175
        mmLeft = 18256
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object rpValidadeDBText7: TppDBText
        UserName = 'rpValidadeDBText7'
        AutoSize = True
        DataField = 'SALDOLOTE'
        DataPipeline = pplValidade
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValidade'
        mmHeight = 3175
        mmLeft = 106627
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object rpValidadeLine3: TppLine
        UserName = 'rpValidadeLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1588
        mmWidth = 197300
        BandType = 8
      end
      object rpValidadeLabel5: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'rpValidadeLabel5'
        AutoSize = False
        Caption = 'Controle Financeiro - 02.00.06'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppCalc7: TppSystemVariable
        UserName = 'Calc7'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 197380
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
      object rpValidadeCalc1: TppSystemVariable
        UserName = 'rpValidadeCalc1'
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
      object rpValidadeCalc2: TppSystemVariable
        UserName = 'rpValidadeCalc2'
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
    object ppGroup4: TppGroup
      BreakName = 'ALMOXARIFADO'
      DataPipeline = pplValidade
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplValidade'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object ppDBText14: TppDBText
          UserName = 'ppDBText14'
          AutoSize = True
          DataField = 'ALMOXARIFADO'
          DataPipeline = pplValidade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplValidade'
          mmHeight = 3175
          mmLeft = 162719
          mmTop = 0
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel28: TppLabel
          UserName = 'ppLabel28'
          Caption = 'Almoxarifado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 141023
          mmTop = 0
          mmWidth = 20108
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
    object ppGroup5: TppGroup
      BreakName = 'DATAVALIDADE'
      DataPipeline = pplValidade
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplValidade'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object rpValidadeShape1: TppShape
          UserName = 'rpValidadeShape1'
          mmHeight = 5556
          mmLeft = 0
          mmTop = 0
          mmWidth = 197115
          BandType = 3
          GroupNo = 1
        end
        object ppLabel29: TppLabel
          UserName = 'ppLabel29'
          Caption = 'Data de Validade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 1058
          mmWidth = 24606
          BandType = 3
          GroupNo = 1
        end
        object rpValidadeDBText9: TppDBText
          UserName = 'rpValidadeDBText9'
          AutoSize = True
          DataField = 'DATAVALIDADE'
          DataPipeline = pplValidade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplValidade'
          mmHeight = 3175
          mmLeft = 28575
          mmTop = 1058
          mmWidth = 21431
          BandType = 3
          GroupNo = 1
        end
        object ppLabel30: TppLabel
          UserName = 'ppLabel30'
          Caption = 'Artigo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 26458
          mmTop = 7673
          mmWidth = 8996
          BandType = 3
          GroupNo = 1
        end
        object ppLabel31: TppLabel
          UserName = 'ppLabel31'
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 58738
          mmTop = 7673
          mmWidth = 11642
          BandType = 3
          GroupNo = 1
        end
        object rpValidadeLabel7: TppLabel
          UserName = 'rpValidadeLabel7'
          Caption = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 115623
          mmTop = 7673
          mmWidth = 7938
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryABC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+ rule */   '
      '   '#39'A'#39' as GRUPO,'
      
        '   (0) AS PERCACU,                                              ' +
        '                                                 '
      
        '   P.DESCPROD || '#39' '#39' || RTRIM(A.CODCOR, '#39' '#39') ||'#39' '#39'|| RTRIM(A.COD' +
        'TAMANHO,'#39' '#39') AS PRODUTO,      '
      '   S.SALDOQTDE,      '
      '   (S.SALDOQTDE*C.CUSTOMEDIO) AS VALORPRODUTO,      '
      '   (((S.SALDOQTDE*C.CUSTOMEDIO)/TOT.VALORTOTAL)*100) AS PERC,'
      '   TOT.VALORTOTAL,'
      '   P.CODMEDCUSTO'
      'FROM        '
      '   SALDO S,   '
      '   CUSTOMED C,'
      '   PRODUTO P,'
      '   ALMOX AL,'
      '   ARTIGO A,'
      '   (SELECT'
      '        SUM(S.SALDOQTDE*C.CUSTOMEDIO) AS VALORTOTAL'
      '    FROM'
      '        SALDO S,'
      '        CUSTOMED C,'
      '        ALMOX AL'
      '    WHERE'
      '          (S.CODALMOXARIFADO = 2)'
      '      AND (S.CODALMOXARIFADO = AL.CODALMOXARIFADO)'
      '      AND (C.CODARTIGO =  S.CODARTIGO )'
      '      AND (C.CODCUSTEIO = AL.CODCUSTEIO) )   TOT'
      'WHERE (1=2) and'
      '      (S.CODALMOXARIFADO = 2)'
      '  AND (S.CODALMOXARIFADO = AL.CODALMOXARIFADO)'
      '  AND (S.CODARTIGO = C.CODARTIGO)'
      '  AND (S.CODARTIGO = A.CODARTIGO)'
      '  AND (A.CODPRODUTO = P.CODPRODUTO)'
      '  AND (C.CODCUSTEIO = AL.CODCUSTEIO)'
      'ORDER BY VALORPRODUTO DESC')
    UpdateObject = updABC
    ValidateWithMask = True
    Left = 38
    Top = 292
  end
  object dsABC: TwwDataSource
    DataSet = qryABC
    Left = 119
    Top = 292
  end
  object pplABC: TppBDEPipeline
    DataSource = dsABC
    SkipWhenNoRecords = False
    UserName = 'lABC'
    Left = 206
    Top = 292
  end
  object rpABC: TppReport
    AutoStop = False
    DataPipeline = pplABC
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 292
    Top = 292
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplABC'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 31485
      mmPrintPosition = 0
      object ppReport1Shape1: TppShape
        UserName = 'ppReport1Shape1'
        ParentWidth = True
        mmHeight = 7144
        mmLeft = 0
        mmTop = 24342
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'ppLabel32'
        Caption = 'Curva ABC do Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 75142
        mmTop = 6615
        mmWidth = 46831
        BandType = 0
      end
      object ppLabel33: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel33'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 87577
        mmTop = 265
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'ppLabel34'
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 25929
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'ppLabel35'
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 89429
        mmTop = 25929
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'ppLabel36'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 126736
        mmTop = 25929
        mmWidth = 7938
        BandType = 0
      end
      object ppReport1Label7: TppLabel
        UserName = 'ppReport1Label7'
        Caption = 'Participação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 139700
        mmTop = 25929
        mmWidth = 17463
        BandType = 0
      end
      object ppReport1Label9: TppLabel
        UserName = 'ppReport1Label9'
        Caption = 'Acumulado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170392
        mmTop = 25929
        mmWidth = 16404
        BandType = 0
      end
      object ppReport1DBText7: TppDBText
        UserName = 'ppReport1DBText7'
        AutoSize = True
        DataField = 'VALORTOTAL'
        DataPipeline = pplABC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplABC'
        mmHeight = 3175
        mmLeft = 178859
        mmTop = 19050
        mmWidth = 18521
        BandType = 0
      end
      object ppReport1Label5: TppLabel
        UserName = 'ppReport1Label5'
        Caption = 'Valor Total em Estoque:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 136525
        mmTop = 19050
        mmWidth = 34660
        BandType = 0
      end
      object rpABCLabel5: TppLabel
        UserName = 'rpABCLabel5'
        Caption = 'Unid.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 100542
        mmTop = 25929
        mmWidth = 7144
        BandType = 0
      end
      object rpABCLabel6: TppLabel
        UserName = 'rpABCLabel6'
        Caption = 'Almoxarifado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 7408
        mmTop = 13758
        mmWidth = 18521
        BandType = 0
      end
      object rpABCLabel7: TppLabel
        UserName = 'rpABCLabel7'
        Caption = 'Grupo de Produto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 19315
        mmWidth = 26723
        BandType = 0
      end
      object lbAlmox14: TppLabel
        UserName = 'lbAlmox14'
        Caption = 'lbAlmox14'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 28575
        mmTop = 13758
        mmWidth = 13229
        BandType = 0
      end
      object LbGrupo3: TppLabel
        UserName = 'LbGrupo3'
        Caption = 'Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 28575
        mmTop = 19315
        mmWidth = 7938
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText15: TppDBText
        UserName = 'ppDBText15'
        AutoSize = True
        DataField = 'VALORPRODUTO'
        DataPipeline = pplABC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplABC'
        mmHeight = 3175
        mmLeft = 111125
        mmTop = 265
        mmWidth = 23548
        BandType = 4
      end
      object ppReport1DBText9: TppDBText
        UserName = 'ppReport1DBText9'
        AutoSize = True
        DataField = 'PERC'
        DataPipeline = pplABC
        DisplayFormat = '0.0 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplABC'
        mmHeight = 3175
        mmLeft = 148696
        mmTop = 0
        mmWidth = 7673
        BandType = 4
      end
      object ppReport1DBText10: TppDBText
        UserName = 'ppReport1DBText10'
        AutoSize = True
        DataField = 'SALDOQTDE'
        DataPipeline = pplABC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplABC'
        mmHeight = 3175
        mmLeft = 78846
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'ppDBText16'
        AutoSize = True
        DataField = 'PRODUTO'
        DataPipeline = pplABC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplABC'
        mmHeight = 3175
        mmLeft = 2646
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object rpABCDBText1: TppDBText
        UserName = 'rpABCDBText1'
        AutoSize = True
        DataField = 'PERCACU'
        DataPipeline = pplABC
        DisplayFormat = '0.0 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplABC'
        mmHeight = 3175
        mmLeft = 173038
        mmTop = 265
        mmWidth = 13758
        BandType = 4
      end
      object rpABCDBText4: TppDBText
        UserName = 'rpABCDBText4'
        AutoSize = True
        DataField = 'CODMEDCUSTO'
        DataPipeline = pplABC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplABC'
        mmHeight = 3175
        mmLeft = 93398
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'ppLine6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 794
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel37: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel37'
        AutoSize = False
        Caption = 'Controle Financeiro - 02.00.06'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 794
        mmWidth = 197909
        BandType = 8
      end
      object ppCalc8: TppSystemVariable
        UserName = 'Calc8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 197380
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc9: TppSystemVariable
        UserName = 'Calc9'
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
        mmTop = 794
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc10: TppSystemVariable
        UserName = 'ppCalc101'
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
        mmTop = 794
        mmWidth = 197380
        BandType = 8
      end
    end
    object rpABCSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object rpABCDBCalc4: TppDBCalc
        UserName = 'rpABCDBCalc4'
        AutoSize = True
        DataField = 'VALORPRODUTO'
        DataPipeline = pplABC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplABC'
        mmHeight = 3175
        mmLeft = 94986
        mmTop = 529
        mmWidth = 33867
        BandType = 7
      end
      object rpABCDBCalc5: TppDBCalc
        UserName = 'rpABCDBCalc5'
        AutoSize = True
        DataField = 'PERC'
        DataPipeline = pplABC
        DisplayFormat = '0.0 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplABC'
        mmHeight = 3175
        mmLeft = 138113
        mmTop = 529
        mmWidth = 18256
        BandType = 7
      end
      object rpABCDBCalc6: TppDBCalc
        UserName = 'rpABCDBCalc6'
        AutoSize = True
        DataField = 'PRODUTO'
        DataPipeline = pplABC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pplABC'
        mmHeight = 3175
        mmLeft = 50271
        mmTop = 794
        mmWidth = 24606
        BandType = 7
      end
      object rpABCLabel4: TppLabel
        UserName = 'rpABCLabel4'
        Caption = 'Número Total de Itens :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 12700
        mmTop = 529
        mmWidth = 33867
        BandType = 7
      end
    end
    object rpABCGroup2: TppGroup
      BreakName = 'GRUPO'
      DataPipeline = pplABC
      OutlineSettings.CreateNode = True
      UserName = 'rpABCGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplABC'
      object rpABCGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object rpABCLine3: TppLine
          UserName = 'rpABCLine3'
          Weight = 0.75
          mmHeight = 2646
          mmLeft = 0
          mmTop = 6350
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object rpABCLabel3: TppLabel
          UserName = 'rpABCLabel3'
          Caption = 'Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 14023
          mmTop = 1588
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object rpABCDBText3: TppDBText
          UserName = 'rpABCDBText3'
          AutoSize = True
          DataField = 'GRUPO'
          DataPipeline = pplABC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplABC'
          mmHeight = 4233
          mmLeft = 25665
          mmTop = 1588
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
      end
      object rpABCGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object rpABCDBCalc1: TppDBCalc
          UserName = 'rpABCDBCalc1'
          AutoSize = True
          DataField = 'PRODUTO'
          DataPipeline = pplABC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpABCGroup2
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplABC'
          mmHeight = 3175
          mmLeft = 50271
          mmTop = 1058
          mmWidth = 24606
          BandType = 5
          GroupNo = 0
        end
        object rpABCLine1: TppLine
          UserName = 'rpABCLine1'
          Weight = 0.75
          mmHeight = 2646
          mmLeft = 0
          mmTop = 529
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
        object rpABCDBCalc2: TppDBCalc
          UserName = 'rpABCDBCalc2'
          AutoSize = True
          DataField = 'VALORPRODUTO'
          DataPipeline = pplABC
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpABCGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplABC'
          mmHeight = 3175
          mmLeft = 94986
          mmTop = 1058
          mmWidth = 33867
          BandType = 5
          GroupNo = 0
        end
        object rpABCDBCalc3: TppDBCalc
          UserName = 'rpABCDBCalc3'
          AutoSize = True
          DataField = 'PERC'
          DataPipeline = pplABC
          DisplayFormat = '0.0 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpABCGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplABC'
          mmHeight = 3175
          mmLeft = 138113
          mmTop = 1058
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object rpABCLabel1: TppLabel
          UserName = 'rpABCLabel1'
          Caption = 'Número de Itens do Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2646
          mmTop = 1058
          mmWidth = 38629
          BandType = 5
          GroupNo = 0
        end
        object rpABCDBText2: TppDBText
          UserName = 'rpABCDBText2'
          AutoSize = True
          DataField = 'GRUPO'
          DataPipeline = pplABC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplABC'
          mmHeight = 3175
          mmLeft = 42863
          mmTop = 1058
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object rpABCLabel2: TppLabel
          UserName = 'rpABCLabel2'
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 45773
          mmTop = 1058
          mmWidth = 2117
          BandType = 5
          GroupNo = 0
        end
        object rpABCLine2: TppLine
          UserName = 'rpABCLine2'
          Style = lsDouble
          Weight = 0.75
          mmHeight = 2646
          mmLeft = 0
          mmTop = 5292
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object updABC: TUpdateSQL
    Left = 352
    Top = 296
  end
end
