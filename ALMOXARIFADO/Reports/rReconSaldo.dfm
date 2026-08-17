inherited RptReconSaldo: TRptReconSaldo
  Width = 277
  Height = 156
  Caption = 'Reconciliação de Estoque por Saldo'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Reconciliação de Estoque por Saldo'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Almoxarifado'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CODALMOXARIFADO, DESCALMOX'
          'FROM ALMOX'
          'WHERE IDPESSOA = 1'
          'ORDER BY DESCALMOX')
        LookupSettings.Chave = 'CODALMOXARIFADO'
        LookupSettings.Display = 'DESCALMOX'
        LookupSettings.Descricao = 'DESCALMOX'
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
        Caption = 'Grupo de Produtos'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'Select CodGrupoProd, DescGrupoProd'
          'From GrupProd'
          'where idpessoa = 1'
          'Order By DescGrupoProd')
        LookupSettings.Chave = 'CodGrupoProd'
        LookupSettings.Display = 'DescGrupoProd'
        LookupSettings.Descricao = 'DescGrupoProd'
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
        Name = 'Grupo de Produtos'
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
        Name = 'DataInicial'
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
        Name = 'DataFinal'
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
        Caption = 'Imprimir Itens com Saldo Zero'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Imprimir Itens com Saldo Zero'
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
        Caption = 'Só Imprimir Itens Estocáveis'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Só Imprimir Itens Estocáveis'
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
    Formheight = 220
    FormWidth = 520
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptReconSaldo
    LabelEmpresa = LblEmpresa
    LabelSistema = LblSistema
    Left = 84
  end
  object dsReconSaldo: TwwDataSource
    DataSet = CdsReconSaldo
    Left = 140
    Top = 60
  end
  object bdeReconSaldo: TppBDEPipeline
    DataSource = dsReconSaldo
    UserName = 'bdeReconSaldo'
    Left = 80
    Top = 60
    object bdeReconSaldoppField1: TppField
      FieldAlias = 'CODGRUPOPROD'
      FieldName = 'CODGRUPOPROD'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object bdeReconSaldoppField2: TppField
      FieldAlias = 'DESCGRUPOPROD'
      FieldName = 'DESCGRUPOPROD'
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
    object bdeReconSaldoppField3: TppField
      FieldAlias = 'STATUSGRUPO'
      FieldName = 'STATUSGRUPO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 2
    end
    object bdeReconSaldoppField4: TppField
      FieldAlias = 'CODARTIGO'
      FieldName = 'CODARTIGO'
      FieldLength = 14
      DisplayWidth = 14
      Position = 3
    end
    object bdeReconSaldoppField5: TppField
      FieldAlias = 'DESCPROD'
      FieldName = 'DESCPROD'
      FieldLength = 40
      DisplayWidth = 40
      Position = 4
    end
    object bdeReconSaldoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOINI'
      FieldName = 'SALDOINI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object bdeReconSaldoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOATUAL'
      FieldName = 'SALDOATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object bdeReconSaldoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'RECFORN'
      FieldName = 'RECFORN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object bdeReconSaldoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEVFORN'
      FieldName = 'DEVFORN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object bdeReconSaldoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'BAITRANS'
      FieldName = 'BAITRANS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object bdeReconSaldoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTTRANS'
      FieldName = 'ENTTRANS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object bdeReconSaldoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'BAIACERTO'
      FieldName = 'BAIACERTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object bdeReconSaldoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'BAIESTRAGO'
      FieldName = 'BAIESTRAGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object bdeReconSaldoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'BAIXACC'
      FieldName = 'BAIXACC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object bdeReconSaldoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'AJUSTE'
      FieldName = 'AJUSTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
  end
  object RptReconSaldo: TppReport
    AutoStop = False
    DataPipeline = bdeReconSaldo
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
    Left = 20
    Top = 60
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand16: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 39688
      mmPrintPosition = 0
      object ppLabel74: TppLabel
        UserName = 'ppLabel74'
        Caption = 'RELATÓRIO DE RECONCILIAÇÃO EM QUANTIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 89429
        mmTop = 9525
        mmWidth = 105569
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
        mmLeft = 128059
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'ppLabel76'
        Caption = 'Almoxarifado : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 22490
        mmWidth = 25929
        BandType = 0
      end
      object lblAlmox: TppLabel
        UserName = 'lblAlmox'
        Caption = 'lblAlmox'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 28840
        mmTop = 22490
        mmWidth = 13758
        BandType = 0
      end
      object LblPeriodo: TppLabel
        UserName = 'LblPeriodo'
        Caption = 'De 11/11/1998 a 11/11/1998 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 120121
        mmTop = 15875
        mmWidth = 45773
        BandType = 0
      end
      object ppLine30: TppLine
        UserName = 'ppLine30'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 28575
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel79: TppLabel
        UserName = 'ppLabel79'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 30692
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'ppLabel80'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 28840
        mmTop = 30692
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel81: TppLabel
        UserName = 'ppLabel81'
        Caption = 'Recebimento de '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 94986
        mmTop = 30692
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel82: TppLabel
        UserName = 'ppLabel82'
        Caption = 'Forncedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 98425
        mmTop = 34925
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel83: TppLabel
        UserName = 'ppLabel83'
        Caption = 'Devolução a '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 119327
        mmTop = 30692
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'ppLabel84'
        Caption = 'Forncedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 121179
        mmTop = 34925
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel85: TppLabel
        UserName = 'ppLabel85'
        Caption = 'Baixa por'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 141023
        mmTop = 30692
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel86: TppLabel
        UserName = 'ppLabel86'
        Caption = 'Transferência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 138377
        mmTop = 34925
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel87: TppLabel
        UserName = 'ppLabel87'
        Caption = 'Baixa por'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 232305
        mmTop = 30692
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel88: TppLabel
        UserName = 'ppLabel88'
        Caption = 'Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 228336
        mmTop = 34925
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'ppLabel89'
        Caption = 'Baixa por Perda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 181240
        mmTop = 30692
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel90: TppLabel
        UserName = 'ppLabel90'
        Caption = 'ou Estraga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 184150
        mmTop = 34925
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel91: TppLabel
        UserName = 'ppLabel91'
        Caption = 'Baixa por Acerto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 204523
        mmTop = 30692
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel92: TppLabel
        UserName = 'ppLabel92'
        Caption = 'de Inventário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 207169
        mmTop = 34925
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel93: TppLabel
        UserName = 'ppLabel93'
        Caption = 'Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 261938
        mmTop = 34925
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel94: TppLabel
        UserName = 'ppLabel94'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 261673
        mmTop = 30692
        mmWidth = 7144
        BandType = 0
      end
      object ppLine31: TppLine
        UserName = 'ppLine31'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 39158
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel95: TppLabel
        UserName = 'ppLabel95'
        Caption = 'Saldo '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 80698
        mmTop = 30692
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel96: TppLabel
        UserName = 'ppLabel96'
        Caption = 'Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 81227
        mmTop = 34925
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel97: TppLabel
        UserName = 'ppLabel97'
        Caption = 'Transferência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 162190
        mmTop = 34925
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel98: TppLabel
        UserName = 'ppLabel98'
        Caption = 'Entrada por'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 164307
        mmTop = 30692
        mmWidth = 14817
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText21: TppDBText
        UserName = 'ppDBText21'
        DataField = 'CODARTIGO'
        DataPipeline = bdeReconSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 265
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'ppDBText22'
        DataField = 'DESCPROD'
        DataPipeline = bdeReconSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 27252
        mmTop = 265
        mmWidth = 45508
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'ppDBText23'
        DataField = 'RECFORN'
        DataPipeline = bdeReconSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 95250
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'ppDBText24'
        DataField = 'DEVFORN'
        DataPipeline = bdeReconSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 118269
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'ppDBText25'
        DataField = 'BAITRANS'
        DataPipeline = bdeReconSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 140759
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'ppDBText26'
        DataField = 'ENTTRANS'
        DataPipeline = bdeReconSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 164042
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'ppDBText27'
        DataField = 'BAIESTRAGO'
        DataPipeline = bdeReconSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 185209
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'ppDBText28'
        DataField = 'BAIACERTO'
        DataPipeline = bdeReconSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 207963
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'ppDBText29'
        DataField = 'BAIXACC'
        DataPipeline = bdeReconSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 232569
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'ppDBText30'
        AutoSize = True
        DataField = 'SALDOATUAL'
        DataPipeline = bdeReconSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 249503
        mmTop = 265
        mmWidth = 18521
        BandType = 4
      end
      object ppLabel99: TppLabel
        UserName = 'ppLabel99'
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 1058
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'ppDBText31'
        DataField = 'SALDOINI'
        DataPipeline = bdeReconSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 76994
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
    end
    object ppFooterBand16: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine32: TppLine
        UserName = 'ppLine32'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 8
      end
      object LblSistema: TppLabel
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 1588
        mmWidth = 23019
        BandType = 8
      end
      object ppCalc30: TppSystemVariable
        UserName = 'ppCalc301'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 130969
        mmTop = 1588
        mmWidth = 22490
        BandType = 8
      end
      object ppCalc31: TppSystemVariable
        UserName = 'Calc31'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 246328
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 11906
      mmPrintPosition = 0
      object ppDBCalc5: TppDBCalc
        UserName = 'ppDBCalc5'
        DataField = 'RECFORN'
        DataPipeline = bdeReconSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 95779
        mmTop = 3969
        mmWidth = 15875
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'ppDBCalc6'
        DataField = 'DEVFORN'
        DataPipeline = bdeReconSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 118534
        mmTop = 3969
        mmWidth = 15875
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'ppDBCalc7'
        DataField = 'BAITRANS'
        DataPipeline = bdeReconSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 140759
        mmTop = 3969
        mmWidth = 15875
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'ppDBCalc8'
        DataField = 'ENTTRANS'
        DataPipeline = bdeReconSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 163777
        mmTop = 3969
        mmWidth = 15875
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'ppDBCalc9'
        DataField = 'BAIESTRAGO'
        DataPipeline = bdeReconSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 185473
        mmTop = 3969
        mmWidth = 15875
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'ppDBCalc10'
        DataField = 'BAIACERTO'
        DataPipeline = bdeReconSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 208492
        mmTop = 3969
        mmWidth = 15875
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'ppDBCalc11'
        DataField = 'BAIXACC'
        DataPipeline = bdeReconSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 228865
        mmTop = 3969
        mmWidth = 15875
        BandType = 7
      end
      object ppLabel101: TppLabel
        UserName = 'ppLabel101'
        Caption = 'TOTAL DO PERÍODO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 26723
        mmTop = 3175
        mmWidth = 42069
        BandType = 7
      end
      object ppLine33: TppLine
        UserName = 'ppLine33'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'ppDBCalc12'
        DataField = 'SALDOATUAL'
        DataPipeline = bdeReconSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 247915
        mmTop = 3969
        mmWidth = 23019
        BandType = 7
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'DESCGRUPOPROD'
      DataPipeline = bdeReconSaldo
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppDBText32: TppDBText
          UserName = 'ppDBText32'
          AutoSize = True
          DataField = 'CODGRUPOPROD'
          DataPipeline = bdeReconSaldo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 794
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
        end
        object ppLine34: TppLine
          UserName = 'ppLine34'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5821
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText33: TppDBText
          UserName = 'ppDBText33'
          AutoSize = True
          DataField = 'DESCGRUPOPROD'
          DataPipeline = bdeReconSaldo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 31750
          mmTop = 794
          mmWidth = 29898
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppLine35: TppLine
          UserName = 'ppLine35'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLine36: TppLine
          UserName = 'ppLine36'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6615
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel102: TppLabel
          UserName = 'ppLabel102'
          Caption = 'Total do Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 6615
          mmTop = 1588
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc22: TppDBCalc
          UserName = 'ppDBCalc22'
          DataField = 'RECFORN'
          DataPipeline = bdeReconSaldo
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 95779
          mmTop = 1588
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc23: TppDBCalc
          UserName = 'ppDBCalc23'
          DataField = 'DEVFORN'
          DataPipeline = bdeReconSaldo
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 118798
          mmTop = 1588
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc24: TppDBCalc
          UserName = 'ppDBCalc24'
          DataField = 'BAITRANS'
          DataPipeline = bdeReconSaldo
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 140229
          mmTop = 1588
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc25: TppDBCalc
          UserName = 'ppDBCalc25'
          DataField = 'ENTTRANS'
          DataPipeline = bdeReconSaldo
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 164307
          mmTop = 1588
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc26: TppDBCalc
          UserName = 'ppDBCalc26'
          DataField = 'BAIESTRAGO'
          DataPipeline = bdeReconSaldo
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 185473
          mmTop = 1588
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc27: TppDBCalc
          UserName = 'ppDBCalc27'
          DataField = 'BAIACERTO'
          DataPipeline = bdeReconSaldo
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 208227
          mmTop = 1588
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc28: TppDBCalc
          UserName = 'ppDBCalc28'
          DataField = 'BAIXACC'
          DataPipeline = bdeReconSaldo
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 232569
          mmTop = 1588
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object ppDBText34: TppDBText
          UserName = 'ppDBText34'
          AutoSize = True
          DataField = 'DESCGRUPOPROD'
          DataPipeline = bdeReconSaldo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 29104
          mmTop = 1588
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc29: TppDBCalc
          UserName = 'ppDBCalc29'
          DataField = 'SALDOATUAL'
          DataPipeline = bdeReconSaldo
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 250826
          mmTop = 1588
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc30: TppDBCalc
          UserName = 'ppDBCalc30'
          DataField = 'SALDOINI'
          DataPipeline = bdeReconSaldo
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 77788
          mmTop = 1588
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object SqlParReconSaldo: TCMSqlParams
    SQL.Strings = (
      'SELECT UN.CODGRUPOPROD,'
      '       UN.DESCGRUPOPROD,'
      '       UN.STATUSGRUPO,'
      '       UN.CODARTIGO,'
      '       UN.DESCPROD,'
      '       SUM( UN.SALDOINI ) AS SALDOINI,'
      '       SUM( UN.SALDOFIM ) AS SALDOATUAL,'
      '       SUM( UN.RECFORN ) AS RECFORN,'
      '       SUM( UN.DEVFORN ) * -1 AS DEVFORN,'
      '       SUM( UN.BAITRANS ) * -1 AS BAITRANS,'
      '       SUM( UN.ENTTRANS ) AS ENTTRANS,'
      '       SUM( UN.BAIACERTO ) * -1 AS BAIACERTO,'
      '       SUM( UN.BAIESTRAGO ) * -1 AS BAIESTRAGO,'
      '       SUM( UN.BAIXACC ) * -1 AS BAIXACC,'
      
        '       ( SUM( UN.SALDOINI ) - SUM( UN.SALDOFIM ) + SUM( UN.RECFO' +
        'RN ) +'
      
        '         SUM( UN.DEVFORN ) + SUM( UN.BAITRANS ) + SUM( UN.ENTTRA' +
        'NS ) +'
      
        '         SUM( UN.BAIACERTO ) + SUM( UN.BAIESTRAGO ) + SUM( UN.BA' +
        'IXACC ) ) AS AJUSTE'
      'FROM ( ( SELECT P.CODGRUPOPROD,'
      '                G.DESCGRUPOPROD,'
      '                G.STATUSGRUPO,'
      '                MOV.CODARTIGO,'
      '                P.DESCPROD,'
      '                ( MOV.SALDOQTDEMOV ) AS SALDOINI,'
      '                ( 0 ) AS SALDOFIM,'
      '                ( 0 ) AS RECFORN,'
      '                ( 0 ) AS DEVFORN,'
      '                ( 0 ) AS BAITRANS,'
      '                ( 0 ) AS ENTTRANS,'
      '                ( 0 ) AS BAIACERTO,'
      '                ( 0 ) AS BAIESTRAGO,'
      '                ( 0 ) AS BAIXACC'
      '           FROM PRODUTO P,'
      '                ARTIGO A,'
      '                GRUPPROD G,'
      '                ( SELECT M.IDMOV,'
      '                         M.CODARTIGO,'
      '                         M.SALDOQTDEMOV,'
      '                         M.CUSTOMEDIOMOV,'
      '                         M.CODALMOXARIFADO,'
      '                         M.IDPESSOA'
      '                    FROM MOVIMENT M,'
      '                         ( SELECT M.CODARTIGO,'
      '                                  MAX( M.IDMOV ) AS IDMOV'
      '                             FROM MOVIMENT M,'
      '                                  ( SELECT CODARTIGO,'
      
        '                                           MAX( DATAMOV ) AS MAX' +
        'DATAMOV'
      '                                      FROM MOVIMENT'
      
        '                                     WHERE ( DATAMOV < :dataini ' +
        ')'
      
        '                                       AND ( CODALMOXARIFADO = :' +
        'almox )'
      '                                     GROUP BY CODARTIGO'
      '                                  ) SUB'
      
        '                            WHERE ( M.CODARTIGO = SUB.CODARTIGO ' +
        ')'
      '                              AND ( M.DATAMOV = SUB.MAXDATAMOV )'
      '                              AND ( M.CODALMOXARIFADO = :almox )'
      '                            GROUP BY M.CODARTIGO'
      '                         ) AUX'
      '                   WHERE ( M.CODARTIGO = AUX.CODARTIGO )'
      '                     AND ( M.CODALMOXARIFADO = :almox )'
      '                     AND ( M.IDMOV = AUX.IDMOV )'
      '                ) MOV'
      '          WHERE ( MOV.CODALMOXARIFADO = :almox )'
      '            AND ( MOV.IDPESSOA = :idempresa )'
      '            AND ( P.ITEMESTOCAVEL = :estoque )'
      '            AND ( MOV.CODARTIGO = A.CODARTIGO )'
      '            AND ( A.CODPRODUTO = P.CODPRODUTO )'
      '            AND ( G.CODGRUPOPROD = P.CODGRUPOPROD )'
      '       )'
      '       UNION ALL'
      '       ( SELECT P.CODGRUPOPROD,'
      '                G.DESCGRUPOPROD,'
      '                G.STATUSGRUPO,'
      '                M.CODARTIGO,'
      '                P.DESCPROD,'
      '                ( 0 ) AS SALDOINI,'
      '                ( 0 ) AS SALDOFIM,'
      
        '                SUM( DECODE( M.CODTIPOMOV, '#39'A'#39', M.QTDEMOV, 0 ) )' +
        ' AS RECFORN,'
      
        '                SUM( DECODE( M.CODTIPOMOV, '#39'K'#39', M.QTDEMOV, 0 ) )' +
        ' AS DEVFORN,'
      '                SUM( DECODE( M.CODTIPOMOV, '#39'F'#39', M.QTDEMOV,'
      '                                           '#39'T'#39', M.QTDEMOV,'
      '                                           '#39'G'#39', M.QTDEMOV,'
      '                                           '#39'U'#39', M.QTDEMOV,'
      
        '                                           '#39'R'#39', M.QTDEMOV, 0 ) )' +
        ' AS BAITRANS,'
      '                SUM( DECODE( M.CODTIPOMOV, '#39'S'#39', M.QTDEMOV,'
      
        '                                           '#39'B'#39', M.QTDEMOV, 0 ) )' +
        ' AS ENTTRANS,'
      '                SUM( DECODE( M.CODTIPOMOV, '#39'H'#39', M.QTDEMOV,'
      
        '                                           '#39'D'#39', M.QTDEMOV, 0 ) )' +
        ' AS BAIACERTO,'
      
        '                SUM( DECODE( M.CODTIPOMOV, '#39'I'#39', M.QTDEMOV, 0 ) )' +
        ' AS BAIESTRAGO,'
      '                SUM( DECODE( M.CODTIPOMOV, '#39'M'#39', M.QTDEMOV,'
      '                                           '#39'N'#39', M.QTDEMOV,'
      '                                           '#39'L'#39', M.QTDEMOV,'
      '                                           '#39'Q'#39', M.QTDEMOV,'
      '                                           '#39'J'#39', M.QTDEMOV,'
      '                                           '#39'V'#39', M.QTDEMOV,'
      '                                           '#39'X'#39', M.QTDEMOV,'
      '                                           '#39'W'#39', M.QTDEMOV,'
      '                                           '#39'O'#39', M.QTDEMOV,'
      '                                           '#39'E'#39', M.QTDEMOV,'
      '                                           '#39'P'#39', M.QTDEMOV,'
      
        '                                           '#39'Y'#39', M.QTDEMOV, 0 ) )' +
        ' AS BAIXACC'
      '           FROM PRODUTO P,'
      '                ARTIGO A,'
      '                GRUPPROD G,'
      '                MOVIMENT M'
      '          WHERE ( M.IDPESSOA = :idempresa )'
      '            AND ( M.CODALMOXARIFADO = :almox )'
      '            AND ( M.DATAMOV >= :dataini )'
      '            AND ( M.DATAMOV <= :datafim )'
      '            AND ( P.ITEMESTOCAVEL = :estoque )'
      '            AND ( M.CODARTIGO = A.CODARTIGO )'
      '            AND ( A.CODPRODUTO = P.CODPRODUTO )'
      '            AND ( G.CODGRUPOPROD = P.CODGRUPOPROD )'
      '          GROUP BY P.CODGRUPOPROD,'
      '                   G.DESCGRUPOPROD,'
      '                   G.STATUSGRUPO,'
      '                   M.CODARTIGO,'
      '                   P.DESCPROD'
      '       )'
      '       UNION ALL'
      '       ( SELECT P.CODGRUPOPROD,'
      '                G.DESCGRUPOPROD,'
      '                G.STATUSGRUPO,'
      '                MOV.CODARTIGO,'
      '                P.DESCPROD,'
      '                ( 0 ) AS SALDOINI,'
      '                ( MOV.SALDOQTDEMOV ) AS SALDOFIM,'
      '                ( 0 ) AS RECFORN,'
      '                ( 0 ) AS DEVFORN,'
      '                ( 0 ) AS BAITRANS,'
      '                ( 0 ) AS ENTTRANS,'
      '                ( 0 ) AS BAIACERTO,'
      '                ( 0 ) AS BAIESTRAGO,'
      '                ( 0 ) AS BAIXACC'
      '           FROM PRODUTO P,'
      '                ARTIGO A,'
      '                GRUPPROD G,'
      '                ( SELECT M.IDMOV,'
      '                         M.CODARTIGO,'
      '                         M.SALDOQTDEMOV,'
      '                         M.CUSTOMEDIOMOV,'
      '                         M.CODALMOXARIFADO,'
      '                         M.IDPESSOA'
      '                    FROM MOVIMENT M,'
      '                         ( SELECT M.CODARTIGO,'
      '                                  MAX( M.IDMOV ) AS IDMOV'
      '                             FROM MOVIMENT M,'
      '                                  ( SELECT CODARTIGO,'
      
        '                                           MAX( DATAMOV ) AS MAX' +
        'DATAMOV'
      '                                      FROM MOVIMENT'
      
        '                                     WHERE ( DATAMOV <= :datafim' +
        ' )'
      
        '                                       AND ( CODALMOXARIFADO = :' +
        'almox )'
      '                                     GROUP BY CODARTIGO'
      '                                  ) SUB'
      '                   WHERE ( M.CODARTIGO = SUB.CODARTIGO )'
      '                     AND ( M.DATAMOV = SUB.MAXDATAMOV )'
      '                     AND ( M.CODALMOXARIFADO = :almox )'
      '                   GROUP BY M.CODARTIGO'
      '                ) AUX'
      '          WHERE ( M.CODARTIGO = AUX.CODARTIGO )'
      '            AND ( M.CODALMOXARIFADO = :almox )'
      '            AND ( M.IDMOV = AUX.IDMOV )'
      '       ) MOV'
      ' WHERE ( MOV.IDPESSOA = :idempresa )'
      '   AND ( MOV.CODALMOXARIFADO = :almox )'
      '   AND ( P.ITEMESTOCAVEL = :estoque )'
      '   AND ( MOV.CODARTIGO = A.CODARTIGO )'
      '   AND ( A.CODPRODUTO = P.CODPRODUTO )'
      '   AND ( G.CODGRUPOPROD = P.CODGRUPOPROD )'
      ' ) ) UN'
      ''
      ' WHERE ( RTRIM( UN.CODGRUPOPROD ) LIKE :grupo )'
      ''
      ' GROUP BY UN.CODGRUPOPROD,'
      '          UN.DESCGRUPOPROD,'
      '          UN.STATUSGRUPO,'
      '          UN.CODARTIGO,'
      '          UN.DESCPROD'
      '')
    ClientDataSet = CdsReconSaldo
    Left = 200
    Top = 8
  end
  object CdsReconSaldo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 60
  end
end
