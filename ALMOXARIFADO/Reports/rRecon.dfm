inherited RptRecon: TRptRecon
  Width = 271
  Height = 151
  Caption = 'Reconciliação de Estoque'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Reconciliação de Estoque'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Unidade de Custeio'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CODCUSTEIO, DESCCUSTEIO'
          'FROM UNCUSTEI'
          'ORDER BY 2')
        LookupSettings.Chave = 'CODCUSTEIO'
        LookupSettings.Display = 'DESCCUSTEIO'
        LookupSettings.Descricao = 'DESCCUSTEIO'
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
        Name = 'Unidade de Custeio'
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
        Caption = 'Almoxarifado'
        Controle = tcLookupCombo
        TipodeDado = tdString
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
        Required = False
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
        MostraComboCompara = True
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
    Formheight = 248
    FormWidth = 480
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rptRecon
    LabelEmpresa = LblEmpresa
    LabelSistema = LbSistema
  end
  object bdeRecon: TppBDEPipeline
    DataSource = dsRecon
    UserName = 'bdeRecon'
    Left = 82
    Top = 58
    object bdeReconppField1: TppField
      FieldAlias = 'CODGRUPOPROD'
      FieldName = 'CODGRUPOPROD'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object bdeReconppField2: TppField
      FieldAlias = 'DESCGRUPOPROD'
      FieldName = 'DESCGRUPOPROD'
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
    object bdeReconppField3: TppField
      FieldAlias = 'STATUSGRUPO'
      FieldName = 'STATUSGRUPO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 2
    end
    object bdeReconppField4: TppField
      FieldAlias = 'CODARTIGO'
      FieldName = 'CODARTIGO'
      FieldLength = 14
      DisplayWidth = 14
      Position = 3
    end
    object bdeReconppField5: TppField
      FieldAlias = 'DESCPROD'
      FieldName = 'DESCPROD'
      FieldLength = 40
      DisplayWidth = 40
      Position = 4
    end
    object bdeReconppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOINI'
      FieldName = 'SALDOINI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object bdeReconppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TSALDOINI'
      FieldName = 'TSALDOINI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object bdeReconppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOATUAL'
      FieldName = 'SALDOATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object bdeReconppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'TSALDOATUAL'
      FieldName = 'TSALDOATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object bdeReconppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'RECFORN'
      FieldName = 'RECFORN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object bdeReconppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEVFORN'
      FieldName = 'DEVFORN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object bdeReconppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'BAITRANS'
      FieldName = 'BAITRANS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object bdeReconppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTTRANS'
      FieldName = 'ENTTRANS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object bdeReconppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'BAIACERTO'
      FieldName = 'BAIACERTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object bdeReconppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'BAIESTRAGO'
      FieldName = 'BAIESTRAGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object bdeReconppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'BAIXACC'
      FieldName = 'BAIXACC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object bdeReconppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'TRECFORN'
      FieldName = 'TRECFORN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object bdeReconppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'TDEVFORN'
      FieldName = 'TDEVFORN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object bdeReconppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'TBAITRANS'
      FieldName = 'TBAITRANS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object bdeReconppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'TENTTRANS'
      FieldName = 'TENTTRANS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object bdeReconppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'TBAIACERTO'
      FieldName = 'TBAIACERTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object bdeReconppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'TBAIESTRAGO'
      FieldName = 'TBAIESTRAGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object bdeReconppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'TBAIXACC'
      FieldName = 'TBAIXACC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object bdeReconppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'AJUSTE'
      FieldName = 'AJUSTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object bdeReconppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'TAJUSTE'
      FieldName = 'TAJUSTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
  end
  object dsRecon: TwwDataSource
    DataSet = CdsRecon
    Left = 138
    Top = 59
  end
  object rptRecon: TppReport
    AutoStop = False
    DataPipeline = bdeRecon
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
    Left = 22
    Top = 58
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 39688
      mmPrintPosition = 0
      object ppLabel9: TppLabel
        UserName = 'ppLabel9'
        Caption = 'RELATÓRIO DE RECONCILIAÇÃO EM VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 96044
        mmTop = 9525
        mmWidth = 92075
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
      object lbTituloAlmox: TppLabel
        UserName = 'lbTituloAlmox'
        Caption = 'Almoxarifado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 17463
        mmTop = 22754
        mmWidth = 23813
        BandType = 0
      end
      object lbAlmox3: TppLabel
        UserName = 'lbAlmox3'
        Caption = 'lbAlmox3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 42069
        mmTop = 22754
        mmWidth = 14817
        BandType = 0
      end
      object LbPeriodo: TppLabel
        UserName = 'LbPeriodo'
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
      object rptReconLine1: TppLine
        UserName = 'rptReconLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 28575
        mmWidth = 284300
        BandType = 0
      end
      object rptReconLabel2: TppLabel
        UserName = 'rptReconLabel2'
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
      object rptReconLabel3: TppLabel
        UserName = 'rptReconLabel3'
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
      object rptReconLabel4: TppLabel
        UserName = 'rptReconLabel4'
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
      object rptReconLabel5: TppLabel
        UserName = 'rptReconLabel5'
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
      object rptReconLabel6: TppLabel
        UserName = 'rptReconLabel6'
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
      object rptReconLabel7: TppLabel
        UserName = 'rptReconLabel7'
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
      object rptReconLabel8: TppLabel
        UserName = 'rptReconLabel8'
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
      object rptReconLabel9: TppLabel
        UserName = 'rptReconLabel9'
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
      object rptReconLabel10: TppLabel
        UserName = 'rptReconLabel10'
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
      object rptReconLabel11: TppLabel
        UserName = 'rptReconLabel11'
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
      object rptReconLabel12: TppLabel
        UserName = 'rptReconLabel12'
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
      object rptReconLabel13: TppLabel
        UserName = 'rptReconLabel13'
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
      object rptReconLabel14: TppLabel
        UserName = 'rptReconLabel14'
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
      object rptReconLabel15: TppLabel
        UserName = 'rptReconLabel15'
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
      object rptReconLabel17: TppLabel
        UserName = 'rptReconLabel17'
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
      object rptReconLabel20: TppLabel
        UserName = 'rptReconLabel20'
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
      object rptReconLine5: TppLine
        UserName = 'rptReconLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 39158
        mmWidth = 284300
        BandType = 0
      end
      object rptReconLabel23: TppLabel
        UserName = 'rptReconLabel23'
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
      object rptReconLabel24: TppLabel
        UserName = 'rptReconLabel24'
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
      object rptReconLabel16: TppLabel
        UserName = 'rptReconLabel16'
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
      object rptReconLabel21: TppLabel
        UserName = 'rptReconLabel21'
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
    object DetRecon: TppDetailBand
      BeforePrint = DetReconBeforePrint
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object rptReconDBText2: TppDBText
        UserName = 'rptReconDBText2'
        DataField = 'CODARTIGO'
        DataPipeline = bdeRecon
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
      object rptReconDBText3: TppDBText
        UserName = 'rptReconDBText3'
        DataField = 'DESCPROD'
        DataPipeline = bdeRecon
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
      object rptReconDBText5: TppDBText
        UserName = 'rptReconDBText5'
        DataField = 'RECFORN'
        DataPipeline = bdeRecon
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
      object rptReconDBText6: TppDBText
        UserName = 'rptReconDBText6'
        DataField = 'DEVFORN'
        DataPipeline = bdeRecon
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
      object rptReconDBText7: TppDBText
        UserName = 'rptReconDBText7'
        DataField = 'BAITRANS'
        DataPipeline = bdeRecon
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
      object rptReconDBText8: TppDBText
        UserName = 'rptReconDBText8'
        DataField = 'ENTTRANS'
        DataPipeline = bdeRecon
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
      object rptReconDBText9: TppDBText
        UserName = 'rptReconDBText9'
        DataField = 'BAIESTRAGO'
        DataPipeline = bdeRecon
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
      object rptReconDBText10: TppDBText
        UserName = 'rptReconDBText10'
        DataField = 'BAIACERTO'
        DataPipeline = bdeRecon
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
      object rptReconDBText11: TppDBText
        UserName = 'rptReconDBText11'
        DataField = 'BAIXACC'
        DataPipeline = bdeRecon
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
      object rptReconDBText12: TppDBText
        UserName = 'rptReconDBText12'
        AutoSize = True
        DataField = 'SALDOATUAL'
        DataPipeline = bdeRecon
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
      object rptReconLabel22: TppLabel
        UserName = 'rptReconLabel22'
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
      object rptReconDBText14: TppDBText
        UserName = 'rptReconDBText14'
        DataField = 'SALDOINI'
        DataPipeline = bdeRecon
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
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine5: TppLine
        UserName = 'ppLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 8
      end
      object LbSistema: TppLabel
        UserName = 'LbSistema'
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
      object ppCalc6: TppSystemVariable
        UserName = 'Calc6'
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
        mmLeft = 246328
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
    object rptReconSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 11906
      mmPrintPosition = 0
      object rptReconDBCalc15: TppDBCalc
        UserName = 'rptReconDBCalc15'
        DataField = 'SALDOINI'
        DataPipeline = bdeRecon
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 69850
        mmTop = 3969
        mmWidth = 23813
        BandType = 7
      end
      object rptReconDBCalc16: TppDBCalc
        UserName = 'rptReconDBCalc16'
        DataField = 'DEVFORN'
        DataPipeline = bdeRecon
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 115359
        mmTop = 3969
        mmWidth = 19050
        BandType = 7
      end
      object rptReconDBCalc17: TppDBCalc
        UserName = 'rptReconDBCalc17'
        DataField = 'BAITRANS'
        DataPipeline = bdeRecon
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
      object rptReconDBCalc18: TppDBCalc
        UserName = 'rptReconDBCalc18'
        DataField = 'ENTTRANS'
        DataPipeline = bdeRecon
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
      object rptReconDBCalc19: TppDBCalc
        UserName = 'rptReconDBCalc19'
        DataField = 'BAIESTRAGO'
        DataPipeline = bdeRecon
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
      object rptReconDBCalc20: TppDBCalc
        UserName = 'rptReconDBCalc20'
        DataField = 'BAIACERTO'
        DataPipeline = bdeRecon
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
      object rptReconDBCalc21: TppDBCalc
        UserName = 'rptReconDBCalc21'
        DataField = 'BAIXACC'
        DataPipeline = bdeRecon
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
      object rptReconLabel19: TppLabel
        UserName = 'rptReconLabel19'
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
      object rptReconLine4: TppLine
        UserName = 'rptReconLine4'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 7
      end
      object rptReconDBCalc24: TppDBCalc
        UserName = 'rptReconDBCalc24'
        DataField = 'SALDOATUAL'
        DataPipeline = bdeRecon
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
      object rptReconDBCalc2: TppDBCalc
        UserName = 'rptReconDBCalc2'
        DataField = 'RECFORN'
        DataPipeline = bdeRecon
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 96573
        mmTop = 3969
        mmWidth = 15875
        BandType = 7
      end
    end
    object rptReconGroup1: TppGroup
      BreakName = 'DESCGRUPOPROD'
      DataPipeline = bdeRecon
      UserName = 'rptReconGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object GrpRecon: TppGroupHeaderBand
        BeforePrint = GrpReconBeforePrint
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object rptReconDBText1: TppDBText
          UserName = 'rptReconDBText1'
          AutoSize = True
          DataField = 'CODGRUPOPROD'
          DataPipeline = bdeRecon
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
        object ppLine4: TppLine
          UserName = 'ppLine4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5821
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object rptReconDBText13: TppDBText
          UserName = 'rptReconDBText13'
          AutoSize = True
          DataField = 'DESCGRUPOPROD'
          DataPipeline = bdeRecon
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
        object LblTotSaldoIni: TppDBCalc
          UserName = 'LblTotSaldoIni'
          DataField = 'TSALDOINI'
          DataPipeline = bdeRecon
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          ResetGroup = rptReconGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 77788
          mmTop = 1588
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object LblTotRecForn: TppDBCalc
          UserName = 'LblTotRecForn'
          DataField = 'TRECFORN'
          DataPipeline = bdeRecon
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          ResetGroup = rptReconGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 95779
          mmTop = 1588
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object LblTotDevForn: TppDBCalc
          UserName = 'LblTotDevForn'
          DataField = 'TDEVFORN'
          DataPipeline = bdeRecon
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          ResetGroup = rptReconGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 118798
          mmTop = 1588
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object LblTotBaiTrans: TppDBCalc
          UserName = 'LblTotBaiTrans'
          DataField = 'TBAITRANS'
          DataPipeline = bdeRecon
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          ResetGroup = rptReconGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 140229
          mmTop = 1588
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object LblTotEntTrans: TppDBCalc
          UserName = 'LblTotEntTrans'
          DataField = 'TENTTRANS'
          DataPipeline = bdeRecon
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          ResetGroup = rptReconGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 164307
          mmTop = 1588
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object LblTotBaiEstrago: TppDBCalc
          UserName = 'LblTotBaiEstrago'
          DataField = 'TBAIESTRAGO'
          DataPipeline = bdeRecon
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          ResetGroup = rptReconGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 185473
          mmTop = 1588
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object LblTotBaiAcerto: TppDBCalc
          UserName = 'LblTotBaiAcerto'
          DataField = 'TBAIACERTO'
          DataPipeline = bdeRecon
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          ResetGroup = rptReconGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 208227
          mmTop = 1588
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object LblTotBaiCC: TppDBCalc
          UserName = 'LblTotBaiCC'
          DataField = 'TBAIXACC'
          DataPipeline = bdeRecon
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          ResetGroup = rptReconGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 232569
          mmTop = 1588
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object LblTotSaldoAtual: TppDBCalc
          UserName = 'LblTotSaldoAtual'
          DataField = 'TSALDOATUAL'
          DataPipeline = bdeRecon
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          ResetGroup = rptReconGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 250826
          mmTop = 1588
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
      end
      object RodapeRecon: TppGroupFooterBand
        BeforePrint = RodapeReconBeforePrint
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object rptReconLine2: TppLine
          UserName = 'rptReconLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object rptReconLine3: TppLine
          UserName = 'rptReconLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6615
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object rptReconLabel18: TppLabel
          UserName = 'rptReconLabel18'
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
        object rptReconDBCalc8: TppDBCalc
          UserName = 'rptReconDBCalc8'
          DataField = 'RECFORN'
          DataPipeline = bdeRecon
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rptReconGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 95779
          mmTop = 1588
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object rptReconDBCalc9: TppDBCalc
          UserName = 'rptReconDBCalc9'
          DataField = 'DEVFORN'
          DataPipeline = bdeRecon
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rptReconGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 118798
          mmTop = 1588
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object rptReconDBCalc10: TppDBCalc
          UserName = 'rptReconDBCalc10'
          DataField = 'BAITRANS'
          DataPipeline = bdeRecon
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rptReconGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 140229
          mmTop = 1588
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object rptReconDBCalc11: TppDBCalc
          UserName = 'rptReconDBCalc11'
          DataField = 'ENTTRANS'
          DataPipeline = bdeRecon
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rptReconGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 164307
          mmTop = 1588
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object rptReconDBCalc12: TppDBCalc
          UserName = 'rptReconDBCalc12'
          DataField = 'BAIESTRAGO'
          DataPipeline = bdeRecon
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rptReconGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 185473
          mmTop = 1588
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object rptReconDBCalc13: TppDBCalc
          UserName = 'rptReconDBCalc13'
          DataField = 'BAIACERTO'
          DataPipeline = bdeRecon
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rptReconGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 208227
          mmTop = 1588
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object rptReconDBCalc14: TppDBCalc
          UserName = 'rptReconDBCalc14'
          DataField = 'BAIXACC'
          DataPipeline = bdeRecon
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rptReconGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 232569
          mmTop = 1588
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object rptReconDBText4: TppDBText
          UserName = 'rptReconDBText4'
          AutoSize = True
          DataField = 'DESCGRUPOPROD'
          DataPipeline = bdeRecon
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
        object rptReconDBCalc22: TppDBCalc
          UserName = 'rptReconDBCalc22'
          DataField = 'SALDOATUAL'
          DataPipeline = bdeRecon
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rptReconGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 250826
          mmTop = 1588
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object rptReconDBCalc1: TppDBCalc
          UserName = 'rptReconDBCalc1'
          AutoSize = True
          DataField = 'SALDOINI'
          DataPipeline = bdeRecon
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rptReconGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 69850
          mmTop = 1323
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object SqlParRecon: TCMSqlParams
    SQL.Strings = (
      'SELECT UN.CODGRUPOPROD,'
      '       UN.DESCGRUPOPROD,'
      '       UN.STATUSGRUPO,'
      '       UN.CODARTIGO,'
      '       UN.DESCPROD,'
      '       SUM( UN.SALDOINI )         AS SALDOINI,'
      '       SUM( UN.TSALDOINI )        AS TSALDOINI,'
      '       SUM( UN.SALDOFIM )         AS SALDOATUAL,'
      '       SUM( UN.TSALDOFIM )        AS TSALDOATUAL,'
      '       SUM( UN.RECFORN )          AS RECFORN,'
      '       SUM( UN.DEVFORN ) * -1     AS DEVFORN,'
      '       SUM( UN.BAITRANS ) * -1    AS BAITRANS,'
      '       SUM( UN.ENTTRANS )         AS ENTTRANS,'
      '       SUM( UN.BAIACERTO ) * -1   AS BAIACERTO,'
      '       SUM( UN.BAIESTRAGO ) * -1  AS BAIESTRAGO,'
      '       SUM( UN.BAIXACC ) * -1     AS BAIXACC,'
      '       SUM( UN.TRECFORN )         AS TRECFORN,'
      '       SUM( UN.TDEVFORN ) * -1    AS TDEVFORN,'
      '       SUM( UN.TBAITRANS ) * -1   AS TBAITRANS,'
      '       SUM( UN.TENTTRANS )        AS TENTTRANS,'
      '       SUM( UN.TBAIACERTO ) * -1  AS TBAIACERTO,'
      '       SUM( UN.TBAIESTRAGO ) * -1 AS TBAIESTRAGO,'
      '       SUM( UN.TBAIXACC ) * -1    AS TBAIXACC,'
      
        '       ( SUM( UN.SALDOINI )   - SUM( UN.SALDOFIM )    + SUM( UN.' +
        'RECFORN ) +'
      
        '         SUM( UN.DEVFORN )    + SUM( UN.BAITRANS )    + SUM( UN.' +
        'ENTTRANS ) +'
      
        '         SUM( UN.BAIACERTO )  + SUM( UN.BAIESTRAGO )  + SUM( UN.' +
        'BAIXACC ) ) AS AJUSTE,'
      
        '       ( SUM( UN.TSALDOINI )  - SUM( UN.TSALDOFIM )   + SUM( UN.' +
        'TRECFORN ) +'
      
        '         SUM( UN.TDEVFORN )   + SUM( UN.TBAITRANS )   + SUM( UN.' +
        'TENTTRANS ) +'
      
        '         SUM( UN.TBAIACERTO ) + SUM( UN.TBAIESTRAGO ) + SUM( UN.' +
        'TBAIXACC ) ) AS TAJUSTE'
      '  FROM ( ( SELECT P.CODGRUPOPROD,'
      '                  G.DESCGRUPOPROD,'
      '                  G.STATUSGRUPO,'
      '                  MOV.CODARTIGO,'
      '                  P.DESCPROD,'
      
        '                  ( MOV.SALDOQTDEMOV * MOV.CUSTOMEDIOMOV ) AS SA' +
        'LDOINI,'
      '                  ( 0 ) AS TSALDOINI,'
      '                  ( 0 ) AS SALDOFIM,'
      '                  ( 0 ) AS TSALDOFIM,'
      '                  ( 0 ) AS RECFORN,'
      '                  ( 0 ) AS DEVFORN,'
      '                  ( 0 ) AS BAITRANS,'
      '                  ( 0 ) AS ENTTRANS,'
      '                  ( 0 ) AS BAIACERTO,'
      '                  ( 0 ) AS BAIESTRAGO,'
      '                  ( 0 ) AS BAIXACC,'
      '                  ( 0 ) AS TRECFORN,'
      '                  ( 0 ) AS TDEVFORN,'
      '                  ( 0 ) AS TBAITRANS,'
      '                  ( 0 ) AS TENTTRANS,'
      '                  ( 0 ) AS TBAIACERTO,'
      '                  ( 0 ) AS TBAIESTRAGO,'
      '                  ( 0 ) AS TBAIXACC'
      '             FROM PRODUTO P,'
      '                  ARTIGO A,'
      '                  GRUPPROD G,'
      '                  ( SELECT M.IDMOV,'
      '                           M.CODARTIGO,'
      '                           M.SALDOQTDEMOV,'
      '                           M.CUSTOMEDIOMOV,'
      '                           M.CODALMOXARIFADO,'
      '                           M.IDPESSOA'
      '                      FROM MOVIMENT M,'
      
        '                           ( SELECT M.CODARTIGO, M.CODALMOXARIFA' +
        'DO,'
      '                                    MAX( M.IDMOV ) AS IDMOV'
      '                               FROM MOVIMENT M,'
      
        '                                    ( SELECT CODARTIGO, CODALMOX' +
        'ARIFADO,'
      
        '                                             MAX( DATAMOV ) AS M' +
        'AXDATAMOV'
      '                                        FROM MOVIMENT'
      
        '                                       WHERE ( DATAMOV < :datain' +
        'i )'
      
        '                                         AND ( CODALMOXARIFADO I' +
        'N ( :almox ) )'
      
        '                                       GROUP BY CODARTIGO,CODALM' +
        'OXARIFADO'
      '                                    ) SUB'
      
        '                              WHERE ( M.CODARTIGO = SUB.CODARTIG' +
        'O )'
      
        '                                AND ( M.CODALMOXARIFADO = SUB.CO' +
        'DALMOXARIFADO )'
      
        '                                AND ( M.DATAMOV = SUB.MAXDATAMOV' +
        ' )'
      
        '                                AND ( M.CODALMOXARIFADO IN ( :al' +
        'mox ) )'
      
        '                              GROUP BY M.CODARTIGO, M.CODALMOXAR' +
        'IFADO'
      '                           ) AUX'
      '                     WHERE ( M.CODARTIGO = AUX.CODARTIGO )'
      
        '                       AND ( M.CODALMOXARIFADO = AUX.CODALMOXARI' +
        'FADO )'
      '                       AND ( M.CODALMOXARIFADO IN ( :almox ) )'
      '                       AND ( M.IDMOV = AUX.IDMOV )'
      '                  ) MOV'
      '            WHERE ( MOV.IDPESSOA = :idempresa )'
      '              AND ( MOV.CODALMOXARIFADO IN ( :almox ) )'
      '              AND ( P.ITEMESTOCAVEL = :estoque )'
      '              AND ( MOV.CODARTIGO = A.CODARTIGO )'
      '              AND ( A.CODPRODUTO = P.CODPRODUTO )'
      '              AND ( G.CODGRUPOPROD = P.CODGRUPOPROD )'
      '         )'
      '         UNION ALL'
      '         ( SELECT G.CODGRUPOPROD,'
      '                  G.DESCGRUPOPROD,'
      '                  G.STATUSGRUPO,'
      '                  ( '#39#39' ) AS CODARTIGO,'
      '                  ( '#39#39' ) AS DESCPROD,'
      '                  ( 0 )  AS SALDOINI,'
      
        '                  ( SUM( MOV.SALDOQTDEMOV * MOV.CUSTOMEDIOMOV ) ' +
        ') AS TSALDOINI,'
      '                  ( 0 )  AS SALDOFIM,'
      '                  ( 0 )  AS TSALDOFIM,'
      '                  ( 0 )  AS RECFORN,'
      '                  ( 0 )  AS DEVFORN,'
      '                  ( 0 )  AS BAITRANS,'
      '                  ( 0 )  AS ENTTRANS,'
      '                  ( 0 )  AS BAIACERTO,'
      '                  ( 0 )  AS BAIESTRAGO,'
      '                  ( 0 )  AS BAIXACC,'
      '                  ( 0 )  AS TRECFORN,'
      '                  ( 0 )  AS TDEVFORN,'
      '                  ( 0 )  AS TBAITRANS,'
      '                  ( 0 )  AS TENTTRANS,'
      '                  ( 0 )  AS TBAIACERTO,'
      '                  ( 0 )  AS TBAIESTRAGO,'
      '                  ( 0 )  AS TBAIXACC'
      '             FROM PRODUTO P,'
      '                  ARTIGO A,'
      '                  GRUPPROD G,'
      '                  ( SELECT M.IDMOV,'
      '                           M.CODARTIGO,'
      '                           M.SALDOQTDEMOV,'
      '                           M.CUSTOMEDIOMOV,'
      '                           M.CODALMOXARIFADO,'
      '                           M.IDPESSOA'
      '                      FROM MOVIMENT M,'
      
        '                           ( SELECT M.CODARTIGO, M.CODALMOXARIFA' +
        'DO,'
      '                                    MAX( M.IDMOV ) AS IDMOV'
      '                               FROM MOVIMENT M,'
      
        '                                    ( SELECT CODARTIGO, CODALMOX' +
        'ARIFADO,'
      
        '                                             MAX( DATAMOV ) AS M' +
        'AXDATAMOV'
      '                                        FROM MOVIMENT'
      
        '                                       WHERE ( DATAMOV < :datain' +
        'i )'
      
        '                                         AND ( CODALMOXARIFADO I' +
        'N ( :almox ) )'
      
        '                                       GROUP BY CODARTIGO, CODAL' +
        'MOXARIFADO'
      '                                    ) SUB'
      
        '                              WHERE ( M.CODARTIGO = SUB.CODARTIG' +
        'O )'
      
        '                                AND ( M.CODALMOXARIFADO = SUB.CO' +
        'DALMOXARIFADO )'
      
        '                                AND ( M.DATAMOV = SUB.MAXDATAMOV' +
        ' )'
      
        '                                AND ( M.CODALMOXARIFADO IN ( :al' +
        'mox ) )'
      
        '                              GROUP BY M.CODARTIGO, M.CODALMOXAR' +
        'IFADO'
      '                           ) AUX'
      '                     WHERE ( M.CODARTIGO = AUX.CODARTIGO )'
      
        '                       AND ( M.CODALMOXARIFADO = AUX.CODALMOXARI' +
        'FADO )'
      '                       AND ( M.CODALMOXARIFADO IN ( :almox ) )'
      '                       AND ( M.IDMOV = AUX.IDMOV )'
      '                  ) MOV'
      '            WHERE ( MOV.IDPESSOA = :idempresa )'
      '              AND ( MOV.CODALMOXARIFADO IN ( :almox ) )'
      '              AND ( P.ITEMESTOCAVEL = :estoque )'
      '              AND ( MOV.CODARTIGO = A.CODARTIGO)'
      '              AND ( A.CODPRODUTO = P.CODPRODUTO)'
      
        '              AND ( G.CODGRUPOPROD LIKE SUBSTR( RTRIM( P.CODGRUP' +
        'OPROD ), 1, :tamanho ) || '#39'%'#39' )'
      
        '              AND ( LENGTH( RTRIM( G.CODGRUPOPROD ) ) <= :tamanh' +
        'o )'
      '              AND ( G.STATUSGRUPO = '#39'S'#39' )'
      '            GROUP BY G.CODGRUPOPROD,'
      '                     G.DESCGRUPOPROD,'
      '                     G.STATUSGRUPO'
      '         )'
      '         UNION ALL'
      '         ( SELECT P.CODGRUPOPROD,'
      '                  G.DESCGRUPOPROD,'
      '                  G.STATUSGRUPO,'
      '                  M.CODARTIGO,'
      '                  P.DESCPROD,'
      '                  ( 0 ) AS SALDOINI,'
      '                  ( 0 ) AS TSALDOINI,'
      '                  ( 0 ) AS SALDOFIM,'
      '                  ( 0 ) AS TSALDOFIM,'
      
        '                  SUM( DECODE( M.CODTIPOMOV, '#39'A'#39', M.VALORMOV, 0 ' +
        ') ) AS RECFORN,'
      
        '                  SUM( DECODE( M.CODTIPOMOV, '#39'K'#39', M.VALORMOV, 0 ' +
        ') ) AS DEVFORN,'
      '                  SUM( DECODE( M.CODTIPOMOV, '#39'F'#39', M.VALORMOV,'
      '                                             '#39'T'#39', M.VALORMOV,'
      '                                             '#39'G'#39', M.VALORMOV,'
      '                                             '#39'U'#39', M.VALORMOV,'
      
        '                                             '#39'R'#39', M.VALORMOV, 0 ' +
        ') ) AS BAITRANS,'
      '                  SUM( DECODE( M.CODTIPOMOV, '#39'S'#39', M.VALORMOV,'
      '                                             '#39'C'#39', M.VALORMOV,'
      
        '                                             '#39'B'#39', M.VALORMOV, 0 ' +
        ') ) AS ENTTRANS,'
      '                  SUM( DECODE( M.CODTIPOMOV, '#39'H'#39', M.VALORMOV,'
      '                                             '#39'b'#39', M.VALORMOV,'
      '                                             '#39'a'#39', M.VALORMOV,'
      
        '                                             '#39'D'#39', M.VALORMOV, 0 ' +
        ') ) AS BAIACERTO,'
      
        '                  SUM( DECODE( M.CODTIPOMOV, '#39'I'#39', M.VALORMOV, 0 ' +
        ') ) AS BAIESTRAGO,'
      '                  SUM( DECODE( M.CODTIPOMOV, '#39'M'#39', M.VALORMOV,'
      '                                             '#39'N'#39', M.VALORMOV,'
      '                                             '#39'L'#39', M.VALORMOV,'
      '                                             '#39'Q'#39', M.VALORMOV,'
      '                                             '#39'J'#39', M.VALORMOV,'
      '                                             '#39'V'#39', M.VALORMOV,'
      '                                             '#39'X'#39', M.VALORMOV,'
      '                                             '#39'W'#39', M.VALORMOV,'
      '                                             '#39'O'#39', M.VALORMOV,'
      '                                             '#39'E'#39', M.VALORMOV,'
      '                                             '#39'P'#39', M.VALORMOV,'
      
        '                                             '#39'Y'#39', M.VALORMOV, 0 ' +
        ') ) AS BAIXACC,'
      '                  ( 0 ) AS TRECFORN,'
      '                  ( 0 ) AS TDEVFORN,'
      '                  ( 0 ) AS TBAITRANS,'
      '                  ( 0 ) AS TENTTRANS,'
      '                  ( 0 ) AS TBAIACERTO,'
      '                  ( 0 ) AS TBAIESTRAGO,'
      '                  ( 0 ) AS TBAIXACC'
      '             FROM PRODUTO P,'
      '                  ARTIGO A,'
      '                  GRUPPROD G,'
      '                  MOVIMENT M'
      '            WHERE ( M.IDPESSOA = :idempresa )'
      '              AND ( M.CODALMOXARIFADO IN ( :almox ) )'
      '              AND ( M.DATAMOV >= :dataini )'
      '              AND ( M.DATAMOV <= :datafim )'
      '              AND ( P.ITEMESTOCAVEL = :estoque )'
      '              AND ( M.CODARTIGO = A.CODARTIGO )'
      '              AND ( A.CODPRODUTO = P.CODPRODUTO )'
      '              AND ( G.CODGRUPOPROD = P.CODGRUPOPROD )'
      '            GROUP BY P.CODGRUPOPROD,'
      '                     G.DESCGRUPOPROD,'
      '                     G.STATUSGRUPO,'
      '                     M.CODARTIGO,'
      '                     P.DESCPROD'
      '         )'
      '         UNION ALL'
      '         ( SELECT G.CODGRUPOPROD,'
      '                  G.DESCGRUPOPROD,'
      '                  G.STATUSGRUPO,'
      '                  ( '#39#39' ) AS CODARTIGO,'
      '                  ( '#39#39' ) AS DESCPROD,'
      '                  ( 0 )  AS SALDOINI,'
      '                  ( 0 )  AS TSALDOINI,'
      '                  ( 0 )  AS SALDOFIM,'
      '                  ( 0 )  AS TSALDOFIM,'
      '                  ( 0 )  AS RECFORN,'
      '                  ( 0 )  AS DEVFORN,'
      '                  ( 0 )  AS BAITRANS,'
      '                  ( 0 )  AS ENTTRANS,'
      '                  ( 0 )  AS BAIACERTO,'
      '                  ( 0 )  AS BAIESTRAGO,'
      '                  ( 0 )  AS BAIXACC,'
      
        '                  SUM( DECODE( M.CODTIPOMOV, '#39'A'#39', M.VALORMOV, 0 ' +
        ') ) AS TRECFORN,'
      
        '                  SUM( DECODE( M.CODTIPOMOV, '#39'K'#39', M.VALORMOV, 0 ' +
        ') ) AS TDEVFORN,'
      '                  SUM( DECODE( M.CODTIPOMOV, '#39'F'#39', M.VALORMOV,'
      '                                             '#39'T'#39', M.VALORMOV,'
      '                                             '#39'G'#39', M.VALORMOV,'
      '                                             '#39'U'#39', M.VALORMOV,'
      
        '                                             '#39'R'#39', M.VALORMOV, 0 ' +
        ') ) AS TBAITRANS,'
      '                  SUM( DECODE( M.CODTIPOMOV, '#39'S'#39', M.VALORMOV,'
      '                                             '#39'C'#39', M.VALORMOV,'
      
        '                                             '#39'B'#39', M.VALORMOV, 0 ' +
        ') ) AS TENTTRANS,'
      '                  SUM( DECODE( M.CODTIPOMOV, '#39'H'#39', M.VALORMOV,'
      '                                             '#39'b'#39', M.VALORMOV,'
      '                                             '#39'a'#39', M.VALORMOV,'
      
        '                                             '#39'D'#39', M.VALORMOV, 0 ' +
        ') ) AS TBAIACERTO,'
      
        '                  SUM( DECODE( M.CODTIPOMOV, '#39'I'#39', M.VALORMOV, 0 ' +
        ') ) AS TBAIESTRAGO,'
      '                  SUM( DECODE( M.CODTIPOMOV, '#39'M'#39', M.VALORMOV,'
      '                                             '#39'N'#39', M.VALORMOV,'
      '                                             '#39'L'#39', M.VALORMOV,'
      '                                             '#39'Q'#39', M.VALORMOV,'
      '                                             '#39'J'#39', M.VALORMOV,'
      '                                             '#39'V'#39', M.VALORMOV,'
      '                                             '#39'X'#39', M.VALORMOV,'
      '                                             '#39'W'#39', M.VALORMOV,'
      '                                             '#39'O'#39', M.VALORMOV,'
      '                                             '#39'E'#39', M.VALORMOV,'
      '                                             '#39'P'#39', M.VALORMOV,'
      
        '                                             '#39'Y'#39', M.VALORMOV, 0 ' +
        ') ) AS TBAIXACC'
      '             FROM PRODUTO P,'
      '                  ARTIGO A,'
      '                  GRUPPROD G,'
      '                  MOVIMENT M'
      '            WHERE ( M.IDPESSOA = :idempresa )'
      '              AND ( M.CODALMOXARIFADO IN ( :almox ) )'
      '              AND ( P.ITEMESTOCAVEL = :estoque )'
      '              AND ( M.CODARTIGO = A.CODARTIGO )'
      '              AND ( M.DATAMOV >= :dataini )'
      '              AND ( M.DATAMOV <= :datafim )'
      '              AND ( A.CODPRODUTO = P.CODPRODUTO )'
      
        '              AND ( G.CODGRUPOPROD LIKE SUBSTR( RTRIM( P.CODGRUP' +
        'OPROD ), 1, :tamanho ) || '#39'%'#39' )'
      
        '              AND ( LENGTH( RTRIM( G.CODGRUPOPROD ) ) <= :tamanh' +
        'o )'
      '              AND ( G.STATUSGRUPO = '#39'S'#39' )'
      '            GROUP BY G.CODGRUPOPROD,'
      '                     G.DESCGRUPOPROD,'
      '                     G.STATUSGRUPO'
      '         )'
      '         UNION ALL'
      '         ( SELECT P.CODGRUPOPROD,'
      '                  G.DESCGRUPOPROD,'
      '                  G.STATUSGRUPO,'
      '                  MOV.CODARTIGO,'
      '                  P.DESCPROD,'
      '                  ( 0 ) AS SALDOINI,'
      '                  ( 0 ) AS TSALDOINI,'
      
        '                  ( MOV.SALDOQTDEMOV * MOV.CUSTOMEDIOMOV ) AS SA' +
        'LDOFIM,'
      '                  ( 0 ) AS TSALDOFIM,'
      '                  ( 0 ) AS RECFORN,'
      '                  ( 0 ) AS DEVFORN,'
      '                  ( 0 ) AS BAITRANS,'
      '                  ( 0 ) AS ENTTRANS,'
      '                  ( 0 ) AS BAIACERTO,'
      '                  ( 0 ) AS BAIESTRAGO,'
      '                  ( 0 ) AS BAIXACC,'
      '                  ( 0 ) AS TRECFORN,'
      '                  ( 0 ) AS TDEVFORN,'
      '                  ( 0 ) AS TBAITRANS,'
      '                  ( 0 ) AS TENTTRANS,'
      '                  ( 0 ) AS TBAIACERTO,'
      '                  ( 0 ) AS TBAIESTRAGO,'
      '                  ( 0 ) AS TBAIXACC'
      '             FROM PRODUTO P,'
      '                  ARTIGO A,'
      '                  GRUPPROD G,'
      '                  ( SELECT M.IDMOV,'
      '                           M.CODARTIGO,'
      '                           M.SALDOQTDEMOV,'
      '                           M.CUSTOMEDIOMOV,'
      '                           M.CODALMOXARIFADO,'
      '                           M.IDPESSOA'
      '                      FROM MOVIMENT M,'
      
        '                           ( SELECT M.CODARTIGO, M.CODALMOXARIFA' +
        'DO,'
      '                                    MAX( M.IDMOV ) AS IDMOV'
      '                               FROM MOVIMENT M,'
      
        '                                    ( SELECT CODARTIGO, CODALMOX' +
        'ARIFADO,'
      
        '                                             MAX( DATAMOV ) AS M' +
        'AXDATAMOV'
      '                                        FROM MOVIMENT'
      
        '                                       WHERE ( DATAMOV <= :dataf' +
        'im )'
      
        '                                         AND ( CODALMOXARIFADO I' +
        'N ( :almox ) )'
      
        '                                       GROUP BY CODARTIGO, CODAL' +
        'MOXARIFADO'
      '                                    ) SUB'
      
        '                              WHERE ( M.CODARTIGO = SUB.CODARTIG' +
        'O )'
      
        '                                AND ( M.CODALMOXARIFADO = SUB.CO' +
        'DALMOXARIFADO )'
      
        '                                AND ( M.DATAMOV = SUB.MAXDATAMOV' +
        ' )'
      
        '                                AND ( M.CODALMOXARIFADO IN ( :al' +
        'mox ) )'
      
        '                              GROUP BY M.CODARTIGO, M.CODALMOXAR' +
        'IFADO'
      '                           ) AUX'
      '                     WHERE ( M.CODARTIGO = AUX.CODARTIGO )'
      
        '                       AND ( M.CODALMOXARIFADO = AUX.CODALMOXARI' +
        'FADO )'
      '                       AND ( M.CODALMOXARIFADO IN ( :almox ) )'
      '                       AND ( M.IDMOV = AUX.IDMOV )'
      '                  ) MOV'
      '               WHERE ( MOV.IDPESSOA = :idempresa )'
      '                 AND ( MOV.CODALMOXARIFADO IN ( :almox ) )'
      '                 AND ( P.ITEMESTOCAVEL = :estoque )'
      '                 AND ( MOV.CODARTIGO = A.CODARTIGO )'
      '                 AND ( A.CODPRODUTO = P.CODPRODUTO )'
      '                 AND ( G.CODGRUPOPROD = P.CODGRUPOPROD )'
      '         )'
      '         UNION ALL'
      '         ( SELECT G.CODGRUPOPROD,'
      '                  G.DESCGRUPOPROD,'
      '                  G.STATUSGRUPO,'
      '                  ( '#39#39' ) AS CODARTIGO,'
      '                  ( '#39#39' ) AS DESCPROD,'
      '                  ( 0 )  AS SALDOINI,'
      '                  ( 0 )  AS TSALDOINI,'
      '                  ( 0 )  AS SALDOFIM,'
      
        '                  ( SUM( MOV.SALDOQTDEMOV * MOV.CUSTOMEDIOMOV ) ' +
        ') AS TSALDOFIM,'
      '                  ( 0 )  AS RECFORN,'
      '                  ( 0 )  AS DEVFORN,'
      '                  ( 0 )  AS BAITRANS,'
      '                  ( 0 )  AS ENTTRANS,'
      '                  ( 0 )  AS BAIACERTO,'
      '                  ( 0 )  AS BAIESTRAGO,'
      '                  ( 0 )  AS BAIXACC,'
      '                  ( 0 )  AS TRECFORN,'
      '                  ( 0 )  AS TDEVFORN,'
      '                  ( 0 )  AS TBAITRANS,'
      '                  ( 0 )  AS TENTTRANS,'
      '                  ( 0 )  AS TBAIACERTO,'
      '                  ( 0 )  AS TBAIESTRAGO,'
      '                  ( 0 )  AS TBAIXACC'
      '             FROM PRODUTO P,'
      '                  ARTIGO A,'
      '                  GRUPPROD G,'
      '                  ( SELECT M.IDMOV,'
      '                           M.CODARTIGO,'
      '                           M.SALDOQTDEMOV,'
      '                           M.CUSTOMEDIOMOV,'
      '                           M.CODALMOXARIFADO,'
      '                           M.IDPESSOA'
      '                      FROM MOVIMENT M,'
      
        '                           ( SELECT M.CODARTIGO, M.CODALMOXARIFA' +
        'DO,'
      '                                    MAX( M.IDMOV ) AS IDMOV'
      '                               FROM MOVIMENT M,'
      
        '                                    ( SELECT CODARTIGO, CODALMOX' +
        'ARIFADO,'
      
        '                                             MAX( DATAMOV ) AS M' +
        'AXDATAMOV'
      '                                        FROM MOVIMENT'
      
        '                                       WHERE ( DATAMOV <= :dataf' +
        'im )'
      
        '                                         AND ( CODALMOXARIFADO I' +
        'N ( :almox ) )'
      
        '                                       GROUP BY CODARTIGO, CODAL' +
        'MOXARIFADO'
      '                                    ) SUB'
      
        '                              WHERE ( M.CODARTIGO = SUB.CODARTIG' +
        'O )'
      
        '                                AND ( M.DATAMOV = SUB.MAXDATAMOV' +
        ' )'
      
        '                                AND ( M.CODALMOXARIFADO IN ( :al' +
        'mox ) )'
      
        '                              GROUP BY M.CODARTIGO, M.CODALMOXAR' +
        'IFADO'
      '                           ) AUX'
      '                     WHERE ( M.CODARTIGO = AUX.CODARTIGO )'
      
        '                       AND ( M.CODALMOXARIFADO = AUX.CODALMOXARI' +
        'FADO )'
      '                       AND ( M.CODALMOXARIFADO IN ( :Almox ) )'
      '                       AND ( M.IDMOV = AUX.IDMOV )'
      '                  ) MOV'
      '            WHERE ( MOV.IDPESSOA = :idempresa )'
      '              AND ( MOV.CODALMOXARIFADO IN ( :almox ) )'
      '              AND ( P.ITEMESTOCAVEL = :estoque )'
      '              AND ( MOV.CODARTIGO = A.CODARTIGO )'
      '              AND ( A.CODPRODUTO = P.CODPRODUTO )'
      
        '              AND ( G.CODGRUPOPROD LIKE SUBSTR( RTRIM( P.CODGRUP' +
        'OPROD ), 1, :tamanho ) || '#39'%'#39' )'
      
        '              AND ( LENGTH( RTRIM( G.CODGRUPOPROD ) ) <= :tamanh' +
        'o )'
      '              AND ( G.STATUSGRUPO = '#39'S'#39' )'
      '            GROUP BY G.CODGRUPOPROD,'
      '                     G.DESCGRUPOPROD,'
      '                     G.STATUSGRUPO'
      '         )'
      '       ) UN'
      ' WHERE ( RTRIM( UN.CODGRUPOPROD ) LIKE :grupo )'
      ' GROUP BY UN.CODGRUPOPROD,'
      '          UN.DESCGRUPOPROD,'
      '          UN.STATUSGRUPO,'
      '          UN.CODARTIGO,'
      '          UN.DESCPROD'
      '           ')
    OnFormartParam = SqlParReconFormartParam
    ClientDataSet = CdsRecon
    Left = 200
    Top = 8
  end
  object CdsRecon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 60
  end
end
