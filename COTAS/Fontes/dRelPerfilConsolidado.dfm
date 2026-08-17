inherited dtmRelPerfilConsolidado: TdtmRelPerfilConsolidado
  Left = 320
  Top = 160
  Width = 485
  Height = 285
  Caption = 'dtmRelPerfilConsolidado'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 85
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
    Left = 85
  end
  inherited qryExemplo: TwwQuery
    Left = 86
  end
  inherited rpExemplo: TppReport
    Left = 86
    DataPipelineName = 'pplExemplo'
    inherited FooterBand1: TppFooterBand
      inherited Calc1: TppSystemVariable [2]
      end
      inherited Calc2: TppSystemVariable [3]
        mmLeft = 3175
        mmTop = 3440
      end
    end
  end
  object plAtivosEspecif: TppDBPipeline
    DataSource = dsAtivosEspecif
    UserName = 'plAtivosEspecif'
    Left = 90
    Top = 73
    object plAtivosEspecifppField1: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object plAtivosEspecifppField2: TppField
      FieldAlias = 'ATIVO'
      FieldName = 'ATIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object plAtivosEspecifppField3: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object plAtivosEspecifppField4: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object plAtivosEspecifppField5: TppField
      FieldAlias = 'QTDCOTA'
      FieldName = 'QTDCOTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object plAtivosEspecifppField6: TppField
      FieldAlias = 'VLRCOTA'
      FieldName = 'VLRCOTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object plAtivosEspecifppField7: TppField
      FieldAlias = 'VLRCOTIZADO'
      FieldName = 'VLRCOTIZADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object plAtivosEspecifppField8: TppField
      FieldAlias = 'VLRRENTABILIZADO'
      FieldName = 'VLRRENTABILIZADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object plAtivosEspecifppField9: TppField
      FieldAlias = 'VLRPATRIMONIO'
      FieldName = 'VLRPATRIMONIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object plAtivosEspecifppField10: TppField
      FieldAlias = 'ORIGEMATIVO'
      FieldName = 'ORIGEMATIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object plAtivosEspecifppField11: TppField
      FieldAlias = 'IDCOTACOTACAO'
      FieldName = 'IDCOTACOTACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
  end
  object plAtivosConsolidados: TppDBPipeline
    DataSource = dsAtivosConsolidados
    UserName = 'plAtivosConsolidados'
    Left = 194
    Top = 73
    object plAtivosConsolidadosppField1: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object plAtivosConsolidadosppField2: TppField
      FieldAlias = 'VLRPATRIMONIOINI'
      FieldName = 'VLRPATRIMONIOINI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object plAtivosConsolidadosppField3: TppField
      FieldAlias = 'VLRPATRIMONIOFIM'
      FieldName = 'VLRPATRIMONIOFIM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object plAtivosConsolidadosppField4: TppField
      FieldAlias = 'QTDCOTAFIM'
      FieldName = 'QTDCOTAFIM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object plAtivosConsolidadosppField5: TppField
      FieldAlias = 'VLRCOTA'
      FieldName = 'VLRCOTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object plAtivosConsolidadosppField6: TppField
      FieldAlias = 'VLRCOTIZADO'
      FieldName = 'VLRCOTIZADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object plAtivosConsolidadosppField7: TppField
      FieldAlias = 'VLRRENTABILIZADO'
      FieldName = 'VLRRENTABILIZADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object plAtivosConsolidadosppField8: TppField
      FieldAlias = 'GRUPO'
      FieldName = 'GRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object plAtivosConsolidadosppField9: TppField
      FieldAlias = 'QTDCOTAINI'
      FieldName = 'QTDCOTAINI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object plAtivosConsolidadosppField10: TppField
      FieldAlias = 'PERCENTDIA'
      FieldName = 'PERCENTDIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object plAtivosConsolidadosppField11: TppField
      FieldAlias = 'PERCENTPERIODO'
      FieldName = 'PERCENTPERIODO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
  end
  object pplDadosFundacao: TppDBPipeline
    DataSource = dtmLookCotas.dsDadosFundacao
    UserName = 'lDadosFundacao'
    Left = 297
    Top = 16
    object pplDadosFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplDadosFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplDadosFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplDadosFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplDadosFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplDadosFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplDadosFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplDadosFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplDadosFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplDadosFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplDadosFundacaoppField11: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplDadosFundacaoppField12: TppField
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
  object ppDbCompPerfil: TppDBPipeline
    DataSource = dsCompPerfil
    UserName = 'DbCompPerfil'
    Left = 293
    Top = 72
    object ppDbCompPerfilppField1: TppField
      FieldAlias = 'TIPOATIVO'
      FieldName = 'TIPOATIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDbCompPerfilppField2: TppField
      FieldAlias = 'ATIVO'
      FieldName = 'ATIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  object dsCompPerfil: TwwDataSource
    DataSet = CdsCompPerfil
    Left = 293
    Top = 179
  end
  object CdsCompPerfil: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 293
    Top = 127
    object CdsCompPerfilTIPOATIVO: TStringField
      FieldName = 'TIPOATIVO'
      FixedChar = True
      Size = 66
    end
    object CdsCompPerfilATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 66
    end
  end
  object CdsAtivosEspecif: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 93
    Top = 126
    object CdsAtivosEspecifDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 11
      FieldName = 'DATA'
    end
    object CdsAtivosEspecifATIVO: TStringField
      DisplayLabel = 'Ativo'
      DisplayWidth = 40
      FieldName = 'ATIVO'
      Size = 60
    end
    object CdsAtivosEspecifPLANO: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 36
      FieldName = 'PLANO'
      Size = 50
    end
    object CdsAtivosEspecifPATRO: TStringField
      DisplayLabel = 'Patro'
      DisplayWidth = 34
      FieldName = 'PATRO'
      Size = 60
    end
    object CdsAtivosEspecifQTDCOTA: TFloatField
      DisplayLabel = 'Qtd. Cotas'
      DisplayWidth = 15
      FieldName = 'QTDCOTA'
      DisplayFormat = '#,#0.000000'
    end
    object CdsAtivosEspecifVLRCOTA: TFloatField
      DisplayLabel = 'Valor da Cota'
      DisplayWidth = 15
      FieldName = 'VLRCOTA'
      DisplayFormat = '#,#0.000000'
    end
    object CdsAtivosEspecifVLRCOTIZADO: TFloatField
      DisplayLabel = 'Valor Cotizado'
      DisplayWidth = 19
      FieldName = 'VLRCOTIZADO'
      DisplayFormat = '#,#0.00'
    end
    object CdsAtivosEspecifVLRRENTABILIZADO: TFloatField
      DisplayLabel = 'Valor Rentabilizado'
      DisplayWidth = 19
      FieldName = 'VLRRENTABILIZADO'
      DisplayFormat = '#,#0.00'
    end
    object CdsAtivosEspecifVLRPATRIMONIO: TFloatField
      DisplayLabel = 'Valor Patrimônio'
      DisplayWidth = 17
      FieldName = 'VLRPATRIMONIO'
      DisplayFormat = '#,#0.00'
    end
    object CdsAtivosEspecifORIGEMATIVO: TStringField
      DisplayLabel = 'Origem'
      DisplayWidth = 50
      FieldName = 'ORIGEMATIVO'
      Size = 143
    end
    object CdsAtivosEspecifIDCOTACOTACAO: TFloatField
      FieldName = 'IDCOTACOTACAO'
    end
  end
  object dsAtivosEspecif: TwwDataSource
    DataSet = CdsAtivosEspecif
    Left = 93
    Top = 178
  end
  object CdsAtivosConsolidados: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 197
    Top = 126
    object CdsAtivosConsolidadosDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 11
      FieldName = 'DATA'
      Origin = 'BASEDADOS.COTACOTACAO.DATA'
    end
    object CdsAtivosConsolidadosVLRPATRIMONIOINI: TFloatField
      DisplayLabel = 'Valor Patrimonio Inicial'
      DisplayWidth = 20
      FieldName = 'VLRPATRIMONIOINI'
      DisplayFormat = '#,#0.00'
    end
    object CdsAtivosConsolidadosVLRPATRIMONIOFIM: TFloatField
      DisplayLabel = 'Valor Patrimonio Final'
      DisplayWidth = 20
      FieldName = 'VLRPATRIMONIOFIM'
      DisplayFormat = '#,#0.00'
    end
    object CdsAtivosConsolidadosQTDCOTAFIM: TFloatField
      DisplayLabel = 'Qtd. Cotas'
      DisplayWidth = 17
      FieldName = 'QTDCOTAFIM'
      DisplayFormat = '#,#0.000000'
    end
    object CdsAtivosConsolidadosVLRCOTA: TFloatField
      DisplayLabel = 'Valor Cota'
      DisplayWidth = 15
      FieldName = 'VLRCOTA'
      DisplayFormat = '#,#0.000000'
    end
    object CdsAtivosConsolidadosVLRCOTIZADO: TFloatField
      DisplayLabel = 'Valor Cotizado'
      DisplayWidth = 15
      FieldName = 'VLRCOTIZADO'
      DisplayFormat = '#,#0.00'
    end
    object CdsAtivosConsolidadosVLRRENTABILIZADO: TFloatField
      DisplayLabel = 'Valor Rentabilizado'
      DisplayWidth = 10
      FieldName = 'VLRRENTABILIZADO'
      DisplayFormat = '#,#0.00'
    end
    object CdsAtivosConsolidadosGRUPO: TFloatField
      DisplayWidth = 10
      FieldName = 'GRUPO'
      Visible = False
    end
    object CdsAtivosConsolidadosQTDCOTAINI: TFloatField
      FieldName = 'QTDCOTAINI'
      Visible = False
      DisplayFormat = '#,#0.000000'
    end
    object CdsAtivosConsolidadosPERCENTDIA: TFloatField
      FieldName = 'PERCENTDIA'
      Visible = False
    end
    object CdsAtivosConsolidadosPERCENTPERIODO: TFloatField
      FieldName = 'PERCENTPERIODO'
      Visible = False
    end
  end
  object dsAtivosConsolidados: TwwDataSource
    DataSet = CdsAtivosConsolidados
    Left = 194
    Top = 178
  end
  object rpRelPerfilConsolidado: TppReport
    OnEndPage = rpRelPerfilConsolidado1EndPage
    OnStartPage = rpRelPerfilConsolidado1StartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Perfil Consolidado'
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
    DeviceType = 'ExcelFile'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 193
    Top = 17
    Version = '7.04'
    mmColumnWidth = 0
    object ppHeaderBand2: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 34660
      mmPrintPosition = 0
      object ppLabel50: TppLabel
        UserName = 'LCarteira'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 271198
        mmTop = 12171
        mmWidth = 11906
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplDadosFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplDadosFundacao'
        mmHeight = 13229
        mmLeft = 1852
        mmTop = 1588
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel4: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa1'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 23813
        mmTop = 2381
        mmWidth = 165365
        BandType = 0
      end
      object ppLabel5: TppLabel
        OnPrint = ppLabel12Print
        UserName = 'Label12'
        Caption = 'Título do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 23813
        mmTop = 8731
        mmWidth = 31221
        BandType = 0
      end
      object ppLbDescPerfil: TppLabel
        UserName = 'ppLbDescPerfil'
        Caption = 'ppLbDescPerfil'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 23548
        mmTop = 14023
        mmWidth = 23283
        BandType = 0
      end
      object ppLbPeriodo: TppLabel
        UserName = 'ppLbPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 23548
        mmTop = 19050
        mmWidth = 11113
        BandType = 0
      end
      object lnCabecalho: TppLine
        UserName = 'lnCabecalho'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 23283
        mmWidth = 197300
        BandType = 0
      end
      object ppLPlano: TppLabel
        UserName = 'ppLPlano'
        Caption = 'Plano'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 23548
        mmTop = 23548
        mmWidth = 8202
        BandType = 0
      end
      object ppLPatro: TppLabel
        UserName = 'ppLPatro'
        Caption = 'Patrocinadora'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 23548
        mmTop = 28046
        mmWidth = 19844
        BandType = 0
      end
      object ppLPlanoSPC: TppLabel
        UserName = 'ppLPlanoSPC'
        Caption = 'Plano SPC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 173038
        mmTop = 23548
        mmWidth = 16140
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
      object srptMovimentacao: TppSubReport
        OnPrint = srptMovimentacaoPrint
        UserName = 'srptMovimentacao'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = srptComposicao
        TraverseAllData = False
        DataPipelineName = 'plAtivosConsolidados'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 4498
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport4: TppChildReport
          AutoStop = False
          DataPipeline = plAtivosConsolidados
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Perfil Consolidado'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 160
          Top = 120
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'plAtivosConsolidados'
          object bndCabMovimentacao: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 19315
            mmPrintPosition = 0
            object ppLabel64: TppLabel
              UserName = 'Label1'
              Caption = 'Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 3440
              mmTop = 14552
              mmWidth = 5292
              BandType = 0
            end
            object ppLine11: TppLine
              UserName = 'Line1'
              Pen.Width = 3
              ParentWidth = True
              Weight = 2.25
              mmHeight = 1323
              mmLeft = 0
              mmTop = 17992
              mmWidth = 197300
              BandType = 0
            end
            object ppLabel65: TppLabel
              UserName = 'Label2'
              Caption = 'Patrimônio Inicial'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 30692
              mmTop = 14552
              mmWidth = 18521
              BandType = 0
            end
            object ppLabel66: TppLabel
              UserName = 'Label3'
              Caption = 'Patrimônio Final'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 60061
              mmTop = 14552
              mmWidth = 17727
              BandType = 0
            end
            object ppLabel67: TppLabel
              UserName = 'Label4'
              Caption = 'Vlr. Cotizado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 88371
              mmTop = 14552
              mmWidth = 14023
              BandType = 0
            end
            object ppLabel68: TppLabel
              UserName = 'Label5'
              Caption = 'Vlr. Rentab.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 113242
              mmTop = 14552
              mmWidth = 12965
              BandType = 0
            end
            object ppLabel69: TppLabel
              UserName = 'Label6'
              Caption = 'Qtd. Cotas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 134673
              mmTop = 14552
              mmWidth = 11642
              BandType = 0
            end
            object ppLabel70: TppLabel
              UserName = 'Label7'
              Caption = 'Valor da Cota'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 153723
              mmTop = 14552
              mmWidth = 14817
              BandType = 0
            end
            object ppLabel71: TppLabel
              UserName = 'Label8'
              Caption = '% Dia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 177007
              mmTop = 14552
              mmWidth = 6615
              BandType = 0
            end
            object ppLabel72: TppLabel
              UserName = 'Label9'
              Caption = '% Período'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 186267
              mmTop = 14552
              mmWidth = 11377
              BandType = 0
            end
            object ppLabel73: TppLabel
              UserName = 'Label10'
              AutoSize = False
              Caption = 'Movimentação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 5027
              mmLeft = 265
              mmTop = 7408
              mmWidth = 197380
              BandType = 0
            end
          end
          object ppDetailBand7: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 7144
            mmPrintPosition = 0
            object shpDetMovimento: TppShape
              OnPrint = ShapePrint
              UserName = 'shpDetMovimento'
              Brush.Color = 13040076
              ParentWidth = True
              Pen.Style = psClear
              mmHeight = 3704
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 4
            end
            object srptDetDrillMov: TppSubReport
              OnPrint = srptDetalheCotaPrint
              UserName = 'srptDetDrillMov'
              DrillDownComponent = linDrilDowMovimento
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              TraverseAllData = False
              DataPipelineName = 'plAtivosEspecif'
              mmHeight = 3704
              mmLeft = 0
              mmTop = 3440
              mmWidth = 197300
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppChildReport2: TppChildReport
                AutoStop = False
                DataPipeline = plAtivosEspecif
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'Perfil Consolidado'
                PrinterSetup.PaperName = 'A4'
                PrinterSetup.PrinterName = 'Default'
                PrinterSetup.mmMarginBottom = 6350
                PrinterSetup.mmMarginLeft = 6350
                PrinterSetup.mmMarginRight = 6350
                PrinterSetup.mmMarginTop = 6350
                PrinterSetup.mmPaperHeight = 297000
                PrinterSetup.mmPaperWidth = 210000
                PrinterSetup.PaperSize = 9
                Left = 488
                Top = 328
                Version = '7.04'
                mmColumnWidth = 0
                DataPipelineName = 'plAtivosEspecif'
                object ppTitleBand6: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
                object bndCabMovimento: TppHeaderBand
                  mmBottomOffset = 0
                  mmHeight = 4763
                  mmPrintPosition = 0
                  object ppShape25: TppShape
                    UserName = 'Shape2'
                    Brush.Color = clSilver
                    Pen.Style = psClear
                    mmHeight = 3440
                    mmLeft = 6615
                    mmTop = 529
                    mmWidth = 190765
                    BandType = 0
                  end
                  object ppLabel54: TppLabel
                    UserName = 'Label7'
                    Caption = 'Ativo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 6
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2381
                    mmLeft = 6879
                    mmTop = 1058
                    mmWidth = 4763
                    BandType = 0
                  end
                  object ppLabel55: TppLabel
                    UserName = 'Label8'
                    Caption = 'Qtd. de Cotas'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 6
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    mmHeight = 2381
                    mmLeft = 112184
                    mmTop = 1058
                    mmWidth = 13229
                    BandType = 0
                  end
                  object ppLabel56: TppLabel
                    UserName = 'Label9'
                    Caption = 'Vlr. da Cota'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 6
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    mmHeight = 2381
                    mmLeft = 131498
                    mmTop = 1058
                    mmWidth = 11377
                    BandType = 0
                  end
                  object ppLabel57: TppLabel
                    UserName = 'Label10'
                    Caption = 'Vlr. Cotizado'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 6
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    mmHeight = 2381
                    mmLeft = 148167
                    mmTop = 1058
                    mmWidth = 12171
                    BandType = 0
                  end
                  object ppLabel58: TppLabel
                    UserName = 'Label1'
                    Caption = 'Vlr. Patrimônio'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 6
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    mmHeight = 2381
                    mmLeft = 182827
                    mmTop = 1058
                    mmWidth = 14023
                    BandType = 0
                  end
                  object ppLabel59: TppLabel
                    UserName = 'Label17'
                    Caption = 'Plano'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 6
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2381
                    mmLeft = 41275
                    mmTop = 1058
                    mmWidth = 5556
                    BandType = 0
                  end
                  object ppLabel60: TppLabel
                    UserName = 'Label18'
                    Caption = 'Patro'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 6
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2381
                    mmLeft = 74613
                    mmTop = 1058
                    mmWidth = 5027
                    BandType = 0
                  end
                  object ppLabel61: TppLabel
                    UserName = 'Label23'
                    Caption = 'Vlr. Rentab.'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 6
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    mmHeight = 2381
                    mmLeft = 165629
                    mmTop = 1058
                    mmWidth = 11377
                    BandType = 0
                  end
                end
                object ppDetailBand6: TppDetailBand
                  PrintHeight = phDynamic
                  mmBottomOffset = 0
                  mmHeight = 7144
                  mmPrintPosition = 0
                  object lnDrillFluxo: TppLine
                    UserName = 'lnDrillFluxo'
                    Pen.Style = psClear
                    Weight = 0.75
                    mmHeight = 3704
                    mmLeft = 265
                    mmTop = 0
                    mmWidth = 197380
                    BandType = 4
                  end
                  object ppDBText3: TppDBText
                    UserName = 'DBText9'
                    DataField = 'ATIVO'
                    DataPipeline = plAtivosEspecif
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 6
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'plAtivosEspecif'
                    mmHeight = 2381
                    mmLeft = 6879
                    mmTop = 794
                    mmWidth = 33602
                    BandType = 4
                  end
                  object ppDBText4: TppDBText
                    UserName = 'DBText10'
                    DataField = 'QTDCOTA'
                    DataPipeline = plAtivosEspecif
                    DisplayFormat = '#,#0.000000'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 6
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'plAtivosEspecif'
                    mmHeight = 2646
                    mmLeft = 105304
                    mmTop = 529
                    mmWidth = 20108
                    BandType = 4
                  end
                  object ppDBText5: TppDBText
                    UserName = 'DBText11'
                    DataField = 'VLRCOTA'
                    DataPipeline = plAtivosEspecif
                    DisplayFormat = '#,#0.000000'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 6
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'plAtivosEspecif'
                    mmHeight = 2646
                    mmLeft = 128059
                    mmTop = 529
                    mmWidth = 14817
                    BandType = 4
                  end
                  object ppDBText6: TppDBText
                    UserName = 'DBText12'
                    AutoSize = True
                    DataField = 'VLRCOTIZADO'
                    DataPipeline = plAtivosEspecif
                    DisplayFormat = '#,#0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 6
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'plAtivosEspecif'
                    mmHeight = 2381
                    mmLeft = 145257
                    mmTop = 794
                    mmWidth = 15081
                    BandType = 4
                  end
                  object ppDBText7: TppDBText
                    UserName = 'DBText16'
                    AutoSize = True
                    DataField = 'VLRPATRIMONIO'
                    DataPipeline = plAtivosEspecif
                    DisplayFormat = '#,#0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 6
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'plAtivosEspecif'
                    mmHeight = 2381
                    mmLeft = 179388
                    mmTop = 794
                    mmWidth = 17463
                    BandType = 4
                  end
                  object ppDBText8: TppDBText
                    UserName = 'DBText8'
                    DataField = 'PLANO'
                    DataPipeline = plAtivosEspecif
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 6
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'plAtivosEspecif'
                    mmHeight = 2381
                    mmLeft = 41275
                    mmTop = 794
                    mmWidth = 31750
                    BandType = 4
                  end
                  object ppDBText9: TppDBText
                    UserName = 'DBText13'
                    DataField = 'PATRO'
                    DataPipeline = plAtivosEspecif
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 6
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'plAtivosEspecif'
                    mmHeight = 2381
                    mmLeft = 74613
                    mmTop = 794
                    mmWidth = 25665
                    BandType = 4
                  end
                  object ppDBText10: TppDBText
                    UserName = 'DBText18'
                    DataField = 'VLRRENTABILIZADO'
                    DataPipeline = plAtivosEspecif
                    DisplayFormat = '#,#0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 6
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'plAtivosEspecif'
                    mmHeight = 2381
                    mmLeft = 162454
                    mmTop = 794
                    mmWidth = 14552
                    BandType = 4
                  end
                  object srptFluxoCota: TppSubReport
                    OnPrint = srptFluxoCotaPrint
                    UserName = 'srptFluxoCota'
                    DrillDownComponent = lnDrillFluxo
                    ExpandAll = False
                    NewPrintJob = False
                    OutlineSettings.CreateNode = True
                    TraverseAllData = False
                    DataPipelineName = 'plFluxoCota'
                    mmHeight = 3704
                    mmLeft = 0
                    mmTop = 3440
                    mmWidth = 197300
                    BandType = 4
                    mmBottomOffset = 0
                    mmOverFlowOffset = 0
                    mmStopPosition = 0
                    object ppChildReport5: TppChildReport
                      AutoStop = False
                      DataPipeline = plFluxoCota
                      PrinterSetup.BinName = 'Default'
                      PrinterSetup.DocumentName = 'Perfil Consolidado'
                      PrinterSetup.PaperName = 'A4'
                      PrinterSetup.PrinterName = 'Default'
                      PrinterSetup.mmMarginBottom = 6350
                      PrinterSetup.mmMarginLeft = 6350
                      PrinterSetup.mmMarginRight = 6350
                      PrinterSetup.mmMarginTop = 6350
                      PrinterSetup.mmPaperHeight = 297000
                      PrinterSetup.mmPaperWidth = 210000
                      PrinterSetup.PaperSize = 9
                      Left = 232
                      Top = 120
                      Version = '7.04'
                      mmColumnWidth = 0
                      DataPipelineName = 'plFluxoCota'
                      object bndCabFluxoCota: TppTitleBand
                        mmBottomOffset = 0
                        mmHeight = 0
                        mmPrintPosition = 0
                      end
                      object bndCabFluxo: TppHeaderBand
                        mmBottomOffset = 0
                        mmHeight = 4233
                        mmPrintPosition = 0
                        object ppShape1: TppShape
                          UserName = 'Shape1'
                          Brush.Color = clSilver
                          Pen.Style = psClear
                          mmHeight = 3440
                          mmLeft = 73025
                          mmTop = 529
                          mmWidth = 123825
                          BandType = 0
                        end
                        object ppLabel7: TppLabel
                          UserName = 'Label101'
                          Caption = 'Vlr. Cotizado'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 6
                          Font.Style = []
                          TextAlignment = taRightJustified
                          Transparent = True
                          mmHeight = 2381
                          mmLeft = 148166
                          mmTop = 1058
                          mmWidth = 12171
                          BandType = 0
                        end
                        object ppLabel12: TppLabel
                          UserName = 'Label6'
                          Caption = 'Histórico'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 6
                          Font.Style = []
                          Transparent = True
                          mmHeight = 2381
                          mmLeft = 74613
                          mmTop = 1058
                          mmWidth = 8467
                          BandType = 0
                        end
                        object ppLabel13: TppLabel
                          UserName = 'Label13'
                          Caption = 'Vlr. Rentab.'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 6
                          Font.Style = []
                          TextAlignment = taRightJustified
                          Transparent = True
                          mmHeight = 2381
                          mmLeft = 165629
                          mmTop = 1058
                          mmWidth = 11377
                          BandType = 0
                        end
                      end
                      object ppDetailBand4: TppDetailBand
                        mmBottomOffset = 0
                        mmHeight = 3704
                        mmPrintPosition = 0
                        object ppShape4: TppShape
                          OnPrint = ShapePrint
                          UserName = 'shpDetMovimento1'
                          Brush.Color = 13040076
                          Pen.Style = psClear
                          mmHeight = 3704
                          mmLeft = 73025
                          mmTop = 0
                          mmWidth = 123825
                          BandType = 4
                        end
                        object ppDBText20: TppDBText
                          UserName = 'DBText20'
                          DataField = 'HISTORICO'
                          DataPipeline = plFluxoCota
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 6
                          Font.Style = []
                          Transparent = True
                          DataPipelineName = 'plFluxoCota'
                          mmHeight = 2381
                          mmLeft = 74613
                          mmTop = 265
                          mmWidth = 69321
                          BandType = 4
                        end
                        object ppDBText2: TppDBText
                          UserName = 'DBText1'
                          AutoSize = True
                          DataField = 'VALORCOTIZADO'
                          DataPipeline = plFluxoCota
                          DisplayFormat = '#,#0.00'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 6
                          Font.Style = []
                          TextAlignment = taRightJustified
                          Transparent = True
                          DataPipelineName = 'plFluxoCota'
                          mmHeight = 2498
                          mmLeft = 149669
                          mmTop = 265
                          mmWidth = 10668
                          BandType = 4
                        end
                        object ppDBText19: TppDBText
                          UserName = 'DBText19'
                          DataField = 'VALORRENTABILIZADO'
                          DataPipeline = plFluxoCota
                          DisplayFormat = '#,#0.00'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 6
                          Font.Style = []
                          TextAlignment = taRightJustified
                          Transparent = True
                          DataPipelineName = 'plFluxoCota'
                          mmHeight = 2381
                          mmLeft = 162454
                          mmTop = 265
                          mmWidth = 14552
                          BandType = 4
                        end
                      end
                      object ppSummaryBand2: TppSummaryBand
                        mmBottomOffset = 0
                        mmHeight = 6085
                        mmPrintPosition = 0
                        object ppLine2: TppLine
                          UserName = 'Line1'
                          Position = lpBottom
                          Weight = 0.75
                          mmHeight = 2381
                          mmLeft = 73025
                          mmTop = 2117
                          mmWidth = 123825
                          BandType = 7
                        end
                        object ppDBCalc1: TppDBCalc
                          UserName = 'DBCalc1'
                          DataField = 'VALORCOTIZADO'
                          DataPipeline = plFluxoCota
                          DisplayFormat = '#,#0.00'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 6
                          Font.Style = []
                          TextAlignment = taRightJustified
                          Transparent = True
                          DataPipelineName = 'plFluxoCota'
                          mmHeight = 2381
                          mmLeft = 143140
                          mmTop = 529
                          mmWidth = 17198
                          BandType = 7
                        end
                        object ppDBCalc2: TppDBCalc
                          UserName = 'DBCalc2'
                          DataField = 'VALORRENTABILIZADO'
                          DataPipeline = plFluxoCota
                          DisplayFormat = '#,#0.00'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 6
                          Font.Style = []
                          TextAlignment = taRightJustified
                          Transparent = True
                          DataPipelineName = 'plFluxoCota'
                          mmHeight = 2381
                          mmLeft = 161661
                          mmTop = 529
                          mmWidth = 15346
                          BandType = 7
                        end
                      end
                      object raCodeModule1: TraCodeModule
                        ProgramStream = {00}
                      end
                    end
                  end
                end
                object ppSummaryBand3: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 3969
                  mmPrintPosition = 0
                  object ppLine8: TppLine
                    UserName = 'Line1'
                    Position = lpBottom
                    Weight = 0.75
                    mmHeight = 2381
                    mmLeft = 6615
                    mmTop = 0
                    mmWidth = 190765
                    BandType = 7
                  end
                end
                object raCodeModule2: TraCodeModule
                  ProgramStream = {00}
                end
              end
            end
            object ppDBText11: TppDBText
              UserName = 'DBText1'
              DataField = 'DATA'
              DataPipeline = plAtivosConsolidados
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plAtivosConsolidados'
              mmHeight = 2910
              mmLeft = 3440
              mmTop = 265
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText2'
              AutoSize = True
              DataField = 'VLRPATRIMONIOINI'
              DataPipeline = plAtivosConsolidados
              DisplayFormat = '#,#0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plAtivosConsolidados'
              mmHeight = 2910
              mmLeft = 25929
              mmTop = 265
              mmWidth = 23283
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'DBText3'
              DataField = 'QTDCOTAFIM'
              DataPipeline = plAtivosConsolidados
              DisplayFormat = '#,#0.000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plAtivosConsolidados'
              mmHeight = 2910
              mmLeft = 128059
              mmTop = 265
              mmWidth = 18256
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText301'
              AutoSize = True
              DataField = 'VLRPATRIMONIOFIM'
              DataPipeline = plAtivosConsolidados
              DisplayFormat = '#,#0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plAtivosConsolidados'
              mmHeight = 2910
              mmLeft = 53446
              mmTop = 265
              mmWidth = 24342
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText4'
              DataField = 'VLRCOTA'
              DataPipeline = plAtivosConsolidados
              DisplayFormat = '#,#0.000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plAtivosConsolidados'
              mmHeight = 2910
              mmLeft = 148167
              mmTop = 265
              mmWidth = 20373
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText5'
              DataField = 'VLRCOTIZADO'
              DataPipeline = plAtivosConsolidados
              DisplayFormat = '#,#0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plAtivosConsolidados'
              mmHeight = 2910
              mmLeft = 82286
              mmTop = 265
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText6'
              DataField = 'PERCENTPERIODO'
              DataPipeline = plAtivosConsolidados
              DisplayFormat = '#,#0.0000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plAtivosConsolidados'
              mmHeight = 2910
              mmLeft = 184680
              mmTop = 265
              mmWidth = 12965
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText7'
              DataField = 'PERCENTDIA'
              DataPipeline = plAtivosConsolidados
              DisplayFormat = '#,#0.0000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plAtivosConsolidados'
              mmHeight = 2910
              mmLeft = 170392
              mmTop = 265
              mmWidth = 13229
              BandType = 4
            end
            object ppDBText38: TppDBText
              UserName = 'DBText8'
              DataField = 'VLRRENTABILIZADO'
              DataPipeline = plAtivosConsolidados
              DisplayFormat = '#,#0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plAtivosConsolidados'
              mmHeight = 2910
              mmLeft = 105569
              mmTop = 265
              mmWidth = 20638
              BandType = 4
            end
            object linDrilDowMovimento: TppLine
              UserName = 'linDrilDowMovimento'
              Pen.Style = psClear
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 265
              mmTop = 0
              mmWidth = 197380
              BandType = 4
            end
          end
          object ppSummaryBand5: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object raCodeModule3: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
      object srptComposicao: TppSubReport
        OnPrint = srptComposicaoPrint
        UserName = 'srptComposicao'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppDbCompPerfil'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDbCompPerfil
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Perfil Consolidado'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 320
          Top = 224
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppDbCompPerfil'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 27517
            mmPrintPosition = 0
            object ppShape2: TppShape
              UserName = 'Shape1'
              mmHeight = 15875
              mmLeft = 265
              mmTop = 10583
              mmWidth = 195527
              BandType = 1
            end
            object ppShape3: TppShape
              UserName = 'Shape2'
              mmHeight = 6879
              mmLeft = 165894
              mmTop = 18785
              mmWidth = 29898
              BandType = 1
            end
            object ppShape15: TppShape
              UserName = 'Shape3'
              mmHeight = 6879
              mmLeft = 108215
              mmTop = 18785
              mmWidth = 29104
              BandType = 1
            end
            object ppShape16: TppShape
              UserName = 'Shape4'
              mmHeight = 6350
              mmLeft = 165894
              mmTop = 11642
              mmWidth = 29898
              BandType = 1
            end
            object ppShape17: TppShape
              UserName = 'Shape5'
              mmHeight = 6350
              mmLeft = 137848
              mmTop = 11642
              mmWidth = 29104
              BandType = 1
            end
            object ppShape18: TppShape
              UserName = 'Shape6'
              mmHeight = 6350
              mmLeft = 108215
              mmTop = 11642
              mmWidth = 29104
              BandType = 1
            end
            object ppShape19: TppShape
              UserName = 'Shape7'
              mmHeight = 6350
              mmLeft = 77788
              mmTop = 11642
              mmWidth = 29898
              BandType = 1
            end
            object ppShape20: TppShape
              UserName = 'Shape8'
              mmHeight = 6350
              mmLeft = 3969
              mmTop = 11642
              mmWidth = 73290
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label3'
              AutoSize = False
              Caption = 'Variação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 5027
              mmLeft = 265
              mmTop = 2117
              mmWidth = 197115
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label4'
              Caption = 'Indicador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 5292
              mmTop = 14023
              mmWidth = 11642
              BandType = 1
            end
            object ppShape21: TppShape
              UserName = 'Shape9'
              mmHeight = 6879
              mmLeft = 3969
              mmTop = 18785
              mmWidth = 73290
              BandType = 1
            end
            object ppLbIndicador: TppLabel
              UserName = 'ppLbIndicador'
              AutoSize = False
              Caption = 'LbIndicador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 5292
              mmTop = 20902
              mmWidth = 70379
              BandType = 1
            end
            object ppLabel14: TppLabel
              UserName = 'Label5'
              Caption = 'Taxa de Juros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 79111
              mmTop = 14023
              mmWidth = 17992
              BandType = 1
            end
            object ppShape22: TppShape
              UserName = 'Shape101'
              mmHeight = 6879
              mmLeft = 77788
              mmTop = 18785
              mmWidth = 29898
              BandType = 1
            end
            object ppLbTxJuros: TppLabel
              UserName = 'ppLbTxJuros'
              AutoSize = False
              Caption = 'LbTxJuros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 79111
              mmTop = 20902
              mmWidth = 27517
              BandType = 1
            end
            object ppLbIndJuros: TppLabel
              UserName = 'ppLbIndJuros'
              AutoSize = False
              Caption = 'LbIndJuros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 109802
              mmTop = 20902
              mmWidth = 26458
              BandType = 1
            end
            object ppLabel17: TppLabel
              UserName = 'Label6'
              Caption = 'Indicador + Juros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 109538
              mmTop = 14023
              mmWidth = 21960
              BandType = 1
            end
            object ppLabel18: TppLabel
              UserName = 'Label7'
              Caption = 'Valorização da Cota'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 139171
              mmTop = 14023
              mmWidth = 25400
              BandType = 1
            end
            object ppShape23: TppShape
              UserName = 'Shape102'
              mmHeight = 6879
              mmLeft = 137848
              mmTop = 18785
              mmWidth = 29104
              BandType = 1
            end
            object ppLbVlrCota: TppLabel
              UserName = 'ppLbVlrCota'
              AutoSize = False
              Caption = 'LbVlrCota'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 139436
              mmTop = 20902
              mmWidth = 25665
              BandType = 1
            end
            object ppLbSobreInd: TppLabel
              UserName = 'ppLbSobreInd'
              AutoSize = False
              Caption = 'LbSobreInd'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 168011
              mmTop = 20902
              mmWidth = 26194
              BandType = 1
            end
            object ppLabel22: TppLabel
              UserName = 'Label8'
              Caption = '% sobre Indicador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 168540
              mmTop = 14023
              mmWidth = 22754
              BandType = 1
            end
          end
          object bndCabPerfil: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 22225
            mmPrintPosition = 0
            object ppLabel52: TppLabel
              UserName = 'Label1'
              Caption = 'Tipo de Ativo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 3440
              mmTop = 17198
              mmWidth = 14288
              BandType = 0
            end
            object ppLine6: TppLine
              UserName = 'Line1'
              Pen.Width = 3
              ParentWidth = True
              Weight = 2.25
              mmHeight = 1852
              mmLeft = 0
              mmTop = 20373
              mmWidth = 197300
              BandType = 0
            end
            object ppLabel51: TppLabel
              UserName = 'Label302'
              AutoSize = False
              Caption = 'Composição do Perfil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 5027
              mmLeft = 529
              mmTop = 9525
              mmWidth = 197115
              BandType = 0
            end
          end
          object ppDetailBand2: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 7673
            mmPrintPosition = 0
            object shpDetComposicao: TppShape
              OnPrint = ShapePrint
              UserName = 'shpDetComposicao'
              Brush.Color = 13040076
              ParentWidth = True
              Pen.Style = psClear
              mmHeight = 3704
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 4
            end
            object srptComposicaoDet: TppSubReport
              OnPrint = srptComposicaoDetPrint
              UserName = 'srptComposicaoDet'
              DrillDownComponent = dbtTipoAtivo
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              TraverseAllData = False
              DataPipelineName = 'ppDbCompPerfilDet'
              mmHeight = 4763
              mmLeft = 0
              mmTop = 2910
              mmWidth = 197300
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppChildReport3: TppChildReport
                AutoStop = False
                DataPipeline = ppDbCompPerfilDet
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'Perfil Consolidado'
                PrinterSetup.PaperName = 'A4'
                PrinterSetup.PrinterName = 'Default'
                PrinterSetup.mmMarginBottom = 6350
                PrinterSetup.mmMarginLeft = 6350
                PrinterSetup.mmMarginRight = 6350
                PrinterSetup.mmMarginTop = 6350
                PrinterSetup.mmPaperHeight = 297000
                PrinterSetup.mmPaperWidth = 210000
                PrinterSetup.PaperSize = 9
                Left = 200
                Top = 120
                Version = '7.04'
                mmColumnWidth = 0
                DataPipelineName = 'ppDbCompPerfilDet'
                object bndCabCompDet: TppHeaderBand
                  mmBottomOffset = 0
                  mmHeight = 4498
                  mmPrintPosition = 0
                  object shpCabCompDet: TppShape
                    UserName = 'shpCabCompDet'
                    Brush.Color = clSilver
                    Pen.Style = psClear
                    mmHeight = 3969
                    mmLeft = 75936
                    mmTop = 529
                    mmWidth = 121444
                    BandType = 0
                  end
                  object ppLabel1: TppLabel
                    UserName = 'Label1'
                    Caption = 'Ativo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2910
                    mmLeft = 75936
                    mmTop = 794
                    mmWidth = 5556
                    BandType = 0
                  end
                end
                object ppDetailBand1: TppDetailBand
                  mmBottomOffset = 0
                  mmHeight = 2910
                  mmPrintPosition = 0
                  object shpDetCompDet: TppShape
                    OnPrint = ShapePrint
                    UserName = 'shpDetCompDet'
                    Brush.Color = 13040076
                    Pen.Style = psClear
                    mmHeight = 3175
                    mmLeft = 75936
                    mmTop = 0
                    mmWidth = 121444
                    BandType = 4
                  end
                  object ppDBText1: TppDBText
                    UserName = 'DBText1'
                    DataField = 'ATIVO'
                    DataPipeline = ppDbCompPerfilDet
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppDbCompPerfilDet'
                    mmHeight = 2910
                    mmLeft = 75936
                    mmTop = 0
                    mmWidth = 121179
                    BandType = 4
                  end
                end
                object ppSummaryBand1: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 1058
                  mmPrintPosition = 0
                  object ppLine1: TppLine
                    UserName = 'Line1'
                    Weight = 0.75
                    mmHeight = 794
                    mmLeft = 75936
                    mmTop = 264
                    mmWidth = 121444
                    BandType = 7
                  end
                end
              end
            end
            object dbtTipoAtivo: TppDBText
              UserName = 'DBText36'
              DataField = 'TIPOATIVO'
              DataPipeline = ppDbCompPerfil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              SuppressRepeatedValues = True
              Transparent = True
              DataPipelineName = 'ppDbCompPerfil'
              mmHeight = 2910
              mmLeft = 3440
              mmTop = 265
              mmWidth = 67998
              BandType = 4
            end
          end
        end
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLabel62: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema1'
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
        mmTop = 1588
        mmWidth = 196321
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
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
        mmLeft = 529
        mmTop = 1588
        mmWidth = 196057
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
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
        mmLeft = 170392
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
      object ppLine10: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
    end
    object ppSummaryBand4: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 73025
      mmPrintPosition = 0
      object ppDPTeeChart2: TppDPTeeChart
        UserName = 'DPTeeChart1'
        mmHeight = 56886
        mmLeft = 1588
        mmTop = 13758
        mmWidth = 196057
        BandType = 7
        object ppDPTeeChartControl2: TppDPTeeChartControl
          Left = 0
          Top = 0
          Width = 400
          Height = 250
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -16
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.Text.Strings = (
            '')
          Title.Visible = False
          BottomAxis.DateTimeFormat = 'dd/mm/yyyy'
          Chart3DPercent = 5
          LeftAxis.PositionPercent = -2
          Legend.TextStyle = ltsRightValue
          Legend.Visible = False
          BevelOuter = bvNone
          Color = clWhite
          object LineSeries1: TLineSeries
            Tag = 3
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = plAtivosConsolidados
            SeriesColor = clRed
            XLabelsSource = 'DATA'
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            XValues.ValueSource = 'DATA'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1
            YValues.Order = loNone
            YValues.ValueSource = 'VLRCOTA'
          end
        end
      end
      object ppLabel63: TppLabel
        UserName = 'Label301'
        AutoSize = False
        Caption = 'Gráfico da Variação da Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 7673
        mmWidth = 197380
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'GRUPO'
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object raCodeModule4: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDbCompPerfilDet: TppDBPipeline
    DataSource = dsCompPerfilDet
    UserName = 'DbCompPerfil1'
    Left = 389
    Top = 72
    object ppField1: TppField
      FieldAlias = 'TIPOATIVO'
      FieldName = 'TIPOATIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppField2: TppField
      FieldAlias = 'ATIVO'
      FieldName = 'ATIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  object dsCompPerfilDet: TwwDataSource
    DataSet = CdsCompPerfilDet
    Left = 389
    Top = 179
  end
  object CdsCompPerfilDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 389
    Top = 127
    object StringField1: TStringField
      FieldName = 'TIPOATIVO'
      FixedChar = True
      Size = 66
    end
    object StringField2: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 66
    end
  end
  object plFluxoCota: TppDBPipeline
    DataSource = dsFluxoCota
    UserName = 'plFluxoCota'
    Left = 26
    Top = 73
    object plFluxoCotappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCOTACOTACAO'
      FieldName = 'IDCOTACOTACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object plFluxoCotappField2: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 200
      DisplayWidth = 200
      Position = 1
    end
    object plFluxoCotappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORCOTIZADO'
      FieldName = 'VALORCOTIZADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object plFluxoCotappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRENTABILIZADO'
      FieldName = 'VALORRENTABILIZADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object plFluxoCotappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object plFluxoCotappField6: TppField
      FieldAlias = 'FLGCOTA'
      FieldName = 'FLGCOTA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
  end
  object cdsFluxoCota: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 29
    Top = 126
    Data = {
      310C00009619E0BD010000001800000006002900000003000000CE000D494443
      4F5441434F544143414F080004000000000009484953544F5249434F01004900
      0000010005574944544802000200C8000D56414C4F52434F54495A41444F0800
      0400000000001256414C4F5252454E544142494C495A41444F08000400000000
      000556414C4F52080004000000000007464C47434F5441010049000000020007
      53554254595045020049000A0046697865644368617200055749445448020002
      0001000100044C434944040001000908000000000000000000471D6B412C4356
      202D20434F4D5052412044452041434F45532041205649535441202F20474552
      444155204D455420504E0000000078D0214100000000000000000000000078D0
      2141014300000000000000471D6B411A436F727265746167656D202F20474552
      444155204D455420504E8FC2F528DCD4A64000000000000000008FC2F528DCD4
      A640014300000000000000471D6B41244465766F6C7563616F20436F72726574
      6167656D202F20474552444155204D455420504E7B14AE47618CA4C000000000
      000000007B14AE47618CA4C0014300000000000000471D6B411B456D6F6C756D
      656E746F73202F20474552444155204D455420504E52B81E85EB896940000000
      000000000052B81E85EB896940014300000000000000471D6B412C4356202D20
      434F4D5052412044452041434F45532041205649535441202F20474552444155
      204D455420504E00000000C035D440000000000000000000000000C035D44001
      4300000000000000471D6B411A436F727265746167656D202F20474552444155
      204D455420504ED7A3703D0AE759400000000000000000D7A3703D0AE7594001
      4300000000000000471D6B41244465766F6C7563616F20436F72726574616765
      6D202F20474552444155204D455420504E00000000005057C000000000000000
      0000000000005057C0014300000000000000471D6B411B456D6F6C756D656E74
      6F73202F20474552444155204D455420504EF6285C8FC2F51C40000000000000
      0000F6285C8FC2F51C40014300000000000000471D6B412C4356202D20434F4D
      5052412044452041434F45532041205649535441202F20474552444155204D45
      5420504E00000000904B0F41000000000000000000000000904B0F4101430000
      0000000000471D6B411A436F727265746167656D202F20474552444155204D45
      5420504E295C8FC2F50D94400000000000000000295C8FC2F50D944001430000
      0000000000471D6B41244465766F6C7563616F20436F727265746167656D202F
      20474552444155204D455420504EC3F5285C8F0C92C00000000000000000C3F5
      285C8F0C92C0014300000000000000471D6B411B456D6F6C756D656E746F7320
      2F20474552444155204D455420504E1F85EB51B86E564000000000000000001F
      85EB51B86E5640014300000000000000471D6B412C4356202D20434F4D505241
      2044452041434F45532041205649535441202F20474552444155204D45542050
      4E0000000030A5114100000000000000000000000030A5114101430000000000
      0000471D6B411A436F727265746167656D202F20474552444155204D45542050
      4E67666666669D9640000000000000000067666666669D964001430000000000
      0000471D6B41244465766F6C7563616F20436F727265746167656D202F204745
      52444155204D455420504E3E0AD7A3705A94C000000000000000003E0AD7A370
      5A94C0014300000000000000471D6B411B456D6F6C756D656E746F73202F2047
      4552444155204D455420504E5C8FC2F5284C594000000000000000005C8FC2F5
      284C5940014300000000000000471D6B412C4356202D20434F4D505241204445
      2041434F45532041205649535441202F20474552444155204D455420504E0000
      000060671A4100000000000000000000000060671A4101430000000000000047
      1D6B411A436F727265746167656D202F20474552444155204D455420504EEC51
      B81E85EBA0400000000000000000EC51B81E85EBA04001430000000000000047
      1D6B41244465766F6C7563616F20436F727265746167656D202F204745524441
      55204D455420504E1F85EB51B8749EC000000000000000001F85EB51B8749EC0
      014300000000000000471D6B411B456D6F6C756D656E746F73202F2047455244
      4155204D455420504E85EB51B81EED6240000000000000000085EB51B81EED62
      40014300000000000000471D6B412C4356202D20434F4D505241204445204143
      4F45532041205649535441202F20474552444155204D455420504E00000000C0
      1CD440000000000000000000000000C01CD440014300000000000000471D6B41
      1A436F727265746167656D202F20474552444155204D455420504ED7A3703D0A
      C759400000000000000000D7A3703D0AC75940014300000000000000471D6B41
      244465766F6C7563616F20436F727265746167656D202F20474552444155204D
      455420504E33333333333357C0000000000000000033333333333357C0014300
      000000000000471D6B411B456D6F6C756D656E746F73202F2047455244415520
      4D455420504ED7A3703D0AD71C400000000000000000D7A3703D0AD71C400143
      00000000000000471D6B412C4356202D20434F4D5052412044452041434F4553
      2041205649535441202F20474552444155204D455420504E000000000013B040
      0000000000000000000000000013B040014300000000000000471D6B411A436F
      727265746167656D202F20474552444155204D455420504E9A99999999993440
      00000000000000009A99999999993440014300000000000000471D6B41244465
      766F6C7563616F20436F727265746167656D202F20474552444155204D455420
      504E0AD7A3703D8A32C000000000000000000AD7A3703D8A32C0014300000000
      000000471D6B411B456D6F6C756D656E746F73202F20474552444155204D4554
      20504E0AD7A3703D0AF73F00000000000000000AD7A3703D0AF73F0143000000
      00000000471D6B412C4356202D20434F4D5052412044452041434F4553204120
      5649535441202F20474552444155204D455420504E000000000012B040000000
      0000000000000000000012B040014300000000000000471D6B411A436F727265
      746167656D202F20474552444155204D455420504E9A99999999993440000000
      00000000009A99999999993440014300000000000000471D6B41244465766F6C
      7563616F20436F727265746167656D202F20474552444155204D455420504E0A
      D7A3703D8A32C000000000000000000AD7A3703D8A32C0014300000000000000
      471D6B411B456D6F6C756D656E746F73202F20474552444155204D455420504E
      0AD7A3703D0AF73F00000000000000000AD7A3703D0AF73F0143000000000000
      00471D6B412C4356202D20434F4D5052412044452041434F4553204120564953
      5441202F20474552444155204D455420504E00000000C007FF40000000000000
      000000000000C007FF40014300000000000000471D6B411A436F727265746167
      656D202F20474552444155204D455420504E15AE47E17AE28340000000000000
      000015AE47E17AE28340014300000000000000471D6B41244465766F6C756361
      6F20436F727265746167656D202F20474552444155204D455420504E3E0AD7A3
      70E581C000000000000000003E0AD7A370E581C0014300000000000000471D6B
      411B456D6F6C756D656E746F73202F20474552444155204D455420504E1F85EB
      51B83E464000000000000000001F85EB51B83E4640014300000000000000471D
      6B412C4356202D20434F4D5052412044452041434F4553204120564953544120
      2F20474552444155204D455420504E00000000E0F8F240000000000000000000
      000000E0F8F240014300000000000000471D6B411A436F727265746167656D20
      2F20474552444155204D455420504E5C8FC2F52850784000000000000000005C
      8FC2F528507840014300000000000000471D6B41244465766F6C7563616F2043
      6F727265746167656D202F20474552444155204D455420504EF6285C8FC2E175
      C00000000000000000F6285C8FC2E175C0014300000000000000471D6B411B45
      6D6F6C756D656E746F73202F20474552444155204D455420504E333333333333
      3B4000000000000000003333333333333B40014300000000000000471D6B411B
      415455414C495A41C7C34F203A20474552444155204D455420504E0000000000
      000000295C8F822A143B41295C8F822A143B410152}
    object cdsFluxoCotaIDCOTACOTACAO: TFloatField
      FieldName = 'IDCOTACOTACAO'
    end
    object cdsFluxoCotaHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 200
    end
    object cdsFluxoCotaVALORCOTIZADO: TFloatField
      FieldName = 'VALORCOTIZADO'
    end
    object cdsFluxoCotaVALORRENTABILIZADO: TFloatField
      FieldName = 'VALORRENTABILIZADO'
    end
    object cdsFluxoCotaVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object cdsFluxoCotaFLGCOTA: TStringField
      FieldName = 'FLGCOTA'
      FixedChar = True
      Size = 1
    end
  end
  object dsFluxoCota: TwwDataSource
    AutoEdit = False
    DataSet = cdsFluxoCota
    Left = 29
    Top = 178
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  CCO.DATA, '
      '  CCO.VLRPATRIMONIO, '
      '  CCO.QTDCOTA, '
      '  CCO.VLRCOTA, '
      '  CCO.VLRCOTIZADO, '
      '  CCO.VLRRENTABILIZADO, '
      '  PPA.NOME AS PATRO, '
      '  PRV.NOME AS PLANO, '
      '  DECODE(A.DESCRICAO, NULL, '
      '  DECODE(A.IDFUNDOINVEST, NULL, '
      '  DECODE(A.IDINVESTIMENTO, NULL, '
      '  DECODE(A.IDTIPOCONTREMPTMO, NULL, '
      '  DECODE(A.IDIMOVEL, NULL, '
      '  DECODE(A.IDCARTEIRASPC, NULL, '#39#39', '
      
        '      (SELECT DESCARTEIRASPC    FROM  CARTEIRASPC      WHERE  ID' +
        'CARTEIRASPC     =  A.IDCARTEIRASPC   )), '
      
        '      (SELECT  IMONOME          FROM  IMOVEL           WHERE  ID' +
        'IMOVEL          =  A.IDIMOVEL)), '
      
        '      (SELECT  TCEDESCRICAO     FROM  TIPOCONTREMPTMO  WHERE  ID' +
        'TIPOCONTREMPTMO =  A.IDTIPOCONTREMPTMO)), '
      
        '      (SELECT  DESCINVESTIMENTO FROM  INVESTIMENTO     WHERE  ID' +
        'INVESTIMENTO    =  A.IDINVESTIMENTO)), '
      
        '      (SELECT  DESCFUNDOINVEST  FROM  FUNDOINVEST      WHERE  ID' +
        'FUNDOINVEST     =  A.IDFUNDOINVEST)), '
      '  A.DESCRICAO) AS ATIVO, '
      ''
      '    DECODE(A.DESCRICAO, NULL, '
      '    DECODE(A.IDFUNDOINVEST, NULL, '
      '    DECODE(A.IDINVESTIMENTO, NULL, '
      '    DECODE(A.IDTIPOCONTREMPTMO, NULL, '
      '    DECODE(A.IDIMOVEL, NULL, '
      '    DECODE(A.IDCARTEIRASPC, NULL, '#39#39', '
      
        '          (SELECT DESCARTEIRASPC    FROM  CARTEIRASPC      WHERE' +
        '  IDCARTEIRASPC     =  A.IDCARTEIRASPC   )), '
      '  '#39'Imobiliário'#39'), '
      '  '#39'Empréstimo'#39'), '
      
        '          (SELECT TI.DESCTIPOINVEST FROM  INVESTIMENTO I, TIPOIN' +
        'VEST TI '
      '           WHERE TI.IDTIPOINVEST = I.IDTIPOINVEST '
      '           AND I.IDINVESTIMENTO = A.IDINVESTIMENTO)), '
      
        '          (SELECT (TI.DESCTIPOINVEST||'#39' - '#39'|| TF.DESCTIPOFUNDOIN' +
        'V) AS DESCRICAO '
      
        '           FROM   FUNDOINVEST F, TIPOINVEST TI, TIPOFUNDOINVEST ' +
        'TF '
      '           WHERE '
      '              F.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST '
      '           AND '
      '              TF.IDTIPOINVEST = TI.IDTIPOINVEST '
      '           AND '
      '              F.IDFUNDOINVEST     =  A.IDFUNDOINVEST)), '
      '    '#39'Cotas Manuais'#39') AS ORIGEMATIVO, '
      '    CCO.IDCOTACOTACAO '
      'FROM '
      '    COTACOTACAO CCO, '
      '    ATIVOCOTA A, '
      '    PESSOA PPA, '
      '    PLANPREVCONTABIL PRV '
      'WHERE '
      '        CCO.IDATIVOCOTA  = A.IDATIVOCOTA '
      '    AND CCO.IDATIVOCOTA  IN (4130)'
      
        '    AND DATA             BETWEEN TO_DATE('#39'02/08/2006'#39', '#39'dd/mm/yy' +
        'yy'#39') '
      
        '    AND                          TO_DATE('#39'04/08/2006'#39', '#39'dd/mm/yy' +
        'yy'#39') '
      '    AND PPA.IDPESSOA    IN CCO.IDPATRO '
      '    AND PRV.IDPLANOPREV IN CCO.IDPLANO '
      'ORDER BY ATIVO,DATA, PATRO, PLANO')
    Left = 392
    Top = 24
  end
end
