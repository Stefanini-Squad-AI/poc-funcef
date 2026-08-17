inherited RptSugestCompra: TRptSugestCompra
  Left = 620
  Top = 354
  Width = 328
  Height = 144
  Caption = 'Sugestão de Compra'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Sugestão de Compra'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Almoxarifado'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CodAlmoxarifado, DescAlmox '
          'FROM ALMOX '
          'WHERE IDPESSOA = 1'
          'ORDER BY 2')
        LookupSettings.Chave = 'CodAlmoxarifado'
        LookupSettings.Display = 'DescAlmox'
        LookupSettings.Descricao = 'Almoxarifado'
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
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Almoxarifado'
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
        Caption = 'Análise de Estoque'
        Controle = tcMontaSelect
        CampoBanco = 'IDANALISEESTOQUE'
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
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
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Analise'
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
        MontaSelect = MsSugestCompra
        Width = 0
      end
      item
        Caption = 'Não imprimir itens com sugestão de compra zero'
        Controle = tcCheckBox
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = False
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
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Imprimir'
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
    BeforeExecute = CmpRptCMBeforeExecute
    OnParamControlExit = CmpRptCMParamControlExit
    Formheight = 156
    FormWidth = 440
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptSugestCompra
    LabelEmpresa = LblEmpresa
    LabelSistema = LblSistema
  end
  object bdeSugestCompra: TppBDEPipeline
    DataSource = dsSugestCompra
    UserName = 'bdeSugestCompra'
    Left = 84
    Top = 61
  end
  object dsSugestCompra: TwwDataSource
    DataSet = CdsSugestCompra
    Left = 140
    Top = 61
  end
  object RptSugestCompra: TppReport
    AutoStop = False
    DataPipeline = bdeSugestCompra
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
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 31221
      mmPrintPosition = 0
      object ppLabel44: TppLabel
        UserName = 'ppLabel44'
        Caption = 'Sugestão de Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 72761
        mmTop = 8467
        mmWidth = 51594
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'ppLine13'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 21167
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
        mmLeft = 84667
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object RptSugestCompLabel1: TppLabel
        UserName = 'RptSugestCompLabel1'
        Caption = 'Artigo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 26194
        mmWidth = 8996
        BandType = 0
      end
      object RptSugestCompLabel2: TppLabel
        UserName = 'RptSugestCompLabel2'
        Caption = 'Tempo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 70115
        mmTop = 22225
        mmWidth = 10319
        BandType = 0
      end
      object RptSugestCompLabel3: TppLabel
        UserName = 'RptSugestCompLabel3'
        Caption = 'Ressup.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 69056
        mmTop = 26458
        mmWidth = 11906
        BandType = 0
      end
      object RptSugestCompLabel4: TppLabel
        UserName = 'RptSugestCompLabel4'
        Caption = 'Consumo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 82286
        mmTop = 22225
        mmWidth = 14288
        BandType = 0
      end
      object RptSugestCompLabel5: TppLabel
        UserName = 'RptSugestCompLabel5'
        Caption = 'Médio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 84138
        mmTop = 26458
        mmWidth = 8996
        BandType = 0
      end
      object RptSugestCompLabel6: TppLabel
        UserName = 'RptSugestCompLabel6'
        Caption = 'Ponto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 101600
        mmTop = 22225
        mmWidth = 8467
        BandType = 0
      end
      object RptSugestCompLabel7: TppLabel
        UserName = 'RptSugestCompLabel7'
        Caption = 'Reposição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 99219
        mmTop = 26194
        mmWidth = 15081
        BandType = 0
      end
      object RptSugestCompLabel8: TppLabel
        UserName = 'RptSugestCompLabel8'
        Caption = 'Quant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 118004
        mmTop = 22225
        mmWidth = 9260
        BandType = 0
      end
      object RptSugestCompLabel9: TppLabel
        UserName = 'RptSugestCompLabel9'
        Caption = 'Mínima'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 117740
        mmTop = 26194
        mmWidth = 10583
        BandType = 0
      end
      object RptSugestCompLabel10: TppLabel
        UserName = 'RptSugestCompLabel10'
        Caption = 'Quant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 22225
        mmWidth = 9260
        BandType = 0
      end
      object RptSugestCompLabel11: TppLabel
        UserName = 'RptSugestCompLabel11'
        Caption = 'a Comprar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 164042
        mmTop = 26458
        mmWidth = 15346
        BandType = 0
      end
      object RptSugestCompLabel12: TppLabel
        UserName = 'RptSugestCompLabel12'
        Caption = 'Quant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 149754
        mmTop = 22225
        mmWidth = 9260
        BandType = 0
      end
      object RptSugestCompLabel13: TppLabel
        UserName = 'RptSugestCompLabel13'
        Caption = 'Sugerida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 148167
        mmTop = 26458
        mmWidth = 12965
        BandType = 0
      end
      object RptSugestCompLabel14: TppLabel
        UserName = 'RptSugestCompLabel14'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 134673
        mmTop = 22225
        mmWidth = 7938
        BandType = 0
      end
      object RptSugestCompLabel15: TppLabel
        UserName = 'RptSugestCompLabel15'
        Caption = 'Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 26458
        mmWidth = 11906
        BandType = 0
      end
      object RptSugestCompLine1: TppLine
        UserName = 'RptSugestCompLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 30427
        mmWidth = 197300
        BandType = 0
      end
      object RptSugestCompDBText9: TppDBText
        UserName = 'RptSugestCompDBText9'
        DataField = 'IDANALISEESTOQUE'
        DataPipeline = bdeSugestCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 39952
        mmTop = 15610
        mmWidth = 17198
        BandType = 0
      end
      object RptSugestCompLabel16: TppLabel
        UserName = 'RptSugestCompLabel16'
        Caption = 'Número da Sugestão : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 15610
        mmWidth = 38365
        BandType = 0
      end
      object RptSugestCompLabel17: TppLabel
        UserName = 'RptSugestCompLabel17'
        Caption = 'Unid.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 182034
        mmTop = 22225
        mmWidth = 7144
        BandType = 0
      end
      object RptSugestCompLabel18: TppLabel
        UserName = 'RptSugestCompLabel18'
        Caption = 'Media'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 181505
        mmTop = 26458
        mmWidth = 8731
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object RptSugestCompDBText1: TppDBText
        UserName = 'RptSugestCompDBText1'
        DataField = 'PRODUTO'
        DataPipeline = bdeSugestCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 15610
        mmTop = 0
        mmWidth = 49742
        BandType = 4
      end
      object RptSugestCompDBText2: TppDBText
        UserName = 'RptSugestCompDBText2'
        AutoSize = True
        DataField = 'TEMPOMED'
        DataPipeline = bdeSugestCompra
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 65088
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object RptSugestCompDBText3: TppDBText
        UserName = 'RptSugestCompDBText3'
        AutoSize = True
        DataField = 'CONSMED'
        DataPipeline = bdeSugestCompra
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 82286
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object RptSugestCompDBText4: TppDBText
        UserName = 'RptSugestCompDBText4'
        AutoSize = True
        DataField = 'PONTOREP'
        DataPipeline = bdeSugestCompra
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 98690
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object RptSugestCompDBText5: TppDBText
        UserName = 'RptSugestCompDBText5'
        AutoSize = True
        DataField = 'QTDEMIN'
        DataPipeline = bdeSugestCompra
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 116152
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object RptSugestCompDBText7: TppDBText
        UserName = 'RptSugestCompDBText7'
        AutoSize = True
        DataField = 'QTDESUGCALCULADA'
        DataPipeline = bdeSugestCompra
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 130704
        mmTop = 0
        mmWidth = 30692
        BandType = 4
      end
      object RptSugestCompDBText8: TppDBText
        UserName = 'RptSugestCompDBText8'
        AutoSize = True
        DataField = 'SALDOESTOQUE'
        DataPipeline = bdeSugestCompra
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 121973
        mmTop = 0
        mmWidth = 23283
        BandType = 4
      end
      object RptSugestCompDBText10: TppDBText
        UserName = 'RptSugestCompDBText10'
        AutoSize = True
        DataField = 'CODMEDCUSTO'
        DataPipeline = bdeSugestCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 182563
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object RptSugestCompDBText6: TppDBText
        UserName = 'RptSugestCompDBText6'
        AutoSize = True
        DataField = 'QTDECOMPRAR'
        DataPipeline = bdeSugestCompra
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 157163
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object RptSugestCompDBText11: TppDBText
        UserName = 'RptSugestCompDBText11'
        DataField = 'CODARTIGO'
        DataPipeline = bdeSugestCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine18: TppLine
        UserName = 'ppLine18'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
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
        mmLeft = 0
        mmTop = 1058
        mmWidth = 28840
        BandType = 8
      end
      object ppCalc16: TppSystemVariable
        UserName = 'Calc16'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 83608
        mmTop = 1058
        mmWidth = 29898
        BandType = 8
      end
      object ppCalc17: TppSystemVariable
        UserName = 'Calc17'
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
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object SqlSugestCompra: TCMSqlParams
    ClientDataSet = CdsSugestCompra
    Left = 200
    Top = 8
  end
  object CdsSugestCompra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 60
  end
  object MsSugestCompra: TMontaSelect
    Tag = 1
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ANALISEESTOQUE.IDANALISEESTOQUE'
      'ANALISEESTOQUE.DATAINICONSMED'
      'ANALISEESTOQUE.DATAFIMTRMED')
    TipodeDado.Strings = (
      'N'
      'D'
      'D')
    Descricao.Strings = (
      'Código'
      'Data Inicial'
      'Data Final')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ANALISEESTOQUE')
    CamposChave.Strings = (
      'ANALISEESTOQUE.IDANALISEESTOQUE'
      'ANALISEESTOQUE.IDANALISEESTOQUE')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '18'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 260
    Top = 60
  end
end
