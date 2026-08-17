inherited RptContrat: TRptContrat
  Left = 252
  Top = 191
  Width = 280
  Height = 269
  Caption = 'RptContrat'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'Ano'
        Controle = tcEdit
        TipodeDado = tdInteger
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Ano'
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
        Caption = 'ListaEstab'
        Controle = tcEdit
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'ListaEstab'
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
        Caption = 'Efet'
        Controle = tcEdit
        TipodeDado = tdBoolean
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Efet'
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
        Caption = 'Efes'
        Controle = tcEdit
        TipodeDado = tdBoolean
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Efes'
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
        Caption = 'Temp'
        Controle = tcEdit
        TipodeDado = tdBoolean
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Temp'
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
        Caption = 'Estg'
        Controle = tcEdit
        TipodeDado = tdBoolean
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Estg'
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
        Caption = 'Terc'
        Controle = tcEdit
        TipodeDado = tdBoolean
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Terc'
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
        Caption = 'Prop'
        Controle = tcEdit
        TipodeDado = tdBoolean
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Prop'
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
        Caption = 'Auto'
        Controle = tcEdit
        TipodeDado = tdBoolean
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Auto'
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
        Caption = 'Mascara'
        Controle = tcEdit
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Mascara'
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
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpContrat
  end
  object rpContrat: TppReport
    AutoStop = False
    DataPipeline = ppContrat
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Units = utScreenPixels
    DeviceType = 'Screen'
    Left = 208
    Top = 8
    Version = '5.5'
    mmColumnWidth = 0
    object rpContratHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29104
      mmPrintPosition = 0
      object rpContratDBTxt1: TppDBText
        UserName = 'rpContratDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppContrat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 123296
        mmTop = 2381
        mmWidth = 24606
        BandType = 0
      end
      object rpContratLbl1: TppLabel
        UserName = 'rpContratLbl1'
        Caption = 'Relatório de Contratações Relativo ao Ano de '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 87048
        mmTop = 8996
        mmWidth = 93134
        BandType = 0
      end
      object rpContratDBTxt2: TppDBText
        UserName = 'rpContratDBTxt2'
        DataField = 'ANOREF'
        DataPipeline = ppContrat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5027
        mmLeft = 180182
        mmTop = 8996
        mmWidth = 17198
        BandType = 0
      end
      object rpContratLbl4: TppLabel
        UserName = 'rpContratLbl4'
        Caption = 'Mês de Referência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 13229
        mmTop = 23813
        mmWidth = 30956
        BandType = 0
      end
      object rpContratLblEfet: TppLabel
        UserName = 'rpContratLblEfet'
        Caption = 'Efetivos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 63236
        mmTop = 23813
        mmWidth = 13758
        BandType = 0
      end
      object rpContratLblEspec: TppLabel
        UserName = 'rpContratLblEspec'
        Caption = 'Efet. Especs.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 86254
        mmTop = 23813
        mmWidth = 21960
        BandType = 0
      end
      object rpContratLblTemp: TppLabel
        UserName = 'rpContratLblTemp'
        Caption = 'Temporários'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 115623
        mmTop = 23813
        mmWidth = 21431
        BandType = 0
      end
      object rpContratLblEstag: TppLabel
        UserName = 'rpContratLblEstag'
        Caption = 'Estagiários'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 145257
        mmTop = 23813
        mmWidth = 19050
        BandType = 0
      end
      object rpContratLine1: TppLine
        UserName = 'rpContratLine1'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 3440
        mmTop = 28310
        mmWidth = 277813
        BandType = 0
      end
      object rpContratLbl2: TppLabel
        UserName = 'rpContratLbl2'
        AutoSize = False
        Caption = 'Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 247121
        mmTop = 8996
        mmWidth = 9790
        BandType = 0
      end
      object rpContratLbl3: TppLabel
        UserName = 'rpContratLbl3'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 242094
        mmTop = 13229
        mmWidth = 14817
        BandType = 0
      end
      object rpContratSysVar1: TppSystemVariable
        UserName = 'rpContratSysVar1'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 257705
        mmTop = 8996
        mmWidth = 7938
        BandType = 0
      end
      object rpContratSysVar2: TppSystemVariable
        UserName = 'rpContratSysVar2'
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 257705
        mmTop = 13229
        mmWidth = 22225
        BandType = 0
      end
      object rpContratLblTerc: TppLabel
        UserName = 'rpContratLblTerc'
        Caption = 'Terceiros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 175948
        mmTop = 23813
        mmWidth = 16140
        BandType = 0
      end
      object rpContratLblProp: TppLabel
        UserName = 'rpContratLblProp'
        Caption = 'Proprietários'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 201613
        mmTop = 23813
        mmWidth = 21960
        BandType = 0
      end
      object rpContratLblAuto: TppLabel
        UserName = 'rpContratLblAuto'
        Caption = 'Autônomos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 231511
        mmTop = 23813
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 269611
        mmTop = 23813
        mmWidth = 8731
        BandType = 0
      end
    end
    object rpContratDtlBnd: TppDetailBand
      BeforePrint = rpContratDtlBndBeforePrint
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object rpContratDBTxt3: TppDBText
        UserName = 'rpContratDBTxt3'
        AutoSize = True
        DataField = 'NOMEMES'
        DataPipeline = ppContrat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 16404
        mmTop = 1323
        mmWidth = 17992
        BandType = 4
      end
      object rpContratDbEfet: TppDBText
        UserName = 'rpContratDbEfet'
        DataField = 'EFETIVOS'
        DataPipeline = ppContrat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 60325
        mmTop = 1323
        mmWidth = 17198
        BandType = 4
      end
      object rpContratDbEspec: TppDBText
        UserName = 'rpContratDbEspec'
        DataField = 'EFETESPECS'
        DataPipeline = ppContrat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 88106
        mmTop = 1323
        mmWidth = 16933
        BandType = 4
      end
      object rpContratDbTemp: TppDBText
        UserName = 'rpContratDbTemp'
        DataField = 'TEMPORARIOS'
        DataPipeline = ppContrat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 117475
        mmTop = 1323
        mmWidth = 17198
        BandType = 4
      end
      object rpContratDbEstag: TppDBText
        UserName = 'rpContratDbEstag'
        DataField = 'ESTAGIARIOS'
        DataPipeline = ppContrat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 146315
        mmTop = 1323
        mmWidth = 17198
        BandType = 4
      end
      object rpContratDbTerc: TppDBText
        UserName = 'rpContratDbTerc'
        DataField = 'TERCEIROS'
        DataPipeline = ppContrat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 175948
        mmTop = 1323
        mmWidth = 16933
        BandType = 4
      end
      object rpContratDbProp: TppDBText
        UserName = 'rpContratDbProp'
        DataField = 'PROPRIETARIOS'
        DataPipeline = ppContrat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 205052
        mmTop = 1323
        mmWidth = 17198
        BandType = 4
      end
      object rpContratDbAuto: TppDBText
        UserName = 'rpContratDbAuto'
        DataField = 'AUTONOMOS'
        DataPipeline = ppContrat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 233098
        mmTop = 1323
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'TOTAL'
        DataPipeline = ppContrat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 261144
        mmTop = 1323
        mmWidth = 17198
        BandType = 4
      end
    end
    object rpContratFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpContratSmryBnd: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
      object rpContratSR1: TppSubReport
        UserName = 'rpContratSR1'
        ExpandAll = False
        NewPrintJob = False
        PrintBehavior = pbSection
        ResetPageNo = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppContrat1
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4 297 x 210 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Units = utScreenPixels
          Left = 136
          Top = 120
          Version = '5.5'
          mmColumnWidth = 0
          object rpContratSRHdrBnd: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 29104
            mmPrintPosition = 0
            object rpContratSRLbl1: TppLabel
              UserName = 'rpContratSRLbl1'
              Caption = 'Total de Contratações Relativo ao Ano de '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 5027
              mmLeft = 91017
              mmTop = 6085
              mmWidth = 84931
              BandType = 0
            end
            object rpContratSRDbTxt6: TppDBText
              UserName = 'rpContratSRDbTxt6'
              DataField = 'ANOREF'
              DataPipeline = ppContrat1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 5027
              mmLeft = 175948
              mmTop = 6085
              mmWidth = 17198
              BandType = 0
            end
            object rpContratSRLbl2: TppLabel
              UserName = 'rpContratSRLbl2'
              Caption = 'Mês de Referência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 13229
              mmTop = 23813
              mmWidth = 30956
              BandType = 0
            end
            object rpContratSRLine1: TppLine
              UserName = 'rpContratSRLine1'
              Weight = 0.75
              mmHeight = 794
              mmLeft = 3440
              mmTop = 28310
              mmWidth = 277813
              BandType = 0
            end
            object rpContratSRLbl7: TppLabel
              UserName = 'rpContratSRLbl7'
              AutoSize = False
              Caption = 'Folha:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 245798
              mmTop = 11377
              mmWidth = 9790
              BandType = 0
            end
            object rpContratSRLbl8: TppLabel
              UserName = 'rpContratSRLbl8'
              AutoSize = False
              Caption = 'Emissão:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 240771
              mmTop = 15610
              mmWidth = 14817
              BandType = 0
            end
            object rpContratSRSysVar1: TppSystemVariable
              UserName = 'rpContratSRSysVar1'
              VarType = vtPageSet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 256382
              mmTop = 11377
              mmWidth = 7938
              BandType = 0
            end
            object rpContratSRSysVar2: TppSystemVariable
              UserName = 'rpContratSRSysVar2'
              VarType = vtPrintDateTime
              DisplayFormat = 'DD/MM/YYYY HH:MM'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 256382
              mmTop = 15610
              mmWidth = 22225
              BandType = 0
            end
            object rpLblEfet: TppLabel
              UserName = 'rpLblEfet'
              Caption = 'Efetivos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 62971
              mmTop = 23813
              mmWidth = 13758
              BandType = 0
            end
            object rpLblEspec: TppLabel
              UserName = 'rpLblEspec'
              Caption = 'Efet. Especs.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 85990
              mmTop = 23813
              mmWidth = 21960
              BandType = 0
            end
            object rpLblTemp: TppLabel
              UserName = 'rpLblTemp'
              Caption = 'Temporários'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 115359
              mmTop = 23813
              mmWidth = 21431
              BandType = 0
            end
            object rpLblEstag: TppLabel
              UserName = 'rpLblEstag'
              Caption = 'Estagiários'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 144992
              mmTop = 23813
              mmWidth = 19050
              BandType = 0
            end
            object rpLblTerc: TppLabel
              UserName = 'rpLblTerc'
              Caption = 'Terceiros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 175684
              mmTop = 23813
              mmWidth = 16140
              BandType = 0
            end
            object rpLblProp: TppLabel
              UserName = 'rpLblProp'
              Caption = 'Proprietários'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 201348
              mmTop = 23813
              mmWidth = 21960
              BandType = 0
            end
            object rpLblAuto: TppLabel
              UserName = 'rpLblAuto'
              Caption = 'Autônomos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 231246
              mmTop = 23813
              mmWidth = 19579
              BandType = 0
            end
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = 'Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 268288
              mmTop = 23813
              mmWidth = 8731
              BandType = 0
            end
          end
          object rpContratSRDtlBnd: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 6350
            mmPrintPosition = 0
            object rpContratSRDbTxt1: TppDBText
              UserName = 'rpContratSRDbTxt1'
              AutoSize = True
              DataField = 'NOMEMES'
              DataPipeline = ppContrat1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 16404
              mmTop = 1323
              mmWidth = 17992
              BandType = 4
            end
            object rpDbEfet: TppDBText
              UserName = 'rpDbEfet'
              DataField = 'EFETIVOS'
              DataPipeline = ppContrat1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 59002
              mmTop = 1323
              mmWidth = 17198
              BandType = 4
            end
            object rpDbEspec: TppDBText
              UserName = 'rpDbEspec'
              DataField = 'EFETESPECS'
              DataPipeline = ppContrat1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 86784
              mmTop = 1323
              mmWidth = 16933
              BandType = 4
            end
            object rpDbTemp: TppDBText
              UserName = 'rpDbTemp'
              DataField = 'TEMPORARIOS'
              DataPipeline = ppContrat1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 116152
              mmTop = 1323
              mmWidth = 17198
              BandType = 4
            end
            object rpDbEstag: TppDBText
              UserName = 'rpDbEstag'
              DataField = 'ESTAGIARIOS'
              DataPipeline = ppContrat1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 144992
              mmTop = 1323
              mmWidth = 17198
              BandType = 4
            end
            object rpDbTerc: TppDBText
              UserName = 'rpDbTerc'
              DataField = 'TERCEIROS'
              DataPipeline = ppContrat1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 174625
              mmTop = 1323
              mmWidth = 16933
              BandType = 4
            end
            object rpDbProp: TppDBText
              UserName = 'rpDbProp'
              DataField = 'PROPRIETARIOS'
              DataPipeline = ppContrat1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 203730
              mmTop = 1323
              mmWidth = 17198
              BandType = 4
            end
            object rpDbAuto: TppDBText
              UserName = 'rpDbAuto'
              DataField = 'AUTONOMOS'
              DataPipeline = ppContrat1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 231775
              mmTop = 1323
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              DataField = 'TOTAL'
              DataPipeline = ppContrat1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 259821
              mmTop = 1323
              mmWidth = 17198
              BandType = 4
            end
          end
          object rpContratSRSmryBnd: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object rpContratSRLine2: TppLine
              UserName = 'rpContratSRLine2'
              Weight = 0.75
              mmHeight = 794
              mmLeft = 3440
              mmTop = 529
              mmWidth = 277813
              BandType = 7
            end
            object rpContratSRLbl9: TppLabel
              UserName = 'rpContratSRLbl9'
              Caption = 'Totais do Ano'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 16140
              mmTop = 4233
              mmWidth = 21960
              BandType = 7
            end
            object rpSumEfet: TppDBCalc
              UserName = 'rpSumEfet'
              DataField = 'EFETIVOS'
              DataPipeline = ppContrat1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 59002
              mmTop = 4233
              mmWidth = 17198
              BandType = 7
            end
            object rpSumEspec: TppDBCalc
              UserName = 'rpSumEspec'
              DataField = 'EFETESPECS'
              DataPipeline = ppContrat1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 86784
              mmTop = 4233
              mmWidth = 16933
              BandType = 7
            end
            object rpSumTemp: TppDBCalc
              UserName = 'rpSumTemp'
              DataField = 'TEMPORARIOS'
              DataPipeline = ppContrat1
              DisplayFormat = '##,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 116152
              mmTop = 4233
              mmWidth = 17198
              BandType = 7
            end
            object rpSumEstag: TppDBCalc
              UserName = 'rpSumEstag'
              DataField = 'ESTAGIARIOS'
              DataPipeline = ppContrat1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 144992
              mmTop = 4233
              mmWidth = 17198
              BandType = 7
            end
            object rpSumTerc: TppDBCalc
              UserName = 'rpSumTerc'
              DataField = 'TERCEIROS'
              DataPipeline = ppContrat1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 174361
              mmTop = 4233
              mmWidth = 17198
              BandType = 7
            end
            object rpSumProp: TppDBCalc
              UserName = 'rpSumProp'
              DataField = 'PROPRIETARIOS'
              DataPipeline = ppContrat1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 203994
              mmTop = 4233
              mmWidth = 16933
              BandType = 7
            end
            object rpSumAuto: TppDBCalc
              UserName = 'rpSumAuto'
              DataField = 'AUTONOMOS'
              DataPipeline = ppContrat1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 231775
              mmTop = 4233
              mmWidth = 17198
              BandType = 7
            end
            object ppDBCalc12: TppDBCalc
              UserName = 'DBCalc12'
              DataField = 'TOTAL'
              DataPipeline = ppContrat1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 259821
              mmTop = 4233
              mmWidth = 17198
              BandType = 7
            end
          end
        end
      end
    end
    object rpContratGroup0: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppContrat
      NewPage = True
      UserName = 'rpContratGroup0'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpContratGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpContratGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object rpContratLine2: TppLine
          UserName = 'rpContratLine2'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 3440
          mmTop = 529
          mmWidth = 277813
          BandType = 5
          GroupNo = 0
        end
        object rpContratSumEfet: TppDBCalc
          UserName = 'rpContratSumEfet'
          DataField = 'EFETIVOS'
          DataPipeline = ppContrat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpContratGroup0
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 60325
          mmTop = 3969
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpContratSumEspec: TppDBCalc
          UserName = 'rpContratSumEspec'
          DataField = 'EFETESPECS'
          DataPipeline = ppContrat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpContratGroup0
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 88106
          mmTop = 3969
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object rpContratSumTemp: TppDBCalc
          UserName = 'rpContratSumTemp'
          DataField = 'TEMPORARIOS'
          DataPipeline = ppContrat
          DisplayFormat = '##,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpContratGroup0
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 117475
          mmTop = 3969
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpContratSumEstag: TppDBCalc
          UserName = 'rpContratSumEstag'
          DataField = 'ESTAGIARIOS'
          DataPipeline = ppContrat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpContratGroup0
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 146315
          mmTop = 3969
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpContratLbl9: TppLabel
          UserName = 'rpContratLbl9'
          Caption = 'Totais do Ano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 16140
          mmTop = 3969
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object rpContratSumTerc: TppDBCalc
          UserName = 'rpContratSumTerc'
          DataField = 'TERCEIROS'
          DataPipeline = ppContrat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpContratGroup0
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 175684
          mmTop = 3969
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpContratSumProp: TppDBCalc
          UserName = 'rpContratSumProp'
          DataField = 'PROPRIETARIOS'
          DataPipeline = ppContrat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpContratGroup0
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 205317
          mmTop = 3969
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object rpContratSumAuto: TppDBCalc
          UserName = 'rpContratSumAuto'
          DataField = 'AUTONOMOS'
          DataPipeline = ppContrat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpContratGroup0
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 233098
          mmTop = 3969
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'TOTAL'
          DataPipeline = ppContrat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpContratGroup0
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 261144
          mmTop = 3969
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppContrat: TppBDEPipeline
    DataSource = dsContrat
    UserName = 'Contrat'
    Left = 210
    Top = 61
    object ppContratppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 70
      DisplayWidth = 70
      Position = 0
    end
    object ppContratppField2: TppField
      FieldAlias = 'NOMEMES'
      FieldName = 'NOMEMES'
      FieldLength = 25
      DisplayWidth = 25
      Position = 1
    end
    object ppContratppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANOREF'
      FieldName = 'ANOREF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppContratppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'EFETIVOS'
      FieldName = 'EFETIVOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppContratppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'EFETESPECS'
      FieldName = 'EFETESPECS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppContratppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TEMPORARIOS'
      FieldName = 'TEMPORARIOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppContratppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'ESTAGIARIOS'
      FieldName = 'ESTAGIARIOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppContratppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TERCEIROS'
      FieldName = 'TERCEIROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppContratppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROPRIETARIOS'
      FieldName = 'PROPRIETARIOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppContratppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'AUTONOMOS'
      FieldName = 'AUTONOMOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppContratppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
  end
  object dsContrat: TwwDataSource
    AutoEdit = False
    DataSet = CdsContrat
    Left = 210
    Top = 107
  end
  object CdsContrat: TCMClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'EMPRESA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 70
      end
      item
        Name = 'NOMEMES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 25
      end
      item
        Name = 'ANOREF'
        DataType = ftFloat
      end
      item
        Name = 'EFETIVOS'
        DataType = ftFloat
      end
      item
        Name = 'EFETESPECS'
        DataType = ftFloat
      end
      item
        Name = 'TEMPORARIOS'
        DataType = ftFloat
      end
      item
        Name = 'ESTAGIARIOS'
        DataType = ftFloat
      end
      item
        Name = 'TERCEIROS'
        DataType = ftFloat
      end
      item
        Name = 'PROPRIETARIOS'
        DataType = ftFloat
      end
      item
        Name = 'AUTONOMOS'
        DataType = ftFloat
      end
      item
        Name = 'TOTAL'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'CdsContratIndex1'
        DescFields = 'MESREF'
        Fields = 'MESREF'
        Options = [ixDescending]
      end>
    Params = <>
    StoreDefs = True
    Left = 210
    Top = 152
    Data = {
      320100009619E0BD01000000180000000B000000000003000000320107454D50
      5245534101004900000002000753554254595045020049000A00466978656443
      68617200055749445448020002004600074E4F4D454D45530100490000000200
      0753554254595045020049000A00466978656443686172000557494454480200
      0200190006414E4F5245460800040000000000084546455449564F5308000400
      000000000A4546455445535045435308000400000000000B54454D504F524152
      494F5308000400000000000B4553544147494152494F53080004000000000009
      544552434549524F5308000400000000000D50524F50524945544152494F5308
      00040000000000094155544F4E4F4D4F53080004000000000005544F54414C08
      000400000000000100044C4349440400010009080000}
  end
  object sqlContrat: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPRESA,'
      '  '#39'1234567890123456789012345'#39' AS NOMEMES,'
      '  0 AS ANOREF,'
      '  0 AS EFETIVOS,'
      '  0 AS EFETESPECS,'
      '  0 AS TEMPORARIOS,'
      '  0 AS ESTAGIARIOS,'
      '  0 AS TERCEIROS,'
      '  0 AS PROPRIETARIOS,'
      '  0 AS AUTONOMOS,'
      '  0 AS TOTAL'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)'
      ' '
      ' ')
    ClientDataSet = CdsContrat
    Left = 210
    Top = 196
  end
  object sqlContrat1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  '#39'1234567890123456789012345'#39' AS NOMEMES,'
      '  0 AS ANOREF,'
      '  0 AS EFETIVOS,'
      '  0 AS EFETESPECS,'
      '  0 AS ESTAGIARIOS,'
      '  0 AS TEMPORARIOS,'
      '  0 AS TERCEIROS,'
      '  0 AS PROPRIETARIOS,'
      '  0 AS AUTONOMOS,'
      '  0 AS TOTAL'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsContrat1
    Left = 106
    Top = 196
  end
  object CdsContrat1: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 106
    Top = 152
    Data = {
      FE0000009619E0BD01000000180000000A000000000003000000FE00074E4F4D
      454D455301004900000002000753554254595045020049000A00466978656443
      6861720005574944544802000200190006414E4F524546080004000000000008
      4546455449564F5308000400000000000A454645544553504543530800040000
      0000000B4553544147494152494F5308000400000000000B54454D504F524152
      494F53080004000000000009544552434549524F5308000400000000000D5052
      4F50524945544152494F530800040000000000094155544F4E4F4D4F53080004
      000000000005544F54414C08000400000000000100044C434944040001000908
      0000}
  end
  object dsContrat1: TwwDataSource
    AutoEdit = False
    DataSet = CdsContrat1
    Left = 106
    Top = 107
  end
  object ppContrat1: TppBDEPipeline
    DataSource = dsContrat1
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'Contrat1'
    Left = 106
    Top = 61
    object ppContrat1ppField1: TppField
      FieldAlias = 'NOMEMES'
      FieldName = 'NOMEMES'
      FieldLength = 25
      DisplayWidth = 25
      Position = 0
    end
    object ppContrat1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANOREF'
      FieldName = 'ANOREF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppContrat1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'EFETIVOS'
      FieldName = 'EFETIVOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppContrat1ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'EFETESPECS'
      FieldName = 'EFETESPECS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppContrat1ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'ESTAGIARIOS'
      FieldName = 'ESTAGIARIOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppContrat1ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TEMPORARIOS'
      FieldName = 'TEMPORARIOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppContrat1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TERCEIROS'
      FieldName = 'TERCEIROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppContrat1ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROPRIETARIOS'
      FieldName = 'PROPRIETARIOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppContrat1ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'AUTONOMOS'
      FieldName = 'AUTONOMOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppContrat1ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
end
