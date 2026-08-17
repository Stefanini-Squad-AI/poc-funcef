inherited RptReciboAvisoFerias: TRptReciboAvisoFerias
  Left = 196
  Top = 215
  Width = 311
  Height = 269
  Caption = 'RptReciboAvisoFerias'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
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
        Caption = 'ListaIdFunc'
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
        Name = 'ListaIdFunc'
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
        Caption = 'ExibeMaiorRemuneracao'
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
        Name = 'ExibeMaiorRemuneracao'
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
        Caption = 'DataInicial'
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
        MostraComboCompara = True
        Required = False
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
        Caption = 'DataFinal'
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
        MostraComboCompara = True
        Required = False
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
        Caption = 'TipoPagamento'
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
        Name = 'TipoPagamento'
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
        Caption = 'TipoContrato'
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
        Name = 'TipoContrato'
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
      end>
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpReciboAvisoFerias
    ConnectionType = cntBDE
  end
  object rpReciboAvisoFerias: TppReport
    AutoStop = False
    DataPipeline = ppReciboAvisoFerias
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
    Units = utScreenPixels
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
    Left = 226
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppReciboAvisoFerias'
    object rpReciboAvisoFeriasDtlBnd1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpReciboAvisoFeriasSmryBnd1: TppSummaryBand
      AfterPrint = rpReciboAvisoFeriasSmryBnd1AfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
    end
    object ppGroup9: TppGroup
      BreakName = 'PAGINA'
      DataPipeline = ppReciboAvisoFerias
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group9'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppReciboAvisoFerias'
      object rpReciboAvisoFeriasGrpHdrBnd0: TppGroupHeaderBand
        BeforePrint = rpReciboAvisoFeriasGrpHdrBnd0BeforePrint
        mmBottomOffset = 0
        mmHeight = 278078
        mmPrintPosition = 0
        object rpRPFeriasShape12: TppShape
          UserName = 'Shape1'
          mmHeight = 25665
          mmLeft = 0
          mmTop = 2910
          mmWidth = 192088
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText2: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'CGC'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3440
          mmLeft = 64823
          mmTop = 10319
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText1: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'EMPRESA'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3440
          mmLeft = 84931
          mmTop = 5556
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText3: TppDBText
          UserName = 'DBText3'
          AutoSize = True
          DataField = 'INSCRICAO'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3440
          mmLeft = 107950
          mmTop = 10319
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText4: TppDBText
          UserName = 'DBText4'
          AutoSize = True
          DataField = 'ENDERECO'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3440
          mmLeft = 83608
          mmTop = 17727
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasLabel2: TppLabel
          UserName = 'Label1'
          Caption = 'Emissão:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 150019
          mmTop = 24077
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object rpFolhaNormalCalc1: TppCalc
          UserName = 'Calc1'
          CalcType = ctDateTime
          CustomType = dtDateTime
          DisplayFormat = 'DD/MM/YYYY HH:MM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 162454
          mmTop = 24077
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object rpRPFeriasLabel6: TppLabel
          UserName = 'Label2'
          Caption = 'AVISO DE FÉRIAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 73025
          mmTop = 34131
          mmWidth = 36777
          BandType = 3
          GroupNo = 0
        end
        object rpRPFeriasShape5: TppShape
          UserName = 'Shape2'
          mmHeight = 11377
          mmLeft = 0
          mmTop = 53975
          mmWidth = 192000
          BandType = 3
          GroupNo = 0
        end
        object rpRPFeriasMemo1: TppMemo
          UserName = 'Memo1'
          Caption = '7'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            ''
            
              ' A empresa comunica de acordo com os Artigos 129 e 130, a conces' +
              'sao das férias ao funcionário discriminado abaixo:')
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 12965
          mmLeft = 0
          mmTop = 41275
          mmWidth = 192000
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpRPFeriasMemo3: TppMemo
          UserName = 'Memo2'
          Caption = 
            #13#10'Fica estabelecido que as férias serão concedidas de acordo com' +
            ' a tabela abaixo, em comparação ao período a que se refere'#13#10
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Lines.Strings = (
            ''
            
              'Fica estabelecido que as férias serão concedidas de acordo com a' +
              ' tabela abaixo, em comparação ao período a que se refere')
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 7673
          mmLeft = 0
          mmTop = 66940
          mmWidth = 192000
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpRPFeriasMemo4: TppMemo
          UserName = 'Memo3'
          Caption = 
            'DIAS DE DURACAO'#13#10'            30 (trinta)'#13#10'            24 (vinte ' +
            'e quatro)'#13#10'            18 (dezoito)'#13#10'            12 (doze)'#13#10'    ' +
            '        00 (zero)'#13#10
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            'DIAS DE DURACAO'
            '            30 (trinta)'
            '            24 (vinte e quatro)'
            '            18 (dezoito)'
            '            12 (doze)'
            '            00 (zero)')
          Transparent = True
          mmHeight = 26194
          mmLeft = 112713
          mmTop = 77258
          mmWidth = 37042
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpReciboAvisoFeriasLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Cód:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 55298
          mmWidth = 5821
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText5: TppDBText
          UserName = 'DBText5'
          AutoSize = True
          DataField = 'MATRICULA'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3440
          mmLeft = 8996
          mmTop = 55298
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Nome:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 99484
          mmTop = 55298
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText6: TppDBText
          UserName = 'DBText6'
          AutoSize = True
          DataField = 'EMPREGADO'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3440
          mmLeft = 108479
          mmTop = 55298
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Cargo/Função:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3260
          mmLeft = 2117
          mmTop = 60061
          mmWidth = 18711
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText7: TppDBText
          UserName = 'DBText7'
          AutoSize = True
          DataField = 'CARGO'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3440
          mmLeft = 21696
          mmTop = 60061
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Centro de Custo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 85990
          mmTop = 60061
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText8: TppDBText
          UserName = 'DBText8'
          AutoSize = True
          DataField = 'C_CUSTO'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3440
          mmLeft = 108479
          mmTop = 60061
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object rpRPFeriasMemo7: TppMemo
          UserName = 'Memo4'
          Caption = 
            '(até 15 (quinze) dias antes do início das férias) '#13#10'O empregado ' +
            'acima solicita a concessão do abono pecuniário 1/3 (um terço) do' +
            ' valor das férias'#13#10
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Lines.Strings = (
            '(até 15 (quinze) dias antes do início das férias) '
            
              'O empregado acima solicita a concessão do abono pecuniário 1/3 (' +
              'um terço) do valor das férias')
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 6615
          mmLeft = 40481
          mmTop = 130704
          mmWidth = 116946
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpNotificFeriasLabel1: TppLabel
          UserName = 'Label7'
          Caption = 'RECIBO DE PAGAMENTO DE FÉRIAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 56886
          mmTop = 140494
          mmWidth = 75936
          BandType = 3
          GroupNo = 0
        end
        object rpRPFeriasShape1: TppShape
          UserName = 'Shape3'
          mmHeight = 71702
          mmLeft = 11113
          mmTop = 147373
          mmWidth = 89165
          BandType = 3
          GroupNo = 0
        end
        object rpRPFeriasShape2: TppShape
          UserName = 'Shape4'
          StretchWithParent = True
          mmHeight = 71702
          mmLeft = 100013
          mmTop = 147373
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object rpRPFeriasLabel1: TppLabel
          UserName = 'Label8'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 40481
          mmTop = 147902
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object rpRPFeriasLabel2: TppLabel
          UserName = 'Label9'
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 12435
          mmTop = 147902
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object rpRPFeriasLabel3: TppLabel
          UserName = 'Label10'
          Caption = 'Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 101336
          mmTop = 147902
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpRPFeriasShape9: TppShape
          UserName = 'Shape5'
          mmHeight = 71702
          mmLeft = 115094
          mmTop = 147373
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object rpRPFeriasLabel4: TppLabel
          UserName = 'Label11'
          Caption = 'Vencimentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 124090
          mmTop = 147902
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object rpRPFeriasShape10: TppShape
          UserName = 'Shape6'
          ShiftWithParent = True
          mmHeight = 71702
          mmLeft = 149225
          mmTop = 147373
          mmWidth = 36248
          BandType = 3
          GroupNo = 0
        end
        object rpRPFeriasLabel5: TppLabel
          UserName = 'Label12'
          Caption = 'Descontos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 159809
          mmTop = 147902
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasShape1: TppShape
          UserName = 'Shape7'
          mmHeight = 12435
          mmLeft = 11113
          mmTop = 219869
          mmWidth = 103981
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasShape2: TppShape
          UserName = 'Shape8'
          mmHeight = 7673
          mmLeft = 114829
          mmTop = 219869
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasLabel84: TppLabel
          UserName = 'Label13'
          Caption = 'Total de Vencimentos: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 118269
          mmTop = 220663
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasLabel86: TppLabel
          UserName = 'Label14'
          Caption = 'Total Líquido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 123031
          mmTop = 227807
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasShape3: TppShape
          UserName = 'Shape9'
          mmHeight = 5027
          mmLeft = 114829
          mmTop = 227278
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasShape4: TppShape
          UserName = 'Shape10'
          mmHeight = 7673
          mmLeft = 148961
          mmTop = 219869
          mmWidth = 36513
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasLabel87: TppLabel
          UserName = 'Label15'
          Caption = 'Total de Descontos: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 155575
          mmTop = 220663
          mmWidth = 24606
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasLabel89: TppLabel
          UserName = 'Label16'
          AutoSize = False
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 150813
          mmTop = 227807
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasShape5: TppShape
          UserName = 'Shape11'
          mmHeight = 5027
          mmLeft = 148961
          mmTop = 227278
          mmWidth = 36513
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasLabel100: TppLabel
          UserName = 'Label17'
          Caption = 'Total Líquido:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 121444
          mmTop = 227807
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
        object rpRPFeriasMemo10: TppMemo
          UserName = 'Memo5'
          Caption = 
            #13#10'    Pelo presente instrumento, estou informado sobre minhas fé' +
            'rias e recebi o valor líquido acima:'#13#10#13#10#13#10'    Data ____ /____ /_' +
            '_______'#13#10#13#10#13#10'    _________________________________________      ' +
            '                           _____________________________________' +
            '_______________________'#13#10'                      Assinatura do Emp' +
            'regado                                                          ' +
            '                        Carimbo e Assinatura do Empregador'#13#10#13#10#13#10 +
            #13#10#13#10
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Lines.Strings = (
            ''
            
              '    Pelo presente instrumento, estou informado sobre minhas féri' +
              'as e recebi o valor líquido acima:'
            ''
            ''
            '    Data ____ /____ /________'
            ''
            ''
            
              '    _________________________________________                   ' +
              '              __________________________________________________' +
              '__________'
            
              '                      Assinatura do Empregado                   ' +
              '                                                               C' +
              'arimbo e Assinatura do Empregador'
            ''
            ''
            ''
            '')
          Transparent = True
          mmHeight = 34660
          mmLeft = 2646
          mmTop = 242623
          mmWidth = 192088
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpReciboAvisoFeriasLabel1: TppLabel
          UserName = 'Label18'
          Caption = 'CTPS:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 35454
          mmTop = 55298
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBTextCTPS: TppDBText
          UserName = 'DBText9'
          DataField = 'CTPS_NUM'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 44186
          mmTop = 55298
          mmWidth = 28310
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText15: TppDBText
          UserName = 'DBText10'
          AutoSize = True
          DataField = 'CTPS_UF'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3440
          mmLeft = 73290
          mmTop = 55298
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasMemo1: TppMemo
          UserName = 'Memo6'
          Caption = 
            'DIAS DE FALTAS INJUSTIFICADAS'#13#10'    00 (zero)'#13#10'    06 (seis)'#13#10'   ' +
            ' 15 (quinze)'#13#10'    24 (vinte e quatro)'#13#10'    mais de 32 (trinta e ' +
            'dois)'#13#10
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            'DIAS DE FALTAS INJUSTIFICADAS'
            '    00 (zero)'
            '    06 (seis)'
            '    15 (quinze)'
            '    24 (vinte e quatro)'
            '    mais de 32 (trinta e dois)')
          Transparent = True
          mmHeight = 26194
          mmLeft = 47096
          mmTop = 77258
          mmWidth = 46567
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpReciboAvisoFeriasLabel90: TppLabel
          UserName = 'Label19'
          Caption = 'Salário Base'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 14023
          mmTop = 224632
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasLabel92: TppLabel
          UserName = 'Label20'
          Caption = 'Base INSS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 34925
          mmTop = 224632
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasLabel94: TppLabel
          UserName = 'Label21'
          Caption = 'Base FGTS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 53181
          mmTop = 224632
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasLabel96: TppLabel
          UserName = 'Label22'
          Caption = 'FGTS do Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 73025
          mmTop = 224632
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasLabel98: TppLabel
          UserName = 'Label23'
          Caption = 'Base do IRRF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 95515
          mmTop = 224632
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText14: TppDBText
          UserName = 'DBText11'
          DataField = 'FOLHA'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 3704
          mmTop = 24077
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText16: TppDBText
          UserName = 'DBText12'
          DataField = 'CODRUBRICA1'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 151342
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText17: TppDBText
          UserName = 'DBText13'
          DataField = 'CODRUBRICA2'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 155840
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText18: TppDBText
          UserName = 'DBText14'
          DataField = 'CODRUBRICA3'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 160338
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText19: TppDBText
          UserName = 'DBText15'
          DataField = 'CODRUBRICA4'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 164836
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText20: TppDBText
          UserName = 'DBText16'
          DataField = 'CODRUBRICA5'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 169334
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText21: TppDBText
          UserName = 'DBText17'
          DataField = 'CODRUBRICA6'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 173832
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText22: TppDBText
          UserName = 'DBText18'
          DataField = 'CODRUBRICA7'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 178330
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText23: TppDBText
          UserName = 'DBText19'
          DataField = 'CODRUBRICA8'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 182827
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText24: TppDBText
          UserName = 'DBText20'
          DataField = 'CODRUBRICA9'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 187325
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText25: TppDBText
          UserName = 'DBText21'
          DataField = 'CODRUBRICA10'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 191823
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText26: TppDBText
          UserName = 'DBText22'
          DataField = 'CODRUBRICA11'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 196321
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText27: TppDBText
          UserName = 'DBText23'
          DataField = 'CODRUBRICA12'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 200819
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText28: TppDBText
          UserName = 'DBText24'
          DataField = 'CODRUBRICA13'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 205317
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText29: TppDBText
          UserName = 'DBText25'
          DataField = 'CODRUBRICA14'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 209815
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText30: TppDBText
          UserName = 'DBText26'
          DataField = 'CODRUBRICA15'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 214313
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText31: TppDBText
          UserName = 'DBText27'
          DataField = 'RUBRICA1'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 28310
          mmTop = 151342
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText32: TppDBText
          UserName = 'DBText28'
          DataField = 'RUBRICA2'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 28310
          mmTop = 155840
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText33: TppDBText
          UserName = 'DBText29'
          DataField = 'RUBRICA3'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 28310
          mmTop = 160338
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText34: TppDBText
          UserName = 'DBText30'
          DataField = 'RUBRICA4'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 28310
          mmTop = 164836
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText35: TppDBText
          UserName = 'DBText31'
          DataField = 'RUBRICA5'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 28310
          mmTop = 169334
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText36: TppDBText
          UserName = 'DBText32'
          DataField = 'RUBRICA6'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 28310
          mmTop = 173832
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText37: TppDBText
          UserName = 'DBText33'
          DataField = 'RUBRICA7'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 28310
          mmTop = 178330
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText38: TppDBText
          UserName = 'DBText34'
          DataField = 'RUBRICA8'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 28310
          mmTop = 182827
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText39: TppDBText
          UserName = 'DBText35'
          DataField = 'RUBRICA9'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 28310
          mmTop = 187325
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText40: TppDBText
          UserName = 'DBText36'
          DataField = 'RUBRICA10'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 28310
          mmTop = 191823
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText41: TppDBText
          UserName = 'DBText37'
          DataField = 'RUBRICA11'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 28310
          mmTop = 196321
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText42: TppDBText
          UserName = 'DBText38'
          DataField = 'RUBRICA12'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 28310
          mmTop = 200819
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText43: TppDBText
          UserName = 'DBText39'
          DataField = 'RUBRICA13'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 28310
          mmTop = 205317
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText44: TppDBText
          UserName = 'DBText40'
          DataField = 'RUBRICA14'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 28310
          mmTop = 209815
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText45: TppDBText
          UserName = 'DBText41'
          DataField = 'RUBRICA15'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 28310
          mmTop = 214313
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText46: TppDBText
          UserName = 'DBText42'
          DataField = 'REFERENCIA1'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 101336
          mmTop = 151342
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText47: TppDBText
          UserName = 'DBText43'
          DataField = 'REFERENCIA2'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 101336
          mmTop = 155840
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText48: TppDBText
          UserName = 'DBText44'
          DataField = 'REFERENCIA3'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 101336
          mmTop = 160338
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText49: TppDBText
          UserName = 'DBText45'
          DataField = 'REFERENCIA4'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 101336
          mmTop = 164836
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText50: TppDBText
          UserName = 'DBText46'
          DataField = 'REFERENCIA5'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 101336
          mmTop = 169334
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText51: TppDBText
          UserName = 'DBText47'
          DataField = 'REFERENCIA6'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 101336
          mmTop = 173832
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText52: TppDBText
          UserName = 'DBText48'
          DataField = 'REFERENCIA7'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 101336
          mmTop = 178330
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText53: TppDBText
          UserName = 'DBText49'
          DataField = 'REFERENCIA8'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 101336
          mmTop = 182827
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText54: TppDBText
          UserName = 'DBText50'
          DataField = 'REFERENCIA9'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 101336
          mmTop = 187325
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText55: TppDBText
          UserName = 'DBText51'
          DataField = 'REFERENCIA10'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 101336
          mmTop = 191823
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText56: TppDBText
          UserName = 'DBText52'
          DataField = 'REFERENCIA11'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 101336
          mmTop = 196321
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText57: TppDBText
          UserName = 'DBText53'
          DataField = 'REFERENCIA12'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 101336
          mmTop = 200819
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText58: TppDBText
          UserName = 'DBText54'
          DataField = 'REFERENCIA13'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 101336
          mmTop = 205317
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText59: TppDBText
          UserName = 'DBText55'
          DataField = 'REFERENCIA14'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 101336
          mmTop = 209815
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText60: TppDBText
          UserName = 'DBText56'
          DataField = 'REFERENCIA15'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 101336
          mmTop = 214313
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText61: TppDBText
          UserName = 'DBText57'
          BlankWhenZero = True
          DataField = 'PROVENTO1'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 116681
          mmTop = 151342
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText62: TppDBText
          UserName = 'DBText58'
          BlankWhenZero = True
          DataField = 'PROVENTO2'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 116681
          mmTop = 155840
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText63: TppDBText
          UserName = 'DBText59'
          BlankWhenZero = True
          DataField = 'PROVENTO3'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 116681
          mmTop = 160338
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText64: TppDBText
          UserName = 'DBText60'
          BlankWhenZero = True
          DataField = 'PROVENTO4'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 116681
          mmTop = 164836
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText65: TppDBText
          UserName = 'DBText61'
          BlankWhenZero = True
          DataField = 'PROVENTO5'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 116681
          mmTop = 169334
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText66: TppDBText
          UserName = 'DBText62'
          BlankWhenZero = True
          DataField = 'PROVENTO6'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 116681
          mmTop = 173832
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText67: TppDBText
          UserName = 'DBText63'
          BlankWhenZero = True
          DataField = 'PROVENTO7'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 116681
          mmTop = 178330
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText68: TppDBText
          UserName = 'DBText64'
          BlankWhenZero = True
          DataField = 'PROVENTO8'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 116681
          mmTop = 182827
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText69: TppDBText
          UserName = 'DBText65'
          BlankWhenZero = True
          DataField = 'PROVENTO9'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 116681
          mmTop = 187325
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText70: TppDBText
          UserName = 'DBText66'
          BlankWhenZero = True
          DataField = 'PROVENTO10'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 116681
          mmTop = 191823
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText71: TppDBText
          UserName = 'DBText67'
          BlankWhenZero = True
          DataField = 'PROVENTO11'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 116681
          mmTop = 196321
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText72: TppDBText
          UserName = 'DBText68'
          BlankWhenZero = True
          DataField = 'PROVENTO12'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 116681
          mmTop = 200819
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText73: TppDBText
          UserName = 'DBText69'
          BlankWhenZero = True
          DataField = 'PROVENTO13'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 116681
          mmTop = 205317
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText74: TppDBText
          UserName = 'DBText70'
          BlankWhenZero = True
          DataField = 'PROVENTO14'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 116681
          mmTop = 209815
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText75: TppDBText
          UserName = 'DBText71'
          BlankWhenZero = True
          DataField = 'PROVENTO15'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 116681
          mmTop = 214313
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText76: TppDBText
          UserName = 'DBText72'
          BlankWhenZero = True
          DataField = 'DESCONTO1'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 150813
          mmTop = 151342
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText77: TppDBText
          UserName = 'DBText73'
          BlankWhenZero = True
          DataField = 'DESCONTO2'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 150813
          mmTop = 155840
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText78: TppDBText
          UserName = 'DBText74'
          BlankWhenZero = True
          DataField = 'DESCONTO3'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 150813
          mmTop = 160338
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText79: TppDBText
          UserName = 'DBText75'
          BlankWhenZero = True
          DataField = 'DESCONTO4'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 150813
          mmTop = 164836
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText80: TppDBText
          UserName = 'DBText76'
          BlankWhenZero = True
          DataField = 'DESCONTO5'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 150813
          mmTop = 169334
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText81: TppDBText
          UserName = 'DBText77'
          BlankWhenZero = True
          DataField = 'DESCONTO6'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 150813
          mmTop = 173832
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText82: TppDBText
          UserName = 'DBText78'
          BlankWhenZero = True
          DataField = 'DESCONTO7'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 150813
          mmTop = 178330
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText83: TppDBText
          UserName = 'DBText79'
          BlankWhenZero = True
          DataField = 'DESCONTO8'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 150813
          mmTop = 182827
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText84: TppDBText
          UserName = 'DBText80'
          BlankWhenZero = True
          DataField = 'DESCONTO9'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 150813
          mmTop = 187325
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText85: TppDBText
          UserName = 'DBText81'
          BlankWhenZero = True
          DataField = 'DESCONTO10'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 150813
          mmTop = 191823
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText86: TppDBText
          UserName = 'DBText82'
          BlankWhenZero = True
          DataField = 'DESCONTO11'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 150813
          mmTop = 196321
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText87: TppDBText
          UserName = 'DBText83'
          BlankWhenZero = True
          DataField = 'DESCONTO12'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 150813
          mmTop = 200819
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText88: TppDBText
          UserName = 'DBText84'
          BlankWhenZero = True
          DataField = 'DESCONTO13'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 150813
          mmTop = 205317
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText89: TppDBText
          UserName = 'DBText85'
          BlankWhenZero = True
          DataField = 'DESCONTO14'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 150813
          mmTop = 209815
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText90: TppDBText
          UserName = 'DBText86'
          BlankWhenZero = True
          DataField = 'DESCONTO15'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 150813
          mmTop = 214313
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText91: TppDBText
          UserName = 'DBText87'
          DataField = 'SALBASE'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 14023
          mmTop = 227807
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText92: TppDBText
          UserName = 'DBText88'
          DataField = 'BASEINSS'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 34925
          mmTop = 227807
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText93: TppDBText
          UserName = 'DBText89'
          DataField = 'BASEFGTS'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 53181
          mmTop = 227807
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText94: TppDBText
          UserName = 'DBText90'
          DataField = 'FGTSMES'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 73025
          mmTop = 227807
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText95: TppDBText
          UserName = 'DBText91'
          DataField = 'BASEIRRF'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 95515
          mmTop = 227807
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText96: TppDBText
          UserName = 'DBText92'
          DataField = 'TOT_PROVENTOS'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 115623
          mmTop = 223309
          mmWidth = 32808
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText97: TppDBText
          UserName = 'DBText93'
          DataField = 'TOT_DESCONTOS'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 151607
          mmTop = 223309
          mmWidth = 32808
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText98: TppDBText
          UserName = 'DBText94'
          DataField = 'TOT_GERAL'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3704
          mmLeft = 151607
          mmTop = 227807
          mmWidth = 32808
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasDBText99: TppDBText
          UserName = 'DBText95'
          DataField = 'DESC_TOT_GERAL'
          DataPipeline = ppReciboAvisoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          WordWrap = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 7408
          mmLeft = 11113
          mmTop = 233628
          mmWidth = 174361
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasMemo2: TppMemo
          UserName = 'Memo7'
          Caption = 
            'a  05 (cinco)'#13#10'a  14 (quatorze)'#13#10'a  23 (vinte e tres)'#13#10'a  32 (tr' +
            'inta e dois)'#13#10
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            'a  05 (cinco)'
            'a  14 (quatorze)'
            'a  23 (vinte e tres)'
            'a  32 (trinta e dois)')
          Transparent = True
          mmHeight = 15346
          mmLeft = 75936
          mmTop = 80698
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpReciboAvisoFeriasDBTextMAIOR_REM: TppDBText
          UserName = 'DBText96'
          BlankWhenZero = True
          DataField = 'MAIOR_REMUNERACAO'
          DataPipeline = ppReciboAvisoFerias
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppReciboAvisoFerias'
          mmHeight = 3175
          mmLeft = 41540
          mmTop = 220663
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object rpReciboAvisoFeriasLabelMAIOR_REM: TppLabel
          UserName = 'Label24'
          AutoSize = False
          Caption = 'Maior Remuneração:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 15875
          mmTop = 220663
          mmWidth = 24606
          BandType = 3
          GroupNo = 0
        end
        object ReciboAvisoFeriasLbl11: TppLabel
          UserName = 'Label25'
          Caption = 'Período aquisitivo de DD/MM/AAAA a DD/MM/AAAA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 26723
          mmTop = 105304
          mmWidth = 66146
          BandType = 3
          GroupNo = 0
        end
        object ReciboAvisoFeriasLbl12: TppLabel
          UserName = 'Label26'
          Caption = 'Dias de Duração: 00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 26723
          mmTop = 112184
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ReciboAvisoFeriasLbl13: TppLabel
          UserName = 'Label27'
          Caption = 'Período de Gozo de DD/MM/AAAA a DD/MM/AAAA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 26723
          mmTop = 119327
          mmWidth = 65088
          BandType = 3
          GroupNo = 0
        end
        object ReciboAvisoFeriasLbl1: TppLabel
          UserName = 'Label28'
          Caption = 'SOLICITAÇÃO DE ABONO PECUNIÁRIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 72761
          mmTop = 126207
          mmWidth = 52652
          BandType = 3
          GroupNo = 0
        end
      end
      object rpReciboAvisoFeriasGrpFootBnd0: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppReciboAvisoFerias: TppBDEPipeline
    DataSource = dsReciboAvisoFerias
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ReciboAvisoFerias'
    Left = 226
    Top = 48
    object ppReciboAvisoFeriasppField1: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField2: TppField
      FieldAlias = 'FOLHA'
      FieldName = 'FOLHA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField3: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField4: TppField
      FieldAlias = 'C_CUSTO'
      FieldName = 'C_CUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField5: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField6: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField7: TppField
      FieldAlias = 'CGC'
      FieldName = 'CGC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField8: TppField
      FieldAlias = 'INSCRICAO'
      FieldName = 'INSCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField9: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField10: TppField
      FieldAlias = 'PAGINA'
      FieldName = 'PAGINA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField11: TppField
      FieldAlias = 'INIPERIODOFERIAS'
      FieldName = 'INIPERIODOFERIAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField12: TppField
      FieldAlias = 'FIMPERIODOFERIAS'
      FieldName = 'FIMPERIODOFERIAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField13: TppField
      FieldAlias = 'INIGOZOFERIAS'
      FieldName = 'INIGOZOFERIAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField14: TppField
      FieldAlias = 'FIMGOZOFERIAS'
      FieldName = 'FIMGOZOFERIAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField15: TppField
      FieldAlias = 'DIASDEFERIAS'
      FieldName = 'DIASDEFERIAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField16: TppField
      FieldAlias = 'FLGABONO'
      FieldName = 'FLGABONO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField17: TppField
      FieldAlias = 'CTPS_NUM'
      FieldName = 'CTPS_NUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField18: TppField
      FieldAlias = 'CTPS_UF'
      FieldName = 'CTPS_UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField19: TppField
      FieldAlias = 'CODRUBRICA1'
      FieldName = 'CODRUBRICA1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField20: TppField
      FieldAlias = 'RUBRICA1'
      FieldName = 'RUBRICA1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField21: TppField
      FieldAlias = 'REFERENCIA1'
      FieldName = 'REFERENCIA1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField22: TppField
      FieldAlias = 'PROVENTO1'
      FieldName = 'PROVENTO1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField23: TppField
      FieldAlias = 'DESCONTO1'
      FieldName = 'DESCONTO1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField24: TppField
      FieldAlias = 'CODRUBRICA2'
      FieldName = 'CODRUBRICA2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField25: TppField
      FieldAlias = 'RUBRICA2'
      FieldName = 'RUBRICA2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField26: TppField
      FieldAlias = 'REFERENCIA2'
      FieldName = 'REFERENCIA2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField27: TppField
      FieldAlias = 'PROVENTO2'
      FieldName = 'PROVENTO2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField28: TppField
      FieldAlias = 'DESCONTO2'
      FieldName = 'DESCONTO2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField29: TppField
      FieldAlias = 'CODRUBRICA3'
      FieldName = 'CODRUBRICA3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField30: TppField
      FieldAlias = 'RUBRICA3'
      FieldName = 'RUBRICA3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField31: TppField
      FieldAlias = 'REFERENCIA3'
      FieldName = 'REFERENCIA3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField32: TppField
      FieldAlias = 'PROVENTO3'
      FieldName = 'PROVENTO3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField33: TppField
      FieldAlias = 'DESCONTO3'
      FieldName = 'DESCONTO3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField34: TppField
      FieldAlias = 'CODRUBRICA4'
      FieldName = 'CODRUBRICA4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField35: TppField
      FieldAlias = 'RUBRICA4'
      FieldName = 'RUBRICA4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField36: TppField
      FieldAlias = 'REFERENCIA4'
      FieldName = 'REFERENCIA4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField37: TppField
      FieldAlias = 'PROVENTO4'
      FieldName = 'PROVENTO4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField38: TppField
      FieldAlias = 'DESCONTO4'
      FieldName = 'DESCONTO4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField39: TppField
      FieldAlias = 'CODRUBRICA5'
      FieldName = 'CODRUBRICA5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField40: TppField
      FieldAlias = 'RUBRICA5'
      FieldName = 'RUBRICA5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField41: TppField
      FieldAlias = 'REFERENCIA5'
      FieldName = 'REFERENCIA5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField42: TppField
      FieldAlias = 'PROVENTO5'
      FieldName = 'PROVENTO5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField43: TppField
      FieldAlias = 'DESCONTO5'
      FieldName = 'DESCONTO5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField44: TppField
      FieldAlias = 'CODRUBRICA6'
      FieldName = 'CODRUBRICA6'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField45: TppField
      FieldAlias = 'RUBRICA6'
      FieldName = 'RUBRICA6'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField46: TppField
      FieldAlias = 'REFERENCIA6'
      FieldName = 'REFERENCIA6'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField47: TppField
      FieldAlias = 'PROVENTO6'
      FieldName = 'PROVENTO6'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField48: TppField
      FieldAlias = 'DESCONTO6'
      FieldName = 'DESCONTO6'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField49: TppField
      FieldAlias = 'CODRUBRICA7'
      FieldName = 'CODRUBRICA7'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField50: TppField
      FieldAlias = 'RUBRICA7'
      FieldName = 'RUBRICA7'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField51: TppField
      FieldAlias = 'REFERENCIA7'
      FieldName = 'REFERENCIA7'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField52: TppField
      FieldAlias = 'PROVENTO7'
      FieldName = 'PROVENTO7'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField53: TppField
      FieldAlias = 'DESCONTO7'
      FieldName = 'DESCONTO7'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField54: TppField
      FieldAlias = 'CODRUBRICA8'
      FieldName = 'CODRUBRICA8'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 53
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField55: TppField
      FieldAlias = 'RUBRICA8'
      FieldName = 'RUBRICA8'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 54
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField56: TppField
      FieldAlias = 'REFERENCIA8'
      FieldName = 'REFERENCIA8'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 55
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField57: TppField
      FieldAlias = 'PROVENTO8'
      FieldName = 'PROVENTO8'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 56
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField58: TppField
      FieldAlias = 'DESCONTO8'
      FieldName = 'DESCONTO8'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 57
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField59: TppField
      FieldAlias = 'CODRUBRICA9'
      FieldName = 'CODRUBRICA9'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 58
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField60: TppField
      FieldAlias = 'RUBRICA9'
      FieldName = 'RUBRICA9'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 59
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField61: TppField
      FieldAlias = 'REFERENCIA9'
      FieldName = 'REFERENCIA9'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 60
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField62: TppField
      FieldAlias = 'PROVENTO9'
      FieldName = 'PROVENTO9'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 61
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField63: TppField
      FieldAlias = 'DESCONTO9'
      FieldName = 'DESCONTO9'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 62
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField64: TppField
      FieldAlias = 'CODRUBRICA10'
      FieldName = 'CODRUBRICA10'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 63
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField65: TppField
      FieldAlias = 'RUBRICA10'
      FieldName = 'RUBRICA10'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 64
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField66: TppField
      FieldAlias = 'REFERENCIA10'
      FieldName = 'REFERENCIA10'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 65
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField67: TppField
      FieldAlias = 'PROVENTO10'
      FieldName = 'PROVENTO10'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 66
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField68: TppField
      FieldAlias = 'DESCONTO10'
      FieldName = 'DESCONTO10'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 67
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField69: TppField
      FieldAlias = 'CODRUBRICA11'
      FieldName = 'CODRUBRICA11'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 68
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField70: TppField
      FieldAlias = 'RUBRICA11'
      FieldName = 'RUBRICA11'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 69
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField71: TppField
      FieldAlias = 'REFERENCIA11'
      FieldName = 'REFERENCIA11'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 70
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField72: TppField
      FieldAlias = 'PROVENTO11'
      FieldName = 'PROVENTO11'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 71
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField73: TppField
      FieldAlias = 'DESCONTO11'
      FieldName = 'DESCONTO11'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 72
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField74: TppField
      FieldAlias = 'CODRUBRICA12'
      FieldName = 'CODRUBRICA12'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 73
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField75: TppField
      FieldAlias = 'RUBRICA12'
      FieldName = 'RUBRICA12'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 74
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField76: TppField
      FieldAlias = 'REFERENCIA12'
      FieldName = 'REFERENCIA12'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 75
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField77: TppField
      FieldAlias = 'PROVENTO12'
      FieldName = 'PROVENTO12'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 76
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField78: TppField
      FieldAlias = 'DESCONTO12'
      FieldName = 'DESCONTO12'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 77
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField79: TppField
      FieldAlias = 'CODRUBRICA13'
      FieldName = 'CODRUBRICA13'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 78
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField80: TppField
      FieldAlias = 'RUBRICA13'
      FieldName = 'RUBRICA13'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 79
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField81: TppField
      FieldAlias = 'REFERENCIA13'
      FieldName = 'REFERENCIA13'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 80
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField82: TppField
      FieldAlias = 'PROVENTO13'
      FieldName = 'PROVENTO13'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 81
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField83: TppField
      FieldAlias = 'DESCONTO13'
      FieldName = 'DESCONTO13'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 82
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField84: TppField
      FieldAlias = 'CODRUBRICA14'
      FieldName = 'CODRUBRICA14'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 83
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField85: TppField
      FieldAlias = 'RUBRICA14'
      FieldName = 'RUBRICA14'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 84
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField86: TppField
      FieldAlias = 'REFERENCIA14'
      FieldName = 'REFERENCIA14'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 85
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField87: TppField
      FieldAlias = 'PROVENTO14'
      FieldName = 'PROVENTO14'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 86
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField88: TppField
      FieldAlias = 'DESCONTO14'
      FieldName = 'DESCONTO14'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 87
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField89: TppField
      FieldAlias = 'CODRUBRICA15'
      FieldName = 'CODRUBRICA15'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 88
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField90: TppField
      FieldAlias = 'RUBRICA15'
      FieldName = 'RUBRICA15'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 89
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField91: TppField
      FieldAlias = 'REFERENCIA15'
      FieldName = 'REFERENCIA15'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 90
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField92: TppField
      FieldAlias = 'PROVENTO15'
      FieldName = 'PROVENTO15'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 91
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField93: TppField
      FieldAlias = 'DESCONTO15'
      FieldName = 'DESCONTO15'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 92
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField94: TppField
      FieldAlias = 'MAIOR_REMUNERACAO'
      FieldName = 'MAIOR_REMUNERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 93
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField95: TppField
      FieldAlias = 'SALBASE'
      FieldName = 'SALBASE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 94
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField96: TppField
      FieldAlias = 'BASEINSS'
      FieldName = 'BASEINSS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 95
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField97: TppField
      FieldAlias = 'BASEFGTS'
      FieldName = 'BASEFGTS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 96
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField98: TppField
      FieldAlias = 'FGTSMES'
      FieldName = 'FGTSMES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 97
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField99: TppField
      FieldAlias = 'BASEIRRF'
      FieldName = 'BASEIRRF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 98
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField100: TppField
      FieldAlias = 'TOT_PROVENTOS'
      FieldName = 'TOT_PROVENTOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 99
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField101: TppField
      FieldAlias = 'TOT_DESCONTOS'
      FieldName = 'TOT_DESCONTOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 100
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField102: TppField
      FieldAlias = 'TOT_GERAL'
      FieldName = 'TOT_GERAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 101
      Searchable = False
      Sortable = False
    end
    object ppReciboAvisoFeriasppField103: TppField
      FieldAlias = 'DESC_TOT_GERAL'
      FieldName = 'DESC_TOT_GERAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 102
      Searchable = False
      Sortable = False
    end
  end
  object dsReciboAvisoFerias: TwwDataSource
    DataSet = CdsReciboAvisoFerias
    Left = 226
    Top = 96
  end
  object sqlReciboAvisoFerias: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPREGADO,'
      '  '#39'12345678901234567'#39' AS FOLHA,'
      '  '#39'1234567890123'#39' AS MATRICULA,'
      '  '#39'123456789012345678901234567890'#39' AS C_CUSTO,'
      
        '  '#39'12345678901234567890123456789012345678901234567890/1234567890' +
        '1234567890123456789012345678901234567890'#39' AS CARGO,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA,'
      '  '#39'1234567890123456789012345'#39' AS CGC,'
      '  '#39'1234567890123456789012345'#39' AS INSCRICAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '2345678901234567890'#39' AS ENDERECO,'
      '  0 AS PAGINA,'
      '  '#39'1234567890'#39' AS INIPERIODOFERIAS,'
      '  '#39'1234567890'#39' AS FIMPERIODOFERIAS,'
      '  '#39'1234567890'#39' AS INIGOZOFERIAS,'
      '  '#39'1234567890'#39' AS FIMGOZOFERIAS,'
      '  '#39'1234567890'#39' AS DIASDEFERIAS,'
      '  0 AS FLGABONO,'
      '  '#39'12345678901234567890'#39' AS CTPS_NUM,'
      '  '#39'1234'#39' AS CTPS_UF,'
      '  /* 1º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA1,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA1,'
      '  '#39'1234567890'#39' AS REFERENCIA1,'
      '  0 AS PROVENTO1,'
      '  0 AS DESCONTO1,'
      '  /* 2º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA2,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA2,'
      '  '#39'1234567890'#39' AS REFERENCIA2,'
      '  0 AS PROVENTO2,'
      '  0 AS DESCONTO2,'
      '  /* 3º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA3,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA3,'
      '  '#39'1234567890'#39' AS REFERENCIA3,'
      '  0 AS PROVENTO3,'
      '  0 AS DESCONTO3,'
      '  /* 4º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA4,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA4,'
      '  '#39'1234567890'#39' AS REFERENCIA4,'
      '  0 AS PROVENTO4,'
      '  0 AS DESCONTO4,'
      '  /* 5º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA5,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA5,'
      '  '#39'1234567890'#39' AS REFERENCIA5,'
      '  0 AS PROVENTO5,'
      '  0 AS DESCONTO5,'
      '  /* 6º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA6,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA6,'
      '  '#39'1234567890'#39' AS REFERENCIA6,'
      '  0 AS PROVENTO6,'
      '  0 AS DESCONTO6,'
      '  /* 7º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA7,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA7,'
      '  '#39'1234567890'#39' AS REFERENCIA7,'
      '  0 AS PROVENTO7,'
      '  0 AS DESCONTO7,'
      '  /* 8º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA8,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA8,'
      '  '#39'1234567890'#39' AS REFERENCIA8,'
      '  0 AS PROVENTO8,'
      '  0 AS DESCONTO8,'
      '  /* 9º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA9,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA9,'
      '  '#39'1234567890'#39' AS REFERENCIA9,'
      '  0 AS PROVENTO9,'
      '  0 AS DESCONTO9,'
      '  /* 10º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA10,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA10,'
      '  '#39'1234567890'#39' AS REFERENCIA10,'
      '  0 AS PROVENTO10,'
      '  0 AS DESCONTO10,'
      '  /* 11º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA11,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA11,'
      '  '#39'1234567890'#39' AS REFERENCIA11,'
      '  0 AS PROVENTO11,'
      '  0 AS DESCONTO11,'
      '  /* 12º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA12,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA12,'
      '  '#39'1234567890'#39' AS REFERENCIA12,'
      '  0 AS PROVENTO12,'
      '  0 AS DESCONTO12,'
      '  /* 13º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA13,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA13,'
      '  '#39'1234567890'#39' AS REFERENCIA13,'
      '  0 AS PROVENTO13,'
      '  0 AS DESCONTO13,'
      '  /* 14º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA14,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA14,'
      '  '#39'1234567890'#39' AS REFERENCIA14,'
      '  0 AS PROVENTO14,'
      '  0 AS DESCONTO14,'
      '  /* 15º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA15,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA15,'
      '  '#39'1234567890'#39' AS REFERENCIA15,'
      '  0 AS PROVENTO15,'
      '  0 AS DESCONTO15,'
      '  /* OUTROS DADOS */'
      '  0 AS MAIOR_REMUNERACAO,'
      '  0 AS SALBASE,'
      '  0 AS BASEINSS,'
      '  0 AS BASEFGTS,'
      '  0 AS FGTSMES,'
      '  0 AS BASEIRRF,'
      '  0 AS TOT_PROVENTOS,'
      '  0 AS TOT_DESCONTOS,'
      '  '#39'12345678901234567890'#39' AS TOT_GERAL,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' ||'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' ||'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS DESC_TOT_GERAL'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsReciboAvisoFerias
    Left = 226
    Top = 190
  end
  object CdsReciboAvisoFerias: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'EMPREGADO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'FOLHA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 17
      end
      item
        Name = 'MATRICULA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 13
      end
      item
        Name = 'C_CUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CARGO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'EMPRESA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CGC'
        Attributes = [faFixed]
        DataType = ftString
        Size = 25
      end
      item
        Name = 'INSCRICAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 25
      end
      item
        Name = 'ENDERECO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 80
      end
      item
        Name = 'PAGINA'
        DataType = ftFloat
      end
      item
        Name = 'INIPERIODOFERIAS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'FIMPERIODOFERIAS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'INIGOZOFERIAS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'FIMGOZOFERIAS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DIASDEFERIAS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'FLGABONO'
        DataType = ftFloat
      end
      item
        Name = 'CTPS_NUM'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CTPS_UF'
        Attributes = [faFixed]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CODRUBRICA1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO1'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO1'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO3'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO3'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO4'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO4'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO5'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO5'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA6'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA6'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA6'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO6'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO6'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA7'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA7'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA7'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO7'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO7'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA8'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA8'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA8'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO8'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO8'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA9'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA9'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA9'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO9'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO9'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA10'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA10'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA10'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO10'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO10'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA11'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA11'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA11'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO11'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO11'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA12'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA12'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA12'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO12'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO12'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA13'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA13'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA13'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO13'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO13'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA14'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA14'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA14'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO14'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO14'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA15'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA15'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA15'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO15'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO15'
        DataType = ftFloat
      end
      item
        Name = 'MAIOR_REMUNERACAO'
        DataType = ftFloat
      end
      item
        Name = 'SALBASE'
        DataType = ftFloat
      end
      item
        Name = 'BASEINSS'
        DataType = ftFloat
      end
      item
        Name = 'BASEFGTS'
        DataType = ftFloat
      end
      item
        Name = 'FGTSMES'
        DataType = ftFloat
      end
      item
        Name = 'BASEIRRF'
        DataType = ftFloat
      end
      item
        Name = 'TOT_PROVENTOS'
        DataType = ftFloat
      end
      item
        Name = 'TOT_DESCONTOS'
        DataType = ftFloat
      end
      item
        Name = 'TOT_GERAL'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DESC_TOT_GERAL'
        Attributes = [faFixed]
        DataType = ftString
        Size = 180
      end>
    IndexDefs = <
      item
        Name = 'CdsReciboAvisoFeriasIndex'
        Fields = 'PAGINA'
      end>
    Params = <>
    StoreDefs = True
    AfterScroll = CdsReciboAvisoFeriasAfterScroll
    Left = 226
    Top = 144
  end
  object ExtensoCM: TExtensoCM
    DescricaoMoeda.Singular = 'Real'
    DescricaoMoeda.Plural = 'Reais'
    TamanhoLinha = 0
    Idioma = iePortugues
    CompletaExtenso = False
    Left = 67
    Top = 136
  end
end
