inherited RptCadSolPrePronta: TRptCadSolPrePronta
  Width = 265
  Height = 146
  Caption = 'Cadastro da Solicitação Pré-Pronta'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Cadastro da Solicitação Pré-Pronta'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Solicitação Pré-Pronta'
        Controle = tcLookupCombo
        TipodeDado = tdReal
        LookupSettings.SQL.Strings = (
          'SELECT IDSCPREPRONTA, DESCSCPREPRONTA'
          'FROM SCPREPRONTA'
          'ORDER BY DESCSCPREPRONTA')
        LookupSettings.Chave = 'IDSCPREPRONTA'
        LookupSettings.Display = 'DESCSCPREPRONTA'
        LookupSettings.Descricao = 'Solicitação Pré-Pronta'
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        Name = 'Solicitacao'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 0
      end>
    Formheight = 120
    FormWidth = 480
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptCadSolPrePronta
    LabelEmpresa = LblEmpresa
    LabelSistema = LblSistema
    Left = 84
  end
  object dsCadSolPrePronta: TwwDataSource
    DataSet = CdsCadSolPrePronta
    Left = 140
    Top = 60
  end
  object bdeCadSolPrePronta: TppBDEPipeline
    DataSource = dsCadSolPrePronta
    UserName = 'bdeCadSolPrePronta'
    Left = 84
    Top = 60
  end
  object RptCadSolPrePronta: TppReport
    AutoStop = False
    DataPipeline = bdeCadSolPrePronta
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
    Left = 24
    Top = 60
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand12: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30163
      mmPrintPosition = 0
      object ppLabel27: TppLabel
        UserName = 'ppLabel27'
        Caption = 'Solicitações Pré-Pronta Cadastrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 62706
        mmTop = 7673
        mmWidth = 71702
        BandType = 0
      end
      object ppLine22: TppLine
        UserName = 'ppLine22'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 29369
        mmWidth = 197300
        BandType = 0
      end
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84931
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object RptCadPreProntaDBText1: TppDBText
        UserName = 'RptCadPreProntaDBText1'
        DataField = 'DESCSCPREPRONTA'
        DataPipeline = bdeCadSolPrePronta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 16404
        mmWidth = 95250
        BandType = 0
      end
      object RptCadPreProntaLine1: TppLine
        UserName = 'RptCadPreProntaLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 23019
        mmWidth = 197300
        BandType = 0
      end
      object RptCadPreProntaLabel1: TppLabel
        UserName = 'RptCadPreProntaLabel1'
        Caption = 'Artigo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 17727
        mmTop = 24606
        mmWidth = 8996
        BandType = 0
      end
      object RptCadPreProntaLabel2: TppLabel
        UserName = 'RptCadPreProntaLabel2'
        Caption = 'Qtde. por Pessoa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 92075
        mmTop = 24606
        mmWidth = 25929
        BandType = 0
      end
      object RptCadPreProntaLabel3: TppLabel
        UserName = 'RptCadPreProntaLabel3'
        Caption = 'Qtde. Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 127265
        mmTop = 24606
        mmWidth = 20902
        BandType = 0
      end
      object RptCadPreProntaLabel4: TppLabel
        UserName = 'RptCadPreProntaLabel4'
        Caption = 'Qtde. a Comprar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 163248
        mmTop = 24606
        mmWidth = 24606
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object RptCadPreProntaDBText2: TppDBText
        UserName = 'RptCadPreProntaDBText2'
        AutoSize = True
        DataField = 'CODARTIGO'
        DataPipeline = bdeCadSolPrePronta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object RptCadPreProntaDBText3: TppDBText
        UserName = 'RptCadPreProntaDBText3'
        DataField = 'DESCRICAO'
        DataPipeline = bdeCadSolPrePronta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 22754
        mmTop = 794
        mmWidth = 61383
        BandType = 4
      end
      object RptCadPreProntaDBText4: TppDBText
        UserName = 'RptCadPreProntaDBText4'
        AutoSize = True
        DataField = 'QTDEPESSOA'
        DataPipeline = bdeCadSolPrePronta
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 91017
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
      object RptCadPreProntaDBText6: TppDBText
        UserName = 'RptCadPreProntaDBText6'
        DataField = 'CODMEDIDA'
        DataPipeline = bdeCadSolPrePronta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 110596
        mmTop = 794
        mmWidth = 6350
        BandType = 4
      end
      object RptCadPreProntaDBText5: TppDBText
        UserName = 'RptCadPreProntaDBText5'
        AutoSize = True
        DataField = 'SALDOQTDE'
        DataPipeline = bdeCadSolPrePronta
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 125413
        mmTop = 794
        mmWidth = 17463
        BandType = 4
      end
      object RptCadPreProntaDBText7: TppDBText
        UserName = 'RptCadPreProntaDBText7'
        DataField = 'UNIDSALDO'
        DataPipeline = bdeCadSolPrePronta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 143404
        mmTop = 794
        mmWidth = 6350
        BandType = 4
      end
      object RptCadPreProntaLine3: TppLine
        UserName = 'RptCadPreProntaLine3'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 161396
        mmTop = 4233
        mmWidth = 26723
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine24: TppLine
        UserName = 'ppLine24'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object LblSistema: TppLabel
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
        mmLeft = 529
        mmTop = 529
        mmWidth = 36248
        BandType = 8
      end
      object ppCalc22: TppSystemVariable
        UserName = 'Calc22'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 67998
        mmTop = 529
        mmWidth = 61383
        BandType = 8
      end
      object ppCalc23: TppSystemVariable
        UserName = 'Calc23'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 169334
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptCadPreProntaGroup2: TppGroup
      BreakName = 'IDSCPREPRONTA'
      DataPipeline = bdeCadSolPrePronta
      NewPage = True
      ResetPageNo = True
      UserName = 'RptCadPreProntaGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptCadPreProntaGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object RptCadPreProntaGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object RptCadSolPreProntaGroup1: TppGroup
      BreakName = 'CODGRUPOPROD'
      DataPipeline = bdeCadSolPrePronta
      UserName = 'RptCadSolPreProntaGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptCadSolPreProntaGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object RptCadPreProntaLine2: TppLine
          UserName = 'RptCadPreProntaLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5556
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object RptCadPreProntaDBText8: TppDBText
          UserName = 'RptCadPreProntaDBText8'
          DataField = 'CODGRUPOPROD'
          DataPipeline = bdeCadSolPrePronta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 2381
          mmTop = 1323
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object RptCadPreProntaDBText9: TppDBText
          UserName = 'RptCadPreProntaDBText9'
          AutoSize = True
          DataField = 'DESCGRUPOPROD'
          DataPipeline = bdeCadSolPrePronta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3175
          mmLeft = 26458
          mmTop = 1323
          mmWidth = 26194
          BandType = 3
          GroupNo = 1
        end
        object RptCadPreProntaLine4: TppLine
          UserName = 'RptCadPreProntaLine4'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 20108
          mmTop = 2646
          mmWidth = 3440
          BandType = 3
          GroupNo = 1
        end
      end
      object RptCadSolPreProntaGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object SqlCadSolPrePronta: TCMSqlParams
    ClientDataSet = CdsCadSolPrePronta
    Left = 192
    Top = 8
  end
  object CdsCadSolPrePronta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 60
  end
end
