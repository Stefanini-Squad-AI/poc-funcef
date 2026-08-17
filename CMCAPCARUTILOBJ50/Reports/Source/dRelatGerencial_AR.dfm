inherited dtmRelatorioGerencial_AR: TdtmRelatorioGerencial_AR
  Left = 0
  Top = 97
  Width = 1174
  Height = 529
  Caption = 'Relatórios Gerenciais'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 131
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
    Left = 76
  end
  inherited rpExemplo: TppReport
    Left = 177
    DataPipelineName = 'pplExemplo'
    inherited DetailBand1: TppDetailBand
      ColumnTraversal = ctLeftToRight
    end
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ValidateWithMask = True
    Left = 440
    Top = 51
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
    Left = 440
    Top = 34
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 440
    Top = 16
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
  object ppGerencial: TppBDEPipeline
    DataSource = dsGerencial
    UserName = 'lExemplo1'
    Left = 130
    Top = 56
    object ppGerencialppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppGerencialppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppGerencialppField3: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppGerencialppField4: TppField
      FieldAlias = 'PLANOPREVIDENCIARIO'
      FieldName = 'PLANOPREVIDENCIARIO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppGerencialppField5: TppField
      FieldAlias = 'ANOMESREFERENCIA'
      FieldName = 'ANOMESREFERENCIA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 4
    end
  end
  object dsGerencial: TwwDataSource
    AutoEdit = False
    DataSet = qryGerencial
    Left = 75
    Top = 56
  end
  object qryGerencial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLP.IDPESSJUR, PLP.IDPLANOPREV,'
      '       P.NOME AS PATROCINADORA,'
      
        '       PL.NOME AS PLANOPREVIDENCIARIO,  '#39'1999/10'#39' AS ANOMESREFER' +
        'ENCIA'
      'FROM   PESSOA P, PATRO PT, PLANPREV PL, PLANPREVPATRO PLP'
      'WHERE   PLP.IDPESSJUR = 99'
      'AND PLP.IDPLANOPREV = 12'
      'AND    PT.IDPESSOA    = PLP.IDPESSJUR'
      'AND    P.IDPESSOA     = PT.IDPESSOA'
      'AND    PL.IDPLANOPREV = PLP.IDPLANOPREV'
      'ORDER BY P.NOME, PL.NOME '
      '')
    ValidateWithMask = True
    Left = 33
    Top = 56
  end
  object rpGerencial: TppReport
    AutoStop = False
    DataPipeline = ppGerencial
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 177
    Top = 56
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppGerencial'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 47361
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Relatório Gerencial Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 107421
        mmTop = 26194
        mmWidth = 69321
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 32015
        mmWidth = 284300
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
        mmLeft = 1323
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
        mmWidth = 25929
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
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'Referência: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 247386
        mmTop = 26458
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'ANOMESREFERENCIA'
        DataPipeline = ppGerencial
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppGerencial'
        mmHeight = 3969
        mmLeft = 268288
        mmTop = 26458
        mmWidth = 38365
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppGererencial01: TppSubReport
        UserName = 'Gererencial01'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppGerencial01'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppGerencial01
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
          Left = 375
          Top = 248
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppGerencial01'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 17463
            mmPrintPosition = 0
            object ppLabel5: TppLabel
              UserName = 'Label5'
              Caption = 
                'Distribuição da Frequência dos Participantes e Não Participantes' +
                ' e Informações Cadastrais segundo as Regionais'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 1058
              mmTop = 1058
              mmWidth = 191030
              BandType = 1
            end
            object ppLine4: TppLine
              UserName = 'Line4'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 0
              mmTop = 6615
              mmWidth = 284300
              BandType = 1
            end
            object ppLabel6: TppLabel
              UserName = 'Label6'
              Caption = 'Regional'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 2646
              mmTop = 8467
              mmWidth = 11113
              BandType = 1
            end
            object ppLabel7: TppLabel
              UserName = 'Label7'
              Caption = 'Participantes'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 65088
              mmTop = 8467
              mmWidth = 16404
              BandType = 1
            end
            object ppLabel8: TppLabel
              UserName = 'Label8'
              Caption = 'Ativos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 53975
              mmTop = 12965
              mmWidth = 7673
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              Caption = 'Mantidos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 64029
              mmTop = 12965
              mmWidth = 11642
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 77788
              mmTop = 12965
              mmWidth = 6350
              BandType = 1
            end
            object ppLabel11: TppLabel
              UserName = 'Label1'
              Caption = 'Não'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 94192
              mmTop = 8467
              mmWidth = 5292
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = 'Adesão'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 109009
              mmTop = 8467
              mmWidth = 9525
              BandType = 1
            end
            object ppLabel13: TppLabel
              UserName = 'Label13'
              Caption = 'Salário'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 126207
              mmTop = 8467
              mmWidth = 8731
              BandType = 1
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'Participantes'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 88636
              mmTop = 12965
              mmWidth = 16404
              BandType = 1
            end
            object ppLabel15: TppLabel
              UserName = 'Label15'
              Caption = 'Participação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 122767
              mmTop = 12965
              mmWidth = 15610
              BandType = 1
            end
            object ppLabel16: TppLabel
              UserName = 'Label16'
              Caption = 'Participação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 142875
              mmTop = 8467
              mmWidth = 15610
              BandType = 1
            end
            object ppLabel17: TppLabel
              UserName = 'Label17'
              Caption = 'na Massa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 144198
              mmTop = 12965
              mmWidth = 12435
              BandType = 1
            end
            object ppLabel18: TppLabel
              UserName = 'Label18'
              Caption = 'Média Etária'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 189707
              mmTop = 8467
              mmWidth = 15875
              BandType = 1
            end
            object ppLabel19: TppLabel
              UserName = 'Label19'
              Caption = 'Particip.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 184415
              mmTop = 12965
              mmWidth = 10319
              BandType = 1
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              Caption = 'Não Particip.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 198173
              mmTop = 12965
              mmWidth = 16140
              BandType = 1
            end
            object ppLabel21: TppLabel
              UserName = 'Label21'
              Caption = 'Média de Tempo Contrib.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 218546
              mmTop = 8467
              mmWidth = 32015
              BandType = 1
            end
            object ppLabel22: TppLabel
              UserName = 'Label22'
              Caption = 'Ativos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 218282
              mmTop = 12965
              mmWidth = 7673
              BandType = 1
            end
            object ppLabel23: TppLabel
              UserName = 'Label23'
              Caption = 'Mantidos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 228336
              mmTop = 12965
              mmWidth = 11642
              BandType = 1
            end
            object ppLabel24: TppLabel
              UserName = 'Label101'
              Caption = 'Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 242094
              mmTop = 12965
              mmWidth = 6350
              BandType = 1
            end
            object ppLabel25: TppLabel
              UserName = 'Label25'
              Caption = 'Total de '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 254794
              mmTop = 8467
              mmWidth = 11113
              BandType = 1
            end
            object ppLabel26: TppLabel
              UserName = 'Label26'
              Caption = 'Benefícios'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 253736
              mmTop = 12965
              mmWidth = 13229
              BandType = 1
            end
            object ppLine6: TppLine
              UserName = 'Line6'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 10848
              mmLeft = 0
              mmTop = 6879
              mmWidth = 1058
              BandType = 1
            end
            object ppLine7: TppLine
              UserName = 'Line7'
              Position = lpRight
              Weight = 0.75
              mmHeight = 10848
              mmLeft = 283369
              mmTop = 6615
              mmWidth = 1058
              BandType = 1
            end
            object ppLine5: TppLine
              UserName = 'Line5'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 0
              mmTop = 17198
              mmWidth = 284300
              BandType = 1
            end
            object ppLabel28: TppLabel
              UserName = 'Label28'
              Caption = 'Salário Particip.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 161396
              mmTop = 8467
              mmWidth = 19844
              BandType = 1
            end
            object ppLabel29: TppLabel
              UserName = 'Label29'
              Caption = 'Não Participantes'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 160073
              mmTop = 12965
              mmWidth = 22490
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              DataField = 'NOME'
              DataPipeline = ppGerencial01
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 2117
              mmTop = 529
              mmWidth = 48419
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              DataField = 'TOTALATIVOS'
              DataPipeline = ppGerencial01
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 52652
              mmTop = 529
              mmWidth = 10319
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              DataField = 'TOTALMANTIDOS'
              DataPipeline = ppGerencial01
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 64558
              mmTop = 529
              mmWidth = 10319
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'TOTALPARTICIPANTES'
              DataPipeline = ppGerencial01
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 75936
              mmTop = 529
              mmWidth = 10319
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'NAOPARTICIPANTES'
              DataPipeline = ppGerencial01
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 88371
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              DataField = 'ADESAO'
              DataPipeline = ppGerencial01
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 107156
              mmTop = 529
              mmWidth = 9260
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'DBText9'
              DataField = 'SALPARTICIPANTES'
              DataPipeline = ppGerencial01
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 121973
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              DataField = 'PARTICIPANCAONAMASSA'
              DataPipeline = ppGerencial01
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 141817
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText11: TppDBText
              UserName = 'DBText11'
              DataField = 'MEDIAETARIAPART'
              DataPipeline = ppGerencial01
              DisplayFormat = '#,0;-#,0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 182827
              mmTop = 529
              mmWidth = 13229
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              DataField = 'MEDIAETARIANAOPART'
              DataPipeline = ppGerencial01
              DisplayFormat = '#,0;-#,0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 200555
              mmTop = 529
              mmWidth = 11113
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'DBText13'
              DataField = 'MEDIATEMPOATIVOS'
              DataPipeline = ppGerencial01
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 216959
              mmTop = 529
              mmWidth = 10319
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              DataField = 'MEDIATEMPOMANTIDOS'
              DataPipeline = ppGerencial01
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 228865
              mmTop = 529
              mmWidth = 10319
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              DataField = 'MEDIATEMPOTOTAL'
              DataPipeline = ppGerencial01
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 240242
              mmTop = 529
              mmWidth = 10319
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              DataField = 'TOTALBENEF'
              DataPipeline = ppGerencial01
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 255323
              mmTop = 529
              mmWidth = 10319
              BandType = 4
            end
            object ppLine8: TppLine
              UserName = 'Line8'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 0
              mmTop = 0
              mmWidth = 529
              BandType = 4
            end
            object ppLine9: TppLine
              UserName = 'Line9'
              ParentHeight = True
              Position = lpRight
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 284163
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText101'
              DataField = 'SALNAOPARTICIPANTES'
              DataPipeline = ppGerencial01
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 162719
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
            object ppLabel31: TppLabel
              UserName = 'Label31'
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 116681
              mmTop = 529
              mmWidth = 2646
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 7144
            mmPrintPosition = 0
            object ppLine10: TppLine
              UserName = 'Line10'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 0
              mmTop = 0
              mmWidth = 284300
              BandType = 7
            end
            object ppLabel27: TppLabel
              UserName = 'Label27'
              Caption = 'Totais'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 2117
              mmTop = 794
              mmWidth = 7673
              BandType = 7
            end
            object ppDBCalc1: TppDBCalc
              UserName = 'DBCalc1'
              DataField = 'TOTALATIVOS'
              DataPipeline = ppGerencial01
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 52388
              mmTop = 794
              mmWidth = 10848
              BandType = 7
            end
            object ppDBCalc2: TppDBCalc
              UserName = 'DBCalc2'
              DataField = 'TOTALMANTIDOS'
              DataPipeline = ppGerencial01
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 64294
              mmTop = 794
              mmWidth = 10848
              BandType = 7
            end
            object ppDBCalc3: TppDBCalc
              UserName = 'DBCalc3'
              DataField = 'TOTALPARTICIPANTES'
              DataPipeline = ppGerencial01
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 75671
              mmTop = 794
              mmWidth = 10848
              BandType = 7
            end
            object ppDBCalc4: TppDBCalc
              UserName = 'DBCalc4'
              DataField = 'NAOPARTICIPANTES'
              DataPipeline = ppGerencial01
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 91546
              mmTop = 794
              mmWidth = 10848
              BandType = 7
            end
            object ppDBCalc5: TppDBCalc
              UserName = 'DBCalc5'
              DataField = 'SALPARTICIPANTES'
              DataPipeline = ppGerencial01
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 121179
              mmTop = 794
              mmWidth = 18785
              BandType = 7
            end
            object ppDBCalc6: TppDBCalc
              UserName = 'DBCalc6'
              DataField = 'TOTALBENEF'
              DataPipeline = ppGerencial01
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 255059
              mmTop = 794
              mmWidth = 10848
              BandType = 7
            end
            object ppDBCalc7: TppDBCalc
              UserName = 'DBCalc7'
              DataField = 'SALNAOPARTICIPANTES'
              DataPipeline = ppGerencial01
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppGerencial01'
              mmHeight = 3440
              mmLeft = 162190
              mmTop = 794
              mmWidth = 18256
              BandType = 7
            end
            object ppLine11: TppLine
              UserName = 'Line11'
              ParentWidth = True
              Position = lpBottom
              Weight = 0.75
              mmHeight = 529
              mmLeft = 0
              mmTop = 6615
              mmWidth = 284300
              BandType = 7
            end
            object ppLine12: TppLine
              UserName = 'Line12'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.75
              mmHeight = 7144
              mmLeft = 0
              mmTop = 0
              mmWidth = 265
              BandType = 7
            end
            object ppLine13: TppLine
              UserName = 'Line13'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.75
              mmHeight = 7144
              mmLeft = 284163
              mmTop = 0
              mmWidth = 265
              BandType = 7
            end
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel3: TppLabel
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
        mmHeight = 3440
        mmLeft = 89694
        mmTop = 3175
        mmWidth = 18256
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
      BreakName = 'PATROCINADORA'
      DataPipeline = ppGerencial
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppGerencial'
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
    object ppGroup2: TppGroup
      BreakName = 'PLANOPREVIDENCIARIO'
      DataPipeline = ppGerencial
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppGerencial'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppLabel2: TppLabel
          UserName = 'Label1'
          Caption = 'Plano Previdenciário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 112713
          mmTop = 1058
          mmWidth = 34660
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label2'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 1058
          mmWidth = 23548
          BandType = 3
          GroupNo = 1
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'PATROCINADORA'
          DataPipeline = ppGerencial
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppGerencial'
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 5821
          mmWidth = 30956
          BandType = 3
          GroupNo = 1
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'PLANOPREVIDENCIARIO'
          DataPipeline = ppGerencial
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppGerencial'
          mmHeight = 3969
          mmLeft = 112713
          mmTop = 5821
          mmWidth = 42333
          BandType = 3
          GroupNo = 1
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 10848
          mmWidth = 284300
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
  object qryGerencial01: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsGerencial
    SQL.Strings = (
      'SELECT PLP.IDPESSJUR,'
      '       PLP.IDPLANOPREV,'
      '       F.IDFILIALPESSOA,'
      '       DECODE(P.NOME, NULL, '#39'Não Identificada'#39', P.NOME) AS NOME,'
      '       P.IDGRUPO,'
      '       DECODE(Q1.TOTAL,NULL,0,Q1.TOTAL) AS TOTALATIVOS,'
      '       DECODE(Q2.TOTAL,NULL,0,Q2.TOTAL) AS TOTALMANTIDOS,'
      '       DECODE(Q3.TOTAL,NULL,0,Q3.TOTAL) AS TOTALPARTICIPANTES,'
      '       DECODE(Q4.TOTAL,NULL,0,Q4.TOTAL) AS NAOPARTICIPANTES,'
      '       DECODE (Q3.TOTAL+Q4.TOTAL, 0,    0,'
      '                                  NULL, 0,'
      
        '                                  (Q3.TOTAL / (Q3.TOTAL + Q4.TOT' +
        'AL)) * 100 ) AS ADESAO,'
      '       DECODE(Q5.TOTAL,NULL,0,Q5.TOTAL) AS SALPARTICIPANTES,'
      '       DECODE(Q6.TOTAL,NULL,0,Q6.TOTAL) AS SALNAOPARTICIPANTES,'
      '       DECODE (Q5.TOTAL+Q6.TOTAL, 0,    0,'
      '                                  NULL, 0,'
      
        '                                  (Q5.TOTAL / (Q5.TOTAL + Q6.TOT' +
        'AL)) * 100 ) AS PARTICIPANCAONAMASSA,'
      '       Q7.MEDIAETARIAPART AS MEDIAETARIAPART,'
      '       Q8.MEDIAETARIANAOPART AS MEDIAETARIANAOPART,'
      '       0 AS MEDIATEMPOATIVOS,'
      '       0 AS MEDIATEMPOMANTIDOS,'
      '       0 AS MEDIATEMPOTOTAL,'
      '       0 AS TOTALBENEF'
      'FROM   PESSOA P, FILIALPESSOA F, PLANPREVPATRO PLP,'
      '-- QUERY 1'
      '      (SELECT EL.IDESTAB, COUNT(DISTINCT EP.IDPESSOA) AS TOTAL'
      '       FROM   ELEGPATRO EL, SITPART SP, EVENTOSPREV  EP'
      '       WHERE  EP.IDPESSJUR    = :IDPESSJUR'
      '       AND    EP.IDPLANOPREV  = :IDPLANOPREV'
      '       AND    EL.IDPESSJUR    = EP.IDPESSJUR'
      '       AND    EL.IDPESSOA     = EP.IDPESSOA'
      '       AND    SP.FLGINTERNO   IN ('#39'AT'#39', '#39'MP'#39' )'
      '       AND    EP.IDSITPARTNOVO = SP.IDSITPART'
      
        '       AND    TO_CHAR(EP.DATAEVENTO, '#39'YYYY/MM'#39') <= :ANOMESREFERE' +
        'NCIA'
      '       AND    NOT EXISTS ( SELECT 1 FROM EVENTOSPREV'
      '                           WHERE  IDPESSJUR   = EP.IDPESSJUR'
      '                           AND    IDPLANOPREV = EP.IDPLANOPREV'
      '                           AND    IDPESSOA    = EP.IDPESSOA'
      '                           AND    SEQPROPOSTA = EP.SEQPROPOSTA'
      '                           AND    DATAEVENTO > EP.DATAEVENTO )'
      
        '       GROUP BY EL.IDESTAB                                      ' +
        '         ) Q1,'
      '-- QUERY 2'
      '      (SELECT EL.IDESTAB, COUNT(DISTINCT EP.IDPESSOA) AS TOTAL'
      '       FROM   ELEGPATRO EL, SITPART SP, EVENTOSPREV  EP'
      '       WHERE  EP.IDPESSJUR    = :IDPESSJUR'
      '       AND    EP.IDPLANOPREV  = :IDPLANOPREV'
      '       AND    EL.IDPESSJUR    = EP.IDPESSJUR'
      '       AND    EL.IDPESSOA     = EP.IDPESSOA'
      '       AND    SP.FLGINTERNO   = '#39'MA'#39
      '       AND    EP.IDSITPARTNOVO = SP.IDSITPART'
      
        '       AND    TO_CHAR(EP.DATAEVENTO, '#39'YYYY/MM'#39') <= :ANOMESREFERE' +
        'NCIA'
      '       AND    NOT EXISTS ( SELECT 1 FROM EVENTOSPREV'
      '                           WHERE  IDPESSJUR   = EP.IDPESSJUR'
      '                           AND    IDPLANOPREV = EP.IDPLANOPREV'
      '                           AND    IDPESSOA    = EP.IDPESSOA'
      '                           AND    SEQPROPOSTA = EP.SEQPROPOSTA'
      '                           AND    DATAEVENTO > EP.DATAEVENTO )'
      
        '       GROUP BY EL.IDESTAB                                      ' +
        '         ) Q2,'
      '-- QUERY 3'
      '      (SELECT EL.IDESTAB, COUNT(DISTINCT EP.IDPESSOA) AS TOTAL'
      '       FROM   ELEGPATRO EL, SITPART SP, EVENTOSPREV  EP'
      '       WHERE  EP.IDPESSJUR    = :IDPESSJUR'
      '       AND    EP.IDPLANOPREV  = :IDPLANOPREV'
      '       AND    EL.IDPESSJUR    = EP.IDPESSJUR'
      '       AND    EL.IDPESSOA     = EP.IDPESSOA'
      '       AND    SP.FLGINTERNO  NOT IN ('#39'CA'#39', '#39'AE'#39', '#39'PN'#39')'
      '       AND    EP.IDSITPARTNOVO = SP.IDSITPART'
      
        '       AND    TO_CHAR(EP.DATAEVENTO, '#39'YYYY/MM'#39') <= :ANOMESREFERE' +
        'NCIA'
      '       AND    NOT EXISTS ( SELECT 1 FROM EVENTOSPREV'
      '                           WHERE  IDPESSJUR   = EP.IDPESSJUR'
      '                           AND    IDPLANOPREV = EP.IDPLANOPREV'
      '                           AND    IDPESSOA    = EP.IDPESSOA'
      '                           AND    SEQPROPOSTA = EP.SEQPROPOSTA'
      '                           AND    DATAEVENTO > EP.DATAEVENTO )'
      
        '       GROUP BY EL.IDESTAB                                      ' +
        '         ) Q3,'
      '-- QUERY 4'
      '      (SELECT EL.IDESTAB, COUNT(EL.IDPESSOA) AS TOTAL'
      '       FROM   ELEGPATRO EL'
      '       WHERE  EL.IDPESSJUR    = :IDPESSJUR'
      '       AND   ('
      '              (EXISTS (SELECT PP.IDPESSOA'
      '                       FROM   PARTPREVPLAN PP'
      '                       WHERE  PP.IDPESSJUR   = EL.IDPESSJUR'
      '                       AND    PP.IDPLANOPREV = :IDPLANOPREV'
      '                       AND    PP.IDPESSOA    = EL.IDPESSOA'
      '                       AND    PP.SEQPROPOSTA = 1'
      
        '                       AND    TO_CHAR(PP.INSCRICAODATA,'#39'YYYY/MM'#39 +
        ') > :ANOMESREFERENCIA'
      
        '                       AND   ((TO_CHAR(PP.DATACANCELAMENTO,'#39'YYYY' +
        '/MM'#39') < :ANOMESREFERENCIA ) OR'
      
        '                              (PP.DATACANCELAMENTO IS NULL) ) ) ' +
        ')'
      '               OR'
      '              (NOT EXISTS (SELECT PP.IDPESSOA'
      '                       FROM   PARTPREVPLAN PP'
      '                       WHERE  PP.IDPESSJUR   = :IDPESSJUR'
      '                       AND    PP.IDPLANOPREV = :IDPLANOPREV'
      '                       AND    PP.IDPESSOA    = EL.IDPESSOA'
      '                       AND    PP.SEQPROPOSTA = 1'
      
        '                       AND    PP.IDPESSJUR   = EL.IDPESSJUR ) ) ' +
        ')'
      
        '       GROUP BY EL.IDESTAB                                      ' +
        '            ) Q4,'
      '-- Q5'
      '      (SELECT EL.IDESTAB, SUM(HST.VALORPROVENTO) AS TOTAL'
      
        '       FROM   PATRO PT, ELEGPATRO EL, SITPART SP, EVENTOSPREV  E' +
        'P,  HISTRUBSAL HST'
      '       WHERE  EP.IDPESSJUR    = :IDPESSJUR'
      '       AND    EP.IDPLANOPREV  = :IDPLANOPREV'
      '       AND    EL.IDPESSJUR    = EP.IDPESSJUR'
      '       AND    EL.IDPESSOA     = EP.IDPESSOA'
      '       AND    PT.IDPESSOA     = EL.IDPESSJUR'
      '       AND    HST.MES         = :ANOMESREFERENCIA'
      '       AND    HST.IDPESSJUR   = EL.IDPESSJUR'
      '       AND    HST.IDPESSOA    = EL.IDPESSOA'
      
        '       AND    ((HST.IDRUBRICA = PT.IDRUBSALPARTICIP) OR (HST.IDR' +
        'UBRICA = PT.IDRUBSALMANUT)) '
      '       AND    SP.FLGINTERNO  NOT IN ('#39'CA'#39', '#39'AE'#39', '#39'PN'#39')'
      '       AND    EP.IDSITPARTNOVO = SP.IDSITPART'
      
        '       AND    TO_CHAR(EP.DATAEVENTO, '#39'YYYY/MM'#39') <= :ANOMESREFERE' +
        'NCIA'
      '       AND    NOT EXISTS ( SELECT 1 FROM EVENTOSPREV'
      '                           WHERE  IDPESSJUR   = EP.IDPESSJUR'
      '                           AND    IDPLANOPREV = EP.IDPLANOPREV'
      '                           AND    IDPESSOA    = EP.IDPESSOA'
      '                           AND    SEQPROPOSTA = EP.SEQPROPOSTA'
      '                           AND    DATAEVENTO > EP.DATAEVENTO )'
      
        '       GROUP BY EL.IDESTAB                                      ' +
        '         ) Q5,'
      '-- Q6'
      '      (SELECT EL.IDESTAB, SUM(HST.VALORPROVENTO) AS TOTAL'
      '       FROM   ELEGPATRO EL, PATRO PT, HISTRUBSAL HST'
      '       WHERE  EL.IDPESSJUR    = :IDPESSJUR'
      '       AND    PT.IDPESSOA     = EL.IDPESSJUR'
      '       AND    HST.IDPESSJUR   = EL.IDPESSJUR'
      '       AND    HST.IDPESSOA    = EL.IDPESSOA'
      '       AND    HST.MES         = :ANOMESREFERENCIA'
      '       AND   ('
      '              (EXISTS (SELECT PP.IDPESSOA'
      '                       FROM   PARTPREVPLAN PP'
      '                       WHERE  PP.IDPESSJUR   = EL.IDPESSJUR'
      '                       AND    PP.IDPLANOPREV = :IDPLANOPREV'
      '                       AND    PP.IDPESSOA    = EL.IDPESSOA'
      '                       AND    PP.SEQPROPOSTA = 1'
      
        '                       AND    TO_CHAR(PP.INSCRICAODATA,'#39'YYYY/MM'#39 +
        ') > :ANOMESREFERENCIA'
      
        '                       AND   ((TO_CHAR(PP.DATACANCELAMENTO,'#39'YYYY' +
        '/MM'#39') < :ANOMESREFERENCIA ) OR'
      
        '                              (PP.DATACANCELAMENTO IS NULL) ) ) ' +
        ')'
      '               OR'
      '              (NOT EXISTS (SELECT PP.IDPESSOA'
      '                       FROM   PARTPREVPLAN PP'
      '                       WHERE  PP.IDPESSJUR   = :IDPESSJUR'
      '                       AND    PP.IDPLANOPREV = :IDPLANOPREV'
      '                       AND    PP.IDPESSOA    = EL.IDPESSOA'
      '                       AND    PP.SEQPROPOSTA = 1'
      
        '                       AND    PP.IDPESSJUR   = EL.IDPESSJUR ) ) ' +
        ')'
      
        '       GROUP BY EL.IDESTAB                                      ' +
        '         ) Q6,'
      '-- QUERY 7'
      '      (SELECT EL.IDESTAB,'
      
        '              SUM((TO_DATE('#39'01/'#39'||SUBSTR(:ANOMESREFERENCIA,6,2)|' +
        '|'#39'/'#39'||SUBSTR(:ANOMESREFERENCIA,1,4),'#39'DD/MM/YYYY'#39')'
      '                   -'
      
        '                   PF.DATANASC) / 365.5) / COUNT(EL.IDPESSOA) AS' +
        ' MEDIAETARIAPART'
      
        '       FROM   PESSOAFISICA PF, ELEGPATRO EL, SITPART SP, EVENTOS' +
        'PREV  EP'
      '       WHERE  EP.IDPESSJUR    = :IDPESSJUR'
      '       AND    EP.IDPLANOPREV  = :IDPLANOPREV'
      '       AND    PF.IDPESSOA     = EL.IDPESSOA'
      '       AND    EL.IDPESSJUR    = EP.IDPESSJUR'
      '       AND    EL.IDPESSOA     = EP.IDPESSOA'
      '       AND    SP.FLGINTERNO  NOT IN ('#39'CA'#39', '#39'AE'#39', '#39'PN'#39')'
      '       AND    EP.IDSITPARTNOVO = SP.IDSITPART'
      
        '       AND    TO_CHAR(EP.DATAEVENTO, '#39'YYYY/MM'#39') <= :ANOMESREFERE' +
        'NCIA'
      '       AND    NOT EXISTS ( SELECT 1 FROM EVENTOSPREV'
      '                           WHERE  IDPESSJUR   = EP.IDPESSJUR'
      '                           AND    IDPLANOPREV = EP.IDPLANOPREV'
      '                           AND    IDPESSOA    = EP.IDPESSOA'
      '                           AND    SEQPROPOSTA = EP.SEQPROPOSTA'
      '                           AND    DATAEVENTO > EP.DATAEVENTO )'
      
        '       GROUP BY EL.IDESTAB                                      ' +
        '         ) Q7,'
      '-- QUERY 8'
      '      (SELECT EL.IDESTAB,'
      
        '              SUM((TO_DATE('#39'01/'#39'||SUBSTR(:ANOMESREFERENCIA,6,2)|' +
        '|'#39'/'#39'||SUBSTR(:ANOMESREFERENCIA,1,4),'#39'DD/MM/YYYY'#39')'
      '                   -'
      
        '                   PF.DATANASC) / 365.5) / COUNT(EL.IDPESSOA) AS' +
        ' MEDIAETARIANAOPART'
      '       FROM   PESSOAFISICA PF, ELEGPATRO EL'
      '       WHERE  EL.IDPESSJUR    = :IDPESSJUR'
      '       AND    PF.IDPESSOA     = EL.IDPESSOA'
      '       AND   ('
      '              (EXISTS (SELECT PP.IDPESSOA'
      '                       FROM   PARTPREVPLAN PP'
      '                       WHERE  PP.IDPESSJUR   = EL.IDPESSJUR'
      '                       AND    PP.IDPLANOPREV = :IDPLANOPREV'
      '                       AND    PP.IDPESSOA    = EL.IDPESSOA'
      '                       AND    PP.SEQPROPOSTA = 1'
      
        '                       AND    TO_CHAR(PP.INSCRICAODATA,'#39'YYYY/MM'#39 +
        ') > :ANOMESREFERENCIA'
      
        '                       AND   ((TO_CHAR(PP.DATACANCELAMENTO,'#39'YYYY' +
        '/MM'#39') < :ANOMESREFERENCIA ) OR'
      
        '                              (PP.DATACANCELAMENTO IS NULL) ) ) ' +
        ')'
      '               OR'
      '              (NOT EXISTS (SELECT PP.IDPESSOA'
      '                       FROM   PARTPREVPLAN PP'
      '                       WHERE  PP.IDPESSJUR   = :IDPESSJUR'
      '                       AND    PP.IDPLANOPREV = :IDPLANOPREV'
      '                       AND    PP.IDPESSOA    = EL.IDPESSOA'
      '                       AND    PP.SEQPROPOSTA = 1'
      
        '                       AND    PP.IDPESSJUR   = EL.IDPESSJUR ) ) ' +
        ')'
      
        '       GROUP BY EL.IDESTAB                                      ' +
        '            ) Q8'
      'WHERE  PLP.IDPESSJUR   = :IDPESSJUR'
      'AND    PLP.IDPLANOPREV = :IDPLANOPREV'
      'AND    P.IDGRUPO(+)    = PLP.IDPESSJUR'
      'AND    P.IDPESSOA      = F.IDFILIALPESSOA(+)'
      'AND    Q1.IDESTAB(+)   = F.IDFILIALPESSOA'
      'AND    Q2.IDESTAB(+)   = F.IDFILIALPESSOA'
      'AND    Q3.IDESTAB(+)   = F.IDFILIALPESSOA'
      'AND    Q4.IDESTAB(+)   = F.IDFILIALPESSOA'
      'AND    Q5.IDESTAB(+)   = F.IDFILIALPESSOA'
      'AND    Q6.IDESTAB(+)   = F.IDFILIALPESSOA'
      'ORDER  BY P.NOME  '
      ' ')
    ValidateWithMask = True
    Left = 31
    Top = 96
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'ANOMESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'ANOMESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'ANOMESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'ANOMESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'ANOMESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'ANOMESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'ANOMESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'ANOMESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'ANOMESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'ANOMESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'ANOMESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'ANOMESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'ANOMESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'ANOMESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'ANOMESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'ANOMESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'ANOMESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object dsGerencial01: TwwDataSource
    AutoEdit = False
    DataSet = qryGerencial01
    Left = 73
    Top = 96
  end
  object ppGerencial01: TppBDEPipeline
    DataSource = dsGerencial01
    UserName = 'Gerencial01'
    Left = 130
    Top = 96
    MasterDataPipelineName = 'ppGerencial'
    object ppGerencial01ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppGerencial01ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppGerencial01ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFILIALPESSOA'
      FieldName = 'IDFILIALPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppGerencial01ppField4: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppGerencial01ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDGRUPO'
      FieldName = 'IDGRUPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppGerencial01ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALATIVOS'
      FieldName = 'TOTALATIVOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppGerencial01ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALMANTIDOS'
      FieldName = 'TOTALMANTIDOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppGerencial01ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALPARTICIPANTES'
      FieldName = 'TOTALPARTICIPANTES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppGerencial01ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'NAOPARTICIPANTES'
      FieldName = 'NAOPARTICIPANTES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppGerencial01ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'ADESAO'
      FieldName = 'ADESAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppGerencial01ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALPARTICIPANTES'
      FieldName = 'SALPARTICIPANTES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppGerencial01ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALNAOPARTICIPANTES'
      FieldName = 'SALNAOPARTICIPANTES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppGerencial01ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARTICIPANCAONAMASSA'
      FieldName = 'PARTICIPANCAONAMASSA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppGerencial01ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'MEDIAETARIAPART'
      FieldName = 'MEDIAETARIAPART'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppGerencial01ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'MEDIAETARIANAOPART'
      FieldName = 'MEDIAETARIANAOPART'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppGerencial01ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'MEDIATEMPOATIVOS'
      FieldName = 'MEDIATEMPOATIVOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppGerencial01ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'MEDIATEMPOMANTIDOS'
      FieldName = 'MEDIATEMPOMANTIDOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppGerencial01ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'MEDIATEMPOTOTAL'
      FieldName = 'MEDIATEMPOTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppGerencial01ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALBENEF'
      FieldName = 'TOTALBENEF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
  end
  object qryGerencial02: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'                                                    '#39' AS' +
        ' PATRO,'
      
        '       '#39'                                                    '#39' AS' +
        ' TIPO ,'
      
        '       '#39'                                                    '#39' AS' +
        ' LABEL,'
      '       0 AS QTDFEM   ,'
      '       0 AS MEDIAFEM ,'
      '       0 AS QTDMASC  ,'
      '       0 AS MEDIAMASC,'
      '       0 AS QTDGERAL ,'
      '       0 AS PERCENTUAL,'
      '       0 AS PERCFEM,'
      '       0 AS PERCMASC'
      'FROM DUAL')
    UpdateObject = updGerencial2
    ValidateWithMask = True
    Left = 32
    Top = 133
  end
  object dsGerencial02: TwwDataSource
    DataSet = qryGerencial02
    Left = 73
    Top = 133
  end
  object plGerencial02: TppBDEPipeline
    DataSource = dsGerencial02
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plGerencial02'
    Left = 131
    Top = 134
  end
  object rpGerencial02: TppReport
    AutoStop = False
    DataPipeline = plGerencial02
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 178
    Top = 133
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'plGerencial02'
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'ppShape1'
        mmHeight = 4763
        mmLeft = 24606
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppShape2: TppShape
        UserName = 'ppShape2'
        mmHeight = 4763
        mmLeft = 85725
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppShape3: TppShape
        UserName = 'ppShape3'
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppShape5: TppShape
        UserName = 'ppShape5'
        mmHeight = 4763
        mmLeft = 150284
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'ppDBText19'
        DataField = 'LABEL'
        DataPipeline = plGerencial02
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plGerencial02'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 265
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'ppDBText20'
        DataField = 'QTDFEM'
        DataPipeline = plGerencial02
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plGerencial02'
        mmHeight = 4233
        mmLeft = 88371
        mmTop = 265
        mmWidth = 14288
        BandType = 4
      end
      object rpGerencial02DBText3: TppDBText
        UserName = 'rpGerencial02DBText3'
        DataField = 'MEDIAFEM'
        DataPipeline = plGerencial02
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'plGerencial02'
        mmHeight = 4233
        mmLeft = 132027
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object rpGerencial02DBText6: TppDBText
        UserName = 'rpGerencial02DBText6'
        DataField = 'QTDMASC'
        DataPipeline = plGerencial02
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plGerencial02'
        mmHeight = 4233
        mmLeft = 152929
        mmTop = 265
        mmWidth = 14288
        BandType = 4
      end
      object rpGerencial02DBText17: TppDBText
        UserName = 'rpGerencial02DBText17'
        DataField = 'MEDIAMASC'
        DataPipeline = plGerencial02
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'plGerencial02'
        mmHeight = 4233
        mmLeft = 196586
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object rpGerencial02Shape2: TppShape
        UserName = 'rpGerencial02Shape2'
        mmHeight = 4763
        mmLeft = 214842
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object rpGerencial02DBText1: TppDBText
        UserName = 'rpGerencial02DBText1'
        DataField = 'QTDGERAL'
        DataPipeline = plGerencial02
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plGerencial02'
        mmHeight = 4233
        mmLeft = 32015
        mmTop = 265
        mmWidth = 14288
        BandType = 4
      end
      object rpGerencial02DBText4: TppDBText
        UserName = 'rpGerencial02DBText4'
        DataField = 'PERCENTUAL'
        DataPipeline = plGerencial02
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plGerencial02'
        mmHeight = 4233
        mmLeft = 64029
        mmTop = 265
        mmWidth = 14288
        BandType = 4
      end
      object rpGerencial02DBText5: TppDBText
        UserName = 'rpGerencial02DBText5'
        DataField = 'PERCFEM'
        DataPipeline = plGerencial02
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'plGerencial02'
        mmHeight = 4233
        mmLeft = 106627
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object rpGerencial02DBText16: TppDBText
        UserName = 'rpGerencial02DBText16'
        DataField = 'PERCMASC'
        DataPipeline = plGerencial02
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'plGerencial02'
        mmHeight = 4233
        mmLeft = 171186
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 19844
      mmPrintPosition = 0
      object ppLabel32: TppLabel
        UserName = 'ppLabel32'
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
        mmWidth = 272786
        BandType = 8
      end
      object ppLine14: TppLine
        UserName = 'ppLine14'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppCalc3: TppSystemVariable
        UserName = 'SystemVariable1'
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
        mmWidth = 272786
        BandType = 8
      end
      object ppCalc4: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 243946
        mmTop = 3175
        mmWidth = 29104
        BandType = 8
      end
    end
    object rpGerencial02SummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object Ger02Sub01: TppSubReport
        UserName = 'Ger02Sub01'
        ExpandAll = False
        NewPrintJob = True
        OutlineSettings.CreateNode = True
        PrintBehavior = pbSection
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpGerencial02ChildReport1: TppChildReport
          AutoStop = False
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
          Version = '7.04'
          mmColumnWidth = 0
          object rpGerencial02ChildReport1TitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 50536
            mmPrintPosition = 0
            object rpGerencial02ChildReport1DBText1: TppDBText
              UserName = 'rpGerencial02ChildReport1DBText1'
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
              mmLeft = 43127
              mmTop = 2381
              mmWidth = 153988
              BandType = 1
            end
            object rpGerencial02ChildReport1DBText2: TppDBText
              UserName = 'rpGerencial02ChildReport1DBText2'
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
              mmLeft = 43127
              mmTop = 21696
              mmWidth = 54769
              BandType = 1
            end
            object rpGerencial02ChildReport1DBText3: TppDBText
              UserName = 'rpGerencial02ChildReport1DBText3'
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
              mmLeft = 43127
              mmTop = 8996
              mmWidth = 115623
              BandType = 1
            end
            object rpGerencial02ChildReport1DBImage1: TppDBImage
              UserName = 'rpGerencial02ChildReport1DBImage1'
              MaintainAspectRatio = True
              Stretch = True
              DataField = 'IMAGEM'
              DataPipeline = ppFundacao
              GraphicType = 'Bitmap'
              ParentDataPipeline = False
              DataPipelineName = 'ppFundacao'
              mmHeight = 25135
              mmLeft = 1852
              mmTop = 2117
              mmWidth = 39688
              BandType = 1
            end
            object rpGerencial02ChildReport1DBText4: TppDBText
              UserName = 'rpGerencial02ChildReport1DBText4'
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
              mmHeight = 3704
              mmLeft = 43127
              mmTop = 13494
              mmWidth = 116152
              BandType = 1
            end
            object rpGerencial02ChildReport1DBText5: TppDBText
              UserName = 'rpGerencial02ChildReport1DBText5'
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
              mmHeight = 3704
              mmLeft = 43127
              mmTop = 17463
              mmWidth = 115359
              BandType = 1
            end
            object rpGerencial02ChildReport1Label1: TppLabel
              UserName = 'rpGerencial02ChildReport1Label1'
              Caption = 
                '5 - Distribuição por Faixa Salarial, por Patrocinadora (em VRS, ' +
                'onde VRS ='
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 31750
              mmWidth = 126471
              BandType = 1
            end
            object rpGerencial02ChildReport1Label2: TppLabel
              UserName = 'rpGerencial02ChildReport1Label2'
              Caption = 'PATROCINADORA :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 38894
              mmWidth = 32015
              BandType = 1
            end
            object rpGerencial02ChildReport1DBText6: TppDBText
              UserName = 'rpGerencial02ChildReport1DBText6'
              AutoSize = True
              DataField = 'PATRO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 33602
              mmTop = 38894
              mmWidth = 12171
              BandType = 1
            end
            object lbVRS: TppLabel
              UserName = 'lbVRS'
              AutoSize = False
              Caption = 'lbVRS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 127265
              mmTop = 31750
              mmWidth = 15610
              BandType = 1
            end
            object rpGerencial02ChildReport1Label3: TppLabel
              UserName = 'rpGerencial02ChildReport1Label3'
              AutoSize = False
              Caption = ').'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 143669
              mmTop = 31750
              mmWidth = 3175
              BandType = 1
            end
            object rpGerencial02ChildReport1Label12: TppLabel
              UserName = 'rpGerencial02ChildReport1Label12'
              Caption = 'PLANO :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 17992
              mmTop = 43656
              mmWidth = 14023
              BandType = 1
            end
            object lbPlano02: TppLabel
              UserName = 'lbPlano02'
              Caption = 'lbPlano02'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 33602
              mmTop = 43656
              mmWidth = 15875
              BandType = 1
            end
          end
          object rpGerencial02ChildReport1DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object rpGerencial02ChildReport1Shape6: TppShape
              UserName = 'rpGerencial02ChildReport1Shape6'
              mmHeight = 4763
              mmLeft = 0
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object rpGerencial02ChildReport1Shape7: TppShape
              UserName = 'rpGerencial02ChildReport1Shape7'
              mmHeight = 4763
              mmLeft = 24606
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object rpGerencial02ChildReport1Shape8: TppShape
              UserName = 'rpGerencial02ChildReport1Shape8'
              mmHeight = 4763
              mmLeft = 86519
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object rpGerencial02ChildReport1Shape9: TppShape
              UserName = 'rpGerencial02ChildReport1Shape9'
              mmHeight = 4763
              mmLeft = 111125
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object rpGerencial02ChildReport1Shape10: TppShape
              UserName = 'rpGerencial02ChildReport1Shape10'
              mmHeight = 4763
              mmLeft = 149490
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object rpGerencial02ChildReport1DBText8: TppDBText
              UserName = 'rpGerencial02ChildReport1DBText8'
              DataField = 'FAIXA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 794
              mmTop = 265
              mmWidth = 23019
              BandType = 4
            end
            object rpGerencial02ChildReport1DBText9: TppDBText
              UserName = 'rpGerencial02ChildReport1DBText9'
              DataField = 'VALORABSOLUTO'
              DisplayFormat = '###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 26194
              mmTop = 265
              mmWidth = 23019
              BandType = 4
            end
            object rpGerencial02ChildReport1DBText10: TppDBText
              UserName = 'rpGerencial02ChildReport1DBText10'
              DataField = 'MEDIASALARIAL'
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 87577
              mmTop = 265
              mmWidth = 23019
              BandType = 4
            end
            object dtRelatTipo: TppLabel
              UserName = 'dtRelatTipo'
              AutoSize = False
              Caption = 'dtRelatTipo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 57150
              mmTop = 265
              mmWidth = 20902
              BandType = 4
            end
            object dtRelatGeral: TppLabel
              UserName = 'dtRelatGeral'
              AutoSize = False
              Caption = 'dtRelatGeral'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 116681
              mmTop = 265
              mmWidth = 20902
              BandType = 4
            end
          end
          object rpGerencial02ChildReport1SummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object rpGerencial02ChildReport1Label11: TppLabel
              UserName = 'rpGerencial02ChildReport1Label11'
              Caption = 'TOTAL GERAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 794
              mmTop = 0
              mmWidth = 24077
              BandType = 7
            end
            object rpGerencial02ChildReport1DBCalc2: TppDBCalc
              UserName = 'rpGerencial02ChildReport1DBCalc2'
              DataField = 'VALORABSOLUTO'
              DisplayFormat = '###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 26458
              mmTop = 0
              mmWidth = 22754
              BandType = 7
            end
          end
          object rpGerencial02ChildReport1Group1: TppGroup
            BreakName = 'TIPO'
            OutlineSettings.CreateNode = True
            UserName = 'rpGerencial02ChildReport1Group1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = ''
            object rpGerencial02ChildReport1GroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 12965
              mmPrintPosition = 0
              object rpGerencial02ChildReport1Shape1: TppShape
                UserName = 'rpGerencial02ChildReport1Shape1'
                mmHeight = 12965
                mmLeft = 0
                mmTop = 0
                mmWidth = 24871
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial02ChildReport1Label4: TppLabel
                UserName = 'rpGerencial02ChildReport1Label4'
                Caption = 'Faixa'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 4233
                mmLeft = 7408
                mmTop = 4498
                mmWidth = 9525
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial02ChildReport1Shape2: TppShape
                UserName = 'rpGerencial02ChildReport1Shape2'
                mmHeight = 12965
                mmLeft = 24606
                mmTop = 0
                mmWidth = 62177
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial02ChildReport1Label5: TppLabel
                UserName = 'rpGerencial02ChildReport1Label5'
                Caption = 'Absoluta'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 34660
                mmTop = 6879
                mmWidth = 14552
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial02ChildReport1Label6: TppLabel
                UserName = 'rpGerencial02ChildReport1Label6'
                Caption = 'Relativa'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 4233
                mmLeft = 64294
                mmTop = 6879
                mmWidth = 13758
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial02ChildReport1Shape3: TppShape
                UserName = 'rpGerencial02ChildReport1Shape3'
                mmHeight = 12965
                mmLeft = 86519
                mmTop = 0
                mmWidth = 24871
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial02ChildReport1Label7: TppLabel
                UserName = 'rpGerencial02ChildReport1Label7'
                Caption = 'Média'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 4233
                mmLeft = 93663
                mmTop = 1852
                mmWidth = 10319
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial02ChildReport1Label8: TppLabel
                UserName = 'rpGerencial02ChildReport1Label8'
                Caption = 'Salarial'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 4233
                mmLeft = 92340
                mmTop = 6879
                mmWidth = 13229
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial02ChildReport1DBText7: TppDBText
                UserName = 'rpGerencial02ChildReport1DBText7'
                DataField = 'TIPO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 4233
                mmLeft = 26194
                mmTop = 1588
                mmWidth = 59002
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial02ChildReport1Shape4: TppShape
                UserName = 'rpGerencial02ChildReport1Shape4'
                mmHeight = 12965
                mmLeft = 111125
                mmTop = 0
                mmWidth = 38629
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial02ChildReport1Label10: TppLabel
                UserName = 'rpGerencial02ChildReport1Label10'
                Caption = 'Relativa'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 4233
                mmLeft = 123825
                mmTop = 7144
                mmWidth = 13758
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial02ChildReport1Label13: TppLabel
                UserName = 'rpGerencial02ChildReport1Label13'
                AutoSize = False
                Caption = 'GERAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 4233
                mmLeft = 112448
                mmTop = 1852
                mmWidth = 35983
                BandType = 3
                GroupNo = 0
              end
            end
            object rpGerencial02ChildReport1GroupFooterBand1: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 12700
              mmPrintPosition = 0
              object rpGerencial02ChildReport1Shape12: TppShape
                UserName = 'rpGerencial02ChildReport1Shape12'
                mmHeight = 6085
                mmLeft = 0
                mmTop = 0
                mmWidth = 24871
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial02ChildReport1Shape13: TppShape
                UserName = 'rpGerencial02ChildReport1Shape13'
                mmHeight = 6085
                mmLeft = 24606
                mmTop = 0
                mmWidth = 62177
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial02ChildReport1Shape14: TppShape
                UserName = 'rpGerencial02ChildReport1Shape14'
                mmHeight = 6085
                mmLeft = 86519
                mmTop = 0
                mmWidth = 24871
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial02ChildReport1Shape15: TppShape
                UserName = 'rpGerencial02ChildReport1Shape15'
                mmHeight = 6085
                mmLeft = 111125
                mmTop = 0
                mmWidth = 38629
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial02ChildReport1Label9: TppLabel
                UserName = 'rpGerencial02ChildReport1Label9'
                Caption = 'TOTAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 4233
                mmLeft = 6615
                mmTop = 1058
                mmWidth = 11377
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial02ChildReport1DBCalc1: TppDBCalc
                UserName = 'rpGerencial02ChildReport1DBCalc1'
                DataField = 'VALORABSOLUTO'
                DisplayFormat = '###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                ParentDataPipeline = False
                ResetGroup = rpGerencial02ChildReport1Group1
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 26458
                mmTop = 1058
                mmWidth = 22754
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
      object Ger02Sub02: TppSubReport
        UserName = 'Ger02Sub02'
        ExpandAll = False
        NewPrintJob = True
        OutlineSettings.CreateNode = True
        PrintBehavior = pbSection
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 4763
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpGerencial02ChildReport2: TppChildReport
          AutoStop = False
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
          Version = '7.04'
          mmColumnWidth = 0
          object rpGerencial02TitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 63236
            mmPrintPosition = 0
            object rpGerencial02DBText7: TppDBText
              UserName = 'rpGerencial02DBText7'
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
              mmLeft = 43127
              mmTop = 2381
              mmWidth = 153988
              BandType = 1
            end
            object rpGerencial02DBText8: TppDBText
              UserName = 'rpGerencial02DBText8'
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
              mmLeft = 43127
              mmTop = 21696
              mmWidth = 54769
              BandType = 1
            end
            object rpGerencial02DBText9: TppDBText
              UserName = 'rpGerencial02DBText9'
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
              mmLeft = 43127
              mmTop = 8996
              mmWidth = 115623
              BandType = 1
            end
            object rpGerencial02DBImage1: TppDBImage
              UserName = 'rpGerencial02DBImage1'
              MaintainAspectRatio = True
              Stretch = True
              DataField = 'IMAGEM'
              DataPipeline = ppFundacao
              GraphicType = 'Bitmap'
              ParentDataPipeline = False
              DataPipelineName = 'ppFundacao'
              mmHeight = 25135
              mmLeft = 1852
              mmTop = 2117
              mmWidth = 39688
              BandType = 1
            end
            object rpGerencial02DBText10: TppDBText
              UserName = 'rpGerencial02DBText10'
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
              mmHeight = 3704
              mmLeft = 43127
              mmTop = 13494
              mmWidth = 116152
              BandType = 1
            end
            object rpGerencial02DBText11: TppDBText
              UserName = 'rpGerencial02DBText11'
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
              mmHeight = 3704
              mmLeft = 43127
              mmTop = 17463
              mmWidth = 115359
              BandType = 1
            end
            object rpGerencial02Label16: TppLabel
              UserName = 'rpGerencial02Label16'
              Caption = 
                '6 - Distribuição dos Percentuais de Contribuição Suplementar Fac' +
                'ultativa por Patrocinadora.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 31221
              mmWidth = 155311
              BandType = 1
            end
            object rpGerencial02Label17: TppLabel
              UserName = 'rpGerencial02Label17'
              Caption = 'PATROCINADORA :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 38894
              mmWidth = 32015
              BandType = 1
            end
            object rpGerencial02DBText12: TppDBText
              UserName = 'rpGerencial02DBText12'
              AutoSize = True
              DataField = 'PATRO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 33602
              mmTop = 38894
              mmWidth = 12171
              BandType = 1
            end
            object rpGerencial02Label20: TppLabel
              UserName = 'rpGerencial02Label20'
              Caption = 'PLANO :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 17992
              mmTop = 43656
              mmWidth = 14023
              BandType = 1
            end
            object lbPlano03: TppLabel
              UserName = 'lbPlano03'
              Caption = 'lbPlano03'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 33602
              mmTop = 43656
              mmWidth = 15875
              BandType = 1
            end
            object rpGerencial02Shape13: TppShape
              UserName = 'rpGerencial02Shape13'
              mmHeight = 12965
              mmLeft = 0
              mmTop = 50271
              mmWidth = 24871
              BandType = 1
            end
            object rpGerencial02Label25: TppLabel
              UserName = 'rpGerencial02Label25'
              Caption = 'Faixa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 7408
              mmTop = 54769
              mmWidth = 9525
              BandType = 1
            end
            object rpGerencial02Shape14: TppShape
              UserName = 'rpGerencial02Shape14'
              mmHeight = 12965
              mmLeft = 24606
              mmTop = 50271
              mmWidth = 62177
              BandType = 1
            end
            object rpGerencial02Label26: TppLabel
              UserName = 'rpGerencial02Label26'
              Caption = 'Absoluta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 34660
              mmTop = 57150
              mmWidth = 14552
              BandType = 1
            end
            object rpGerencial02Label27: TppLabel
              UserName = 'rpGerencial02Label27'
              Caption = 'Relativa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 64294
              mmTop = 57150
              mmWidth = 13758
              BandType = 1
            end
            object rpGerencial02Shape15: TppShape
              UserName = 'rpGerencial02Shape15'
              mmHeight = 12965
              mmLeft = 86519
              mmTop = 50271
              mmWidth = 24871
              BandType = 1
            end
            object rpGerencial02Label28: TppLabel
              UserName = 'rpGerencial02Label28'
              Caption = 'Média'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 93663
              mmTop = 52123
              mmWidth = 10319
              BandType = 1
            end
            object rpGerencial02Label29: TppLabel
              UserName = 'rpGerencial02Label29'
              Caption = 'Salarial'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 92340
              mmTop = 57150
              mmWidth = 13229
              BandType = 1
            end
            object rpGerencial02ChildReport2Label1: TppLabel
              UserName = 'rpGerencial02ChildReport2Label1'
              Caption = 'F R E Q U Ê N C I A'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 40481
              mmTop = 52123
              mmWidth = 31485
              BandType = 1
            end
          end
          object rpGerencial02DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object rpGerencial02Shape8: TppShape
              UserName = 'rpGerencial02Shape8'
              mmHeight = 4763
              mmLeft = 0
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object rpGerencial02Shape9: TppShape
              UserName = 'rpGerencial02Shape9'
              mmHeight = 4763
              mmLeft = 24606
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object rpGerencial02Shape10: TppShape
              UserName = 'rpGerencial02Shape10'
              mmHeight = 4763
              mmLeft = 86519
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object rpGerencial02Shape11: TppShape
              UserName = 'rpGerencial02Shape11'
              mmHeight = 4763
              mmLeft = 111125
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object rpGerencial02DBText13: TppDBText
              UserName = 'rpGerencial02DBText13'
              DataField = 'FAIXA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 794
              mmTop = 265
              mmWidth = 23019
              BandType = 4
            end
            object rpGerencial02DBText14: TppDBText
              UserName = 'rpGerencial02DBText14'
              DataField = 'FREQABSOLUTA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 26194
              mmTop = 265
              mmWidth = 23019
              BandType = 4
            end
            object rpGerencial02DBText15: TppDBText
              UserName = 'rpGerencial02DBText15'
              DataField = 'MEDIA'
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 87577
              mmTop = 265
              mmWidth = 23019
              BandType = 4
            end
            object dtRelatTipo02: TppLabel
              UserName = 'dtRelatTipo02'
              AutoSize = False
              Caption = 'dtRelatTipo02'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 57150
              mmTop = 265
              mmWidth = 20902
              BandType = 4
            end
          end
          object rpGerencial02SummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object rpGerencial02Shape17: TppShape
              UserName = 'rpGerencial02Shape17'
              mmHeight = 6085
              mmLeft = 0
              mmTop = 0
              mmWidth = 24871
              BandType = 7
            end
            object rpGerencial02Shape18: TppShape
              UserName = 'rpGerencial02Shape18'
              mmHeight = 6085
              mmLeft = 24606
              mmTop = 0
              mmWidth = 62177
              BandType = 7
            end
            object rpGerencial02Shape19: TppShape
              UserName = 'rpGerencial02Shape19'
              mmHeight = 6085
              mmLeft = 86519
              mmTop = 0
              mmWidth = 24871
              BandType = 7
            end
            object rpGerencial02Label32: TppLabel
              UserName = 'rpGerencial02Label32'
              Caption = 'TOTAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 6615
              mmTop = 1058
              mmWidth = 11377
              BandType = 7
            end
            object rpGerencial02DBCalc9: TppDBCalc
              UserName = 'rpGerencial02DBCalc9'
              DataField = 'FREQABSOLUTA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 26458
              mmTop = 1058
              mmWidth = 22754
              BandType = 7
            end
          end
        end
      end
    end
    object rpGerencial02Group1: TppGroup
      BreakName = 'PATRO'
      DataPipeline = plGerencial02
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpGerencial02Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'plGerencial02'
      object rpGerencial02GroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 50536
        mmPrintPosition = 0
        object ppDBText38: TppDBText
          UserName = 'ppDBText38'
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
          mmLeft = 43656
          mmTop = 265
          mmWidth = 153988
          BandType = 3
          GroupNo = 0
        end
        object ppDBText39: TppDBText
          UserName = 'ppDBText39'
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
          mmLeft = 43656
          mmTop = 19579
          mmWidth = 54769
          BandType = 3
          GroupNo = 0
        end
        object ppDBText40: TppDBText
          UserName = 'ppDBText40'
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
          mmLeft = 43656
          mmTop = 6879
          mmWidth = 115623
          BandType = 3
          GroupNo = 0
        end
        object ppDBImage3: TppDBImage
          UserName = 'ppDBImage3'
          Center = False
          MaintainAspectRatio = True
          Stretch = True
          DataField = 'IMAGEM'
          DataPipeline = ppFundacao
          GraphicType = 'Bitmap'
          ParentDataPipeline = False
          DataPipelineName = 'ppFundacao'
          mmHeight = 25135
          mmLeft = 2381
          mmTop = 0
          mmWidth = 39688
          BandType = 3
          GroupNo = 0
        end
        object ppDBText41: TppDBText
          UserName = 'ppDBText41'
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
          mmHeight = 3704
          mmLeft = 43656
          mmTop = 11377
          mmWidth = 116152
          BandType = 3
          GroupNo = 0
        end
        object ppDBText42: TppDBText
          UserName = 'ppDBText42'
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
          mmHeight = 3704
          mmLeft = 43656
          mmTop = 15346
          mmWidth = 115359
          BandType = 3
          GroupNo = 0
        end
        object ppLabel49: TppLabel
          UserName = 'ppLabel49'
          Caption = 
            '4 - Distribuição dos Participantes e Não-Participantes por Faixa' +
            ' Etária, segundo Sexo.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 29633
          mmWidth = 143934
          BandType = 3
          GroupNo = 0
        end
        object ppLabel50: TppLabel
          UserName = 'ppLabel50'
          Caption = 'PATROCINADORA :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 38100
          mmWidth = 32015
          BandType = 3
          GroupNo = 0
        end
        object ppDBText43: TppDBText
          UserName = 'ppDBText43'
          AutoSize = True
          DataField = 'PATRO'
          DataPipeline = plGerencial02
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'plGerencial02'
          mmHeight = 3969
          mmLeft = 34131
          mmTop = 38100
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object rpGerencial02Label15: TppLabel
          UserName = 'rpGerencial02Label15'
          Caption = 'PLANO :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 17992
          mmTop = 42598
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object lbPlano01: TppLabel
          UserName = 'lbPlano01'
          Caption = 'lbPlano01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 34131
          mmTop = 42598
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
      end
      object rpGerencial02GroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object rpGerencial02Shape3: TppShape
          UserName = 'rpGerencial02Shape3'
          mmHeight = 6350
          mmLeft = 24606
          mmTop = 3175
          mmWidth = 61383
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial02Shape4: TppShape
          UserName = 'rpGerencial02Shape4'
          mmHeight = 6350
          mmLeft = 0
          mmTop = 3175
          mmWidth = 24871
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial02Label14: TppLabel
          UserName = 'rpGerencial02Label14'
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 6085
          mmTop = 4233
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial02DBCalc2: TppDBCalc
          UserName = 'rpGerencial02DBCalc2'
          DataField = 'QTDMANUT'
          DataPipeline = plGerencial02
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpGerencial02Group1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plGerencial02'
          mmHeight = 3704
          mmLeft = 115888
          mmTop = 3704
          mmWidth = 15610
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial02Shape5: TppShape
          UserName = 'rpGerencial02Shape5'
          mmHeight = 6350
          mmLeft = 85725
          mmTop = 3175
          mmWidth = 64823
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial02DBCalc4: TppDBCalc
          UserName = 'rpGerencial02DBCalc4'
          DataField = 'QTDFEM'
          DataPipeline = plGerencial02
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpGerencial02Group1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plGerencial02'
          mmHeight = 4233
          mmLeft = 88636
          mmTop = 4233
          mmWidth = 14288
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial02Shape7: TppShape
          UserName = 'rpGerencial02Shape7'
          mmHeight = 6350
          mmLeft = 150284
          mmTop = 3175
          mmWidth = 64823
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial02DBCalc3: TppDBCalc
          UserName = 'rpGerencial02DBCalc3'
          DataField = 'QTDMASC'
          DataPipeline = plGerencial02
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpGerencial02Group1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plGerencial02'
          mmHeight = 4233
          mmLeft = 153194
          mmTop = 4233
          mmWidth = 14288
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial02DBCalc7: TppDBCalc
          UserName = 'rpGerencial02DBCalc7'
          DataField = 'QTDGERAL'
          DataPipeline = plGerencial02
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpGerencial02Group1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plGerencial02'
          mmHeight = 4233
          mmLeft = 32015
          mmTop = 4233
          mmWidth = 14288
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'TIPO'
      DataPipeline = plGerencial02
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'plGerencial02'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12435
        mmPrintPosition = 0
        object rpGerencial02Shape1: TppShape
          UserName = 'rpGerencial02Shape1'
          mmHeight = 12435
          mmLeft = 150284
          mmTop = 0
          mmWidth = 64823
          BandType = 3
          GroupNo = 1
        end
        object ppShape9: TppShape
          UserName = 'ppShape9'
          mmHeight = 12435
          mmLeft = 0
          mmTop = 0
          mmWidth = 24871
          BandType = 3
          GroupNo = 1
        end
        object ppShape10: TppShape
          UserName = 'ppShape10'
          mmHeight = 12435
          mmLeft = 24606
          mmTop = 0
          mmWidth = 61383
          BandType = 3
          GroupNo = 1
        end
        object ppShape12: TppShape
          UserName = 'ppShape12'
          mmHeight = 12435
          mmLeft = 85725
          mmTop = 0
          mmWidth = 64823
          BandType = 3
          GroupNo = 1
        end
        object rpGerencial02Label1: TppLabel
          UserName = 'rpGerencial02Label1'
          AutoSize = False
          Caption = 'Faixa Etária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 4498
          mmWidth = 24342
          BandType = 3
          GroupNo = 1
        end
        object rpGerencial02Label8: TppLabel
          UserName = 'rpGerencial02Label8'
          AutoSize = False
          Caption = 'Qtd'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 87842
          mmTop = 6350
          mmWidth = 16140
          BandType = 3
          GroupNo = 1
        end
        object rpGerencial02Label9: TppLabel
          UserName = 'rpGerencial02Label9'
          AutoSize = False
          Caption = '( % )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 106627
          mmTop = 6350
          mmWidth = 16140
          BandType = 3
          GroupNo = 1
        end
        object rpGerencial02Label10: TppLabel
          UserName = 'rpGerencial02Label10'
          AutoSize = False
          Caption = 'Média Etária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 124619
          mmTop = 6350
          mmWidth = 23548
          BandType = 3
          GroupNo = 1
        end
        object rpGerencial02DBText2: TppDBText
          UserName = 'rpGerencial02DBText2'
          DataField = 'TIPO'
          DataPipeline = plGerencial02
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'plGerencial02'
          mmHeight = 4233
          mmLeft = 27252
          mmTop = 1323
          mmWidth = 54769
          BandType = 3
          GroupNo = 1
        end
        object rpGerencial02Label2: TppLabel
          UserName = 'rpGerencial02Label2'
          AutoSize = False
          Caption = 'Freqüência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 27252
          mmTop = 6350
          mmWidth = 21167
          BandType = 3
          GroupNo = 1
        end
        object rpGerencial02Label3: TppLabel
          UserName = 'rpGerencial02Label3'
          AutoSize = False
          Caption = '( % )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 60854
          mmTop = 6350
          mmWidth = 21167
          BandType = 3
          GroupNo = 1
        end
        object rpGerencial02Label4: TppLabel
          UserName = 'rpGerencial02Label4'
          AutoSize = False
          Caption = 'Qtd'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 152400
          mmTop = 6350
          mmWidth = 16140
          BandType = 3
          GroupNo = 1
        end
        object rpGerencial02Label5: TppLabel
          UserName = 'rpGerencial02Label5'
          AutoSize = False
          Caption = '( % )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 171186
          mmTop = 6350
          mmWidth = 16140
          BandType = 3
          GroupNo = 1
        end
        object rpGerencial02Label6: TppLabel
          UserName = 'rpGerencial02Label6'
          AutoSize = False
          Caption = 'Média Etária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 189177
          mmTop = 6350
          mmWidth = 23548
          BandType = 3
          GroupNo = 1
        end
        object rpGerencial02Label7: TppLabel
          UserName = 'rpGerencial02Label7'
          AutoSize = False
          Caption = 'Sexo Feminino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 87842
          mmTop = 1323
          mmWidth = 60325
          BandType = 3
          GroupNo = 1
        end
        object rpGerencial02Label11: TppLabel
          UserName = 'rpGerencial02Label11'
          AutoSize = False
          Caption = 'Sexo Masculino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 152400
          mmTop = 1323
          mmWidth = 60325
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppShape15: TppShape
          UserName = 'ppShape15'
          mmHeight = 6350
          mmLeft = 24606
          mmTop = 0
          mmWidth = 61383
          BandType = 5
          GroupNo = 1
        end
        object ppShape14: TppShape
          UserName = 'ppShape14'
          mmHeight = 6350
          mmLeft = 0
          mmTop = 0
          mmWidth = 24871
          BandType = 5
          GroupNo = 1
        end
        object ppLabel74: TppLabel
          UserName = 'ppLabel74'
          Caption = 'SUB-TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 2381
          mmTop = 1058
          mmWidth = 19579
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'ppDBCalc9'
          DataField = 'QTDFEM'
          DataPipeline = plGerencial02
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plGerencial02'
          mmHeight = 3704
          mmLeft = 115888
          mmTop = 1323
          mmWidth = 15611
          BandType = 5
          GroupNo = 1
        end
        object ppShape17: TppShape
          UserName = 'ppShape17'
          mmHeight = 6350
          mmLeft = 85725
          mmTop = 0
          mmWidth = 64823
          BandType = 5
          GroupNo = 1
        end
        object rpGerencial02DBCalc6: TppDBCalc
          UserName = 'rpGerencial02DBCalc6'
          DataField = 'QTDFEM'
          DataPipeline = plGerencial02
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plGerencial02'
          mmHeight = 4233
          mmLeft = 88636
          mmTop = 1058
          mmWidth = 14288
          BandType = 5
          GroupNo = 1
        end
        object rpGerencial02Shape6: TppShape
          UserName = 'rpGerencial02Shape6'
          mmHeight = 6350
          mmLeft = 150284
          mmTop = 0
          mmWidth = 64823
          BandType = 5
          GroupNo = 1
        end
        object rpGerencial02DBCalc1: TppDBCalc
          UserName = 'rpGerencial02DBCalc1'
          DataField = 'QTDMASC'
          DataPipeline = plGerencial02
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plGerencial02'
          mmHeight = 4233
          mmLeft = 153194
          mmTop = 1058
          mmWidth = 14288
          BandType = 5
          GroupNo = 1
        end
        object rpGerencial02DBCalc5: TppDBCalc
          UserName = 'rpGerencial02DBCalc5'
          DataField = 'QTDGERAL'
          DataPipeline = plGerencial02
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plGerencial02'
          mmHeight = 4233
          mmLeft = 32015
          mmTop = 1058
          mmWidth = 14288
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object qryGerencial04: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      
        'SELECT '#39'                                                        ' +
        '                '#39' AS REGIONAL    ,'
      '       0.00 AS MEDIAPART   ,'
      '       0.00 AS MEDIAPATRO  ,'
      '       0.00 AS RESERVAREAIS,'
      '       0.00 AS RESERVACOTAS,'
      '       '#39' '#39'      AS QUEBRA'
      'FROM PARAMAPREV')
    UpdateObject = updGerencial4
    ValidateWithMask = True
    Left = 32
    Top = 171
  end
  object dsGerencial04: TwwDataSource
    DataSet = qryGerencial04
    Left = 74
    Top = 172
  end
  object plGerencial04: TppBDEPipeline
    DataSource = dsGerencial04
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'plGerencial04'
    Left = 130
    Top = 173
  end
  object rpGerencial04: TppReport
    AutoStop = False
    DataPipeline = plGerencial04
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 179
    Top = 172
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'plGerencial04'
    object rpGerencial04HeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 78052
      mmPrintPosition = 0
      object ppDBText24: TppDBText
        UserName = 'ppDBText24'
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
        mmLeft = 41275
        mmTop = 0
        mmWidth = 153988
        BandType = 0
      end
      object ppDBText25: TppDBText
        UserName = 'ppDBText25'
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
        mmLeft = 41275
        mmTop = 17992
        mmWidth = 54769
        BandType = 0
      end
      object ppDBText26: TppDBText
        UserName = 'ppDBText26'
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
        mmLeft = 41275
        mmTop = 5292
        mmWidth = 115623
        BandType = 0
      end
      object ppDBImage2: TppDBImage
        UserName = 'ppDBImage2'
        MaintainAspectRatio = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 0
        mmTop = 0
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText27: TppDBText
        UserName = 'ppDBText27'
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
        mmHeight = 3704
        mmLeft = 41275
        mmTop = 9790
        mmWidth = 116152
        BandType = 0
      end
      object ppDBText28: TppDBText
        UserName = 'ppDBText28'
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
        mmHeight = 3704
        mmLeft = 41275
        mmTop = 13758
        mmWidth = 115359
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'ppLabel33'
        Caption = 
          '9 - Contribuição Média Patrocinadora X Participante, e Reserva d' +
          'e Poupança por Regional.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 29898
        mmWidth = 153459
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'ppLabel34'
        Caption = 'PATROCINADORA :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 38365
        mmWidth = 32015
        BandType = 0
      end
      object lbPatro05: TppLabel
        UserName = 'lbPatro05'
        Caption = 'lbPatro05'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 34131
        mmTop = 38365
        mmWidth = 15081
        BandType = 0
      end
      object lbMoeda01: TppLabel
        UserName = 'lbMoeda01'
        AutoSize = False
        Caption = 'lbMoeda01'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 34131
        mmTop = 51065
        mmWidth = 29369
        BandType = 0
      end
      object rpGerencial04Label2: TppLabel
        UserName = 'rpGerencial04Label2'
        Caption = ' MOEDA :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 15610
        mmTop = 51065
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'ppLabel35'
        Caption = 'PLANO :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 17992
        mmTop = 42598
        mmWidth = 14023
        BandType = 0
      end
      object lbPlano05: TppLabel
        UserName = 'lbPlano05'
        Caption = 'lbPlano05'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 34131
        mmTop = 42598
        mmWidth = 15875
        BandType = 0
      end
      object ppShape61: TppShape
        UserName = 'ppShape61'
        mmHeight = 12435
        mmLeft = 0
        mmTop = 65617
        mmWidth = 43127
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'ppLabel36'
        AutoSize = False
        Caption = 'Regional'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 70115
        mmWidth = 42598
        BandType = 0
      end
      object ppShape62: TppShape
        UserName = 'ppShape62'
        mmHeight = 12435
        mmLeft = 42863
        mmTop = 65617
        mmWidth = 75936
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'ppLabel37'
        AutoSize = False
        Caption = 'PARTICIPANTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 43656
        mmTop = 71967
        mmWidth = 36777
        BandType = 0
      end
      object ppShape64: TppShape
        UserName = 'ppShape64'
        mmHeight = 12435
        mmLeft = 118534
        mmTop = 65617
        mmWidth = 75936
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'ppLabel38'
        AutoSize = False
        Caption = 'EM COTAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 119327
        mmTop = 71967
        mmWidth = 36777
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'ppLabel39'
        AutoSize = False
        Caption = 'EM REAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 157163
        mmTop = 71967
        mmWidth = 36777
        BandType = 0
      end
      object rpGerencila04Label1: TppLabel
        UserName = 'rpGerencila04Label1'
        AutoSize = False
        Caption = 'PATROCINADORA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 81227
        mmTop = 71967
        mmWidth = 36777
        BandType = 0
      end
      object rpGerencila04Label2: TppLabel
        UserName = 'rpGerencila04Label2'
        AutoSize = False
        Caption = 'CONTRIBUIÇÃO MÉDIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 43921
        mmTop = 67204
        mmWidth = 73554
        BandType = 0
      end
      object rpGerencila04Label3: TppLabel
        UserName = 'rpGerencila04Label3'
        AutoSize = False
        Caption = 'SALDO DE RESERVA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 119592
        mmTop = 67204
        mmWidth = 74348
        BandType = 0
      end
      object rpGerencial04Label1: TppLabel
        UserName = 'rpGerencial04Label1'
        Caption = 'MÊS REFERÊNCIA :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 46831
        mmWidth = 32015
        BandType = 0
      end
      object rpGerencial04Label3: TppLabel
        UserName = 'rpGerencial04Label3'
        Caption = 'COTAÇÃO :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 12965
        mmTop = 55298
        mmWidth = 19050
        BandType = 0
      end
      object lbMesRef: TppLabel
        UserName = 'lbMesRef'
        Caption = 'lbMesRef'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 34131
        mmTop = 46831
        mmWidth = 15081
        BandType = 0
      end
      object lbCotacao: TppLabel
        UserName = 'lbCotacao'
        Caption = 'lbCotacao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 34131
        mmTop = 55298
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText21: TppDBText
        UserName = 'ppDBText21'
        DataField = 'MEDIAPART'
        DataPipeline = plGerencial04
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plGerencial04'
        mmHeight = 3704
        mmLeft = 43656
        mmTop = 529
        mmWidth = 35454
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'ppDBText22'
        DataField = 'REGIONAL'
        DataPipeline = plGerencial04
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plGerencial04'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 0
        mmWidth = 41804
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'ppDBText23'
        DataField = 'MEDIAPATRO'
        DataPipeline = plGerencial04
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plGerencial04'
        mmHeight = 3704
        mmLeft = 81756
        mmTop = 529
        mmWidth = 35190
        BandType = 4
      end
      object ppShape23: TppShape
        UserName = 'ppShape23'
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppShape21: TppShape
        UserName = 'ppShape21'
        mmHeight = 4763
        mmLeft = 42863
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object rpGerencial04Shape1: TppShape
        UserName = 'rpGerencial04Shape1'
        mmHeight = 4763
        mmLeft = 118534
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object rpGerencial04Shape2: TppShape
        UserName = 'rpGerencial04Shape2'
        mmHeight = 4763
        mmLeft = 194205
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object rpGerencial04DBText1: TppDBText
        UserName = 'rpGerencial04DBText1'
        DataField = 'RESERVACOTAS'
        DataPipeline = plGerencial04
        DisplayFormat = '###,###,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plGerencial04'
        mmHeight = 3704
        mmLeft = 120386
        mmTop = 529
        mmWidth = 35454
        BandType = 4
      end
      object rpGerencial04DBText2: TppDBText
        UserName = 'rpGerencial04DBText2'
        DataField = 'RESERVAREAIS'
        DataPipeline = plGerencial04
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plGerencial04'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 265
        mmWidth = 35190
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 15610
      mmPrintPosition = 0
      object ppLabel40: TppLabel
        UserName = 'ppLabel40'
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
        mmWidth = 272786
        BandType = 8
      end
      object ppLine15: TppLine
        UserName = 'ppLine15'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppCalc7: TppSystemVariable
        UserName = 'Calc7'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 127265
        mmTop = 3175
        mmWidth = 18785
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
        mmLeft = 243946
        mmTop = 3175
        mmWidth = 29104
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object Rel10: TppSubReport
        UserName = 'Rel10'
        ExpandAll = False
        NewPrintJob = True
        OutlineSettings.CreateNode = True
        PrintBehavior = pbSection
        ResetPageNo = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpGerencila04ChildReport1: TppChildReport
          AutoStop = False
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210079
          PrinterSetup.mmPaperWidth = 297127
          PrinterSetup.PaperSize = 9
          Version = '7.04'
          mmColumnWidth = 0
          object rpGerencila04ChildReport1HeaderBand1: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 58208
            mmPrintPosition = 0
            object rpGerencila04ChildReport1DBText1: TppDBText
              UserName = 'rpGerencila04ChildReport1DBText1'
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
              mmLeft = 44715
              mmTop = 0
              mmWidth = 153988
              BandType = 0
            end
            object rpGerencila04ChildReport1DBText2: TppDBText
              UserName = 'rpGerencila04ChildReport1DBText2'
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
              mmLeft = 44715
              mmTop = 18785
              mmWidth = 54769
              BandType = 0
            end
            object rpGerencila04ChildReport1DBText3: TppDBText
              UserName = 'rpGerencila04ChildReport1DBText3'
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
              mmLeft = 44715
              mmTop = 6085
              mmWidth = 115623
              BandType = 0
            end
            object rpGerencila04ChildReport1DBText4: TppDBText
              UserName = 'rpGerencila04ChildReport1DBText4'
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
              mmHeight = 3704
              mmLeft = 44715
              mmTop = 10583
              mmWidth = 116152
              BandType = 0
            end
            object rpGerencila04ChildReport1DBText5: TppDBText
              UserName = 'rpGerencila04ChildReport1DBText5'
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
              mmHeight = 3704
              mmLeft = 44715
              mmTop = 14552
              mmWidth = 115359
              BandType = 0
            end
            object lb10: TppLabel
              UserName = 'lb10'
              Caption = '10 - Movimentação do Cadastro - ('
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 1323
              mmTop = 29369
              mmWidth = 56886
              BandType = 0
            end
            object rpGerencila04ChildReport1DBImage1: TppDBImage
              UserName = 'rpGerencila04ChildReport1DBImage1'
              MaintainAspectRatio = True
              DataField = 'IMAGEM'
              DataPipeline = ppFundacao
              GraphicType = 'Bitmap'
              ParentDataPipeline = False
              DataPipelineName = 'ppFundacao'
              mmHeight = 25135
              mmLeft = 3440
              mmTop = 0
              mmWidth = 39688
              BandType = 0
            end
            object rpGerencila04ChildReport1Label2: TppLabel
              UserName = 'rpGerencila04ChildReport1Label2'
              Caption = 'PATROCINADORA :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 35454
              mmWidth = 32015
              BandType = 0
            end
            object rpGerencila04ChildReport1Label3: TppLabel
              UserName = 'rpGerencila04ChildReport1Label3'
              Caption = 'PLANO :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 17992
              mmTop = 39952
              mmWidth = 14023
              BandType = 0
            end
            object lbPlano04: TppLabel
              UserName = 'lbPlano04'
              Caption = 'lbPlano04'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 34131
              mmTop = 39952
              mmWidth = 15875
              BandType = 0
            end
            object rpGerencila04ChildReport1Shape1: TppShape
              UserName = 'rpGerencila04ChildReport1Shape1'
              mmHeight = 12435
              mmLeft = 0
              mmTop = 45773
              mmWidth = 43127
              BandType = 0
            end
            object rpGerencila04ChildReport1Label5: TppLabel
              UserName = 'rpGerencila04ChildReport1Label5'
              AutoSize = False
              Caption = 'DESCRICAO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 265
              mmTop = 50271
              mmWidth = 42598
              BandType = 0
            end
            object rpGerencila04ChildReport1Shape2: TppShape
              UserName = 'rpGerencila04ChildReport1Shape2'
              mmHeight = 12435
              mmLeft = 42863
              mmTop = 45773
              mmWidth = 113771
              BandType = 0
            end
            object rpGerencila04ChildReport1Label6: TppLabel
              UserName = 'rpGerencila04ChildReport1Label6'
              AutoSize = False
              Caption = 'MÊS ANTERIOR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 43656
              mmTop = 50271
              mmWidth = 36777
              BandType = 0
            end
            object lbPatro04: TppLabel
              UserName = 'lbPatro04'
              Caption = 'lbPatro04'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 34131
              mmTop = 35454
              mmWidth = 15081
              BandType = 0
            end
            object rpGerencila04ChildReport1Label10: TppLabel
              UserName = 'rpGerencila04ChildReport1Label10'
              AutoSize = False
              Caption = 'NO MÊS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 81227
              mmTop = 50271
              mmWidth = 36777
              BandType = 0
            end
            object rpGerencila04ChildReport1Label7: TppLabel
              UserName = 'rpGerencila04ChildReport1Label7'
              AutoSize = False
              Caption = 'NO EXERCÍCIO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 119063
              mmTop = 50271
              mmWidth = 36777
              BandType = 0
            end
          end
          object rpGerencila04ChildReport1DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object rpGerencila04ChildReport1Line1: TppLine
              UserName = 'rpGerencila04ChildReport1Line1'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3969
              mmLeft = 0
              mmTop = 0
              mmWidth = 1323
              BandType = 4
            end
            object rpGerencila04ChildReport1Line2: TppLine
              UserName = 'rpGerencila04ChildReport1Line2'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3969
              mmLeft = 42863
              mmTop = 0
              mmWidth = 1323
              BandType = 4
            end
            object rpGerencila04ChildReport1Line3: TppLine
              UserName = 'rpGerencila04ChildReport1Line3'
              Position = lpRight
              Weight = 0.75
              mmHeight = 3969
              mmLeft = 155311
              mmTop = 0
              mmWidth = 1323
              BandType = 4
            end
            object rpGerencila04ChildReport1DBText6: TppDBText
              UserName = 'rpGerencila04ChildReport1DBText6'
              DataField = 'DESCRICAO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 1588
              mmTop = 0
              mmWidth = 38894
              BandType = 4
            end
            object rpGerencila04ChildReport1DBText7: TppDBText
              UserName = 'rpGerencila04ChildReport1DBText7'
              DataField = 'QTDANTERIOR'
              DisplayFormat = '###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 62971
              mmTop = 0
              mmWidth = 15875
              BandType = 4
            end
            object rpGerencila04ChildReport1DBText8: TppDBText
              UserName = 'rpGerencila04ChildReport1DBText8'
              DataField = 'QTDATUAL'
              DisplayFormat = '###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 100806
              mmTop = 0
              mmWidth = 15875
              BandType = 4
            end
            object rpGerencila04ChildReport1DBText9: TppDBText
              UserName = 'rpGerencila04ChildReport1DBText9'
              DataField = 'QTDEXERCICIO'
              DisplayFormat = '###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 134409
              mmTop = 0
              mmWidth = 15875
              BandType = 4
            end
          end
          object rpGerencila04ChildReport1SummaryBand1: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 12700
            mmPrintPosition = 0
            object Rel10_01: TppSubReport
              UserName = 'Rel10_01'
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              TraverseAllData = False
              mmHeight = 5027
              mmLeft = 0
              mmTop = 0
              mmWidth = 284427
              BandType = 7
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object rpGerencila04ChildReport1ChildReport1: TppChildReport
                AutoStop = False
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'PpModeloReport1'
                PrinterSetup.Orientation = poLandscape
                PrinterSetup.PaperName = 'A4'
                PrinterSetup.PrinterName = 'Default'
                PrinterSetup.mmMarginBottom = 6350
                PrinterSetup.mmMarginLeft = 6350
                PrinterSetup.mmMarginRight = 6350
                PrinterSetup.mmMarginTop = 6350
                PrinterSetup.mmPaperHeight = 210079
                PrinterSetup.mmPaperWidth = 297127
                PrinterSetup.PaperSize = 9
                Version = '7.04'
                mmColumnWidth = 0
                object rpGerencila04ChildReport1ChildReport1TitleBand1: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 529
                  mmPrintPosition = 0
                  object rpGerencila04ChildReport1ChildReport1Shape3: TppShape
                    UserName = 'rpGerencila04ChildReport1ChildReport1Shape3'
                    mmHeight = 529
                    mmLeft = 0
                    mmTop = 0
                    mmWidth = 156104
                    BandType = 1
                  end
                end
                object rpGerencila04ChildReport1ChildReport1DetailBand1: TppDetailBand
                  mmBottomOffset = 0
                  mmHeight = 4233
                  mmPrintPosition = 0
                  object rpGerencila04ChildReport1ChildReport1DBText1: TppDBText
                    UserName = 'rpGerencila04ChildReport1ChildReport1DBText1'
                    DataField = 'DESCRICAO'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    mmHeight = 4233
                    mmLeft = 1058
                    mmTop = 0
                    mmWidth = 40746
                    BandType = 4
                  end
                  object rpGerencila04ChildReport1ChildReport1Line1: TppLine
                    UserName = 'rpGerencila04ChildReport1ChildReport1Line1'
                    Position = lpLeft
                    Weight = 0.75
                    mmHeight = 3969
                    mmLeft = 0
                    mmTop = 0
                    mmWidth = 1323
                    BandType = 4
                  end
                  object rpGerencila04ChildReport1ChildReport1Line2: TppLine
                    UserName = 'rpGerencila04ChildReport1ChildReport1Line2'
                    Position = lpLeft
                    Weight = 0.75
                    mmHeight = 3969
                    mmLeft = 42863
                    mmTop = 0
                    mmWidth = 1323
                    BandType = 4
                  end
                  object rpGerencila04ChildReport1ChildReport1Line3: TppLine
                    UserName = 'rpGerencila04ChildReport1ChildReport1Line3'
                    Position = lpRight
                    Weight = 0.75
                    mmHeight = 3969
                    mmLeft = 155311
                    mmTop = 0
                    mmWidth = 1323
                    BandType = 4
                  end
                end
                object rpGerencila04ChildReport1ChildReport1SummaryBand1: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
            end
            object rpGerencila04ChildReport1Shape3: TppShape
              UserName = 'rpGerencila04ChildReport1Shape3'
              mmHeight = 6615
              mmLeft = 0
              mmTop = 4763
              mmWidth = 43127
              BandType = 7
            end
            object rpGerencila04ChildReport1Shape4: TppShape
              UserName = 'rpGerencila04ChildReport1Shape4'
              mmHeight = 6615
              mmLeft = 42863
              mmTop = 4763
              mmWidth = 113771
              BandType = 7
            end
            object rpGerencila04ChildReport1Label8: TppLabel
              UserName = 'rpGerencila04ChildReport1Label8'
              AutoSize = False
              Caption = 'TOTAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 265
              mmTop = 6085
              mmWidth = 42598
              BandType = 7
            end
            object rpGerencila04ChildReport1DBCalc1: TppDBCalc
              UserName = 'rpGerencila04ChildReport1DBCalc1'
              DataField = 'QTDANTERIOR'
              DisplayFormat = '###,###,##0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 46567
              mmTop = 6085
              mmWidth = 15875
              BandType = 7
            end
            object rpGerencila04ChildReport1DBCalc2: TppDBCalc
              UserName = 'rpGerencila04ChildReport1DBCalc2'
              DataField = 'QTDATUAL'
              DisplayFormat = '###,###,##0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 82286
              mmTop = 6085
              mmWidth = 15875
              BandType = 7
            end
            object rpGerencila04ChildReport1DBCalc3: TppDBCalc
              UserName = 'rpGerencila04ChildReport1DBCalc3'
              DisplayFormat = '###,###,##0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 120915
              mmTop = 6085
              mmWidth = 29369
              BandType = 7
            end
          end
        end
      end
    end
    object rpGerencial04Group1: TppGroup
      BreakName = 'QUEBRA'
      DataPipeline = plGerencial04
      OutlineSettings.CreateNode = True
      UserName = 'rpGerencial04Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'plGerencial04'
      object rpGerencial04GroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpGerencial04GroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppShape68: TppShape
          UserName = 'ppShape68'
          mmHeight = 6350
          mmLeft = 118534
          mmTop = 0
          mmWidth = 75936
          BandType = 5
          GroupNo = 0
        end
        object ppShape69: TppShape
          UserName = 'ppShape69'
          mmHeight = 6350
          mmLeft = 42863
          mmTop = 0
          mmWidth = 75936
          BandType = 5
          GroupNo = 0
        end
        object ppShape71: TppShape
          UserName = 'ppShape71'
          mmHeight = 6350
          mmLeft = 0
          mmTop = 0
          mmWidth = 43127
          BandType = 5
          GroupNo = 0
        end
        object ppLabel41: TppLabel
          UserName = 'ppLabel41'
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 6085
          mmTop = 1058
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'ppDBCalc8'
          DataField = 'MEDIAPART'
          DataPipeline = plGerencial04
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpGerencial04Group1
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'plGerencial04'
          mmHeight = 4233
          mmLeft = 43921
          mmTop = 1058
          mmWidth = 35454
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'ppDBCalc10'
          DataField = 'MEDIAPATRO'
          DataPipeline = plGerencial04
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpGerencial04Group1
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'plGerencial04'
          mmHeight = 4233
          mmLeft = 82021
          mmTop = 1058
          mmWidth = 35719
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'ppDBCalc11'
          DataField = 'RESERVACOTAS'
          DataPipeline = plGerencial04
          DisplayFormat = '###,###,##0.000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpGerencial04Group1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plGerencial04'
          mmHeight = 4233
          mmLeft = 121179
          mmTop = 1058
          mmWidth = 34925
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'ppDBCalc12'
          DataField = 'RESERVAREAIS'
          DataPipeline = plGerencial04
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpGerencial04Group1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plGerencial04'
          mmHeight = 4233
          mmLeft = 158750
          mmTop = 1058
          mmWidth = 34396
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryGerencial03: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT '#39'A'#39' AS CONTRIBUICAO,'
      '       '#39'A'#39' AS PAGADOR     ,'
      '       0     AS COL01       , '
      '       0     AS COL02       , '
      '       0     AS COL03       , '
      '       0     AS COL04       , '
      '       0     AS COL05       , '
      '       0     AS COL06'#9'    ,'
      '       0     AS TOTAL'#9'       '
      'FROM PARAMAPREV')
    UpdateObject = updGerencial3
    ValidateWithMask = True
    Left = 32
    Top = 209
  end
  object dsGerencial03: TwwDataSource
    DataSet = qryGerencial03
    Left = 74
    Top = 210
  end
  object plGerencial03: TppBDEPipeline
    DataSource = dsGerencial03
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'plGerencial03'
    Left = 130
    Top = 210
  end
  object rpGerencial03: TppReport
    AutoStop = False
    DataPipeline = plGerencial03
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
    Left = 179
    Top = 210
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'plGerencial03'
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppShape7: TppShape
        UserName = 'ppShape7'
        mmHeight = 4763
        mmLeft = 42863
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppShape8: TppShape
        UserName = 'ppShape8'
        mmHeight = 4763
        mmLeft = 73025
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppShape13: TppShape
        UserName = 'ppShape13'
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppShape18: TppShape
        UserName = 'ppShape18'
        mmHeight = 4763
        mmLeft = 103188
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppShape19: TppShape
        UserName = 'ppShape19'
        mmHeight = 4763
        mmLeft = 133350
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppShape20: TppShape
        UserName = 'ppShape20'
        mmHeight = 4763
        mmLeft = 163513
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object rpGerencial03Shape2: TppShape
        UserName = 'rpGerencial03Shape2'
        mmHeight = 4763
        mmLeft = 193675
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object rpGerencial03Shape4: TppShape
        UserName = 'rpGerencial03Shape4'
        mmHeight = 4763
        mmLeft = 223838
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object rpGerencial03DBText1: TppDBText
        UserName = 'rpGerencial03DBText1'
        DataField = 'CONTRIBUICAO'
        DataPipeline = plGerencial03
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plGerencial03'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 529
        mmWidth = 41804
        BandType = 4
      end
      object rpGerencial03DBText2: TppDBText
        UserName = 'rpGerencial03DBText2'
        DataField = 'COL01'
        DataPipeline = plGerencial03
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plGerencial03'
        mmHeight = 4233
        mmLeft = 43656
        mmTop = 265
        mmWidth = 29369
        BandType = 4
      end
      object rpGerencial03DBText3: TppDBText
        UserName = 'rpGerencial03DBText3'
        DataField = 'COL02'
        DataPipeline = plGerencial03
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plGerencial03'
        mmHeight = 3704
        mmLeft = 73290
        mmTop = 529
        mmWidth = 29898
        BandType = 4
      end
      object rpGerencial03DBText4: TppDBText
        UserName = 'rpGerencial03DBText4'
        DataField = 'COL04'
        DataPipeline = plGerencial03
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plGerencial03'
        mmHeight = 3704
        mmLeft = 133615
        mmTop = 529
        mmWidth = 29898
        BandType = 4
      end
      object rpGerencial03DBText5: TppDBText
        UserName = 'rpGerencial03DBText5'
        DataField = 'COL03'
        DataPipeline = plGerencial03
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plGerencial03'
        mmHeight = 3704
        mmLeft = 103452
        mmTop = 529
        mmWidth = 29898
        BandType = 4
      end
      object rpGerencial03DBText6: TppDBText
        UserName = 'rpGerencial03DBText6'
        DataField = 'COL05'
        DataPipeline = plGerencial03
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plGerencial03'
        mmHeight = 3704
        mmLeft = 163777
        mmTop = 529
        mmWidth = 29898
        BandType = 4
      end
      object rpGerencial03DBText7: TppDBText
        UserName = 'rpGerencial03DBText7'
        DataField = 'COL06'
        DataPipeline = plGerencial03
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plGerencial03'
        mmHeight = 3704
        mmLeft = 193940
        mmTop = 529
        mmWidth = 29898
        BandType = 4
      end
      object rpGerencial03Shape8: TppShape
        UserName = 'rpGerencial03Shape8'
        mmHeight = 4763
        mmLeft = 253736
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object rpGerencial03DBText9: TppDBText
        UserName = 'rpGerencial03DBText9'
        DataField = 'TOTAL'
        DataPipeline = plGerencial03
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plGerencial03'
        mmHeight = 3704
        mmLeft = 224103
        mmTop = 265
        mmWidth = 29898
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLabel42: TppLabel
        UserName = 'ppLabel42'
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
        mmWidth = 272786
        BandType = 8
      end
      object ppLine16: TppLine
        UserName = 'ppLine16'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
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
        mmWidth = 272786
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
        mmLeft = 243946
        mmTop = 3175
        mmWidth = 29104
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object rpGer03Sub01: TppSubReport
        UserName = 'rpGer03Sub01'
        ExpandAll = False
        NewPrintJob = True
        OutlineSettings.CreateNode = True
        PrintBehavior = pbSection
        ResetPageNo = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 4763
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpGerencial03ChildReport1: TppChildReport
          AutoStop = False
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
          Version = '7.04'
          mmColumnWidth = 0
          object rpGerencial03ChildReport1DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object rpGerencial03ChildReport1Shape8: TppShape
              UserName = 'rpGerencial03ChildReport1Shape8'
              mmHeight = 4763
              mmLeft = 42863
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object rpGerencial03ChildReport1Shape9: TppShape
              UserName = 'rpGerencial03ChildReport1Shape9'
              mmHeight = 4763
              mmLeft = 80698
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object rpGerencial03ChildReport1Shape10: TppShape
              UserName = 'rpGerencial03ChildReport1Shape10'
              mmHeight = 4763
              mmLeft = 111125
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object rpGerencial03ChildReport1Shape11: TppShape
              UserName = 'rpGerencial03ChildReport1Shape11'
              mmHeight = 4763
              mmLeft = 141817
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object rpGerencial03ChildReport1Shape12: TppShape
              UserName = 'rpGerencial03ChildReport1Shape12'
              mmHeight = 4763
              mmLeft = 172244
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object rpGerencial03ChildReport1DBText7: TppDBText
              UserName = 'rpGerencial03ChildReport1DBText7'
              DataField = 'CONTRIBUICAO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 529
              mmTop = 529
              mmWidth = 41804
              BandType = 4
            end
            object rpGerencial03ChildReport1DBText8: TppDBText
              UserName = 'rpGerencial03ChildReport1DBText8'
              DataField = 'COL01'
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 43921
              mmTop = 529
              mmWidth = 35719
              BandType = 4
            end
            object rpGerencial03ChildReport1DBText10: TppDBText
              UserName = 'rpGerencial03ChildReport1DBText10'
              DataField = 'COL04'
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 143404
              mmTop = 529
              mmWidth = 26988
              BandType = 4
            end
            object rpGerencial03ChildReport1DBText11: TppDBText
              UserName = 'rpGerencial03ChildReport1DBText11'
              DataField = 'COL03'
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 112977
              mmTop = 529
              mmWidth = 26988
              BandType = 4
            end
            object rpGerencial03ChildReport1DBText12: TppDBText
              UserName = 'rpGerencial03ChildReport1DBText12'
              DataField = 'COL05'
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 173302
              mmTop = 529
              mmWidth = 26988
              BandType = 4
            end
            object rpGerencial03ChildReport1Shape13: TppShape
              UserName = 'rpGerencial03ChildReport1Shape13'
              mmHeight = 4763
              mmLeft = 202671
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object rpGerencial03ChildReport1DBText13: TppDBText
              UserName = 'rpGerencial03ChildReport1DBText13'
              DataField = 'COL06'
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 204523
              mmTop = 529
              mmWidth = 26988
              BandType = 4
            end
            object rpGerencial03ChildReport1Shape14: TppShape
              UserName = 'rpGerencial03ChildReport1Shape14'
              mmHeight = 4763
              mmLeft = 233098
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object rpGerencial03ChildReport1Shape15: TppShape
              UserName = 'rpGerencial03ChildReport1Shape15'
              mmHeight = 4763
              mmLeft = 0
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object rpGerencial03ChildReport1DBText9: TppDBText
              UserName = 'rpGerencial03ChildReport1DBText9'
              DataField = 'COL02'
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 82021
              mmTop = 529
              mmWidth = 28310
              BandType = 4
            end
            object rpGerencial03ChildReport1Shape17: TppShape
              UserName = 'rpGerencial03ChildReport1Shape17'
              mmHeight = 4763
              mmLeft = 262996
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object rpGerencial03ChildReport1DBText14: TppDBText
              UserName = 'rpGerencial03ChildReport1DBText14'
              DataField = 'TOTAL'
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 234950
              mmTop = 529
              mmWidth = 26988
              BandType = 4
            end
          end
          object rpGerencial03ChildReport1FooterBand1: TppFooterBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object rpGerencial03ChildReport1Label1: TppLabel
              UserName = 'rpGerencial03ChildReport1Label1'
              AutoSize = False
              Caption = 'Administração Previdenciária'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 264
              mmTop = 3175
              mmWidth = 272786
              BandType = 8
            end
            object rpGerencial03ChildReport1Line1: TppLine
              UserName = 'rpGerencial03ChildReport1Line1'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 0
              mmTop = 1852
              mmWidth = 284300
              BandType = 8
            end
            object rpGerencial03ChildReport1Calc1: TppSystemVariable
              UserName = 'rpGerencial03ChildReport1Calc1'
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
              mmWidth = 272786
              BandType = 8
            end
            object rpGerencial03ChildReport1Calc2: TppSystemVariable
              UserName = 'rpGerencial03ChildReport1Calc2'
              VarType = vtDateTime
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 243946
              mmTop = 3175
              mmWidth = 29104
              BandType = 8
            end
          end
          object rpGerencial03ChildReport1Group1: TppGroup
            BreakName = 'PAGADOR'
            OutlineSettings.CreateNode = True
            NewPage = True
            UserName = 'rpGerencial03ChildReport1Group1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = ''
            object rpGerencial03ChildReport1GroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 67998
              mmPrintPosition = 0
              object rpGerencial03ChildReport1Shape7: TppShape
                UserName = 'rpGerencial03ChildReport1Shape7'
                mmHeight = 12435
                mmLeft = 202671
                mmTop = 55563
                mmWidth = 30427
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1DBText1: TppDBText
                UserName = 'rpGerencial03ChildReport1DBText1'
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
                mmLeft = 43655
                mmTop = 0
                mmWidth = 153988
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1DBText2: TppDBText
                UserName = 'rpGerencial03ChildReport1DBText2'
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
                mmLeft = 43655
                mmTop = 18521
                mmWidth = 54769
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1DBText3: TppDBText
                UserName = 'rpGerencial03ChildReport1DBText3'
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
                mmLeft = 43655
                mmTop = 6085
                mmWidth = 115623
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1DBImage1: TppDBImage
                UserName = 'rpGerencial03ChildReport1DBImage1'
                MaintainAspectRatio = True
                DataField = 'IMAGEM'
                DataPipeline = ppFundacao
                GraphicType = 'Bitmap'
                ParentDataPipeline = False
                DataPipelineName = 'ppFundacao'
                mmHeight = 25135
                mmLeft = 2380
                mmTop = 0
                mmWidth = 39688
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1DBText4: TppDBText
                UserName = 'rpGerencial03ChildReport1DBText4'
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
                mmHeight = 3704
                mmLeft = 43655
                mmTop = 10583
                mmWidth = 116152
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1DBText5: TppDBText
                UserName = 'rpGerencial03ChildReport1DBText5'
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
                mmHeight = 3704
                mmLeft = 43655
                mmTop = 14552
                mmWidth = 115359
                BandType = 3
                GroupNo = 0
              end
              object lbRel08: TppLabel
                UserName = 'lbRel08'
                Caption = '8 - Receita de Contribuição Previdenciária por Regional ('
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 264
                mmTop = 29634
                mmWidth = 96044
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Label2: TppLabel
                UserName = 'rpGerencial03ChildReport1Label2'
                Caption = 'PATROCINADORA :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 0
                mmTop = 38100
                mmWidth = 32015
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Label3: TppLabel
                UserName = 'rpGerencial03ChildReport1Label3'
                Caption = 'PLANO :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 17992
                mmTop = 42598
                mmWidth = 14023
                BandType = 3
                GroupNo = 0
              end
              object lGer03Plano02: TppLabel
                UserName = 'lGer03Plano02'
                Caption = 'lGer03Plano02'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                mmHeight = 3969
                mmLeft = 34131
                mmTop = 42598
                mmWidth = 23548
                BandType = 3
                GroupNo = 0
              end
              object lbPatro02: TppLabel
                UserName = 'lbPatro02'
                Caption = 'lbPatro02'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                mmHeight = 3969
                mmLeft = 34131
                mmTop = 38100
                mmWidth = 15081
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Label12: TppLabel
                UserName = 'rpGerencial03ChildReport1Label12'
                Caption = 'PAGADOR :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 12700
                mmTop = 47096
                mmWidth = 19315
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1DBText6: TppDBText
                UserName = 'rpGerencial03ChildReport1DBText6'
                AutoSize = True
                DataField = 'PAGADOR'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                mmHeight = 3969
                mmLeft = 34131
                mmTop = 47096
                mmWidth = 17727
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape1: TppShape
                UserName = 'rpGerencial03ChildReport1Shape1'
                mmHeight = 12435
                mmLeft = 0
                mmTop = 55563
                mmWidth = 43127
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Label5: TppLabel
                UserName = 'rpGerencial03ChildReport1Label5'
                AutoSize = False
                Caption = 'Contribuição / Regional'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 4233
                mmLeft = 265
                mmTop = 60061
                mmWidth = 42598
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape2: TppShape
                UserName = 'rpGerencial03ChildReport1Shape2'
                mmHeight = 12435
                mmLeft = 42863
                mmTop = 55563
                mmWidth = 38100
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Label6: TppLabel
                UserName = 'rpGerencial03ChildReport1Label6'
                AutoSize = False
                Caption = 'NÃO IDENTIFICADA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 43656
                mmTop = 60061
                mmWidth = 36777
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape3: TppShape
                UserName = 'rpGerencial03ChildReport1Shape3'
                mmHeight = 12435
                mmLeft = 80698
                mmTop = 55563
                mmWidth = 30692
                BandType = 3
                GroupNo = 0
              end
              object lbGer03Reg02: TppLabel
                UserName = 'lbGer03Reg02'
                AutoSize = False
                Caption = 'lbGer03Reg02'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 81492
                mmTop = 60061
                mmWidth = 29369
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape4: TppShape
                UserName = 'rpGerencial03ChildReport1Shape4'
                mmHeight = 12435
                mmLeft = 111125
                mmTop = 55563
                mmWidth = 30956
                BandType = 3
                GroupNo = 0
              end
              object lbGer03Reg03: TppLabel
                UserName = 'lbGer03Reg03'
                AutoSize = False
                Caption = 'lbGer03Reg03'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 111919
                mmTop = 60061
                mmWidth = 29633
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape5: TppShape
                UserName = 'rpGerencial03ChildReport1Shape5'
                mmHeight = 12435
                mmLeft = 141817
                mmTop = 55563
                mmWidth = 30692
                BandType = 3
                GroupNo = 0
              end
              object lbGer03Reg04: TppLabel
                UserName = 'lbGer03Reg04'
                AutoSize = False
                Caption = 'lbGer03Reg04'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 142611
                mmTop = 60061
                mmWidth = 29104
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape6: TppShape
                UserName = 'rpGerencial03ChildReport1Shape6'
                mmHeight = 12435
                mmLeft = 172244
                mmTop = 55563
                mmWidth = 30692
                BandType = 3
                GroupNo = 0
              end
              object lbGer03Reg05: TppLabel
                UserName = 'lbGer03Reg05'
                AutoSize = False
                Caption = 'lbGer03Reg05'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 173038
                mmTop = 60061
                mmWidth = 29369
                BandType = 3
                GroupNo = 0
              end
              object lbGer03Reg06: TppLabel
                UserName = 'lbGer03Reg06'
                AutoSize = False
                Caption = 'lbGer03Reg06'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 203465
                mmTop = 60061
                mmWidth = 29104
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape16: TppShape
                UserName = 'rpGerencial03ChildReport1Shape16'
                mmHeight = 12435
                mmLeft = 232834
                mmTop = 55563
                mmWidth = 30427
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Label7: TppLabel
                UserName = 'rpGerencial03ChildReport1Label7'
                AutoSize = False
                Caption = 'TOTAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 4233
                mmLeft = 233628
                mmTop = 60061
                mmWidth = 29104
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Label8: TppLabel
                UserName = 'rpGerencial03ChildReport1Label8'
                Caption = 'TOTAL GERAL DE TODAS AS FILIAIS :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 91811
                mmTop = 47096
                mmWidth = 63765
                BandType = 3
                GroupNo = 0
              end
              object rpGerencial03ChildReport1DBText15: TppDBText
                UserName = 'rpGerencial03ChildReport1DBText15'
                DataField = 'TOTALGERAL'
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 158750
                mmTop = 47096
                mmWidth = 38629
                BandType = 3
                GroupNo = 0
              end
            end
            object rpGerencial03ChildReport1GroupFooterBand1: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 18521
              mmPrintPosition = 0
              object rpGerencial03ChildReport1Shape39: TppShape
                UserName = 'rpGerencial03ChildReport1Shape39'
                mmHeight = 6350
                mmLeft = 232834
                mmTop = 12171
                mmWidth = 30427
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape33: TppShape
                UserName = 'rpGerencial03ChildReport1Shape33'
                mmHeight = 6350
                mmLeft = 232834
                mmTop = 6085
                mmWidth = 30427
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape27: TppShape
                UserName = 'rpGerencial03ChildReport1Shape27'
                mmHeight = 6350
                mmLeft = 141817
                mmTop = 0
                mmWidth = 30692
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape23: TppShape
                UserName = 'rpGerencial03ChildReport1Shape23'
                mmHeight = 6350
                mmLeft = 111390
                mmTop = 0
                mmWidth = 30691
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape41: TppShape
                UserName = 'rpGerencial03ChildReport1Shape41'
                mmHeight = 6350
                mmLeft = 0
                mmTop = 12171
                mmWidth = 43127
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape40: TppShape
                UserName = 'rpGerencial03ChildReport1Shape40'
                mmHeight = 6350
                mmLeft = 0
                mmTop = 6085
                mmWidth = 43127
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape18: TppShape
                UserName = 'rpGerencial03ChildReport1Shape18'
                mmHeight = 6350
                mmLeft = 232834
                mmTop = 0
                mmWidth = 30427
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape24: TppShape
                UserName = 'rpGerencial03ChildReport1Shape24'
                mmHeight = 6350
                mmLeft = 80963
                mmTop = 0
                mmWidth = 30691
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape25: TppShape
                UserName = 'rpGerencial03ChildReport1Shape25'
                mmHeight = 6350
                mmLeft = 42863
                mmTop = 0
                mmWidth = 38365
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape26: TppShape
                UserName = 'rpGerencial03ChildReport1Shape26'
                mmHeight = 6350
                mmLeft = 0
                mmTop = 0
                mmWidth = 43127
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Label4: TppLabel
                UserName = 'rpGerencial03ChildReport1Label4'
                Caption = 'TOTAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 4233
                mmLeft = 6879
                mmTop = 1058
                mmWidth = 11377
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape28: TppShape
                UserName = 'rpGerencial03ChildReport1Shape28'
                mmHeight = 6350
                mmLeft = 172244
                mmTop = 0
                mmWidth = 30692
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape29: TppShape
                UserName = 'rpGerencial03ChildReport1Shape29'
                mmHeight = 6350
                mmLeft = 202671
                mmTop = 0
                mmWidth = 30692
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1DBCalc1: TppDBCalc
                UserName = 'rpGerencial03ChildReport1DBCalc1'
                DataField = 'COL01'
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                ResetGroup = rpGerencial03ChildReport1Group1
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 44450
                mmTop = 1058
                mmWidth = 35720
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1DBCalc2: TppDBCalc
                UserName = 'rpGerencial03ChildReport1DBCalc2'
                DataField = 'COL02'
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                ResetGroup = rpGerencial03ChildReport1Group1
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 83344
                mmTop = 1058
                mmWidth = 26988
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1DBCalc3: TppDBCalc
                UserName = 'rpGerencial03ChildReport1DBCalc3'
                DataField = 'COL03'
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                ResetGroup = rpGerencial03ChildReport1Group1
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 112448
                mmTop = 1058
                mmWidth = 28575
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1DBCalc4: TppDBCalc
                UserName = 'rpGerencial03ChildReport1DBCalc4'
                DataField = 'COL04'
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                ResetGroup = rpGerencial03ChildReport1Group1
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 143404
                mmTop = 1058
                mmWidth = 27517
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1DBCalc5: TppDBCalc
                UserName = 'rpGerencial03ChildReport1DBCalc5'
                DataField = 'COL05'
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                ResetGroup = rpGerencial03ChildReport1Group1
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 173302
                mmTop = 1058
                mmWidth = 27252
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1DBCalc6: TppDBCalc
                UserName = 'rpGerencial03ChildReport1DBCalc6'
                DataField = 'COL06'
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                ResetGroup = rpGerencial03ChildReport1Group1
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 203994
                mmTop = 1058
                mmWidth = 27252
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1DBCalc7: TppDBCalc
                UserName = 'rpGerencial03ChildReport1DBCalc7'
                DataField = 'TOTAL'
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                ResetGroup = rpGerencial03ChildReport1Group1
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 237067
                mmTop = 1323
                mmWidth = 25665
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape19: TppShape
                UserName = 'rpGerencial03ChildReport1Shape19'
                mmHeight = 6350
                mmLeft = 80963
                mmTop = 12171
                mmWidth = 30692
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape20: TppShape
                UserName = 'rpGerencial03ChildReport1Shape20'
                mmHeight = 6350
                mmLeft = 42863
                mmTop = 6085
                mmWidth = 38365
                BandType = 5
                GroupNo = 0
              end
              object lbTot02Receita01: TppLabel
                UserName = 'lbTot02Receita01'
                AutoSize = False
                Caption = 'lbTot02Receita01'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 44450
                mmTop = 7144
                mmWidth = 35720
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape21: TppShape
                UserName = 'rpGerencial03ChildReport1Shape21'
                mmHeight = 6350
                mmLeft = 80963
                mmTop = 6085
                mmWidth = 30692
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape22: TppShape
                UserName = 'rpGerencial03ChildReport1Shape22'
                mmHeight = 6350
                mmLeft = 111390
                mmTop = 6085
                mmWidth = 30692
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape30: TppShape
                UserName = 'rpGerencial03ChildReport1Shape30'
                mmHeight = 6350
                mmLeft = 141817
                mmTop = 6085
                mmWidth = 30692
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape31: TppShape
                UserName = 'rpGerencial03ChildReport1Shape31'
                mmHeight = 6350
                mmLeft = 172244
                mmTop = 6085
                mmWidth = 30692
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape32: TppShape
                UserName = 'rpGerencial03ChildReport1Shape32'
                mmHeight = 6350
                mmLeft = 202671
                mmTop = 6085
                mmWidth = 30692
                BandType = 5
                GroupNo = 0
              end
              object lbTot02Receita02: TppLabel
                UserName = 'lbTot02Receita02'
                AutoSize = False
                Caption = 'lbTot02Receita02'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 81756
                mmTop = 7144
                mmWidth = 29104
                BandType = 5
                GroupNo = 0
              end
              object lbTot02Receita04: TppLabel
                UserName = 'lbTot02Receita04'
                AutoSize = False
                Caption = 'lbTot02Receita04'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 142611
                mmTop = 7144
                mmWidth = 29104
                BandType = 5
                GroupNo = 0
              end
              object lbTot02Receita03: TppLabel
                UserName = 'lbTot02Receita03'
                AutoSize = False
                Caption = 'lbTot02Receita03'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 112184
                mmTop = 7144
                mmWidth = 29104
                BandType = 5
                GroupNo = 0
              end
              object lbTot02Receita05: TppLabel
                UserName = 'lbTot02Receita05'
                AutoSize = False
                Caption = 'lbTot02Receita05'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 173038
                mmTop = 7144
                mmWidth = 29104
                BandType = 5
                GroupNo = 0
              end
              object lbTot02Receita06: TppLabel
                UserName = 'lbTot02Receita06'
                AutoSize = False
                Caption = 'lbTot02Receita06'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 203730
                mmTop = 7144
                mmWidth = 29104
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape34: TppShape
                UserName = 'rpGerencial03ChildReport1Shape34'
                mmHeight = 6350
                mmLeft = 42598
                mmTop = 12171
                mmWidth = 38629
                BandType = 5
                GroupNo = 0
              end
              object lbPart02Contrib01: TppLabel
                UserName = 'lbPart02Contrib01'
                AutoSize = False
                Caption = 'lbPart02Contrib01'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 44450
                mmTop = 13494
                mmWidth = 35720
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape35: TppShape
                UserName = 'rpGerencial03ChildReport1Shape35'
                mmHeight = 6350
                mmLeft = 111390
                mmTop = 12171
                mmWidth = 30692
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape36: TppShape
                UserName = 'rpGerencial03ChildReport1Shape36'
                mmHeight = 6350
                mmLeft = 141817
                mmTop = 12171
                mmWidth = 30692
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape37: TppShape
                UserName = 'rpGerencial03ChildReport1Shape37'
                mmHeight = 6350
                mmLeft = 172244
                mmTop = 12171
                mmWidth = 30692
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Shape38: TppShape
                UserName = 'rpGerencial03ChildReport1Shape38'
                mmHeight = 6350
                mmLeft = 202671
                mmTop = 12171
                mmWidth = 30692
                BandType = 5
                GroupNo = 0
              end
              object lbPart02Contrib04: TppLabel
                UserName = 'lbPart02Contrib04'
                AutoSize = False
                Caption = 'lbPart02Contrib04'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 142611
                mmTop = 13494
                mmWidth = 29104
                BandType = 5
                GroupNo = 0
              end
              object lbPart02Contrib03: TppLabel
                UserName = 'lbPart02Contrib03'
                AutoSize = False
                Caption = 'lbPart02Contrib03'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 112184
                mmTop = 13494
                mmWidth = 29104
                BandType = 5
                GroupNo = 0
              end
              object lbPart02Contrib05: TppLabel
                UserName = 'lbPart02Contrib05'
                AutoSize = False
                Caption = 'lbPart02Contrib05'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 173038
                mmTop = 13494
                mmWidth = 29104
                BandType = 5
                GroupNo = 0
              end
              object lbPart02Contrib06: TppLabel
                UserName = 'lbPart02Contrib06'
                AutoSize = False
                Caption = 'lbPart02Contrib06'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 203730
                mmTop = 13494
                mmWidth = 29104
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Label21: TppLabel
                UserName = 'rpGerencial03ChildReport1Label21'
                AutoSize = False
                Caption = 'rpGerencial03ChildReport1Label21'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 233628
                mmTop = 13494
                mmWidth = 29104
                BandType = 5
                GroupNo = 0
              end
              object lbPart02Contrib02: TppLabel
                UserName = 'lbPart02Contrib02'
                AutoSize = False
                Caption = 'lbPart02Contrib02'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 81756
                mmTop = 13494
                mmWidth = 29104
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Label23: TppLabel
                UserName = 'rpGerencial03ChildReport1Label23'
                Caption = 'Particip. no Total Receita'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 4233
                mmLeft = 0
                mmTop = 7144
                mmWidth = 42598
                BandType = 5
                GroupNo = 0
              end
              object rpGerencial03ChildReport1Label24: TppLabel
                UserName = 'rpGerencial03ChildReport1Label24'
                Caption = 'Participação Contributiva'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 4233
                mmLeft = 0
                mmTop = 13229
                mmWidth = 42598
                BandType = 5
                GroupNo = 0
              end
              object DbTotalGeral2: TppDBText
                UserName = 'DbTotalGeral2'
                DataField = 'TOTALGERAL'
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 233628
                mmTop = 7144
                mmWidth = 29104
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'PAGADOR'
      DataPipeline = plGerencial03
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'plGerencial03'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 67998
        mmPrintPosition = 0
        object ppDBText32: TppDBText
          UserName = 'ppDBText32'
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
          mmLeft = 43656
          mmTop = 0
          mmWidth = 153988
          BandType = 3
          GroupNo = 0
        end
        object ppDBText33: TppDBText
          UserName = 'ppDBText33'
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
          mmLeft = 43656
          mmTop = 18785
          mmWidth = 54769
          BandType = 3
          GroupNo = 0
        end
        object ppDBText34: TppDBText
          UserName = 'ppDBText34'
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
          mmLeft = 43656
          mmTop = 6085
          mmWidth = 115623
          BandType = 3
          GroupNo = 0
        end
        object ppDBImage4: TppDBImage
          UserName = 'ppDBImage4'
          MaintainAspectRatio = True
          DataField = 'IMAGEM'
          DataPipeline = ppFundacao
          GraphicType = 'Bitmap'
          ParentDataPipeline = False
          DataPipelineName = 'ppFundacao'
          mmHeight = 25135
          mmLeft = 2381
          mmTop = 0
          mmWidth = 39688
          BandType = 3
          GroupNo = 0
        end
        object ppDBText35: TppDBText
          UserName = 'ppDBText35'
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
          mmHeight = 3704
          mmLeft = 43656
          mmTop = 10583
          mmWidth = 116152
          BandType = 3
          GroupNo = 0
        end
        object ppDBText36: TppDBText
          UserName = 'ppDBText36'
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
          mmHeight = 3704
          mmLeft = 43656
          mmTop = 14552
          mmWidth = 115359
          BandType = 3
          GroupNo = 0
        end
        object lbRel07: TppLabel
          UserName = 'lbRel07'
          Caption = '7 - Receita de Contribuição Previdenciária por Regional ('
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 29633
          mmWidth = 96044
          BandType = 3
          GroupNo = 0
        end
        object ppLabel43: TppLabel
          UserName = 'ppLabel43'
          Caption = 'PATROCINADORA :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 38100
          mmWidth = 32015
          BandType = 3
          GroupNo = 0
        end
        object ppLabel44: TppLabel
          UserName = 'ppLabel44'
          Caption = 'PLANO :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 17992
          mmTop = 42598
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object lbGer03Plano01: TppLabel
          UserName = 'lbGer03Plano01'
          Caption = 'lbGer03Plano01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 34131
          mmTop = 42598
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object ppShape50: TppShape
          UserName = 'ppShape50'
          mmHeight = 12435
          mmLeft = 0
          mmTop = 55563
          mmWidth = 43127
          BandType = 3
          GroupNo = 0
        end
        object ppLabel45: TppLabel
          UserName = 'ppLabel45'
          AutoSize = False
          Caption = 'Contribuição / Regional'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 60061
          mmWidth = 42598
          BandType = 3
          GroupNo = 0
        end
        object rpGerencial03Shape1: TppShape
          UserName = 'rpGerencial03Shape1'
          mmHeight = 12435
          mmLeft = 42863
          mmTop = 55563
          mmWidth = 30480
          BandType = 3
          GroupNo = 0
        end
        object lbReg01: TppLabel
          UserName = 'lbReg01'
          AutoSize = False
          Caption = 'NÃO IDENTIFICADA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 43127
          mmTop = 60061
          mmWidth = 29898
          BandType = 3
          GroupNo = 0
        end
        object rpGerencial03Shape3: TppShape
          UserName = 'rpGerencial03Shape3'
          mmHeight = 12435
          mmLeft = 73025
          mmTop = 55563
          mmWidth = 30480
          BandType = 3
          GroupNo = 0
        end
        object lbReg02: TppLabel
          UserName = 'lbReg02'
          AutoSize = False
          Caption = 'lbReg02'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 73290
          mmTop = 60061
          mmWidth = 29898
          BandType = 3
          GroupNo = 0
        end
        object ppShape51: TppShape
          UserName = 'ppShape51'
          mmHeight = 12435
          mmLeft = 103188
          mmTop = 55563
          mmWidth = 30480
          BandType = 3
          GroupNo = 0
        end
        object lbReg03: TppLabel
          UserName = 'lbReg03'
          AutoSize = False
          Caption = 'lbReg03'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 103452
          mmTop = 60061
          mmWidth = 29898
          BandType = 3
          GroupNo = 0
        end
        object ppShape52: TppShape
          UserName = 'ppShape52'
          mmHeight = 12435
          mmLeft = 133350
          mmTop = 55563
          mmWidth = 30480
          BandType = 3
          GroupNo = 0
        end
        object lbReg04: TppLabel
          UserName = 'lbReg04'
          AutoSize = False
          Caption = 'lbReg04'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 133615
          mmTop = 60061
          mmWidth = 29898
          BandType = 3
          GroupNo = 0
        end
        object ppShape53: TppShape
          UserName = 'ppShape53'
          mmHeight = 12435
          mmLeft = 163513
          mmTop = 55563
          mmWidth = 30480
          BandType = 3
          GroupNo = 0
        end
        object lbReg05: TppLabel
          UserName = 'lbReg05'
          AutoSize = False
          Caption = 'lbReg05'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 163777
          mmTop = 60061
          mmWidth = 29898
          BandType = 3
          GroupNo = 0
        end
        object ppShape49: TppShape
          UserName = 'ppShape49'
          mmHeight = 12435
          mmLeft = 193675
          mmTop = 55563
          mmWidth = 30480
          BandType = 3
          GroupNo = 0
        end
        object lbReg06: TppLabel
          UserName = 'lbReg06'
          AutoSize = False
          Caption = 'lbReg06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 193940
          mmTop = 60061
          mmWidth = 29898
          BandType = 3
          GroupNo = 0
        end
        object lbPatro01: TppLabel
          UserName = 'lbPatro01'
          Caption = 'lbPatro01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 34131
          mmTop = 38100
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object rpGerencial03Label1: TppLabel
          UserName = 'rpGerencial03Label1'
          Caption = 'PAGADOR :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 12700
          mmTop = 47096
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object dbPagador: TppDBText
          UserName = 'dbPagador'
          AutoSize = True
          DataField = 'PAGADOR'
          DataPipeline = plGerencial03
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'plGerencial03'
          mmHeight = 3969
          mmLeft = 34131
          mmTop = 47096
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object rpGerencial03Shape7: TppShape
          UserName = 'rpGerencial03Shape7'
          mmHeight = 12435
          mmLeft = 223838
          mmTop = 55563
          mmWidth = 30480
          BandType = 3
          GroupNo = 0
        end
        object rpGerencial03Label2: TppLabel
          UserName = 'rpGerencial03Label2'
          AutoSize = False
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 224103
          mmTop = 60061
          mmWidth = 29898
          BandType = 3
          GroupNo = 0
        end
        object rpGerencial03Label4: TppLabel
          UserName = 'rpGerencial03Label4'
          Caption = 'TOTAL GERAL DE TODAS AS FILIAIS :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 89694
          mmTop = 47096
          mmWidth = 63765
          BandType = 3
          GroupNo = 0
        end
        object rpGerencial03DBText10: TppDBText
          UserName = 'rpGerencial03DBText10'
          DataField = 'TOTALGERAL'
          DataPipeline = plGerencial03
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plGerencial03'
          mmHeight = 4233
          mmLeft = 156634
          mmTop = 47096
          mmWidth = 38629
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 18521
        mmPrintPosition = 0
        object rpGerencial03ChildReport2Shape2: TppShape
          UserName = 'rpGerencial03ChildReport2Shape2'
          mmHeight = 6350
          mmLeft = 72761
          mmTop = 12171
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03Shape10: TppShape
          UserName = 'rpGerencial03Shape10'
          mmHeight = 6350
          mmLeft = 0
          mmTop = 6085
          mmWidth = 43127
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03Label3: TppLabel
          UserName = 'rpGerencial03Label3'
          Caption = 'Particip. no Total Receita'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 7144
          mmWidth = 42598
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03Shape11: TppShape
          UserName = 'rpGerencial03Shape11'
          mmHeight = 6350
          mmLeft = 42863
          mmTop = 6085
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object lbTotReceita01: TppLabel
          UserName = 'lbTotReceita01'
          AutoSize = False
          Caption = 'lbTotReceita01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 43392
          mmTop = 7144
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object ppShape46: TppShape
          UserName = 'ppShape46'
          mmHeight = 6350
          mmLeft = 103188
          mmTop = 0
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object ppShape47: TppShape
          UserName = 'ppShape47'
          mmHeight = 6350
          mmLeft = 73025
          mmTop = 0
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object ppShape44: TppShape
          UserName = 'ppShape44'
          mmHeight = 6350
          mmLeft = 42863
          mmTop = 0
          mmWidth = 30480
          BandType = 5
          GroupNo = 0
        end
        object ppShape45: TppShape
          UserName = 'ppShape45'
          mmHeight = 6350
          mmLeft = 0
          mmTop = 0
          mmWidth = 43127
          BandType = 5
          GroupNo = 0
        end
        object ppLabel46: TppLabel
          UserName = 'ppLabel46'
          Caption = 'Total da Receita'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 6350
          mmTop = 1058
          mmWidth = 27517
          BandType = 5
          GroupNo = 0
        end
        object ppShape48: TppShape
          UserName = 'ppShape48'
          mmHeight = 6350
          mmLeft = 133350
          mmTop = 0
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03Shape5: TppShape
          UserName = 'rpGerencial03Shape5'
          mmHeight = 6350
          mmLeft = 193675
          mmTop = 0
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03Shape6: TppShape
          UserName = 'rpGerencial03Shape6'
          mmHeight = 6350
          mmLeft = 163513
          mmTop = 0
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03DBCalc1: TppDBCalc
          UserName = 'rpGerencial03DBCalc1'
          DataField = 'COL01'
          DataPipeline = plGerencial03
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plGerencial03'
          mmHeight = 4233
          mmLeft = 43392
          mmTop = 1058
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03DBCalc2: TppDBCalc
          UserName = 'rpGerencial03DBCalc2'
          DataField = 'COL02'
          DataPipeline = plGerencial03
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plGerencial03'
          mmHeight = 4233
          mmLeft = 73025
          mmTop = 1058
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03DBCalc3: TppDBCalc
          UserName = 'rpGerencial03DBCalc3'
          DataField = 'COL03'
          DataPipeline = plGerencial03
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plGerencial03'
          mmHeight = 4233
          mmLeft = 103452
          mmTop = 1058
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03DBCalc4: TppDBCalc
          UserName = 'rpGerencial03DBCalc4'
          DataField = 'COL04'
          DataPipeline = plGerencial03
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plGerencial03'
          mmHeight = 4233
          mmLeft = 133615
          mmTop = 1058
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03DBCalc5: TppDBCalc
          UserName = 'rpGerencial03DBCalc5'
          DataField = 'COL05'
          DataPipeline = plGerencial03
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plGerencial03'
          mmHeight = 4233
          mmLeft = 163777
          mmTop = 1058
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03DBCalc6: TppDBCalc
          UserName = 'rpGerencial03DBCalc6'
          DataField = 'COL06'
          DataPipeline = plGerencial03
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plGerencial03'
          mmHeight = 4233
          mmLeft = 193940
          mmTop = 1058
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03Shape9: TppShape
          UserName = 'rpGerencial03Shape9'
          mmHeight = 6350
          mmLeft = 223838
          mmTop = 0
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03Shape12: TppShape
          UserName = 'rpGerencial03Shape12'
          mmHeight = 6350
          mmLeft = 72761
          mmTop = 6085
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03Shape13: TppShape
          UserName = 'rpGerencial03Shape13'
          mmHeight = 6350
          mmLeft = 102923
          mmTop = 6085
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03Shape14: TppShape
          UserName = 'rpGerencial03Shape14'
          mmHeight = 6350
          mmLeft = 133086
          mmTop = 6085
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03Shape15: TppShape
          UserName = 'rpGerencial03Shape15'
          mmHeight = 6350
          mmLeft = 163248
          mmTop = 6085
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03Shape16: TppShape
          UserName = 'rpGerencial03Shape16'
          mmHeight = 6350
          mmLeft = 193411
          mmTop = 6085
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03Shape17: TppShape
          UserName = 'rpGerencial03Shape17'
          mmHeight = 6350
          mmLeft = 223573
          mmTop = 6085
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object lbTotReceita02: TppLabel
          UserName = 'lbTotReceita02'
          AutoSize = False
          Caption = 'lbTotReceita02'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 73025
          mmTop = 7144
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object lbTotReceita04: TppLabel
          UserName = 'lbTotReceita04'
          AutoSize = False
          Caption = 'lbTotReceita04'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 133350
          mmTop = 7144
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object lbTotReceita03: TppLabel
          UserName = 'lbTotReceita03'
          AutoSize = False
          Caption = 'lbTotReceita03'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 103188
          mmTop = 7144
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object lbTotReceita05: TppLabel
          UserName = 'lbTotReceita05'
          AutoSize = False
          Caption = 'lbTotReceita05'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 163513
          mmTop = 7144
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object lbTotReceita06: TppLabel
          UserName = 'lbTotReceita06'
          AutoSize = False
          Caption = 'lbTotReceita06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 193675
          mmTop = 7144
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03DBCalc7: TppDBCalc
          UserName = 'rpGerencial03DBCalc7'
          DataField = 'TOTAL'
          DataPipeline = plGerencial03
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plGerencial03'
          mmHeight = 4233
          mmLeft = 223573
          mmTop = 1058
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03ChildReport2Shape1: TppShape
          UserName = 'rpGerencial03ChildReport2Shape1'
          mmHeight = 6350
          mmLeft = 42598
          mmTop = 12171
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object lbPartContrib01: TppLabel
          UserName = 'lbPartContrib01'
          AutoSize = False
          Caption = 'lbPartContrib01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 43392
          mmTop = 13494
          mmWidth = 29104
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03ChildReport2Shape8: TppShape
          UserName = 'rpGerencial03ChildReport2Shape8'
          mmHeight = 6350
          mmLeft = 0
          mmTop = 12171
          mmWidth = 43127
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03ChildReport2Shape3: TppShape
          UserName = 'rpGerencial03ChildReport2Shape3'
          mmHeight = 6350
          mmLeft = 102923
          mmTop = 12171
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03ChildReport2Shape4: TppShape
          UserName = 'rpGerencial03ChildReport2Shape4'
          mmHeight = 6350
          mmLeft = 133086
          mmTop = 12171
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03ChildReport2Shape5: TppShape
          UserName = 'rpGerencial03ChildReport2Shape5'
          mmHeight = 6350
          mmLeft = 163248
          mmTop = 12171
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03ChildReport2Shape6: TppShape
          UserName = 'rpGerencial03ChildReport2Shape6'
          mmHeight = 6350
          mmLeft = 193411
          mmTop = 12171
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03ChildReport2Shape7: TppShape
          UserName = 'rpGerencial03ChildReport2Shape7'
          mmHeight = 6350
          mmLeft = 223573
          mmTop = 12171
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object lbPartContrib04: TppLabel
          UserName = 'lbPartContrib04'
          AutoSize = False
          Caption = 'lbPartContrib04'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 134144
          mmTop = 13494
          mmWidth = 29104
          BandType = 5
          GroupNo = 0
        end
        object lbPartContrib03: TppLabel
          UserName = 'lbPartContrib03'
          AutoSize = False
          Caption = 'lbPartContrib03'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 103981
          mmTop = 13494
          mmWidth = 29104
          BandType = 5
          GroupNo = 0
        end
        object lbPartContrib05: TppLabel
          UserName = 'lbPartContrib05'
          AutoSize = False
          Caption = 'lbPartContrib05'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 164307
          mmTop = 13494
          mmWidth = 29104
          BandType = 5
          GroupNo = 0
        end
        object lbPartContrib06: TppLabel
          UserName = 'lbPartContrib06'
          AutoSize = False
          Caption = 'lbPartContrib06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 194469
          mmTop = 13494
          mmWidth = 29104
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03ChildReport2Label8: TppLabel
          UserName = 'rpGerencial03ChildReport2Label8'
          Caption = 'Participação Contributiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 13229
          mmWidth = 42598
          BandType = 5
          GroupNo = 0
        end
        object rpGerencial03ChildReport2Label7: TppLabel
          UserName = 'rpGerencial03ChildReport2Label7'
          AutoSize = False
          Caption = 'rpGerencial03ChildReport2Label7'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 224632
          mmTop = 13494
          mmWidth = 29104
          BandType = 5
          GroupNo = 0
        end
        object lbPartContrib02: TppLabel
          UserName = 'lbPartContrib02'
          AutoSize = False
          Caption = 'lbPartContrib02'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 73819
          mmTop = 13494
          mmWidth = 29104
          BandType = 5
          GroupNo = 0
        end
        object dbTotalGeral: TppDBText
          UserName = 'dbTotalGeral'
          DataField = 'TOTALGERAL'
          DataPipeline = plGerencial03
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plGerencial03'
          mmHeight = 4233
          mmLeft = 223573
          mmTop = 7144
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object QryGer02Sub01: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'                                                        ' +
        '                  '#39' AS PATRO        ,'
      '       '#39'                    '#39' AS TIPO         ,'
      '       '#39'                    '#39' AS FAIXA        ,'
      '       '#39'                    '#39' AS MES          ,'
      '       0  AS MEDIASALARIAL,'
      '       0  AS VALORABSOLUTO'
      'FROM DUAL')
    ValidateWithMask = True
    Left = 242
    Top = 39
  end
  object dsGer02Sub01: TwwDataSource
    DataSet = QryGer02Sub01
    Left = 242
    Top = 27
  end
  object plGer02Sub01: TppBDEPipeline
    DataSource = dsGer02Sub01
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plGer02Sub01'
    Left = 242
    Top = 15
  end
  object qryGer02Sub02: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PAT.NOME                      AS PATRO       ,'
      '       CFG.FAIXA                                    ,'
      '       COUNT(*)                      AS FREQABSOLUTA,'
      '       (SUM(HST.VALOROP1)/COUNT(*) ) AS MEDIA'
      'FROM PESSOA PAT, HSTCONTRIBPREV HST,'
      ''
      '     (SELECT '#39'De 0.1 a 3%'#39' AS FAIXA,'
      '             0.1           AS A1   ,'
      '             3             AS A2'
      '      FROM PARAMAPREV'
      '      UNION'
      '      SELECT '#39'De 3 a 5%'#39'   AS FAIXA,'
      '             3             AS A1   ,'
      '             5             AS A2'
      '      FROM PARAMAPREV'
      '      UNION'
      '      SELECT '#39'De 5 a 8%'#39'   AS FAIXA,'
      '             5             AS A1   ,'
      '             8             AS A2'
      '      FROM PARAMAPREV'
      '      UNION'
      '      SELECT '#39'De 8 a 11%'#39'   AS FAIXA,'
      '             8              AS A1   ,'
      '             11             AS A2'
      '      FROM PARAMAPREV'
      '      UNION'
      '      SELECT '#39'Mais de 11%'#39'  AS FAIXA,'
      '             11              AS A1   ,'
      '             1100            AS A2'
      '      FROM PARAMAPREV) CFG'
      ''
      'WHERE  (HST.IDCONTRIBUICAO = 19)'
      'AND    (HST.MESREFERENCIA  = '#39'2000/02'#39')'
      'AND    (HST.IDMOTIVO       = 4)'
      'AND    (HST.IDPESSJUR      = 99)'
      'AND    (HST.IDPESSJUR      = PAT.IDPESSOA)'
      'AND    (HST.VALOROP1      >= CFG.A1)'
      'AND    (HST.VALOROP1       < CFG.A2)'
      'GROUP BY PAT.NOME, CFG.FAIXA'
      'ORDER BY PAT.NOME, CFG.FAIXA'
      '')
    ValidateWithMask = True
    Left = 298
    Top = 39
  end
  object dsGer02Sub02: TwwDataSource
    DataSet = qryGer02Sub02
    Left = 298
    Top = 27
  end
  object plGer02Sub02: TppBDEPipeline
    DataSource = dsGer02Sub02
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plGer02Sub02'
    Left = 298
    Top = 15
  end
  object qryRegional: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 345
    Top = 94
  end
  object qryGer03Sub01: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT '#39'A'#39' AS CONTRIBUICAO,'
      '       '#39'A'#39' AS PAGADOR     ,'
      '       0     AS COL01       , '
      '       0     AS COL02       , '
      '       0     AS COL03       , '
      '       0     AS COL04       , '
      '       0     AS COL05       , '
      '       0     AS COL06'#9'    ,'
      '       0     AS TOTAL'
      'FROM PARAMAPREV')
    UpdateObject = pdtSQLGer03Sub01
    ValidateWithMask = True
    Left = 242
    Top = 130
  end
  object dsGer03Sub01: TwwDataSource
    DataSet = qryGer03Sub01
    Left = 242
    Top = 118
  end
  object plGer03Sub01: TppBDEPipeline
    DataSource = dsGer03Sub01
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'plGer03Sub01'
    Left = 243
    Top = 106
    object plGer03Sub01ppField1: TppField
      FieldAlias = 'CONTRIBUICAO'
      FieldName = 'CONTRIBUICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object plGer03Sub01ppField2: TppField
      FieldAlias = 'PAGADOR'
      FieldName = 'PAGADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object plGer03Sub01ppField3: TppField
      FieldAlias = 'COL01'
      FieldName = 'COL01'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object plGer03Sub01ppField4: TppField
      FieldAlias = 'COL02'
      FieldName = 'COL02'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object plGer03Sub01ppField5: TppField
      FieldAlias = 'COL03'
      FieldName = 'COL03'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object plGer03Sub01ppField6: TppField
      FieldAlias = 'COL04'
      FieldName = 'COL04'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object plGer03Sub01ppField7: TppField
      FieldAlias = 'COL05'
      FieldName = 'COL05'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object plGer03Sub01ppField8: TppField
      FieldAlias = 'COL06'
      FieldName = 'COL06'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object plGer03Sub01ppField9: TppField
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object pdtSQLGer03Sub01: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMAPREV'
      'set'
      '  CONTRIBUICAO = :CONTRIBUICAO,'
      '  PAGADOR = :PAGADOR,'
      '  COL01 = :COL01,'
      '  COL02 = :COL02,'
      '  COL03 = :COL03,'
      '  COL04 = :COL04,'
      '  COL05 = :COL05,'
      '  COL06 = :COL06'
      'where'
      '  CONTRIBUICAO = :OLD_CONTRIBUICAO and'
      '  PAGADOR = :OLD_PAGADOR and'
      '  COL01 = :OLD_COL01 and'
      '  COL02 = :OLD_COL02 and'
      '  COL03 = :OLD_COL03 and'
      '  COL04 = :OLD_COL04 and'
      '  COL05 = :OLD_COL05 and'
      '  COL06 = :OLD_COL06')
    InsertSQL.Strings = (
      'insert into PARAMAPREV'
      
        '  (CONTRIBUICAO, PAGADOR, COL01, COL02, COL03, COL04, COL05, COL' +
        '06)'
      'values'
      
        '  (:CONTRIBUICAO, :PAGADOR, :COL01, :COL02, :COL03, :COL04, :COL' +
        '05, :COL06)')
    Left = 243
    Top = 94
  end
  object ppConsolidaMovResCotas: TppBDEPipeline
    DataSource = dsConsolidaMovResCotas
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'ConsolidaMovResCotas'
    Left = 346
    Top = 227
    object ppConsolidaMovResCotasppField1: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppConsolidaMovResCotasppField2: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppConsolidaMovResCotasppField3: TppField
      FieldAlias = 'CODHIERARQUIA'
      FieldName = 'CODHIERARQUIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppConsolidaMovResCotasppField4: TppField
      FieldAlias = 'NOMERESERVA'
      FieldName = 'NOMERESERVA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppConsolidaMovResCotasppField5: TppField
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppConsolidaMovResCotasppField6: TppField
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppConsolidaMovResCotasppField7: TppField
      FieldAlias = 'IDTIPORESERVA'
      FieldName = 'IDTIPORESERVA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppConsolidaMovResCotasppField8: TppField
      FieldAlias = 'MOESIGLA'
      FieldName = 'MOESIGLA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppConsolidaMovResCotasppField9: TppField
      FieldAlias = 'NOMEINDICE'
      FieldName = 'NOMEINDICE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppConsolidaMovResCotasppField10: TppField
      FieldAlias = 'MESANOREFERENCIA'
      FieldName = 'MESANOREFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppConsolidaMovResCotasppField11: TppField
      FieldAlias = 'PLNPLANIL'
      FieldName = 'PLNPLANIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppConsolidaMovResCotasppField12: TppField
      FieldAlias = 'VALORINDICE'
      FieldName = 'VALORINDICE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppConsolidaMovResCotasppField13: TppField
      FieldAlias = 'SALDOANTERIOR'
      FieldName = 'SALDOANTERIOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppConsolidaMovResCotasppField14: TppField
      FieldAlias = 'ENTRADAS'
      FieldName = 'ENTRADAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppConsolidaMovResCotasppField15: TppField
      FieldAlias = 'BENEFICIOS'
      FieldName = 'BENEFICIOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppConsolidaMovResCotasppField16: TppField
      FieldAlias = 'DEVOLUCOES'
      FieldName = 'DEVOLUCOES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppConsolidaMovResCotasppField17: TppField
      FieldAlias = 'SALDO_MES'
      FieldName = 'SALDO_MES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
  end
  object dsConsolidaMovResCotas: TwwDataSource
    DataSet = qryConsolidaMovResCotas
    Left = 346
    Top = 184
  end
  object qryConsolidaMovResCotas: TwwQuery
    CachedUpdates = True
    BeforeOpen = qryConsolidaMovResCotasBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PAT.NOME PATROCINADORA,'
      '       PL.NOME AS PLANO,'
      '       RP.CODHIERARQUIA,'
      '       RP.NOME AS NOMERESERVA,'
      '       PLP.IDPESSJUR,'
      '       PLP.IDPLANOPREV,'
      '       RP.IDTIPORESERVA,'
      '       M.MOESIGLA,'
      '       M.MOEDESC AS NOMEINDICE,'
      '       :ANOMESREFERENCIA AS MESANOREFERENCIA,'
      '       0 PLNPLANIL ,'
      '       0 AS VALORINDICE,'
      '       0 AS SALDOANTERIOR,'
      '       0 AS ENTRADAS,'
      '       0 AS BENEFICIOS,'
      '       0 AS DEVOLUCOES,'
      '       0 AS SALDO_MES'
      
        'FROM   RESERVAXPLANO RP, PESSOA PAT, PLANPREV PL, PLANPREVPATRO ' +
        'PLP, MOEDA M'
      'WHERE  PLP.IDPESSJUR   = :IDPESSJUR'
      'AND    PLP.IDPLANOPREV = :IDPLANOPREV'
      'AND    PL.IDPLANOPREV  = PLP.IDPLANOPREV'
      'AND    PAT.IDPESSOA    = PLP.IDPESSJUR'
      'AND    RP.IDPLANOPREV  = PLP.IDPLANOPREV'
      'AND    RP.ANALITICOSINTETI = '#39'A'#39
      'AND    M.MOECODIGO(+) = RP.INDICEREAJUSTE'
      'ORDER BY PAT.NOME, PL.NOME, m.moecodigo,RP.CODHIERARQUIA'
      ''
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updConsolidaMovResCotas
    ValidateWithMask = True
    Left = 349
    Top = 206
    ParamData = <
      item
        DataType = ftString
        Name = 'ANOMESREFERENCIA'
        ParamType = ptUnknown
        Value = '2002/04'
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = '7'
      end>
  end
  object rpConsolidaMovRes: TppReport
    AutoStop = False
    DataPipeline = ppConsolidaMovResCotas
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 346
    Top = 162
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppConsolidaMovResCotas'
    object ppHeaderBand2: TppHeaderBand
      BeforeGenerate = ppHeaderBand2BeforeGenerate
      mmBottomOffset = 0
      mmHeight = 23284
      mmPrintPosition = 0
      object ppLabel47: TppLabel
        UserName = 'Label11'
        Caption = 'Relatório Consolidado de Movimento de Reserva - COTAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 93398
        mmTop = 18521
        mmWidth = 97367
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'Label76'
        Caption = 'Referência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 204259
        mmTop = 18521
        mmWidth = 19050
        BandType = 0
      end
      object ppDBText75: TppDBText
        UserName = 'DBText75'
        DataField = 'MESANOREFERENCIA'
        DataPipeline = ppConsolidaMovResCotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppConsolidaMovResCotas'
        mmHeight = 4233
        mmLeft = 228865
        mmTop = 18521
        mmWidth = 28840
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 19844
        mmLeft = 1058
        mmTop = 529
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText56: TppDBText
        UserName = 'DBText56'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5027
        mmLeft = 43127
        mmTop = 794
        mmWidth = 133615
        BandType = 0
      end
      object ppDBText57: TppDBText
        UserName = 'DBText57'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3969
        mmLeft = 43127
        mmTop = 6085
        mmWidth = 23548
        BandType = 0
      end
      object ppDBText58: TppDBText
        UserName = 'DBText58'
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 2910
        mmLeft = 43127
        mmTop = 10054
        mmWidth = 48419
        BandType = 0
      end
      object ppDBText59: TppDBText
        UserName = 'DBText701'
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 2910
        mmLeft = 43127
        mmTop = 13229
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 43127
        mmTop = 16404
        mmWidth = 5027
        BandType = 0
      end
      object ppDBText60: TppDBText
        UserName = 'DBText60'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 2910
        mmLeft = 50536
        mmTop = 16404
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText61: TppDBText
        UserName = 'DBText61'
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 2910
        mmLeft = 93663
        mmTop = 10054
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText62: TppDBText
        UserName = 'DBText62'
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 2910
        mmLeft = 93398
        mmTop = 13229
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4234
      mmPrintPosition = 0
      object ppShape6: TppShape
        UserName = 'Shape2'
        ParentHeight = True
        mmHeight = 4234
        mmLeft = 2910
        mmTop = 0
        mmWidth = 281253
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'NOMERESERVA'
        DataPipeline = ppConsolidaMovResCotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsolidaMovResCotas'
        mmHeight = 3175
        mmLeft = 24342
        mmTop = 529
        mmWidth = 80433
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'SALDOANTERIOR'
        DataPipeline = ppConsolidaMovResCotas
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsolidaMovResCotas'
        mmHeight = 3704
        mmLeft = 109802
        mmTop = 529
        mmWidth = 29369
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        DataField = 'ENTRADAS'
        DataPipeline = ppConsolidaMovResCotas
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsolidaMovResCotas'
        mmHeight = 3175
        mmLeft = 145257
        mmTop = 529
        mmWidth = 29369
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        DataField = 'BENEFICIOS'
        DataPipeline = ppConsolidaMovResCotas
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsolidaMovResCotas'
        mmHeight = 3175
        mmLeft = 180711
        mmTop = 529
        mmWidth = 29369
        BandType = 4
      end
      object ppDBText45: TppDBText
        UserName = 'DBText45'
        DataField = 'DEVOLUCOES'
        DataPipeline = ppConsolidaMovResCotas
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsolidaMovResCotas'
        mmHeight = 3175
        mmLeft = 215107
        mmTop = 529
        mmWidth = 29369
        BandType = 4
      end
      object ppDBText46: TppDBText
        UserName = 'DBText46'
        DataField = 'SALDO_MES'
        DataPipeline = ppConsolidaMovResCotas
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsolidaMovResCotas'
        mmHeight = 3175
        mmLeft = 249767
        mmTop = 529
        mmWidth = 29369
        BandType = 4
      end
      object ppDBText72: TppDBText
        UserName = 'DBText72'
        DataField = 'CODHIERARQUIA'
        DataPipeline = ppConsolidaMovResCotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsolidaMovResCotas'
        mmHeight = 3175
        mmLeft = 10583
        mmTop = 529
        mmWidth = 11113
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLine18: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel51: TppLabel
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
        mmTop = 1852
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
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
        mmLeft = 0
        mmTop = 1852
        mmWidth = 283898
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
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
        mmLeft = 244475
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand5: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = True
        OutlineSettings.CreateNode = True
        PrintBehavior = pbSection
        ResetPageNo = False
        TraverseAllData = False
        DataPipelineName = 'ppConsolidaMovResReal'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppConsolidaMovResReal
          PrinterSetup.BinName = 'Seleção automática'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Microsoft XPS Document Writer'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210079
          PrinterSetup.mmPaperWidth = 297127
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 320
          Top = 176
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppConsolidaMovResReal'
          object ppTitleBand2: TppTitleBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppHeaderBand3: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 23283
            mmPrintPosition = 0
            object ppDBImage5: TppDBImage
              UserName = 'DBImage5'
              MaintainAspectRatio = True
              Stretch = True
              DataField = 'IMAGEM'
              DataPipeline = ppFundacao
              GraphicType = 'Bitmap'
              ParentDataPipeline = False
              DataPipelineName = 'ppFundacao'
              mmHeight = 19844
              mmLeft = 1058
              mmTop = 1058
              mmWidth = 39688
              BandType = 0
            end
            object ppDBText64: TppDBText
              UserName = 'DBText64'
              DataField = 'NOME'
              DataPipeline = ppFundacao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppFundacao'
              mmHeight = 5027
              mmLeft = 43127
              mmTop = 1323
              mmWidth = 133615
              BandType = 0
            end
            object ppDBText65: TppDBText
              UserName = 'DBText65'
              AutoSize = True
              DataField = 'RAZAOSOCIAL'
              DataPipeline = ppFundacao
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppFundacao'
              mmHeight = 3704
              mmLeft = 43127
              mmTop = 6615
              mmWidth = 87313
              BandType = 0
            end
            object ppDBText66: TppDBText
              UserName = 'DBText66'
              DataField = 'LOGRADOURO'
              DataPipeline = ppFundacao
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppFundacao'
              mmHeight = 2910
              mmLeft = 43127
              mmTop = 10583
              mmWidth = 48419
              BandType = 0
            end
            object ppDBText70: TppDBText
              UserName = 'DBText70'
              DataField = 'BAIRRO'
              DataPipeline = ppFundacao
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppFundacao'
              mmHeight = 2910
              mmLeft = 43127
              mmTop = 13758
              mmWidth = 20108
              BandType = 0
            end
            object ppLabel61: TppLabel
              UserName = 'Label61'
              Caption = 'CEP'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 43127
              mmTop = 16933
              mmWidth = 5027
              BandType = 0
            end
            object ppDBText71: TppDBText
              UserName = 'DBText71'
              DataField = 'CEP'
              DataPipeline = ppFundacao
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppFundacao'
              mmHeight = 2910
              mmLeft = 50536
              mmTop = 16933
              mmWidth = 17198
              BandType = 0
            end
            object ppLabel62: TppLabel
              UserName = 'Label62'
              Caption = 'Relatório Consolidado de Movimento de Reserva - REAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 85725
              mmTop = 18785
              mmWidth = 94721
              BandType = 0
            end
            object ppDBText67: TppDBText
              UserName = 'DBText67'
              DataField = 'NUMERO'
              DataPipeline = ppFundacao
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppFundacao'
              mmHeight = 2910
              mmLeft = 93663
              mmTop = 10583
              mmWidth = 17198
              BandType = 0
            end
            object ppDBText68: TppDBText
              UserName = 'DBText68'
              DataField = 'CODESTADO'
              DataPipeline = ppFundacao
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppFundacao'
              mmHeight = 2910
              mmLeft = 93398
              mmTop = 13758
              mmWidth = 17198
              BandType = 0
            end
            object ppDBText69: TppDBText
              UserName = 'DBText69'
              DataField = 'CIDADE'
              DataPipeline = ppFundacao
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppFundacao'
              mmHeight = 2910
              mmLeft = 64029
              mmTop = 13758
              mmWidth = 27517
              BandType = 0
            end
            object ppLabel77: TppLabel
              UserName = 'Label77'
              Caption = 'Referência:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 204259
              mmTop = 18785
              mmWidth = 19050
              BandType = 0
            end
            object ppDBText76: TppDBText
              UserName = 'DBText76'
              DataField = 'MESANOREFERENCIA'
              DataPipeline = ppConsolidaMovResReal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'ppConsolidaMovResReal'
              mmHeight = 4233
              mmLeft = 228600
              mmTop = 18785
              mmWidth = 26988
              BandType = 0
            end
          end
          object ppDetailBand7: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppShape22: TppShape
              UserName = 'Shape22'
              ParentHeight = True
              mmHeight = 4233
              mmLeft = 2910
              mmTop = 0
              mmWidth = 281253
              BandType = 4
            end
            object ppDBText50: TppDBText
              UserName = 'DBText301'
              DataField = 'NOMERESERVA'
              DataPipeline = ppConsolidaMovResReal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppConsolidaMovResReal'
              mmHeight = 3175
              mmLeft = 26458
              mmTop = 529
              mmWidth = 69850
              BandType = 4
            end
            object ppDBText51: TppDBText
              UserName = 'DBText51'
              DataField = 'SALDOANTERIOR'
              DataPipeline = ppConsolidaMovResReal
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppConsolidaMovResReal'
              mmHeight = 3175
              mmLeft = 111919
              mmTop = 529
              mmWidth = 29369
              BandType = 4
            end
            object ppDBText52: TppDBText
              UserName = 'DBText52'
              DataField = 'ENTRADAS'
              DataPipeline = ppConsolidaMovResReal
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppConsolidaMovResReal'
              mmHeight = 3175
              mmLeft = 147373
              mmTop = 529
              mmWidth = 29369
              BandType = 4
            end
            object ppDBText53: TppDBText
              UserName = 'DBText53'
              DataField = 'BENEFICIOS'
              DataPipeline = ppConsolidaMovResReal
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppConsolidaMovResReal'
              mmHeight = 3175
              mmLeft = 180446
              mmTop = 529
              mmWidth = 29369
              BandType = 4
            end
            object ppDBText54: TppDBText
              UserName = 'DBText54'
              DataField = 'DEVOLUCOES'
              DataPipeline = ppConsolidaMovResReal
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppConsolidaMovResReal'
              mmHeight = 3175
              mmLeft = 217223
              mmTop = 529
              mmWidth = 29369
              BandType = 4
            end
            object ppDBText55: TppDBText
              UserName = 'DBText55'
              DataField = 'SALDO_MES'
              DataPipeline = ppConsolidaMovResReal
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppConsolidaMovResReal'
              mmHeight = 3175
              mmLeft = 251884
              mmTop = 529
              mmWidth = 29369
              BandType = 4
            end
            object ppDBText74: TppDBText
              UserName = 'DBText74'
              DataField = 'CODHIERARQUIA'
              DataPipeline = ppConsolidaMovResReal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppConsolidaMovResReal'
              mmHeight = 3175
              mmLeft = 12700
              mmTop = 529
              mmWidth = 11906
              BandType = 4
            end
          end
          object ppFooterBand6: TppFooterBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppGroup6: TppGroup
            BreakName = 'ppDBText64'
            BreakType = btCustomField
            OutlineSettings.CreateNode = True
            UserName = 'Group6'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = ''
            object ppGroupHeaderBand6: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroupFooterBand6: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
          object ppGroup7: TppGroup
            BreakName = 'PATROCINADORA'
            DataPipeline = ppConsolidaMovResReal
            OutlineSettings.CreateNode = True
            UserName = 'Group7'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppConsolidaMovResReal'
            object ppGroupHeaderBand7: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 4233
              mmPrintPosition = 0
              object ppLabel64: TppLabel
                UserName = 'Label64'
                Caption = 'Plano :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 206375
                mmTop = 265
                mmWidth = 10583
                BandType = 3
                GroupNo = 1
              end
              object ppDBText49: TppDBText
                UserName = 'DBText49'
                DataField = 'PLANO'
                DataPipeline = ppConsolidaMovResReal
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                DataPipelineName = 'ppConsolidaMovResReal'
                mmHeight = 3704
                mmLeft = 219075
                mmTop = 265
                mmWidth = 65617
                BandType = 3
                GroupNo = 1
              end
              object ppLabel63: TppLabel
                UserName = 'Label63'
                Caption = 'Patrocinadora:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 2911
                mmTop = 265
                mmWidth = 22490
                BandType = 3
                GroupNo = 1
              end
              object ppDBText48: TppDBText
                UserName = 'DBText48'
                DataField = 'PATROCINADORA'
                DataPipeline = ppConsolidaMovResReal
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                DataPipelineName = 'ppConsolidaMovResReal'
                mmHeight = 3704
                mmLeft = 32544
                mmTop = 265
                mmWidth = 98425
                BandType = 3
                GroupNo = 1
              end
            end
            object ppGroupFooterBand7: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
          object ppGroup10: TppGroup
            BreakName = 'NOMEINDICE'
            DataPipeline = ppConsolidaMovResReal
            OutlineSettings.CreateNode = True
            UserName = 'Group10'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppConsolidaMovResReal'
            object ppGroupHeaderBand10: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 8731
              mmPrintPosition = 0
              object ppShape16: TppShape
                UserName = 'Shape16'
                Brush.Color = 14680063
                ParentHeight = True
                Pen.Width = 2
                mmHeight = 8731
                mmLeft = 2910
                mmTop = 0
                mmWidth = 281253
                BandType = 3
                GroupNo = 2
              end
              object ppLabel65: TppLabel
                UserName = 'Label65'
                Caption = 'Reservas Calculadas em ('
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 12700
                mmTop = 794
                mmWidth = 34925
                BandType = 3
                GroupNo = 2
              end
              object ppDBText82: TppDBText
                UserName = 'DBText82'
                AutoSize = True
                DataField = 'NOMEINDICE'
                DataPipeline = ppConsolidaMovResReal
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                DataPipelineName = 'ppConsolidaMovResReal'
                mmHeight = 3440
                mmLeft = 77258
                mmTop = 794
                mmWidth = 17992
                BandType = 3
                GroupNo = 2
              end
              object ppLabel66: TppLabel
                UserName = 'Label66'
                Caption = ')'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 75142
                mmTop = 794
                mmWidth = 1058
                BandType = 3
                GroupNo = 2
              end
              object ppDBText83: TppDBText
                UserName = 'DBText83'
                DataField = 'MOESIGLA'
                DataPipeline = ppConsolidaMovResReal
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                DataPipelineName = 'ppConsolidaMovResReal'
                mmHeight = 3440
                mmLeft = 56621
                mmTop = 794
                mmWidth = 18256
                BandType = 3
                GroupNo = 2
              end
              object ppLabel67: TppLabel
                UserName = 'Label67'
                Caption = 'Código'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3440
                mmLeft = 12700
                mmTop = 4498
                mmWidth = 8996
                BandType = 3
                GroupNo = 2
              end
              object ppLabel68: TppLabel
                UserName = 'Label68'
                Caption = 'Reserva'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3440
                mmLeft = 26458
                mmTop = 4498
                mmWidth = 10583
                BandType = 3
                GroupNo = 2
              end
              object ppLabel70: TppLabel
                UserName = 'Label70'
                Caption = 'Saldo Anterior'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 123296
                mmTop = 4498
                mmWidth = 17992
                BandType = 3
                GroupNo = 2
              end
              object ppLabel73: TppLabel
                UserName = 'Label73'
                Caption = 'Entradas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 165365
                mmTop = 4498
                mmWidth = 11377
                BandType = 3
                GroupNo = 2
              end
              object ppLabel80: TppLabel
                UserName = 'Label80'
                Caption = 'Pagto. Benefícios'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 189971
                mmTop = 4498
                mmWidth = 22225
                BandType = 3
                GroupNo = 2
              end
              object ppLabel85: TppLabel
                UserName = 'Label601'
                Caption = 'Valor :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 206375
                mmTop = 794
                mmWidth = 8731
                BandType = 3
                GroupNo = 2
              end
              object ppDBText84: TppDBText
                UserName = 'DBText84'
                DataField = 'VALORINDICE'
                DataPipeline = ppConsolidaMovResReal
                DisplayFormat = '#,0.0000;-#,0.0000'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                DataPipelineName = 'ppConsolidaMovResReal'
                mmHeight = 3440
                mmLeft = 219075
                mmTop = 794
                mmWidth = 17463
                BandType = 3
                GroupNo = 2
              end
              object ppLabel86: TppLabel
                UserName = 'Label86'
                Caption = 'Devoluções'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 231775
                mmTop = 4498
                mmWidth = 14817
                BandType = 3
                GroupNo = 2
              end
              object ppLabel87: TppLabel
                UserName = 'Label87'
                Caption = 'Saldo Atual'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 266701
                mmTop = 4498
                mmWidth = 14552
                BandType = 3
                GroupNo = 2
              end
            end
            object ppGroupFooterBand10: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
              object ppShape24: TppShape
                UserName = 'Shape24'
                Brush.Color = 14680063
                Pen.Width = 2
                mmHeight = 5821
                mmLeft = 2910
                mmTop = 0
                mmWidth = 281253
                BandType = 5
                GroupNo = 2
              end
              object ppLabel69: TppLabel
                UserName = 'Label69'
                AutoSize = False
                Caption = 'Total das Reservas Calculadas em  ( '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 12700
                mmTop = 1058
                mmWidth = 53446
                BandType = 5
                GroupNo = 2
              end
              object ppDBText85: TppDBText
                UserName = 'DBText801'
                DataField = 'MOESIGLA'
                DataPipeline = ppConsolidaMovResReal
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                DataPipelineName = 'ppConsolidaMovResReal'
                mmHeight = 3440
                mmLeft = 66940
                mmTop = 1058
                mmWidth = 17198
                BandType = 5
                GroupNo = 2
              end
              object ppLabel88: TppLabel
                UserName = 'Label88'
                Caption = ')'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 85461
                mmTop = 1058
                mmWidth = 1058
                BandType = 5
                GroupNo = 2
              end
              object ppDBText86: TppDBText
                UserName = 'DBText86'
                AutoSize = True
                DataField = 'NOMEINDICE'
                DataPipeline = ppConsolidaMovResReal
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                DataPipelineName = 'ppConsolidaMovResReal'
                mmHeight = 3440
                mmLeft = 87577
                mmTop = 1058
                mmWidth = 17992
                BandType = 5
                GroupNo = 2
              end
              object ppDBCalc23: TppDBCalc
                UserName = 'DBCalc23'
                DataField = 'SALDOANTERIOR'
                DataPipeline = ppConsolidaMovResReal
                DisplayFormat = '#,0.0000;-#,0.0000'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                ResetGroup = ppGroup9
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppConsolidaMovResReal'
                mmHeight = 3175
                mmLeft = 111125
                mmTop = 1058
                mmWidth = 30163
                BandType = 5
                GroupNo = 2
              end
              object ppDBCalc24: TppDBCalc
                UserName = 'DBCalc24'
                DataField = 'ENTRADAS'
                DataPipeline = ppConsolidaMovResReal
                DisplayFormat = '#,0.0000;-#,0.0000'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                ResetGroup = ppGroup9
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppConsolidaMovResReal'
                mmHeight = 3175
                mmLeft = 146579
                mmTop = 1058
                mmWidth = 30163
                BandType = 5
                GroupNo = 2
              end
              object ppDBCalc25: TppDBCalc
                UserName = 'DBCalc25'
                DataField = 'BENEFICIOS'
                DataPipeline = ppConsolidaMovResReal
                DisplayFormat = '#,0.0000;-#,0.0000'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                ResetGroup = ppGroup9
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppConsolidaMovResReal'
                mmHeight = 3175
                mmLeft = 182034
                mmTop = 1058
                mmWidth = 30163
                BandType = 5
                GroupNo = 2
              end
              object ppDBCalc26: TppDBCalc
                UserName = 'DBCalc26'
                DataField = 'DEVOLUCOES'
                DataPipeline = ppConsolidaMovResReal
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                ResetGroup = ppGroup9
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppConsolidaMovResReal'
                mmHeight = 3175
                mmLeft = 216430
                mmTop = 1058
                mmWidth = 30163
                BandType = 5
                GroupNo = 2
              end
              object ppDBCalc27: TppDBCalc
                UserName = 'DBCalc27'
                DataField = 'SALDO_MES'
                DataPipeline = ppConsolidaMovResReal
                DisplayFormat = '#,0.0000;-#,0.0000'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                ResetGroup = ppGroup9
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppConsolidaMovResReal'
                mmHeight = 3175
                mmLeft = 251090
                mmTop = 1058
                mmWidth = 30163
                BandType = 5
                GroupNo = 2
              end
            end
          end
        end
      end
    end
    object ppGroup8: TppGroup
      BreakType = btCustomField
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand8: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = ppConsolidaMovResCotas
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppConsolidaMovResCotas'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppDBText29: TppDBText
          UserName = 'DBText29'
          DataField = 'PATROCINADORA'
          DataPipeline = ppConsolidaMovResCotas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppConsolidaMovResCotas'
          mmHeight = 3704
          mmLeft = 29898
          mmTop = 0
          mmWidth = 98425
          BandType = 3
          GroupNo = 0
        end
        object ppLabel52: TppLabel
          UserName = 'Label52'
          Caption = 'Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2910
          mmTop = 0
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object ppLabel79: TppLabel
          UserName = 'Label79'
          Caption = 'Plano :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 204259
          mmTop = 0
          mmWidth = 10583
          BandType = 3
          GroupNo = 1
        end
        object ppDBText73: TppDBText
          UserName = 'DBText73'
          DataField = 'PLANO'
          DataPipeline = ppConsolidaMovResCotas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppConsolidaMovResCotas'
          mmHeight = 3704
          mmLeft = 216959
          mmTop = 0
          mmWidth = 65617
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
    object ppGroup9: TppGroup
      BreakName = 'NOMEINDICE'
      DataPipeline = ppConsolidaMovResCotas
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group9'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppConsolidaMovResCotas'
      object ppGroupHeaderBand9: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8730
        mmPrintPosition = 0
        object ppShape4: TppShape
          UserName = 'Shape1'
          Brush.Color = 14680063
          ParentHeight = True
          Pen.Width = 2
          mmHeight = 8730
          mmLeft = 2910
          mmTop = 0
          mmWidth = 281253
          BandType = 3
          GroupNo = 2
        end
        object ppLabel82: TppLabel
          UserName = 'Label82'
          Caption = 'Reservas Calculadas em ('
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 10583
          mmTop = 1058
          mmWidth = 34925
          BandType = 3
          GroupNo = 2
        end
        object ppDBText78: TppDBText
          UserName = 'DBText78'
          AutoSize = True
          DataField = 'NOMEINDICE'
          DataPipeline = ppConsolidaMovResCotas
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppConsolidaMovResCotas'
          mmHeight = 3175
          mmLeft = 75142
          mmTop = 1058
          mmWidth = 17727
          BandType = 3
          GroupNo = 2
        end
        object ppLabel83: TppLabel
          UserName = 'Label83'
          Caption = ')'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 73025
          mmTop = 1058
          mmWidth = 1058
          BandType = 3
          GroupNo = 2
        end
        object ppDBText79: TppDBText
          UserName = 'DBText79'
          DataField = 'MOESIGLA'
          DataPipeline = ppConsolidaMovResCotas
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppConsolidaMovResCotas'
          mmHeight = 3440
          mmLeft = 54504
          mmTop = 1058
          mmWidth = 17198
          BandType = 3
          GroupNo = 2
        end
        object ppLabel60: TppLabel
          UserName = 'Label60'
          Caption = 'Valor :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 204259
          mmTop = 1058
          mmWidth = 8731
          BandType = 3
          GroupNo = 2
        end
        object ppDBText47: TppDBText
          UserName = 'DBText47'
          DataField = 'VALORINDICE'
          DataPipeline = ppConsolidaMovResCotas
          DisplayFormat = '#,0.0000;-#,0.0000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppConsolidaMovResCotas'
          mmHeight = 3440
          mmLeft = 216959
          mmTop = 1058
          mmWidth = 17463
          BandType = 3
          GroupNo = 2
        end
        object ppLabel78: TppLabel
          UserName = 'Label78'
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 10583
          mmTop = 4233
          mmWidth = 8996
          BandType = 3
          GroupNo = 2
        end
        object ppLabel53: TppLabel
          UserName = 'Label53'
          Caption = 'Reserva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 24342
          mmTop = 4233
          mmWidth = 10583
          BandType = 3
          GroupNo = 2
        end
        object ppLabel54: TppLabel
          UserName = 'Label54'
          Caption = 'Saldo Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 121179
          mmTop = 4233
          mmWidth = 17992
          BandType = 3
          GroupNo = 2
        end
        object ppLabel55: TppLabel
          UserName = 'Label55'
          Caption = 'Entradas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 163248
          mmTop = 4233
          mmWidth = 11377
          BandType = 3
          GroupNo = 2
        end
        object ppLabel56: TppLabel
          UserName = 'Label56'
          Caption = 'Pagto. Benefícios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 187855
          mmTop = 4233
          mmWidth = 22225
          BandType = 3
          GroupNo = 2
        end
        object ppLabel58: TppLabel
          UserName = 'Label58'
          Caption = 'Saldo Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 264584
          mmTop = 4233
          mmWidth = 14552
          BandType = 3
          GroupNo = 2
        end
        object ppLabel57: TppLabel
          UserName = 'Label57'
          Caption = 'Devoluções'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 229659
          mmTop = 4233
          mmWidth = 14817
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppShape11: TppShape
          UserName = 'Shape3'
          Brush.Color = 14680063
          Pen.Width = 2
          mmHeight = 5821
          mmLeft = 2910
          mmTop = 0
          mmWidth = 281253
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          DataField = 'ENTRADAS'
          DataPipeline = ppConsolidaMovResCotas
          DisplayFormat = '#,0.0000;-#,0.0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppConsolidaMovResCotas'
          mmHeight = 3175
          mmLeft = 144463
          mmTop = 1323
          mmWidth = 30163
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'BENEFICIOS'
          DataPipeline = ppConsolidaMovResCotas
          DisplayFormat = '#,0.0000;-#,0.0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppConsolidaMovResCotas'
          mmHeight = 3175
          mmLeft = 179917
          mmTop = 1323
          mmWidth = 30163
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'SALDOANTERIOR'
          DataPipeline = ppConsolidaMovResCotas
          DisplayFormat = '#,0.0000;-#,0.0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppConsolidaMovResCotas'
          mmHeight = 3175
          mmLeft = 109009
          mmTop = 1323
          mmWidth = 30163
          BandType = 5
          GroupNo = 2
        end
        object ppLabel59: TppLabel
          UserName = 'Label59'
          AutoSize = False
          Caption = 'Total das Reservas Calculadas em  ( '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 10583
          mmTop = 1323
          mmWidth = 53446
          BandType = 5
          GroupNo = 2
        end
        object ppDBText80: TppDBText
          UserName = 'DBText80'
          DataField = 'MOESIGLA'
          DataPipeline = ppConsolidaMovResCotas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppConsolidaMovResCotas'
          mmHeight = 3440
          mmLeft = 64823
          mmTop = 1323
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppLabel84: TppLabel
          UserName = 'Label84'
          Caption = ')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 83344
          mmTop = 1323
          mmWidth = 1058
          BandType = 5
          GroupNo = 2
        end
        object ppDBText81: TppDBText
          UserName = 'DBText81'
          AutoSize = True
          DataField = 'NOMEINDICE'
          DataPipeline = ppConsolidaMovResCotas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppConsolidaMovResCotas'
          mmHeight = 3175
          mmLeft = 85461
          mmTop = 1323
          mmWidth = 17727
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc16'
          DataField = 'DEVOLUCOES'
          DataPipeline = ppConsolidaMovResCotas
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppConsolidaMovResCotas'
          mmHeight = 3175
          mmLeft = 214313
          mmTop = 1323
          mmWidth = 30163
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'DBCalc17'
          DataField = 'SALDO_MES'
          DataPipeline = ppConsolidaMovResCotas
          DisplayFormat = '#,0.0000;-#,0.0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppConsolidaMovResCotas'
          mmHeight = 3175
          mmLeft = 248973
          mmTop = 1323
          mmWidth = 30163
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object ppConsolidaMovResReal: TppBDEPipeline
    DataSource = dsConsolidaMovResReal
    CloseDataSource = True
    UserName = 'ConsolidaMovResReal'
    Left = 499
    Top = 212
  end
  object dsConsolidaMovResReal: TwwDataSource
    DataSet = qryConsolidaMovResReal
    Left = 500
    Top = 198
  end
  object qryConsolidaMovResReal: TwwQuery
    CachedUpdates = True
    AfterOpen = qryConsolidaMovResRealAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PAT.NOME PATROCINADORA,'
      '       PL.NOME AS PLANO,'
      '       RP.CODHIERARQUIA,'
      '       RP.NOME AS NOMERESERVA,'
      '       PLP.IDPESSJUR,'
      '       PLP.IDPLANOPREV,'
      '       RP.IDTIPORESERVA,'
      '       M.MOESIGLA,'
      '       M.MOEDESC AS NOMEINDICE,'
      '       :ANOMESREFERENCIA AS MESANOREFERENCIA,'
      '       0 PLNPLANIL ,'
      '       0 AS VALORINDICE,'
      '       0 AS SALDOANTERIOR,'
      '       0 AS ENTRADAS,'
      '       0 AS BENEFICIOS,'
      '       0 AS DEVOLUCOES,'
      '       0 AS SALDO_MES'
      
        'FROM   RESERVAXPLANO RP, PESSOA PAT, PLANPREV PL, PLANPREVPATRO ' +
        'PLP, MOEDA M'
      'WHERE  PLP.IDPESSJUR   = :IDPESSJUR'
      'AND    PLP.IDPLANOPREV = :IDPLANOPREV'
      'AND    PL.IDPLANOPREV  = PLP.IDPLANOPREV'
      'AND    PAT.IDPESSOA    = PLP.IDPESSJUR'
      'AND    RP.IDPLANOPREV  = PLP.IDPLANOPREV'
      'AND    RP.ANALITICOSINTETI = '#39'A'#39
      'AND    M.MOECODIGO(+) = RP.INDICEREAJUSTE'
      'ORDER BY PAT.NOME, PL.NOME, m.moecodigo,RP.CODHIERARQUIA'
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updConsolidaMovResReal
    ValidateWithMask = True
    Left = 498
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'ANOMESREFERENCIA'
        ParamType = ptUnknown
        Value = '2002/04'
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = '7'
      end>
  end
  object updConsolidaMovResCotas: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 346
    Top = 249
  end
  object updConsolidaMovResReal: TUpdateSQL
    Left = 504
    Top = 261
  end
  object updGerencial3: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 91
    Top = 270
  end
  object updGerencial2: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 22
    Top = 267
  end
  object updGerencial4: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 169
    Top = 267
  end
  object ppDbeRelatorioEtiqueta: TppBDEPipeline
    DataSource = dsRelatorioEtiqueta
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'DbeRelatorioEtiqueta'
    Left = 291
    Top = 374
  end
  object qryRelatorioEtiqueta: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 202
    Top = 368
  end
  object dsRelatorioEtiqueta: TwwDataSource
    DataSet = qryRelatorioEtiqueta
    Left = 244
    Top = 368
  end
  object ppRelatorioEtiqueta: TppReport
    AutoStop = False
    Columns = 3
    DataPipeline = ppDbeRelatorioEtiqueta
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Emissão de Etiquetas'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 4350
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
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 360
    Top = 376
    Version = '7.04'
    mmColumnWidth = 94766
    DataPipelineName = 'ppDbeRelatorioEtiqueta'
    object rpEtiquetasColHdrBnd: TppColumnHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetalheRelatorioEtiqueta: TppDetailBand
      ColumnTraversal = ctLeftToRight
      mmBottomOffset = 0
      mmHeight = 20638
      mmPrintPosition = 0
      object rpEtiquetasDBText1: TppDBText
        UserName = 'rpEtiquetasDBText1'
        DataField = 'LOGRADOURO'
        DataPipeline = ppDbeRelatorioEtiqueta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDbeRelatorioEtiqueta'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 4233
        mmWidth = 60854
        BandType = 4
      end
      object rpEtiquetasDBText2: TppDBText
        UserName = 'rpEtiquetasDBText2'
        DataField = 'BAIRRO'
        DataPipeline = ppDbeRelatorioEtiqueta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDbeRelatorioEtiqueta'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 8202
        mmWidth = 60854
        BandType = 4
      end
      object rpEtiquetasDBText3: TppDBText
        UserName = 'rpEtiquetasDBText3'
        DataField = 'CEP'
        DataPipeline = ppDbeRelatorioEtiqueta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDbeRelatorioEtiqueta'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 12435
        mmWidth = 15000
        BandType = 4
      end
      object rpEtiquetasDBCampo3: TppDBText
        UserName = 'rpEtiquetasDBCampo3'
        DataField = 'NUP'
        DataPipeline = ppDbeRelatorioEtiqueta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDbeRelatorioEtiqueta'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 16404
        mmWidth = 30692
        BandType = 4
      end
      object rpEtiquetasDBText5: TppDBText
        UserName = 'rpEtiquetasDBText5'
        DataField = 'CIDADE'
        DataPipeline = ppDbeRelatorioEtiqueta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDbeRelatorioEtiqueta'
        mmHeight = 3704
        mmLeft = 15875
        mmTop = 12435
        mmWidth = 39952
        BandType = 4
      end
      object rpEtiquetasDBText6: TppDBText
        UserName = 'rpEtiquetasDBText6'
        DataField = 'CODESTADO'
        DataPipeline = ppDbeRelatorioEtiqueta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDbeRelatorioEtiqueta'
        mmHeight = 3704
        mmLeft = 56621
        mmTop = 12435
        mmWidth = 4233
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'DBText42'
        DataField = 'NOME'
        DataPipeline = ppDbeRelatorioEtiqueta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDbeRelatorioEtiqueta'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 60854
        BandType = 4
      end
      object rpEtiquetaslblFuncao: TppLabel
        UserName = 'rpEtiquetaslblFuncao'
        Caption = 'Na função de "A mesma"'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 61648
        mmTop = 4233
        mmWidth = 39423
        BandType = 4
      end
      object ppDBText77: TppDBText
        UserName = 'DBText77'
        DataField = 'CE'
        DataPipeline = ppDbeRelatorioEtiqueta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDbeRelatorioEtiqueta'
        mmHeight = 3704
        mmLeft = 32808
        mmTop = 16669
        mmWidth = 28046
        BandType = 4
      end
    end
    object rpEtiquetasColFootBnd: TppColumnFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpEtiquetasSmryBnd: TppSummaryBand
      Visible = False
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
    end
  end
  object CmpRptCM: TCmParamReport
    Caption = 'Aprovação de Documentos - Modelo 2'
    Params = <
      item
        Caption = 'Doc'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Centro Responsabilidade'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Data Inclusao'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Status do Documento'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end>
    ExibeMensagem = True
    Formheight = 433
    FormWidth = 525
    HelpContext = 0
    Left = 852
    Top = 56
  end
  object DevRptCM: TExtraOptions
    About = 'TExtraDevices 3.00'
    HTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    HTML.BackLink = '&lt&lt'
    HTML.ForwardLink = '&gt&gt'
    HTML.ShowLinks = True
    HTML.UseTextFileName = False
    HTML.ZoomableImages = False
    HTML.Visible = True
    HTML.PixelFormat = pf8bit
    HTML.SingleFileOutput = False
    XHTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    XHTML.BackLink = '&lt&lt'
    XHTML.ForwardLink = '&gt&gt'
    XHTML.ShowLinks = True
    XHTML.UseTextFileName = False
    XHTML.ZoomableImages = False
    XHTML.Visible = True
    XHTML.PixelFormat = pf8bit
    XHTML.SingleFileOutput = False
    RTF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    RTF.Visible = True
    RTF.RichTextAsImage = False
    RTF.UseTextBox = True
    RTF.PixelFormat = pf8bit
    RTF.PixelsPerInch = 96
    Lotus.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Lotus.Visible = True
    Lotus.ColSpacing = 16934
    Quattro.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Quattro.Visible = True
    Quattro.ColSpacing = 16934
    Excel.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Excel.Visible = True
    Excel.ColSpacing = 16934
    Excel.RowSizing = False
    Excel.AutoConvertToNumber = False
    Graphic.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Graphic.PixelFormat = pf8bit
    Graphic.UseTextFileName = False
    Graphic.Visible = True
    Graphic.PixelsPerInch = 96
    Graphic.GrayScale = False
    PDF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    PDF.Creator = 'Cm Soluções Informática LTDA'
    PDF.Title = 'Relatório CM'
    PDF.Author = 'Cm Soluções Informática LTDA'
    PDF.FastCompression = False
    PDF.CompressImages = True
    PDF.ScaleImages = True
    PDF.Visible = True
    PDF.RichTextAsImage = False
    PDF.RichEditPixelFormat = pf1bit
    PDF.PixelFormat = pf24bit
    PDF.PixelsPerInch = 96
    PDF.Permissions = [ppPrint, ppModify, ppCopy, ppModifyAnnot]
    PDF.ViewerPreferences = []
    PDF.AutoEmbedFonts = True
    PDF.ImageFormat = riBitmap
    DotMatrix.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    DotMatrix.Visible = True
    DotMatrix.CharsPerInch = cs10CPI
    DotMatrix.LinesPerInch = ls6LPI
    DotMatrix.Port = 'LPT1'
    DotMatrix.ContinousPaper = False
    DotMatrix.PrinterType = ptEpson
    Left = 1024
    Top = 72
  end
  object CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    IdUsuario = 0
    IdModulo = 0
    DeviceType = rdtScreen
    ShowPrintDialog = True
    ShowCancelDialog = True
    Report = rptautpagdoc
    ConnectionType = cntADO
    Left = 712
    Top = 56
  end
  object Dsautpagdoc: TwwDataSource
    DataSet = CdsDemGestAutPag
    Left = 1026
    Top = 120
  end
  object Ppautpagdoc: TppBDEPipeline
    DataSource = Dsautpagdoc
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'Ppautpagdoc'
    Left = 1116
    Top = 64
    object PpautpagdocppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMFATURA'
      FieldName = 'NUMFATURA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object PpautpagdocppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object PpautpagdocppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMAPGR'
      FieldName = 'NUMAPGR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object PpautpagdocppField4: TppField
      FieldAlias = 'REFERENCIA'
      FieldName = 'REFERENCIA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object PpautpagdocppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object PpautpagdocppField6: TppField
      FieldAlias = 'COMPLDOCUMENTO'
      FieldName = 'COMPLDOCUMENTO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 5
    end
    object PpautpagdocppField7: TppField
      FieldAlias = 'DATAVENCTO'
      FieldName = 'DATAVENCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object PpautpagdocppField8: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 7
    end
    object PpautpagdocppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object PpautpagdocppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOROUTRAMOEDA'
      FieldName = 'VALOROUTRAMOEDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object PpautpagdocppField11: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 10
    end
    object PpautpagdocppField12: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 11
    end
    object PpautpagdocppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRATEIO'
      FieldName = 'VALORRATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object PpautpagdocppField14: TppField
      FieldAlias = 'DESCTDR'
      FieldName = 'DESCTDR'
      FieldLength = 35
      DisplayWidth = 35
      Position = 13
    end
    object PpautpagdocppField15: TppField
      FieldAlias = 'NOMEAP'
      FieldName = 'NOMEAP'
      FieldLength = 25
      DisplayWidth = 25
      Position = 14
    end
    object PpautpagdocppField16: TppField
      FieldAlias = 'NOMECR'
      FieldName = 'NOMECR'
      FieldLength = 30
      DisplayWidth = 30
      Position = 15
    end
    object PpautpagdocppField17: TppField
      FieldAlias = 'NOMECC'
      FieldName = 'NOMECC'
      FieldLength = 30
      DisplayWidth = 30
      Position = 16
    end
    object PpautpagdocppField18: TppField
      FieldAlias = 'OBS'
      FieldName = 'OBS'
      FieldLength = 1000
      DataType = dtMemo
      DisplayWidth = 10
      Position = 17
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField19: TppField
      FieldAlias = 'NUMBANCO'
      FieldName = 'NUMBANCO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 18
    end
    object PpautpagdocppField20: TppField
      FieldAlias = 'NUMAGENCIA'
      FieldName = 'NUMAGENCIA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 19
    end
    object PpautpagdocppField21: TppField
      FieldAlias = 'CONTACORRENTE'
      FieldName = 'CONTACORRENTE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 20
    end
    object PpautpagdocppField22: TppField
      FieldAlias = 'FLGDOCBANCARIO'
      FieldName = 'FLGDOCBANCARIO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 21
    end
    object PpautpagdocppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLACRE'
      FieldName = 'VLACRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object PpautpagdocppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLDEC'
      FieldName = 'VLDEC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object PpautpagdocppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLIMP'
      FieldName = 'VLIMP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object PpautpagdocppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLLIQ'
      FieldName = 'VLLIQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object PpautpagdocppField27: TppField
      FieldAlias = 'TRGUSERINCLUSAO'
      FieldName = 'TRGUSERINCLUSAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 26
    end
    object PpautpagdocppField28: TppField
      FieldAlias = 'NOMEUSUARIO'
      FieldName = 'NOMEUSUARIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 27
    end
    object PpautpagdocppField29: TppField
      FieldAlias = 'TRGDTINCLUSAO'
      FieldName = 'TRGDTINCLUSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 28
    end
    object PpautpagdocppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTVALORBRUTO'
      FieldName = 'TOTVALORBRUTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object PpautpagdocppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTVALORDEDUCOES'
      FieldName = 'TOTVALORDEDUCOES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object PpautpagdocppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTVALORACRESCIMO'
      FieldName = 'TOTVALORACRESCIMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object PpautpagdocppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTVALORIMPOSTO'
      FieldName = 'TOTVALORIMPOSTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object PpautpagdocppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTVALORAPAGAR'
      FieldName = 'TOTVALORAPAGAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object PpautpagdocppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMVALORBRUTO'
      FieldName = 'SUMVALORBRUTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object PpautpagdocppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMVALORDEDUCOES'
      FieldName = 'SUMVALORDEDUCOES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object PpautpagdocppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMVALORACRESCIMO'
      FieldName = 'SUMVALORACRESCIMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object PpautpagdocppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMVALORIMPOSTO'
      FieldName = 'SUMVALORIMPOSTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 37
    end
    object PpautpagdocppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMVALORAPAGAR'
      FieldName = 'SUMVALORAPAGAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object PpautpagdocppField40: TppField
      FieldAlias = 'NUMIMOVEL'
      FieldName = 'NUMIMOVEL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 39
    end
    object PpautpagdocppField41: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 40
    end
    object PpautpagdocppField42: TppField
      FieldAlias = 'DESCPLANO'
      FieldName = 'DESCPLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 41
    end
    object PpautpagdocppField43: TppField
      FieldAlias = 'DESCPROGRAMA'
      FieldName = 'DESCPROGRAMA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 42
    end
    object PpautpagdocppField44: TppField
      FieldAlias = 'DATAEMISSAO'
      FieldName = 'DATAEMISSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 43
    end
    object PpautpagdocppField45: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 44
    end
    object PpautpagdocppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFORCLI'
      FieldName = 'IDFORCLI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object PpautpagdocppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOLANCTOLIQ'
      FieldName = 'VALOLANCTOLIQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 46
    end
    object PpautpagdocppField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMVALOLANCTOLIQ'
      FieldName = 'SUMVALOLANCTOLIQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 47
    end
    object PpautpagdocppField49: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 48
    end
    object ppPpautpagdocppField50: TppField
      FieldAlias = 'CODDOSSIE'
      FieldName = 'CODDOSSIE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 49
    end
  end
  object rptautpagdoc: TppReport
    AutoStop = False
    DataPipeline = Ppautpagdoc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RptSlip'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 15000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = CrmRptCMBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 1118
    Top = 120
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'Ppautpagdoc'
    object ppHeaderBand12: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object ppLabel71: TppLabel
        UserName = 'ppLabel51'
        Caption = 'FUNCEF - Fundação dos Economiários Federais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 33338
        mmTop = 1058
        mmWidth = 122238
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'ppLabel53'
        Caption = 'AVISO DE RECEBIMENTO - AR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4995
        mmLeft = 63953
        mmTop = 7938
        mmWidth = 61807
        BandType = 0
      end
    end
    object ppDetailBand16: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText87: TppDBText
        UserName = 'ppDBText28'
        DataField = 'NOMEAP'
        DataPipeline = Ppautpagdoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Ppautpagdoc'
        mmHeight = 3704
        mmLeft = 265
        mmTop = 0
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText88: TppDBText
        UserName = 'ppDBText61'
        DataField = 'NOMECC'
        DataPipeline = Ppautpagdoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Ppautpagdoc'
        mmHeight = 3704
        mmLeft = 25929
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText89: TppDBText
        UserName = 'ppDBText62'
        DataField = 'DESCTDR'
        DataPipeline = Ppautpagdoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Ppautpagdoc'
        mmHeight = 3704
        mmLeft = 48948
        mmTop = 0
        mmWidth = 28310
        BandType = 4
      end
      object ppDBText90: TppDBText
        UserName = 'ppDBText76'
        DataField = 'VALORRATEIO'
        DataPipeline = Ppautpagdoc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'Ppautpagdoc'
        mmHeight = 3175
        mmLeft = 172509
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText91: TppDBText
        UserName = 'ppDBText77'
        DataField = 'DESCPLANO'
        DataPipeline = Ppautpagdoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Ppautpagdoc'
        mmHeight = 3704
        mmLeft = 79111
        mmTop = 0
        mmWidth = 43392
        BandType = 4
      end
      object ppDBText92: TppDBText
        UserName = 'ppDBText78'
        DataField = 'NOMEPATRO'
        DataPipeline = Ppautpagdoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Ppautpagdoc'
        mmHeight = 3704
        mmLeft = 124090
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText93: TppDBText
        UserName = 'ppDBText79'
        DataField = 'DESCPROGRAMA'
        DataPipeline = Ppautpagdoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Ppautpagdoc'
        mmHeight = 3704
        mmLeft = 147638
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
    end
    object ppFooterBand11: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppLabel75: TppLabel
        UserName = 'ppLabel54'
        Caption = 'Contas a Receber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 0
        mmTop = 3704
        mmWidth = 23876
        BandType = 8
      end
      object ppCalc21: TppSystemVariable
        UserName = 'Calc21'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 85725
        mmTop = 3969
        mmWidth = 18785
        BandType = 8
      end
      object ppCalc22: TppSystemVariable
        UserName = 'Calc22'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 164042
        mmTop = 3969
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup11: TppGroup
      BreakName = 'CODDOCUMENTO'
      DataPipeline = Ppautpagdoc
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'Ppautpagdoc'
      object ppGroupHeaderBand11: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 42069
        mmPrintPosition = 0
        object ppLine27: TppLine
          UserName = 'ppLine27'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 265
          mmTop = 10583
          mmWidth = 190236
          BandType = 3
          GroupNo = 0
        end
        object ppLine30: TppLine
          UserName = 'ppLine30'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 74083
          mmTop = 1588
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
        object ppLine31: TppLine
          UserName = 'ppLine31'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 125942
          mmTop = 1588
          mmWidth = 265
          BandType = 3
          GroupNo = 0
        end
        object ppLine32: TppLine
          UserName = 'ppLine32'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 189971
          mmTop = 1588
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine33: TppLine
          UserName = 'ppLine33'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 151342
          mmTop = 1588
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
        object ppLabel81: TppLabel
          UserName = 'ppLabel55'
          Caption = 'Nº da AR  / Centro Responsabilidade'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4106
          mmLeft = 1058
          mmTop = 1852
          mmWidth = 55499
          BandType = 3
          GroupNo = 0
        end
        object ppLabel89: TppLabel
          UserName = 'ppLabel56'
          Caption = 'Processo Nº'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 74877
          mmTop = 2117
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel90: TppLabel
          UserName = 'ppLabel72'
          Caption = 'Vencimento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 126736
          mmTop = 2117
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel91: TppLabel
          UserName = 'ppLabel80'
          AutoSize = False
          Caption = 'Documento            Compl.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4498
          mmLeft = 152136
          mmTop = 1588
          mmWidth = 37571
          BandType = 3
          GroupNo = 0
        end
        object ppDBText94: TppDBText
          UserName = 'ppDBText80'
          DataField = 'NUMAPGR'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 1058
          mmTop = 6350
          mmWidth = 21696
          BandType = 3
          GroupNo = 0
        end
        object ppDBText95: TppDBText
          UserName = 'ppDBText81'
          DataField = 'NOMECR'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 23813
          mmTop = 6350
          mmWidth = 49742
          BandType = 3
          GroupNo = 0
        end
        object ppDBText96: TppDBText
          UserName = 'ppDBText82'
          DataField = 'REFERENCIA'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 74877
          mmTop = 6350
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppDBText97: TppDBText
          UserName = 'ppDBText88'
          DataField = 'DATAPROGRAMADA'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 126471
          mmTop = 6350
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppDBText98: TppDBText
          UserName = 'ppDBText89'
          DataField = 'COMPLDOCUMENTO'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 179652
          mmTop = 6350
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppDBText99: TppDBText
          UserName = 'ppDBText90'
          DataField = 'NODOCUMENTO'
          DataPipeline = Ppautpagdoc
          DisplayFormat = '#0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 152136
          mmTop = 6350
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object ppLine34: TppLine
          UserName = 'ppLine34'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 265
          mmTop = 1588
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
        object ppLabel92: TppLabel
          UserName = 'ppLabel81'
          Caption = 'Cliente / Nome / Razão Social'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4106
          mmLeft = 1323
          mmTop = 11642
          mmWidth = 44323
          BandType = 3
          GroupNo = 0
        end
        object ppLine35: TppLine
          UserName = 'ppLine35'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 11906
          mmLeft = 265
          mmTop = 11906
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine36: TppLine
          UserName = 'ppLine36'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 11906
          mmLeft = 151342
          mmTop = 11906
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
        object ppLine37: TppLine
          UserName = 'ppLine37'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 265
          mmTop = 23813
          mmWidth = 190236
          BandType = 3
          GroupNo = 0
        end
        object ppDBText100: TppDBText
          UserName = 'ppDBText91'
          DataField = 'RAZAOSOCIAL'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 19579
          mmWidth = 148696
          BandType = 3
          GroupNo = 0
        end
        object ppDBText101: TppDBText
          UserName = 'ppDBText92'
          DataField = 'NUMDOCUMENTO'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 152665
          mmTop = 19579
          mmWidth = 36777
          BandType = 3
          GroupNo = 0
        end
        object ppLine38: TppLine
          UserName = 'ppLine38'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 11906
          mmLeft = 189971
          mmTop = 11906
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLabel93: TppLabel
          UserName = 'ppLabel83'
          Caption = 'CPF/CGC'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 152665
          mmTop = 11642
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object ppLabel94: TppLabel
          UserName = 'ppLabel86'
          Caption = 'Valor Bruto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 16933
          mmTop = 26988
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel105: TppLabel
          UserName = 'ppLabel105'
          Caption = 'Deduções'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 60590
          mmTop = 26458
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel106: TppLabel
          UserName = 'ppLabel106'
          Caption = 'Acréscimo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 99484
          mmTop = 26458
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel110: TppLabel
          UserName = 'ppLabel110'
          AutoSize = False
          Caption = 'Valor Líquido a Receber'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 152400
          mmTop = 26458
          mmWidth = 35719
          BandType = 3
          GroupNo = 0
        end
        object ppLine39: TppLine
          UserName = 'ppLine39'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 265
          mmTop = 35454
          mmWidth = 190236
          BandType = 3
          GroupNo = 0
        end
        object ppLine40: TppLine
          UserName = 'ppLine40'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9525
          mmLeft = 265
          mmTop = 25400
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine41: TppLine
          UserName = 'ppLine41'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9525
          mmLeft = 189971
          mmTop = 25400
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine43: TppLine
          UserName = 'ppLine43'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9525
          mmLeft = 115623
          mmTop = 25400
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine44: TppLine
          UserName = 'ppLine44'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9525
          mmLeft = 75142
          mmTop = 25400
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine45: TppLine
          UserName = 'ppLine45'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9525
          mmLeft = 35190
          mmTop = 25400
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
        object ppLabel111: TppLabel
          UserName = 'ppLabel111'
          Caption = 'Atividade / Projeto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 265
          mmTop = 38365
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object ppLabel112: TppLabel
          UserName = 'ppLabel112'
          Caption = 'Centro de Custo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 25929
          mmTop = 38365
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object ppLabel113: TppLabel
          UserName = 'ppLabel113'
          Caption = 'Tipo de Recebimento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3344
          mmLeft = 48948
          mmTop = 38365
          mmWidth = 25654
          BandType = 3
          GroupNo = 0
        end
        object ppLabel114: TppLabel
          UserName = 'ppLabel114'
          Caption = 'Rateio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3344
          mmLeft = 172509
          mmTop = 38365
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppDBText102: TppDBText
          UserName = 'ppDBText93'
          DataField = 'VLLIQ'
          DataPipeline = Ppautpagdoc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 154517
          mmTop = 30956
          mmWidth = 34660
          BandType = 3
          GroupNo = 0
        end
        object ppDBText103: TppDBText
          UserName = 'ppDBText98'
          DataField = 'VLACRE'
          DataPipeline = Ppautpagdoc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 76200
          mmTop = 30956
          mmWidth = 38894
          BandType = 3
          GroupNo = 0
        end
        object ppDBText104: TppDBText
          UserName = 'ppDBText99'
          DataField = 'VLDEC'
          DataPipeline = Ppautpagdoc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 36513
          mmTop = 30956
          mmWidth = 37835
          BandType = 3
          GroupNo = 0
        end
        object ppDBText105: TppDBText
          UserName = 'ppDBText100'
          DataField = 'VALOR'
          DataPipeline = Ppautpagdoc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 1058
          mmTop = 30956
          mmWidth = 33602
          BandType = 3
          GroupNo = 0
        end
        object ppLabel115: TppLabel
          UserName = 'ppLabel115'
          Caption = 'Plano'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 79111
          mmTop = 38365
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object ppLabel116: TppLabel
          UserName = 'ppLabel116'
          Caption = 'Patro'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 124090
          mmTop = 38365
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLabel117: TppLabel
          UserName = 'ppLabel117'
          Caption = 'Programa'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 147638
          mmTop = 38365
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppLine17: TppLine
          UserName = 'Line3'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 101071
          mmTop = 1588
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
        object ppLabel95: TppLabel
          UserName = 'Label4'
          Caption = 'Lançamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4106
          mmLeft = 101600
          mmTop = 2117
          mmWidth = 18711
          BandType = 3
          GroupNo = 0
        end
        object ppDBText106: TppDBText
          UserName = 'DBText3'
          DataField = 'DATALANCTO'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 101600
          mmTop = 6350
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand11: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 171186
        mmPrintPosition = 0
        object ppRegion2: TppRegion
          UserName = 'ppRegion2'
          Brush.Style = bsClear
          Caption = 'ppRegion2'
          Pen.Style = psClear
          Stretch = True
          Transparent = True
          mmHeight = 16933
          mmLeft = 0
          mmTop = 0
          mmWidth = 189971
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel130: TppLabel
            UserName = 'ppLabel130'
            Caption = 'Observação:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Times New Roman'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3969
            mmLeft = 794
            mmTop = 12171
            mmWidth = 17727
            BandType = 5
            GroupNo = 0
          end
          object ppDBMemo1: TppDBMemo
            UserName = 'ppDBMemo1'
            CharWrap = True
            DataField = 'OBS'
            DataPipeline = Ppautpagdoc
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Times New Roman'
            Font.Size = 9
            Font.Style = []
            Stretch = True
            Transparent = True
            DataPipelineName = 'Ppautpagdoc'
            mmHeight = 3969
            mmLeft = 21696
            mmTop = 12171
            mmWidth = 166423
            BandType = 5
            GroupNo = 0
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmLeading = 0
          end
        end
        object ppRegion4: TppRegion
          UserName = 'ppRegion4'
          Caption = 'ppRegion4'
          Pen.Color = clWhite
          ShiftRelativeTo = ppRegion2
          Stretch = True
          mmHeight = 15875
          mmLeft = 0
          mmTop = 16140
          mmWidth = 189971
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel131: TppLabel
            UserName = 'ppLabel131'
            Caption = 'Forma de Recebimento:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Times New Roman'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4106
            mmLeft = 794
            mmTop = 26723
            mmWidth = 36068
            BandType = 5
            GroupNo = 0
          end
          object ppDBText107: TppDBText
            UserName = 'ppDBText102'
            DataField = 'DESCRICAO'
            DataPipeline = Ppautpagdoc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 9
            Font.Style = []
            Transparent = True
            DataPipelineName = 'Ppautpagdoc'
            mmHeight = 3969
            mmLeft = 39688
            mmTop = 26723
            mmWidth = 148432
            BandType = 5
            GroupNo = 0
          end
        end
        object ppRegion5: TppRegion
          UserName = 'ppRegion5'
          Brush.Style = bsClear
          Caption = 'ppRegion5'
          Pen.Style = psClear
          ShiftRelativeTo = ppRegion4
          Stretch = True
          Transparent = True
          mmHeight = 1852
          mmLeft = 0
          mmTop = 31221
          mmWidth = 189971
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
        end
        object ppRegion1: TppRegion
          UserName = 'ppRegion1'
          Brush.Style = bsClear
          Caption = 'ppRegion1'
          Pen.Color = clWhite
          ShiftRelativeTo = ppRegion5
          Stretch = True
          Transparent = True
          mmHeight = 130440
          mmLeft = 1588
          mmTop = 52388
          mmWidth = 189971
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel118: TppLabel
            UserName = 'ppLabel118'
            Caption = 'Uso da Tesouraria.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4191
            mmLeft = 122502
            mmTop = 56621
            mmWidth = 31411
            BandType = 5
            GroupNo = 0
          end
          object ppLine46: TppLine
            UserName = 'ppLine46'
            Weight = 0.75
            mmHeight = 1323
            mmLeft = 2117
            mmTop = 56621
            mmWidth = 86254
            BandType = 5
            GroupNo = 0
          end
          object ppLabel120: TppLabel
            UserName = 'ppLabel120'
            Caption = 'Data'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 2910
            mmTop = 100807
            mmWidth = 7673
            BandType = 5
            GroupNo = 0
          end
          object ppLine47: TppLine
            UserName = 'ppLine47'
            Weight = 0.75
            mmHeight = 1323
            mmLeft = 104511
            mmTop = 56621
            mmWidth = 86254
            BandType = 5
            GroupNo = 0
          end
          object ppLine48: TppLine
            UserName = 'ppLine48'
            ParentWidth = True
            Weight = 0.75
            mmHeight = 1588
            mmLeft = 1588
            mmTop = 56621
            mmWidth = 189971
            BandType = 5
            GroupNo = 0
          end
          object ppLabel129: TppLabel
            UserName = 'ppLabel129'
            Caption = 'Ass. / Carimbo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 4233
            mmLeft = 105040
            mmTop = 113506
            mmWidth = 78052
            BandType = 5
            GroupNo = 0
          end
          object ppLabel96: TppLabel
            UserName = 'Label12'
            Caption = 'Nº da Baixa:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 105040
            mmTop = 67205
            mmWidth = 20373
            BandType = 5
            GroupNo = 0
          end
          object ppLine19: TppLine
            UserName = 'ppLine501'
            Weight = 0.75
            mmHeight = 2381
            mmLeft = 125413
            mmTop = 70380
            mmWidth = 48154
            BandType = 5
            GroupNo = 0
          end
          object ppLabel97: TppLabel
            UserName = 'Label13'
            Caption = 'Data de Baixa : _______/_______/_______'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 105040
            mmTop = 80169
            mmWidth = 69056
            BandType = 5
            GroupNo = 0
          end
          object ppLabel98: TppLabel
            UserName = 'Label17'
            Caption = 'Baixado por:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 105040
            mmTop = 96309
            mmWidth = 21431
            BandType = 5
            GroupNo = 0
          end
          object ppCalc29: TppSystemVariable
            UserName = 'Calc29'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 4233
            mmLeft = 11378
            mmTop = 100807
            mmWidth = 16933
            BandType = 5
            GroupNo = 0
          end
          object ppLabel125: TppLabel
            UserName = 'ppLabel125'
            Caption = 'Ass. / Carimbo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 4233
            mmLeft = 2910
            mmTop = 81227
            mmWidth = 78052
            BandType = 5
            GroupNo = 0
          end
          object ppLabel127: TppLabel
            UserName = 'ppLabel127'
            Caption = 'Feito Por:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 2910
            mmTop = 67205
            mmWidth = 16404
            BandType = 5
            GroupNo = 0
          end
          object ppDBText108: TppDBText
            UserName = 'ppDBText101'
            AutoSize = True
            DataField = 'NOMEUSUARIO'
            DataPipeline = Ppautpagdoc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = []
            Transparent = True
            DataPipelineName = 'Ppautpagdoc'
            mmHeight = 3969
            mmLeft = 19844
            mmTop = 67205
            mmWidth = 26458
            BandType = 5
            GroupNo = 0
          end
          object ppLabel99: TppLabel
            UserName = 'Label18'
            Caption = 'Assinatura do gestor da Receita:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 2910
            mmTop = 96309
            mmWidth = 54769
            BandType = 5
            GroupNo = 0
          end
          object ppLabel100: TppLabel
            UserName = 'Label19'
            Caption = 'Ass. / Carimbo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 4233
            mmLeft = 2910
            mmTop = 113506
            mmWidth = 78052
            BandType = 5
            GroupNo = 0
          end
          object ppLine20: TppLine
            UserName = 'Line5'
            Weight = 0.75
            mmHeight = 2381
            mmLeft = 105040
            mmTop = 112977
            mmWidth = 78052
            BandType = 5
            GroupNo = 0
          end
          object ppLine21: TppLine
            UserName = 'Line6'
            Weight = 0.75
            mmHeight = 2381
            mmLeft = 2910
            mmTop = 112977
            mmWidth = 78052
            BandType = 5
            GroupNo = 0
          end
          object ppLine22: TppLine
            UserName = 'Line7'
            Weight = 0.75
            mmHeight = 2381
            mmLeft = 2910
            mmTop = 80698
            mmWidth = 78052
            BandType = 5
            GroupNo = 0
          end
        end
      end
    end
    object ppGroup12: TppGroup
      BreakName = 'CODDOCUMENTO'
      DataPipeline = Ppautpagdoc
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'Ppautpagdoc'
      object ppGroupHeaderBand12: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand12: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
      end
    end
    object ppGroup14: TppGroup
      BreakName = 'CODDOCUMENTO'
      DataPipeline = Ppautpagdoc
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'Ppautpagdoc'
      object ppGroupHeaderBand14: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand14: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object CdsDemGestAutPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspGestAutPag'
    Left = 712
    Top = 104
    object CdsDemGestAutPagNUMFATURA: TFloatField
      FieldName = 'NUMFATURA'
    end
    object CdsDemGestAutPagCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object CdsDemGestAutPagNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
    end
    object CdsDemGestAutPagREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 30
    end
    object CdsDemGestAutPagNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object CdsDemGestAutPagCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object CdsDemGestAutPagDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object CdsDemGestAutPagNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object CdsDemGestAutPagVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CdsDemGestAutPagVALOROUTRAMOEDA: TFloatField
      FieldName = 'VALOROUTRAMOEDA'
    end
    object CdsDemGestAutPagRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object CdsDemGestAutPagDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object CdsDemGestAutPagVALORRATEIO: TFloatField
      FieldName = 'VALORRATEIO'
    end
    object CdsDemGestAutPagDESCTDR: TStringField
      FieldName = 'DESCTDR'
      Size = 35
    end
    object CdsDemGestAutPagNOMEAP: TStringField
      FieldName = 'NOMEAP'
      Size = 25
    end
    object CdsDemGestAutPagNOMECR: TStringField
      FieldName = 'NOMECR'
      FixedChar = True
      Size = 30
    end
    object CdsDemGestAutPagNOMECC: TStringField
      FieldName = 'NOMECC'
      Size = 30
    end
    object CdsDemGestAutPagOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1000
    end
    object CdsDemGestAutPagNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      FixedChar = True
      Size = 10
    end
    object CdsDemGestAutPagNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object CdsDemGestAutPagCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      FixedChar = True
      Size = 15
    end
    object CdsDemGestAutPagFLGDOCBANCARIO: TStringField
      FieldName = 'FLGDOCBANCARIO'
      FixedChar = True
      Size = 1
    end
    object CdsDemGestAutPagVLACRE: TFloatField
      FieldName = 'VLACRE'
    end
    object CdsDemGestAutPagVLDEC: TFloatField
      FieldName = 'VLDEC'
    end
    object CdsDemGestAutPagVLIMP: TFloatField
      FieldName = 'VLIMP'
    end
    object CdsDemGestAutPagVLLIQ: TFloatField
      FieldName = 'VLLIQ'
    end
    object CdsDemGestAutPagTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object CdsDemGestAutPagNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
      Size = 60
    end
    object CdsDemGestAutPagTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object CdsDemGestAutPagTOTVALORBRUTO: TFloatField
      FieldName = 'TOTVALORBRUTO'
    end
    object CdsDemGestAutPagTOTVALORDEDUCOES: TFloatField
      FieldName = 'TOTVALORDEDUCOES'
    end
    object CdsDemGestAutPagTOTVALORACRESCIMO: TFloatField
      FieldName = 'TOTVALORACRESCIMO'
    end
    object CdsDemGestAutPagTOTVALORIMPOSTO: TFloatField
      FieldName = 'TOTVALORIMPOSTO'
    end
    object CdsDemGestAutPagTOTVALORAPAGAR: TFloatField
      FieldName = 'TOTVALORAPAGAR'
    end
    object CdsDemGestAutPagSUMVALORBRUTO: TFloatField
      FieldName = 'SUMVALORBRUTO'
    end
    object CdsDemGestAutPagSUMVALORDEDUCOES: TFloatField
      FieldName = 'SUMVALORDEDUCOES'
    end
    object CdsDemGestAutPagSUMVALORACRESCIMO: TFloatField
      FieldName = 'SUMVALORACRESCIMO'
    end
    object CdsDemGestAutPagSUMVALORIMPOSTO: TFloatField
      FieldName = 'SUMVALORIMPOSTO'
    end
    object CdsDemGestAutPagSUMVALORAPAGAR: TFloatField
      FieldName = 'SUMVALORAPAGAR'
    end
    object CdsDemGestAutPagNUMIMOVEL: TStringField
      FieldName = 'NUMIMOVEL'
      Size = 60
    end
    object CdsDemGestAutPagNOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object CdsDemGestAutPagDESCPLANO: TStringField
      FieldName = 'DESCPLANO'
      Size = 50
    end
    object CdsDemGestAutPagDESCPROGRAMA: TStringField
      FieldName = 'DESCPROGRAMA'
      Size = 60
    end
    object CdsDemGestAutPagDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object CdsDemGestAutPagDATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
    end
    object CdsDemGestAutPagIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object CdsDemGestAutPagVALOLANCTOLIQ: TFloatField
      FieldName = 'VALOLANCTOLIQ'
    end
    object CdsDemGestAutPagSUMVALOLANCTOLIQ: TFloatField
      FieldName = 'SUMVALOLANCTOLIQ'
    end
    object CdsDemGestAutPagDATALANCTO: TDateField
      DisplayWidth = 18
      FieldName = 'DATALANCTO'
    end
    object CdsDemGestAutPagCODDOSSIE: TStringField
      FieldName = 'CODDOSSIE'
      Size = 10
    end
  end
  object SqlAutPagDoc: TCMSqlParams
    SQL.Strings = (
      
        '-- VERIFICAR QryModeloAutPag NO DTMCAPCAR POIS ESTA É A QRY OFIC' +
        'IAL'
      'SELECT'
      '  NUMFATURA,'
      '  CODDOCUMENTO,'
      '  NUMAPGR,'
      '  REFERENCIA,'
      '  NODOCUMENTO,'
      '  COMPLDOCUMENTO,'
      '  DATAVENCTO,'
      '  DATAEMISSAO,'
      '  DATAPROGRAMADA,'
      '  NUMDOCUMENTO,'
      '  VALOR,'
      '  VALOROUTRAMOEDA,'
      '  RAZAOSOCIAL,'
      '  DESCRICAO,'
      '  VALORRATEIO,'
      '  DESCTDR,'
      '  NOMEAP,'
      '  NOMECR,'
      '  NOMECC,'
      '  OBS,'
      '  FLGDOCBANCARIO,'
      '  VLACRE,'
      '  VLDEC,'
      '  VLIMP,'
      '  VLLIQ,'
      '  TRGUSERINCLUSAO,'
      
        '  TO_DATE(TO_CHAR(TRGDTINCLUSAO, '#39'DD/MM/YYYY'#39'), '#39'DD/MM/YYYY'#39') AS' +
        ' TRGDTINCLUSAO,'
      '  (0) AS TOTVALORBRUTO,'
      '  (0) AS TOTVALORDEDUCOES,'
      '  (0) AS TOTVALORACRESCIMO,'
      '  (0) AS TOTVALORIMPOSTO,'
      '  (0) AS TOTVALORAPAGAR,'
      '  (0) AS SUMVALORBRUTO,'
      '  (0) AS SUMVALORDEDUCOES,'
      '  (0) AS SUMVALORACRESCIMO,'
      '  (0) AS SUMVALORIMPOSTO,'
      '  (0) AS SUMVALORAPAGAR,'
      '  NUMIMOVEL,'
      '  NOMEPATRO,'
      '  DESCPLANO,'
      '  DESCPROGRAMA,'
      '  IDFORCLI,'
      '  (0) AS VALOLANCTOLIQ,'
      '  (0) AS SUMVALOLANCTOLIQ'
      'FROM'
      '  ('
      '    SELECT'
      '      D.NUMFATURA,'
      '      D.CODDOCUMENTO,'
      '      D.NUMAPGR,'
      '      D.REFERENCIA,'
      '      D.NODOCUMENTO,'
      '      D.COMPLDOCUMENTO,'
      '      D.DATAVENCTO,'
      '      D.DATAEMISSAO,'
      '      D.DATAPROGRAMADA,'
      '      P.NUMDOCUMENTO,'
      '      L.VALOR,'
      '      L.VALOROUTRAMOEDA,'
      '      P.RAZAOSOCIAL,'
      '      F.DESCRICAO,'
      '      RD.VALOR AS VALORRATEIO,'
      '      TDR.DESCRICAO AS DESCTDR,'
      '      AP.NOME AS NOMEAP,'
      '      CR.NOME AS NOMECR,'
      '      CC.NOME AS NOMECC,'
      '      D.OBS,'
      '      F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,'
      '      (0) AS VLACRE,'
      '      (0) AS VLDEC,'
      '      (0) AS VLIMP,'
      '      (0) AS VLLIQ,'
      '      D.TRGUSERINCLUSAO,'
      '      D.TRGDTINCLUSAO,'
      '      RD.NUMIMOVEL,'
      '      PATRO.NOME AS NOMEPATRO,'
      '      PLANO.NOME AS DESCPLANO,'
      '      PROGRAMA.DESCPROGRAMA,'
      '      D.IDFORCLI'
      '    FROM'
      '      PESSOA P,'
      '      PESSOA PATRO,'
      '      DOCUMENTO D,'
      '      LANCTODOCUM L,'
      '      FORMARECPAG F,'
      '      CENTCUST CC,'
      '      RATEIODOCUM RD,'
      '      UNIDNEGOCIO AP,'
      '      CENTRESPON CR,'
      '      TIPORECEBDESEMB TDR,'
      '      PLANPREVCONTABIL PLANO,'
      '      PROGRAMA'
      '    WHERE'
      '-- #ADF1'
      
        '-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSUL' +
        'TA'
      '      D.CODTIPDOC IN'
      '      ('
      '        SELECT'
      '          CODTIPDOC'
      '        FROM'
      '          TIPODOCRECPAG A'
      '        WHERE'
      '          A.RECPAG = :RECPAG AND'
      '          NOT EXISTS'
      '          ('
      '            SELECT'
      '              *'
      '            FROM'
      '              USUARIOXTPDOCTO B'
      '            WHERE'
      '              RECPAG = :RECPAG AND'
      '              B.IDUSUARIO = :IDUSUARIO'
      '          )'
      '        UNION'
      '          SELECT'
      '            CODTIPDOC'
      '          FROM'
      '            TIPODOCRECPAG A'
      '          WHERE'
      '            A.RECPAG = :RECPAG AND'
      '            EXISTS'
      '            ('
      '              SELECT'
      '                *'
      '              FROM'
      '                USUARIOXTPDOCTO B'
      '              WHERE'
      '                RECPAG = :RECPAG AND'
      '                A.CODTIPDOC = B.CODTIPDOC AND'
      '                B.IDUSUARIO = :IDUSUARIO'
      '            )'
      '      ) AND'
      '      (L.ESTORNO IS NULL) AND'
      '      (D.RECPAG = :RECPAG) AND'
      '      (D.IDPESSOA = :IDPESSOA) AND'
      '      (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '      (D.OPERACAO = L.OPERACAO) AND'
      '      (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND'
      '      (P.IDPESSOA = D.IDFORCLI) AND'
      '      (D.CODFORMA = F.CODFORMA(+)) AND'
      '      (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND'
      '      (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND'
      '      (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND'
      '      (TDR.RECPAG(+) = RD.RECPAG) AND'
      '      (TDR.IDPESSOA(+) = RD.IDPESSOA) AND'
      '      (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND'
      '      (AP.IDPESSOA(+) = RD.IDPESSOA) AND'
      '      (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND'
      '      (CR.IDPESSOA(+) = RD.IDPESSOA) AND'
      '      (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND'
      '      (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND'
      '      (PATRO.IDPESSOA(+) = RD.IDPATRO)'
      '    UNION'
      '      SELECT'
      '        Q1.NUMFATURA,'
      '        Q1.CODDOCUMENTO,'
      '        Q1.NUMAPGR,'
      '        Q1.REFERENCIA,'
      '        Q1.NODOCUMENTO,'
      '        Q1.COMPLDOCUMENTO,'
      '        Q1.DATAVENCTO,'
      '        Q1.DATAEMISSAO,'
      '        Q1.DATAPROGRAMADA,'
      '        Q1.NUMDOCUMENTO,'
      '        Q1.VALOR,'
      '        Q1.VALOROUTRAMOEDA,'
      '        Q1.RAZAOSOCIAL,'
      '        Q1.DESCRICAO,'
      '        SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)) AS VALORRATEIO,'
      '        Q2.DESCTDR,'
      '        Q2.NOMEAP,'
      '        Q2.NOMECR,'
      '        Q2.NOMECC,'
      '        Q1.OBS,'
      '        Q1.FLGDOCBANCARIO ,'
      '        (0) AS VLACRE,'
      '        (0) AS VLDEC,'
      '        (0) AS VLIMP,'
      '        (0) AS VLLIQ,'
      '        Q1.TRGUSERINCLUSAO,'
      '        Q1.TRGDTINCLUSAO,'
      '        Q2.NUMIMOVEL,'
      '        Q2.NOMEPATRO,'
      '        Q2.DESCPLANO,'
      '        Q2.DESCPROGRAMA,'
      '        Q1.IDFORCLI'
      '      FROM'
      '        ('
      '          SELECT'
      '            DOC.NUMFATURA,'
      '            DOC.CODDOCUMENTO,'
      '            DOC.NUMAPGR,'
      '            DOC.REFERENCIA,'
      '            DOC.NODOCUMENTO,'
      '            DOC.COMPLDOCUMENTO,'
      '            DOC.DATAVENCTO,'
      '            DOC.DATAEMISSAO,'
      '            DOC.DATAPROGRAMADA,'
      '            P.NUMDOCUMENTO,'
      '            LAN.VALOR,'
      '            LAN.VALOROUTRAMOEDA,'
      '            P.RAZAOSOCIAL,'
      '            F.DESCRICAO,'
      '            DOC.OBS,'
      '            F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,'
      '            (0) AS VLACRE,'
      '            (0) AS VLDEC,'
      '            (0) AS VLIMP,'
      '            (0) AS VLLIQ,'
      '            DOC.TRGUSERINCLUSAO,'
      '            DOC.TRGDTINCLUSAO,'
      '            DOC.IDFORCLI'
      '          FROM'
      '            PESSOA P,'
      '            DOCUMENTO DOC,'
      '            LANCTODOCUM LAN,'
      '            FORMARECPAG F'
      '          WHERE'
      '-- #ADF2'
      
        '-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSUL' +
        'TA'
      '            DOC.CODTIPDOC IN'
      '            ('
      '              SELECT'
      '                CODTIPDOC'
      '              FROM'
      '                TIPODOCRECPAG A'
      '              WHERE'
      '                A.RECPAG = :RECPAG AND'
      '                NOT EXISTS'
      '                ('
      '                  SELECT'
      '                    *'
      '                  FROM'
      '                    USUARIOXTPDOCTO B'
      '                  WHERE'
      '                    RECPAG = :RECPAG AND'
      '                    B.IDUSUARIO = :IDUSUARIO'
      '                )'
      '              UNION'
      '                SELECT'
      '                  CODTIPDOC'
      '                FROM'
      '                  TIPODOCRECPAG A'
      '                WHERE'
      '                  A.RECPAG = :RECPAG AND'
      '                EXISTS'
      '                ('
      '                  SELECT'
      '                    *'
      '                  FROM'
      '                    USUARIOXTPDOCTO B'
      '                  WHERE'
      '                    RECPAG = :RECPAG AND'
      '                    A.CODTIPDOC = B.CODTIPDOC AND'
      '                    B.IDUSUARIO = :IDUSUARIO'
      '                )'
      '            ) AND'
      '            (LAN.ESTORNO IS NULL) AND'
      '            (DOC.RECPAG = :RECPAG) AND'
      '            (DOC.IDPESSOA = :IDPESSOA) AND'
      '            (P.IDPESSOA = DOC.IDFORCLI) AND'
      '            (DOC.CODFORMA = F.CODFORMA(+)) AND'
      '            (RTRIM(LAN.OPERACAO) IN ('#39'3'#39','#39'13'#39')) AND'
      '            (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)'
      '        ) Q1,'
      '        ('
      '          SELECT'
      '            D.NUMFATURA,'
      '            RD.VALOR,'
      '            TDR.DESCRICAO AS DESCTDR,'
      '            AP.NOME AS NOMEAP,'
      '            CR.NOME AS NOMECR,'
      '            CC.NOME AS NOMECC,'
      '            RD.NUMIMOVEL,'
      '            PATRO.NOME AS NOMEPATRO,'
      '            PLANO.NOME AS DESCPLANO,'
      '            PROGRAMA.DESCPROGRAMA'
      '          FROM'
      '            PESSOA PATRO,'
      '            DOCUMENTO D,'
      '            RATEIODOCUM RD,'
      '            CENTCUST CC,'
      '            UNIDNEGOCIO AP,'
      '            CENTRESPON CR,'
      '            TIPORECEBDESEMB TDR,'
      '            PLANPREVCONTABIL PLANO,'
      '            PROGRAMA'
      '          WHERE'
      '-- #ADF3'
      
        '-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSUL' +
        'TA'
      '            (D.RECPAG = :RECPAG) AND'
      '            (D.IDPESSOA = :IDPESSOA) AND'
      '            (D.NUMFATURA IS NOT NULL) AND'
      '            (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND'
      '            (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND'
      '            (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND'
      '            (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND'
      '            (TDR.RECPAG(+) = RD.RECPAG) AND'
      '            (TDR.IDPESSOA(+) = RD.IDPESSOA) AND'
      '            (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND'
      '            (AP.IDPESSOA(+) = RD.IDPESSOA) AND'
      '            (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND'
      '            (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND'
      '            (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND'
      '            (PATRO.IDPESSOA(+) = RD.IDPATRO) AND'
      '            (CR.IDPESSOA(+) = RD.IDPESSOA)'
      '        ) Q2,'
      '        ('
      '          SELECT'
      '            D.NUMFATURA,'
      '            SUM(L.VALOR) AS VALOR'
      '          FROM'
      '            LANCTODOCUM L,'
      '            DOCUMENTO D'
      '          WHERE'
      '            (L.ESTORNO IS NULL) AND'
      '            (D.RECPAG= :RECPAG) AND'
      '            (D.IDPESSOA = :IDPESSOA) AND'
      '            (RTRIM(L.OPERACAO) IN ('#39'1'#39','#39'11'#39')) AND'
      '            (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '            (D.OPERACAO = L.OPERACAO) AND'
      '            (D.NUMFATURA IS NOT NULL)'
      '          GROUP BY'
      '            D.NUMFATURA'
      '        ) Q3'
      '      WHERE'
      '        (Q1.NUMFATURA = Q2.NUMFATURA) AND'
      '        (Q3.NUMFATURA = Q2.NUMFATURA)'
      '      GROUP BY'
      '        Q1.NUMFATURA,'
      '        Q1.CODDOCUMENTO,'
      '        Q1.NUMAPGR,'
      '        Q1.REFERENCIA,'
      '        Q1.NODOCUMENTO,'
      '        Q1.COMPLDOCUMENTO,'
      '        Q1.DATAVENCTO,'
      '        Q1.DATAEMISSAO,'
      '        Q1.DATAPROGRAMADA,'
      '        Q1.NUMDOCUMENTO,'
      '        Q1.VALOR,'
      '        Q1.VALOROUTRAMOEDA,'
      '        Q1.RAZAOSOCIAL,'
      '        Q1.DESCRICAO,'
      '        Q2.DESCTDR,'
      '        Q2.NOMEAP,'
      '        Q2.NOMECR,'
      '        Q2.NOMECC,'
      '        Q1.OBS,'
      '        Q1.FLGDOCBANCARIO,'
      '        Q1.TRGUSERINCLUSAO,'
      '        Q1.TRGDTINCLUSAO,'
      '        Q2.NUMIMOVEL,'
      '        Q2.NOMEPATRO,'
      '        Q2.DESCPLANO,'
      '        Q2.DESCPROGRAMA,'
      '        Q1.IDFORCLI'
      '  )'
      ''
      '')
    ClientDataSet = CdsAutPagDoc
    Left = 852
    Top = 152
  end
  object CdsAutPagDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 712
    Top = 152
  end
  object SqlDemGestAutPag: TCMSqlParams
    SQL.Strings = (
      ' SELECT'
      '   D.NUMFATURA,'
      '   D.CODDOCUMENTO,'
      '   D.NUMAPGR,'
      '   D.REFERENCIA,'
      '   D.NODOCUMENTO,'
      '   D.COMPLDOCUMENTO,'
      '   D.DATAVENCTO,'
      '   D.DATAEMISSAO,'
      '   D.DATAPROGRAMADA,'
      '   P.NUMDOCUMENTO,'
      '   L.VALOR,'
      '   L.VALOROUTRAMOEDA,'
      '   L.DATALANCTO,'
      '   P.RAZAOSOCIAL,'
      '   F.DESCRICAO,'
      '   RD.VALOR AS VALORRATEIO,'
      '   TDR.DESCRICAO AS DESCTDR,'
      '   AP.NOME AS NOMEAP,'
      '   CR.NOME AS NOMECR,'
      '   CC.NOME AS NOMECC,'
      '   D.OBS,'
      '   F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,'
      '   (0) AS VLACRE,'
      '   (0) AS VLDEC,'
      '   (0) AS VLIMP,'
      '   (0) AS VLLIQ,'
      '   D.TRGUSERINCLUSAO,'
      
        '   TO_DATE(TO_CHAR(D.TRGDTINCLUSAO, '#39'DD/MM/YYYY'#39'), '#39'DD/MM/YYYY'#39')' +
        ' AS TRGDTINCLUSAO,'
      '   RD.NUMIMOVEL,                                           '
      '   PATRO.NOME AS NOMEPATRO,                                '
      '   PLANO.NOME AS DESCPLANO,'
      '   PROGRAMA.DESCPROGRAMA,'
      '   D.IDFORCLI,'
      '  (0) AS TOTVALORBRUTO,'
      '  (0) AS TOTVALORDEDUCOES,'
      '  (0) AS TOTVALORACRESCIMO,'
      '  (0) AS TOTVALORIMPOSTO,'
      '  (0) AS TOTVALORAPAGAR,'
      '  (0) AS SUMVALORBRUTO,'
      '  (0) AS SUMVALORDEDUCOES,'
      '  (0) AS SUMVALORACRESCIMO,'
      '  (0) AS SUMVALORIMPOSTO,'
      '  (0) AS SUMVALORAPAGAR,'
      '  (0) AS VALOLANCTOLIQ,'
      '  (0) AS SUMVALOLANCTOLIQ,'
      '  ('#39'          '#39') AS NUMBANCO,'
      '  ('#39'               '#39') AS NUMAGENCIA,'
      '  ('#39'               '#39') AS CONTACORRENTE,'
      
        '  ('#39'                                                            ' +
        #39') AS NOMEUSUARIO,'
      '  D.CODDOSSIE'
      ' FROM'
      '   PESSOA P,'
      '   PESSOA PATRO,'
      '   DOCUMENTO D,'
      '   LANCTODOCUM L,'
      '   FORMARECPAG F,'
      '   CENTCUST CC,'
      '   RATEIODOCUM RD,'
      '   UNIDNEGOCIO AP,'
      '   CENTRESPON CR,'
      '   TIPORECEBDESEMB TDR,'
      '   PLANPREVCONTABIL PLANO,'
      '   PROGRAMA'
      ' WHERE'
      '   1=2')
    ClientDataSet = CdsDemGestAutPag
    Left = 852
    Top = 104
  end
  object SqlNomeUsuario: TCMSqlParams
    SQL.Strings = (
      'SELECT NOMEUSUARIO '
      'FROM USUARIOSISTEMA '
      'WHERE IDUSUARIO = :IDUSUARIO')
    ClientDataSet = CdsNomeUsuario
    Left = 852
    Top = 200
  end
  object CdsNomeUsuario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 712
    Top = 200
  end
  object CdsBuscaContaDocForn: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 712
    Top = 392
  end
  object SqlBuscaContaDocForn: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   DECODE(C.TIPOCONTA,'#39'1'#39','#39'Conta Corrente'#39','
      '   DECODE(C.TIPOCONTA,'#39'2'#39','#39'Cartão Salário'#39','
      
        '   DECODE(C.TIPOCONTA,'#39'3'#39','#39'Conta Poupança'#39','#39#39'))) AS DESCTIPOCONT' +
        'A,'
      
        '   C.CONTACORRENTE, B.NUMBANCO, A.NUMAGENCIA, C.TIPOCONTA, C.IDC' +
        'BANCARIA,'
      
        '   DECODE(PA.RAZAOSOCIAL,NULL,PA.NOME,PA.RAZAOSOCIAL) AS NOMEAGE' +
        'NCIA,'
      
        '   DECODE(PB.RAZAOSOCIAL,NULL,PB.NOME,PB.RAZAOSOCIAL) AS NOMEBAN' +
        'CO,'
      '   B.MASCARACC,'
      '   B.MASCARAAGENCIA'
      'FROM'
      
        '   PESSOA PA, PESSOA PB, DOCUMENTO D, CONTABANCARIA C, AGENCIABA' +
        'NCARIA A, BANCO B'
      'WHERE'
      '   (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '   (C.IDPESSOA = D.IDFORCLI)  AND'
      '   (C.FLGCONTAPREF = 1)       AND'
      '   (C.IDAGENCIA = A.IDPESSOA) AND'
      '   (A.IDBANCO   = B.IDPESSOA) AND'
      '   (A.IDPESSOA = PA.IDPESSOA) AND'
      '   (B.IDPESSOA = PB.IDPESSOA)'
      ' ')
    ClientDataSet = CdsBuscaContaDocForn
    Left = 852
    Top = 392
  end
  object CdsBuscaContaDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 712
    Top = 344
  end
  object SqlBuscaContaDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT DECODE(C.TIPOCONTA,'#39'1'#39','#39'Conta Corrente'#39','
      '       DECODE(C.TIPOCONTA,'#39'2'#39','#39'Cartão Salário'#39','
      
        '       DECODE(C.TIPOCONTA,'#39'3'#39','#39'Conta Poupança'#39','#39#39'))) AS DESCTIPO' +
        'CONTA,'
      '       C.CONTACORRENTE,'
      '       B.NUMBANCO,'
      '       A.NUMAGENCIA,'
      '       C.TIPOCONTA,'
      '       C.IDCBANCARIA,'
      
        '       DECODE(PA.RAZAOSOCIAL,NULL,PA.NOME,PA.RAZAOSOCIAL) AS NOM' +
        'EAGENCIA,'
      
        '       DECODE(PB.RAZAOSOCIAL,NULL,PB.NOME,PB.RAZAOSOCIAL) AS NOM' +
        'EBANCO,'
      '       B.MASCARACC,'
      '       B.MASCARAAGENCIA'
      'FROM'
      
        '   PESSOA PA, PESSOA PB, DOCUMENTO D, CONTABANCARIA C, AGENCIABA' +
        'NCARIA A, BANCO B'
      'WHERE'
      '   (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '   (C.IDAGENCIA = A.IDPESSOA)  AND'
      '   (A.IDBANCO   = B.IDPESSOA) AND'
      '   (A.IDPESSOA = PA.IDPESSOA) AND'
      '   (B.IDPESSOA = PB.IDPESSOA) AND'
      '   (D.IDCBANCARIA = C.IDCBANCARIA) '
      ' ')
    ClientDataSet = CdsBuscaContaDoc
    Left = 852
    Top = 344
  end
  object CdsAlteraParcOrigem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 712
    Top = 296
  end
  object SqlAlteraParcOrigem: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  (Q2.VALACRE * (Q3.VALORPARCELAS))/(Q1.VALORIGINAL + Q2.VALACRE' +
        ' - Q2.VALDECR - Q2.VALIMP) AS VALACRE,'
      
        '  (Q2.VALDECR * (Q3.VALORPARCELAS))/(Q1.VALORIGINAL + Q2.VALACRE' +
        ' - Q2.VALDECR - Q2.VALIMP) AS VALDECR,'
      
        '  (Q2.VALIMP * (Q3.VALORPARCELAS))/(Q1.VALORIGINAL + Q2.VALACRE ' +
        '- Q2.VALDECR - Q2.VALIMP) AS VALIMP,'
      '  Q3.CODDOCUMENTO  '
      'FROM'
      '   (SELECT'
      '     D.CODDOCUMENTO,'
      '     L.VALOR AS VALORPARCELAS'
      '    FROM'
      '     DOCUMENTO D, LANCTODOCUM L'
      '    WHERE'
      '     (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '     (D.OPERACAO = L.OPERACAO) AND'
      '     (D.CODDOCUMENTO= L.CODDOCUMENTO) AND'
      '     (RTRIM(D.OPERACAO) IN ('#39'3'#39','#39'13'#39')) AND'
      '     (L.ESTORNO IS NULL)) Q3,'
      '   (SELECT'
      '     SUM(L.VALOR) AS VALORIGINAL'
      '    FROM'
      '     DOCUMENTO D, LANCTODOCUM L'
      '    WHERE'
      '     (D.NUMFATURA=:NUMFATURA) AND'
      '     (D.OPERACAO = L.OPERACAO) AND'
      '     (D.CODDOCUMENTO= L.CODDOCUMENTO) AND'
      '     (RTRIM(D.OPERACAO) NOT IN ('#39'3'#39','#39'13'#39')) AND'
      '     (L.ESTORNO IS NULL)) Q1,'
      '   (SELECT'
      '      SUM(VALACRE) AS VALACRE ,'
      '      SUM(VALDECR) AS VALDECR ,'
      '      SUM(VALIMP)  AS VALIMP'
      '    FROM'
      '      (SELECT'
      '         DECODE(L.DEBCRE,'#39'C'#39',SUM(L.VALOR)) AS VALACRE,'
      '         DECODE(L.DEBCRE,'#39'D'#39',SUM(L.VALOR)) AS VALDECR,'
      '         0 AS VALIMP'
      '       FROM'
      '         DOCUMENTO D, LANCTODOCUM L'
      '       WHERE'
      '         (D.NUMFATURA=:NUMFATURA) AND'
      '         (RTRIM(D.OPERACAO) NOT IN ('#39'3'#39','#39'13'#39')) AND'
      '         (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '         (RTRIM(L.OPERACAO)='#39'4'#39') AND'
      '         (CODALTERADOR NOT IN'
      '           (SELECT'
      '              CODALTERADOR'
      '            FROM'
      '              ALTXIMPOSTO'
      '            WHERE'
      '              CODIMPOSTO = 1))'
      '       GROUP BY'
      '         L.DEBCRE'
      '      UNION ALL'
      '      SELECT'
      '        0 AS VALACRE,'
      '        0 AS VALDECR,'
      '        SUM(L.VALOR) AS VALIMP'
      '      FROM'
      '        DOCUMENTO D, LANCTODOCUM L, ALTXIMPOSTO AL'
      '      WHERE'
      '        (D.NUMFATURA=:NUMFATURA) AND'
      '        (L.CODDOCUMENTO=D.CODDOCUMENTO) AND'
      '        (RTRIM(D.OPERACAO) NOT IN ('#39'3'#39','#39'13'#39')) AND'
      '        (RTRIM(L.OPERACAO)='#39'4'#39') AND'
      '        (L.CODALTERADOR = AL.CODALTERADOR) AND'
      '        (AL.CODIMPOSTO = 1))) Q2'
      '')
    ClientDataSet = CdsAlteraParcOrigem
    Left = 852
    Top = 296
  end
  object CdsAutPagDocAlt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 712
    Top = 248
  end
  object SqlAutPagDocAlt: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   SUM(VALACRE) AS VALACRE, SUM(VALDECR) AS VALDECR, SUM(VALIMP)' +
        ' AS VALIMP'
      'FROM'
      '  (SELECT'
      
        '      DECODE(L.DEBCRE,'#39'D'#39',SUM(L.VALOR)) AS VALACRE,    -- SOL 19' +
        '9900 -invertido o C com D'
      
        '      DECODE(L.DEBCRE,'#39'C'#39',SUM(L.VALOR)) AS VALDECR,   -- SOL 199' +
        '900 - invertido o C com D'
      '      (0) AS VALIMP'
      '   FROM'
      '      LANCTODOCUM L'
      '   WHERE'
      
        '      (L.CODDOCUMENTO=:CODDOCUMENTO) AND (RTRIM(L.OPERACAO)='#39'4'#39')' +
        ' AND'
      '      (CODALTERADOR NOT IN'
      '         (SELECT'
      '             CODALTERADOR'
      '          FROM'
      '             ALTXIMPOSTO'
      '          WHERE'
      '             CODIMPOSTO = 1))'
      '   GROUP BY DEBCRE'
      '   UNION'
      '   SELECT'
      '      (0) AS VALACRE, (0) AS VALDECR, '
      
        '      SUM(DECODE(l.debcre, '#39'D'#39', (L.VALOR), (-l.VALOR))) AS VALIM' +
        'P'
      '  FROM LANCTODOCUM L'
      '   WHERE'
      
        '      (L.CODDOCUMENTO=:CODDOCUMENTO) AND (RTRIM(L.OPERACAO)='#39'4'#39')' +
        ' AND'
      
        '      (CODALTERADOR IN (SELECT CODALTERADOR FROM ALTXIMPOSTO WHE' +
        'RE CODIMPOSTO = 1)))'
      ' ')
    ClientDataSet = CdsAutPagDocAlt
    Left = 852
    Top = 248
  end
  object SqlDocumFilhosAP: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '       R.CODDOCUMENTO,DF.NODOCUMENTO as CAPDOCUMENTO,'
      '       R.CODTIPRECDES,'
      '       R.RECPAG,'
      '       R.IDPESSOA,'
      '       R.IDRESERVAORCAMEN,'
      '       R.CODCENTRORESPON,'
      '       C.CODEXTERNO as CODEXTERNOCR,'
      '       R.UNIDNEGOC,'
      '       R.MOECODIGO,'
      '       R.VALOR,'
      '       R.VALOROUTRAMOEDA,'
      '       t.PLACONTACREDITO,'
      '       R.IDUSUARIOINCLUSAO,'
      '       U.NOME,'
      '       C.NOME,'
      '       R.CODCENTROCUSTO,'
      '       CC.CODEXTERNO as CODEXTERNOCC,'
      '       R.IDRATEIODOCUM,'
      '       T.DESCRICAO,'
      '       I.MOESIGLA,'
      '       CC.NOME AS NOMECENTROCUSTO,'
      '       R.PLANO,'
      '       R.IDPATRO,'
      '       R.IDPROGRAMA,'
      '       PROGRAMA.FLGTIPOPROGRAMA,'
      '       R.NUMIMOVEL,'
      '       PATRO.NOME AS NOMEPATRO,'
      '       PLANO.NOME AS DESCPLANO,'
      '       PROGRAMA.DESCPROGRAMA,'
      '       T.HITCODHIST,'
      '       R.IDPLANOPREV,'
      '       RESERVAORCAMEN.NUMRESERVA,'
      '       T.FLGOBRIGARESERVA,'
      '       RESERVAORCAMEN.NUMRESERVA AS NUMRESERVAOLD,'
      '       R.VALOR AS VALORRESERVAOLD,'
      '       R.VLRRESORCAMEN,'
      '       -1 AS IDSEGREGACRITER,'
      '       0 AS CODSUBCONTA,'
      '       0 AS CODSUBCONTAPASS,'
      '       IDPLANOVIRTUAL,'
      '       IDSEGREGACONTR,'
      '       T.FLGOBRQTDECOTAS,'
      '       R.IDPATROORIGEM,'
      '       R.IDPLANOORIGEM,'
      '       PATROORIGEM.NOME AS NOMEPATROORIGEM,'
      '       PLANOORIGEM.NOME AS DESCPLANOORIGEM'
      '  FROM RATEIODOCUM R,'
      '       UNIDNEGOCIO U,'
      '       CENTRESPON C,'
      '       TIPORECEBDESEMB T,'
      '       MOEDA I,'
      '       CENTCUST CC,'
      '       PESSOA PATRO,'
      '       PLANPREVCONTABIL PLANO,'
      '       PROGRAMA,'
      '       RESERVAORCAMEN,'
      '       PESSOA PATROORIGEM,'
      '       PLANPREVCONTABIL PLANOORIGEM,'
      '       DOCUMENTO DOC,'
      '       DOCUMXDOCUM DXD, DOCUMENTO DF'
      ' WHERE (DOC.CODDOCUMENTO = 421999)'
      ''
      '   AND (T.CODTIPRECDES = R.CODTIPRECDES)'
      '   AND (DF.CODDOCUMENTO = R.CODDOCUMENTO)'
      '   AND (T.RECPAG = R.RECPAG)'
      '   AND (T.IDPESSOA = R.IDPESSOA)'
      '   AND (U.UNIDNEGOC = R.UNIDNEGOC)'
      '   AND (U.IDPESSOA = R.IDPESSOA)'
      '   AND (I.MOECODIGO(+) = R.MOECODIGO)'
      '   AND (C.CODCENTRORESPON(+) = R.CODCENTRORESPON)'
      '   AND (CC.IDEMPRESA(+) = R.IDPESSOA)'
      '   AND (R.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '   AND (C.IDPESSOA(+) = R.IDPESSOA)'
      '   AND (PLANO.IDPLANOPREV(+) = R.IDPLANOPREV)'
      '   AND (PROGRAMA.IDPROGRAMA(+) = R.IDPROGRAMA)'
      '   AND (PATRO.IDPESSOA(+) = R.IDPATRO)'
      '   AND (RESERVAORCAMEN.IDRESERVAORCAMEN(+) = R.IDRESERVAORCAMEN)'
      '   AND (PLANOORIGEM.IDPLANOPREV(+) = R.IDPLANOORIGEM)'
      '   AND (PATROORIGEM.IDPESSOA(+) = R.IDPATROORIGEM)'
      '      '
      '   AND DXD.IDDOCUMENTOPAI = DOC.CODDOCUMENTO'
      '   AND DXD.IDDOCUMENTO = R.CODDOCUMENTO'
      '  AND 1 = 2'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 1124
    Top = 272
  end
  object DsDocumFilhoAP: TwwDataSource
    Left = 1026
    Top = 224
  end
  object SqlDocumFilhoAR: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '       R.CODDOCUMENTO,DF.NODOCUMENTO as CARDOCUMENTO,'
      '       R.CODTIPRECDES,'
      '       R.RECPAG,'
      '       R.IDPESSOA,'
      '       R.IDRESERVAORCAMEN,'
      '       R.CODCENTRORESPON,'
      '       C.CODEXTERNO as CODEXTERNOCR,'
      '       R.UNIDNEGOC,'
      '       R.MOECODIGO,'
      '       R.VALOR,'
      '       R.VALOROUTRAMOEDA,'
      '       t.PLACONTACREDITO,'
      '       R.IDUSUARIOINCLUSAO,'
      '       U.NOME,'
      '       C.NOME,'
      '       R.CODCENTROCUSTO,'
      '       CC.CODEXTERNO as CODEXTERNOCC,'
      '       R.IDRATEIODOCUM,'
      '       T.DESCRICAO,'
      '       I.MOESIGLA,'
      '       CC.NOME AS NOMECENTROCUSTO,'
      '       R.PLANO,'
      '       R.IDPATRO,'
      '       R.IDPROGRAMA,'
      '       PROGRAMA.FLGTIPOPROGRAMA,'
      '       R.NUMIMOVEL,'
      '       PATRO.NOME AS NOMEPATRO,'
      '       PLANO.NOME AS DESCPLANO,'
      '       PROGRAMA.DESCPROGRAMA,'
      '       T.HITCODHIST,'
      '       R.IDPLANOPREV,'
      '       RESERVAORCAMEN.NUMRESERVA,'
      '       T.FLGOBRIGARESERVA,'
      '       RESERVAORCAMEN.NUMRESERVA AS NUMRESERVAOLD,'
      '       R.VALOR AS VALORRESERVAOLD,'
      '       R.VLRRESORCAMEN,'
      '       -1 AS IDSEGREGACRITER,'
      '       0 AS CODSUBCONTA,'
      '       0 AS CODSUBCONTAPASS,'
      '       IDPLANOVIRTUAL,'
      '       IDSEGREGACONTR,'
      '       T.FLGOBRQTDECOTAS,'
      '       R.IDPATROORIGEM,'
      '       R.IDPLANOORIGEM,'
      '       PATROORIGEM.NOME AS NOMEPATROORIGEM,'
      '       PLANOORIGEM.NOME AS DESCPLANOORIGEM'
      '  FROM RATEIODOCUM R,'
      '       UNIDNEGOCIO U,'
      '       CENTRESPON C,'
      '       TIPORECEBDESEMB T,'
      '       MOEDA I,'
      '       CENTCUST CC,'
      '       PESSOA PATRO,'
      '       PLANPREVCONTABIL PLANO,'
      '       PROGRAMA,'
      '       RESERVAORCAMEN,'
      '       PESSOA PATROORIGEM,'
      '       PLANPREVCONTABIL PLANOORIGEM,'
      '       DOCUMENTO DOC,'
      '       DOCUMXDOCUM DXD, DOCUMENTO DF'
      ' WHERE (DOC.CODDOCUMENTO = 421999)'
      '      '
      '   AND (T.CODTIPRECDES = R.CODTIPRECDES)'
      '   AND (DF.CODDOCUMENTO = R.CODDOCUMENTO)'
      '   AND (T.RECPAG = R.RECPAG)'
      '   AND (T.IDPESSOA = R.IDPESSOA)'
      '   AND (U.UNIDNEGOC = R.UNIDNEGOC)'
      '   AND (U.IDPESSOA = R.IDPESSOA)'
      '   AND (I.MOECODIGO(+) = R.MOECODIGO)'
      '   AND (C.CODCENTRORESPON(+) = R.CODCENTRORESPON)'
      '   AND (CC.IDEMPRESA(+) = R.IDPESSOA)'
      '   AND (R.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '   AND (C.IDPESSOA(+) = R.IDPESSOA)'
      '   AND (PLANO.IDPLANOPREV(+) = R.IDPLANOPREV)'
      '   AND (PROGRAMA.IDPROGRAMA(+) = R.IDPROGRAMA)'
      '   AND (PATRO.IDPESSOA(+) = R.IDPATRO)'
      '   AND (RESERVAORCAMEN.IDRESERVAORCAMEN(+) = R.IDRESERVAORCAMEN)'
      '   AND (PLANOORIGEM.IDPLANOPREV(+) = R.IDPLANOORIGEM)'
      '   AND (PATROORIGEM.IDPESSOA(+) = R.IDPATROORIGEM)'
      '      '
      '   AND DXD.IDDOCUMENTOPAI = DOC.CODDOCUMENTO'
      '   AND DXD.IDDOCUMENTO = R.CODDOCUMENTO'
      '  AND 1 = 2'
      ' '
      ''
      ' '
      ' '
      ' ')
    Left = 1132
    Top = 376
  end
  object DsDocumFilhoAR: TwwDataSource
    Left = 1034
    Top = 328
  end
  object dsCdsDemGestAutPag1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspGestAutPag'
    Left = 792
    Top = 64
    object dsCdsDemGestAutPag1NUMFATURA: TFloatField
      FieldName = 'NUMFATURA'
    end
    object dsCdsDemGestAutPag1CODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object dsCdsDemGestAutPag1NUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
    end
    object dsCdsDemGestAutPag1REFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 30
    end
    object dsCdsDemGestAutPag1NODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object dsCdsDemGestAutPag1COMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object dsCdsDemGestAutPag1DATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object dsCdsDemGestAutPag1NUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object dsCdsDemGestAutPag1VALOR: TFloatField
      FieldName = 'VALOR'
    end
    object dsCdsDemGestAutPag1VALOROUTRAMOEDA: TFloatField
      FieldName = 'VALOROUTRAMOEDA'
    end
    object dsCdsDemGestAutPag1RAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object dsCdsDemGestAutPag1DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object dsCdsDemGestAutPag1VALORRATEIO: TFloatField
      FieldName = 'VALORRATEIO'
    end
    object dsCdsDemGestAutPag1DESCTDR: TStringField
      FieldName = 'DESCTDR'
      Size = 35
    end
    object dsCdsDemGestAutPag1NOMEAP: TStringField
      FieldName = 'NOMEAP'
      Size = 25
    end
    object dsCdsDemGestAutPag1NOMECR: TStringField
      FieldName = 'NOMECR'
      FixedChar = True
      Size = 30
    end
    object dsCdsDemGestAutPag1NOMECC: TStringField
      FieldName = 'NOMECC'
      Size = 30
    end
    object dsCdsDemGestAutPag1OBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1000
    end
    object dsCdsDemGestAutPag1NUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      FixedChar = True
      Size = 10
    end
    object dsCdsDemGestAutPag1NUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object dsCdsDemGestAutPag1CONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      FixedChar = True
      Size = 15
    end
    object dsCdsDemGestAutPag1FLGDOCBANCARIO: TStringField
      FieldName = 'FLGDOCBANCARIO'
      FixedChar = True
      Size = 1
    end
    object dsCdsDemGestAutPag1VLACRE: TFloatField
      FieldName = 'VLACRE'
    end
    object dsCdsDemGestAutPag1VLDEC: TFloatField
      FieldName = 'VLDEC'
    end
    object dsCdsDemGestAutPag1VLIMP: TFloatField
      FieldName = 'VLIMP'
    end
    object dsCdsDemGestAutPag1VLLIQ: TFloatField
      FieldName = 'VLLIQ'
    end
    object dsCdsDemGestAutPag1TRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object dsCdsDemGestAutPag1NOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
      Size = 60
    end
    object dsCdsDemGestAutPag1TRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object dsCdsDemGestAutPag1TOTVALORBRUTO: TFloatField
      FieldName = 'TOTVALORBRUTO'
    end
    object dsCdsDemGestAutPag1TOTVALORDEDUCOES: TFloatField
      FieldName = 'TOTVALORDEDUCOES'
    end
    object dsCdsDemGestAutPag1TOTVALORACRESCIMO: TFloatField
      FieldName = 'TOTVALORACRESCIMO'
    end
    object dsCdsDemGestAutPag1TOTVALORIMPOSTO: TFloatField
      FieldName = 'TOTVALORIMPOSTO'
    end
    object dsCdsDemGestAutPag1TOTVALORAPAGAR: TFloatField
      FieldName = 'TOTVALORAPAGAR'
    end
    object dsCdsDemGestAutPag1SUMVALORBRUTO: TFloatField
      FieldName = 'SUMVALORBRUTO'
    end
    object dsCdsDemGestAutPag1SUMVALORDEDUCOES: TFloatField
      FieldName = 'SUMVALORDEDUCOES'
    end
    object dsCdsDemGestAutPag1SUMVALORACRESCIMO: TFloatField
      FieldName = 'SUMVALORACRESCIMO'
    end
    object dsCdsDemGestAutPag1SUMVALORIMPOSTO: TFloatField
      FieldName = 'SUMVALORIMPOSTO'
    end
    object dsCdsDemGestAutPag1SUMVALORAPAGAR: TFloatField
      FieldName = 'SUMVALORAPAGAR'
    end
    object dsCdsDemGestAutPag1NUMIMOVEL: TStringField
      FieldName = 'NUMIMOVEL'
      Size = 60
    end
    object dsCdsDemGestAutPag1NOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object dsCdsDemGestAutPag1DESCPLANO: TStringField
      FieldName = 'DESCPLANO'
      Size = 50
    end
    object dsCdsDemGestAutPag1DESCPROGRAMA: TStringField
      FieldName = 'DESCPROGRAMA'
      Size = 60
    end
    object dsCdsDemGestAutPag1DATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object dsCdsDemGestAutPag1DATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
    end
    object dsCdsDemGestAutPag1IDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object dsCdsDemGestAutPag1VALOLANCTOLIQ: TFloatField
      FieldName = 'VALOLANCTOLIQ'
    end
    object dsCdsDemGestAutPag1SUMVALOLANCTOLIQ: TFloatField
      FieldName = 'SUMVALOLANCTOLIQ'
    end
  end
end
