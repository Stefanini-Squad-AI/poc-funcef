inherited RptCAFConcCafContab: TRptCAFConcCafContab
  Left = 236
  Top = 197
  Width = 394
  Height = 236
  Caption = 'Conciliação entre Ativo Fixo e Contabilidade'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Conciliação entre Ativo Fixo e Contabilidade'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Data Inicial'
        Controle = tcEdit
        TipodeDado = tdDate
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
        Required = True
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
        Caption = 'Data Final'
        Controle = tcEdit
        TipodeDado = tdDate
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
        Required = True
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
        Caption = 'Grupo Contábil'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT NOME, CLASSE, IDGRUPO'
          'FROM GRUPO'
          'WHERE (TIPO = '#39'A'#39')'
          'ORDER BY CLASSE')
        LookupSettings.Chave = 'IDGRUPO'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '30'
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
        MostraComboCompara = True
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
        Caption = 'Somente as Diferenças'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
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
        MostraComboCompara = True
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
        Caption = 'Somente Lançamentos Integrados'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
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
        MostraComboCompara = True
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
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 196
    Left = 20
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'Basedados'
    Report = rpConsCafContab
    LabelEmpresa = ppLabel156
    LabelSistema = ppLabel179
  end
  object sqlConsCafContab: TCMSqlParams
    SQL.Strings = (
      'SELECT PLN.PLNDATDIA AS DATA, '
      '       LAC.PLACONTA AS CONTACONTABIL,'
      '       LAC.CODCENTROCUSTO AS CENTROCUSTO,'
      '       (0.00) AS VLCONTABDEB,'
      '       (0.00) AS VLCONTABCRE,'
      '       (0.00) AS VLCAFDEB,'
      '       (0.00) AS VLCAFCRE,'
      '       (0.00) AS DIFVALDEB,'
      '       (0.00) AS DIFVALCRE'
      'FROM LANCAMENTO LAC,'
      '     PLANILHA   PLN'
      'WHERE PLN.PLNCODIGO IS NULL'
      '  AND PLN.PLNDATDIA >= :PDATAINI'
      '  AND PLN.PLNDATDIA <= :PDATAFIM'
      '  AND PLN.PLNCODIGO = LAC.PLNCODIGO'
      'ORDER BY 1, 2, 3'
      ''
      ' '
      ' ')
    ClientDataSet = cdsConsCafContab
    Left = 224
    Top = 60
  end
  object cdsConsCafContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 47
  end
  object ppConsCafContab: TppBDEPipeline
    DataSource = dsConsCafContab
    UserName = 'ConsCafContab'
    Left = 224
    Top = 34
  end
  object dsConsCafContab: TwwDataSource
    DataSet = cdsConsCafContab
    Left = 224
    Top = 21
  end
  object rpConsCafContab: TppReport
    AutoStop = False
    DataPipeline = ppConsCafContab
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 224
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand26: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30692
      mmPrintPosition = 0
      object ppLabel155: TppLabel
        UserName = 'ppLabel155'
        Caption = 'Conciliação entre Ativo Fixo e Contabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 43921
        mmTop = 8467
        mmWidth = 109273
        BandType = 0
      end
      object ppLabel156: TppLabel
        UserName = 'ppLabel156'
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
      object RptConAlmoxContabLine1: TppLine
        UserName = 'RptConAlmoxContabLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 29633
        mmWidth = 197379
        BandType = 0
      end
      object LbPer13: TppLabel
        UserName = 'LbPer13'
        Caption = 'De 01/01/1999 a 01/01/1999 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 15346
        mmWidth = 45773
        BandType = 0
      end
      object RptConAlmoxContabLabel5: TppLabel
        UserName = 'RptConAlmoxContabLabel5'
        Caption = 'Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 53711
        mmTop = 26194
        mmWidth = 9260
        BandType = 0
      end
      object RptConAlmoxContabLabel6: TppLabel
        UserName = 'RptConAlmoxContabLabel6'
        Caption = 'Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 109802
        mmTop = 26194
        mmWidth = 9260
        BandType = 0
      end
      object RptConAlmoxContabLabel7: TppLabel
        UserName = 'RptConAlmoxContabLabel7'
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 132292
        mmTop = 26194
        mmWidth = 10848
        BandType = 0
      end
      object RptConAlmoxContabLabel8: TppLabel
        UserName = 'RptConAlmoxContabLabel8'
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 180711
        mmTop = 26194
        mmWidth = 10848
        BandType = 0
      end
      object RptConAlmoxContabLabel9: TppLabel
        UserName = 'RptConAlmoxContabLabel9'
        Caption = 'Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 159809
        mmTop = 26194
        mmWidth = 9260
        BandType = 0
      end
      object RptConAlmoxContabLabel10: TppLabel
        UserName = 'RptConAlmoxContabLabel10'
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 80169
        mmTop = 26194
        mmWidth = 10848
        BandType = 0
      end
      object ppLine70: TppLine
        UserName = 'ppLine70'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 0
        mmTop = 20902
        mmWidth = 197379
        BandType = 0
      end
      object RptConAlmoxContabLabel1: TppLabel
        UserName = 'RptConAlmoxContabLabel1'
        Caption = '  Contabilidade  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        mmHeight = 3969
        mmLeft = 57415
        mmTop = 21167
        mmWidth = 23813
        BandType = 0
      end
      object RptConAlmoxContabLabel2: TppLabel
        UserName = 'RptConAlmoxContabLabel2'
        Caption = ' Ativo Fixo '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        mmHeight = 3969
        mmLeft = 116152
        mmTop = 21167
        mmWidth = 16404
        BandType = 0
      end
      object RptConAlmoxContabLabel3: TppLabel
        UserName = 'RptConAlmoxContabLabel3'
        Caption = '  Diferenças  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        mmHeight = 3969
        mmLeft = 163248
        mmTop = 21167
        mmWidth = 19844
        BandType = 0
      end
      object rpConsCafContabLabel1: TppLabel
        UserName = 'rpConsCafContabLabel1'
        AutoSize = False
        Caption = 'Conta Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 529
        mmTop = 21167
        mmWidth = 25665
        BandType = 0
      end
      object rpConsCafContabLabel2: TppLabel
        UserName = 'rpConsCafContabLabel2'
        AutoSize = False
        Caption = 'Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 529
        mmTop = 25929
        mmWidth = 25929
        BandType = 0
      end
    end
    object ppDetailBand20: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object RptConAlmoxContabDBText2: TppDBText
        UserName = 'RptConAlmoxContabDBText2'
        AutoSize = True
        DataField = 'VLCONTABDEB'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 42069
        mmTop = 0
        mmWidth = 20902
        BandType = 4
      end
      object RptConAlmoxContabDBText3: TppDBText
        UserName = 'RptConAlmoxContabDBText3'
        AutoSize = True
        DataField = 'VLCONTABCRE'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 69850
        mmTop = 0
        mmWidth = 21167
        BandType = 4
      end
      object RptConAlmoxContabDBText4: TppDBText
        UserName = 'RptConAlmoxContabDBText4'
        AutoSize = True
        DataField = 'VLCAFDEB'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 110596
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object RptConAlmoxContabDBText5: TppDBText
        UserName = 'RptConAlmoxContabDBText5'
        AutoSize = True
        DataField = 'DIFVALCRE'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 181505
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object RptConAlmoxContabDBText6: TppDBText
        UserName = 'RptConAlmoxContabDBText6'
        AutoSize = True
        DataField = 'DIFVALDEB'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 159015
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object RptConAlmoxContabDBText7: TppDBText
        UserName = 'RptConAlmoxContabDBText7'
        AutoSize = True
        DataField = 'VLCAFCRE'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 134673
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object rpConsCafContabDBText1: TppDBText
        UserName = 'rpConsCafContabDBText1'
        DataField = 'CENTROCUSTO'
        DataPipeline = ppConsCafContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 0
        mmWidth = 31485
        BandType = 4
      end
    end
    object ppFooterBand26: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLine71: TppLine
        UserName = 'ppLine71'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197379
        BandType = 8
      end
      object ppLabel179: TppLabel
        UserName = 'ppLabel179'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 529
        mmWidth = 62706
        BandType = 8
      end
      object ppCalc50: TppSystemVariable
        UserName = 'ppCalc501'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 77788
        mmTop = 529
        mmWidth = 41804
        BandType = 8
      end
      object ppCalc51: TppSystemVariable
        UserName = 'Calc51'
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
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptConAlmoxContabSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object RptConAlmoxContabLabel13: TppLabel
        UserName = 'RptConAlmoxContabLabel13'
        Caption = 'TOTAL :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 529
        mmTop = 0
        mmWidth = 11642
        BandType = 7
      end
      object RptConAlmoxContabDBCalc1: TppDBCalc
        UserName = 'RptConAlmoxContabDBCalc1'
        AutoSize = True
        DataField = 'VLCONTABDEB'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3316
        mmLeft = 30797
        mmTop = 0
        mmWidth = 32173
        BandType = 7
      end
      object RptConAlmoxContabDBCalc2: TppDBCalc
        UserName = 'RptConAlmoxContabDBCalc2'
        AutoSize = True
        DataField = 'VLCONTABCRE'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3316
        mmLeft = 58844
        mmTop = 0
        mmWidth = 32173
        BandType = 7
      end
      object RptConAlmoxContabDBCalc3: TppDBCalc
        UserName = 'RptConAlmoxContabDBCalc3'
        AutoSize = True
        DataField = 'VLCAFDEB'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3316
        mmLeft = 99519
        mmTop = 0
        mmWidth = 25894
        BandType = 7
      end
      object RptConAlmoxContabDBCalc4: TppDBCalc
        UserName = 'RptConAlmoxContabDBCalc4'
        AutoSize = True
        DataField = 'VLCAFCRE'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3316
        mmLeft = 123596
        mmTop = 0
        mmWidth = 25894
        BandType = 7
      end
      object RptConAlmoxContabDBCalc5: TppDBCalc
        UserName = 'RptConAlmoxContabDBCalc5'
        AutoSize = True
        DataField = 'DIFVALDEB'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3316
        mmLeft = 148027
        mmTop = 0
        mmWidth = 26599
        BandType = 7
      end
      object RptConAlmoxContabDBCalc6: TppDBCalc
        UserName = 'RptConAlmoxContabDBCalc6'
        AutoSize = True
        DataField = 'DIFVALCRE'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3316
        mmLeft = 170516
        mmTop = 0
        mmWidth = 26599
        BandType = 7
      end
    end
    object rpConsCafContabGroup1: TppGroup
      BreakName = 'DATA'
      DataPipeline = ppConsCafContab
      UserName = 'rpConsCafContabGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpConsCafContabGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object rpConsCafContabDBText3: TppDBText
          UserName = 'rpConsCafContabDBText3'
          DataField = 'DATA'
          DataPipeline = ppConsCafContab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 529
          mmTop = 0
          mmWidth = 31485
          BandType = 3
          GroupNo = 0
        end
      end
      object rpConsCafContabGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 794
        mmPrintPosition = 0
        object rpConsCafContabLine3: TppLine
          UserName = 'rpConsCafContabLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 0
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpConsCafContabGroup2: TppGroup
      BreakName = 'CONTACONTABIL'
      DataPipeline = ppConsCafContab
      UserName = 'rpConsCafContabGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpConsCafContabGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object rpConsCafContabDBText2: TppDBText
          UserName = 'rpConsCafContabDBText2'
          DataField = 'CONTACONTABIL'
          DataPipeline = ppConsCafContab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 529
          mmTop = 0
          mmWidth = 31485
          BandType = 3
          GroupNo = 1
        end
        object rpConsCafContabLine1: TppLine
          UserName = 'rpConsCafContabLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 3704
          mmWidth = 197379
          BandType = 3
          GroupNo = 1
        end
      end
      object rpConsCafContabGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 794
        mmPrintPosition = 0
        object rpConsCafContabLine2: TppLine
          UserName = 'rpConsCafContabLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 0
          mmWidth = 197379
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object cdsVerUltFec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 80
  end
  object sqlVerUltFec: TCMSqlParams
    SQL.Strings = (
      'SELECT MAX(PG.DATAULTFEC) AS DATAULT'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      
        'WHERE (G.FLGIMOVEL = :PFLGIMOVELINI OR G.FLGIMOVEL = :PFLGIMOVEL' +
        'FIM)'
      '  AND PG.IDPESSOA = :PIDPESSOA'
      '  AND G.TIPO = '#39'A'#39
      '  AND PG.DATAULTFEC IS NOT NULL'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      ''
      ' ')
    ClientDataSet = cdsVerUltFec
    Left = 120
    Top = 64
  end
  object cdsMovCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 24
  end
  object sqlMovCaf: TCMSqlParams
    SQL.Strings = (
      'SELECT LANC.DATAMOVIMENTACAO AS DATA,'
      '       LANC.IDGRUPO AS GRUPO,'
      '       LANC.IDTIPOMOVIMENTACAO AS TIPOMOV,'
      '       LANC.VALOR,'
      '       CTDEB.CONTADB,'
      '       CTCRE.CONTACR,'
      '       LANC.CODCENTROCUSTO'
      ''
      
        'FROM (SELECT HM.DATAMOVIMENTACAO, B.IDGRUPO, HM.IDTIPOMOVIMENTAC' +
        'AO,'
      '             RD.CODCENTROCUSTO, SUM(NVL(VM.VALOR,0)) AS VALOR'
      '      FROM HISTORICOMOVIMENTACAO HM,'
      '           BEM B,'
      '           CONJUNTO C,'
      '           RATEIODEPRECIACAO RD,'
      '           VLRHISTMOVBEM VM'
      '      WHERE HM.DATAMOVIMENTACAO >= :PDATAINI'
      '        AND HM.DATAMOVIMENTACAO <= :PDATAFIM'
      '        AND VM.IDTAXADEP = :IDTAXADEP'
      '        AND VM.MOECODIGO = :MOECODIGO'
      '        AND HM.IDPESSOA = :IDPESSOA'
      '        AND HM.IDBEM = B.IDBEM'
      '        AND B.IDCONJUNTO = C.IDCONJUNTO'
      '        AND C.IDCONJUNTO = RD.IDCONJUNTO'
      '        AND HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+)'
      
        '      GROUP BY HM.DATAMOVIMENTACAO,B.IDGRUPO,HM.IDTIPOMOVIMENTAC' +
        'AO,RD.CODCENTROCUSTO) LANC,'
      ''
      
        '     (SELECT CMG.IDGRUPO, CMG.IDTIPOMOVIMENTACAO, CMG.PLACONTA A' +
        'S CONTADB'
      '      FROM CONTASTIPOSMOVIMENTOGRUPOS CMG'
      
        '      WHERE CMG.IDPESSOA = :IDPESSOA AND CMG.TIPOLANCAMENTO = '#39'D' +
        #39') CTDEB,'
      ''
      
        '     (SELECT CMG.IDGRUPO, CMG.IDTIPOMOVIMENTACAO, CMG.PLACONTA A' +
        'S CONTACR'
      '      FROM CONTASTIPOSMOVIMENTOGRUPOS CMG'
      
        '      WHERE CMG.IDPESSOA = :IDPESSOA AND CMG.TIPOLANCAMENTO = '#39'C' +
        #39') CTCRE'
      ''
      'WHERE LANC.VALOR <> 0'
      '  AND CTDEB.CONTADB IS NOT NULL'
      '  AND CTCRE.CONTACR IS NOT NULL'
      ''
      '  AND LANC.IDGRUPO = CTDEB.IDGRUPO(+)'
      '  AND LANC.IDTIPOMOVIMENTACAO = CTDEB.IDTIPOMOVIMENTACAO(+)'
      '  AND LANC.IDGRUPO = CTCRE.IDGRUPO(+)'
      '  AND LANC.IDTIPOMOVIMENTACAO = CTCRE.IDTIPOMOVIMENTACAO(+)'
      ''
      'ORDER BY 1, 2 ,3'
      '')
    ClientDataSet = cdsMovCaf
    Left = 320
    Top = 8
  end
  object cdsMovTrf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 152
  end
  object sqlMovTrf: TCMSqlParams
    SQL.Strings = (
      
        'SELECT HM.DATAMOVIMENTACAO, B.IDGRUPO, HM.IDGRUPANT, HM.IDTIPOMO' +
        'VIMENTACAO,'
      '       HM.TRFVALORG, HM.TRFCMBEM, HM.TRFDEPLANC, HM.TRFCMDEP,'
      
        '       HM.TRFREAVVALORG, HM.TRFREAVCMBEM, HM.TRFREAVDEPLANC, HM.' +
        'TRFREAVCMDEP,'
      
        '       HM.TRFAVVALORG, HM.TRFAVCMBEM, HM.TRFAVDEPLANC, HM.TRFAVC' +
        'MDEP'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     BEM B'
      'WHERE HM.DATAMOVIMENTACAO >= :PDATAINI'
      '  AND HM.DATAMOVIMENTACAO <= :PDATAFIM'
      
        '  AND (HM.IDTIPOMOVIMENTACAO = 05 OR HM.IDTIPOMOVIMENTACAO = 11 ' +
        'OR HM.IDTIPOMOVIMENTACAO = 12)'
      ''
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND HM.PLNCODIGO IS NOT NULL'
      '  AND HM.IDBEM = B.IDBEM'
      '  AND HM.IDPESSOA = B.IDPESSOA'
      '')
    ClientDataSet = cdsMovTrf
    Left = 40
    Top = 136
  end
  object cdsCafxContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 88
  end
  object sqlCafxContab: TCMSqlParams
    SQL.Strings = (
      'SELECT PLN.PLNDATDIA AS DATA,'
      '       LAC.PLACONTA AS CONTACONTABIL,'
      '       LAC.CODCENTROCUSTO AS CENTROCUSTO,'
      
        '       SUM(DECODE(LAC.LACDEBCRE,'#39'D'#39',LAC.LACVALOR,0)) AS VLCONTAB' +
        'DEB,'
      
        '       SUM(DECODE(LAC.LACDEBCRE,'#39'C'#39',LAC.LACVALOR,0)) AS VLCONTAB' +
        'CRE,'
      '       (0.00) AS VLCAFDEB,'
      '       (0.00) AS VLCAFCRE'
      'FROM LANCAMENTO LAC,'
      '     PLANILHA PLN'
      'WHERE PLN.PLNDATDIA >= :PDATAINI'
      '  AND PLN.PLNDATDIA <= :PDATAFIM'
      '  AND PLN.IDPESSOA = :IDPESSOA'
      ''
      '  AND PLN.PLNCODIGO = LAC.PLNCODIGO'
      'GROUP BY PLN.PLNDATDIA, LAC.PLACONTA, LAC.CODCENTROCUSTO'
      ''
      '')
    ClientDataSet = cdsCafxContab
    Left = 320
    Top = 72
  end
  object cdsTrfCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 152
  end
  object sqlTrfCaf: TCMSqlParams
    SQL.Strings = (
      'SELECT DATAULTDEP AS DATA,'
      '       IDGRUPO    AS GRUPO,'
      '       FLGIMOVEL  AS TIPOMOV,'
      '       VALALUGUEL AS VALOR,'
      '       ('#39'                  '#39') AS CONTADB,'
      '       ('#39'                  '#39') AS CONTACR'
      'FROM GRUPO'
      'WHERE IDGRUPO = -1'
      '')
    ClientDataSet = cdsTrfCaf
    Left = 120
    Top = 136
  end
  object _cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 152
  end
  object cdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 152
  end
  object sqlPlano: TCMSqlParams
    SQL.Strings = (
      'SELECT PLANO,DESCPLANO,MASCARA'
      'FROM PLANO'
      'WHERE PLANO = :PPLANO')
    ClientDataSet = cdsPlano
    Left = 320
    Top = 136
  end
  object sqlContaContabilComCC: TCMSqlParams
    SQL.Strings = (
      'SELECT PLANO, PLACONTA, IDEMPRESA, CODCENTROCUSTO'
      'FROM CONTASTIPOSMOVIMENTOGRUPOS'
      'WHERE IDGRUPO = :IDGRUPO'
      '  AND IDTIPOMOVIMENTACAO = :IDTIPOMOVIMENTACAO'
      '  AND TIPOLANCAMENTO = :TIPOLANCAMENTO'
      '  AND IDPESSOA = :IDPESSOA'
      '  AND PLANO = :PLANO'
      '  AND LTRIM(RTRIM(CODCENTROCUSTO)) = :CODCENTROCUSTO'
      '  AND IDEMPRESA = :IDEMPRESA'
      '')
    Left = 224
    Top = 136
  end
  object sqlContaContabilSemCC: TCMSqlParams
    SQL.Strings = (
      'SELECT PLANO, PLACONTA, IDEMPRESA, CODCENTROCUSTO '
      'FROM CONTASTIPOSMOVIMENTOGRUPOS'
      'WHERE IDGRUPO = :IDGRUPO'
      '  AND IDTIPOMOVIMENTACAO = :IDTIPOMOVIMENTACAO'
      '  AND TIPOLANCAMENTO = :TIPOLANCAMENTO'
      '  AND IDPESSOA = :IDPESSOA'
      '  AND PLANO = :PLANO')
    Left = 224
    Top = 122
  end
  object cdsParamCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 80
  end
  object sqlParamCaf: TCMSqlParams
    SQL.Strings = (
      
        'SELECT C.MOEDAOFICIAL, C.MOEDAFISCAL, C.MOEDAGERENCIAL, C.NUMDIA' +
        'SANO,'
      '       C.MASCCODGRUPO, C.ALUGUELINTERNO, C.GERARREQMAT,'
      '       C.DATAULTDEP, C.DATARECALCDEP, C.DTAULTALUG, C.SEQBEMEMP,'
      
        '       C.EDITACODBEM, C.EDITACODGRUPO, C.SISTEMAS, C.DATAINICIAL' +
        ','
      
        '       C.ULTTXTCONTAB, C.FLGCALCCM, C.FLGTIPOCALC, C.MASCARACLAS' +
        'SE,'
      
        '       C.INTEGRACONTAB, C.INTEGRACAP, C.INTEGRACAR, C.PLANOVIGEN' +
        'TE,'
      
        '       C.FLGREAVAL, C.TIPOPERCTB, C.FLGREMOVEPLANCTB, C.ATIVPROJ' +
        'ETO,'
      
        '       C.PROXIMAPLACA,C.FLGCLSDESBEM, C.DIGMASCPLACA, C.PATROPAD' +
        'RAO,'
      
        '       C.PLANPREVPADRAO, C.TIPATUSALDOCONTAB, C.DTANCAF, C.TIPOC' +
        'ONJUNTO,'
      
        '       I.FLGINTCAFCONT, C.FLGCONTABFECHAM, PC.PACDOBRADA, I.FLGD' +
        'IARIO,'
      '       G.MASCARACC'
      'FROM   PARAMETROSCAFMANUT C,'
      '       PARAMIMOVEL I,'
      '       PARAMCONTAB PC,'
      '       PARAMGLOBAL G'
      'WHERE C.IDPESSOA = :PIDPESSOA'
      '  AND C.IDPESSOA = I.IDPESSOA(+)'
      '  AND C.IDPESSOA = PC.IDPESSOA(+)'
      '  AND C.IDPESSOA = G.IDPESSOA(+)'
      '')
    ClientDataSet = cdsParamCaf
    Left = 40
    Top = 64
  end
end
