inherited dtmRelBenefaPreparar: TdtmRelBenefaPreparar
  Left = 200
  Top = 216
  Width = 259
  Height = 231
  Caption = 'dtmRelBenefaPreparar'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 26
    Top = 52
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
    Left = 26
    Top = 103
  end
  inherited qryExemplo: TwwQuery
    Left = 26
    Top = 153
  end
  inherited rpExemplo: TppReport
    Left = 26
    Top = 0
  end
  object rpBenefaPreparar: TppReport
    AutoStop = False
    DataPipeline = ppBenefaPreparar
    OnStartPage = rpBenefaPrepararStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Benefícios a Preparar'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpBenefaPrepararBeforePrint
    DeviceType = 'Screen'
    Left = 104
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 53446
      mmPrintPosition = 0
      object rpRelPensAlimDBImage1: TppDBImage
        UserName = 'rpRelPensAlimDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object rpRelPensAlimDBText2: TppDBText
        UserName = 'rpRelPensAlimDBText2'
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
      object rpRelPensAlimDBText5: TppDBText
        UserName = 'rpRelPensAlimDBText5'
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
      object rpRelPensAlimDBText4: TppDBText
        UserName = 'rpRelPensAlimDBText4'
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
        mmWidth = 16140
        BandType = 0
      end
      object rpRelPensAlimDBText3: TppDBText
        UserName = 'rpRelPensAlimDBText3'
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
        mmWidth = 25665
        BandType = 0
      end
      object rpRelPensAlimDBText1: TppDBText
        UserName = 'rpRelPensAlimDBText1'
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
      object lblTitulo: TppLabel
        UserName = 'lblTitulo'
        AutoSize = False
        Caption = 'Relatório de Benefícios a Preparar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 32544
        mmWidth = 284692
        BandType = 0
      end
      object lneTitulo: TppLine
        UserName = 'lneTitulo'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 0
        mmTop = 38629
        mmWidth = 284300
        BandType = 0
      end
      object lblMesRef: TppLabel
        UserName = 'lblMesRef'
        Caption = 'Mês de Referência :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2910
        mmTop = 47361
        mmWidth = 33338
        BandType = 0
      end
      object lblMostraMesRef: TppLabel
        UserName = 'lblMostraMesRef'
        Caption = 'lblMostraMesRef'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 37835
        mmTop = 47361
        mmWidth = 28310
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object shpCor: TppShape
        OnPrint = shpCorPrint
        UserName = 'shpCor'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object dbMatricula: TppDBText
        UserName = 'dbMatricula'
        DataField = 'MATRICULA'
        DataPipeline = ppBenefaPreparar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 529
        mmTop = 529
        mmWidth = 15610
        BandType = 4
      end
      object dbInscricao: TppDBText
        UserName = 'dbInscricao'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = ppBenefaPreparar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 16933
        mmTop = 529
        mmWidth = 17463
        BandType = 4
      end
      object dbNome: TppDBText
        UserName = 'dbNome'
        DataField = 'NOME'
        DataPipeline = ppBenefaPreparar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 35190
        mmTop = 529
        mmWidth = 47625
        BandType = 4
      end
      object dbDataInicio: TppDBText
        UserName = 'dbDataInicio'
        DataField = 'DATAINICIO'
        DataPipeline = ppBenefaPreparar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 153194
        mmTop = 529
        mmWidth = 15081
        BandType = 4
      end
      object dbDataFinal: TppDBText
        UserName = 'dbDataFinal'
        DataField = 'DATAFINAL'
        DataPipeline = ppBenefaPreparar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 170127
        mmTop = 529
        mmWidth = 16140
        BandType = 4
      end
      object dbUltPreparo: TppDBText
        UserName = 'dbUltPreparo'
        DataField = 'ULTMESPREPARO'
        DataPipeline = ppBenefaPreparar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 189971
        mmTop = 529
        mmWidth = 12435
        BandType = 4
      end
      object dbValorAtual: TppDBText
        UserName = 'dbValorAtual'
        DataField = 'VALORBENEFICIO'
        DataPipeline = ppBenefaPreparar
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 206375
        mmTop = 529
        mmWidth = 18785
        BandType = 4
      end
      object dbValorTotal: TppDBText
        UserName = 'dbValorTotal'
        DataField = 'VALORTOTAL'
        DataPipeline = ppBenefaPreparar
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 226219
        mmTop = 529
        mmWidth = 18785
        BandType = 4
      end
      object dbValorSRB: TppDBText
        UserName = 'dbValorSRB'
        DataField = 'VALORSRB'
        DataPipeline = ppBenefaPreparar
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 245798
        mmTop = 529
        mmWidth = 18785
        BandType = 4
      end
      object dbValorInss: TppDBText
        UserName = 'dbValorInss'
        DataField = 'VALORINSS'
        DataPipeline = ppBenefaPreparar
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 265378
        mmTop = 529
        mmWidth = 18785
        BandType = 4
      end
      object dbBeneficio: TppDBText
        UserName = 'dbNome1'
        DataField = 'BENEFICIO'
        DataPipeline = ppBenefaPreparar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 83873
        mmTop = 529
        mmWidth = 67469
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object lneRodape: TppLine
        UserName = 'lneRodape'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 5821
        mmWidth = 284300
        BandType = 8
      end
      object lblRodapeRelat: TppLabel
        UserName = 'lblRodapeRelat'
        AutoSize = False
        Caption = 'Folha de Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 6879
        mmWidth = 284428
        BandType = 8
      end
      object ppCalc45: TppSystemVariable
        UserName = 'Calc45'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 252148
        mmTop = 6879
        mmWidth = 30427
        BandType = 8
      end
      object ppCalc46: TppSystemVariable
        UserName = 'Calc46'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 138113
        mmTop = 6879
        mmWidth = 18785
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PLANO'
      DataPipeline = ppBenefaPreparar
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 20108
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 0
          mmTop = 19315
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object lblMatricula: TppLabel
          UserName = 'lblMatricula'
          AutoSize = False
          Caption = 'Matrícula'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 529
          mmTop = 15081
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object lblInscricao: TppLabel
          UserName = 'lblInscricao'
          AutoSize = False
          Caption = 'Inscrição'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 16933
          mmTop = 15081
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object lblBeneficiario: TppLabel
          UserName = 'lblBeneficiario'
          AutoSize = False
          Caption = 'Nome'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 34925
          mmTop = 15081
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object lblDataInicio: TppLabel
          UserName = 'lblDataInicio'
          AutoSize = False
          Caption = 'Data Início'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 152665
          mmTop = 15081
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object lblDataFinal: TppLabel
          UserName = 'lblDataInicio1'
          AutoSize = False
          Caption = 'Data Final'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 170127
          mmTop = 15081
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object lblBeneficio: TppLabel
          UserName = 'lblBeneficiario1'
          AutoSize = False
          Caption = 'Benefício'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 83873
          mmTop = 15081
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object lblValAtual: TppLabel
          UserName = 'lblValAtual'
          AutoSize = False
          Caption = 'Valor Atual'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 206375
          mmTop = 15081
          mmWidth = 18786
          BandType = 3
          GroupNo = 0
        end
        object lblUltimoMesPreparo: TppLabel
          UserName = 'lblUltimoMesPreparo'
          AutoSize = False
          Caption = 'Utl. Preparo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 187325
          mmTop = 15081
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object lblValorTot: TppLabel
          UserName = 'lblValorTot'
          AutoSize = False
          Caption = 'Valor Total'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 226219
          mmTop = 15081
          mmWidth = 18786
          BandType = 3
          GroupNo = 0
        end
        object lblValorSRB: TppLabel
          UserName = 'lblValorTot1'
          AutoSize = False
          Caption = 'Valor SRB'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 245798
          mmTop = 15081
          mmWidth = 18786
          BandType = 3
          GroupNo = 0
        end
        object lblValorInss: TppLabel
          UserName = 'lblValorInss'
          AutoSize = False
          Caption = 'Valor Inss'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 265378
          mmTop = 15081
          mmWidth = 18786
          BandType = 3
          GroupNo = 0
        end
        object lblPlano: TppLabel
          UserName = 'lblPlano'
          Caption = 'Plano :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 2910
          mmTop = 4233
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object dbPlano: TppDBText
          UserName = 'dbPlano'
          DataField = 'PLANO'
          DataPipeline = ppBenefaPreparar
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 14288
          mmTop = 4233
          mmWidth = 94456
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8731
        mmPrintPosition = 0
        object lblTotPlano: TppLabel
          UserName = 'lblTotPlano'
          Caption = 'Total do Plano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 184680
          mmTop = 2117
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 2117
          mmLeft = 0
          mmTop = 1058
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object dbSumVlrAtual: TppDBCalc
          UserName = 'dbSumVlrAtual'
          DataField = 'VALORBENEFICIO'
          DataPipeline = ppBenefaPreparar
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 206375
          mmTop = 2117
          mmWidth = 18785
          BandType = 5
          GroupNo = 0
        end
        object dbSumVlrSRB: TppDBCalc
          UserName = 'dbSumVlrSRB'
          DataField = 'VALORSRB'
          DataPipeline = ppBenefaPreparar
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 245798
          mmTop = 2117
          mmWidth = 18785
          BandType = 5
          GroupNo = 0
        end
        object dbSumVlrInss: TppDBCalc
          UserName = 'dbSumVlrInss'
          DataField = 'VALORINSS'
          DataPipeline = ppBenefaPreparar
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 265378
          mmTop = 2117
          mmWidth = 18785
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppBenefaPreparar: TppBDEPipeline
    DataSource = dsBenefaPreparar
    UserName = 'BenefaPreparar'
    Left = 104
    Top = 52
    object ppBenefaPrepararppField1: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 0
    end
    object ppBenefaPrepararppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSCRICAONUMERO'
      FieldName = 'INSCRICAONUMERO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppBenefaPrepararppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppBenefaPrepararppField4: TppField
      FieldAlias = 'BENEFICIO'
      FieldName = 'BENEFICIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppBenefaPrepararppField5: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppBenefaPrepararppField6: TppField
      FieldAlias = 'DATAINICIO'
      FieldName = 'DATAINICIO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object ppBenefaPrepararppField7: TppField
      FieldAlias = 'DATAFINAL'
      FieldName = 'DATAFINAL'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object ppBenefaPrepararppField8: TppField
      FieldAlias = 'ULTMESPREPARO'
      FieldName = 'ULTMESPREPARO'
      FieldLength = 7
      DisplayWidth = 7
      Position = 7
    end
    object ppBenefaPrepararppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppBenefaPrepararppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppBenefaPrepararppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORBENEFICIO'
      FieldName = 'VALORBENEFICIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppBenefaPrepararppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORTOTAL'
      FieldName = 'VALORTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppBenefaPrepararppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORSRB'
      FieldName = 'VALORSRB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppBenefaPrepararppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORINSS'
      FieldName = 'VALORINSS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
  end
  object dsBenefaPreparar: TwwDataSource
    DataSet = qryBenefaPreparar
    Left = 104
    Top = 103
  end
  object qryBenefaPreparar: TwwQuery
    BeforeOpen = qryBenefaPrepararBeforeOpen
    AfterOpen = qryBenefaPrepararAfterOpen
    AfterClose = qryBenefaPrepararAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  EL.MATRICULA,'
      '  PPP.INSCRICAONUMERO,'
      '  P.NOME,'
      '  B.NOME AS BENEFICIO,'
      '  PP.NOME AS PLANO,'
      '  BB.DATAINICIO,'
      '  BB.DATAFINAL,'
      '  BB.ULTMESPREPARO,'
      '  PAT.IDPESSOA,'
      '  PP.IDPLANOPREV,'
      '  SUM(NVL(BB.VALORATUAL, 0)) AS VALORBENEFICIO,'
      '  SUM(NVL(BB.VALORTOTAL, 0)) AS VALORTOTAL,  '
      '  SUM(NVL(BB.VALORSRB, 0))   AS VALORSRB,'
      '  SUM(NVL(BB.VLRINFINSS, 0)) AS VALORINSS'
      ''
      'FROM'
      '  BENEFBFCIARIO BB,'
      '  BENEFPLANOPART BP,'
      '  DEPENTIT DP,'
      '  TPPAGTOBENEFICIO TPB,'
      '  TPPERIODICIDADE TP,'
      '  BENEFPLANPREV BPP,'
      '  PARTPREVPLAN PPP,'
      '  ELEGPATRO EL,'
      '  BENEFICIO B,'
      '  PLANPREV PP,'
      '  PATRO PAT,'
      '  PESSOA P,'
      '  PESSOAFISICA PF,'
      '  PESSOA PA  '
      '  '
      'WHERE '
      '  (((BB.IDSITBENEFICIO IN (1,6))  AND '
      '   ((BB.FLGDATAPREVISTA = 1) OR (((BB.FLGDATAPREVISTA = 0) OR '
      '    (BB.FLGDATAPREVISTA IS NULL)) AND '
      '  '
      '  ((BB.DATAFINAL >= TO_DATE('#39'2002/12/01'#39', '#39'YYYY/MM/DD'#39')) OR '
      '   (BB.DATAFINAL IS NULL))))) OR ((IDSITBENEFICIO = 2) AND '
      
        '   (B.FLGBENEFTEMP = 0))) AND ((BB.ULTMESPREPARO < '#39'2002/12'#39') OR' +
        ' '
      '   (BB.ULTMESPREPARO IS NULL))   AND '
      '  '
      '  (BB.FLGFORMAPAGTO = '#39'F'#39')       AND '
      '  (TPB.FLGFREQUENCIA <> '#39'U'#39')     AND '
      
        '  ((BPP.FLGREFERENCIA = 0 OR BPP.FLGREFERENCIA IS NULL) OR (BPP.' +
        'FLGREFERENCIA = 1 AND '
      '    BPP.FLGPAGAINSS = 1))  AND '
      ''
      '  (BB.IDPLANOPREV          IN (16))                 AND '
      '  (BB.IDBENEFICIO          IN (5))                  AND '
      '  (BB.IDPESSJUR            IN (50028))              AND '
      '  (TPB.IDTPPAGTOBENEFIC    = BB.IDTPPAGTOBENEFIC)   AND '
      '  (TP.IDTPPERIODICIDADE(+) = TPB.IDTPPERIODICIDADE) AND '
      '  (BP.IDBENEFICIO(+)       = BB.IDBENEFICIO)        AND '
      '  (BP.IDPLANOPREV(+)       = BB.IDPLANOPREV)        AND '
      '  (BP.IDPESSJUR(+)         = BB.IDPESSJUR)          AND '
      '  (BP.SEQPROPOSTA(+)       = BB.SEQPROPOSTA)        AND '
      '  (BP.IDPESSOA(+)          = BB.IDPESSOA)           AND '
      '  (DP.IDTITULAR            = BB.IDTITULAR)          AND '
      '  (DP.IDPESSOA             = BB.IDPESSOA)           AND '
      '  (BPP.IDBENEFICIO         = BB.IDBENEFICIO)        AND '
      '  (BPP.IDPLANOPREV         = BB.IDPLANOPREV)        AND '
      '  (PPP.IDPESSJUR           = BB.IDPESSJUR)          AND '
      '  (PPP.IDPLANOPREV         = BB.IDPLANOPREV)        AND '
      '  (PPP.IDPESSOA            = BB.IDTITULAR)          AND '
      '  (PP.IDPLANOPREV          = BB.IDPLANOPREV)        AND '
      '  (EL.IDPESSJUR            = BB.IDPESSJUR)          AND '
      '  (EL.IDPESSOA             = BB.IDTITULAR)          AND '
      '  (B.IDBENEFICIO           = BB.IDBENEFICIO)        AND '
      '  (PAT.IDPESSOA            = BB.IDPESSJUR)          AND '
      '  (P.IDPESSOA              = BB.IDPESSOA)           AND '
      '  (PF.IDPESSOA             = BB.IDPESSOA)           AND '
      '  (PA.IDPESSOA             = BB.IDPESSJUR)   '
      ''
      'GROUP BY'
      '  PAT.IDPESSOA,'
      '  PP.IDPLANOPREV,'
      '  EL.MATRICULA,'
      '  PPP.INSCRICAONUMERO,'
      '  P.NOME,'
      '  BB.DATAINICIO,'
      '  BB.DATAFINAL,'
      '  BB.ULTMESPREPARO,'
      '  B.NOME,'
      '  PP.NOME'
      ''
      ''
      'ORDER BY'
      '  EL.MATRICULA')
    ValidateWithMask = True
    Left = 104
    Top = 153
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
    Left = 187
    Top = 153
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
    Left = 187
    Top = 103
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 187
    Top = 52
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
