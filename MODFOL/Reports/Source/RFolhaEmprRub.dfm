inherited RptFolhaEmprRub: TRptFolhaEmprRub
  Left = 667
  Top = 234
  Width = 292
  Height = 268
  Caption = 'RptFolhaEmprRub'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'IdEmpresa'
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
        Name = 'IdEmpresa'
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
        Caption = 'ListaIdEstab'
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
        Name = 'ListaIdEstab'
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
        Caption = 'NomeTabela'
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
        Name = 'NomeTabela'
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
        Caption = 'ListaCodCCusto'
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
        Name = 'ListaCodCCusto'
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
        Caption = 'ListaIdRubrica'
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
        Name = 'ListaIdRubrica'
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
        Caption = 'ListaTipoFolha'
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
        Name = 'ListaTipoFolha'
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
        Caption = 'AnoRef'
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
        Name = 'AnoRef'
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
        Caption = 'MesRef'
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
        Name = 'MesRef'
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
        Caption = 'ImprimeTipoProcesso'
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
        Name = 'ImprimeTipoProcesso'
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
        Caption = 'TipoRelatorio'
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
        Name = 'TipoRelatorio'
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
        Caption = 'Ordenacao'
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
        Name = 'Ordenacao'
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
        Caption = 'BuscaHist'
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
        Name = 'BuscaHist'
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
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpFolhaEmprRub
    ConnectionType = cntBDE
  end
  object rpFolhaEmprRub: TppReport
    AutoStop = False
    DataPipeline = ppFolhaEmprRub
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Folha de Empregados por Rubrica'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
    PrinterSetup.mmMarginLeft = 8350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
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
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 217
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppFolhaEmprRub'
    object rpFolhaEmprRubHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24871
      mmPrintPosition = 0
      object rpFolhaEmprRubDBLbl2: TppLabel
        UserName = 'rpFolhaEmprRubLbl2'
        AutoSize = False
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 162719
        mmTop = 14817
        mmWidth = 5821
        BandType = 0
      end
      object rpFolhaEmprRubDBLbl4: TppLabel
        UserName = 'rpFolhaEmprRubLbl4'
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
        mmLeft = 152665
        mmTop = 6615
        mmWidth = 15875
        BandType = 0
      end
      object rpFolhaEmprRubDBLbl5: TppLabel
        UserName = 'rpFolhaEmprRubLbl5'
        AutoSize = False
        Caption = 'Mês de Ref:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 148961
        mmTop = 10848
        mmWidth = 19579
        BandType = 0
      end
      object rpFolhaEmprRubDBLbl1: TppLabel
        UserName = 'rpFolhaEmprRubLbl1'
        Caption = 'FOLHA DE EMPREGADOS POR RUBRICA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 69586
        mmTop = 19844
        mmWidth = 69850
        BandType = 0
      end
      object rpFolhaEmprRubDBLbl3: TppLabel
        UserName = 'rpFolhaEmprRubLbl3'
        AutoSize = False
        Caption = 'Página:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 155840
        mmTop = 2646
        mmWidth = 12700
        BandType = 0
      end
      object rpFolhaEmprRubDBTxt1: TppDBText
        UserName = 'rpFolhaEmprRubDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppFolhaEmprRub
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFolhaEmprRub'
        mmHeight = 3260
        mmLeft = 8202
        mmTop = 2646
        mmWidth = 13885
        BandType = 0
      end
      object rpFolhaEmprRubDBTxt2: TppDBText
        UserName = 'rpFolhaEmprRubDBTxt2'
        AutoSize = True
        DataField = 'CGC'
        DataPipeline = ppFolhaEmprRub
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFolhaEmprRub'
        mmHeight = 3260
        mmLeft = 8202
        mmTop = 8731
        mmWidth = 6265
        BandType = 0
      end
      object rpFolhaEmprRubDBTxt4: TppDBText
        UserName = 'rpFolhaEmprRubDBTxt4'
        DataField = 'UF'
        DataPipeline = ppFolhaEmprRub
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFolhaEmprRub'
        mmHeight = 3704
        mmLeft = 169598
        mmTop = 14817
        mmWidth = 7144
        BandType = 0
      end
      object rpFolhaEmprRubDBTxt3: TppDBText
        UserName = 'rpFolhaEmprRubDBTxt3'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppFolhaEmprRub
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFolhaEmprRub'
        mmHeight = 3260
        mmLeft = 8202
        mmTop = 14817
        mmWidth = 16044
        BandType = 0
      end
      object rpFolhaEmprRubDBTxt5: TppDBText
        UserName = 'rpFolhaEmprRubDBTxt5'
        DataField = 'MES_REF'
        DataPipeline = ppFolhaEmprRub
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFolhaEmprRub'
        mmHeight = 3704
        mmLeft = 169598
        mmTop = 10848
        mmWidth = 23283
        BandType = 0
      end
      object rpFolhaEmprRubSysVar1: TppSystemVariable
        UserName = 'rpFolhaEmprRubSysVar1'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 169598
        mmTop = 2646
        mmWidth = 7938
        BandType = 0
      end
      object rpFolhaEmprRubSysVar2: TppSystemVariable
        UserName = 'rpFolhaEmprRubSysVar2'
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 169598
        mmTop = 6615
        mmWidth = 22225
        BandType = 0
      end
      object rpFolhaEmprRubLblPROCESSO: TppLabel
        OnPrint = rpFolhaEmprRubLblPROCESSOPrint
        UserName = 'rpFolhaEmprRubLblPROCESSO'
        AutoSize = False
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 148961
        mmTop = 19050
        mmWidth = 43921
        BandType = 0
      end
    end
    object rpFolhaEmprRubDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object rpFolhaEmprRubDBTxt10: TppDBText
        UserName = 'rpFolhaEmprRubDBTxt10'
        DataField = 'MATRICULA'
        DataPipeline = ppFolhaEmprRub
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFolhaEmprRub'
        mmHeight = 3704
        mmLeft = 8202
        mmTop = 529
        mmWidth = 17992
        BandType = 4
      end
      object rpFolhaEmprRubDBTxt11: TppDBText
        UserName = 'rpFolhaEmprRubDBTxt11'
        DataField = 'FUNCIONARIO'
        DataPipeline = ppFolhaEmprRub
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFolhaEmprRub'
        mmHeight = 3704
        mmLeft = 27781
        mmTop = 529
        mmWidth = 111654
        BandType = 4
      end
      object rpFolhaEmprRubDBTxt12: TppDBText
        UserName = 'rpFolhaEmprRubDBTxt12'
        DataField = 'VALOR'
        DataPipeline = ppFolhaEmprRub
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppFolhaEmprRub'
        mmHeight = 3704
        mmLeft = 170127
        mmTop = 529
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'REFERENCIA'
        DataPipeline = ppFolhaEmprRub
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppFolhaEmprRub'
        mmHeight = 3440
        mmLeft = 146844
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
    end
    object rpFolhaEmprRubFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8000
      mmPrintPosition = 0
    end
    object rpFolhaEmprRubSmryBnd: TppSummaryBand
      AfterPrint = rpFolhaEmprRubSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
    end
    object rpFolhaEmprRubGrp2: TppGroup
      BreakName = 'COD_RUBRICA'
      DataPipeline = ppFolhaEmprRub
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpFolhaEmprRubGrp2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppFolhaEmprRub'
      object rpFolhaEmprRubGrpHdrBnd1: TppGroupHeaderBand
        AfterPrint = rpFolhaEmprRubGrpHdrBnd1AfterPrint
        mmBottomOffset = 0
        mmHeight = 13299
        mmPrintPosition = 0
        object rpFolhaEmprRubShape1: TppShape
          UserName = 'rpFolhaEmprRubShape1'
          Brush.Color = clSilver
          Pen.Color = clSilver
          mmHeight = 5556
          mmLeft = 8202
          mmTop = 529
          mmWidth = 185209
          BandType = 3
          GroupNo = 0
        end
        object rpFolhaEmprRubDBTxt6: TppDBText
          UserName = 'rpFolhaEmprRubTxt6'
          DataField = 'COD_RUBRICA'
          DataPipeline = ppFolhaEmprRub
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'ppFolhaEmprRub'
          mmHeight = 4498
          mmLeft = 9525
          mmTop = 1058
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpFolhaEmprRubDBTxt7: TppDBText
          UserName = 'rpFolhaEmprRubTxt7'
          DataField = 'NOME_RUBRICA'
          DataPipeline = ppFolhaEmprRub
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'ppFolhaEmprRub'
          mmHeight = 4498
          mmLeft = 28046
          mmTop = 1058
          mmWidth = 103717
          BandType = 3
          GroupNo = 0
        end
        object rpFolhaEmprRubLine1: TppLine
          UserName = 'rpFolhaEmprRubLine1'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1323
          mmLeft = 8202
          mmTop = 12171
          mmWidth = 185209
          BandType = 3
          GroupNo = 0
        end
        object rpFolhaEmprRubLbl7: TppLabel
          UserName = 'rpFolhaEmprRubLbl7'
          AutoSize = False
          Caption = 'NOME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 27781
          mmTop = 7673
          mmWidth = 103717
          BandType = 3
          GroupNo = 0
        end
        object rpFolhaEmprRubLbl6: TppLabel
          UserName = 'rpFolhaEmprRubLbl6'
          AutoSize = False
          Caption = 'MATRÍCULA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 8202
          mmTop = 7673
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object rpFolhaEmprRubLbl8: TppLabel
          UserName = 'rpFolhaEmprRubLbl8'
          AutoSize = False
          Caption = 'VALOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 170127
          mmTop = 7673
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object rpFolhaEmprRubLbl16: TppLabel
          UserName = 'rpFolhaEmprRubLbl16'
          AutoSize = False
          Caption = 'QTDE.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 133879
          mmTop = 1323
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object rpFolhaEmprRubLbl17: TppLabel
          UserName = 'rpFolhaEmprRubLbl17'
          AutoSize = False
          Caption = 'VALOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 166952
          mmTop = 1323
          mmWidth = 25135
          BandType = 3
          GroupNo = 0
        end
        object rpFolhaEmprRubLbl20: TppLabel
          UserName = 'rpFolhaEmprRubLbl20'
          AutoSize = False
          Caption = 'REFERÊNCIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 144198
          mmTop = 7673
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
      end
      object rpFolhaEmprRubGrpFootBnd1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object rpFolhaEmprRubLine4: TppLine
          UserName = 'rpFolhaEmprRubLine4'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 8202
          mmTop = 529
          mmWidth = 185209
          BandType = 5
          GroupNo = 0
        end
        object rpFolhaEmprRubLbl15: TppLabel
          UserName = 'rpFolhaEmprRubLbl15'
          AutoSize = False
          Caption = 'TOTAL DA RUBRICA:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 136261
          mmTop = 2381
          mmWidth = 32544
          BandType = 5
          GroupNo = 0
        end
        object rpFolhaEmprRubDBCalc4: TppDBCalc
          UserName = 'rpFolhaEmprRubDBCalc4'
          DataField = 'VALOR'
          DataPipeline = ppFolhaEmprRub
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpFolhaEmprRubGrp2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppFolhaEmprRub'
          mmHeight = 3704
          mmLeft = 170127
          mmTop = 2381
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object rpFolhaEmprRubLbl14: TppLabel
          UserName = 'rpFolhaEmprRubLbl14'
          AutoSize = False
          Caption = 'QTDE. FUNCIONÁRIOS:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 83079
          mmTop = 2381
          mmWidth = 36777
          BandType = 5
          GroupNo = 0
        end
        object rpFolhaEmprRubDBCalc3: TppDBCalc
          UserName = 'rpFolhaEmprRubDBCalc3'
          DataField = 'FUNCIONARIO'
          DataPipeline = ppFolhaEmprRub
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpFolhaEmprRubGrp2
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppFolhaEmprRub'
          mmHeight = 3704
          mmLeft = 120650
          mmTop = 2381
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpFolhaEmprRubGrp1: TppGroup
      BreakName = 'CODCENTROCUSTO'
      DataPipeline = ppFolhaEmprRub
      OutlineSettings.CreateNode = True
      UserName = 'rpFolhaEmprRubGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppFolhaEmprRub'
      object rpFolhaEmprRubGrpHdrBnd2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object rpFolhaEmprRubShape2: TppShape
          UserName = 'rpFolhaEmprRubShape2'
          Brush.Color = clSilver
          Pen.Color = clSilver
          mmHeight = 5556
          mmLeft = 8202
          mmTop = 0
          mmWidth = 185209
          BandType = 3
          GroupNo = 1
        end
        object rpFolhaEmprRubDBTxt8: TppDBText
          UserName = 'rpFolhaEmprRubDBTxt8'
          DataField = 'CODCENTROCUSTO'
          DataPipeline = ppFolhaEmprRub
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppFolhaEmprRub'
          mmHeight = 4233
          mmLeft = 9525
          mmTop = 794
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
        end
        object rpFolhaEmprRubDBTxt9: TppDBText
          UserName = 'rpFolhaEmprRubDBTxt9'
          DataField = 'NOMECENTROCUSTO'
          DataPipeline = ppFolhaEmprRub
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppFolhaEmprRub'
          mmHeight = 4233
          mmLeft = 29104
          mmTop = 794
          mmWidth = 74613
          BandType = 3
          GroupNo = 1
        end
        object rpFolhaEmprRubLbl9: TppLabel
          UserName = 'rpFolhaEmprRubLbl9'
          AutoSize = False
          Caption = 'MATRÍCULA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 8202
          mmTop = 6879
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
        end
        object rpFolhaEmprRubLbl10: TppLabel
          UserName = 'rpFolhaEmprRubLbl10'
          AutoSize = False
          Caption = 'NOME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 27781
          mmTop = 6879
          mmWidth = 103717
          BandType = 3
          GroupNo = 1
        end
        object rpFolhaEmprRubLbl11: TppLabel
          UserName = 'rpFolhaEmprRubLbl11'
          AutoSize = False
          Caption = 'VALOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 170127
          mmTop = 6879
          mmWidth = 23283
          BandType = 3
          GroupNo = 1
        end
        object rpFolhaEmprRubLine2: TppLine
          UserName = 'rpFolhaEmprRubLine2'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 8202
          mmTop = 10848
          mmWidth = 185209
          BandType = 3
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'REFERÊNCIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 144198
          mmTop = 6879
          mmWidth = 23283
          BandType = 3
          GroupNo = 1
        end
      end
      object rpFolhaEmprRubGrpFootBnd2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object rpFolhaEmprRubDBTxt13: TppDBText
          UserName = 'rpFolhaEmprRubDBTxt13'
          DataField = 'CODCENTROCUSTO'
          DataPipeline = ppFolhaEmprRub
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppFolhaEmprRub'
          mmHeight = 3704
          mmLeft = 8202
          mmTop = 1852
          mmWidth = 17992
          BandType = 5
          GroupNo = 1
        end
        object rpFolhaEmprRubDBTxt14: TppDBText
          UserName = 'rpFolhaEmprRubDBTxt14'
          DataField = 'NOMECENTROCUSTO'
          DataPipeline = ppFolhaEmprRub
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppFolhaEmprRub'
          mmHeight = 3704
          mmLeft = 27781
          mmTop = 1852
          mmWidth = 56621
          BandType = 5
          GroupNo = 1
        end
        object rpFolhaEmprRubLbl13: TppLabel
          UserName = 'rpFolhaEmprRubLbl13'
          AutoSize = False
          Caption = 'TOTAL DO C. CUSTO:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 136261
          mmTop = 1852
          mmWidth = 32544
          BandType = 5
          GroupNo = 1
        end
        object rpFolhaEmprRubDBCalc2: TppDBCalc
          UserName = 'rpFolhaEmprRubDBCalc2'
          DataField = 'VALOR'
          DataPipeline = ppFolhaEmprRub
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpFolhaEmprRubGrp1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppFolhaEmprRub'
          mmHeight = 3704
          mmLeft = 169863
          mmTop = 1852
          mmWidth = 23283
          BandType = 5
          GroupNo = 1
        end
        object rpFolhaEmprRubDBCalc1: TppDBCalc
          UserName = 'rpFolhaEmprRubDBCalc1'
          DataField = 'FUNCIONARIO'
          DataPipeline = ppFolhaEmprRub
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpFolhaEmprRubGrp1
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppFolhaEmprRub'
          mmHeight = 3704
          mmLeft = 120650
          mmTop = 1852
          mmWidth = 14817
          BandType = 5
          GroupNo = 1
        end
        object rpFolhaEmprRubLbl12: TppLabel
          UserName = 'rpFolhaEmprRubLbl12'
          AutoSize = False
          Caption = 'QTDE. FUNCIONÁRIOS:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 85196
          mmTop = 1852
          mmWidth = 34660
          BandType = 5
          GroupNo = 1
        end
        object rpFolhaEmprRubLine3: TppLine
          UserName = 'rpFolhaEmprRubLine3'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 8202
          mmTop = 265
          mmWidth = 185209
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object daDataModule1: TdaDataModule
    end
  end
  object ppFolhaEmprRub: TppBDEPipeline
    DataSource = dsFolhaEmprRub
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'FolhaEmprRub'
    Left = 217
    Top = 48
    object ppFolhaEmprRubppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppFolhaEmprRubppField2: TppField
      FieldAlias = 'CGC'
      FieldName = 'CGC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppFolhaEmprRubppField3: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppFolhaEmprRubppField4: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppFolhaEmprRubppField5: TppField
      FieldAlias = 'COD_RUBRICA'
      FieldName = 'COD_RUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppFolhaEmprRubppField6: TppField
      FieldAlias = 'NOME_RUBRICA'
      FieldName = 'NOME_RUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppFolhaEmprRubppField7: TppField
      FieldAlias = 'MES_REF'
      FieldName = 'MES_REF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppFolhaEmprRubppField8: TppField
      FieldAlias = 'SEQRUBRICA'
      FieldName = 'SEQRUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppFolhaEmprRubppField9: TppField
      FieldAlias = 'REFERENCIA'
      FieldName = 'REFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppFolhaEmprRubppField10: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppFolhaEmprRubppField11: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppFolhaEmprRubppField12: TppField
      FieldAlias = 'FUNCIONARIO'
      FieldName = 'FUNCIONARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppFolhaEmprRubppField13: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppFolhaEmprRubppField14: TppField
      FieldAlias = 'NOMECENTROCUSTO'
      FieldName = 'NOMECENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppFolhaEmprRubppField15: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppFolhaEmprRubppField16: TppField
      FieldAlias = 'NIVEL'
      FieldName = 'NIVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
  end
  object dsFolhaEmprRub: TDataSource
    DataSet = CdsFolhaEmprRub
    Left = 217
    Top = 96
  end
  object sqlFolhaEmprRub: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      '  PJ.RAZAOSOCIAL  AS EMPRESA,'
      '  ('#39'CNPJ: '#39' || PJ.NUMDOCUMENTO) AS CGC,'
      '  ES.CODESTADO AS UF,'
      
        '  RTRIM(E.LOGRADOURO) ||'#39', '#39'|| E.NUMERO || DECODE(E.COMPLEMENTO,' +
        #39' '#39','#39' - '#39' ||'
      
        '    RTRIM(E.COMPLEMENTO)) ||'#39' - '#39'|| RTRIM(E.BAIRRO) ||'#39' - '#39'|| RT' +
        'RIM(CIDADES.NOME) ||'
      
        '    '#39' - CEP: '#39' || RTRIM(SUBSTR(E.CEP,1,5)) ||'#39'-'#39'|| RTRIM(SUBSTR(' +
        'E.CEP,6,3)) AS ENDERECO,'
      '  RP.CODPROVDESC AS COD_RUBRICA,'
      '  PD.DESCRICAO AS NOME_RUBRICA,'
      '  H.MES AS MES_REF,'
      '  H.SEQRUBRICA, H.REFERENCIA,'
      '  H.VALORPROVENTO AS VALOR,'
      '  F.MATRICULA,'
      '  UPPER(PF.NOME) AS FUNCIONARIO,'
      '  CC.CODCENTROCUSTO,'
      '  CC.NOME AS NOMECENTROCUSTO,'
      '  C.TITULO AS CARGO,'
      '  CASE WHEN H.VALORPROVENTO<=FX.STEP1 THEN '#39'01'#39' '
      '       WHEN H.VALORPROVENTO<=FX.STEP2 THEN '#39'02'#39
      '       WHEN H.VALORPROVENTO<=FX.STEP3 THEN '#39'03'#39
      '       WHEN H.VALORPROVENTO<=FX.STEP4 THEN '#39'04'#39
      '       WHEN H.VALORPROVENTO<=FX.STEP5 THEN '#39'05'#39
      '       ELSE '#39'06'#39
      '  END AS NIVEL'
      'FROM'
      
        '  HISTRUBSAL H, PESSOA PJ, PESSOA PF, ENDPESS E, CARGO C, FAIXAS' +
        'AL FX,'
      
        '  PROVDESC PD, RUBRICAXPESS RP, FUNCIONARIO F, CIDADES, ESTADO E' +
        'S, CENTCUST CC,'
      '  FILIALPESSOA FP,'
      
        '  (SELECT EF.IDCARGO, EF.IDPESSOA, EF.IDEMPRESA, EF.CODCENTROCUS' +
        'TO'
      '   FROM   EVOLFUNC EF,'
      '          (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA'
      '           FROM   EVOLFUNC'
      
        '           WHERE  (DATAALTERFUNC <= TO_DATE('#39'31/08/2004'#39','#39'DD/MM/' +
        'YYYY'#39'))'
      '           GROUP BY IDPESSOA) HST2,'
      '          (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA'
      '           FROM   EVOLFUNC'
      
        '           WHERE  (DATAALTERFUNC <= TO_DATE('#39'31/08/2004'#39','#39'DD/MM/' +
        'YYYY'#39'))'
      '           GROUP BY IDPESSOA) HST3'
      '    WHERE  (EF.DATAALTERFUNC = HST2.DATAALTERFUNC) AND'
      '           (EF.IDPESSOA      = HST2.IDPESSOA) AND'
      '           (EF.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND'
      '           (EF.IDPESSOA      = HST3.IDPESSOA)) HST'
      'WHERE'
      '  (RP.IDPESSOA       = 2) AND'
      '  (PJ.IDPESSOA      IN (535)) AND'
      '  (H.CODPROVDESC     = '#39'4933'#39') AND'
      '  (RP.CODPROVDESC    = '#39'4933'#39') AND'
      '  (H.MES             = '#39'2004/08'#39') AND'
      '  (H.IDMOTIVO        = 2) AND'
      '  (PJ.IDPESSOA       = FP.IDFILIALPESSOA) AND'
      '  (PJ.IDPESSOA       = F.IDESTAB) AND'
      '  (PJ.IDPESSOA       = E.IDPESSOA) AND'
      '  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND'
      '  (E.IDCIDADES       = CIDADES.IDCIDADES) AND'
      '  (CIDADES.IDESTADO  = ES.IDESTADO) AND'
      
        '  (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODC' +
        'ENTROCUSTO)) IN ('#39'154'#39','#39'4311'#39','#39'9074'#39')) AND'
      
        '  (DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTRO' +
        'CUSTO) = CC.CODCENTROCUSTO) AND'
      
        '  (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = RP.IDP' +
        'ESSOA) AND'
      
        '  (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = CC.IDE' +
        'MPRESA) AND'
      
        '  (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) = C.IDCARGO) A' +
        'ND'
      '  (C.IDFAIXASALARIAL = FX.IDFAIXASALARIAL) AND'
      '  (F.IDPESSOA        = PF.IDPESSOA) AND'
      '  (F.IDPESSOA        = H.IDPESSOA) AND'
      '  (H.IDRUBRICA       = PD.IDPROVENTO) AND'
      '  (PD.IDPROVENTO     = RP.IDRUBRICA) AND'
      '  (F.IDPESSOA        = HST.IDPESSOA(+))'
      'ORDER BY'
      '  COD_RUBRICA, UPPER(FUNCIONARIO)'
      '')
    ClientDataSet = CdsFolhaEmprRub
    Left = 217
    Top = 190
  end
  object CdsFolhaEmprRub: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsFolhaEmprRubAfterScroll
    Left = 217
    Top = 144
  end
end
