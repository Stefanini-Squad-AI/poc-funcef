inherited DMRelOperacoesFdo: TDMRelOperacoesFdo
  Left = 327
  Top = 163
  Caption = 'DMRelOperacoesFdo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
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
  inherited qryExemplo: TwwQuery
    Active = True
  end
  object ppOperacoesFdo: TppBDEPipeline
    DataSource = dsOperacoesFdo
    UserName = 'lExemplo1'
    Left = 85
    Top = 91
    object ppOperRecebtoFdoppField1: TppField
      FieldAlias = 'DATAOPERACAO'
      FieldName = 'DATAOPERACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 0
      Position = 0
    end
    object ppOperRecebtoFdoppField2: TppField
      FieldAlias = 'DATALIQUIDACAO'
      FieldName = 'DATALIQUIDACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 14
      Position = 1
    end
    object ppOperRecebtoFdoppField3: TppField
      FieldAlias = 'DESCTIPOOPERACAO'
      FieldName = 'DESCTIPOOPERACAO'
      FieldLength = 60
      DisplayWidth = 40
      Position = 2
    end
    object ppOperRecebtoFdoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDOPERACAO'
      FieldName = 'QTDOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 21
      Position = 3
    end
    object ppOperRecebtoFdoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCOTA'
      FieldName = 'VLRCOTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 4
    end
    object ppOperRecebtoFdoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 5
    end
    object ppOperRecebtoFdoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIR'
      FieldName = 'VLRIR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 6
    end
    object ppOperRecebtoFdoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRLIQUIDO'
      FieldName = 'VLRLIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 7
    end
    object ppOperRecebtoFdoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDUSUFRUTO'
      FieldName = 'QTDUSUFRUTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 8
    end
    object ppOperRecebtoFdoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOPERACAOFUNDO'
      FieldName = 'IDOPERACAOFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppOperRecebtoFdoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppOperRecebtoFdoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPEDIDOFUNDO'
      FieldName = 'IDPEDIDOFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppOperRecebtoFdoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOINVEST'
      FieldName = 'IDTIPOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppOperRecebtoFdoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOOPERACAO'
      FieldName = 'IDTIPOOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppOperRecebtoFdoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFUNDOINVEST'
      FieldName = 'IDFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppOperRecebtoFdoppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIOF'
      FieldName = 'VLRIOF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppOperRecebtoFdoppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRENDIMENTO'
      FieldName = 'VLRRENDIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppOperRecebtoFdoppField18: TppField
      FieldAlias = 'STACONFIRMA'
      FieldName = 'STACONFIRMA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 17
    end
    object ppOperRecebtoFdoppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOPERACAOORIGEM'
      FieldName = 'IDOPERACAOORIGEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppOperRecebtoFdoppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANPREVCTBPATR'
      FieldName = 'IDPLANPREVCTBPATR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppOperRecebtoFdoppField21: TppField
      FieldAlias = 'DATACOTIZACAO'
      FieldName = 'DATACOTIZACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 20
    end
    object ppOperRecebtoFdoppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRDESCONTO'
      FieldName = 'VLRDESCONTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppOperRecebtoFdoppField23: TppField
      FieldAlias = 'DESCFUNDOINVEST'
      FieldName = 'DESCFUNDOINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 22
    end
    object ppOperRecebtoFdoppField24: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 113
      DisplayWidth = 113
      Position = 23
    end
  end
  object rptOperacoesFdo: TppReport
    AutoStop = False
    DataPipeline = ppOperacoesFdo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 186
    Top = 91
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25665
      mmPrintPosition = 0
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        mmHeight = 5292
        mmLeft = 0
        mmTop = 20373
        mmWidth = 284163
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Operações em Fundos de Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 67998
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmOperComum.pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'LPeriodo'
        Caption = 'Periodo :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label1'
        Caption = 'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 57944
        mmTop = 14023
        mmWidth = 1588
        BandType = 0
      end
      object lblData: TppLabel
        UserName = 'lblDtaOper'
        Caption = 'Dt. Operação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 73554
        mmTop = 21696
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'lblVlrLiq'
        AutoSize = False
        Caption = 'Valor Líquido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 191823
        mmTop = 21696
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'lblDtaLiq'
        Caption = 'Dt. Liquidação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 92604
        mmTop = 21696
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'lblVlrBruto'
        AutoSize = False
        Caption = 'Valor Bruto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 118534
        mmTop = 21696
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'lblVlrIR'
        AutoSize = False
        Caption = 'I.R.R.F.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 150019
        mmTop = 21696
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'lblVlrIOF'
        AutoSize = False
        Caption = 'I.O.F.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 177536
        mmTop = 21696
        mmWidth = 7144
        BandType = 0
      end
      object lblDtaIni: TppLabel
        UserName = 'LPeriodo1'
        Caption = 'DD/MM/YYYY'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 39158
        mmTop = 14023
        mmWidth = 17727
        BandType = 0
      end
      object lblDtaFin: TppLabel
        UserName = 'LPeriodo2'
        Caption = 'DD/MM/YYYY'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 60854
        mmTop = 14023
        mmWidth = 17727
        BandType = 0
      end
      object lblTipoOper: TppLabel
        UserName = 'lblFundoInvest1'
        Caption = 'Operação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 5027
        mmTop = 21696
        mmWidth = 11377
        BandType = 0
      end
      object lblQuantidade: TppLabel
        UserName = 'lblQuantidade'
        AutoSize = False
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 217753
        mmTop = 21696
        mmWidth = 16669
        BandType = 0
      end
      object lblPU: TppLabel
        UserName = 'lblPU'
        AutoSize = False
        Caption = 'PU'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 254001
        mmTop = 21696
        mmWidth = 5292
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpTitData2'
        Pen.Style = psClear
        mmHeight = 5027
        mmLeft = 265
        mmTop = 0
        mmWidth = 284163
        BandType = 4
      end
      object ppdbDtaIni: TppDBText
        UserName = 'dbDtaIni'
        DataField = 'DATAOPERACAO'
        DataPipeline = ppOperacoesFdo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 73025
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppdbDtaLiq: TppDBText
        UserName = 'dbDtaLiq'
        DataField = 'DATALIQUIDACAO'
        DataPipeline = ppOperacoesFdo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 92604
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppdbVlrBruto: TppDBText
        UserName = 'dbVlrBruto'
        DataField = 'VLROPERACAO'
        DataPipeline = ppOperacoesFdo
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 111125
        mmTop = 1058
        mmWidth = 23813
        BandType = 4
      end
      object ppdbVlrIR: TppDBText
        UserName = 'dbVlrIR'
        DataField = 'VLRIR'
        DataPipeline = ppOperacoesFdo
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 136261
        mmTop = 1058
        mmWidth = 23813
        BandType = 4
      end
      object ppdbVlrIOF: TppDBText
        UserName = 'dbVlrIOF'
        DataField = 'VLRIOF'
        DataPipeline = ppOperacoesFdo
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 161396
        mmTop = 1058
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'dbVlrLiq1'
        DataField = 'QTDOPERACAO'
        DataPipeline = ppOperacoesFdo
        DisplayFormat = '###,###,###,###,##0.000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 211667
        mmTop = 1058
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'dbVlrLiq2'
        DataField = 'VLRCOTA'
        DataPipeline = ppOperacoesFdo
        DisplayFormat = '###,###,###,###,##0.000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 236803
        mmTop = 1058
        mmWidth = 23813
        BandType = 4
      end
      object ppdbVlrLiq: TppDBText
        UserName = 'dbVlrLiq'
        DataField = 'VLRLIQUIDO'
        DataPipeline = ppOperacoesFdo
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 186532
        mmTop = 1058
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'dbDescFundo1'
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = ppOperacoesFdo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 2381
        mmTop = 1058
        mmWidth = 69321
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel5: TppLabel
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
        mmLeft = 0
        mmTop = 1058
        mmWidth = 284428
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
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1058
        mmWidth = 284428
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
        mmLeft = 257969
        mmTop = 1058
        mmWidth = 26458
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDPLANPREVCTBPATR'
      DataPipeline = ppOperacoesFdo
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppdbPlanoPatro: TppDBText
          UserName = 'dbPlanoPatro'
          DataField = 'PLANPRVCONTABPATRO'
          DataPipeline = ppOperacoesFdo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 35719
          mmTop = 794
          mmWidth = 93927
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'lblPlanoPatro'
          Caption = 'Plano / Patrocinadora :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 794
          mmTop = 794
          mmWidth = 29898
          BandType = 3
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5027
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'IDFUNDOINVEST'
      DataPipeline = ppOperacoesFdo
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel11: TppLabel
          UserName = 'lblFundoInvest'
          Caption = 'Fundo :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2117
          mmTop = 1058
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
        end
        object ppdbDescFundo: TppDBText
          UserName = 'dbDescFundo'
          DataField = 'DESCFUNDOINVEST'
          DataPipeline = ppOperacoesFdo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 16140
          mmTop = 1058
          mmWidth = 115623
          BandType = 3
          GroupNo = 1
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 5292
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLine5: TppLine
          UserName = 'Line5'
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
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryOperacoesFdo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  OP.IDOPERACAOFUNDO, OP.IDCARTEIRAINVEST,  OP.IDPEDIDOFUNDO, OP' +
        '.IDTIPOINVEST,'
      
        '  OP.IDTIPOOPERACAO,  OP.IDFUNDOINVEST,     OP.DATAOPERACAO,  OP' +
        '.DATALIQUIDACAO,'
      
        '  OP.QTDOPERACAO,     OP.VLROPERACAO,       OP.VLRCOTA,       OP' +
        '.VLRIR,'
      
        '  OP.VLRIOF,          OP.VLRRENDIMENTO,     OP.VLROPERACAO AS VL' +
        'RLIQUIDO,'
      
        '  OP.STACONFIRMA,     OP.IDOPERACAOORIGEM,  OP.IDPLANPREVCTBPATR' +
        ','
      '  OP.DATACOTIZACAO,   OP.VLRDESCONTO,       OP.QTDUSUFRUTO,'
      '  TP.DESCTIPOOPERACAO,'
      '  FD.DESCFUNDOINVEST, PL.PLANPRVCONTABPATRO'
      'FROM'
      '   OPERACAOFUNDO OP, TIPOOPERACAO TP, FUNDOINVEST FD,'
      '   (SELECT'
      '       PA.IDPLANPREVCTBPATR,'
      '       (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      '    FROM'
      '       PESSOA PE,'
      '       PLANPREVCONTABPATRO PA,'
      '       PLANPREVCONTABIL PL'
      '    WHERE'
      '       (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '       (PA.IDPLANOPREV = PL.IDPLANOPREV)) PL'
      'WHERE'
      '   (OP.DATAOPERACAO >= TO_DATE(:DTOPERINI,'#39'DD/MM/YYYY'#39'))'
      '   AND (OP.DATAOPERACAO <= TO_DATE(:DTOPERFIN,'#39'DD/MM/YYYY'#39'))'
      
        '   AND ((:IDFUNDOINVEST IS NULL) OR (OP.IDFUNDOINVEST = :IDFUNDO' +
        'INVEST))'
      
        '   AND ((:IDTIPOOPERACAO IS NULL) OR (OP.IDTIPOOPERACAO = :IDTIP' +
        'OOPERACAO))'
      
        '   AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = ' +
        ':IDPLANPREVCTBPATR))'
      '   AND ((TP.NATUREZAOPERACAO = '#39'R'#39') OR(TP.IDTIPOOPERACAO = -43))'
      '   AND (OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)'
      '   AND (OP.IDFUNDOINVEST = FD.IDFUNDOINVEST)'
      '   AND (OP.IDPLANPREVCTBPATR = PL.IDPLANPREVCTBPATR)'
      
        'ORDER BY OP.IDPLANPREVCTBPATR, OP.IDFUNDOINVEST, OP.DATAOPERACAO' +
        ' DESC'
      ''
      ''
      ''
      '')
    UpdateObject = updOperacoesFdo
    ValidateWithMask = True
    Left = 53
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'DTOPERINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DTOPERFIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end>
    object qryOperacoesFdoDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data Operação'
      DisplayWidth = 12
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.DATAOPERACAO'
    end
    object qryOperacoesFdoDATALIQUIDACAO: TDateTimeField
      DisplayLabel = 'Data Liquidação'
      DisplayWidth = 14
      FieldName = 'DATALIQUIDACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.DATALIQUIDACAO'
    end
    object qryOperacoesFdoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 40
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryOperacoesFdoQTDOPERACAO: TFloatField
      DisplayLabel = 'Quantidade de Cotas'
      DisplayWidth = 21
      FieldName = 'QTDOPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.QTDOPERACAO'
      DisplayFormat = '###,###,###,###0.000000'
    end
    object qryOperacoesFdoVLRCOTA: TFloatField
      DisplayLabel = 'PU do Dividendo'
      DisplayWidth = 16
      FieldName = 'VLRCOTA'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRCOTA'
      DisplayFormat = '###,###,###,###0.000000'
    end
    object qryOperacoesFdoVLROPERACAO: TFloatField
      DisplayLabel = 'Valor Bruto'
      DisplayWidth = 18
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLROPERACAO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object qryOperacoesFdoVLRIR: TFloatField
      DisplayLabel = 'IRRF'
      DisplayWidth = 16
      FieldName = 'VLRIR'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRIR'
      DisplayFormat = '###,###,###,###0.00'
    end
    object qryOperacoesFdoVLRLIQUIDO: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 18
      FieldName = 'VLRLIQUIDO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLROPERACAO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object qryOperacoesFdoQTDUSUFRUTO: TFloatField
      DisplayLabel = 'Quantidade Usufruto'
      DisplayWidth = 16
      FieldName = 'QTDUSUFRUTO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.QTDUSUFRUTO'
    end
    object qryOperacoesFdoIDOPERACAOFUNDO: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDOPERACAOFUNDO'
      Visible = False
    end
    object qryOperacoesFdoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryOperacoesFdoIDPEDIDOFUNDO: TFloatField
      FieldName = 'IDPEDIDOFUNDO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDPEDIDOFUNDO'
      Visible = False
    end
    object qryOperacoesFdoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDTIPOINVEST'
      Visible = False
    end
    object qryOperacoesFdoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDTIPOOPERACAO'
      Visible = False
    end
    object qryOperacoesFdoIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDFUNDOINVEST'
      Visible = False
    end
    object qryOperacoesFdoVLRIOF: TFloatField
      FieldName = 'VLRIOF'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRIOF'
      Visible = False
    end
    object qryOperacoesFdoVLRRENDIMENTO: TFloatField
      FieldName = 'VLRRENDIMENTO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRRENDIMENTO'
      Visible = False
    end
    object qryOperacoesFdoSTACONFIRMA: TStringField
      FieldName = 'STACONFIRMA'
      Origin = 'BASEDADOS.OPERACAOFUNDO.STACONFIRMA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperacoesFdoIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDOPERACAOORIGEM'
      Visible = False
    end
    object qryOperacoesFdoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryOperacoesFdoDATACOTIZACAO: TDateTimeField
      FieldName = 'DATACOTIZACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.DATACOTIZACAO'
      Visible = False
    end
    object qryOperacoesFdoVLRDESCONTO: TFloatField
      FieldName = 'VLRDESCONTO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRDESCONTO'
      Visible = False
    end
    object qryOperacoesFdoDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Visible = False
      Size = 60
    end
    object qryOperacoesFdoPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Visible = False
      Size = 113
    end
  end
  object dsOperacoesFdo: TwwDataSource
    AutoEdit = False
    DataSet = qryOperacoesFdo
    Left = 133
    Top = 160
  end
  object updOperacoesFdo: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOFUNDO'
      'set'
      '  IDOPERACAOFUNDO = :IDOPERACAOFUNDO,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDPEDIDOFUNDO = :IDPEDIDOFUNDO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  QTDOPERACAO = :QTDOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  VLRCOTA = :VLRCOTA,'
      '  VLRIR = :VLRIR,'
      '  VLRIOF = :VLRIOF,'
      '  VLRRENDIMENTO = :VLRRENDIMENTO,'
      '  STACONFIRMA = :STACONFIRMA,'
      '  IDOPERACAOORIGEM = :IDOPERACAOORIGEM,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  DATACOTIZACAO = :DATACOTIZACAO,'
      '  VLRDESCONTO = :VLRDESCONTO,'
      '  QTDUSUFRUTO = :QTDUSUFRUTO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    InsertSQL.Strings = (
      'insert into OPERACAOFUNDO'
      
        '  (IDOPERACAOFUNDO, IDCARTEIRAINVEST, IDPEDIDOFUNDO, IDTIPOINVES' +
        'T, '
      'IDTIPOOPERACAO, '
      '   IDFUNDOINVEST, DATAOPERACAO, DATALIQUIDACAO, QTDOPERACAO, '
      'VLROPERACAO, '
      '   VLRCOTA, VLRIR, VLRIOF, VLRRENDIMENTO, STACONFIRMA, '
      'IDOPERACAOORIGEM, '
      '   IDPLANPREVCTBPATR, DATACOTIZACAO, VLRDESCONTO, QTDUSUFRUTO)'
      'values'
      '  (:IDOPERACAOFUNDO, :IDCARTEIRAINVEST, :IDPEDIDOFUNDO, '
      ':IDTIPOINVEST, '
      
        '   :IDTIPOOPERACAO, :IDFUNDOINVEST, :DATAOPERACAO, :DATALIQUIDAC' +
        'AO, '
      ':QTDOPERACAO, '
      '   :VLROPERACAO, :VLRCOTA, :VLRIR, :VLRIOF, :VLRRENDIMENTO, '
      ':STACONFIRMA, '
      '   :IDOPERACAOORIGEM, :IDPLANPREVCTBPATR, :DATACOTIZACAO, '
      ':VLRDESCONTO, :QTDUSUFRUTO)'
      ' ')
    DeleteSQL.Strings = (
      'delete from OPERACAOFUNDO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    Left = 201
    Top = 160
  end
end
